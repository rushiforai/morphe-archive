package app.fakh.extension.linkedin;

import android.view.View;
import android.view.ViewTreeObserver;

/**
 * Hides the Post and Messaging buttons of the top bar of the home screen (home_top_bar). The app sets their visibility from several
 * places, so instead of chasing each call they are checked before every draw of the screen.
 */
@SuppressWarnings("unused")
public final class HomeTopBar {
    private HomeTopBar() {
    }

    /** Injected at the start of HomeBottomNavFragment.onViewCreated(View, Bundle). */
    public static void install(View root) {
        if (root == null) return;
        root.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() {
            private View post;
            private View messaging;

            @Override
            public boolean onPreDraw() {
                if (post == null) post = NavigationBar.child(root, "home_post");
                if (messaging == null) messaging = NavigationBar.child(root, "home_messaging");
                boolean changed = hide(post, Settings.hideTopBarPost());
                changed |= hide(messaging, Settings.hideTopBarMessaging());
                // A changed top bar needs a new layout, so this draw is dropped and the next one is the real one.
                return !changed;
            }
        });
    }

    private static boolean hide(View button, boolean hidden) {
        if (button == null || !hidden || button.getVisibility() == View.GONE) return false;
        button.setVisibility(View.GONE);
        return true;
    }
}
