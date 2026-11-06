package app.ahmedyarub.patches.reddit.drawer

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * `com.reddit.screens.drawer.community.HeaderItem`, the enum naming each section of the
 * community drawer. Not obfuscated, so its constants can be referenced by name.
 */
internal const val HEADER_ITEM_CLASS = "Lcom/reddit/screens/drawer/community/HeaderItem;"

/**
 * Locates the (obfuscated, R8-merged) utility class holding the drawer section builder, by
 * way of the sibling helper that maps a [HEADER_ITEM_CLASS] to its analytics section.
 *
 * Both the return type and the parameter are unobfuscated, which makes this a stable anchor
 * for a class whose own name changes every release.
 */
private object CommunityDrawerSectionParentFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Lcom/reddit/navdrawer/analytics/CommunityDrawerAnalytics\$Section;",
    parameters = listOf(HEADER_ITEM_CLASS)
)

/**
 * The community drawer's section builder:
 *
 * ```java
 * static void r(List list, Collection collection, own header, k500 pagination, boolean divider, int mask) {
 *     if (collection.isEmpty()) return;
 *     if (divider) list.add(new r6g());
 *     if (header != null) list.add(header);
 *     ...
 *     list.addAll(collection);
 * }
 * ```
 *
 * Every drawer section is appended through this one method, with the section's header UI
 * model as the third parameter. The early return on an empty collection is what the patch
 * relies on: emptying the collection drops the divider, the header and the items together,
 * rather than leaving a headed but empty section behind.
 */
internal object CommunityDrawerSectionBuilderFingerprint : Fingerprint(
    classFingerprint = CommunityDrawerSectionParentFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf(
        "Ljava/util/List;",
        "Ljava/util/Collection;",
        "L",
        "L",
        "Z",
        "I"
    ),
    filters = listOf(
        methodCall(smali = "Ljava/util/Collection;->isEmpty()Z")
    )
)
