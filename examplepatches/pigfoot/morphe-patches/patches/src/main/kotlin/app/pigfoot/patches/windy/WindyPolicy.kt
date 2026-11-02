package app.pigfoot.patches.windy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.nio.ByteBuffer
import java.nio.charset.CodingErrorAction
import java.security.MessageDigest

internal const val WINDY_PACKAGE = "com.windyty.android"
internal const val WINDY_VERSION = "51.3.2"
internal const val WINDY_CODE = "5103023"
internal const val WINDY_SIGNER = "516a543f88b4bbc4a2aef4d1a36a34ceeef72850"
internal const val WINDY_ASSET = "51.3.2.mob.3c81/mobile.js"
internal const val WINDY_JS_HASH = "56057a8c8c0d7069a6fbd84870b4d23104bed0479e22bf08e77ca806d514fb28"
internal const val WINDY_WIDGET_OWNER = "Lnb6;"
internal const val WINDY_WIDGET_CLASS_HASH = "6bbcc6ce210829310bb862863098f93133134109bc3a537dea3793fd5e05eabe"
private const val WIDGET_BODY_HASH = "f195a996c683b9e5ce0cfb78c302e3bf2c70bdfd1d381e03891072f6f17e7523"

internal fun windySha256(bytes: ByteArray) = MessageDigest.getInstance("SHA-256")
    .digest(bytes).joinToString("") { "%02x".format(it) }

internal fun requireWindyTarget(packageName: String?, version: String?, code: String?) {
    require(packageName == WINDY_PACKAGE && version == WINDY_VERSION && code == WINDY_CODE) {
        "Unsupported Windy package/version/build"
    }
}

internal fun windyClassHash(definition: ClassDef): String {
    val pool = DexPool(Opcodes.forDexVersion(39))
    pool.internClass(definition)
    val store = MemoryDataStore()
    pool.writeTo(store)
    return windySha256(store.data)
}

internal fun requireWindyAsset(relativePath: String, bytes: ByteArray) {
    require(relativePath == WINDY_ASSET && windySha256(bytes) == WINDY_JS_HASH) {
        "Unsupported or already modified Windy JavaScript asset"
    }
}

internal data class WindyEdit(val label: String, val before: String, val after: String)

// Qualified against this version's original Store and account-reset paths.
// Keep real subscriptionInfo, user, token and logout operations intact.
internal val windyEdits = listOf(
    WindyEdit("local tier default",
        "subscription:{def:null,allowed:e=>!0,save:!0,nativeSync:!0}",
        "subscription:{def:`premium`,allowed:e=>!0,save:!0,nativeSync:!0}"),
    WindyEdit("cold-start latch and body class",
        "xr=!!N.get(`subscription`),xr||N.once(`subscription`,e=>xr=!!e)",
        "xr=!0,document.body?.classList.add(`subs-premium`)"),
    WindyEdit("local hasAny predicate",
        "ju=()=>N.get(`subscription`)!==null", "ju=()=>!0"),
    WindyEdit("reset local tier but clear genuine info",
        "N.set(`subscription`,null),N.set(`subscriptionInfo`,null)",
        "N.set(`subscription`,`premium`),N.set(`subscriptionInfo`,null)"),
    WindyEdit("remove old valid tier and retain local body class",
        "e&&document.body.classList.remove(`subs-\${e}`)",
        "typeof e===`string`&&e&&!/\\s/.test(e)&&document.body.classList.remove(`subs-\${e}`),document.body.classList.add(`subs-premium`)")
)

/** All sites are collected/validated on the original before any transformation. */
internal fun patchWindyJavaScript(bytes: ByteArray): ByteArray {
    val decoder = Charsets.UTF_8.newDecoder().onMalformedInput(CodingErrorAction.REPORT)
        .onUnmappableCharacter(CodingErrorAction.REPORT)
    val original = decoder.decode(ByteBuffer.wrap(bytes)).toString()
    val sites = windyEdits.map { edit ->
        val first = original.indexOf(edit.before)
        require(first >= 0 && original.indexOf(edit.before, first + 1) < 0) {
            "Missing, ambiguous or already modified Windy site: ${edit.label}"
        }
        require(!original.contains(edit.after)) { "Existing Windy override: ${edit.label}" }
        first to edit
    }.sortedBy { it.first }
    require(sites.zipWithNext().all { (a, b) -> a.first + a.second.before.length <= b.first }) {
        "Overlapping Windy JavaScript sites"
    }
    val result = StringBuilder(original)
    sites.asReversed().forEach { (index, edit) -> result.replace(index, index + edit.before.length, edit.after) }
    return result.toString().toByteArray(Charsets.UTF_8)
}

private fun widgetInstruction(instruction: Instruction): String {
    val registers = when (instruction) {
        is FiveRegisterInstruction -> listOf(instruction.registerC, instruction.registerD, instruction.registerE,
            instruction.registerF, instruction.registerG).take(instruction.registerCount)
        is TwoRegisterInstruction -> listOf(instruction.registerA, instruction.registerB)
        is OneRegisterInstruction -> listOf(instruction.registerA)
        else -> emptyList()
    }
    return "${instruction.opcode.ordinal}:$registers:${(instruction as? ReferenceInstruction)?.reference ?: ""}"
}

/** Only the original native widget predicate; never short-circuit its async callers. */
internal fun enableWindyWidgetPredicate(method: MutableMethod) {
    require(method.definingClass == WINDY_WIDGET_OWNER && method.name == "b" && method.parameterTypes.isEmpty() &&
        method.returnType == "Z" && method.accessFlags == 17) { "Unsupported Windy widget method" }
    val implementation = requireNotNull(method.implementation)
    require(implementation.registerCount == 3 && implementation.tryBlocks.isEmpty() &&
        windySha256(implementation.instructions.joinToString("\n", transform = ::widgetInstruction)
            .toByteArray(Charsets.UTF_8)) == WIDGET_BODY_HASH) { "Unsupported or already modified Windy widget body" }
    method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
}
