package santodan.patches

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.loadPatchesFromJar
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import java.io.File
import java.util.zip.ZipFile
import kotlinx.coroutines.runBlocking
import app.morphe.patcher.dex.SdkDexVerifier
import java.lang.reflect.InvocationTargetException

/** Verify packaged standalone and combined patches against the original beta8 APK. */
fun main(args: Array<String>) = runBlocking {
    NuvioLayout.use("1.1.0-beta.8")
    val originals = mutableMapOf<String, ClassDef>()
    val libraryTypes = setOf("Lba/e1;", "Lq9/i;", "Lq9/j;", "Lba/lc;", "Lca/h3;", "Lu9/g6;",
        "Lba/q8;", "Lca/f7;", "Lu9/b3;")
    val localStores = setOf("Lcom/nuvio/tv/data/local/vb;", "Lcom/nuvio/tv/data/local/mc;")
    val pickerCallers = mutableListOf<String>()
    val originalDex = File(args[2], "original-dex").apply { mkdirs() }
    ZipFile(args[0]).use { zip ->
        for (entry in zip.entries().asSequence().filter { it.name.matches(Regex("classes\\d*\\.dex")) }) {
            zip.getInputStream(entry).use { input -> File(originalDex, entry.name).outputStream().use { input.copyTo(it) } }
            zip.getInputStream(entry).buffered().use { input ->
                for (owner in DexBackedDexFile.fromInputStream(null, input).classes) {
                    if (owner.type in libraryTypes || owner.type in localStores || owner.type in setOf("Lab/fh;", "Lab/qm;", "Lab/mc;")) originals[owner.type] = owner
                    for (method in owner.methods) for (instruction in method.implementation?.instructions ?: emptyList()) {
                        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: continue
                        if (ref.toString() == "Lab/fh;->E(Lab/mc;Lcom/nuvio/tv/domain/model/Video;Z)V")
                            pickerCallers += "${owner.type}->${method.name}"
                    }
                }
            }
        }
    }
    check(pickerCallers.size == 3 && pickerCallers.all { it == "Lab/xg;->invokeSuspend" })
    val original = originals.getValue("Lab/fh;")
    check(originals.getValue("Lab/qm;").fields.single { it.name == "Y" }.type == "Lab/mc;")
    check(originals.getValue("Lab/mc;").fields.single { it.name == "T" }.type == "Ljava/lang/String;")
    check(original.methods.single { it.name == "q" }.implementation!!.instructions.any {
        (it as? ReferenceInstruction)?.reference?.toString() == "Lab/mc;->T:Ljava/lang/String;"
    })
    fun rejected(owner: MutableClass) {
        var failed = false
        try { NuvioStreamPreloadPatch.hookNextEpisodeRoutesBeta7(owner) }
        catch (expected: IllegalStateException) { failed = true }
        check(failed) { "Invalid or already patched next-episode routes accepted" }
    }
    val missing = MutableClass(original)
    missing.methods.removeAll { it.name == "x" }
    rejected(missing)
    val changed = MutableClass(original)
    changed.methods.single { it.name == "x" }.implementation!!.replaceInstruction(0, BuilderInstruction10x(Opcode.NOP))
    rejected(changed)
    check(changed.methods.single { it.name == "E" }.implementation!!.instructions.first().opcode != Opcode.INVOKE_STATIC_RANGE)
    val ambiguous = MutableClass(original)
    val picker = original.methods.single { it.name == "E" }
    ambiguous.methods.add(MutableMethod(ImmutableMethod(original.type, "E",
        listOf(ImmutableMethodParameter("Ljava/lang/Object;", emptySet(), null)) + picker.parameters.drop(1),
        picker.returnType, picker.accessFlags, picker.annotations, picker.hiddenApiRestrictions, picker.implementation)))
    rejected(ambiguous)
    val installed = MutableClass(original)
    NuvioStreamPreloadPatch.hookNextEpisodeRoutesBeta7(installed)
    rejected(installed)
    println("PASS: beta8 picker callers are exclusively next-episode transitions; missing, changed, ambiguous and duplicate route hooks rejected")
    val available = loadPatchesFromJar(setOf(File(args[1])))
    val frameworkLoader = java.net.URLClassLoader(arrayOf(File(args[3], "platforms/android-36/android.jar").toURI().toURL()), ClassLoader.getSystemClassLoader().parent)
    fun descriptor(type: Class<*>): String = when {
        type.isArray -> type.name.replace('.', '/')
        !type.isPrimitive -> "L${type.name.replace('.', '/')};"
        else -> mapOf("void" to "V", "boolean" to "Z", "byte" to "B", "char" to "C", "short" to "S", "int" to "I", "long" to "J", "float" to "F", "double" to "D").getValue(type.name)
    }
    // java.lang.Enum cannot be loaded from android.jar by a JVM ClassLoader (bootstrap wins).
    // Read its SDK definitions rather than hiding inherited enum calls or trusting the host JDK API.
    val bootMethods = mutableMapOf<String, Set<String>>()
    fun sdkMethods(type: String): Set<String> = bootMethods.getOrPut(type) {
        ZipFile(File(args[3], "platforms/android-36/android.jar")).use { sdk ->
            val entry = sdk.getEntry(type.substring(1, type.length - 1) + ".class") ?: return@getOrPut emptySet()
            java.io.DataInputStream(sdk.getInputStream(entry).buffered()).use { data ->
                check(data.readInt() == 0xcafebabe.toInt())
                data.readUnsignedShort(); data.readUnsignedShort()
                val strings = arrayOfNulls<String>(data.readUnsignedShort())
                var index = 1
                while (index < strings.size) {
                    when (val tag = data.readUnsignedByte()) {
                        1 -> strings[index] = data.readUTF()
                        3, 4, 9, 10, 11, 12, 17, 18 -> data.readInt()
                        5, 6 -> { data.readLong(); index++ }
                        7, 8, 16, 19, 20 -> data.readUnsignedShort()
                        15 -> { data.readUnsignedByte(); data.readUnsignedShort() }
                        else -> error("Unknown SDK constant pool tag $tag")
                    }
                    index++
                }
                fun attributes() { repeat(data.readUnsignedShort()) {
                    data.readUnsignedShort(); val size = data.readInt()
                    data.readFully(ByteArray(size))
                } }
                repeat(3) { data.readUnsignedShort() }
                repeat(data.readUnsignedShort()) { data.readUnsignedShort() }
                repeat(data.readUnsignedShort()) { repeat(3) { data.readUnsignedShort() }; attributes() }
                buildSet { repeat(data.readUnsignedShort()) {
                    data.readUnsignedShort()
                    add(requireNotNull(strings[data.readUnsignedShort()]) + requireNotNull(strings[data.readUnsignedShort()]))
                    attributes()
                } }
            }
        }
    }
    fun frameworkDefines(type: String, signature: String): Boolean {
        if (type.startsWith("Ljava/")) return signature in sdkMethods(type)
        if (!type.startsWith("Landroid/")) return false
        val owner = frameworkLoader.loadClass(type.substring(1, type.length - 1).replace('/', '.'))
        return owner.methods.any { method ->
            method.name + method.parameterTypes.joinToString("", "(", ")") { descriptor(it) } + descriptor(method.returnType) == signature
        }
    }
    val hierarchy = SdkDexVerifier(File(args[3]), null)
    val hierarchyMethod = SdkDexVerifier::class.java.getDeclaredMethod("verifyClassHierarchy", File::class.java).apply { isAccessible = true }
    fun hierarchyIssues(directory: File): List<String> {
        val report = try { hierarchyMethod.invoke(hierarchy, directory); return emptyList() }
        catch (error: InvocationTargetException) { error.cause?.message ?: throw error }
        val issues = report.split(Regex("\\n\\s*\\d+\\. ")).drop(1)
        check(issues.isNotEmpty()) { "Unexpected hierarchy verification failure: $report" }
        return issues.map { it.replace(Regex("\\(classes\\d*\\.dex\\)"), "(DEX)").replace(Regex("\\s+"), " ").trim() }.sorted()
    }
    val baselineIssues = hierarchyIssues(originalDex)
    val nextName = "NuvioTV - Preload streams for next episode"
    check(available.count { it.name == nextName } == 1)
    for (mode in listOf("next", "merged", "startup-clone", "buttons", "introdb", "current-stream", "preferred", "apk-updates", "stability", "combined")) {
        val combined = mode == "combined"
        val startupClone = mode == "startup-clone"
        val updatesOnly = mode == "apk-updates"
        val stabilityOnly = mode == "stability"
        val mergeOnly = mode == "merged" || startupClone
        val buttonsOnly = mode == "buttons"
        val introOnly = mode == "introdb"
        val currentOnly = mode == "current-stream"
        val preferredOnly = mode == "preferred"
        val selected = available.filter {
            if (startupClone) it.name in setOf("NuvioTV - Merge tracking progress", "NuvioTV - Side-by-side installation")
            else if (stabilityOnly) it.name == "NuvioTV - Fix startup track reselection"
            else if (combined) it.name?.startsWith("NuvioTV - ") == true && it.name != "NuvioTV - Side-by-side installation"
            else it.name == if (updatesOnly) "NuvioTV - GitHub APK updates" else if (preferredOnly) "NuvioTV - Preferred source add-on" else if (currentOnly) "NuvioTV - Indicate current stream" else if (introOnly) "NuvioTV - Submit segments to IntroDB" else if (buttonsOnly) "NuvioTV - Customize playback buttons" else if (mergeOnly) "NuvioTV - Merge tracking progress" else nextName
        }.toSet()
        check(selected.size == if (combined) 15 else if (startupClone) 2 else 1)
        val output = File(args[2], mode).apply { mkdirs() }
        // Patcher 2 partitions copied/modified DEX differently. Remove only prior
        // generated root DEX files so hierarchy checks see this run's output.
        output.listFiles()!!.filter { it.isFile && it.name.matches(Regex("classes\\d*\\.dex")) }
            .forEach { check(it.delete()) { "Cannot remove stale verifier output: $it" } }
        Patcher(PatcherConfig(apkFile = File(args[0]), temporaryFilesPath = File(output, "work"))).use { patcher ->
            patcher += selected
            patcher().collect { result ->
                result.exception?.let { throw it }
                println("PASS: packaged patch applied: ${result.patch.name}")
            }
            val definitions = mutableSetOf<String>()
            val parents = mutableMapOf<String, List<String>>()
            val extensionCalls = mutableSetOf<String>()
            val coroutineCalls = mutableSetOf<String>()
            val classes = mutableSetOf<String>()
            val nativeHooks = mutableMapOf<String, Int>()
            var stabilityGuards = 0
            val mergeHooks = mutableMapOf<String, Int>()
            val bannerHooks = mutableMapOf<String, Int>()
            var introHooks = 0
            var currentLabels = 0
            var updaterVersions = 0
            var updaterRepository = 0
            var safeInstaller = 0
            var safeReceiver = 0
            val preferredHooks = mutableMapOf<String, Int>()
            val result = patcher.get()
            if (combined || mergeOnly) {
                val resources = requireNotNull(requireNotNull(result.resources).resourcesApk)
                val buildTools = File(args[3], "build-tools/36.0.0")
                val aapt = listOf(File(buildTools, "aapt.exe"), File(buildTools, "aapt")).single { it.isFile }
                val inspection = ProcessBuilder(aapt.absolutePath, "dump", "xmltree", resources.absolutePath, "res/0n.xml")
                    .redirectErrorStream(true).start()
                val xml = inspection.inputStream.bufferedReader().readText()
                check(inspection.waitFor() == 0) { xml }
                check("layer-list" in xml && "gradient" in xml && "@0x7f080050" in xml) { "Splash appearance missing from compiled resources: $xml" }
                val manifestProcess = ProcessBuilder(aapt.absolutePath, "dump", "xmltree", resources.absolutePath, "AndroidManifest.xml")
                    .redirectErrorStream(true).start()
                val manifestXml = manifestProcess.inputStream.bufferedReader().readText()
                check(manifestProcess.waitFor() == 0) { manifestXml }
                check(manifestXml.split("android:targetActivity").drop(1).size == 6)
                check(manifestXml.lineSequence().filter { "android:targetActivity" in it }.all { NUVIO_STARTUP_ACTIVITY in it })
                check("com.nuvio.tv.MainActivity" in manifestXml || ".MainActivity" in manifestXml)
                if (startupClone) check("com.nuvio.santodan" in manifestXml)
                println("PASS: $mode compiled early splash theme and all six launcher aliases resolve; native activity/deep links remain")
            }
            val patchedDex = result.dexFiles
            // STRIP_FAST now returns only replacement/new DEX entries. Untouched
            // original entries remain in the APK and must be included in verification.
            val replacedNames = patchedDex.map { it.name }.toSet()
            val retainedDex = originalDex.listFiles()!!.filter { it.name !in replacedNames && it.name.matches(Regex("classes\\d*\\.dex")) }
                .map { it.name to it.inputStream() }
            for ((name, stream) in patchedDex.map { it.name to it.stream } + retainedDex) {
                val target = File(output, name)
                stream.use { input -> target.outputStream().use { input.copyTo(it) } }
                target.inputStream().buffered().use { input ->
                    for (owner in DexBackedDexFile.fromInputStream(null, input).classes) {
                        classes += owner.type
                        if (owner.type in libraryTypes) {
                            val native = originals.getValue(owner.type)
                            val expected = MutableClass(native)
                            // The independent launcher-channels patch already observes
                            // library construction; preserve that existing hook only.
                            if (combined && owner.type == "Lba/e1;") {
                                NuvioLauncherChannelsPatch.hookReturn(expected.methods.single {
                                    it.name == "<init>" && it.parameterTypes.size == 8
                                }, "observeLibrary")
                            }
                            fun bodies(type: ClassDef) = type.methods.associate { method ->
                                method.toString() to (method.implementation?.let {
                                    NuvioPlaybackButtonsPatch.fingerprint(MutableMethod(method))
                                } ?: "abstract")
                            }
                            check(bodies(owner) == bodies(expected)) { "Native library code changed: ${owner.type}" }
                            check(owner.fields.map { "${it.name}:${it.type}:${it.accessFlags}" }.toSet() ==
                                native.fields.map { "${it.name}:${it.type}:${it.accessFlags}" }.toSet())
                        }
                        if (owner.type == NuvioPlayerStabilityPatch.OWNER) {
                            val seek = owner.methods.single { it.name == NuvioPlayerStabilityPatch.METHOD }
                            if (stabilityOnly || combined) {
                                VerifyNuvioPlayerStability.verifyPatched(seek)
                                stabilityGuards++
                            } else check(NuvioPlaybackButtonsPatch.fingerprint(MutableMethod(seek)) == NuvioPlayerStabilityPatch.HASH)
                        }
                        check(owner.type != "Lsoftware/santodan/nuvio/NuvioNative;") { "Compile-only contracts leaked into the APK" }
                        parents[owner.type] = listOfNotNull(owner.superclass) + owner.interfaces
                        for (method in owner.methods) {
                            definitions += method.toString()
                            if (owner.type == NuvioAccessPatch.TYPE && method.name in NuvioAccessPatch.FIELDS) {
                                val bridge = method.implementation!!.instructions.toList()
                                check(bridge.size == 6 && bridge[0].opcode == Opcode.IF_NEZ && bridge[3].opcode == Opcode.CHECK_CAST &&
                                    bridge[4].opcode == Opcode.IGET_OBJECT && bridge[5].opcode == Opcode.RETURN_OBJECT)
                                check((bridge[4] as ReferenceInstruction).reference.toString() == NuvioAccessPatch.FIELDS.getValue(method.name))
                            }
                            for (instruction in method.implementation?.instructions ?: emptyList()) {
                                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: continue
                                if (reference.definingClass == NuvioPreferredAddonPatch.EXTENSION)
                                    preferredHooks[reference.name] = preferredHooks.getOrDefault(reference.name, 0) + 1
                            }
                            val instructions = method.implementation?.instructions ?: continue
                            if (owner.type == NuvioUpdateInstaller.INSTALLER && method.name == "b") {
                                val checkMethod = MutableMethod(method)
                                if (updatesOnly || combined) NuvioUpdateFlowPatch.removeInstallHook(checkMethod)
                                if (NuvioUpdateInstaller.isZero(checkMethod.implementation!!.instructions.first(), 15)) safeInstaller++
                            }
                            if (owner.type == NuvioUpdateInstaller.RECEIVER && method.name == "onReceive") {
                                val callback = MutableMethod(method)
                                val result = NuvioUpdateInstaller.dmResult(callback)
                                val code = callback.implementation!!.instructions
                                val register = (code[result] as OneRegisterInstruction).registerA
                                if (NuvioUpdateInstaller.isZero(code[result + 1], register)) safeReceiver++
                            }
                            if (owner.type in NuvioApkUpdates.TYPES) {
                                for (instruction in instructions) {
                                    val value = NuvioApkUpdates.string(instruction)
                                    if (value == PatchBundleVersion.VERSION) updaterVersions++
                                    if (owner.type == "Lkb/j0;" && value in setOf("Santodan", "santodan-patches")) updaterRepository++
                                }
                            }
                            if (owner.type == "Lab/bp;" && method.name == "h") {
                                val body = instructions.toList()
                                currentLabels += body.count { (it as? ReferenceInstruction)?.reference?.toString() == NuvioCurrentStreamPatch.LABEL_METHOD }
                                if (currentOnly || combined) {
                                    check(body[142].opcode == Opcode.INVOKE_STATIC)
                                    val call = body[142] as com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
                                    check(call.registerCount == 2 && call.registerC == 7 && call.registerD == 8)
                                    check((body[142] as ReferenceInstruction).reference.toString() == NuvioCurrentStreamPatch.LABEL_METHOD)
                                    check(body[143].opcode == Opcode.MOVE_RESULT_OBJECT && (body[143] as OneRegisterInstruction).registerA == 7)
                                }
                            }
                            if ((combined || mergeOnly) && owner.type == "Lba/re;" && method.name in setOf("E", "s")) {
                                val entry = instructions.toList()
                                check((entry[0] as ReferenceInstruction).reference.toString().endsWith("->syncLocalProgress(Z)Z"))
                                check((entry[0] as RegisterRangeInstruction).startRegister == method.implementation!!.registerCount - 1)
                                check(entry[1].opcode == Opcode.MOVE_RESULT &&
                                    (entry[1] as OneRegisterInstruction).registerA == method.implementation!!.registerCount - 1)
                            }
                            if ((combined || mergeOnly) && owner.type in localStores) {
                                val names = if (owner.type.endsWith("/vb;")) setOf("C", "D", "A", "B") else setOf("p", "q")
                                if (method.name in names) {
                                    val body = instructions.toList()
                                    check(body.size == 3 && body[0].opcode == Opcode.INVOKE_STATIC_RANGE &&
                                        body[1].opcode == Opcode.MOVE_RESULT_OBJECT && body[2].opcode == Opcode.RETURN_OBJECT)
                                    val native = originals.getValue(owner.type).methods.single { it.name == method.name }
                                    val saved = owner.methods.single { it.name == "santodanLocal${method.name}" }
                                    check(saved.parameterTypes == native.parameterTypes && saved.accessFlags == native.accessFlags)
                                    check(NuvioPlaybackButtonsPatch.fingerprint(MutableMethod(saved)) == NuvioPlaybackButtonsPatch.fingerprint(MutableMethod(native)))
                                    check((body[0] as RegisterRangeInstruction).startRegister == 0 &&
                                        (body[0] as RegisterRangeInstruction).registerCount == native.parameterTypes.size + 1)
                                }
                            }
                            if ((combined || mergeOnly) && owner.type == "Lba/ad;" && method.name == "invokeSuspend") {
                                val entry = instructions.toList()
                                val returns = entry.indices.filter { entry[it].opcode == Opcode.RETURN_OBJECT }
                                check(returns.size == 2)
                                check((entry[returns.first() - 3] as? ReferenceInstruction)?.reference?.toString()?.contains("->mergedProvider(") != true) { "Watch-party branch was modified" }
                                for (at in listOf(returns.last())) {
                                    val register = (entry[at] as OneRegisterInstruction).registerA
                                    check((entry[at - 3] as ReferenceInstruction).reference.toString().contains("->mergedProvider("))
                                    check((entry[at - 3] as RegisterRangeInstruction).startRegister == register)
                                    check(entry[at - 2].opcode == Opcode.MOVE_RESULT_OBJECT && entry[at - 1].opcode == Opcode.CHECK_CAST)
                                }
                            }
                            for (instruction in instructions) {
                                val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: continue
                                if (ref.definingClass == NuvioNativeSyncBanner.EXT && !owner.type.startsWith("Lsoftware/santodan/extension/"))
                                    bannerHooks[ref.name] = (bannerHooks[ref.name] ?: 0) + 1
                                if (ref.definingClass == NuvioIntroDbPatch.EXT && !owner.type.startsWith("Lsoftware/santodan/extension/")) introHooks++
                                if ((owner.type.startsWith("Lsoftware/santodan/extension/nuviostreams/") ||
                                    owner.type.startsWith("Lsoftware/santodan/extension/nuviomerged/")) &&
                                    ref.definingClass.startsWith("Lkotlinx/coroutines/")) coroutineCalls += ref.toString()
                                if (ref.definingClass == "Lsoftware/santodan/extension/nuviomerged/NuvioMergedProgress;" &&
                                    !owner.type.startsWith("Lsoftware/santodan/extension/")) {
                                    mergeHooks[ref.name] = (mergeHooks[ref.name] ?: 0) + 1
                                }
                                if (!ref.definingClass.startsWith("Lsoftware/santodan/extension/") &&
                                    !ref.definingClass.startsWith("Lsoftware/santodan/nuvio/")) continue
                                extensionCalls += ref.toString()
                                if (ref.definingClass == NuvioStreamPreloadPatch.EXTENSION &&
                                    !owner.type.startsWith("Lsoftware/santodan/extension/")) {
                                    nativeHooks[ref.name] = (nativeHooks[ref.name] ?: 0) + 1
                                }
                            }
                        }
                    }
                }
            }
            check(classes.containsAll(libraryTypes)) { "Native library classes missing" }
            println("PASS: $mode native library preserved; only existing launcher observation allowed when selected")
            check((NuvioPreferredAddonPatch.EXTENSION in classes) == (preferredOnly || combined))
            check(("Lsoftware/santodan/extension/nuviomerged/NuvioStartupActivity;" in classes) == (mergeOnly || combined))
            if (preferredOnly || combined) {
                for (hook in listOf("registerComponent", "prioritize", "select", "choose", "allowNativeReuse", "autoPlaySelectionEnabled", "orderGroups", "autoPlayGate"))
                    check(preferredHooks.getOrDefault(hook, 0) > 0) { "Missing preferred add-on hook: $hook" }
            } else check(preferredHooks.isEmpty())
            check(currentLabels == if (currentOnly || combined) 1 else 0)
            check((NuvioCurrentStreamPatch.EXTENSION in classes) == (currentOnly || combined))
            check(stabilityGuards == if (stabilityOnly || combined) 1 else 0)
            if (!mergeOnly && !buttonsOnly && !introOnly && !currentOnly && !preferredOnly && !updatesOnly && !stabilityOnly) {
            for (hook in listOf("registerComponent", "observeNextEpisode", "stopNextEpisode", "nextEpisodePluginPause"))
                check(nativeHooks[hook] == 1) { "Expected one $hook hook, found ${nativeHooks[hook]}" }
            check(nativeHooks["nextEpisodePickerRefresh"] == 1) { "Next-episode picker entry must reuse the warmed search" }
            check(nativeHooks["useNativeNextEpisodeThresholdPreload"] == 1)
            // Inspect the assembled entry points, not just the presence of extension calls.
            for (dex in output.listFiles()!!.filter { it.name.matches(Regex("classes\\d*\\.dex")) }) {
                dex.inputStream().buffered().use { input ->
                    for (owner in DexBackedDexFile.fromInputStream(null, input).classes.filter { it.type == "Lab/fh;" }) {
                        val entry = owner.methods.single { it.name == "E" }.implementation!!
                        val instructions = entry.instructions.toList()
                        check((instructions[0] as RegisterRangeInstruction).startRegister == entry.registerCount - 1)
                        check(instructions[1].opcode == Opcode.MOVE_RESULT &&
                            (instructions[1] as OneRegisterInstruction).registerA == entry.registerCount - 1)
                        val threshold = owner.methods.single { it.name == "x" }.implementation!!.instructions.toList()
                        check(threshold[0].opcode == Opcode.INVOKE_STATIC_RANGE && threshold[1].opcode == Opcode.MOVE_RESULT)
                        check(threshold[2].opcode == Opcode.IF_NEZ && threshold[3].opcode == Opcode.RETURN_VOID)
                        check((threshold[2] as OffsetInstruction).codeOffset == threshold[2].codeUnits + threshold[3].codeUnits)
                        check(threshold[4].opcode == Opcode.CONST_STRING)
                    }
                }
            }
            }
            if (combined || mergeOnly) {
                for (hook in listOf("registerNavigation", "activityResumed", "activityPaused", "activityDestroyed", "playbackScrobblers", "homePipelineStarted",
                    "localSave", "localSaveBatch", "localRemove", "localRemoveBatch", "localUnwatch", "localUnwatchBatch"))
                    check(mergeHooks[hook] == 1) { "Expected one merge $hook hook: $mergeHooks" }
                check(mergeHooks["syncLocalProgress"] == 2 && mergeHooks["mergedProvider"] == 1)
                check("setPlaybackPaused" !in mergeHooks) { "Search pause must not control merged sync" }
                check("Lsoftware/santodan/extension/nuviomerged/NuvioMergePolicy;" in classes)
                check("Lsoftware/santodan/extension/nuviomerged/NuvioLocalWriteContinuation;" in classes)
                check("Lsoftware/santodan/extension/nuviomerged/NuvioPlaybackJournal;" in classes)
                check("Lsoftware/santodan/extension/nuviomerged/NuvioSyncBanner;" in classes)
                check("Lsoftware/santodan/extension/nuviomerged/NuvioMergeWork\$HomeRequests;" in classes)
                check("Lsoftware/santodan/extension/nuviomerged/NuvioSyncBanner;->update(Landroid/app/Activity;Ljava/lang/String;IIZZ)V" in definitions)
                check("Lsoftware/santodan/extension/nuviomerged/NuvioSyncBanner;->hide()V" in definitions)
                check(bannerHooks == mapOf("host" to 1, "begin" to 1, "end" to 1, "installed" to 1, "groupText" to 4, "formatted" to 1,
                    "hideClose" to 1, "timedClose" to 1, "closeText" to 1)) {
                    "Native updater banner hooks changed: $bannerHooks"
                }
            }
            else check(bannerHooks.isEmpty())
            check(updaterVersions == if (updatesOnly || combined) 7 else 0)
            check(updaterRepository == if (updatesOnly || combined) 2 else 0)
            check(safeInstaller == if (updatesOnly || combined) 1 else 0)
            check(safeReceiver == if (updatesOnly || combined) 1 else 0)
            check(updatesOnly || stabilityOnly || NuvioAccessPatch.TYPE in classes) { "Shared direct native accessors are missing" }
            fun resolves(reference: String): Boolean {
                val signature = reference.substringAfter("->")
                val visited = mutableSetOf<String>()
                fun find(type: String): Boolean = visited.add(type) &&
                    ("$type->$signature" in definitions || frameworkDefines(type, signature) || parents[type].orEmpty().any { find(it) })
                return find(reference.substringBefore("->"))
            }
            check(extensionCalls.all { resolves(it) }) {
                "Missing extension signatures: ${extensionCalls.filter { !resolves(it) }}"
            }
            if (mergeOnly || combined) {
                check(resolves("Lsoftware/santodan/extension/nuviomerged/NuvioStartupActivity;->getPackageName()Ljava/lang/String;"))
                check(!resolves("Lsoftware/santodan/extension/nuviomerged/NuvioStartupActivity;->missingFrameworkMethod()V"))
                check(resolves("Lsoftware/santodan/extension/nuviomerged/NuvioLocalOverlay\$Action;->ordinal()I"))
                check(!resolves("Lsoftware/santodan/extension/nuviomerged/NuvioLocalOverlay\$Action;->missingEnumMethod()V"))
            }
            check(coroutineCalls.all { resolves(it) }) {
                "Missing native coroutine APIs: ${coroutineCalls.filter { !resolves(it) }}"
            }
            check(("Lsoftware/santodan/extension/nuvionextstreams/NuvioNextEpisodeStreams;" in classes) == (!mergeOnly && !buttonsOnly && !introOnly && !currentOnly && !preferredOnly && !updatesOnly && !stabilityOnly))
            check(("Lsoftware/santodan/extension/nuviobuttons/NuvioPlaybackButtons;" in classes) == (buttonsOnly || combined))
            check(("Lsoftware/santodan/extension/nuviocwstreams/NuvioContinueWatchingStreams;" in classes) == combined)
            check(("Lsoftware/santodan/extension/nuviodetailstreams/NuvioDetailStreams;" in classes) == combined)
            if (buttonsOnly || combined) {
                val buttonHooks = extensionCalls.filter { it.startsWith(NuvioPlaybackButtonsPatch.EXTENSION) }
                check(buttonHooks.size >= 16) { "Playback button hooks missing from packaged DEX: $buttonHooks" }
            }
            if (introOnly || combined) {
                check("Lsoftware/santodan/extension/nuviointro/Submission;" in classes)
                check(introHooks == 5) { "Expected five native IntroDB hooks, found $introHooks" }
            }
            println("PASS: $mode selection; assembled DEX reloads and hooks resolve")
            check(hierarchyIssues(output) == baselineIssues) { "Patched cross-DEX hierarchy findings differ from original" }
            println("PASS: $mode cross-DEX hierarchy has no new findings (${baselineIssues.size} original optional-library findings)")
        }
    }
}
