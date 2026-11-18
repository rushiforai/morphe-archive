/*
 * YTAfterglow for Android.
 *
 * Fingerprints adapted from the Change header, Navigation bar, toolbar hook and Hide player
 * overlay buttons patches of Morphe patches v2.2.0 (https://github.com/MorpheApp/morphe-patches,
 * GPLv3), forked from ReVanced patches (https://github.com/ReVanced/revanced-patches, GPLv3).
 * Modified for YTAfterglow: rewritten for patcher 2.1.0 and checked one by one against YouTube
 * 21.43.523. Not an official Morphe or ReVanced file.
 *
 * Portions of this software are provided "AS IS" by the Morphe software project.
 * Any express or implied warranties, including the implied warranties of
 * merchantability and fitness for a particular purpose, are disclaimed.
 */

@file:Suppress("SpellCheckingInspection")

package app.afterglow.patches.tweaks.navigation

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.anyInstruction
import app.morphe.patcher.checkCast
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/*
 * Every fingerprint below names what it resolves to in YouTube 21.43.523
 * (classes*.dex of the APK), as checked against `dexdump -d`.
 */

// region YouTube logo

/**
 * Sets the toolbar logo: the doodle, else ?attr/ytPremiumWordmarkHeader for Premium accounts,
 * else ?attr/ytWordmarkHeader, then `setImageDrawable` (the target of every branch).
 *
 * 21.43.523: `Lpuy;->l(Landroid/widget/ImageView;)V` (classes.dex).
 */
internal object HeaderLogoFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/widget/ImageView;"),
    filters = listOf(
        resourceLiteral(ResourceType.ATTR, "ytPremiumWordmarkHeader"),
        resourceLiteral(ResourceType.ATTR, "ytWordmarkHeader"),
        methodCall(smali = "Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V"),
    ),
)

/**
 * The icon table (IconType enum -> drawable or attribute), which maps YOUTUBE_LOGO to
 * ?attr/ytWordmarkHeader and YOUTUBE_PREMIUM_LOGO to ?attr/ytPremiumWordmarkHeader.
 *
 * 21.43.523: `Lklp;-><clinit>()V` (classes.dex).
 */
internal object HeaderLogoIconTableFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
    filters = listOf(
        resourceLiteral(ResourceType.ATTR, "ytWordmarkHeader"),
        resourceLiteral(ResourceType.ATTR, "ytPremiumWordmarkHeader"),
    ),
)

// endregion

// region Toolbar buttons

/**
 * Builds a toolbar button from its renderer: resolves the icon type (enum `Lbgdf;`, whose names
 * such as TAB_ACTIVITY_CAIRO survive), then loads the button's ImageView and its drawable.
 * instructionMatches[3] is the icon enum, [6] the ImageView.
 *
 * 21.43.523: `Lpso;->h(Landroid/view/MenuItem;Landroid/content/Context;)V` (classes.dex).
 */
internal object ToolbarButtonFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    filters = listOf(
        resourceLiteral(ResourceType.ID, "menu_item_view"),
        methodCall(smali = "Landroid/view/MenuItem;->setShowAsAction(I)V"),
        methodCall(opcode = Opcode.INVOKE_STATIC, returnType = "L", parameters = listOf("I")),
        opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately()),
        methodCall(opcode = Opcode.INVOKE_INTERFACE, returnType = "I", parameters = listOf("L")),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
        fieldAccess(opcode = Opcode.IGET_OBJECT, type = "Landroid/widget/ImageView;", location = MatchAfterWithin(6)),
        methodCall(definingClass = "Landroid/content/res/Resources;", name = "getDrawable", location = MatchAfterWithin(8)),
        methodCall(definingClass = "Landroid/widget/ImageView;", name = "setImageDrawable", location = MatchAfterWithin(4)),
    ),
)

/** The classic toolbar search button's label. 21.43.523: `Lpsx;->n()Ljava/lang/CharSequence;`. */
private object ClassicSearchLabelFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/CharSequence;",
    parameters = listOf(),
    filters = listOf(resourceLiteral(ResourceType.STRING, "menu_search")),
)

/**
 * Shows the classic (non-Cairo) toolbar search menu item.
 *
 * 21.43.523: `Lpsx;->h(Landroid/view/MenuItem;Landroid/content/Context;)V` (classes.dex).
 */
internal object ClassicSearchButtonFingerprint : Fingerprint(
    classFingerprint = ClassicSearchLabelFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    filters = listOf(
        methodCall(opcode = Opcode.INVOKE_INTERFACE, smali = "Landroid/view/MenuItem;->setShowAsAction(I)V"),
    ),
)

// endregion

// region Voice search

/** The search fragment. 21.43.523: `Lozv;` (classes.dex), the class of "search-lens-button". */
private object SearchFragmentFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Landroid/view/View;",
    filters = listOf(string("search-lens-button")),
)

/**
 * Updates the search box buttons as the text changes: clear, microphone (instructionMatches[2])
 * and lens.
 *
 * 21.43.523: `Lozv;->bN(Ljava/lang/String;)V` (classes.dex); the microphone is `Lozv;->bd`.
 */
internal object SearchBoxButtonsFingerprint : Fingerprint(
    classFingerprint = SearchFragmentFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        methodCall(opcode = Opcode.INVOKE_STATIC, smali = "Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z"),
        methodCall(opcode = Opcode.INVOKE_VIRTUAL, smali = "Landroid/view/View;->setVisibility(I)V"),
        methodCall(opcode = Opcode.INVOKE_VIRTUAL, smali = "Landroid/view/View;->setVisibility(I)V"),
        methodCall(opcode = Opcode.INVOKE_VIRTUAL, smali = "Landroid/view/View;->setVisibility(I)V"),
    ),
)

/**
 * Creates the search fragment's views, where the microphone field is set.
 *
 * 21.43.523: `Lozv;->O(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;`.
 */
internal object SearchFragmentViewFingerprint : Fingerprint(
    classFingerprint = SearchFragmentFingerprint,
    returnType = "Landroid/view/View;",
    parameters = listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;"),
    filters = listOf(string("search-lens-button")),
)

/**
 * The search results page's search box: after the lens flag (45423782), finds voice_search.
 *
 * 21.43.523: `Lpah;->O(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;`.
 */
internal object SearchResultsVoiceButtonFingerprint : Fingerprint(
    returnType = "Landroid/view/View;",
    parameters = listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;"),
    filters = listOf(
        literal(45423782L),
        resourceLiteral(ResourceType.ID, "voice_search"),
        methodCall(smali = "Landroid/view/View;->findViewById(I)Landroid/view/View;", location = MatchAfterImmediately()),
        opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately()),
    ),
)

// endregion

// region Cast

/**
 * Sets up the toolbar Cast menu item (castmediaroutebutton), then setShowAsAction.
 *
 * 21.43.523: `Lndg;->h(Landroid/view/MenuItem;Landroid/content/Context;)V` (classes.dex).
 */
internal object CastMenuItemFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    filters = listOf(
        resourceLiteral(ResourceType.LAYOUT, "castmediaroutebutton"),
        methodCall(name = "setShowAsAction"),
    ),
)

/** Shows or hides the toolbar Cast menu item. 21.43.523: `Lndg;->p()V`. */
internal object CastMenuItemVisibilityFingerprint : Fingerprint(
    classFingerprint = CastMenuItemFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(),
    filters = listOf(methodCall(name = "setVisible")),
)

/**
 * Sets the visibility of the player's Cast buttons: MediaRouteButton ([1]) and
 * MdxEntryPointButton ([3]).
 *
 * 21.43.523: `Lansi;->d()V` (classes2.dex).
 */
internal object PlayerCastButtonFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        checkCast("Landroidx/mediarouter/app/MediaRouteButton;"),
        // GmsCore support in patches-2.0.0 depends on the official overlay-button
        // patch, which inserts invoke-static + move-result before setVisibility.
        methodCall(smali = "Landroid/view/View;->setVisibility(I)V", location = MatchAfterWithin(3)),
        checkCast("Lcom/google/android/libraries/youtube/mdx/mediaroute/entrypoint/MdxEntryPointButton;"),
        methodCall(smali = "Landroid/view/View;->setVisibility(I)V", location = MatchAfterWithin(3)),
        literal(11208L),
    ),
)

/**
 * Cast entry point flags: 45690091 (player, 5 reads: `Lansi;->m()Z`, `Lkvk;->av`, `Lnyx;->f`,
 * `Lnyx;->g`, `Lrve;->q`) and 45690090 (toolbar and feed, 7 reads incl. `Lndg;->h`).
 */
internal object CastPlayerFlagFingerprint : Fingerprint(filters = listOf(literal(45690091L)))
internal object CastActionFlagFingerprint : Fingerprint(filters = listOf(literal(45690090L)))

// endregion

// region Tab bar

internal const val PIVOT_BAR_CLASS = "Lcom/google/android/libraries/youtube/rendering/ui/pivotbar/PivotBar;"

/**
 * A tab's label holder; the constructor sets the label text.
 *
 * 21.43.523: `Lavcc;-><init>(PivotBar;Landroid/widget/TextView;Ljava/lang/CharSequence;)V` (classes2.dex).
 */
internal object TabLabelFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf(PIVOT_BAR_CLASS, "Landroid/widget/TextView;", "Ljava/lang/CharSequence;"),
    filters = listOf(methodCall(definingClass = "Landroid/widget/TextView;", name = "setText")),
)

/**
 * A tab view: finds the new content dot stub in the inflated tab ([1] is its findViewById, whose
 * receiver is the tab view).
 *
 * 21.43.523: `Lavbz;-><init>(PivotBar;ILandroid/view/ViewGroup;...)V` (classes2.dex).
 */
internal object TabViewFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    filters = listOf(
        resourceLiteral(ResourceType.ID, "new_content_dot"),
        methodCall(smali = "Landroid/view/View;->findViewById(I)Landroid/view/View;", location = MatchAfterImmediately()),
    ),
    custom = { method, _ -> method.parameterTypes.firstOrNull()?.toString() == PIVOT_BAR_CLASS },
)

/**
 * Flag 45630927, the blurred translucent ("frosted glass") tab bar, read once while the main
 * activity is set up; with it on (Android 12+) YouTube attaches its frostedGlassRenderNode.
 *
 * 21.43.523: `Lrrb;->run()V` (classes.dex), which then calls `Lrrm;->q()V`.
 */
internal object FrostedTabBarFlagFingerprint : Fingerprint(filters = listOf(literal(45630927L)))

// endregion

// region Startup page

/**
 * Builds the endpoint of YouTube's default page, "FEwhat_to_watch" (the string is [0]).
 *
 * 21.43.523: `Lauoa;->s(Lavsn;)Lkpp;` (classes2.dex).
 */
internal object StartupBrowseIdFingerprint : Fingerprint(
    returnType = "L",
    filters = listOf(
        string("FEwhat_to_watch"),
        literal(512),
        fieldAccess(opcode = Opcode.IPUT_OBJECT, type = "Ljava/lang/String;"),
    ),
)

/** Handles the launch intent. 21.43.523: `Lrpf;->d(Landroid/content/Intent;)V` (classes.dex). */
internal object LaunchIntentFingerprint : Fingerprint(
    parameters = listOf("Landroid/content/Intent;"),
    filters = listOf(string("has_handled_intent")),
)

/**
 * Prepares the guide request; [0] reads the startup milestone flag it waits for.
 *
 * 21.43.523: `Lnav;->d()V` (classes.dex).
 */
internal object GuideRequestFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        anyInstruction(literal(1074004527L), literal(268698159L)),
        anyInstruction(literal(1073880817L), literal(268574449L)),
    ),
)

// endregion

// region Shorts

/**
 * Decides whether to resume the Shorts player at launch; [0] builds the decision, whose first
 * boolean (start register + 2) is "user was in Shorts".
 *
 * 21.43.523: `Lavgi;->i(Ljava/util/function/Supplier;Lbcqm;Ljava/lang/String;)Lpna;` (classes2.dex).
 */
internal object ShortsResumeFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "L",
    parameters = listOf("Ljava/util/function/Supplier;", "L", "Ljava/lang/String;"),
    filters = listOf(
        methodCall(opcode = Opcode.INVOKE_DIRECT_RANGE, name = "<init>", parameters = listOf("L", "Z", "Z", "L", "Z")),
        methodCall(
            opcode = Opcode.INVOKE_DIRECT_RANGE,
            name = "<init>",
            parameters = listOf("L", "L", "L", "L", "L", "Ljava/lang/String;"),
            location = MatchAfterWithin(50),
        ),
    ),
)

/** Flag 45358360, "resume Shorts at launch", 4 reads incl. the flag tables. */
internal object ShortsResumeFlagFingerprint : Fingerprint(filters = listOf(literal(45358360L)))

/** The Shorts loop behavior enum. 21.43.523: `Lblfp;-><clinit>()V` (classes3.dex). */
internal object ReelLoopBehaviorFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
    filters = listOf(
        string("REEL_LOOP_BEHAVIOR_UNKNOWN"),
        string("REEL_LOOP_BEHAVIOR_AUTO_ADVANCE"),
    ),
)

/** The Shorts playback state listener. 21.43.523: `Latey;` (classes6.dex). */
private object ReelPlaybackListenerFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        methodCall(smali = "Lj\$/time/Instant;->toEpochMilli()J"),
        string("r_tr"),
    ),
)

/**
 * Reacts to a Short's playback state; when it ends it reads the loop behavior (the second filter).
 *
 * 21.43.523: `Latey;->a(Lardq;)V`, reading `Latez;->bv(Lbgsp;Lbdso;)Lblfp;`.
 */
internal fun reelPlaybackFingerprint(loopBehaviorClass: String) = Fingerprint(
    classFingerprint = ReelPlaybackListenerFingerprint,
    returnType = "V",
    parameters = listOf("L"),
    filters = listOf(
        methodCall(smali = "Lj\$/util/Optional;->ofNullable(Ljava/lang/Object;)Lj\$/util/Optional;"),
        methodCall(returnType = loopBehaviorClass),
    ),
)

/**
 * Opens a Short in the Shorts player. p1 is the playback start descriptor.
 *
 * 21.43.523: `Lkyx;->f(Lasbs;Ljava/util/Map;JLjava/lang/String;)V` (classes4.dex).
 */
internal object ShortsPlaybackIntentFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PROTECTED, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("L", "Ljava/util/Map;", "J", "Ljava/lang/String;"),
    filters = listOf(
        string("PLAYBACK_START_DESCRIPTOR_MUTATOR"),
        string("com.google.android.apps.youtube.app.endpoint.flags"),
        string("com.google.android.libraries.youtube.rendering.elements.sender_view"),
    ),
)

/**
 * The playback start descriptor's toString; the first String getter after Locale is the video id.
 *
 * 21.43.523: `Lasbs;->toString()` (classes2.dex), video id `Lasbs;->x()Ljava/lang/String;`.
 */
internal object PlaybackStartDescriptorToStringFingerprint : Fingerprint(
    name = "toString",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/String;",
    filters = listOf(
        methodCall(smali = "Ljava/util/Locale;->getDefault()Ljava/util/Locale;"),
        methodCall(returnType = "Ljava/lang/String;", parameters = listOf()),
        string("PlaybackStartDescriptor:", StringComparisonType.STARTS_WITH),
    ),
)

/**
 * Builds the watch descriptor of a "vnd.youtube" intent.
 *
 * 21.43.523: `Lasck;->a(Landroid/content/Intent;)Lasck;` (classes2.dex).
 */
internal object WatchDescriptorFactoryFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "L",
    parameters = listOf("Landroid/content/Intent;"),
    strings = listOf("android.intent.extra.inventory_identifier", "http", "vnd.youtube", "No video id in the Uri: "),
)

// endregion

// region Privacy

/**
 * Copy link of the share panel; [0] reads the link.
 *
 * 21.43.523: `Lalzn;->b(Lbdso;Ljava/util/Map;)V` (classes6.dex).
 */
internal object CopyLinkFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L", "Ljava/util/Map;"),
    filters = listOf(
        opcode(Opcode.IGET_OBJECT),
        string("text/plain", location = MatchAfterWithin(2)),
        methodCall(
            smali = "Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;",
            location = MatchAfterWithin(2),
        ),
        opcode(Opcode.MOVE_RESULT_OBJECT, location = MatchAfterWithin(2)),
        methodCall(smali = "Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V", location = MatchAfterWithin(2)),
    ),
)

/**
 * Share panel to another app; [3] puts the link in the intent.
 *
 * 21.43.523: `Lapql;->b(Lbdso;Ljava/util/Map;)V` (classes6.dex).
 */
internal object ShareSheetFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L", "Ljava/util/Map;"),
    filters = listOf(
        opcode(Opcode.IGET_OBJECT),
        checkCast("Ljava/lang/String;", location = MatchAfterImmediately()),
        opcode(Opcode.GOTO, location = MatchAfterImmediately()),
        methodCall(smali = "Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;"),
        string("YTShare_Logging_Share_Intent_Endpoint_Byte_Array"),
    ),
)

/**
 * The system share sheet; [3] puts the link in the intent.
 *
 * 21.43.523: `Ljdv;->b(Lbdso;Ljava/util/Map;)V` (classes4.dex).
 */
internal object SystemShareSheetFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L", "Ljava/util/Map;"),
    filters = listOf(
        methodCall(smali = "Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;"),
        methodCall(smali = "Ljava/util/List;->iterator()Ljava/util/Iterator;", location = MatchAfterWithin(4)),
        fieldAccess(opcode = Opcode.IGET_OBJECT, type = "Ljava/lang/String;", location = MatchAfterWithin(15)),
        methodCall(
            smali = "Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;",
            location = MatchAfterWithin(15),
        ),
    ),
)

/**
 * Opens a link from the comments; [1] builds the VIEW intent with the link.
 *
 * 21.43.523: `Ljis;->b(Lbdso;Ljava/util/Map;)V` (classes4.dex).
 */
internal object CommentsLinkFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("L", "Ljava/util/Map;"),
    returnType = "V",
    strings = listOf("parentCsn", "URL_KEY", "navigation_endpoint", "WEB_VIEW_BOTTOM_SHEET_TAG"),
    filters = listOf(
        string("android.intent.action.VIEW"),
        methodCall(
            opcode = Opcode.INVOKE_DIRECT,
            smali = "Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V",
            // Morphe's redirect hook inserts an invoke/move-result pair before
            // this constructor. Keep the exact URI constructor and method
            // anchors while allowing that verified composition.
            location = MatchAfterWithin(3),
        ),
    ),
)

/**
 * Opens a link from descriptions and posts; p1 is the link.
 *
 * 21.43.523: `Laepn;->l(Landroid/content/Context;Landroid/net/Uri;)Z` (classes5.dex).
 */
internal object DescriptionLinkFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Landroid/content/Context;", "Landroid/net/Uri;"),
    returnType = "Z",
    strings = listOf("android.intent.action.VIEW", "text/html", "Activity not found to view uri"),
)

/**
 * Shows the search suggestions of the search box; [0] reads their collection (a public field
 * of the parameter).
 *
 * 21.43.523: `Lozv;->aT(Lavmj;)V` (classes.dex), collection `Lavmj;->c:Ljava/util/Collection;`.
 */
internal object SearchSuggestionsFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("L"),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_OBJECT, type = "Ljava/util/Collection;"),
        methodCall(smali = "Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V", location = MatchAfterWithin(5)),
        fieldAccess(opcode = Opcode.IGET_OBJECT, type = "Ljava/lang/String;"),
        methodCall(smali = "Ljava/lang/String;->isEmpty()Z", location = MatchAfterWithin(5)),
        resourceLiteral(ResourceType.DIMEN, "suggestion_category_divider_height"),
    ),
)

// endregion
