package app.bitchord.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.*
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference

private const val ORIGINAL = "com.music.bitchord"
private const val CLONE = "com.music.bitchord.telegramtest"
private val cloneStrings = mutableMapOf(ORIGINAL to CLONE, "$ORIGINAL." to "$CLONE.")
private val applicationIdOption =
    intOption(
        key = "telegramApplicationId",
        title = "Telegram application API ID",
        description = "Leave at 0 and enter your API ID in the app after installing.",
        default = 0,
        required = false,
        validator = { it != null && it >= 0 },
    )
private val applicationHashOption =
    stringOption(
        key = "telegramApplicationHash",
        title = "Telegram application API hash",
        description = "Leave empty and enter your API hash in the app after installing.",
        default = "",
        required = false,
        validator = { it != null && (it.isEmpty() || it.matches(Regex("[a-fA-F0-9]{32}"))) },
    )
private val installationNameOption =
    stringOption(
        key = "installationName",
        title = "Installation name",
        description =
            "The app name on your home screen, up to 80 characters. Leave blank for Bitchord+. A name containing Telegram must include Unofficial Telegram.",
        default = "",
        required = false,
        validator = { value ->
            value != null &&
                value.length <= 80 &&
                value.none { Character.isISOControl(it) || it == '\u2028' || it == '\u2029' } &&
                !value
                    .replace(Regex("(?i)unofficial\\s+telegram"), "")
                    .contains("telegram", ignoreCase = true)
        },
    )

private fun installationName() =
    installationNameOption.value.orEmpty().trim().ifEmpty { "Bitchord+" }

private const val ANDROID = "http://schemas.android.com/apk/res/android"
private val target =
    Compatibility(
        name = "BitChord",
        packageName = "com.music.bitchord",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF8944,
        targets = listOf(AppTarget(version = "1.8.1", isExperimental = true, minSdk = 26)),
    )

private object ApplicationCreate :
    Fingerprint(
        definingClass = "Lcom/music/bitchord/BitChordApplication;",
        name = "onCreate",
        parameters = emptyList(),
        returnType = "V",
    )

private fun argumentRegisters(
    instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction
): List<Int> =
    when (instruction) {
        is RegisterRangeInstruction ->
            (instruction.startRegister until instruction.startRegister + instruction.registerCount)
                .toList()
        is FiveRegisterInstruction ->
            listOf(
                    instruction.registerC,
                    instruction.registerD,
                    instruction.registerE,
                    instruction.registerF,
                    instruction.registerG,
                )
                .take(instruction.registerCount)
        else -> error("Unsupported settings call encoding")
    }

private val telegramResources = resourcePatch {
    execute {
        val applicationId = applicationIdOption.value!!
        val applicationHash = applicationHashOption.value!!
        check(
            (applicationId == 0 && applicationHash.isEmpty()) ||
                (applicationId > 0 && applicationHash.matches(Regex("[a-fA-F0-9]{32}")))
        ) {
            "Supply both optional seed credentials or leave both empty to configure them in the app"
        }
        get("assets/telegram-native/application.json", false).apply {
            parentFile.mkdirs()
            writeText("""{"apiId":$applicationId,"apiHash":"$applicationHash"}""")
        }
        // Match native libraries to every ABI present in the original APK.
        val inputAbis =
            listApkEntries("lib/").filter { it.endsWith(".so") }.map { it.split('/')[1] }.toSet()
        check(
            inputAbis.isNotEmpty() &&
                inputAbis.all { it in setOf("arm64-v8a", "armeabi-v7a", "x86_64") }
        ) {
            "Unsupported APK native architecture: $inputAbis"
        }
        for (abi in inputAbis) for (name in
            listOf("libtdjni.so", "libsslx.so", "libcryptox.so", "libc++_shared.so")) {
            val path = "lib/$abi/$name"
            val file = get(path, false)
            file.parentFile.mkdirs()
            TelegramPatchMarker::class.java.classLoader.getResourceAsStream(path)!!.use { input ->
                file.outputStream().use { input.copyTo(it) }
            }
        }
        for (name in
            listOf(
                "TDLIB-BOOST.txt",
                "OPENSSL-APACHE.txt",
                "LIBCXX-LICENSE.txt",
                "ANDROID-NDK-NOTICE.txt",
                "LLVM-NOTICE.txt",
                "GPL-3.0.txt",
            )) {
            val file = get("assets/telegram-native/licenses/$name", false)
            file.parentFile.mkdirs()
            TelegramPatchMarker::class
                .java
                .classLoader
                .getResourceAsStream("licenses/$name")!!
                .use { input -> file.outputStream().use { input.copyTo(it) } }
        }
        get("res/drawable/telegram_native.xml", false).apply {
            parentFile.mkdirs()
            writeText(
                """<vector xmlns:android="http://schemas.android.com/apk/res/android" android:width="24dp" android:height="24dp" android:viewportWidth="24" android:viewportHeight="24">
                <path android:fillColor="#FFFFFFFF" android:pathData="M4,8h3v8H4zM10.5,3h3v18h-3zM17,6h3v12h-3z"/>
                </vector>"""
            )
        }
        get("res/xml/telegram_network_security.xml", false).apply {
            parentFile.mkdirs()
            writeText(
                """<?xml version="1.0" encoding="utf-8"?>
                <network-security-config>
                    <base-config cleartextTrafficPermitted="false" />
                </network-security-config>"""
            )
        }
        document("AndroidManifest.xml").use { document ->
            val doc = document
            val app = doc.getElementsByTagName("application").item(0) as org.w3c.dom.Element
            val overlayPermission = doc.createElement("uses-permission")
            overlayPermission.setAttributeNS(
                ANDROID,
                "android:name",
                "android.permission.HIDE_OVERLAY_WINDOWS",
            )
            doc.documentElement.insertBefore(overlayPermission, app)
            check(!app.hasAttributeNS(ANDROID, "networkSecurityConfig")) {
                "Unexpected network policy in target APK"
            }
            app.setAttributeNS(
                ANDROID,
                "android:networkSecurityConfig",
                "@xml/telegram_network_security",
            )
            // Extract libs on installation: independent of zip-entry alignment and compression.
            app.setAttributeNS(ANDROID, "android:extractNativeLibs", "true")
            val activity = doc.createElement("activity")
            activity.setAttributeNS(
                ANDROID,
                "android:name",
                "app.bitchord.telegram.TelegramActivity",
            )
            activity.setAttributeNS(ANDROID, "android:exported", "false")
            activity.setAttributeNS(ANDROID, "android:label", "Unofficial Telegram")
            activity.setAttributeNS(
                ANDROID,
                "android:theme",
                "@android:style/Theme.Material.NoActionBar",
            )
            // Settings opens this activity explicitly, so it needs no launcher entry.
            app.appendChild(activity)
        }
    }
}

private class TelegramPatchMarker

private val cloneResources = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { doc ->
            val manifest = doc.documentElement
            check(manifest.getAttribute("package") == ORIGINAL) { "Unexpected original package" }
            check(!manifest.hasAttributeNS(ANDROID, "sharedUserId")) {
                "Shared UID apps are unsupported"
            }
            manifest.setAttribute("package", CLONE)
            val nodes = doc.getElementsByTagName("*")
            for (index in 0 until nodes.length) {
                val element = nodes.item(index) as org.w3c.dom.Element
                val tag = element.tagName
                // Real component classes keep their existing bytecode namespace.
                // Aliases have no class: their identities follow the test package.
                if (
                    tag in
                        setOf(
                            "application",
                            "activity",
                            "service",
                            "receiver",
                            "provider",
                            "instrumentation",
                        )
                ) {
                    for (attribute in
                        listOf(
                            "name",
                            "backupAgent",
                            "appComponentFactory",
                            "manageSpaceActivity",
                        )) {
                        val value = element.getAttributeNS(ANDROID, attribute)
                        if (value.startsWith("."))
                            element.setAttributeNS(ANDROID, "android:$attribute", ORIGINAL + value)
                        else if (value.isNotEmpty() && !value.contains('.'))
                            element.setAttributeNS(
                                ANDROID,
                                "android:$attribute",
                                "$ORIGINAL.$value",
                            )
                    }
                }
                if (tag == "activity-alias") {
                    val old =
                        element.getAttributeNS(ANDROID, "name").let {
                            if (it.startsWith('.')) ORIGINAL + it else it
                        }
                    if (old.startsWith("$ORIGINAL.")) {
                        val renamed = CLONE + old.removePrefix(ORIGINAL)
                        cloneStrings[old] = renamed
                        element.setAttributeNS(ANDROID, "android:name", renamed)
                    }
                    element.setAttributeNS(ANDROID, "android:label", installationName())
                }
                val targetActivity = element.getAttributeNS(ANDROID, "targetActivity")
                if (targetActivity.startsWith('.'))
                    element.setAttributeNS(
                        ANDROID,
                        "android:targetActivity",
                        ORIGINAL + targetActivity,
                    )
                for (attribute in
                    listOf(
                        "authorities",
                        "permission",
                        "readPermission",
                        "writePermission",
                        "taskAffinity",
                        "targetPackage",
                    )) {
                    val value = element.getAttributeNS(ANDROID, attribute)
                    if (value == ORIGINAL || value.startsWith("$ORIGINAL.")) {
                        val renamed = value.replace(ORIGINAL, CLONE)
                        value.split(';').zip(renamed.split(';')).forEach { (a, b) ->
                            cloneStrings[a] = b
                        }
                        element.setAttributeNS(ANDROID, "android:$attribute", renamed)
                    }
                }
                if (tag in setOf("permission", "uses-permission", "action")) {
                    val value = element.getAttributeNS(ANDROID, "name")
                    if (value.startsWith("$ORIGINAL.")) {
                        val renamed = CLONE + value.removePrefix(ORIGINAL)
                        cloneStrings[value] = renamed
                        element.setAttributeNS(ANDROID, "android:name", renamed)
                    }
                }
                if (
                    tag == "application" ||
                        (tag == "activity" &&
                            element.getAttributeNS(ANDROID, "name") ==
                                "com.music.bitchord.MainActivity")
                )
                    element.setAttributeNS(ANDROID, "android:label", installationName())
            }
        }
    }
}

private const val DOWNMIX = "Lapp/bitchord/telegram/Downmix;"
private const val DOWNMIX_TARGET = "Lapp/bitchord/telegram/Downmix\$Target;"
private const val SINK_CONFIG = "Landroidx/media3/exoplayer/audio/AudioSink\$AudioSinkConfig;"

/**
 * Folds surround PCM to stereo in BitChord's own audio sink, ahead of its effects. The sink's
 * configure() is told the stereo format, and handleBuffer() is wrapped so the decoder's surround
 * buffers are converted before the original code sees them.
 */
private fun BytecodePatchContext.addSurroundDownmix() {
    val sink = mutableClassDefBy("Lcom/music/bitchord/playback/audio/PrecisionAudioSink;")
    check("Landroidx/media3/exoplayer/audio/AudioSink;" in sink.interfaces) {
        "Audio sink no longer implements AudioSink"
    }
    fun method(name: String, parameters: List<String>, returnType: String) =
        sink.methods.single {
            it.name == name && it.parameterTypes == parameters && it.returnType == returnType
        }

    val configure = method("configure", listOf(SINK_CONFIG), "V")
    val code = configure.implementation!!.instructions.toList()
    val formatRead =
        code.indexOfFirst {
            it.opcode == Opcode.IGET_OBJECT &&
                ((it as ReferenceInstruction).reference as FieldReference).let { field ->
                    field.definingClass == SINK_CONFIG && field.name == "format"
                }
        }
    check(formatRead >= 0) { "Audio sink format read not found" }
    val formatRegister = (code[formatRead] as TwoRegisterInstruction).registerA
    val configRegister = (code[formatRead] as TwoRegisterInstruction).registerB
    check(formatRegister < 16) { "Audio sink format register out of range" }
    // The legacy path hands the original (surround) configuration to the platform sink.
    val passThrough =
        code.indexOfLast {
            it.opcode == Opcode.INVOKE_VIRTUAL &&
                ((it as ReferenceInstruction).reference as MethodReference).let { call ->
                    call.name == "configure" && call.parameterTypes == listOf(SINK_CONFIG)
                } &&
                (it as FiveRegisterInstruction).registerD == configRegister
        }
    check(passThrough > formatRead) { "Audio sink fallback configure not found" }
    configure.addInstruction(
        passThrough,
        "invoke-static/range {p0 .. p0}, $DOWNMIX->off(Ljava/lang/Object;)V",
    )
    configure.addInstructions(
        formatRead + 1,
        """
        invoke-static {v$formatRegister}, $DOWNMIX->format(Landroidx/media3/common/Format;)Landroidx/media3/common/Format;
        move-result-object v$formatRegister
    """,
    )
    configure.addInstruction(
        0,
        "invoke-static/range {p0 .. p1}, $DOWNMIX->configure(Ljava/lang/Object;$SINK_CONFIG)V",
    )

    for (name in listOf("flush", "reset")) method(name, emptyList(), "V")
        .addInstruction(0, "invoke-static/range {p0 .. p0}, $DOWNMIX->flush(Ljava/lang/Object;)V")

    // R8 may reorder handleBuffer's parameters, so match them in any order.
    val handle =
        sink.methods.single {
            it.name == "handleBuffer" &&
                it.returnType == "Z" &&
                it.parameterTypes.map(CharSequence::toString).sorted() ==
                    listOf("I", "J", "Ljava/nio/ByteBuffer;")
        }
    val hostTypes = handle.parameterTypes.map(CharSequence::toString)
    val hostSignature = hostTypes.joinToString("")
    // Parameter registers with no locals: this is p0, then each parameter, J taking two.
    fun registersFor(types: List<String>): Map<String, Int> {
        val result = mutableMapOf<String, Int>()
        var next = 1
        for (type in types) {
            result[type] = next
            next += if (type == "J") 2 else 1
        }
        return result
    }
    fun arguments(types: List<String>, order: List<String>): String {
        val at = registersFor(types)
        return order.joinToString(", ") { type ->
            val register = at.getValue(type)
            if (type == "J") "p$register, p${register + 1}" else "p$register"
        }
    }
    fun newMethod(name: String, types: List<String>, code: String) {
        val method =
            MutableMethod(
                ImmutableMethod(
                    sink.type,
                    name,
                    types.map {
                        com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter(
                            it,
                            null,
                            null,
                        )
                    },
                    "Z",
                    handle.accessFlags,
                    null,
                    null,
                    ImmutableMethodImplementation(
                        5,
                        emptyList<Instruction>(),
                        emptyList(),
                        emptyList(),
                    ),
                )
            )
        method.addInstructions(0, code)
        sink.methods.add(method)
    }
    val targetOrder = listOf("Ljava/nio/ByteBuffer;", "J", "I")
    handle.name = "hostHandleBuffer"
    sink.interfaces.add(DOWNMIX_TARGET)
    // Downmix.Target, called by the extension with the buffer it wants written.
    newMethod(
        "originalHandleBuffer",
        targetOrder,
        """
        invoke-virtual {p0, ${arguments(targetOrder, hostTypes)}}, ${sink.type}->hostHandleBuffer($hostSignature)Z
        move-result p0
        return p0
    """,
    )
    // The renderer's entry point, in the host's parameter order.
    newMethod(
        "handleBuffer",
        hostTypes,
        """
        invoke-static {p0, ${arguments(hostTypes, targetOrder)}}, $DOWNMIX->handleBuffer(${DOWNMIX_TARGET}Ljava/nio/ByteBuffer;JI)Z
        move-result p0
        return p0
    """,
    )
    println("Added surround-to-stereo downmix to the audio sink")
}

private const val SERVICE = "Lcom/music/bitchord/playback/PlaybackService;"
private const val VERSION_SWAP =
    "Lcom/music/bitchord/playback/PlaybackService\$smoothSwapCurrentTrackVersion\$1;"
private const val SMOOTH = "Lapp/bitchord/telegram/SmoothUpgrade;"
private const val PLAYER = "Landroidx/media3/common/Player;"
private const val MEDIA_ITEM = "Landroidx/media3/common/MediaItem;"

private fun Instruction.methodRef() = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Instruction.fieldRef() = (this as? ReferenceInstruction)?.reference as? FieldReference

/**
 * Routes BitChord's automatic quality upgrade through its own two-player version swap, so a better
 * copy is crossfaded in instead of replacing the source under the live player. Every reference is
 * read from BitChord's own launcher for that swap rather than assumed.
 */
private fun BytecodePatchContext.addSmoothUpgrade() {
    // 1. BitChord's version-swap launcher, inlined by R8 wherever its one caller ended up.
    val launcherClass =
        classDefByStrings("version swap deferred: Automix is mid-transition").singleOrNull()
            ?: throw PatchException("Version swap launcher not found")
    val launcher =
        launcherClass.methods.single { method ->
            method.implementation?.instructions?.any {
                it.opcode == Opcode.NEW_INSTANCE &&
                    ((it as ReferenceInstruction).reference
                            as com.android.tools.smali.dexlib2.iface.reference.TypeReference)
                        .type == VERSION_SWAP
            } == true
        }
    val code = launcher.implementation!!.instructions.toList()
    val created =
        code.indexOfFirst {
            it.opcode == Opcode.NEW_INSTANCE &&
                ((it as ReferenceInstruction).reference
                        as com.android.tools.smali.dexlib2.iface.reference.TypeReference)
                    .type == VERSION_SWAP
        }
    fun before(predicate: (Instruction) -> Boolean) =
        code.subList(0, created).lastOrNull(predicate)
            ?: throw PatchException("Version swap launcher layout changed")
    fun after(predicate: (Instruction) -> Boolean) =
        code.subList(created, code.size).firstOrNull(predicate)
            ?: throw PatchException("Version swap launcher layout changed")
    val constructor =
        after {
                it.methodRef()?.let { m ->
                    m.definingClass == VERSION_SWAP && m.name == "<init>"
                } == true
            }
            .methodRef()!!
    check(
        constructor.parameterTypes.map(CharSequence::toString) ==
            listOf(
                MEDIA_ITEM,
                SERVICE,
                "Z",
                "Landroidx/media3/exoplayer/ExoPlayer;",
                "Lcom/music/bitchord/data/model/Song;",
                "Lcom/music/bitchord/data/model/Song;",
                "I",
                "I",
                "Lkotlin/coroutines/Continuation;",
            )
    ) {
        "Version swap parameters changed: ${constructor.parameterTypes}"
    }
    val launch = after { it.methodRef()?.name == "launch\$default" }.methodRef()!!
    check(launch.parameterTypes.size == 4 && launch.parameterTypes[3] == "I") {
        "Coroutine launcher signature changed"
    }
    val job =
        after { it.opcode == Opcode.IPUT_OBJECT && it.fieldRef()?.name == "versionSwapJob" }
            .fieldRef()!!
    val generation =
        before { it.opcode == Opcode.IPUT && it.fieldRef()?.name == "versionSwapGeneration" }
            .fieldRef()!!
    val scope =
        before { it.opcode == Opcode.IGET_OBJECT && it.fieldRef()?.name == "scope" }.fieldRef()!!
    val dispatcher =
        before {
                it.opcode == Opcode.SGET_OBJECT &&
                    it.fieldRef()?.definingClass ==
                        "Lkotlinx/coroutines/internal/MainDispatcherLoader;"
            }
            .fieldRef()!!
    val cancel = before { it.methodRef()?.name == "cancel\$default" }.methodRef()!!
    val toSong = before { it.methodRef()?.name == "toSong" }.methodRef()!!
    val crossfade =
        before { it.opcode == Opcode.IGET_OBJECT && it.fieldRef()?.name == "crossfade" }
            .fieldRef()!!
    val transitioning = before { it.methodRef()?.name == "isTransitioning" }.methodRef()!!
    val service = mutableClassDefBy(SERVICE)
    val spare =
        service.fields.singleOrNull {
            it.name == "spare" && it.type == "Landroidx/media3/exoplayer/ExoPlayer;"
        } ?: throw PatchException("Standby player field not found")
    for (field in listOf(job, generation, scope, crossfade)) check(field.definingClass == SERVICE) {
        "Version swap state moved out of the service: $field"
    }
    fun ref(m: MethodReference) =
        "${m.definingClass}->${m.name}(${m.parameterTypes.joinToString("")})${m.returnType}"
    fun ref(f: FieldReference) = "${f.definingClass}->${f.name}:${f.type}"

    // 2. A static entry point the extension calls: starts the swap, or returns false.
    val entry =
        MutableMethod(
            ImmutableMethod(
                SERVICE,
                "bitchordSmoothSwap",
                listOf("Ljava/lang/Object;", PLAYER, "I", MEDIA_ITEM).map {
                    com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter(
                        it,
                        null,
                        null,
                    )
                },
                "Z",
                com.android.tools.smali.dexlib2.AccessFlags.PUBLIC.value or
                    com.android.tools.smali.dexlib2.AccessFlags.STATIC.value,
                null,
                null,
                ImmutableMethodImplementation(
                    20,
                    emptyList<Instruction>(),
                    emptyList(),
                    emptyList(),
                ),
            )
        )
    entry.addInstructionsWithLabels(
        0,
        """
        move-object/from16 v14, p0
        move-object/from16 v15, p1
        instance-of v0, v14, $SERVICE
        if-eqz v0, :no
        instance-of v0, v15, Landroidx/media3/exoplayer/ExoPlayer;
        if-eqz v0, :no
        check-cast v14, $SERVICE
        check-cast v15, Landroidx/media3/exoplayer/ExoPlayer;
        iget-object v0, v14, ${ref(crossfade)}
        if-eqz v0, :free
        invoke-virtual {v0}, ${ref(transitioning)}
        move-result v0
        if-nez v0, :no
        :free
        iget-object v0, v14, $SERVICE->spare:Landroidx/media3/exoplayer/ExoPlayer;
        if-eqz v0, :no
        invoke-interface {v15}, $PLAYER->getCurrentMediaItem()$MEDIA_ITEM
        move-result-object v0
        if-eqz v0, :no
        invoke-static {v0}, ${ref(toSong)}
        move-result-object v1
        invoke-static/range {p3 .. p3}, ${ref(toSong)}
        move-result-object v2
        iget-object v0, v14, ${ref(job)}
        if-eqz v0, :nojob
        invoke-static {v0}, ${ref(cancel)}
        :nojob
        iget v3, v14, ${ref(generation)}
        add-int/lit8 v3, v3, 0x1
        iput v3, v14, ${ref(generation)}
        new-instance v4, $VERSION_SWAP
        move-object/from16 v5, p3
        move-object v6, v14
        const/4 v7, 0x0
        move-object v8, v15
        move-object v9, v1
        move-object v10, v2
        move/from16 v11, p2
        move v12, v3
        const/4 v13, 0x0
        invoke-direct/range {v4 .. v13}, ${ref(constructor)}
        iget-object v0, v14, ${ref(scope)}
        sget-object v1, ${ref(dispatcher)}
        const/4 v2, 0x2
        invoke-static {v0, v1, v4, v2}, ${ref(launch)}
        move-result-object v0
        iput-object v0, v14, ${ref(job)}
        const/4 v0, 0x1
        return v0
        :no
        const/4 v0, 0x0
        return v0
    """,
    )
    service.methods.add(entry)
    check(spare.type == "Landroidx/media3/exoplayer/ExoPlayer;")

    // 3. The upgrade's commit point: replaceMediaItem, seekTo, prepare on the live player.
    val upgrade =
        classDefByStrings("upgrade abandoned: its stream was dropped while it was being proved")
            .singleOrNull() ?: throw PatchException("Quality upgrade commit not found")
    val commit =
        mutableClassDefBy(upgrade).methods.single { method ->
            method.implementation?.instructions?.any {
                ((it as? ReferenceInstruction)?.reference as? StringReference)?.string ==
                    "bitchord.qualityUpgraded"
            } == true
        }
    val steps = commit.implementation!!.instructions.toList()
    val marker =
        steps.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string ==
                "bitchord.qualityUpgraded"
        }
    val logged =
        steps.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "upgraded to "
        }
    check(marker in 0 until logged) { "Quality upgrade commit layout changed" }
    fun call(name: String, parameters: List<String>): Int {
        val found =
            (marker until logged).filter { index ->
                steps[index].opcode == Opcode.INVOKE_INTERFACE &&
                    steps[index].methodRef()?.let {
                        it.definingClass == PLAYER &&
                            it.name == name &&
                            it.parameterTypes.map(CharSequence::toString) == parameters
                    } == true
            }
        check(found.size == 1) { "Quality upgrade $name call changed" }
        return found.single()
    }
    val replace = call("replaceMediaItem", listOf("I", MEDIA_ITEM))
    val seek = call("seekTo", listOf("I", "J"))
    val prepare = call("prepare", emptyList())
    check(replace < seek && seek < prepare) { "Quality upgrade call order changed" }
    val owner =
        steps.subList(0, replace).lastOrNull {
            it.opcode == Opcode.IPUT_OBJECT && it.fieldRef()?.name == "swappingMediaId"
        } as? TwoRegisterInstruction ?: throw PatchException("Upgrade service register not found")
    val r = steps[replace] as FiveRegisterInstruction
    val s = steps[seek] as FiveRegisterInstruction
    val p = steps[prepare] as FiveRegisterInstruction
    check(owner.registerB < 16 && r.registerC == s.registerC && r.registerC == p.registerC) {
        "Quality upgrade player register changed"
    }
    commit.replaceInstruction(
        prepare,
        "invoke-static {v${p.registerC}}, $SMOOTH->prepare($PLAYER)V",
    )
    commit.replaceInstruction(
        seek,
        "invoke-static {v${s.registerC}, v${s.registerD}, v${s.registerE}, v${s.registerF}}, $SMOOTH->seekTo(${PLAYER}IJ)V",
    )
    commit.replaceInstruction(
        replace,
        "invoke-static {v${owner.registerB}, v${r.registerC}, v${r.registerD}, v${r.registerE}}, $SMOOTH->replace(Ljava/lang/Object;${PLAYER}I$MEDIA_ITEM)V",
    )
    println("Routed quality upgrades through BitChord's two-player version swap")

    // 4. The offset between the two copies: BitChord takes it as zero for the same song, so the
    // one measured for this upgrade is handed over first.
    val alignment =
        service.methods.singleOrNull {
            it.name == "access\$prepareVersionAlignment" &&
                it.parameterTypes.map(CharSequence::toString) ==
                    listOf(
                        SERVICE,
                        "Lcom/music/bitchord/data/model/Song;",
                        "Lcom/music/bitchord/data/model/Song;",
                        "J",
                        "Lkotlin/coroutines/jvm/internal/ContinuationImpl;",
                    )
        } ?: throw PatchException("Version alignment not found")
    check(alignment.implementation!!.registerCount - 6 >= 1) { "Version alignment has no locals" }
    alignment.addInstructionsWithLabels(
        0,
        """
        invoke-static {}, $SMOOTH->alignedOffset()Ljava/lang/Long;
        move-result-object v0
        if-eqz v0, :measure
        return-object v0
        :measure
        nop
    """,
    )

    // 5. The sink's playing position, so the audio heard can be put on the song's timeline.
    val sink = mutableClassDefBy("Lcom/music/bitchord/playback/audio/PrecisionAudioSink;")
    val position =
        sink.methods.single {
            it.name == "getCurrentPositionUs" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("Z") &&
                it.returnType == "J"
        }
    val read = position.implementation!!.instructions.toList()
    val asked =
        read.indexOfFirst {
            it.methodRef()?.let { m ->
                m.definingClass == "Landroidx/media3/exoplayer/audio/DefaultAudioSink;" &&
                    m.name == "getCurrentPositionUs"
            } == true
        }
    check(asked >= 0 && read[asked + 1].opcode == Opcode.MOVE_RESULT_WIDE) {
        "Audio sink position read changed"
    }
    val result = (read[asked + 1] as OneRegisterInstruction).registerA
    val self = position.implementation!!.registerCount - 2
    check(result < 15 && self < 16) { "Audio sink position registers out of range" }
    position.addInstructions(
        asked + 2,
        """
        invoke-static {v$self, v$result, v${result + 1}}, $ALIGN->position(Ljava/lang/Object;J)J
        move-result-wide v$result
    """,
    )
    println("Lined up quality upgrades with the copy they replace")

    // 6. Before the crossfade, BitChord waits up to 300 ms for the new copy to be ready. That
    // wait is held until it plays in step with the old one, for up to 2.6 seconds.
    val swapClass = mutableClassDefBy(VERSION_SWAP)
    val run = swapClass.methods.single { it.name == "invokeSuspend" }
    val body = run.implementation!!.instructions.toList()
    val waits =
        body.indices.filter {
            body[it].opcode == Opcode.CONST_WIDE_16 &&
                (body[it] as WideLiteralInstruction).wideLiteral == 300L
        }
    check(waits.size == 1) { "Version swap wait changed" }
    val wait = waits.single()
    val state =
        (wait until body.size).firstOrNull {
            body[it].methodRef()?.let { m ->
                m.definingClass == PLAYER && m.name == "getPlaybackState"
            } == true
        } ?: throw PatchException("Version swap readiness check not found")
    val asks = body[state]
    val player =
        when (asks) {
            is RegisterRangeInstruction -> {
                check(asks.registerCount == 1) { "Version swap readiness check changed" }
                asks.startRegister
            }
            is FiveRegisterInstruction -> asks.registerC
            else -> throw PatchException("Version swap readiness check changed")
        }
    check(body[state + 1].opcode == Opcode.MOVE_RESULT) { "Version swap readiness check changed" }
    run.replaceInstruction(
        state,
        "invoke-static/range {v$player .. v$player}, $SMOOTH->settled($PLAYER)I",
    )
    val waitRegister = (body[wait] as OneRegisterInstruction).registerA
    run.replaceInstruction(wait, "const-wide/16 v$waitRegister, 0xa28")
    println("Held the upgrade's crossfade until the new copy plays in step")
}

private const val ALIGN = "Lapp/bitchord/telegram/VersionAlign;"

private const val SONG = "Lcom/music/bitchord/data/model/Song;"
private const val TEXT_KT = "Landroidx/compose/material3/TextKt;"
private const val WEIGHT = "Landroidx/compose/foundation/layout/LayoutWeightElement;"

/** 10.sp as Compose packs it: unit type SP in the high bits, the float's bits in the low ones. */
private const val TEN_SP = 0x141200000L

/** White, as Compose packs an sRGB colour. */
private const val WHITE = -0x100000000L
private const val LEGEND = "Lapp/bitchord/telegram/FormatLegend;"

/**
 * Adds the "FLAC 24bit" legend after a song title. BitChord draws every song title (search rows,
 * mini player, queue) through one ExplicitSongTitle composable: its title Text is made to hug its
 * text, and the same Text call is made again with the legend at 10sp. The legend is always emitted,
 * as "" when there's nothing to show, so the composition's shape never changes.
 */
private fun BytecodePatchContext.addFormatLegend() {
    val songText =
        mutableClassDefBy("Lcom/music/bitchord/ui/components/SongTextKt;").methods.single {
            it.name.startsWith("ExplicitSongTitle") && it.parameterTypes.firstOrNull() == SONG
        }
    val code = songText.implementation!!.instructions.toList()
    val texts =
        code.withIndex().filter { (_, it) ->
            it.opcode == Opcode.INVOKE_STATIC_RANGE &&
                it.methodRef()?.let { m ->
                    m.definingClass == TEXT_KT && m.name.startsWith("Text")
                } == true
        }
    check(texts.size == 1) { "Song title Text call changed" }
    val textIndex = texts.single().index
    val call = code[textIndex] as RegisterRangeInstruction
    val text = call.methodRef()!!
    val types = text.parameterTypes.map(CharSequence::toString)
    // Register of each parameter within the range; J takes two.
    val slots = mutableListOf<Int>()
    var next = call.startRegister
    for (type in types) {
        slots += next
        next += if (type == "J" || type == "D") 2 else 1
    }
    check(next == call.startRegister + call.registerCount) { "Text call register layout changed" }
    check(
        types.take(4) == listOf("Ljava/lang/String;", "Landroidx/compose/ui/Modifier;", "J", "J") &&
            types.contains("Landroidx/compose/ui/text/TextStyle;") &&
            types.takeLast(4) == listOf("Landroidx/compose/runtime/ComposerImpl;", "I", "I", "I")
    ) {
        "Text parameters changed: $types"
    }
    val maskRegister = slots.last()
    val maskWrite =
        code.subList(0, textIndex).lastOrNull {
            it is OneRegisterInstruction && it.registerA == maskRegister
        } as? NarrowLiteralInstruction ?: throw PatchException("Text default mask not found")
    // Bit 3 marks fontSize as defaulted; clear it so the legend's size applies.
    val mask = maskWrite.narrowLiteral and 8.inv()

    songText.addInstructions(
        textIndex + 1,
        """
        invoke-static/range {p0 .. p0}, Lapp/bitchord/telegram/FormatLegend;->text($SONG)Ljava/lang/String;
        move-result-object v${slots[0]}
        invoke-static {v${slots[0]}}, Lapp/bitchord/telegram/FormatLegend;->modifier(Ljava/lang/String;)Ljava/lang/Object;
        move-result-object v${slots[1]}
        check-cast v${slots[1]}, Landroidx/compose/ui/Modifier;
        const-wide v${slots[2]}, -0x100000000L
        const-wide v${slots[3]}, 0x${TEN_SP.toString(16)}L
        const v${slots[slots.size - 3]}, 0x0
        const v${slots[slots.size - 2]}, 0x0
        const v${slots.last()}, $mask
        invoke-static/range {v${call.startRegister} .. v${next - 1}}, ${text.definingClass}->${text.name}(${types.joinToString("")})${text.returnType}
    """,
    )

    val added = songText.implementation!!.instructions.toList()
    check(
        added.count {
            it.methodRef()?.let { m -> m.definingClass == TEXT_KT && m.name == text.name } == true
        } == 2 &&
            added.any {
                it.opcode == Opcode.CONST_WIDE &&
                    (it as com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction)
                        .wideLiteral == TEN_SP
            }
    ) {
        "Format legend Text call wasn't added"
    }
    check(
        added.any {
            it.opcode == Opcode.CONST_WIDE &&
                (it as com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction)
                    .wideLiteral == WHITE
        } && added.count { it.methodRef()?.definingClass == LEGEND } == 2
    ) {
        "Format legend chip wasn't added"
    }

    // weight(1f) → weight(1f, fill = false), so the legend sits right after the title.
    val weightIndex =
        code.indexOfFirst {
            it.opcode == Opcode.INVOKE_DIRECT &&
                it.methodRef()?.let { m -> m.definingClass == WEIGHT && m.name == "<init>" } == true
        }
    check(weightIndex in 0 until textIndex) { "Title weight not found" }
    val weight = code[weightIndex] as FiveRegisterInstruction
    val fill = weight.registerE
    val fillWrite =
        code.subList(0, weightIndex).lastOrNull {
            it is OneRegisterInstruction && it.registerA == fill
        } as? NarrowLiteralInstruction
    check(fillWrite?.narrowLiteral == 1 && fill < 16) { "Title weight fill changed" }
    songText.addInstructions(weightIndex, "const/4 v$fill, 0x0")
    songText.addInstructions(weightIndex + 2, "const/4 v$fill, 0x1")
    linkLegendHelpers()
    // A main search also looks for the query in the selected Telegram chats.
    val request =
        mutableClassDefBy("Lcom/music/bitchord/ui/MainViewModel\$SearchRequest;").methods.single {
            it.name == "<init>" && it.parameterTypes.firstOrNull() == "Ljava/lang/String;"
        }
    request.addInstruction(
        0,
        "invoke-static/range {p1 .. p1}, $LEGEND->searching(Ljava/lang/String;)V",
    )
    println("Added the format legend after song titles")
}

/**
 * Fills FormatLegend's placeholders with calls to BitChord's own padding, background and
 * rounded-shape functions, found by their signatures wherever R8 placed them.
 */
private fun BytecodePatchContext.linkLegendHelpers() {
    val modifier = "Landroidx/compose/ui/Modifier;"
    val shapeType = "Landroidx/compose/ui/graphics/Shape;"
    var padding: MethodReference? = null
    var background: MethodReference? = null
    var shape: MethodReference? = null
    classDefForEach { clazz ->
        for (method in clazz.methods) {
            val types = method.parameterTypes.map(CharSequence::toString)
            val public =
                method.accessFlags and com.android.tools.smali.dexlib2.AccessFlags.STATIC.value !=
                    0 &&
                    method.accessFlags and
                        com.android.tools.smali.dexlib2.AccessFlags.PUBLIC.value != 0
            if (!public) continue
            if (
                method.name.startsWith("padding-") &&
                    types == listOf(modifier, "F", "F", "F", "F") &&
                    method.returnType == modifier
            )
                padding = method
            if (
                method.name.startsWith("background-") &&
                    types == listOf(modifier, "J", shapeType) &&
                    method.returnType == modifier
            )
                background = method
            if (
                method.name.startsWith("RoundedCornerShape-") &&
                    types == listOf("F") &&
                    method.returnType == "Landroidx/compose/foundation/shape/RoundedCornerShape;"
            )
                shape = method
        }
    }
    fun ref(m: MethodReference?, what: String): String {
        m ?: throw PatchException("Compose $what function not found")
        return "${m.definingClass}->${m.name}(${m.parameterTypes.joinToString("")})${m.returnType}"
    }
    val legend = mutableClassDefBy(LEGEND)
    fun body(name: String, registers: Int, code: String) {
        val original = legend.methods.single { it.name == name }
        val replacement =
            MutableMethod(
                ImmutableMethod(
                    original.definingClass,
                    original.name,
                    original.parameters,
                    original.returnType,
                    original.accessFlags,
                    original.annotations,
                    original.hiddenApiRestrictions,
                    ImmutableMethodImplementation(
                        registers,
                        emptyList<Instruction>(),
                        emptyList(),
                        emptyList(),
                    ),
                )
            )
        replacement.addInstructions(0, code)
        legend.methods.remove(original)
        legend.methods.add(replacement)
    }
    body(
        "hostPadding",
        5,
        """
        check-cast p0, $modifier
        invoke-static {p0, p1, p2, p3, p4}, ${ref(padding, "padding")}
        move-result-object p0
        return-object p0
    """,
    )
    body(
        "hostBackground",
        4,
        """
        check-cast p0, $modifier
        check-cast p3, $shapeType
        invoke-static {p0, p1, p2, p3}, ${ref(background, "background")}
        move-result-object p0
        return-object p0
    """,
    )
    body(
        "hostShape",
        1,
        """
        invoke-static {p0}, ${ref(shape, "rounded shape")}
        move-result-object p0
        return-object p0
    """,
    )
}

/**
 * Telegram files face a stricter title check before BitChord's matcher can pick one for a song: the
 * candidate list is filtered first in TrackMatcher.best and .ranked, where its scoring was inlined.
 */
private fun BytecodePatchContext.addStricterTelegramMatch() {
    val target = "Lcom/music/bitchord/data/sources/TrackMatcher\$Target;"
    val matcher = mutableClassDefBy("Lcom/music/bitchord/data/sources/TrackMatcher;")
    var hooked = 0
    for (method in matcher.methods.toList()) {
        if (method.name != "best" && method.name != "ranked") continue
        check(
            method.parameterTypes.map(CharSequence::toString) == listOf("Ljava/util/List;", target)
        ) {
            "TrackMatcher.${method.name} parameters changed"
        }
        method.addInstructions(
            0,
            """
            invoke-static/range {p0 .. p1}, Lapp/bitchord/telegram/TelegramMatch;->filter(Ljava/util/List;$target)Ljava/util/List;
            move-result-object p0
        """,
        )
        hooked++
    }
    check(hooked == 2) { "TrackMatcher best/ranked not found" }
    println("Added the stricter title check for Telegram files")
}

@Suppress("unused")
val secondInstallationPatch =
    bytecodePatch(
        name = "Install as Bitchord+",
        description =
            "Installs next to your regular BitChord as Bitchord+, or under a name you choose.",
        default = true,
    ) {
        compatibleWith(target)
        installationNameOption()
        dependsOn(cloneResources)
        execute {
            var changed = 0
            for (originalClass in getAllClassesWithStrings()) {
                // Inspect immutable classes first; make only matching classes mutable.
                if (
                    originalClass.methods.none { method ->
                        method.implementation?.instructions?.any { instruction ->
                            val ref =
                                (instruction as? ReferenceInstruction)?.reference
                                    as? StringReference
                            ref != null && cloneStrings.containsKey(ref.string)
                        } == true
                    }
                )
                    continue
                val clazz = mutableClassDefBy(originalClass)
                for (method in clazz.methods) {
                    val instructions = method.implementation?.instructions ?: continue
                    for ((index, instruction) in instructions.withIndex()) {
                        val old =
                            ((instruction as? ReferenceInstruction)?.reference as? StringReference)
                                ?.string ?: continue
                        val replacement = cloneStrings[old] ?: continue
                        val register = (instruction as OneRegisterInstruction).registerA
                        val reference = ImmutableStringReference(replacement)
                        method.replaceInstruction(
                            index,
                            if (instruction.opcode == Opcode.CONST_STRING_JUMBO)
                                BuilderInstruction31c(
                                    Opcode.CONST_STRING_JUMBO,
                                    register,
                                    reference,
                                )
                            else BuilderInstruction21c(Opcode.CONST_STRING, register, reference),
                        )
                        changed++
                    }
                }
            }
            println("Isolated $changed package, authority, permission and launcher references")
        }
    }

@Suppress("unused")
val nativeTelegramPatch =
    bytecodePatch(
        name = "Unofficial Telegram music",
        description =
            "Search and play audio from your own Telegram channels, right on your phone. Android 8 or newer.",
        default = true,
    ) {
        compatibleWith(target)
        applicationIdOption()
        applicationHashOption()
        dependsOn(telegramResources)
        extendWith("extensions/telegram.mpe")
        execute {
            // AddonClient's original coroutine still supplies Dispatchers.IO. Only
            // the reserved native identifier is answered directly; external addons
            // retain their original HTTP implementation.
            val addonBodyClass = "Lcom/music/bitchord/download/Downloads\$run\$2;"
            val addonBody =
                mutableClassDefBy(addonBodyClass).methods.single {
                    it.name ==
                        "invokeSuspend\$com\$music\$bitchord\$data\$sources\$addon\$AddonClient\$body\$2" &&
                        it.parameterTypes == listOf("Ljava/lang/Object;") &&
                        it.returnType == "Ljava/lang/Object;"
                }
            check(addonBody.implementation!!.registerCount == 14) {
                "Addon IO coroutine registers changed"
            }
            check(
                addonBody.implementation!!.instructions.any {
                    val ref = (it as? ReferenceInstruction)?.reference as? FieldReference
                    ref?.definingClass == addonBodyClass &&
                        ref.name == "L\$0" &&
                        ref.type == "Ljava/lang/Object;"
                }
            ) {
                "Addon request capture changed"
            }
            // Continuations are existing host instructions, not labels at the end
            // of a separately assembled snippet. The latter have snippet-relative
            // locations and corrupt branches inserted at nonzero code addresses.
            val externalAddon = addonBody.implementation!!.instructions.first()
            addonBody.addInstructionsWithLabels(
                0,
                """
            iget-object v0, p0, $addonBodyClass->L${'$'}0:Ljava/lang/Object;
            check-cast v0, Ljava/lang/String;
            invoke-static {v0}, Lapp/bitchord/telegram/InternalAddon;->bodyOrNull(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v0
            if-eqz v0, :external_addon
            return-object v0
        """,
                ExternalLabel("external_addon", externalAddon),
            )
            // Wrap the downstream after resolution. Placing a router above the
            // resolver would miss Telegram substitutes for ordinary YouTube items.
            val resolving = mutableClassDefBy("Landroidx/media3/datasource/ResolvingDataSource;")
            val resolvingConstructor = resolving.methods.single { it.name == "<init>" }
            check(
                resolvingConstructor.parameterTypes.first() ==
                    "Landroidx/media3/datasource/DataSource;"
            )
            val superCall =
                resolvingConstructor.implementation!!.instructions.indexOfFirst {
                    val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
                    ref?.definingClass == "Ljava/lang/Object;" && ref.name == "<init>"
                }
            check(superCall >= 0)
            resolvingConstructor.addInstructions(
                superCall + 1,
                """
            invoke-static {p1}, Lapp/bitchord/telegram/TelegramDataSource;->wrap(Landroidx/media3/datasource/DataSource;)Landroidx/media3/datasource/DataSource;
            move-result-object p1
        """,
            )
            // R8 merged fetchDirect into this coroutine. Keep its original IO
            // dispatcher, cancellation context, sink and progress callback.
            val downloadClass = "Lcom/music/bitchord/wear/WearBridge\$sendToWatch\$1;"
            val directDownload =
                mutableClassDefBy(downloadClass).methods.single { it.name == "invokeSuspend" }
            val directCode = directDownload.implementation!!.instructions.toList()
            check(directDownload.implementation!!.registerCount == 29)
            val downloadIndex = 468
            check(
                directCode[downloadIndex].opcode == Opcode.NEW_INSTANCE &&
                    ((directCode[downloadIndex] as ReferenceInstruction).reference.toString() ==
                        "Lokhttp3/Request\$Builder;")
            ) {
                "Direct download branch changed"
            }
            check(
                directCode.subList(downloadIndex, downloadIndex + 140).any {
                    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string ==
                        "fetched "
                }
            ) {
                "Direct download body changed"
            }
            check(
                classDefBy("Lkotlinx/coroutines/JobKt;").methods.any {
                    it.name == "ensureActive" &&
                        it.parameterTypes == listOf("Lkotlin/coroutines/CoroutineContext;")
                }
            )
            directDownload.addInstructionsWithLabels(
                downloadIndex,
                """
            iget-object v4, v1, $downloadClass->${'$'}path:Ljava/lang/Object;
            check-cast v4, Ljava/lang/String;
            invoke-static {v4}, Lapp/bitchord/telegram/InternalAddon;->reserved(Ljava/lang/String;)Z
            move-result v5
            if-eqz v5, :external_download
            iget-object v5, v1, $downloadClass->${'$'}app:Ljava/lang/Object;
            check-cast v5, Ljava/io/OutputStream;
            iget-object v6, v1, $downloadClass->${'$'}payload:Ljava/lang/Object;
            check-cast v6, Lkotlin/jvm/functions/Function2;
            invoke-interface {v0}, Lkotlinx/coroutines/CoroutineScope;->getCoroutineContext()Lkotlin/coroutines/CoroutineContext;
            move-result-object v7
            invoke-static {v4, v5, v6, v7}, Lapp/bitchord/telegram/NativeDownloads;->fetch(Ljava/lang/String;Ljava/io/OutputStream;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/CoroutineContext;)Ljava/lang/Long;
            move-result-object v4
            return-object v4
        """,
                ExternalLabel("external_download", directCode[downloadIndex]),
            )
            println(
                "Installed internal Telegram metadata calls and Media3 data source; no local HTTP listener"
            )
            // The UI shim links only to these verified, host-provided Compose signatures.
            val settings = classDefBy("Lcom/music/bitchord/ui/screens/SettingsSheetKt;")
            val rowParameters =
                listOf(
                    "Landroidx/compose/ui/graphics/vector/ImageVector;",
                    "Ljava/lang/String;",
                    "Ljava/lang/String;",
                    "Lkotlin/jvm/functions/Function2;",
                    "Ljava/lang/String;",
                    "Ljava/lang/String;",
                    "Z",
                    "Landroidx/compose/ui/graphics/painter/Painter;",
                    "Lkotlin/jvm/functions/Function0;",
                    "Lkotlin/jvm/functions/Function2;",
                    "Landroidx/compose/runtime/ComposerImpl;",
                    "I",
                    "I",
                )
            check(
                settings.methods.any {
                    it.name == "SettingsRow" &&
                        it.parameterTypes == rowParameters &&
                        it.returnType == "V"
                }
            ) {
                "Settings row signature changed"
            }
            data class UiHook(
                val classType: String,
                val methodName: String,
                val parameters: List<String>,
                val index: Int,
                val register: Int,
                val target: String,
            )
            val hooks = mutableListOf<UiHook>()
            classDefForEach { clazz ->
                clazz.methods.forEach { candidate ->
                    val instructions =
                        candidate.implementation?.instructions?.toList() ?: return@forEach
                    instructions.forEachIndexed { index, instruction ->
                        val ref =
                            (instruction as? ReferenceInstruction)?.reference as? MethodReference
                                ?: return@forEachIndexed
                        if (
                            clazz.type == "Lcom/music/bitchord/ui/screens/DiscordScreenKt;" &&
                                candidate.name == "AccountAndScrobblingScreen" &&
                                ref.definingClass ==
                                    "Lcom/music/bitchord/ui/screens/SettingsSheetKt;" &&
                                ref.name.startsWith("SettingsGroup-") &&
                                hooks.none { it.target == "accountSection" }
                        ) {
                            check(
                                ref.parameterTypes ==
                                    listOf(
                                        "Ljava/lang/String;",
                                        "Ljava/lang/String;",
                                        "F",
                                        "Landroidx/compose/runtime/internal/ComposableLambdaImpl;",
                                        "Landroidx/compose/runtime/ComposerImpl;",
                                        "I",
                                        "I",
                                    )
                            )
                            hooks +=
                                UiHook(
                                    clazz.type,
                                    candidate.name,
                                    candidate.parameterTypes.map { it.toString() },
                                    index + 1,
                                    argumentRegisters(instruction)[4],
                                    "accountSection",
                                )
                        }
                    }
                }
            }
            check(hooks.count { it.target == "accountSection" } == 1) {
                "Account settings insertion point is not unique"
            }
            // Keep the account entry in its existing outer Compose group.
            for (hook in hooks.sortedByDescending { it.index }) {
                val method =
                    mutableClassDefBy(hook.classType).methods.single {
                        it.name == hook.methodName && it.parameterTypes == hook.parameters
                    }
                method.addInstruction(
                    hook.index,
                    "invoke-static/range {v${hook.register} .. v${hook.register}}, Lapp/bitchord/telegram/TelegramUi;->${hook.target}(Landroidx/compose/runtime/ComposerImpl;)V",
                )
            }
            val group =
                settings.methods.single {
                    it.name.startsWith("SettingsGroup-") &&
                        it.parameterTypes ==
                            listOf(
                                "Ljava/lang/String;",
                                "Ljava/lang/String;",
                                "F",
                                "Landroidx/compose/runtime/internal/ComposableLambdaImpl;",
                                "Landroidx/compose/runtime/ComposerImpl;",
                                "I",
                                "I",
                            )
                }
            val painter =
                classDefBy("Lkotlin/reflect/TypesJVMKt;").methods.single {
                    it.name == "painterResource" &&
                        it.parameterTypes == listOf("I", "Landroidx/compose/runtime/ComposerImpl;")
                }
            val ui = mutableClassDefBy("Lapp/bitchord/telegram/TelegramUi;")
            fun linkedMethod(name: String, registers: Int, code: String) {
                val original = ui.methods.single { it.name == name }
                val replacement =
                    MutableMethod(
                        ImmutableMethod(
                            original.definingClass,
                            original.name,
                            original.parameters,
                            original.returnType,
                            original.accessFlags,
                            original.annotations,
                            original.hiddenApiRestrictions,
                            ImmutableMethodImplementation(
                                registers,
                                emptyList<Instruction>(),
                                emptyList(),
                                emptyList(),
                            ),
                        )
                    )
                replacement.addInstructions(0, code)
                ui.methods.remove(original)
                ui.methods.add(replacement)
            }
            linkedMethod(
                "hostGroup",
                8,
                "invoke-static/range {p0 .. p6}, ${group.definingClass}->${group.name}(Ljava/lang/String;Ljava/lang/String;FLandroidx/compose/runtime/internal/ComposableLambdaImpl;Landroidx/compose/runtime/ComposerImpl;II)V\nreturn-void",
            )
            linkedMethod(
                "hostPainter",
                3,
                "invoke-static/range {p0 .. p1}, ${painter.definingClass}->${painter.name}(ILandroidx/compose/runtime/ComposerImpl;)Landroidx/compose/ui/graphics/painter/Painter;\nmove-result-object p0\nreturn-object p0",
            )
            check(
                classDefBy("Landroidx/compose/runtime/internal/ComposableLambdaImpl;").methods.any {
                    it.name == "<init>" &&
                        it.parameterTypes == listOf("Ljava/lang/Object;", "Z", "I")
                }
            ) {
                "Compose lambda constructor changed"
            }
            println(
                "Added standalone Telegram settings section and icon; Sources setup row omitted"
            )
            // Extend the existing stats overlay, retaining all host source-selection and
            // generation checks. These signatures/operands are pinned to optimized 1.8.1.
            val snapshotType = "Lcom/music/bitchord/data/NerdStats\$Snapshot;"
            val statsType = "Lapp/bitchord/telegram/PlaybackStats;"
            val snapshot = classDefBy(snapshotType)
            for ((name, type) in
                listOf(
                    "mimeType" to "Ljava/lang/String;",
                    "sourceName" to "Ljava/lang/String;",
                    "bitrateKbps" to "Ljava/lang/Integer;",
                )) {
                check(
                    snapshot.fields.any {
                        it.name == name && it.type == type && (it.accessFlags and 1) != 0
                    }
                ) {
                    "Stats snapshot field changed: $name"
                }
            }
            // A tap on the Telegram row in Sources opens the Telegram settings page instead of
            // the generic editor, which would only show the internal add-on address.
            val rowLambda =
                mutableClassDefBy(
                    "Lcom/music/bitchord/ui/screens/SourcesScreenKt\$\$ExternalSyntheticLambda32;"
                )
            val rowInvoke =
                rowLambda.methods.single { it.name == "invoke" && it.parameterTypes.size == 5 }
            val rowCode = rowInvoke.implementation!!.instructions.toList()
            val needsServer =
                rowCode.indexOfFirst {
                    val ref = (it as? ReferenceInstruction)?.reference as? FieldReference
                    ref?.definingClass == "Lcom/music/bitchord/data/sources/SourceKind;" &&
                        ref.name == "needsServer"
                }
            check(needsServer >= 0) { "Source row click decision missing" }
            val editorLoad =
                (needsServer + 1 until minOf(needsServer + 8, rowCode.size)).single {
                    val ref = (rowCode[it] as? ReferenceInstruction)?.reference as? FieldReference
                    rowCode[it].opcode == Opcode.IGET_OBJECT &&
                        ref?.definingClass == rowLambda.type &&
                        ref.type == "Lkotlin/jvm/functions/Function1;"
                }
            val editor = (rowCode[editorLoad] as TwoRegisterInstruction).registerA
            val clickLambda =
                (editorLoad + 1 until minOf(editorLoad + 24, rowCode.size)).single {
                    val ref = (rowCode[it] as? ReferenceInstruction)?.reference as? MethodReference
                    rowCode[it].opcode == Opcode.INVOKE_DIRECT &&
                        ref?.name == "<init>" &&
                        ref.parameterTypes ==
                            listOf("Ljava/lang/Object;", "Ljava/lang/Object;", "I")
                }
            check(
                editor < 16 && (rowCode[clickLambda] as FiveRegisterInstruction).registerD == editor
            ) {
                "Source row click callback register changed"
            }
            rowInvoke.addInstructions(
                editorLoad + 1,
                """
                invoke-static {v$editor}, Lapp/bitchord/telegram/SourceEditorRoute;->wrap(Lkotlin/jvm/functions/Function1;)Lkotlin/jvm/functions/Function1;
                move-result-object v$editor
            """,
            )
            val playback = mutableClassDefBy("Lcom/music/bitchord/playback/PlaybackService;")
            // Actual player events, not metadata reads/download prefetch, acknowledge direct
            // Telegram items.
            val playing =
                mutableClassDefBy(
                        "Lcom/music/bitchord/playback/PlaybackService\$playbackListener\$1;"
                    )
                    .methods
                    .single {
                        it.name == "onIsPlayingChanged" &&
                            it.parameterTypes == listOf("Z") &&
                            it.returnType == "V"
                    }
            val playingCode = playing.implementation!!.instructions.toList()
            check(
                playing.implementation!!.registerCount == 12 &&
                    playingCode.size > 4 &&
                    playingCode[3].opcode == Opcode.RETURN_VOID
            ) {
                "Playing callback layout changed"
            }
            val playerField =
                (playingCode[1] as? ReferenceInstruction)?.reference as? FieldReference
            check(
                playerField?.definingClass == playback.type &&
                    playerField.name == "player" &&
                    playerField.type == "Landroidx/media3/exoplayer/ExoPlayer;" &&
                    (playingCode[1] as? TwoRegisterInstruction)?.registerA == 1
            ) {
                "Playing callback player register changed"
            }
            playing.addInstruction(
                2,
                "invoke-static {v1, p1}, Lapp/bitchord/telegram/PlaybackPolicy;->onState(Landroidx/media3/common/Player;Z)V",
            )
            val transition =
                playback.methods.single {
                    it.name == "onTrackBecameCurrent" &&
                        it.parameterTypes ==
                            listOf("Landroidx/media3/common/MediaItem;", "Z", "I", "Z") &&
                        it.returnType == "V"
                }
            check(transition.implementation!!.registerCount == 59) {
                "Current-track callback layout changed"
            }
            transition.addInstructions(
                0,
                """
                move-object/from16 v0, p0
                iget-object v0, v0, ${playback.type}->player:Landroidx/media3/exoplayer/ExoPlayer;
                invoke-static {v0}, Lapp/bitchord/telegram/PlaybackPolicy;->onTransition(Landroidx/media3/common/Player;)V
            """,
            )
            val publish =
                playback.methods.single {
                    it.name == "access\$publishNerdStats" &&
                        it.parameterTypes == listOf(playback.type) &&
                        it.returnType == "V"
                }
            val publishCode = publish.implementation!!.instructions.toList()
            val lossless =
                publishCode.indexOfFirst {
                    val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
                    ref?.definingClass == "Lcom/music/bitchord/data/sources/StreamFormat;" &&
                        ref.name == "isLossless"
                }
            check(lossless >= 0) { "Lossless stats branch missing" }
            val blankIndex = lossless + 8
            val blank = publishCode[blankIndex] as? TwoRegisterInstruction
            check(
                publishCode[blankIndex].opcode == Opcode.MOVE_OBJECT &&
                    blank?.registerA == 0 &&
                    blank.registerB == 4 &&
                    publishCode[blankIndex + 1].opcode == Opcode.GOTO
            ) {
                "Lossless stats result layout changed"
            }
            val measureCall = publishCode[blankIndex + 3]
            val measureRef = (measureCall as? ReferenceInstruction)?.reference as? MethodReference
            check(
                measureRef?.name == "invoke" &&
                    measureRef.returnType == "Ljava/lang/Object;" &&
                    measureRef.parameterTypes.isEmpty()
            ) {
                "Rendition measurement callback changed"
            }
            check(
                classDefBy(measureRef!!.definingClass)
                    .interfaces
                    .contains("Lkotlin/jvm/functions/Function0;")
            ) {
                "Measurement callback is not Function0"
            }
            val lambdaRegister = argumentRegisters(measureCall).single()
            publish.replaceInstruction(
                blankIndex,
                "invoke-static {v$lambdaRegister}, $statsType->measureLossless(Lkotlin/jvm/functions/Function0;)Lkotlin/Pair;",
            )
            publish.addInstruction(blankIndex + 1, "move-result-object v0")
            val constructorIndex =
                publish.implementation!!.instructions.indexOfFirst {
                    val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
                    ref?.definingClass == snapshotType && ref.name == "<init>"
                }
            val constructor = publish.implementation!!.instructions[constructorIndex]
            val constructorArgs = argumentRegisters(constructor)
            check(constructorArgs == (5..16).toList()) { "Snapshot constructor arguments changed" }
            publish.addInstruction(
                constructorIndex + 1,
                "invoke-static {v5, v14}, $statsType->capture(${snapshotType}Lcom/music/bitchord/data/TelemetryProvenance;)V",
            )

            val controls = mutableClassDefBy("Lcom/music/bitchord/ui/player/PlayerControlsKt;")
            val sleeve =
                controls.methods.single {
                    it.name == "SleeveNerdStats" &&
                        it.parameterTypes ==
                            listOf(
                                "Lcom/music/bitchord/data/model/Song;",
                                "Landroidx/compose/ui/Modifier;",
                                "Landroidx/compose/runtime/ComposerImpl;",
                                "I",
                            )
                }
            val sleeveCode = sleeve.implementation!!.instructions.toList()
            check(sleeve.implementation!!.registerCount == 50) {
                "Stats overlay register layout changed"
            }
            val firstField =
                sleeveCode.indexOfFirst {
                    val ref = (it as? ReferenceInstruction)?.reference as? FieldReference
                    ref?.definingClass == snapshotType && ref.name == "mimeType"
                }
            val field = sleeveCode[firstField] as TwoRegisterInstruction
            check(field.registerB == 4) { "Stats snapshot register changed" }
            val join =
                sleeveCode.indexOfFirst {
                    val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
                    ref?.name == "joinToString\$default" && ref.returnType == "Ljava/lang/String;"
                }
            check(
                join > firstField && (sleeveCode[join + 1] as OneRegisterInstruction).registerA == 4
            ) {
                "Stats description layout changed"
            }
            // v45 is dead throughout this region and is redefined by the original
            // color setup later. Preserve the *same* snapshot used for the localized text.
            check(
                sleeveCode.subList(firstField, join + 2).none {
                    (it as? OneRegisterInstruction)?.registerA == 45 ||
                        (it as? TwoRegisterInstruction)?.registerB == 45 ||
                        (it is RegisterRangeInstruction &&
                            45 in it.startRegister until it.startRegister + it.registerCount) ||
                        (it is FiveRegisterInstruction && 45 in argumentRegisters(it))
                }
            ) {
                "Stats scratch register is live"
            }
            val textIndex =
                sleeveCode.indexOfFirst {
                    val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
                    ref?.definingClass == "Landroidx/compose/material3/TextKt;" &&
                        ref.name.startsWith("Text-")
                }
            check(
                textIndex > join && argumentRegisters(sleeveCode[textIndex]) == (2..24).toList()
            ) {
                "Stats Text call changed"
            }
            check(
                sleeveCode.subList(join + 2, textIndex).any {
                    (it as? OneRegisterInstruction)?.registerA == 17 &&
                        (it as? NarrowLiteralInstruction)?.narrowLiteral == 1
                }
            ) {
                "Stats maxLines argument changed"
            }
            // Work backwards so the previously inspected indices stay valid.
            sleeve.addInstruction(textIndex, "const/16 v17, 0x2")
            sleeve.addInstructions(
                join + 2,
                """
            move-object/from16 v11, v45
            invoke-static {v4, v11}, $statsType->decorate(Ljava/lang/String;$snapshotType)Ljava/lang/String;
            move-result-object v4
        """,
            )
            sleeve.addInstruction(firstField, "move-object/from16 v45, v4")
            println("Added active-source/bitrate stats and asynchronous lossless bitrate fallback")
            addSurroundDownmix()
            addSmoothUpgrade()
            addFormatLegend()
            addStricterTelegramMatch()
            val method = ApplicationCreate.method
            val implementation = method.implementation!!
            // After BitChord has finished initializing its own source registry.
            val returns =
                implementation.instructions
                    .withIndex()
                    .filter { it.value.opcode == Opcode.RETURN_VOID }
                    .map { it.index }
            check(returns.isNotEmpty()) { "Application startup hook not found" }
            for (index in returns.reversed()) method.addInstruction(
                index,
                "invoke-static/range {p0 .. p0}, Lapp/bitchord/telegram/TelegramBridge;->init(Landroid/content/Context;)V",
            )
        }
    }
