package app.southstar21.extension.instagram.profilepicture;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.WeakHashMap;

import app.southstar21.extension.instagram.settings.Icons;
import app.southstar21.extension.instagram.settings.PatchSettings;
import app.southstar21.extension.instagram.settings.Setting;

/**
 * View profile picture patch: a small button on the profile picture of profile pages that
 * opens {@link ProfilePictureViewer} with the picture in full size.
 * <ul>
 *   <li>Profile pages (UserDetailFragment) are tracked from their onViewCreated.</li>
 *   <li>The button floats over the bottom left of the avatar's story ring (the story "+" on
 *       your own profile sits bottom right), added whenever the page's header is laid out.</li>
 *   <li>On tap, the user is read live from the page's UserDetailTabController, falling back
 *       to the one the page last loaded from the network.</li>
 * </ul>
 */
@SuppressWarnings("unused")
public final class ViewProfilePicturePatch {
    private static final String TAG = "ViewProfilePicture";
    private static final String PACKAGE = "com.instagram.android";
    private static final String ACTION_BAR_CLASS = "com.instagram.profile.actionbar.ProfileActionBar";
    private static final String TAB_CONTROLLER_CLASS = "com.instagram.profile.fragment.UserDetailTabController";

    public static final PatchSettings SETTINGS = new PatchSettings("profile_picture",
            "Profile picture",
            "A button on profile pictures that shows them in full size and saves them.",
            ViewProfilePicturePatch::isIncluded,
            new Setting[0])
            .icon(Icons.Glyph.PICTURE, 0xFFAF52DE);

    /**
     * Open profile pages, each with the user it last loaded from the network (or null).
     * Weak, so closed profiles are forgotten.
     */
    private static final WeakHashMap<Object, Object> profiles = new WeakHashMap<>();

    private static Field actionBarField;
    private static Field tabControllerField;
    private static boolean fieldsResolved;

    private static int frameId = -1;
    private static int ringId;
    private static int titleId;
    private static int avatarId;

    /** The patch makes this return true, so the menu only shows patches that were applied. */
    public static boolean isIncluded() {
        return false;
    }

    // The methods below are overwritten by the patch to call Instagram's obfuscated getters.

    /** User's ProfilePicUrlInfo for the full size picture, or null if it wasn't loaded. */
    public static Object hdProfilePicInfo(Object user) {
        return null;
    }

    /** User's ImageUrl for the regular, small profile picture. */
    public static Object profilePicUrl(Object user) {
        return null;
    }

    /** UserDetailTabController's current user. */
    public static Object tabControllerUser(Object tabController) {
        return null;
    }

    // region Hooks

    /**
     * Called from UserDetailFragment.onViewCreated. The page's own view tree is watched, so
     * the button shows whichever activity the profile opens in (the main one, or the modal
     * one used for profiles opened from DMs, notifications, ...).
     */
    public static void onProfileCreated(Object fragment, View page) {
        if (fragment == null) return;
        synchronized (profiles) {
            if (!profiles.containsKey(fragment)) profiles.put(fragment, null);
        }
        try {
            if (page == null || !SETTINGS.isActive()) return;
            ViewTreeObserver.OnGlobalLayoutListener onLayout = () -> {
                try {
                    install(fragment, page);
                } catch (Throwable t) {
                    Log.e(TAG, "Failed to add button", t);
                }
            };
            page.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
                @Override
                public void onViewAttachedToWindow(View v) {
                    v.getViewTreeObserver().addOnGlobalLayoutListener(onLayout);
                }

                @Override
                public void onViewDetachedFromWindow(View v) {
                    v.getViewTreeObserver().removeOnGlobalLayoutListener(onLayout);
                }
            });
            if (page.isAttachedToWindow()) page.getViewTreeObserver().addOnGlobalLayoutListener(onLayout);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to watch profile", t);
        }
    }

    /** Called when a profile page has loaded its user from the network. */
    public static void onProfileUserLoaded(Object fragment, Object user) {
        if (fragment == null || user == null) return;
        synchronized (profiles) {
            profiles.put(fragment, user);
        }
    }

    // endregion

    // region Button

    private static void install(Object fragment, View page) {
        resolveIds(page.getResources());
        if (frameId == 0) return;
        View frame = page.findViewById(frameId);
        if (frame == null) return;
        View ring = ringId == 0 ? null : page.findViewById(ringId);
        ViewGroup host = hostFor(frame, ring);
        if (host == null) return;
        for (int i = 0; i < host.getChildCount(); i++) {
            if (host.getChildAt(i) instanceof PictureButton) return;
        }
        float density = page.getResources().getDisplayMetrics().density;
        int size = Math.round(26 * density);
        PictureButton button = new PictureButton(page.getContext(), frame, ring);
        button.setOnClickListener(v -> open(v, fragment));
        // Added last with elevation, so it's drawn over the avatar and its story ring.
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(size, size, Gravity.TOP | Gravity.START);
        host.addView(button, params);
        button.setElevation(4 * density);
        button.setTranslationZ(4 * density);
    }

    /**
     * The view the button goes in: the closest parent of both the avatar and its story ring
     * (the ring is a separate view on top of the avatar), skipping layouts that would line
     * it up with their other children instead of letting it float.
     */
    private static ViewGroup hostFor(View frame, View ring) {
        ViewGroup host = frame.getParent() instanceof ViewGroup ? (ViewGroup) frame.getParent() : null;
        if (ring != null && ring.isAttachedToWindow()) {
            while (host != null && !contains(host, ring)) {
                host = host.getParent() instanceof ViewGroup ? (ViewGroup) host.getParent() : null;
            }
        }
        while (host instanceof LinearLayout) {
            host = host.getParent() instanceof ViewGroup ? (ViewGroup) host.getParent() : null;
        }
        if (host == null) return null;
        String name = host.getClass().getName();
        // Lists and scroll views position their children themselves.
        if (name.contains("RecyclerView") || name.contains("ScrollView") || name.contains("ListView")) return null;
        return host;
    }

    private static boolean contains(View ancestor, View view) {
        for (Object v = view; v instanceof View; v = ((View) v).getParent()) {
            if (v == ancestor) return true;
        }
        return false;
    }

    private static void resolveIds(Resources res) {
        if (frameId != -1) return;
        frameId = res.getIdentifier("row_profile_header_imageview_frame_layout", "id", PACKAGE);
        ringId = res.getIdentifier("reel_ring", "id", PACKAGE);
        titleId = res.getIdentifier("action_bar_title", "id", PACKAGE);
        avatarId = res.getIdentifier("row_profile_header_imageview", "id", PACKAGE);
    }

    private static void open(View button, Object fragment) {
        try {
            Activity activity = activityOf(button.getContext());
            if (activity == null) return;

            String hdUrl = null, smallUrl = null;
            // The live user first, then the one loaded from the network.
            Object[] candidates = {liveUser(fragment), loadedUser(fragment)};
            for (Object user : candidates) {
                if (user == null) continue;
                if (hdUrl == null) hdUrl = url(hdProfilePicInfo(user));
                if (smallUrl == null) smallUrl = url(profilePicUrl(user));
            }
            if (hdUrl == null && smallUrl == null) {
                Toast.makeText(activity, "Profile picture is still loading, try again in a moment",
                        Toast.LENGTH_SHORT).show();
                return;
            }

            View page = viewOf(fragment);
            View avatar = page == null || avatarId == 0 ? null : page.findViewById(avatarId);
            ProfilePictureViewer.show(activity, avatar, username(fragment, page), smallUrl, hdUrl);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to open profile picture", t);
        }
    }

    /** The username in the page's top bar. */
    private static String username(Object fragment, View page) {
        View bar = actionBarOf(fragment);
        if (bar == null) bar = page;
        View title = titleId == 0 || bar == null ? null : bar.findViewById(titleId);
        if (title instanceof TextView) {
            CharSequence text = ((TextView) title).getText();
            if (text != null && text.length() > 0) return text.toString();
        }
        return null;
    }

    // endregion

    // region Profile pages

    private static ArrayList<Object> fragments() {
        synchronized (profiles) {
            return new ArrayList<>(profiles.keySet());
        }
    }

    private static Object loadedUser(Object fragment) {
        synchronized (profiles) {
            return profiles.get(fragment);
        }
    }

    private static View actionBarOf(Object fragment) {
        resolveFields(fragment.getClass());
        try {
            return actionBarField == null ? null : (View) actionBarField.get(fragment);
        } catch (Throwable t) {
            return null;
        }
    }

    private static Object liveUser(Object fragment) {
        resolveFields(fragment.getClass());
        try {
            Object controller = tabControllerField == null ? null : tabControllerField.get(fragment);
            return controller == null ? null : tabControllerUser(controller);
        } catch (Throwable t) {
            Log.w(TAG, "No live user", t);
            return null;
        }
    }

    /** UserDetailFragment's fields are obfuscated, but their types aren't. */
    private static synchronized void resolveFields(Class<?> type) {
        if (fieldsResolved) return;
        fieldsResolved = true;
        for (Class<?> c = type; c != null && c != Object.class; c = c.getSuperclass()) {
            for (Field field : c.getDeclaredFields()) {
                String name = field.getType().getName();
                if (actionBarField == null && ACTION_BAR_CLASS.equals(name)) {
                    field.setAccessible(true);
                    actionBarField = field;
                } else if (tabControllerField == null && TAB_CONTROLLER_CLASS.equals(name)) {
                    field.setAccessible(true);
                    tabControllerField = field;
                }
            }
        }
    }

    private static View viewOf(Object fragment) {
        try {
            return (View) fragment.getClass().getMethod("getView").invoke(fragment);
        } catch (Throwable t) {
            return null;
        }
    }

    // endregion

    /** Calls getUrl() on a ProfilePicUrlInfo or ImageUrl, both real interface methods. */
    private static String url(Object picture) {
        if (picture == null) return null;
        try {
            Object url = picture.getClass().getMethod("getUrl").invoke(picture);
            return url instanceof String && !((String) url).isEmpty() ? (String) url : null;
        } catch (Throwable t) {
            Log.w(TAG, "No url on " + picture.getClass().getName(), t);
            return null;
        }
    }

    private static Activity activityOf(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    /**
     * Round badge on the avatar with a fullscreen glyph, ringed in the page's background
     * color so it reads as cut out of the picture, like Instagram's story "+".
     */
    @SuppressLint("ViewConstructor")
    private static final class PictureButton extends View {
        private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint outline = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint glyph = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();
        private final float density;
        private final View frame;
        private final View ring;
        private final int[] location = new int[2];
        private final ViewTreeObserver.OnPreDrawListener follow = () -> {
            follow();
            return true;
        };

        PictureButton(Context context, View frame, View ring) {
            super(context);
            this.frame = frame;
            this.ring = ring;
            density = context.getResources().getDisplayMetrics().density;
            boolean dark = (context.getResources().getConfiguration().uiMode
                    & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
            fill.setColor(dark ? 0xFF363636 : 0xFFEFEFEF);
            outline.setColor(dark ? Color.BLACK : Color.WHITE);
            glyph.setColor(dark ? Color.WHITE : Color.BLACK);
            glyph.setStyle(Paint.Style.STROKE);
            glyph.setStrokeWidth(1.75f * density);
            glyph.setStrokeCap(Paint.Cap.ROUND);
            glyph.setStrokeJoin(Paint.Join.ROUND);
            setContentDescription("View profile picture");
            setClickable(true);
            setFocusable(true);
            setOutlineProvider(android.view.ViewOutlineProvider.BACKGROUND);
        }

        @Override
        protected void onAttachedToWindow() {
            super.onAttachedToWindow();
            getViewTreeObserver().addOnPreDrawListener(follow);
        }

        @Override
        protected void onDetachedFromWindow() {
            getViewTreeObserver().removeOnPreDrawListener(follow);
            super.onDetachedFromWindow();
        }

        /**
         * Sits on the bottom left of the story ring (or of the avatar when there's no ring),
         * mirroring the story "+" at the bottom right, and hides with the avatar.
         */
        private void follow() {
            View anchor = ring != null && ring.isShown() && ring.getWidth() > 0 ? ring : frame;
            boolean shown = frame.isShown() && frame.getWidth() > 0 && anchor.isAttachedToWindow();
            int visibility = shown ? VISIBLE : INVISIBLE;
            if (getVisibility() != visibility) setVisibility(visibility);
            if (!shown || !(getParent() instanceof View)) return;

            View host = (View) getParent();
            anchor.getLocationInWindow(location);
            float ax = location[0], ay = location[1];
            host.getLocationInWindow(location);
            float r = Math.min(anchor.getWidth(), anchor.getHeight()) / 2f;
            float cx = ax - location[0] + anchor.getWidth() / 2f - r * 0.7071f;
            float cy = ay - location[1] + anchor.getHeight() / 2f + r * 0.7071f;
            float tx = cx - getWidth() / 2f - getLeft() + host.getScrollX();
            float ty = cy - getHeight() / 2f - getTop() + host.getScrollY();
            if (getTranslationX() != tx) setTranslationX(tx);
            if (getTranslationY() != ty) setTranslationY(ty);
            float alpha = frame.getAlpha();
            if (getAlpha() != alpha) setAlpha(alpha);
        }

        @Override
        public boolean onTouchEvent(android.view.MotionEvent event) {
            // Light press feedback without a ripple drawable.
            switch (event.getActionMasked()) {
                case android.view.MotionEvent.ACTION_DOWN:
                    animate().scaleX(0.88f).scaleY(0.88f).setDuration(90).start();
                    break;
                case android.view.MotionEvent.ACTION_UP:
                case android.view.MotionEvent.ACTION_CANCEL:
                    animate().scaleX(1f).scaleY(1f).setDuration(140).start();
                    break;
            }
            return super.onTouchEvent(event);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float w = getWidth(), h = getHeight();
            float cx = w / 2f, cy = h / 2f, r = Math.min(w, h) / 2f;
            canvas.drawCircle(cx, cy, r, outline);
            canvas.drawCircle(cx, cy, r - 2 * density, fill);
            // Four corner brackets (fullscreen).
            float half = 5.5f * density, arm = 3f * density;
            path.reset();
            for (int sx = -1; sx <= 1; sx += 2) {
                for (int sy = -1; sy <= 1; sy += 2) {
                    float x = cx + sx * half, y = cy + sy * half;
                    path.moveTo(x - sx * arm, y);
                    path.lineTo(x, y);
                    path.lineTo(x, y - sy * arm);
                }
            }
            canvas.drawPath(path, glyph);
        }
    }
}
