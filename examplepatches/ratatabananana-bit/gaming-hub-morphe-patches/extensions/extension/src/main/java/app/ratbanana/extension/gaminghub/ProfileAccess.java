package app.ratbanana.extension.gaminghub;

import android.content.Context;
import android.content.Intent;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;

/**
 * Opens the gamer profile, which holds the play history, without a Samsung account.
 */
@SuppressWarnings("unused")
public final class ProfileAccess {

    private static final String PROFILE_ACTIVITY =
            "com.samsung.android.game.gamehome.app.profile.ProfileActivity";

    /** Toolbar profile button shown while signed out, which has no click action of its own. */
    private static final String SIGNED_OUT_PROFILE_BUTTON_ID = "profile_sign_out_container";

    private ProfileAccess() {
    }

    /**
     * Injection point. Replaces the sign-in prompt the profile button shows without an account.
     *
     * @param fragment The home screen fragment that owns the profile button.
     */
    public static void openProfile(Object fragment) {
        try {
            openProfile((Context) fragment.getClass().getMethod("getContext").invoke(fragment));
        } catch (ReflectiveOperationException | RuntimeException ex) {
            Log.e(SamsungAccount.TAG, "Failed to open the gamer profile", ex);
        }
    }

    /**
     * Injection point. Makes the signed-out profile button open the gamer profile.
     *
     * @param signedInProfileButton The signed-in profile button, a sibling of the signed-out one.
     */
    public static void enableSignedOutProfileButton(View signedInProfileButton) {
        if (signedInProfileButton == null) {
            return;
        }
        ViewParent parent = signedInProfileButton.getParent();
        if (!(parent instanceof ViewGroup)) {
            return;
        }

        Context context = signedInProfileButton.getContext();
        int id = context.getResources().getIdentifier(SIGNED_OUT_PROFILE_BUTTON_ID, "id", context.getPackageName());
        View signedOutProfileButton = id == 0 ? null : ((ViewGroup) parent).findViewById(id);
        if (signedOutProfileButton == null) {
            Log.e(SamsungAccount.TAG, "Signed-out profile button not found");
            return;
        }
        signedOutProfileButton.setOnClickListener(view -> openProfile(view.getContext()));
    }

    private static void openProfile(Context context) {
        if (context == null) {
            return;
        }
        try {
            context.startActivity(new Intent(context, Class.forName(PROFILE_ACTIVITY)));
        } catch (ClassNotFoundException | RuntimeException ex) {
            Log.e(SamsungAccount.TAG, "Failed to open the gamer profile", ex);
        }
    }
}
