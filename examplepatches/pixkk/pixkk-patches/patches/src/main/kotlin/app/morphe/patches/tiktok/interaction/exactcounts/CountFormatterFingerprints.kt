package app.morphe.patches.tiktok.interaction.exactcounts

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * TikTok's count formatters: static, a long in and a string out, rounding at 10,000 to "K", at a
 * million to "M" and at a billion to "B". The main one has about 200 callers, and each build keeps
 * one to three smaller copies of it. All of them carry the "1.0M" and "1.0B" they print at the
 * edge of a unit.
 */
internal fun Method.isCountFormatter(): Boolean =
    AccessFlags.STATIC.isSet(accessFlags) && returnType == "Ljava/lang/String;" &&
        parameterTypes.map { it.toString() } == listOf("J") &&
        // The hook needs one register below the long's pair.
        (implementation?.registerCount ?: 0) > 2

internal object CountFormatterFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf("J"),
    filters = listOf(string("1.0M"), string("1.0B")),
    custom = { method, _ -> method.isCountFormatter() },
)

/** How many count formatters a build may have: the main one and up to three copies. */
internal val COUNT_FORMATTERS = 2..4

/** Calls in this method to TikTok's general number formatter, (Number, style, I, Boolean, I) to text. */
internal fun Method.compactNumberFormatterCalls(): Int =
    implementation?.instructions?.count { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        instruction.opcode == Opcode.INVOKE_STATIC && reference != null &&
            reference.returnType == "Ljava/lang/CharSequence;" &&
            reference.parameterTypes.map { it.toString() }.let {
                it.size == 5 && it[0] == "Ljava/lang/Number;" && it[2] == "I" &&
                    it[3] == "Ljava/lang/Boolean;" && it[4] == "I"
            }
    } ?: 0

/**
 * The compact count formatters, which print the like, comment, share and save counts on the feed
 * rail, and comment likes and repost counts. They don't carry "1.0M": each keeps a count under
 * 10,000 whole and hands the rest to TikTok's general number formatter, once per style.
 */
internal object CompactCountFormatterFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf("J"),
    custom = { method, _ ->
        method.isCountFormatter() && method.compactNumberFormatterCalls() == 2 &&
            method.implementation!!.instructions.any { (it as? WideLiteralInstruction)?.wideLiteral == 10_000L }
    },
)

/** How many compact count formatters a build may have. */
internal val COMPACT_COUNT_FORMATTERS = 4..5
