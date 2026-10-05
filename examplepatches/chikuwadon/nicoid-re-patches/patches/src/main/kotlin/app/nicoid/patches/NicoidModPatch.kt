package app.nicoid.patches

import app.morphe.patcher.patch.*
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.util.FieldUtil
import com.android.tools.smali.dexlib2.util.MethodUtil
import java.io.BufferedInputStream
import java.security.MessageDigest
import java.util.zip.ZipInputStream

private object Payload {
    fun open(name: String) = checkNotNull(javaClass.getResourceAsStream("/nicoid/$name")) {
        "Missing nicoid patch payload: $name"
    }
}

private val nicoid649 = Compatibility(
    name = "nicoid",
    packageName = "com.sauzask.nicoid",
    apkFileType = ApkFileType.APK,
    targets = listOf(AppTarget(version = "6.49"))
)

// Raw compiled resource differences preserve the exact IDs referenced by the original smali.
// Input DEX, manifest and resource table must match the supplied original before any write.
private val nicoidResources = rawResourcePatch {
    compatibleWith(nicoid649)
    execute {
        // RAW_ONLY stages compiled resources differently from decoded resource patches.
        val root = get("classes.dex").parentFile
        val workspace = root.parentFile
        fun original(path: String) = when (path) {
            "AndroidManifest.xml" -> workspace.resolve("AndroidManifest.xml.bin")
            "resources.arsc" -> workspace.resolve(path)
            else -> root.resolve(path)
        }
        Payload.open("input-hashes.txt").bufferedReader().useLines { lines ->
            lines.filter { it.isNotBlank() }.forEach { line ->
                val (expected, path) = line.split(" ", limit = 2)
                val digest = MessageDigest.getInstance("SHA-256")
                original(path).inputStream().use { input ->
                    val buffer = ByteArray(8192)
                    while (true) {
                        val size = input.read(buffer)
                        if (size < 0) break
                        digest.update(buffer, 0, size)
                    }
                }
                val actual = digest.digest().joinToString("") { "%02x".format(it.toInt() and 255) }
                check(actual == expected) { "Unsupported input APK: $path differs from the tested nicoid 6.49." }
            }
        }
        ZipInputStream(Payload.open("resources.zip")).use { zip ->
            while (true) {
                val entry = zip.nextEntry ?: break
                val path = entry.name
                check(!path.contains("..") && !path.startsWith("/") &&
                    (path == "AndroidManifest.xml" || path == "resources.arsc" || path.startsWith("res/")))
                // Root entries are the files Morphe carries into the rebuilt APK.
                // The raw decoder's .bin manifest is a read-only input for verification.
                val output = root.resolve(path)
                output.parentFile.mkdirs()
                val bytes = zip.readBytes()
                output.writeBytes(bytes)
                zip.closeEntry()
            }
        }
    }
}


@Suppress("unused")
val nicoidModPatch = bytecodePatch(
    name = "nicoid Re",
    description = "Morphe patch for nicoid. Supports the current NicoNico video service, dark mode, and Android 16, with additional feature improvements.",
    default = true
) {
    compatibleWith(nicoid649)
    dependsOn(nicoidResources)
    extendWith("nicoid/helpers.mpe")
    execute {
        BufferedInputStream(Payload.open("method-delta.dex")).use { stream ->
            val delta = DexBackedDexFile.fromInputStream(Opcodes.getDefault(), stream)
            for (source in delta.classes) {
                val target = mutableClassDefBy(source.type)
                check(target.superclass == source.superclass) { "Unexpected class hierarchy: ${source.type}" }
                // Materialize all views before editing so lazy direct/virtual views stay in sync.
                val methods = target.methods
                val direct = target.directMethods
                val virtual = target.virtualMethods
                for (method in source.methods) {
                    val prior = methods.filter { it.name == method.name &&
                        it.parameterTypes == method.parameterTypes && it.returnType == method.returnType }
                    methods.removeAll(prior.toSet())
                    direct.removeAll(prior.toSet())
                    virtual.removeAll(prior.toSet())
                    val replacement = method.toMutable()
                    methods.add(replacement)
                    if (MethodUtil.isDirect(method)) direct.add(replacement) else virtual.add(replacement)
                }
                val fields = target.fields
                val static = target.staticFields
                val instance = target.instanceFields
                fields.clear(); static.clear(); instance.clear()
                for (field in source.fields) {
                    val replacement = field.toMutable()
                    fields.add(replacement)
                    if (FieldUtil.isStatic(field)) static.add(replacement) else instance.add(replacement)
                }
                target.setAccessFlags(source.accessFlags)
            }
        }
        val settings = mutableClassDefBy("Lcom/sauzask/nicoid/NicoidSetting;")
        var loginSummaries = 0
        for (method in settings.methods) {
            for ((index, instruction) in (method.implementation?.instructions?.toList() ?: continue).withIndex()) {
                val text = ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string
                if (text == "ログイン情報を保存済み（サイト側の認証は未確認）") {
                    val register = (instruction as OneRegisterInstruction).registerA
                    method.replaceInstruction(index, "const-string v$register, \"ログイン情報を保存済み\"")
                    loginSummaries++
                }
            }
        }
        check(loginSummaries == 1) { "Unexpected login summaries: $loginSummaries" }
        val webLogin = mutableClassDefBy("Lcom/sauzask/nicoid/ModernLoginActivity;").methods.single { it.name == "onCreate" }
        var loginLoads = 0
        for ((index, instruction) in checkNotNull(webLogin.implementation).instructions.toList().withIndex()) {
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            if (ref?.definingClass == "Landroid/webkit/WebView;" && ref.name == "loadUrl") {
                val call = instruction as FiveRegisterInstruction
                webLogin.replaceInstruction(index, "invoke-static {v${call.registerC}, v${call.registerD}}, Le/e/a/LoginSupport;->loadLogin(Landroid/webkit/WebView;Ljava/lang/String;)V")
                loginLoads++
            }
        }
        check(loginLoads == 1) { "Unexpected login page loads: $loginLoads" }
        // Stored history uses bare IDs; displayed rows use full watch URLs.
        val deletionTypes = listOf("Lcom/sauzask/nicoid/LocalHistoryBulkDelete;", "Lcom/sauzask/nicoid/NicoidVideoListFragment\$f\$e;")
        for (type in deletionTypes) {
            val deletion = mutableClassDefBy(type).methods.single { it.name == "onClick" && it.parameterTypes.size == 2 }
            var comparisons = 0
            var writes = 0
            for ((index, instruction) in checkNotNull(deletion.implementation).instructions.toList().withIndex()) {
                val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: continue
                val call = instruction as? FiveRegisterInstruction ?: continue
                if (ref.definingClass == "Ljava/lang/String;" && ref.name == "equals") {
                    deletion.replaceInstruction(index, "invoke-static {v${call.registerC}, v${call.registerD}}, Le/e/a/HistoryRules;->same(Ljava/lang/String;Ljava/lang/Object;)Z")
                    comparisons++
                } else if (ref.definingClass == "Ljava/util/HashSet;" && ref.name == "contains") {
                    deletion.replaceInstruction(index, "invoke-static {v${call.registerC}, v${call.registerD}}, Le/e/a/HistoryRules;->contains(Ljava/util/Set;Ljava/lang/Object;)Z")
                    comparisons++
                } else if (ref.definingClass == "Le/e/a/v0;" && ref.parameterTypes == listOf("I", "Lorg/json/JSONArray;", "Landroid/content/Context;")) {
                    deletion.replaceInstruction(index, "invoke-static {v${call.registerC}, v${call.registerD}, v${call.registerE}}, Le/e/a/HistorySupport;->write(ILorg/json/JSONArray;Landroid/content/Context;)I")
                    writes++
                }
            }
            check(comparisons == 1 && writes == 1) { "Unexpected history deletion hooks: $type ($comparisons, $writes)" }
        }
        val historyLoad = mutableClassDefBy("Le/e/a/y1;").methods.single { it.name == "run" }
        var historyFormats = 0
        for ((index, instruction) in checkNotNull(historyLoad.implementation).instructions.toList().withIndex()) {
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            if (ref?.definingClass == "Ljava/lang/String;" && ref.name == "format") {
                val call = instruction as FiveRegisterInstruction
                historyLoad.replaceInstruction(index, "invoke-static {v${call.registerC}, v${call.registerD}}, Le/e/a/HistorySupport;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;")
                historyFormats++
            }
        }
        check(historyFormats == 1) { "Unexpected history date formats: $historyFormats" }
        val historyStore = mutableClassDefBy("Le/e/a/v0;").methods.single {
            it.name == "a" && it.parameterTypes == listOf("Lorg/json/JSONObject;", "Landroid/content/Context;")
        }
        val historyRecord = checkNotNull(historyStore.implementation).registerCount - 2
        historyStore.addInstructions(0, "invoke-static/range {v$historyRecord .. v$historyRecord}, Le/e/a/ContentFilter;->rememberHistory(Lorg/json/JSONObject;)V")
        val historyInstructions = checkNotNull(historyLoad.implementation).instructions.toList()
        val newHistoryRow = historyInstructions.indices.single { index ->
            val ref = (historyInstructions[index] as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Le/e/a/x1;" && ref.name == "<init>"
        }
        val rowCall = historyInstructions[newHistoryRow] as FiveRegisterInstruction
        // The supported local-history loader keeps its source JSON record in v0.
        historyLoad.addInstructions(newHistoryRow + 1,
            "invoke-static {v${rowCall.registerC}, v0}, Le/e/a/ContentFilter;->restoreHistory(Ljava/lang/Object;Lorg/json/JSONObject;)V")
        val adapter = mutableClassDefBy("Le/e/a/b0;")
        val notify = adapter.methods.single { it.name == "notifyDataSetChanged" }
        val notifyThis = checkNotNull(notify.implementation).registerCount - 1
        notify.addInstructions(0, "invoke-static/range {v$notifyThis .. v$notifyThis}, Le/e/a/ContentFilter;->filter(Ljava/lang/Object;)V")
        val adapterConstructor = adapter.methods.single { it.name == "<init>" }
        val adapterThis = checkNotNull(adapterConstructor.implementation).registerCount - 5
        val constructorReturn = checkNotNull(adapterConstructor.implementation).instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
        adapterConstructor.addInstructions(constructorReturn, "invoke-static/range {v$adapterThis .. v$adapterThis}, Le/e/a/ContentFilter;->filter(Ljava/lang/Object;)V")
        mutableClassDefBy("Lcom/sauzask/nicoid/NicoidChromecastReceiverSelect;").methods.single { it.name == "onCreate" }
            .addInstructions(0, "invoke-static {}, Le/e/a/CastDiagnostics;->discovery()V")
        mutableClassDefBy("Lcom/sauzask/nicoid/NicoidChormecastSenderService\$c;").methods.single {
            it.name == "a" && it.parameterTypes == listOf("Landroid/os/Bundle;")
        }.addInstructions(0, "invoke-static {}, Le/e/a/CastDiagnostics;->connected()V")
        val castResult = mutableClassDefBy("Lcom/sauzask/nicoid/NicoidChormecastSenderService\$c\$a;").methods.single { it.name == "a" }
        val castResultCode = checkNotNull(castResult.implementation).instructions.toList()
        val castStatus = castResultCode.indices.single { index ->
            val ref = (castResultCode[index] as? ReferenceInstruction)?.reference as? MethodReference
            ref?.returnType == "Lcom/google/android/gms/common/api/Status;"
        }
        val castStatusRegister = (castResultCode[castStatus + 1] as OneRegisterInstruction).registerA
        castResult.addInstructions(castStatus + 2, "invoke-static {v$castStatusRegister}, Le/e/a/CastDiagnostics;->receiverResult(Ljava/lang/Object;)V")
        val castStream = mutableClassDefBy("Le/e/a/p;").methods.single {
            it.name == "a" && it.parameterTypes == listOf("Ljava/lang/String;", "Lorg/apache/http/client/CookieStore;", "Ljava/lang/String;")
        }
        val castUrlRegister = checkNotNull(castStream.implementation).registerCount - 3
        val castStreamCode = checkNotNull(castStream.implementation).instructions.toList()
        val startRelay = castStreamCode.indices.single { index ->
            val ref = (castStreamCode[index] as? ReferenceInstruction)?.reference as? MethodReference
            ref?.name == "start" && ref.parameterTypes.isEmpty() &&
                ref.definingClass in setOf("Ljava/lang/Thread;", "Le/e/a/o2;")
        }
        val castCallback = castUrlRegister - 1
        castStream.addInstructions(startRelay,
            "invoke-static/range {v$castCallback .. v$castCallback}, Le/e/a/CastRelay;->attach(Ljava/lang/Object;)V")
        castStream.addInstructions(0, """
            invoke-static/range {v$castUrlRegister .. v$castUrlRegister}, Le/e/a/CastDiagnostics;->stream(Ljava/lang/String;)V
            invoke-static/range {v$castCallback .. v$castUrlRegister}, Le/e/a/CastRelay;->prepare(Ljava/lang/Object;Ljava/lang/String;)V
        """.trimIndent())
        val castServer = mutableClassDefBy("Le/e/a/o2;")
        val socketHandler = castServer.methods.single { it.name == "a" && it.parameterTypes == listOf("Ljava/net/Socket;") }
        val socketThis = checkNotNull(socketHandler.implementation).registerCount - 2
        check(socketThis >= 2) { "Cast handler requires scratch registers" }
        socketHandler.addInstructions(0, """
            invoke-static/range {v$socketThis .. v${socketThis + 1}}, Le/e/a/CastRelay;->dispatch(Ljava/lang/Object;Ljava/net/Socket;)Z
            move-result v0
            if-eqz v0, :legacy_cast_socket
            return-void
            :legacy_cast_socket
            nop
        """.trimIndent())
        val stopRelay = castServer.methods.single { it.name == "b" && it.parameterTypes.isEmpty() }
        val stopThis = checkNotNull(stopRelay.implementation).registerCount - 1
        stopRelay.addInstructions(0, "invoke-static/range {v$stopThis .. v$stopThis}, Le/e/a/CastRelay;->detach(Ljava/lang/Object;)V")
        val runRelay = castServer.methods.single { it.name == "run" }
        val runThis = checkNotNull(runRelay.implementation).registerCount - 1
        checkNotNull(runRelay.implementation).instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
            .map { it.index }.reversed().forEach { index ->
                runRelay.addInstructions(index, "invoke-static/range {v$runThis .. v$runThis}, Le/e/a/CastRelay;->detach(Ljava/lang/Object;)V")
            }
        for (type in listOf("Le/e/a/ModernRanking;", "Le/e/a/ModernSearch;")) {
            val loadPage = mutableClassDefBy(type).methods.single { it.name == "load" }
            val code = checkNotNull(loadPage.implementation).instructions.toList()
            val input = code.indices.single { index ->
                val ref = (code[index] as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == "Ljava/net/HttpURLConnection;" && ref.name == "getInputStream"
            }
            val register = (code[input] as FiveRegisterInstruction).registerC
            loadPage.replaceInstruction(input, "invoke-static {v$register}, Le/e/a/PageCache;->input(Ljava/net/HttpURLConnection;)Ljava/io/InputStream;")
        }
        // Y is the original menu refresh; PullRefresh.a is the swipe refresh.
        mutableClassDefBy("Lcom/sauzask/nicoid/NicoidVideoListFragment;").methods.single { it.name == "Y" && it.parameterTypes.isEmpty() }
            .addInstructions(0, "invoke-static {}, Le/e/a/PageCache;->refresh()V")
        mutableClassDefBy("Le/e/a/PullRefresh;").methods.single { it.name == "a" && it.parameterTypes.isEmpty() }
            .addInstructions(0, "invoke-static {}, Le/e/a/PageCache;->refresh()V")
        val cache = mutableClassDefBy("Le/e/a/CacheHls;")
        val download = cache.methods.single { it.name == "download" }
        val firstParameter = checkNotNull(download.implementation).registerCount - 4
        val cookieParameter = firstParameter + 3
        // Snapshot the delivery token once for this download, rather than reading a
        // mutable global token for every segment while another video may be playing.
        download.addInstructions(0, """
            invoke-static {v$firstParameter, v$cookieParameter}, Le/e/a/CacheSupport;->cookieFor(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
            move-result-object v$cookieParameter
        """.trimIndent())
        val connect = cache.methods.single { it.name == "connect" }
        val connectInstructions = checkNotNull(connect.implementation).instructions.toList()
        val response = connectInstructions.indexOfFirst {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Ljava/net/HttpURLConnection;" && ref.name == "getResponseCode"
        }
        check(response >= 0) { "Cache response-code hook was not found" }
        val connectionRegister = (connectInstructions[response] as FiveRegisterInstruction).registerC
        val statusRegister = (connectInstructions[response + 1] as OneRegisterInstruction).registerA
        connect.addInstructions(response + 2, """
            invoke-static {v$connectionRegister, v$statusRegister}, Le/e/a/CacheSupport;->http(Ljava/net/HttpURLConnection;I)V
        """.trimIndent())
        connect.addInstructions(response, """
            invoke-static {v$connectionRegister}, Le/e/a/CacheSupport;->beforeRequest(Ljava/net/HttpURLConnection;)V
        """.trimIndent())
        val cacheInstructions = checkNotNull(download.implementation).instructions.toList()
        val failure = cacheInstructions.indexOfFirst {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            ref?.name == "printStackTrace"
        }
        check(failure >= 0) { "Cache error hook was not found" }
        val exceptionRegister = (cacheInstructions[failure] as FiveRegisterInstruction).registerC
        download.addInstructions(failure, """
            invoke-static {v$exceptionRegister}, Le/e/a/CacheSupport;->failed(Ljava/lang/Throwable;)V
        """.trimIndent())
        val top = mutableClassDefBy("Lcom/sauzask/nicoid/NicoidTopActivity;")
        val create = top.methods.single { it.name == "onCreate" }
        var migrationChecks = 0
        for ((index, instruction) in checkNotNull(create.implementation).instructions.toList().withIndex()) {
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            if (ref?.definingClass == "Ljava/io/File;" && ref.name == "exists") {
                val register = (instruction as FiveRegisterInstruction).registerC
                create.replaceInstruction(index,
                    "invoke-static {v$register}, Le/e/a/CacheSupport;->needsMigration(Ljava/io/File;)Z")
                migrationChecks++
            }
        }
        check(migrationChecks == 4) { "Unexpected legacy storage migration checks: $migrationChecks" }
        val menu = top.methods.single {
            it.name == "a" && it.parameterTypes == listOf("Landroid/content/Context;", "Landroid/widget/ListView;", "Z")
        }
        val code = checkNotNull(menu.implementation)
        val bind = code.instructions.indexOfFirst {
            val reference = (it as? ReferenceInstruction)?.reference as? MethodReference
            reference?.definingClass == "Landroid/widget/ListView;" && reference.name == "setAdapter"
        }
        check(bind >= 0) { "nicoid menu adapter binding was not found" }
        // The supported method-delta keeps Context in v0 and its complete row list in v7.
        menu.addInstructions(bind + 1, """
            invoke-static {v0, v7}, Le/e/a/ModernShorts;->finishMenu(Landroid/content/Context;Ljava/util/ArrayList;)V
            invoke-virtual {v8}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V
        """.trimIndent())
        // Capture payment flags from the same responses already used to build lists.
        for (type in listOf("Le/e/a/ModernRanking;", "Le/e/a/ModernSearch;", "Le/e/a/ModernRelated;")) {
            for (method in mutableClassDefBy(type).methods) {
                val instructions = method.implementation?.instructions?.toList() ?: continue
                for ((index, instruction) in instructions.withIndex()) {
                    val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: continue
                    val call = instruction as? FiveRegisterInstruction ?: continue
                    if (ref.definingClass == "Lorg/json/JSONArray;" && ref.name == "getJSONObject")
                        method.replaceInstruction(index, "invoke-static {v${call.registerC}, v${call.registerD}}, Le/e/a/PaidVideos;->item(Lorg/json/JSONArray;I)Lorg/json/JSONObject;")
                }
            }
        }
        // Older mylist/list loaders cast each JSON item before creating the row.
        for (method in mutableClassDefBy("Le/e/a/e0;").methods) {
            val instructions = method.implementation?.instructions?.toList() ?: continue
            for (index in instructions.indices.reversed()) {
                val instruction = instructions[index]
                val ref = (instruction as? ReferenceInstruction)?.reference as? TypeReference
                if (instruction.opcode == Opcode.CHECK_CAST && ref?.type == "Lorg/json/JSONObject;") {
                    val register = (instruction as OneRegisterInstruction).registerA
                    method.addInstructions(index + 1, "invoke-static/range {v$register .. v$register}, Le/e/a/PaidVideos;->remember(Lorg/json/JSONObject;)V")
                }
            }
        }
        // Bind after the legacy Spanned-to-String conversion, so icon spans survive.
        // The supported adapter keeps the count TextView in v12 (post time is v1).
        val rows = mutableClassDefBy("Le/e/a/b0;").methods.single { it.name == "getView" }
        var countBindings = 0
        for ((index, instruction) in checkNotNull(rows.implementation).instructions.toList().withIndex()) {
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            val call = instruction as? FiveRegisterInstruction ?: continue
            if (ref?.definingClass == "Landroid/widget/TextView;" && ref.name == "setText" &&
                ref.parameterTypes == listOf("Ljava/lang/CharSequence;") && call.registerC == 12) {
                rows.replaceInstruction(index,
                    "invoke-static {v${call.registerC}, v${call.registerD}}, Le/e/a/VideoCounts;->setText(Landroid/widget/TextView;Ljava/lang/CharSequence;)V")
                countBindings++
            }
        }
        check(countBindings == 1) { "Unexpected video count bindings: $countBindings" }
        val rowInstructions = checkNotNull(rows.implementation).instructions.toList()
        val rowThis = checkNotNull(rows.implementation).registerCount - 4
        for (index in rowInstructions.indices.reversed()) {
            val instruction = rowInstructions[index]
            if (instruction.opcode == Opcode.RETURN_OBJECT) {
                val register = (instruction as OneRegisterInstruction).registerA
                // Keep original branch labels on the first hook instruction. Inserting
                // before RETURN alone lets goto/if paths jump over the badge binding.
                check(register != 0 && register != 1 && register != 2) { "Unexpected list return register: $register" }
                rows.replaceInstruction(index, "move-object/from16 v0, v$register")
                rows.addInstructions(index + 1, """
                    move-object/from16 v1, v$rowThis
                    move/from16 v2, v${rowThis + 1}
                    invoke-static {v0, v1, v2}, Le/e/a/PaidVideos;->bindAdapter(Landroid/view/View;Ljava/lang/Object;I)V
                    return-object v$register
                """.trimIndent())
            }
        }

        val info = mutableClassDefBy("Lcom/sauzask/nicoid/NicoidVideoInfoFragment;")
            .methods.single { it.name == "a" && it.parameterTypes == listOf(
                "Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;") }
        val infoInstructions = checkNotNull(info.implementation).instructions.toList()
        val registrationText = infoInstructions.indices.filter {
            (infoInstructions[it] as? NarrowLiteralInstruction)?.narrowLiteral == 0x7f0f01ef
        }.single()
        val registrationBind = (registrationText + 1 until infoInstructions.size).first { index ->
            val ref = (infoInstructions[index] as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Landroid/widget/TextView;" && ref.name == "setText" &&
                ref.parameterTypes == listOf("Ljava/lang/CharSequence;")
        }
        val registrationCall = infoInstructions[registrationBind] as FiveRegisterInstruction
        info.replaceInstruction(registrationBind,
            "invoke-static {v${registrationCall.registerC}, v${registrationCall.registerD}}, Le/e/a/VideoInfoUi;->hideRegistration(Landroid/widget/TextView;Ljava/lang/CharSequence;)V")
        val infoCreate = mutableClassDefBy("Lcom/sauzask/nicoid/NicoidVideoInfoActivity;")
            .methods.single { it.name == "onCreate" }
        val infoCreateCode = checkNotNull(infoCreate.implementation)
        val infoCreateInstructions = infoCreateCode.instructions.toList()
        val contentView = infoCreateInstructions.indices.single { index ->
            val ref = (infoCreateInstructions[index] as? ReferenceInstruction)?.reference as? MethodReference
            ref?.name == "setContentView" && ref.parameterTypes == listOf("I")
        }
        val activityRegister = infoCreateCode.registerCount - 2
        infoCreate.addInstructions(contentView + 1,
            "invoke-static/range {v$activityRegister .. v$activityRegister}, Le/e/a/VideoInfoUi;->hideDivider(Landroid/app/Activity;)V")
        // Only known UI text is translated. URLs, IDs and preference values are preserved.
        val translatedStrings = Payload.open("ui-strings.txt").bufferedReader().useLines { lines ->
            lines.map { it.replace("\\n", "\n") }.toSet()
        }
        fun isUiResource(ref: MethodReference) = ref.name == "getString" &&
            ref.returnType == "Ljava/lang/String;" &&
            (ref.definingClass.startsWith("Landroid/content/") || ref.definingClass.startsWith("Landroid/app/") ||
                ref.definingClass.startsWith("Landroid/preference/") || ref.definingClass.startsWith("Lcom/sauzask/nicoid/"))
        val uiClasses = mutableListOf<String>()
        classDefForEach { cls ->
            if ((cls.type.startsWith("Lcom/sauzask/nicoid/") || cls.type.startsWith("Le/e/a/")) &&
                !cls.type.startsWith("Le/e/a/UiStrings") && !cls.type.startsWith("Le/e/a/UiText") &&
                !cls.type.startsWith("Le/e/a/VideoCount") && !cls.type.startsWith("Le/e/a/ContentFilterRules") &&
                !cls.type.startsWith("Le/e/a/HistoryRules") && !cls.type.startsWith("Le/e/a/CastHls") &&
                !cls.type.startsWith("Le/e/a/CastRelay") && !cls.type.startsWith("Le/e/a/PageCache")) {
                if (cls.methods.any { method -> method.implementation?.instructions?.any { insn ->
                    val ref = (insn as? ReferenceInstruction)?.reference
                    (ref is StringReference && ref.string in translatedStrings) ||
                        (ref is MethodReference && isUiResource(ref))
                } == true }) uiClasses.add(cls.type)
            }
        }
        for (type in uiClasses) for (method in mutableClassDefBy(type).methods) {
            val instructions = method.implementation?.instructions?.toList() ?: continue
            for (index in instructions.indices.reversed()) {
                val insn = instructions[index]
                val ref = (insn as? ReferenceInstruction)?.reference
                val register = when {
                    ref is StringReference && ref.string in translatedStrings ->
                        (insn as? OneRegisterInstruction)?.registerA
                    insn.opcode == Opcode.MOVE_RESULT_OBJECT && index > 0 -> {
                        val call = (instructions[index - 1] as? ReferenceInstruction)?.reference as? MethodReference
                        if (call != null && isUiResource(call))
                            (insn as OneRegisterInstruction).registerA else null
                    }
                    else -> null
                } ?: continue
                method.addInstructions(index + 1, """
                    invoke-static/range {v$register .. v$register}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$register
                """.trimIndent())
            }
        }
    }
}
