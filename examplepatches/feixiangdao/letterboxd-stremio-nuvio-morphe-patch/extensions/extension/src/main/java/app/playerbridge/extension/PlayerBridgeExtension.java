package app.playerbridge.extension;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.Toast;

import androidx.fragment.app.Fragment;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.List;

/**
 * Runtime extension injected into Letterboxd by the patch module.
 *
 * It reads the current film's IMDb ID from Letterboxd's own model and adds
 * separate Stremio and Nuvio buttons below the native trailer button.
 */
public final class PlayerBridgeExtension {
    private static final String TAG = "PlayerBridge";

    private static final int STREMIO_COLOR = 0xFF7B5EA7;
    private static final int NUVIO_COLOR = 0xFF30343B;

    private static final String WRAPPER_TAG = "player_bridge_wrapper_v1";
    private static final String STREMIO_TAG = "player_bridge_stremio_v1";
    private static final String NUVIO_TAG = "player_bridge_nuvio_v1";

    private static volatile String cachedImdbId;
    private static volatile WeakReference<Button> stremioButtonRef;
    private static volatile WeakReference<Button> nuvioButtonRef;

    private PlayerBridgeExtension() {}

    /** Injected into FilmFragment.updateData(...). */
    public static void cacheImdbId(Object filmResultsObj) {
        cachedImdbId = extractImdbId(filmResultsObj);
        Log.d(TAG, "IMDb ID: " + cachedImdbId);
        updateButtonVisibility();
    }

    /** Injected into FilmHeaderFragment.configureTrailer(...). */
    public static void onTrailerConfigured(
            Fragment fragment,
            Object trailerObj,
            Object bindingObj
    ) {
        if (bindingObj == null) return;

        Button trailerButton = getTrailerButton(bindingObj);
        if (trailerButton == null) return;

        Object parentObj = trailerButton.getParent();
        if (!(parentObj instanceof LinearLayout)) {
            insertFallback(trailerButton);
            return;
        }

        LinearLayout row = (LinearLayout) parentObj;
        if (row.findViewWithTag(WRAPPER_TAG) != null) return;

        Context context = trailerButton.getContext();
        boolean hasTrailer = trailerObj != null;

        int trailerIndex = row.indexOfChild(trailerButton);
        ViewGroup.LayoutParams originalParams = trailerButton.getLayoutParams();

        LinearLayout wrapper = new LinearLayout(context);
        wrapper.setTag(WRAPPER_TAG);
        wrapper.setOrientation(LinearLayout.VERTICAL);
        wrapper.setLayoutParams(cloneLayoutParams(originalParams));

        row.removeView(trailerButton);
        trailerButton.setLayoutParams(new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT,
                LinearLayout.LayoutParams.WRAP_CONTENT
        ));
        wrapper.addView(trailerButton);

        Button stremioButton = cloneTrailerButton(
                trailerButton,
                "Stremio",
                "Open in Stremio",
                STREMIO_COLOR,
                STREMIO_TAG
        );

        Button nuvioButton = cloneTrailerButton(
                trailerButton,
                "Nuvio",
                "Open in Nuvio",
                NUVIO_COLOR,
                NUVIO_TAG
        );

        LinearLayout.LayoutParams stremioParams = naturalParams();
        if (hasTrailer) stremioParams.topMargin = dp(context, 8);
        stremioButton.setLayoutParams(stremioParams);

        LinearLayout.LayoutParams nuvioParams = naturalParams();
        nuvioParams.topMargin = dp(context, 8);
        nuvioButton.setLayoutParams(nuvioParams);

        wrapper.addView(stremioButton);
        wrapper.addView(nuvioButton);

        row.addView(wrapper, trailerIndex);
        row.setGravity(Gravity.CENTER_VERTICAL);

        stremioButton.setOnClickListener(
                v -> openInStremio(v.getContext(), cachedImdbId)
        );
        nuvioButton.setOnClickListener(
                v -> openInNuvio(v.getContext(), cachedImdbId)
        );

        registerButtons(stremioButton, nuvioButton);
        Log.d(TAG, "Inserted Stremio + Nuvio buttons; trailer=" + hasTrailer);
    }

    private static void insertFallback(Button trailerButton) {
        Object parentObj = trailerButton.getParent();
        if (!(parentObj instanceof ViewGroup)) return;

        ViewGroup parent = (ViewGroup) parentObj;
        if (parent.findViewWithTag(STREMIO_TAG) != null ||
                parent.findViewWithTag(NUVIO_TAG) != null) {
            return;
        }

        Button stremio = cloneTrailerButton(
                trailerButton, "Stremio", "Open in Stremio",
                STREMIO_COLOR, STREMIO_TAG
        );
        Button nuvio = cloneTrailerButton(
                trailerButton, "Nuvio", "Open in Nuvio",
                NUVIO_COLOR, NUVIO_TAG
        );

        stremio.setOnClickListener(v -> openInStremio(v.getContext(), cachedImdbId));
        nuvio.setOnClickListener(v -> openInNuvio(v.getContext(), cachedImdbId));

        int index = parent.indexOfChild(trailerButton);
        parent.addView(stremio, index + 1);
        parent.addView(nuvio, index + 2);

        registerButtons(stremio, nuvio);
    }

    private static void registerButtons(Button stremio, Button nuvio) {
        stremioButtonRef = new WeakReference<>(stremio);
        nuvioButtonRef = new WeakReference<>(nuvio);
        updateButtonVisibility();
    }

    private static void updateButtonVisibility() {
        final boolean visible = cachedImdbId != null && !cachedImdbId.isEmpty();
        updateOneButton(stremioButtonRef, visible);
        updateOneButton(nuvioButtonRef, visible);
    }

    private static void updateOneButton(WeakReference<Button> ref, boolean visible) {
        if (ref == null) return;
        Button button = ref.get();
        if (button == null) return;
        button.post(() -> button.setVisibility(visible ? View.VISIBLE : View.GONE));
    }

    private static String extractImdbId(Object filmResultsObj) {
        if (filmResultsObj == null) return null;
        try {
            Object film = call(filmResultsObj, "getFilm");
            if (film == null) return null;

            Object links = call(film, "getLinks");
            if (!(links instanceof List)) return null;

            for (Object link : (List<?>) links) {
                Object type = call(link, "getType");
                if (type == null) continue;

                if (type.getClass().getSimpleName().contains("Imdb")) {
                    Object id = call(link, "getId");
                    if (id instanceof String) {
                        return normalizeImdbId((String) id);
                    }
                }
            }
        } catch (Exception e) {
            Log.d(TAG, "extractImdbId: " + e.getMessage());
        }
        return null;
    }

    private static String normalizeImdbId(String raw) {
        if (raw == null) return null;
        String id = raw.trim();
        if (id.isEmpty()) return null;
        return id.startsWith("tt") ? id : "tt" + id;
    }

    private static Object call(Object target, String method) throws Exception {
        Method m = target.getClass().getMethod(method);
        return m.invoke(target);
    }

    private static Button getTrailerButton(Object bindingObj) {
        try {
            Field field = bindingObj.getClass().getField("trailerButton");
            Object value = field.get(bindingObj);
            return value instanceof Button ? (Button) value : null;
        } catch (Exception e) {
            Log.d(TAG, "getTrailerButton: " + e.getMessage());
            return null;
        }
    }

    private static Button cloneTrailerButton(
            Button source,
            String label,
            String contentDescription,
            int backgroundColor,
            String tag
    ) {
        Context context = source.getContext();

        Button clone;
        try {
            clone = (Button) source.getClass()
                    .getConstructor(Context.class)
                    .newInstance(context);
        } catch (Exception ignored) {
            clone = tryCreateMaterialButton(context);
            if (clone == null) clone = new Button(context);
        }

        clone.setTag(tag);
        clone.setMinHeight(source.getMinHeight());
        clone.setMinimumHeight(source.getMinimumHeight());
        clone.setMinWidth(0);
        clone.setMinimumWidth(0);

        clone.setPadding(
                source.getPaddingLeft(),
                source.getPaddingTop(),
                source.getPaddingRight(),
                source.getPaddingBottom()
        );

        try {
            clone.setPaddingRelative(
                    source.getPaddingStart(),
                    source.getPaddingTop(),
                    source.getPaddingEnd(),
                    source.getPaddingBottom()
            );
        } catch (Exception ignored) {}

        copyMaterialDimensions(source, clone);
        copyRippleColor(source, clone);

        clone.setTextSize(TypedValue.COMPLEX_UNIT_PX, source.getTextSize());
        clone.setTypeface(source.getTypeface());
        clone.setTextColor(source.getCurrentTextColor());
        clone.setAllCaps(true);
        clone.setLetterSpacing(source.getLetterSpacing());
        clone.setGravity(source.getGravity());
        clone.setIncludeFontPadding(source.getIncludeFontPadding());
        clone.setElevation(source.getElevation());

        if (!applyMaterialBackgroundColor(clone, backgroundColor)) {
            GradientDrawable background = new GradientDrawable();
            background.setShape(GradientDrawable.RECTANGLE);
            background.setCornerRadius(dp(context, 24));
            background.setColor(backgroundColor);
            clone.setBackground(background);
        } else {
            forcePillShape(clone);
            setPillRadiusBeforeDraw(clone);
        }

        if (!copyMaterialIcon(source, clone)) {
            Drawable[] rel = source.getCompoundDrawablesRelative();
            Drawable[] abs = source.getCompoundDrawables();

            if (rel[0] != null || rel[2] != null) {
                clone.setCompoundDrawablesRelativeWithIntrinsicBounds(
                        rel[0], rel[1], rel[2], rel[3]
                );
            } else {
                clone.setCompoundDrawablesWithIntrinsicBounds(
                        abs[0], abs[1], abs[2], abs[3]
                );
            }
            clone.setCompoundDrawablePadding(source.getCompoundDrawablePadding());
        }

        clone.setText(label);
        clone.setContentDescription(contentDescription);
        return clone;
    }

    private static Button tryCreateMaterialButton(Context context) {
        try {
            Class<?> cls = Class.forName(
                    "com.google.android.material.button.MaterialButton"
            );
            return (Button) cls.getConstructor(Context.class).newInstance(context);
        } catch (Exception ignored) {
            return null;
        }
    }

    private static void copyMaterialDimensions(Button source, Button clone) {
        String[][] properties = {
                {"getInsetTop", "setInsetTop"},
                {"getInsetBottom", "setInsetBottom"},
                {"getIconSize", "setIconSize"},
                {"getIconPadding", "setIconPadding"},
                {"getIconGravity", "setIconGravity"}
        };

        for (String[] property : properties) {
            try {
                Object value = source.getClass()
                        .getMethod(property[0])
                        .invoke(source);
                if (value instanceof Integer) {
                    clone.getClass()
                            .getMethod(property[1], int.class)
                            .invoke(clone, value);
                }
            } catch (Exception ignored) {}
        }
    }

    private static void copyRippleColor(Button source, Button clone) {
        try {
            Object ripple = source.getClass()
                    .getMethod("getRippleColor")
                    .invoke(source);

            if (ripple instanceof ColorStateList) {
                clone.getClass()
                        .getMethod("setRippleColor", ColorStateList.class)
                        .invoke(clone, ripple);
            }
        } catch (Exception ignored) {}
    }

    private static boolean copyMaterialIcon(Button source, Button clone) {
        try {
            Object icon = source.getClass().getMethod("getIcon").invoke(source);
            if (!(icon instanceof Drawable)) return false;

            clone.getClass()
                    .getMethod("setIcon", Drawable.class)
                    .invoke(clone, icon);

            try {
                clone.getClass()
                        .getMethod("setIconTint", ColorStateList.class)
                        .invoke(
                                clone,
                                ColorStateList.valueOf(source.getCurrentTextColor())
                        );
            } catch (Exception ignored) {}

            return true;
        } catch (Exception ignored) {
            return false;
        }
    }

    private static boolean applyMaterialBackgroundColor(Button button, int color) {
        try {
            button.getClass()
                    .getMethod("setBackgroundTintList", ColorStateList.class)
                    .invoke(button, ColorStateList.valueOf(color));

            return button.getClass().getName().contains("MaterialButton");
        } catch (Exception ignored) {
            return false;
        }
    }

    private static void forcePillShape(Button button) {
        try {
            int radius = button.getHeight() > 0
                    ? button.getHeight() / 2
                    : dp(button.getContext(), 20);

            button.getClass()
                    .getMethod("setCornerRadius", int.class)
                    .invoke(button, radius);
        } catch (Exception ignored) {}
    }

    private static void setPillRadiusBeforeDraw(final Button button) {
        final ViewTreeObserver observer = button.getViewTreeObserver();
        observer.addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() {
            @Override
            public boolean onPreDraw() {
                if (button.getHeight() <= 0) return true;

                ViewTreeObserver live = button.getViewTreeObserver();
                if (live.isAlive()) live.removeOnPreDrawListener(this);

                forcePillShape(button);
                return true;
            }
        });
    }

    private static LinearLayout.LayoutParams naturalParams() {
        return new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT,
                LinearLayout.LayoutParams.WRAP_CONTENT
        );
    }

    private static ViewGroup.LayoutParams cloneLayoutParams(
            ViewGroup.LayoutParams source
    ) {
        if (source instanceof LinearLayout.LayoutParams) {
            return new LinearLayout.LayoutParams(
                    (LinearLayout.LayoutParams) source
            );
        }
        if (source instanceof ViewGroup.MarginLayoutParams) {
            return new ViewGroup.MarginLayoutParams(
                    (ViewGroup.MarginLayoutParams) source
            );
        }
        if (source != null) {
            return new ViewGroup.LayoutParams(source);
        }
        return new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
    }

    private static int dp(Context context, int value) {
        return (int) TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP,
                value,
                context.getResources().getDisplayMetrics()
        );
    }

    public static void openInStremio(Context context, String imdbId) {
        String id = normalizeImdbId(imdbId);

        if (id == null) {
            launchWithWebFallback(
                    context,
                    Uri.parse("stremio://board"),
                    Uri.parse("https://web.stremio.com")
            );
            return;
        }

        launchWithWebFallback(
                context,
                Uri.parse("stremio://detail/movie/" + id + "/" + id),
                Uri.parse("https://web.stremio.com/#/detail/movie/" + id)
        );
    }

    public static void openInNuvio(Context context, String imdbId) {
        String id = normalizeImdbId(imdbId);

        if (id == null) {
            Toast.makeText(
                    context,
                    "No IMDb ID is available for this film",
                    Toast.LENGTH_SHORT
            ).show();
            return;
        }

        try {
            Intent intent = new Intent(
                    Intent.ACTION_VIEW,
                    Uri.parse("nuvio://movie/" + id)
            );
            context.startActivity(intent);
        } catch (ActivityNotFoundException e) {
            Toast.makeText(
                    context,
                    "Nuvio is not installed or does not support this deep link",
                    Toast.LENGTH_LONG
            ).show();
        }
    }

    private static void launchWithWebFallback(
            Context context,
            Uri appUri,
            Uri webUri
    ) {
        try {
            context.startActivity(new Intent(Intent.ACTION_VIEW, appUri));
        } catch (ActivityNotFoundException e) {
            context.startActivity(new Intent(Intent.ACTION_VIEW, webUri));
        }
    }
}
