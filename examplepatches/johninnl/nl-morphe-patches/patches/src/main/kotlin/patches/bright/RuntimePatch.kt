package patches.bright

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.DualReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import patches.shared.uniqueMatch

private const val WEB_VIEW_WRAPPER = "LI5/d0;"
private const val CHANNEL_DISPATCHER = "LI5/M;"
private const val PLUGIN_ATTACH = "LI5/a0;"
private const val HELPER = "Lpatches/bright/BrightWebClient;"
private const val POLICY = "Lpatches/bright/BrightPolicy;"
private val payloads = setOf(Opcode.PACKED_SWITCH_PAYLOAD, Opcode.SPARSE_SWITCH_PAYLOAD, Opcode.ARRAY_PAYLOAD)
private val controls = setOf("articles", "ads", "tracking", "consent")
private const val ENGINE_ATTACH_SHA256 = "0683a9d2a1820b1c56e15d2415f94bdf66064fe4209b79ffc8a87bcb21d0d60e"

/** Hash instruction semantics independently of DEX pool indices and injected class ordering. */
private fun bodyDigest(body: List<Instruction>): String = body.joinToString("\n") { instruction ->
    buildList {
        add(instruction.opcode.toString())
        add(instruction.codeUnits.toString())
        if (instruction is OneRegisterInstruction) add("A=${instruction.registerA}")
        if (instruction is TwoRegisterInstruction) add("B=${instruction.registerB}")
        if (instruction is ThreeRegisterInstruction) add("C=${instruction.registerC}")
        if (instruction is FiveRegisterInstruction) {
            add("N=${instruction.registerCount}")
            add("C=${instruction.registerC}")
            add("D=${instruction.registerD}")
            add("E=${instruction.registerE}")
            add("F=${instruction.registerF}")
            add("G=${instruction.registerG}")
        }
        if (instruction is RegisterRangeInstruction) {
            add("N=${instruction.registerCount}")
            add("S=${instruction.startRegister}")
        }
        if (instruction is WideLiteralInstruction) add("L=${instruction.wideLiteral}")
        if (instruction is OffsetInstruction) add("O=${instruction.codeOffset}")
        if (instruction is ReferenceInstruction) add("R=${instruction.reference}")
        if (instruction is DualReferenceInstruction) add("R2=${instruction.reference2}")
    }.joinToString("|")
}.toByteArray(Charsets.UTF_8).sha256()

context(context: app.morphe.patcher.patch.BytecodePatchContext)
private fun exact(owner: String, signature: String, flags: Int, registers: Int, count: Int) =
    Fingerprint(
        definingClass = owner, name = signature.substringBefore('('), returnType = signature.substringAfter(')'),
        parameters = Regex("\\[*L[^;]+;|\\[*[ZBCSIJFD]")
            .findAll(signature.substringAfter('(').substringBefore(')')).map { it.value }.toList(),
    ).uniqueMatch().method.also { method ->
        check(method.accessFlags == flags && method.implementation!!.registerCount == registers &&
            method.instructions.count { it.opcode !in payloads } == count) { "Bright original method changed: $owner->$signature" }
    }

/**
 * The shared WebView runtime. Installs the Bright extension and delegates
 * the webview_flutter_android client at both of its audited installation
 * points. Runtime installation alone activates nothing: every control flag
 * defaults to off and `wrap` returns the original client untouched until a
 * control is selected.
 */
internal val runtime = bytecodePatch {
    dependsOn(originalInput)
    extendWith("extensions/bright.mpe")
    execute {
        // The plugin's own WebView subclass wrapper: every client set through
        // the Dart API or the constructor passes through this single method.
        exact(WEB_VIEW_WRAPPER, "setWebViewClient(Landroid/webkit/WebViewClient;)V", 0x1, 3, 5)
            .addInstructions(0, """
                invoke-static {p1}, $HELPER->wrap(Landroid/webkit/WebViewClient;)Landroid/webkit/WebViewClient;
                move-result-object p1
            """.trimIndent())

        // The method-channel dispatcher that installs a client directly on the
        // created android.webkit.WebView; v1 holds the WebView, p1 the client.
        val dispatch = exact(CHANNEL_DISPATCHER, "q(Ljava/lang/Object;Ld5/p;)V", 0x11, 12, 1260)
        val calls = dispatch.instructions.withIndex().filter {
            (it.value as? ReferenceInstruction)?.reference?.toString() ==
                "Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V"
        }
        check(calls.size == 1) { "Expected one Bright channel client installation" }
        val call = calls.single()
        val registers = call.value as FiveRegisterInstruction
        // p1 (the client) is the second parameter register of three.
        check(registers.registerD == dispatch.implementation!!.registerCount - 2) {
            "Bright channel client register moved"
        }
        dispatch.addInstructions(call.index, """
            invoke-static {p1}, $HELPER->wrap(Landroid/webkit/WebViewClient;)Landroid/webkit/WebViewClient;
            move-result-object p1
        """.trimIndent())
    }
}

/** Inject one selection flag at the plugin's engine-attach callback start. */
context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun selectControl(field: String) {
    check(field in controls) { "Unknown Bright control: $field" }
    val attach = Fingerprint(
        definingClass = PLUGIN_ATTACH, name = "b", returnType = "V",
        parameters = listOf("Li2/n;"),
    ).uniqueMatch().method
    // b is FlutterPlugin.onAttachedToEngine. ActivityAware.a is only the
    // configuration-change reattachment callback and does not run at cold start.
    val instructions = attach.instructions.toList()
    val prefixSize = instructions.size - 298
    check(attach.accessFlags == 0x11 && attach.implementation!!.registerCount == 24 &&
        prefixSize in 0..6 && prefixSize % 2 == 0) { "Bright engine attach changed" }
    val selected = mutableSetOf<String>()
    instructions.take(prefixSize).chunked(2).forEach { (load, store) ->
        val reference = (store as? ReferenceInstruction)?.reference?.toString()
        val previous = controls.singleOrNull { reference == "$POLICY->$it:Z" }
        check(load.opcode == Opcode.CONST_4 && (load as? OneRegisterInstruction)?.registerA == 0 &&
            (load as? WideLiteralInstruction)?.wideLiteral == 1L && store.opcode == Opcode.SPUT_BOOLEAN &&
            (store as? OneRegisterInstruction)?.registerA == 0 && previous != null && selected.add(previous)) {
            "Unexpected Bright selection prefix"
        }
    }
    check(field !in selected) { "Bright control selected twice: $field" }
    check(bodyDigest(instructions.drop(prefixSize)) == ENGINE_ATTACH_SHA256) { "Bright engine attach body changed" }
    attach.addInstructions(0, """
        const/4 v0, 0x1
        sput-boolean v0, $POLICY->$field:Z
    """.trimIndent())
}
