package semicoloncolonel.mobilestream.patches.shared.links

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val AFFILIATE_LINK_CLEANER =
    "Lsemicoloncolonel/mobilestream/extension/shared/links/AffiliateLinkCleaner;"

// ─────────────────────────────────────────────────────────────────────────────
// Strip affiliate links, shared by the deal apps.
//
// Every startActivity / startActivityForResult call in the app becomes a call
// to AffiliateLinkCleaner, which cleans a VIEW intent's URL and then starts
// the activity as before. Custom tabs (androidx.browser calls startActivity),
// React Native's Linking.openURL, and plain browser intents all pass through
// it. Shared links (ACTION_SEND, directly or in a chooser) and links copied
// with ClipboardManager.setPrimaryClip are cleaned the same way, so a link
// passed on to someone else carries no affiliate tag either. WebView.loadUrl
// calls get the same cleaning, for apps that open deals in their own browser.
//
// The receiver is passed as the first argument of the static replacement, so
// the registers stay as they are. invoke-super calls are left alone: an app's
// own startActivity override still reaches the framework.
// ─────────────────────────────────────────────────────────────────────────────

private const val INTENT = "Landroid/content/Intent;"
private const val BUNDLE = "Landroid/os/Bundle;"

/** The replaced methods: name and parameters → static replacement's descriptor. */
private val START_METHODS = mapOf(
    ("startActivity" to listOf(INTENT)) to "(Ljava/lang/Object;$INTENT)V",
    ("startActivity" to listOf(INTENT, BUNDLE)) to "(Ljava/lang/Object;$INTENT$BUNDLE)V",
    ("startActivityForResult" to listOf(INTENT, "I")) to "(Ljava/lang/Object;${INTENT}I)V",
    ("startActivityForResult" to listOf(INTENT, "I", BUNDLE)) to "(Ljava/lang/Object;${INTENT}I$BUNDLE)V",
)

private fun Instruction.startMethodDescriptor(): Pair<String, String>? {
    if (opcode != Opcode.INVOKE_VIRTUAL && opcode != Opcode.INVOKE_VIRTUAL_RANGE) return null
    val reference = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return null
    if (reference.returnType != "V") return null
    val key = reference.name to reference.parameterTypes.map { it.toString() }
    val descriptor = START_METHODS[key] ?: return null
    return reference.name to descriptor
}

private fun Instruction.isWebViewLoadUrl(): Boolean {
    if (opcode != Opcode.INVOKE_VIRTUAL && opcode != Opcode.INVOKE_VIRTUAL_RANGE) return false
    val reference = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return reference.name == "loadUrl" &&
        reference.parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;") &&
        reference.returnType == "V" &&
        reference.definingClass.endsWith("WebView;")
}

private fun Instruction.isSetPrimaryClip(): Boolean {
    if (opcode != Opcode.INVOKE_VIRTUAL && opcode != Opcode.INVOKE_VIRTUAL_RANGE) return false
    val reference = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return reference.name == "setPrimaryClip" &&
        reference.definingClass == "Landroid/content/ClipboardManager;" &&
        reference.parameterTypes.map { it.toString() } == listOf("Landroid/content/ClipData;")
}

private fun Instruction.registers(): String = when (this) {
    is RegisterRangeInstruction ->
        "v$startRegister .. v${startRegister + registerCount - 1}"
    is FiveRegisterInstruction ->
        listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount).joinToString { "v$it" }
    else -> throw PatchException("Unexpected invoke format: $this")
}

/**
 * Routes the app's outbound links through AffiliateLinkCleaner. Returns the
 * number of call sites changed.
 */
internal fun BytecodePatchContext.routeLinksThroughCleaner(): Int {
    val targets = mutableListOf<String>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lsemicoloncolonel/")) return@classDefForEach
        if (classDef.methods.any { method ->
                method.implementation?.instructions?.any {
                    it.startMethodDescriptor() != null || it.isWebViewLoadUrl() || it.isSetPrimaryClip()
                } == true
            }
        ) targets += classDef.type
    }

    var changed = 0
    targets.forEach { type ->
        mutableClassDefBy(type).methods.forEach { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@forEach
            instructions.forEachIndexed { index, instruction ->
                val start = instruction.startMethodDescriptor()
                if (start != null) {
                    val range = if (instruction.opcode == Opcode.INVOKE_VIRTUAL_RANGE) "/range" else ""
                    method.replaceInstruction(
                        index,
                        "invoke-static$range { ${instruction.registers()} }, " +
                            "$AFFILIATE_LINK_CLEANER->${start.first}${start.second}",
                    )
                    changed++
                } else if (instruction.isSetPrimaryClip()) {
                    val range = if (instruction.opcode == Opcode.INVOKE_VIRTUAL_RANGE) "/range" else ""
                    method.replaceInstruction(
                        index,
                        "invoke-static$range { ${instruction.registers()} }, " +
                            "$AFFILIATE_LINK_CLEANER->setPrimaryClip(Ljava/lang/Object;Landroid/content/ClipData;)V",
                    )
                    changed++
                } else if (instruction.isWebViewLoadUrl()) {
                    val range = if (instruction.opcode == Opcode.INVOKE_VIRTUAL_RANGE) "/range" else ""
                    method.replaceInstruction(
                        index,
                        "invoke-static$range { ${instruction.registers()} }, " +
                            "$AFFILIATE_LINK_CLEANER->loadUrl(Ljava/lang/Object;Ljava/lang/String;)V",
                    )
                    changed++
                }
            }
        }
    }
    if (changed == 0) throw PatchException("No startActivity call to route through the link cleaner")
    return changed
}

/** The shared "Strip affiliate links" patch for one app. */
internal fun stripAffiliateLinksPatch(
    compatibility: Compatibility,
    description: String,
    use: Boolean = true,
    category: String? = null,
) = bytecodePatch(
    name = "Strip affiliate links",
    description = description,
    default = use,
) {
    compatibleWith(compatibility)
    category?.let { category(it) }
    extendWith("extensions/extension.mpe")
    execute { routeLinksThroughCleaner() }
}
