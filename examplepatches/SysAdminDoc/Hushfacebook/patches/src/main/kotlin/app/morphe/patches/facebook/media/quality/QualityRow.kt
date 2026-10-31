/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.media.quality

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import app.morphe.patches.facebook.misc.extension.parameterRegister
import app.morphe.patches.facebook.misc.extension.parameterRegisterNumber
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.iface.Method

/*
 * Keeps a reel's Quality row (issue #286, read from 585 arm64 and v7a, 2026-10-31).
 *
 * The reels three-dot sheet adds its Quality row only while the player's list of available quality
 * labels isn't empty. The player's downstream-format callback (585 arm64 LX/05iS;->Ht1, v7a
 * LX/05iY;->Hsz) refills that list, an AtomicReference in the player's state, from its third
 * argument on every format change, and replaces the stored list whenever the sizes differ, an empty
 * one included. When Facebook's own evaluator falls back (no labelled tracks for a moment), the
 * empty list lands in the field and the row goes with it, the moment quality drops too. Facebook
 * decides this, not our hooks, which only read the preselected label. The hook
 * hands the incoming list to the extension, which answers the last non-empty list this player had in
 * place of an empty one.
 *
 * The callback is the one method holding the format summary literal below, taking (format, String,
 * List, long, boolean) and returning void.
 */
internal const val QUALITY_LIST = "$EXTENSION_PACKAGE/media/QualityList;"
internal const val KEEP_LIST = "$QUALITY_LIST->keep(Ljava/lang/Object;Ljava/util/List;)Ljava/util/List;"

/** The format summary the callback builds for the debug overlay, a literal Redex keeps. */
internal const val FORMAT_SUMMARY = "%dkbps, %dx%d, %s (%s)"

/** Whether [method] has the callback's shape: (format, String, List, long, boolean)V on an instance. */
internal fun isQualityListStore(method: Method): Boolean {
    val types = method.parameterTypes.map(CharSequence::toString)
    return method.returnType == "V" && types.size == 5 && types[1] == "Ljava/lang/String;" &&
        types[2] == "Ljava/util/List;" && types[3] == "J" && types[4] == "Z" && holdsString(method, FORMAT_SUMMARY)
}

/** The one method storing the player's quality labels, or a message naming what was found instead. */
internal fun BytecodePatchContext.findQualityListStore(): Result<Method> {
    val found = classDefByStrings(FORMAT_SUMMARY, StringComparisonType.EQUALS)
        .filterNot { it.type.startsWith(EXTENSION_CLASSES) }
        .flatMap { it.methods.filter(::isQualityListStore) }
    return found.singleOrNull()?.let { Result.success(it) }
        ?: Result.failure(IllegalStateException("expected one callback storing the quality labels, found ${found.size}"))
}

/** Puts the hook at the top of [store]. */
internal fun BytecodePatchContext.keepQualityRow(store: Method) {
    if (store.localRegisterCount() > 15 || store.parameterRegisterNumber(2) > 15) {
        throw IllegalStateException("the quality list callback keeps its list above v15, too high for the hook's call")
    }
    val owner = mutableClassDefBy(store.definingClass)
    val method = owner.findMutableMethodOf(store)
    val list = store.parameterRegister(2)
    method.addInstructions(
        0,
        """
            invoke-static { p0, $list }, $KEEP_LIST
            move-result-object $list
        """,
    )
}
