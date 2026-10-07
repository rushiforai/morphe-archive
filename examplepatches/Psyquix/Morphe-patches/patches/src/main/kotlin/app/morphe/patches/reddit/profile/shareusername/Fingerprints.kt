package app.morphe.patches.reddit.profile.shareusername

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.instanceOf
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Hooks for the profile share sheet on 2026.40.0 and 2026.39.0.
 *
 * The sheet is Jetpack Compose driven by `ActionItem` data objects. Hook 1
 * appends 2 rows to the profile action list; Hook 2 intercepts their clicks.
 * All references below were transcribed from apktool output of both APKs.
 *
 * Matching rules that MUST be honored (learned from a silent miss):
 * - The patcher matches instruction filters IN LISTED ORDER (each filter
 *   scans forward from the previous match; any miss fails the method). List
 *   filters in the exact order the instructions appear in the target method.
 * - Avoid obfuscated type names anywhere: R8 renames them per build, so a
 *   fingerprint containing them resolves on the fingerprinted APK only.
 *   Prefer stable `ActionItem`/`IconEnum` refs, omit parameter lists whose
 *   types are obfuscated, and match calls by defining class + name only.
 *
 * - [ProfileShareListFingerprint]: `handler/a.c(List)List`. Verified signal
 *   order on both versions: `IconEnum.Share` sget → `ActionItem.<init>` →
 *   `IconEnum.Link` sget → `ArrayList.add(int, Object)`. No other method
 *   app-wide contains this ordered combination.
 * - [ProfileShareClick40Fingerprint] / [ProfileShareClick39Fingerprint]:
 *   the click dispatch (`g` on 40.0, `f` on 39.0; same body shape).
 *   Verified signal order on both: `instance-of
 *   ...onActionItemClicked$1` (unique app-wide) → `ActionItem.a` read →
 *   `hashCode()` call. Obfuscated wrapper/continuation types are deliberately
 *   NOT constrained; the g-vs-f split only selects the injected smali.
 */

// ActionItem ids for the injected rows. Must avoid the two literal ids the
// dispatch compares (`-0x3a13764e`, `-0x7fec8d81` on both versions); every
// other stock id is a runtime identity `hashCode()`, so fixed distinctive
// constants cannot collide in practice. 0x6D6F7270 = ASCII "morp".
internal const val COPY_USERNAME_ID = 0x6D6F7270
internal const val OPEN_GHOSTDDIT_ID = 0x6D6F7271

// Row icons. Single swappable constants per Ruling R2: custom U/ghost vectors
// cannot feed Compose rows without a painter bridge (deferred), so the stable
// non-obfuscated `IconEnum` entries are used (present on both versions).
internal const val COPY_USERNAME_ICON = "Clipboard"
internal const val OPEN_GHOSTDDIT_ICON = "External"

private const val ACTION_ITEM_CTOR =
    "Lcom/reddit/sharing/actions/ActionItem;-><init>" +
        "(IILjava/lang/String;Ljava/lang/String;Ljava/lang/Integer;" +
        "Lcom/reddit/ui/compose/icons/IconEnum;ZZLjava/util/List;" +
        "ILandroid/os/Bundle;ZLjava/lang/String;I)V"

internal object ProfileShareListFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/util/List;",
    parameters = listOf("Ljava/util/List;"),
    filters = listOf(
        fieldAccess(smali = "Lcom/reddit/ui/compose/icons/IconEnum;->Share:Lcom/reddit/ui/compose/icons/IconEnum;"),
        methodCall(smali = ACTION_ITEM_CTOR),
        fieldAccess(smali = "Lcom/reddit/ui/compose/icons/IconEnum;->Link:Lcom/reddit/ui/compose/icons/IconEnum;"),
        methodCall(smali = "Ljava/util/ArrayList;->add(ILjava/lang/Object;)V")
    )
)

internal object ProfileShareClick40Fingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        instanceOf("Lcom/reddit/sharing/actions/handler/ActionsScreenEventHandler\$onActionItemClicked\$1;"),
        fieldAccess(
            definingClass = "Lcom/reddit/sharing/actions/ActionItem;",
            name = "a"
        ),
        methodCall(
            definingClass = "Ljava/lang/Object;",
            name = "hashCode"
        )
    )
)

internal object ProfileShareClick39Fingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        instanceOf("Lcom/reddit/sharing/actions/handler/ActionsScreenEventHandler\$onActionItemClicked\$1;"),
        fieldAccess(
            definingClass = "Lcom/reddit/sharing/actions/ActionItem;",
            name = "a"
        ),
        methodCall(
            definingClass = "Ljava/lang/Object;",
            name = "hashCode"
        )
    )
)
