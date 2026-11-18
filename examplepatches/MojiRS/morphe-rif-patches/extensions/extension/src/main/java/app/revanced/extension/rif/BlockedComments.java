package app.revanced.extension.rif;

/**
 * "Hide blocked mod comments": rif drops a blocked user's comments (with their replies) while
 * it flattens the comment tree, but only the ones Reddit marks {@code collapsed_reason_code =
 * BLOCKED_AUTHOR}, and never a distinguished (mod or admin) one. Reddit doesn't send that code
 * for a distinguished comment; it sends {@code unrepliable_reason = NEAR_BLOCKED} instead.
 *
 * The patch hooks rif's filter ({@code k0} in the comments-page adapter) and asks us first,
 * passing {@code NEAR_BLOCKED} and the {@code distinguished} value. When we say yes, rif goes on
 * to its own permalink and "viewer moderates the sub" exceptions, so those still show the comment.
 */
public final class BlockedComments {

    private BlockedComments() {}

    /** Called from rif's filter for every comment. Must be cheap and must never throw. */
    public static boolean hide(boolean nearBlocked, String distinguished) {
        try {
            return shouldHide(Settings.hideBlockedDistinguished(), nearBlocked, distinguished);
        } catch (Throwable t) {
            return false;
        }
    }

    static boolean shouldHide(boolean enabled, boolean nearBlocked, String distinguished) {
        return enabled && nearBlocked && distinguished != null && !distinguished.isEmpty();
    }
}
