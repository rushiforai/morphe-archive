/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.search.daterange

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.comments.summaries.descriptor
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.feed.methodsHolding
import app.morphe.patches.facebook.feed.reels.categoryNames
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.facebookExtensionPatch
import app.morphe.patches.facebook.misc.extension.requireStatusMethod
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PATCH = "Search date range"

/** The mutation name the filter screen reports a tap on a filter with, held by the method that handles the tap. */
internal const val TAP_FILTER = "choiceActionSheetTapFilter"

private const val SEARCH_DATE_RANGE = "$EXTENSION_PACKAGE/search/SearchDateRange;"
internal const val KIND = "$SEARCH_DATE_RANGE->kind(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"
internal const val BOTTOM_SHEET = "$SEARCH_DATE_RANGE->bottomSheet(Z)Z"
internal const val CALLBACK =
    "$SEARCH_DATE_RANGE->callback(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"

/** The kinds a filter declares, as the enum's constants are named; the kind class holds all of them. */
internal val FILTER_KINDS = listOf("DATE_RANGE_PICKER", "MULTI_CHOICE", "TIME_PICKER")

internal const val MOBILE_CONFIG = "Lcom/facebook/mobileconfig/factory/MobileConfigUnsafeContext;"

private const val OBJECT = "Ljava/lang/Object;"

/** How far after the kind may Facebook read the bottom sheet flag. */
internal const val FLAG_REACH = 12

/**
 * Search date range (#279).
 *
 * The filter screen is built from the kind each filter declares (585 arm64 enum `LX/0D33`:
 * MULTI_CHOICE, TIME_PICKER, DATE_RANGE_PICKER, ...). Facebook already ships the from and to month
 * picker for DATE_RANGE_PICKER (SearchResultsDateRangePickerMenuFragment, which sends `creation_time`
 * with `start_month` and `end_month` as YYYY-MM), but the Posted date filter, named `rp_creation_time`,
 * declares a list of years. The tap on a filter is handled by one method holding [TAP_FILTER]: it
 * reads the filter's kind, reads a server flag, and with the flag off sends TIME_PICKER and
 * DATE_RANGE_PICKER to the fragment screens while everything else goes to a bottom sheet that can
 * only show lists. After the kind is read, the extension is handed the filter and the kind and its
 * answer goes back into the same register; after the flag is read, it is handed the flag and its
 * answer goes back into that register. For the Posted date filter with the switch on, the kind
 * answers DATE_RANGE_PICKER and the flag answers off, so Facebook opens its own range screen.
 *
 * The kind call is found by shape: an interface call with no arguments, answering the enum that
 * holds all of [FILTER_KINDS], with the flag, a static mobile config call answering a boolean, read
 * within [FLAG_REACH] instructions after it and tested with if-nez. In the default selection with
 * its switch off, so nothing changes until it's turned on.
 *
 * The search tabs' "Filter results" sheet (585 `LX/0k33`, "search_filter_drilldown_level") hands the
 * tap handler its own callback (`LX/0k6D;->A07`), which shows the filter's choices inside the sheet.
 * Facebook reads the kind once before that, and a tap with a callback goes to the callback and returns,
 * so the hooked read never runs. That test is the if-eqz jumping straight to the hooked read, and the
 * extension is handed the filter, that first kind and the callback before it. For the date filter
 * with the switch on it answers no callback, and the tap carries on to the picker.
 */
@Suppress("unused")
val searchDateRangePatch = bytecodePatch(
    // The README table check reads this literal; PATCH carries the same text for the messages.
    name = "Search date range",
    description = "Adds a from and to month picker to the Date posted filter in post search, in place of the list of " +
        "years, so you can narrow results to a stretch of time. Starts off. Turn it on in Hushfacebook settings > Search.",
) {
    category("Interface")
    dependsOn(settingsPatch, facebookExtensionPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        // Everything is found before anything changes, so a build missing one part is left as it was.
        requireStatusMethod("searchDateRange")
        val holders = classDefByStrings(TAP_FILTER, StringComparisonType.EQUALS)
            .filterNot { it.type.startsWith(EXTENSION_CLASSES) }
        val found = kindReads(holders)
        val (tap, read) = found.singleOrNull()
            ?: throw PatchException(
                "$PATCH: expected one method holding \"$TAP_FILTER\" that reads a filter's kind and then the bottom " +
                    "sheet flag, found ${found.size}: ${found.joinToString { it.first.descriptor() }}",
            )
        val sheet = callbackTest(tap, read)
            ?: throw PatchException(
                "$PATCH: ${tap.descriptor()} has no test of the filter sheet's own callback jumping to its kind read",
            )
        val method = mutableClassDefBy(tap.definingClass).methods.single { it.descriptor() == tap.descriptor() }
        // The last first: each hook moves every later instruction down.
        method.hookFlag(read)
        method.hookKind(read)
        method.hookCallback(sheet)
        enableStatus("searchDateRange")
    }
}

/** Where a tap handler reads a filter's kind and then the bottom sheet flag. */
internal class KindRead(
    /** The index of the interface call that reads the kind. */
    val call: Int,
    /** The register the filter is in at that call. */
    val filter: Int,
    /** The register the kind lands in. */
    val kind: Int,
    /** The kind's enum type. */
    val kindType: String,
    /** The index of the flag's move-result. */
    val flagResult: Int,
    /** The register the flag lands in. */
    val flag: Int,
)

/**
 * Each method of [holders] holding [TAP_FILTER], with where it reads a filter's kind and then the flag.
 * A type Facebook doesn't define, such as String, is looked up as no class: as a patch class it threw
 * and stopped patching.
 */
internal fun BytecodePatchContext.kindReads(holders: List<ClassDef>) =
    holders.flatMap { holder -> methodsHolding(holder, TAP_FILTER) }
        .mapNotNull { method -> kindRead(method) { type -> classDefByOrNull(type) }?.let { method to it } }

/**
 * The one place [method] reads a filter's kind and then the flag, or null when there isn't exactly
 * one. [classOf] looks a class up by type.
 */
internal fun kindRead(method: Method, classOf: (String) -> ClassDef?): KindRead? {
    val code = method.implementation?.instructions?.toList() ?: return null
    val reads = code.indices.mapNotNull { index ->
        val call = code[index]
        if (call.opcode != Opcode.INVOKE_INTERFACE) return@mapNotNull null
        val reference = (call as ReferenceInstruction).reference as? MethodReference ?: return@mapNotNull null
        if (reference.parameterTypes.isNotEmpty() || !reference.returnType.startsWith("L")) return@mapNotNull null
        val landing = code.getOrNull(index + 1)
        if (landing?.opcode != Opcode.MOVE_RESULT_OBJECT) return@mapNotNull null
        val kindClass = classOf(reference.returnType) ?: return@mapNotNull null
        if (!categoryNames(kindClass).containsAll(FILTER_KINDS)) return@mapNotNull null
        val flagCall = (index + 2..minOf(code.size - 3, index + FLAG_REACH)).firstOrNull { at ->
            val candidate = code[at]
            if (candidate.opcode != Opcode.INVOKE_STATIC) return@firstOrNull false
            val target = (candidate as ReferenceInstruction).reference as? MethodReference ?: return@firstOrNull false
            target.definingClass == MOBILE_CONFIG && target.returnType == "Z" &&
                target.parameterTypes.map(CharSequence::toString) == listOf(OBJECT, "J") &&
                code[at + 1].opcode == Opcode.MOVE_RESULT && code[at + 2].opcode == Opcode.IF_NEZ &&
                (code[at + 1] as OneRegisterInstruction).registerA == (code[at + 2] as OneRegisterInstruction).registerA
        } ?: return@mapNotNull null
        val filter = (call as FiveRegisterInstruction).registerC
        val kind = (landing as OneRegisterInstruction).registerA
        val flag = (code[flagCall + 1] as OneRegisterInstruction).registerA
        if (maxOf(filter, kind, flag) > 15) return@mapNotNull null
        KindRead(index, filter, kind, reference.returnType, flagCall + 1, flag)
    }
    return reads.singleOrNull()
}

/** Where a tap handler tests for a filter sheet's own callback, which skips the kind read when there is one. */
internal class CallbackTest(
    /** The index of the if-eqz on the callback; with none it jumps to the kind read. */
    val test: Int,
    /** The register the filter is in. */
    val filter: Int,
    /** The register Facebook's first read of the kind landed in. */
    val kind: Int,
    /** The register the callback is in. */
    val callback: Int,
    /** The callback's type, as the field it was read from declares it. */
    val callbackType: String,
)

/**
 * The one if-eqz in [method] that jumps straight to [read]'s kind call, right after the same kind call
 * on the same filter, its move-result and its if-eqz, or null. The register it tests was last loaded
 * from an instance field, whose type the hook casts back to.
 */
internal fun callbackTest(method: Method, read: KindRead): CallbackTest? {
    val code = method.implementation?.instructions?.toList() ?: return null
    val address = IntArray(code.size + 1)
    for (at in code.indices) address[at + 1] = address[at] + code[at].codeUnits
    val kindCall = (code[read.call] as ReferenceInstruction).reference
    val tests = (3 until read.call).mapNotNull { at ->
        val test = code[at]
        if (test.opcode != Opcode.IF_EQZ || address[at] + (test as OffsetInstruction).codeOffset != address[read.call]) {
            return@mapNotNull null
        }
        val first = code[at - 3]
        val landing = code[at - 2]
        val kindTest = code[at - 1]
        if (first.opcode != Opcode.INVOKE_INTERFACE || (first as ReferenceInstruction).reference != kindCall) return@mapNotNull null
        if ((first as FiveRegisterInstruction).registerC != read.filter) return@mapNotNull null
        if (landing.opcode != Opcode.MOVE_RESULT_OBJECT || kindTest.opcode != Opcode.IF_EQZ) return@mapNotNull null
        val kind = (landing as OneRegisterInstruction).registerA
        if ((kindTest as OneRegisterInstruction).registerA != kind) return@mapNotNull null
        val callback = (test as OneRegisterInstruction).registerA
        val load = (at - 4 downTo 0).firstOrNull { code[it].opcode == Opcode.IGET_OBJECT &&
            (code[it] as OneRegisterInstruction).registerA == callback } ?: return@mapNotNull null
        val field = (code[load] as ReferenceInstruction).reference as? FieldReference ?: return@mapNotNull null
        if (maxOf(read.filter, kind, callback) > 15 || callback == kind || callback == read.filter) return@mapNotNull null
        CallbackTest(at, read.filter, kind, callback, field.type)
    }
    return tests.singleOrNull()
}

/** Before the callback is tested, the extension is handed the filter, the first kind and the callback, and its answer goes back. */
internal fun MutableMethod.hookCallback(test: CallbackTest) {
    addInstructions(
        test.test,
        """
            invoke-static { v${test.filter}, v${test.kind}, v${test.callback} }, $CALLBACK
            move-result-object v${test.callback}
            check-cast v${test.callback}, ${test.callbackType}
        """,
    )
}

/** After the flag is read, the extension is handed it and its answer goes back into the register. */
internal fun MutableMethod.hookFlag(read: KindRead) {
    addInstructions(
        read.flagResult + 1,
        """
            invoke-static { v${read.flag} }, $BOTTOM_SHEET
            move-result v${read.flag}
        """,
    )
}

/** After the kind is read, the extension is handed the filter and the kind and its answer goes back into the kind's register. */
internal fun MutableMethod.hookKind(read: KindRead) {
    addInstructions(
        read.call + 2,
        """
            invoke-static { v${read.filter}, v${read.kind} }, $KIND
            move-result-object v${read.kind}
            check-cast v${read.kind}, ${read.kindType}
        """,
    )
}
