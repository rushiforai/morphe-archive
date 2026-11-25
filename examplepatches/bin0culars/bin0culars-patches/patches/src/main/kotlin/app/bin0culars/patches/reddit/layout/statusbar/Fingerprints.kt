package app.bin0culars.patches.reddit.layout.statusbar

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import com.android.tools.smali.dexlib2.AccessFlags

internal const val EXTENSION_CLASS = "Lapp/bin0culars/extension/reddit/SeeThroughStatusBarPatch;"

object HomeScaffoldFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "L",
        "L",
        "L",
        "Lkotlin/jvm/functions/Function1;",
        "L",
        "Z",
        "Z",
        "Lcom/reddit/listing/model/sort/SortType;",
        "Lkotlin/jvm/functions/Function2;",
        "Z",
        "Z",
        "Lkotlin/jvm/functions/Function0;",
        "L",
        "Lkotlin/jvm/functions/Function0;",
        "Landroidx/compose/runtime/internal/a;",
        "Landroidx/compose/runtime/internal/a;",
        "L",
        "Landroidx/compose/runtime/internal/a;",
        "L",
        "I",
    ),
)

object HomeTopBarHeightFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Lcom/reddit/feedslegacy/switcher/impl/homepager/compose/HomePagerScreen;",
    returnType = "F",
    parameters = listOf(),
    filters = listOf(
        literal(0x42500000),
    ),
)
