package app.template.patches.crexify

import app.morphe.patcher.Fingerprint
import app.template.patches.shared.Constants.COMPATIBILITY_CREXIFY_TV
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.rawResourcePatch
import java.security.MessageDigest
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Element
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod


private fun field(i: Instruction) = (i as? ReferenceInstruction)?.reference as? FieldReference
private fun method(i: Instruction) = (i as? ReferenceInstruction)?.reference as? MethodReference
private fun str(i: Instruction) = ((i as? ReferenceInstruction)?.reference as? StringReference)?.string
private fun a(i: Instruction) = (i as? OneRegisterInstruction)?.registerA
private fun b(i: Instruction) = (i as? TwoRegisterInstruction)?.registerB
private fun branchTargeted(insns: List<Instruction>, indexes: List<Int>): Boolean {
    val pcs = insns.runningFold(0) { pc, x -> pc + x.codeUnits }
    val destinations = indexes.map { pcs[it] }.toSet()
    return insns.indices.any { i ->
        val branch = insns[i] as? OffsetInstruction
        branch != null && pcs[i] + branch.codeOffset in destinations
    }
}
private object Config : Fingerprint(
    definingClass = "Lq80;", name = "H", returnType = "Lza;",
    parameters = listOf("Landroid/content/Context;", "Lcom/crexify/tv/app/ProApplication;", "Lorg/json/JSONObject;")
)

// Build 12's Hello.app uses the original X.509 signer to derive its AES key. Re-signing
// invalidates both the startup self-test and the response decoder. This port is build-specific;
// its transform and key/IV were checked against the stock x86_64 JNI implementation.
// Keep the class initializer and encode() native: encode() is separately used by the app.
private object HelloInit : Fingerprint(definingClass = "Lcom/crexify/tv/utils/Hello;", name = "<clinit>", returnType = "V", parameters = emptyList())
private object HelloCheck : Fingerprint(definingClass = "Lcom/crexify/tv/utils/Hello;", name = "check", returnType = "V", parameters = listOf("Landroid/content/Context;"))
private object HelloDecode : Fingerprint(definingClass = "Lcom/crexify/tv/utils/Hello;", name = "app", returnType = "[B", parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"))
private object HelloEncode : Fingerprint(definingClass = "Lcom/crexify/tv/utils/Hello;", name = "encode", returnType = "Ljava/lang/String;", parameters = listOf("Ljava/lang/String;"))

private fun MutableMethod.fresh(owner: MutableClass, registers: Int, code: String): MutableMethod {
    val replacement = ImmutableMethod(definingClass, name, parameters, returnType,
        accessFlags and 0x0100.inv(), annotations, hiddenApiRestrictions,
        MutableMethodImplementation(registers)).toMutable()
    replacement.addInstructions(0, code.trimIndent())
    check(owner.methods.remove(this)) { "Missing Hello method." }
    check(owner.methods.add(replacement)) { "Duplicate Hello method." }
    return replacement
}

// Do not use this build-specific decoder if any of the universal APK's native bridges differ.
private val stockBridgeGuard = rawResourcePatch {
    execute {
        val expected = mapOf(
            "arm64-v8a" to "651b961f2dd07b6a6413783708786c9e8e8868e29d4722bda566904feaa571db",
            "armeabi-v7a" to "1b662a7ff3c26e40243f1b5865414f3ddb8f5895ca6bf706f26abf729aaaf45d",
            "x86" to "62420d44b451b281b6ebb4321cde78dc8473977d360eb55fb113645c29163234",
            "x86_64" to "6f1ad695a80cf634150e3f797bde0e8dbcb893004ac14cdc0c18e25023618768",
        )
        val paths = listApkEntries("lib/").filter { it.endsWith("/libnative-lib.so") }.toSet()
        check(paths == expected.keys.map { "lib/$it/libnative-lib.so" }.toSet()) { "Unexpected CrexiFy native architectures." }
        expected.forEach { (abi, digest) ->
            val bytes = get("lib/$abi/libnative-lib.so").readBytes()
            val actual = MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it.toInt() and 0xff) }
            check(actual == digest) { "Unexpected CrexiFy native bridge for $abi." }
        }
    }
}

private val crexifySigningCompatibility = bytecodePatch {
    compatibleWith(COMPATIBILITY_CREXIFY_TV)
    dependsOn(stockBridgeGuard)
    execute {
        check(packageMetadata.packageName == "com.crexify.tv" && packageMetadata.versionName == "4.5" && packageMetadata.versionCode == "12") { "Unsupported CrexiFy version." }
        val owner = HelloInit.classDef
        val clinit = HelloInit.method.instructions.toList()
        val startup = HelloCheck.method
        val decoder = HelloDecode.method
        val encoder = HelloEncode.method
        check(clinit.size == 3 && clinit[0].opcode == Opcode.CONST_STRING && str(clinit[0]) == "native-lib" &&
            clinit[1].opcode == Opcode.INVOKE_STATIC && method(clinit[1])?.definingClass == "Ljava/lang/System;" && method(clinit[1])?.name == "loadLibrary" && clinit[2].opcode == Opcode.RETURN_VOID &&
            listOf(startup, decoder, encoder).all { it.accessFlags and 0x0108 == 0x0108 && it.implementation == null }) { "Unexpected CrexiFy native bridge." }
        startup.fresh(owner, 1, "return-void")
        val port = decoder.fresh(owner, 10, """
            if-eqz p0, :empty
            if-eqz p1, :empty
            const/4 v1, 0x0
            invoke-static {p1, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B
            move-result-object v0
            array-length v2, v0
            const/4 v3, 0x0
            :swap_pairs
            add-int/lit8 v4, v3, 0x1
            if-ge v4, v2, :reverse
            aget-byte v5, v0, v3
            aget-byte v6, v0, v4
            aput-byte v6, v0, v3
            aput-byte v5, v0, v4
            add-int/lit8 v3, v3, 0x2
            goto :swap_pairs
            :reverse
            const/4 v3, 0x0
            add-int/lit8 v4, v2, -0x1
            :reverse_loop
            if-ge v3, v4, :decode_inner
            aget-byte v5, v0, v3
            aget-byte v6, v0, v4
            aput-byte v6, v0, v3
            aput-byte v5, v0, v4
            add-int/lit8 v3, v3, 0x1
            add-int/lit8 v4, v4, -0x1
            goto :reverse_loop
            :decode_inner
            invoke-static {v0, v1}, Landroid/util/Base64;->decode([BI)[B
            move-result-object v0
            const-string v1, "ST1FR1lUTG1Lc2lt"
            const-string v2, "UTF-8"
            invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
            move-result-object v1
            new-instance v3, Ljavax/crypto/spec/SecretKeySpec;
            const-string v4, "AES"
            invoke-direct {v3, v1, v4}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V
            const-string v1, "mP7K9x2vfLQ8b1w3"
            invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
            move-result-object v1
            new-instance v4, Ljavax/crypto/spec/IvParameterSpec;
            invoke-direct {v4, v1}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V
            const-string v1, "AES/CBC/PKCS5Padding"
            invoke-static {v1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;
            move-result-object v1
            const/4 v2, 0x2
            invoke-virtual {v1, v2, v3, v4}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V
            invoke-virtual {v1, v0}, Ljavax/crypto/Cipher;->doFinal([B)[B
            move-result-object v0
            return-object v0
            :caught
            move-exception v0
            :empty
            const/4 v0, 0x0
            new-array v0, v0, [B
            return-object v0
        """)
        val impl = port.implementation!!
        val handler = impl.instructions.size - 4
        check(impl.instructions[handler].opcode == Opcode.MOVE_EXCEPTION)
        impl.addCatch("Ljava/lang/Exception;", impl.newLabelForIndex(0), impl.newLabelForIndex(handler), impl.newLabelForIndex(handler))
    }
}

// The stock message cards render the server's generic message field in two surfaces.
// Leave the message and URL in configuration untouched, and hide only the existing views.
private val promoMessageViews = resourcePatch {
    compatibleWith(COMPATIBILITY_CREXIFY_TV)
    execute {
        check(packageMetadata.packageName == "com.crexify.tv" && packageMetadata.versionName == "4.5" && packageMetadata.versionCode == "12") { "Unsupported CrexiFy version." }
        val androidNs = "http://schemas.android.com/apk/res/android"
        listOf("res/layout/fragment_event.xml", "res/layout/activity_player.xml").forEach { path ->
            document(path).use { doc ->
                val cards = doc.getElementsByTagName("com.google.android.material.card.MaterialCardView")
                val matches = (0 until cards.length).map { cards.item(it) as Element }.filter { it.getAttributeNS(androidNs, "id") == "@id/message_card" }
                check(matches.size == 1) { "Expected one message card in $path." }
                val card = matches.single()
                check(!card.hasAttributeNS(androidNs, "visibility") && card.getElementsByTagName("TextView").length == 1 &&
                    (card.getElementsByTagName("TextView").item(0) as Element).getAttributeNS(androidNs, "id") == "@id/message_txt") { "Unexpected message card in $path." }
                card.setAttributeNS(androidNs, "android:visibility", "gone")
                if (path.endsWith("fragment_event.xml")) {
                    val lists = doc.getElementsByTagName("androidx.recyclerview.widget.RecyclerView")
                    val eventLists = (0 until lists.length).map { lists.item(it) as Element }.filter { it.getAttributeNS(androidNs, "id") == "@id/event_type_rv" }
                    check(eventLists.size == 1 && eventLists.single().getAttributeNS(androidNs, "nextFocusUp") == "@id/message_card") { "Unexpected event focus path." }
                    // Do not force D-pad focus toward a hidden view; let Android choose the next visible target.
                    eventLists.single().removeAttributeNS(androidNs, "nextFocusUp")
                }
            }
        }
    }
}
private object TelegramPrompt : Fingerprint(definingClass = "Lb33;", name = "a", returnType = "V", parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"))
private object TelegramLayout : Fingerprint(definingClass = "Lb33;", name = "onCreate", returnType = "V", parameters = listOf("Landroid/os/Bundle;"))

@Suppress("unused")
val removeCrexifyConfiguredAds = bytecodePatch(
    name = "Remove configured startup and banner ads",
    description = "Suppresses configured startup/banner ads, the Telegram prompt and message ticker.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CREXIFY_TV)
    dependsOn(crexifySigningCompatibility, promoMessageViews)
    execute {
        check(packageMetadata.packageName == "com.crexify.tv" && packageMetadata.versionName == "4.5" && packageMetadata.versionCode == "12") { "Unsupported CrexiFy version." }
        val prompt = TelegramPrompt.method
        val promptInsns = prompt.instructions.toList()
        val dialogLayout = TelegramLayout.method.instructions.toList()
        check(prompt.accessFlags and 0x8 == 0x8 && prompt.implementation?.registerCount == 6 && promptInsns.size == 27 &&
            promptInsns[2].opcode == Opcode.CONST_STRING && str(promptInsns[2]) == "tg_dialog" &&
            promptInsns[11].opcode == Opcode.CONST_STRING && str(promptInsns[11]) == "is_tv" &&
            promptInsns[15].opcode == Opcode.NEW_INSTANCE &&
            method(promptInsns[16])?.let { it.definingClass == "Lb33;" && it.name == "<init>" } == true &&
            method(promptInsns[25])?.let { it.definingClass == "Landroid/app/Dialog;" && it.name == "show" && it.returnType == "V" } == true &&
            promptInsns[26].opcode == Opcode.RETURN_VOID && dialogLayout.any { field(it)?.let { f -> f.definingClass == "Lhe2;" && f.name == "dialog_telegram" } == true }) { "Unexpected Telegram prompt; refusing to patch." }
        prompt.fresh(TelegramPrompt.classDef, 2, "return-void")
        val m = Config.method
        val xs = m.instructions.toList()
        check(m.implementation?.registerCount == 8 && xs.size == 174) { "Unexpected CrexiFy configuration parser." }
        fun guard(index: Int, key: String, name: String, valueRegister: Int, apiName: String, argc: Int) {
            val load = xs[index - 3]; val invoke = xs[index - 2]; val result = xs[index - 1]; val store = xs[index]
            val invokeRef = method(invoke); val regs = invoke as? FiveRegisterInstruction; val f = field(store)
            check(load.opcode == Opcode.CONST_STRING && str(load) == key && a(load) == valueRegister &&
                  invoke.opcode == Opcode.INVOKE_VIRTUAL && invokeRef?.definingClass == "Lorg/json/JSONObject;" && invokeRef.name == apiName &&
                  regs?.registerCount == argc && regs.registerC == 7 && regs.registerD == valueRegister &&
                  result.opcode == Opcode.MOVE_RESULT_OBJECT && a(result) == valueRegister &&
                  store.opcode == Opcode.IPUT_OBJECT && a(store) == valueRegister && b(store) == 0 &&
                  f?.definingClass == "Lza;" && f.name == name && f.type == "Ljava/lang/String;") {
                "Unexpected $key parsing sequence; refusing to patch."
            }
        }
        guard(31, "start_ad", "j", 1, "optString", 3)
        guard(66, "banner_ad", "h", 6, "getString", 2)
        check(!branchTargeted(xs, listOf(31, 66))) { "Unexpected branch into ad field write." }
        // Keep the original JSON calls and all fields: only replace the values stored in the two ad fields.
        m.addInstructions(66, "const-string v6, \"no\"")
        m.addInstructions(31, "const-string v1, \"no\"")
    }
}

private val startupPolicy = resourcePatch {
    compatibleWith(COMPATIBILITY_CREXIFY_TV)
    execute {
        check(packageMetadata.packageName == "com.crexify.tv" && packageMetadata.versionName == "4.5" && packageMetadata.versionCode == "12") { "Unsupported CrexiFy version." }
        val androidNs = "http://schemas.android.com/apk/res/android"
        val appNs = "http://schemas.android.com/apk/res-auto"
        document("res/layout/activity_player.xml").use { doc ->
            val nodes = doc.getElementsByTagName("androidx.media3.ui.PlayerView")
            val views = (0 until nodes.length).map { nodes.item(it) as Element }.filter { it.getAttributeNS(androidNs, "id") == "@id/player_view" }
            check(views.size == 1) { "Expected exactly one main player." }
            val view = views.single()
            check(view.getAttributeNS(appNs, "controller_layout_id") == "@layout/player_controller" && view.getAttributeNS(appNs, "auto_show") == "true") { "Unexpected main player layout." }
            view.setAttributeNS(appNs, "app:auto_show", "false")
        }
    }
}
private object Fullscreen : Fingerprint(definingClass = "Lcom/crexify/tv/activities/PlayerActivity;", name = "H", returnType = "V", parameters = emptyList())
private object Hide : Fingerprint(definingClass = "Landroidx/media3/ui/PlayerView;", name = "b", returnType = "V", parameters = emptyList())

@Suppress("unused")
val crexifyPlaybackControls = bytecodePatch(
    name = "Hide playback controls at stream open",
    description = "Keeps playback controls hidden when a stream opens or the player switches between embedded and fullscreen. The controls remain available.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CREXIFY_TV)
    dependsOn(startupPolicy, crexifySigningCompatibility)
    execute {
        check(packageMetadata.packageName == "com.crexify.tv" && packageMetadata.versionName == "4.5" && packageMetadata.versionCode == "12") { "Unsupported CrexiFy version." }
        val h = Hide.method.instructions.toList(); val call = method(h.getOrNull(2) ?: error("Missing native hide."))
        check(h.size == 4 && h[0].opcode == Opcode.IGET_OBJECT && field(h[0])?.type == "Lg62;" &&
              h[1].opcode == Opcode.IF_EQZ && h[2].opcode == Opcode.INVOKE_VIRTUAL &&
              call?.definingClass == "Lg62;" && call.name == "f" && call.returnType == "V" && call.parameterTypes.isEmpty() &&
              h[3].opcode == Opcode.RETURN_VOID) { "Unexpected native controller hide method." }
        val m = Fullscreen.method; val xs = m.instructions.toList()
        check(m.implementation?.registerCount == 4 && xs.size == 58) { "Unexpected fullscreen toggle." }
        val state = field(xs[0])
        check(xs[0].opcode == Opcode.IGET_BOOLEAN && state?.definingClass == "Lcom/crexify/tv/activities/PlayerActivity;" && state.name == "o0" && state.type == "Z" && a(xs[0]) == 0 && b(xs[0]) == 3 && xs[2].opcode == Opcode.IF_EQZ && a(xs[2]) == 0) { "Unexpected fullscreen branch." }
        val returns = xs.indices.filter { xs[it].opcode == Opcode.RETURN_VOID }
        check(returns == listOf(34, 57) && returns.all { i ->
            val f = field(xs[i - 1]); xs[i-1].opcode == Opcode.IPUT_BOOLEAN && a(xs[i-1]) == 1 && b(xs[i-1]) == 3 && f?.definingClass == "Lcom/crexify/tv/activities/PlayerActivity;" && f.name == "o0" && f.type == "Z"
        }) { "Unexpected fullscreen exits." }
        val pcs = xs.runningFold(0) { pc, x -> pc + x.codeUnits }
        check(pcs[2] + ((xs[2] as? OffsetInstruction)?.codeOffset ?: Int.MIN_VALUE) == pcs[35] && !branchTargeted(xs, returns)) { "Unexpected fullscreen branch targets." }
        val loads = xs.filter { x -> val f=field(x); x.opcode == Opcode.IGET_OBJECT && f?.definingClass == "Lcom/crexify/tv/activities/PlayerActivity;" && f.name == "b0" && f.type == "Landroidx/media3/ui/PlayerView;" && a(x) == 0 && b(x) == 3 }
        val refs = xs.mapNotNull(::method)
        check(loads.size == 2 && refs.count { it.definingClass == "Landroid/app/Activity;" && it.name == "setRequestedOrientation" } == 2 && refs.count { it.definingClass == "Landroidx/media3/ui/PlayerView;" && it.name == "setResizeMode" } == 2 && refs.none { it.definingClass == "Landroidx/media3/ui/PlayerView;" && it.name == "b" }) { "Unexpected fullscreen operations." }
        returns.asReversed().forEach { i -> m.addInstructions(i, """
            iget-object v0, p0, Lcom/crexify/tv/activities/PlayerActivity;->b0:Landroidx/media3/ui/PlayerView;
            invoke-virtual {v0}, Landroidx/media3/ui/PlayerView;->b()V
        """) }
    }
}
