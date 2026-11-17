package app.template.patches.sofascore.misc.sharing

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.string
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.shared.requireNoBranchTargetAt
import app.template.patches.sofascore.controls.SOFASCORE_SHARE_LINKS
import app.template.patches.sofascore.controls.SofascoreControlsCategory
import app.template.patches.sofascore.controls.sofascoreControls
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

internal val CLEAN_SHARE_LINKS = HevalFeature(
    id = "sofascore.clean_share_links",
    name = "Clean shared links",
    description = "Shares plain Sofascore links without tracking codes.",
    category = SofascoreControlsCategory.BETTING,
    icon = "shield",
)

/**
 * The image share helper (e99.H in 26.11.03): a final instance (Context, Bitmap, String, Continuation)
 * suspend method that writes the bitmap to a file, builds an ACTION_SEND image intent with
 * EXTRA_STREAM and puts the String argument into EXTRA_TEXT. The three intent strings plus the
 * (Context, Bitmap, String, ?) shape pick it out of the other builder that holds the same strings
 * (a coroutine's invokeSuspend(Object)).
 */
internal object ImageShareHelperFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    strings = listOf(
        string("android.intent.action.SEND", StringComparisonType.EQUALS),
        string("image/*", StringComparisonType.EQUALS),
        string("android.intent.extra.STREAM", StringComparisonType.EQUALS),
    ),
    custom = { method, _ ->
        val params = method.parameterTypes.map(CharSequence::toString)
        !AccessFlags.STATIC.isSet(method.accessFlags) &&
            params.size == 4 && params[0] == "Landroid/content/Context;" &&
            params[1] == "Landroid/graphics/Bitmap;" && params[2] == "Ljava/lang/String;"
    },
)

private val SHARE_STRINGS = setOf("android.intent.action.SEND", "image/*", "android.intent.extra.STREAM")

/** The share helper's shape, checked independently of the fingerprint: used to count the candidates. */
private fun com.android.tools.smali.dexlib2.iface.Method.isImageShareShape(): Boolean {
    val params = parameterTypes.map(CharSequence::toString)
    if (AccessFlags.STATIC.isSet(accessFlags) || returnType != "Ljava/lang/Object;" || params.size != 4 ||
        params[0] != "Landroid/content/Context;" || params[1] != "Landroid/graphics/Bitmap;" ||
        params[2] != "Ljava/lang/String;"
    ) return false
    val strings = implementation?.instructions?.mapNotNull {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
    }.orEmpty().toSet()
    return strings.containsAll(SHARE_STRINGS)
}

/**
 * The highlight outbound link builder (tk9.P in 26.11.03): it appends utm_source, utm_medium,
 * utm_content and utm_campaign ("app referrals") to the highlight URL before opening it. Found by the
 * two literal values of the first and last parameter.
 */
internal object HighlightLinkFingerprint : Fingerprint(
    strings = listOf(
        string("utm_source", StringComparisonType.EQUALS),
        string("app referrals", StringComparisonType.EQUALS),
    ),
)

private val APPEND_QUERY_PARAMETER = ImmutableMethodReference(
    "Landroid/net/Uri\$Builder;",
    "appendQueryParameter",
    listOf("Ljava/lang/String;", "Ljava/lang/String;"),
    "Landroid/net/Uri\$Builder;",
)

private val EXTENSION_APPEND = ImmutableMethodReference(
    SOFASCORE_SHARE_LINKS,
    "appendQueryParameter",
    listOf("Landroid/net/Uri\$Builder;", "Ljava/lang/String;", "Ljava/lang/String;"),
    "Landroid/net/Uri\$Builder;",
)

private fun MethodReference.isAppendQueryParameter() =
    definingClass == APPEND_QUERY_PARAMETER.definingClass && name == APPEND_QUERY_PARAMETER.name &&
        returnType == APPEND_QUERY_PARAMETER.returnType &&
        parameterTypes.map(CharSequence::toString) == APPEND_QUERY_PARAMETER.parameterTypes

// A Heval Controls feature, on by default. Image shares: the text argument of the share helper goes
// through ShareLinks.cleanShareText, which rewrites tracking short links (app.sofascore.com/nixz/<id>)
// to the plain site address and leaves every other text alone (the fantasy invite link included).
// Highlight links: each appendQueryParameter call in the link builder goes through the extension,
// which skips utm_* keys while the switch is on. Both answer stock when the switch is off.
@Suppress("unused")
val cleanSharedLinksPatch = sofascoreControls.featurePatch(
    CLEAN_SHARE_LINKS,
    name = "Clean shared links",
    description = "Removes tracking codes from shared links.",
) {
    classDefBy(SOFASCORE_SHARE_LINKS)

    // Validate every site before the first edit. The share helper must be the only method of its shape.
    var shareShapes = 0
    classDefForEach { classDef -> shareShapes += classDef.methods.count { it.isImageShareShape() } }
    if (shareShapes != 1) {
        throw PatchException("Clean shared links: expected exactly one image share helper, found $shareShapes")
    }
    val share =ImageShareHelperFingerprint.method
    share.requireNoBranchTargetAt(0, "Clean shared links (share helper)")
    val highlight = HighlightLinkFingerprint.method
    val instructions = highlight.implementation!!.instructions
    val appendCalls = instructions.indices.filter { i ->
        val insn = instructions[i]
        insn.opcode == Opcode.INVOKE_VIRTUAL &&
            ((insn as ReferenceInstruction).reference as? MethodReference)?.isAppendQueryParameter() == true
    }
    if (appendCalls.size != 4) {
        throw PatchException("Clean shared links: expected 4 appendQueryParameter calls, found ${appendCalls.size}")
    }

    // 1. The String argument (p3 of the instance method: this, Context, Bitmap, String) goes through
    // the cleaner at the start, before the coroutine stores it, so a resumed call sees the cleaned text.
    share.addInstructionsChecked(
        0,
        """
            invoke-static/range {p3 .. p3}, $SOFASCORE_SHARE_LINKS->cleanShareText(Ljava/lang/String;)Ljava/lang/String;
            move-result-object p3
        """,
    )

    // 2. Each appendQueryParameter(Builder, key, value) becomes the extension's static with the same
    // registers (the receiver is the first argument).
    val implementation = highlight.implementation!!
    appendCalls.forEach { index ->
        val call = implementation.instructions[index] as FiveRegisterInstruction
        implementation.replaceInstruction(
            index,
            BuilderInstruction35c(
                Opcode.INVOKE_STATIC, call.registerCount,
                call.registerC, call.registerD, call.registerE, call.registerF, call.registerG,
                EXTENSION_APPEND,
            ),
        )
    }
}
