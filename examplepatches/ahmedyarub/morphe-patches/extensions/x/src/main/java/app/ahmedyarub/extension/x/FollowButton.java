package app.ahmedyarub.extension.x;

import android.content.Context;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * State for the follow button added to timeline posts. The app's own follow button draws it and
 * follows or unfollows through the app's friendship handler, which the patch builds from the
 * friendship factory captured here.
 */
@SuppressWarnings("unused")
public final class FollowButton {
    private static volatile Object factory;
    private static volatile Object handler;

    private FollowButton() {
    }

    /** Injection point: the app's friendship factory, as it is created. */
    public static void onFactory(Object friendshipFactory) {
        if (factory == null) factory = friendshipFactory;
    }

    /** The captured friendship factory, or null before the app made one. */
    public static Object factory() {
        return factory;
    }

    /** The friendship handler the patch built from the factory, or null before it did. */
    public static Object handler() {
        return handler;
    }

    public static void setHandler(Object friendshipHandler) {
        handler = friendshipHandler;
    }

    /**
     * Whether a post by this author gets the button: every author but the signed-in user, and none
     * while the signed-in user is not known, which would put it on their own posts.
     */
    public static boolean shouldShow(long authorId) {
        long self = selfId();
        return self != -1 && authorId != self;
    }

    /** The signed-in account, read each time: switching accounts changes it. */
    private static long selfId() {
        try {
            Context context = Utils.getContext();
            if (context == null) return -1;
            return context.getSharedPreferences(context.getPackageName() + "_preferences", Context.MODE_PRIVATE)
                    .getLong("current_user_id", -1);
        } catch (Exception ex) {
            Logger.printException(() -> "FollowButton could not read the signed-in user", ex);
            return -1;
        }
    }
}
