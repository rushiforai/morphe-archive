package app.template.extension.pdb;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;

/**
 * Navigation into Pdb's own (kept, non-obfuscated) activity classes.
 *
 * <p>The class names come from Pdb's shipped TheRouter map
 * ({@code RouterMap__TheRouter__*.smali}); every target below is a real
 * {@code pdb.app.*} class in the current build. Because the extension runs inside
 * Pdb's process, starting the (non-exported) activities directly is allowed.
 *
 * <p>Route parameters were taken from each activity's own intent reads
 * (e.g. {@code ProfileDetailActivity} reads the {@code "id"} extra).
 */
public final class PdbNav {

    /* Hidden / buried screens (kept class names, from the router map). */
    public static final String PROFILE_DETAIL  = "pdb.app.user.profile.ProfileDetailActivity"; // extra "id"
    public static final String USER_PROFILE    = "pdb.app.user.UserProfileActivity";           // /user/profile/detail
    public static final String USER_DATABASE   = "pdb.app.user.database.UserDatabaseActivity"; // /user/database
    public static final String USER_VISITOR    = "pdb.app.user.UserVisitStatusListActivity";   // /user/visitor
    public static final String USER_CENTER     = "pdb.app.user.center.UserCenterActivity";     // /user/center
    public static final String FOLLOWS         = "pdb.app.user.relationship.UserFollowListActivity";
    public static final String PERSONALITY     = "pdb.app.user.personality.UserPersonalityActivity";
    public static final String SUBCONSCIOUS    = "pdb.app.user.subconscious.SubconsciousActivity";
    public static final String COINS_ENGAGE    = "pdb.app.user.coins.CoinsEngageActivity";
    public static final String BALANCE         = "pdb.app.user.balance.BalanceActivity";
    public static final String AWARD_CENTER    = "pdb.app.user.award.UserAwardCenterActivity";
    public static final String COMMUNITY_INFO  = "pdb.app.user.activity.PDBUserCommunityInfoActivity";
    public static final String VERIFY          = "pdb.app.user.verify.UserVerifyActivity";
    public static final String STORY_EDITOR    = "pdb.app.user.irl.editor.StoryEditorActivity";
    public static final String PROFILE_SETTING = "pdb.app.user.setting.UserProfileSettingActivity";
    public static final String DB_PAGE         = "pdb.app.user.pdbpage.ManagerPDBPageActivity";
    public static final String INSTANT_CHAT    = "pdb.app.chat.instant.InstantChatWaitingActivity";
    public static final String INSTANT_HISTORY = "pdb.app.chat.instant.InstantChatHistoryActivity";
    public static final String COMMUNITY_EXPLORE = "pdb.app.community.CommunityExploreActivity";
    public static final String BOARD_EXPLORE   = "pdb.app.profilebase.board.explore.ExploreBoardActivity";
    public static final String AI_DETAIL       = "pdb.app.profilebase.ai.detail.AiFriendDetailActivity";
    public static final String TWEAKS          = "pdb.app.tweak.TweaksActivity";

    private PdbNav() {}

    /** Starts one of the app's activities; returns false (with a toast) on failure. */
    public static boolean start(Context ctx, String className) {
        try {
            Intent intent = new Intent();
            intent.setClassName(ctx.getPackageName(), className);
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            ctx.startActivity(intent);
            return true;
        } catch (Throwable t) {
            PdbTools.toast(ctx, "Morphe: cannot open " + simpleName(className) + " — " + t);
            return false;
        }
    }

    /** Opens any URL/path through the app's own router/deep-link handling. */
    public static boolean openLink(Context ctx, String uri) {
        try {
            String value = uri.trim();
            if (!value.contains("://")) value = "pdb://" + value;
            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(value));
            intent.setPackage(ctx.getPackageName());
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            ctx.startActivity(intent);
            return true;
        } catch (Throwable t) {
            PdbTools.toast(ctx, "Morphe: link failed — " + t);
            return false;
        }
    }

    /** Opens another user's profile (the screen reads the "id" extra). */
    public static boolean openProfile(Context ctx, String userId) {
        if (userId == null || userId.trim().isEmpty()) return false;
        try {
            Intent intent = new Intent();
            intent.setClassName(ctx.getPackageName(), PROFILE_DETAIL);
            intent.putExtra("id", userId.trim());
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            ctx.startActivity(intent);
            return true;
        } catch (Throwable t) {
            PdbTools.toast(ctx, "Morphe: cannot open profile — " + t);
            return false;
        }
    }

    /**
     * Opens the instant-chat flow. Callers that want a *specific* partner must first
     * set Pdb's dev preference {@code debugInstantChatUserId} (its matcher reads it
     * while the waiting screen pairs).
     */
    public static boolean openInstantChat(Context ctx) {
        return start(ctx, INSTANT_CHAT);
    }

    private static String simpleName(String name) {
        int slash = name.lastIndexOf('.');
        return slash >= 0 ? name.substring(slash + 1) : name;
    }

    private static String clsName(String name) {
        return name == null ? "?" : name;
    }
}
