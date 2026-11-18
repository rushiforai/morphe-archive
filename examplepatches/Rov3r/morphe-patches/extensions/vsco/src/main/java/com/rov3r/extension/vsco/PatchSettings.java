package com.rov3r.extension.vsco;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.graphics.Typeface;
import android.preference.PreferenceManager;
import android.text.InputType;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

/** Shared runtime preferences and the in-app settings entry for the VSCO patches. */
@SuppressWarnings({"unused", "deprecation", "JavaReflectionMemberAccess"})
public final class PatchSettings {
    static final String PREFERENCES = "rov3r_morphe_vsco";
    static final String DESTINATION_KEY = "download_destination";

    static final String DOWNLOAD_TOOLS = "download_tools";
    static final String ORGANIZE_BY_USERNAME = "organize_by_username";
    static final String INCLUDE_TIMESTAMP = "include_timestamp";
    static final String FILE_NAME_TEMPLATE = "file_name_template";
    static final String COPY_LINK_BUTTON = "copy_link_button";
    static final String SHARE_LINK_BUTTON = "share_link_button";
    static final String HIDE_ACTION_FAVORITE = "hide_action_favorite";
    static final String HIDE_ACTION_REPOST = "hide_action_repost";
    static final String HIDE_ACTION_MESSAGE = "hide_action_message";
    static final String PROFILE_PHOTO_VIEWER = "profile_photo_viewer";
    static final String HIDE_PROFILE_FOLLOW = "hide_profile_follow";
    static final String HIDE_PROFILE_MESSAGE = "hide_profile_message";
    static final String HIDE_MEMBER_BADGE = "hide_member_badge";
    static final String HIDE_SUGGESTED_USERS = "hide_suggested_users";
    static final String HIDE_MEMBERSHIP_PROMOTIONS = "hide_membership_promotions";
    static final String HIDE_PROMOTIONAL_CARDS = "hide_promotional_cards";
    static final String DISABLE_VIDEO_AUTOPLAY = "disable_video_autoplay";
    static final String ALWAYS_UNMUTE_VIDEO = "always_unmute_video";
    static final String BLOCK_USAGE_ANALYTICS = "block_usage_analytics";
    static final String BLOCK_MARKETING_ATTRIBUTION = "block_marketing_attribution";

    static final String DEFAULT_FILE_NAME_TEMPLATE = "vsco_{id}";

    private static final String MENU_TAG = "rov3r_morphe_patch_settings";
    private static final long FALLBACK_SCAN_INTERVAL_MS = 1000L;
    private static final Set<String> SUGGESTED_USER_IDS = setOf(
        "suggested_users",
        "suggested_users_bookstack_view",
        "suggested_users_carousel",
        "suggested_users_carousel_indicator",
        "suggested_users_text_holder",
        "suggestions_from_follow_caption",
        "suggestions_from_follow_item",
        "suggestions_from_follow_list",
        "suggestions_from_follow_title"
    );

    private static final Set<String> MEMBERSHIP_PROMOTION_IDS = setOf(
        "upgrade",
        "member_hub",
        "btn_start_membership",
        "carousel_and_banner",
        "subscription_message",
        "upsell_banner_cta_button",
        "upsell_banner_text"
    );

    private static final Set<String> PROMOTIONAL_CARD_IDS = setOf(
        "edit_upsell_banner",
        "import_view_video_upsell_cta",
        "preset_promo_button",
        "preset_promo_description",
        "preset_promo_image_slider",
        "recipes_manager_upsell_layout",
        "studio_upsell_background",
        "upsell_description",
        "upsell_icon",
        "upsell_title"
    );

    private static final Set<String> FAVORITE_ACTION_IDS = setOf(
        "detail_view_favorite_button"
    );

    private static final Set<String> REPOST_ACTION_IDS = setOf(
        "detail_view_republish_button"
    );

    private static final Set<String> MESSAGE_ACTION_IDS = setOf(
        "detail_view_forward_button"
    );

    private static final Map<View, Integer> ORIGINAL_VISIBILITY =
        Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<Activity, WeakReference<ViewTreeObserver.OnGlobalLayoutListener>> OBSERVERS =
        Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<String, Object> REMOVED_ANALYTICS = new HashMap<>();

    private PatchSettings() {
    }

    /** Called at the beginning of LithiumActivity.onCreate. */
    public static void install(Activity activity) {
        if (activity == null) {
            return;
        }
        installBeforeContentView(activity);
    }

    static SharedPreferences preferences(Context context) {
        return context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
    }

    static boolean enabled(Context context, String key, boolean defaultValue) {
        return preferences(context).getBoolean(key, defaultValue);
    }

    static String text(Context context, String key, String defaultValue) {
        return preferences(context).getString(key, defaultValue);
    }

    private static void installBeforeContentView(Activity activity) {
        View decor = activity.getWindow().getDecorView();
        attachMenuEntry(activity, decor);
        applyPreferences(activity, decor);
        if (enabled(activity, DISABLE_VIDEO_AUTOPLAY, false)) {
            applyAutoplayPreference(activity, true);
        }
        applyAnalyticsPreferences();

        WeakReference<ViewTreeObserver.OnGlobalLayoutListener> existing = OBSERVERS.get(activity);
        if (existing != null && existing.get() != null) {
            return;
        }
        final long[] lastFallbackScan = {0L};
        final long[] lastAnalyticsScan = {0L};
        ViewTreeObserver.OnGlobalLayoutListener listener = () -> {
            long now = android.os.SystemClock.uptimeMillis();
            if (now - lastFallbackScan[0] >= FALLBACK_SCAN_INTERVAL_MS) {
                lastFallbackScan[0] = now;
                attachMenuEntry(activity, decor);
                applyPreferences(activity, decor);
            }
            if (now - lastAnalyticsScan[0] >= 5000L
                && (enabled(activity, BLOCK_USAGE_ANALYTICS, false)
                    || enabled(activity, BLOCK_MARKETING_ATTRIBUTION, false))) {
                lastAnalyticsScan[0] = now;
                applyAnalyticsPreferences();
            }
        };
        OBSERVERS.put(activity, new WeakReference<>(listener));
        decor.getViewTreeObserver().addOnGlobalLayoutListener(listener);
    }

    private static void attachMenuEntry(Activity activity, View decor) {
        int patchSettingsId = resourceId(activity, "id", "morphe_patch_settings");
        if (patchSettingsId == 0) {
            return;
        }
        View patchSettings = decor.findViewById(patchSettingsId);
        if (!(patchSettings instanceof TextView) || MENU_TAG.equals(patchSettings.getTag())) {
            return;
        }
        patchSettings.setTag(MENU_TAG);
        patchSettings.setClickable(true);
        patchSettings.setFocusable(true);
        patchSettings.setOnClickListener(view -> show(activity));
    }

    private static void show(Activity activity) {
        SharedPreferences prefs = preferences(activity);
        int padding = dp(activity, 20);
        LinearLayout content = new LinearLayout(activity);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(padding, dp(activity, 8), padding, dp(activity, 8));

        addSection(content, "Download organization");
        addSwitch(content, prefs, "Enable download tools", DOWNLOAD_TOOLS, true, null);
        addSwitch(content, prefs, "Organize downloads by username", ORGANIZE_BY_USERNAME, true, null);
        addSwitch(content, prefs, "Include timestamps in filenames", INCLUDE_TIMESTAMP, true, null);

        TextView templateLabel = label(activity, "Filename template");
        content.addView(templateLabel);
        EditText template = new EditText(activity);
        template.setSingleLine(true);
        template.setInputType(InputType.TYPE_CLASS_TEXT);
        template.setText(text(activity, FILE_NAME_TEMPLATE, DEFAULT_FILE_NAME_TEMPLATE));
        template.setHint("vsco_{id}");
        template.setContentDescription("Filename template. Available fields: id, username, type, timestamp");
        content.addView(template, matchWrap());
        TextView templateHelp = label(
            activity,
            "Fields: {id}, {username}, {type}, {timestamp}. Location is never included."
        );
        templateHelp.setTextSize(12f);
        content.addView(templateHelp);

        Button chooseFolder = new Button(activity);
        chooseFolder.setText("Choose download folder");
        chooseFolder.setOnClickListener(view -> DownloadPostsPatch.chooseDownloadDestination(activity));
        content.addView(chooseFolder, matchWrap());

        addSection(content, "Post action row");
        addSwitch(content, prefs, "Hide Favorite action", HIDE_ACTION_FAVORITE, false, null);
        addSwitch(content, prefs, "Hide Repost action", HIDE_ACTION_REPOST, false, null);
        addSwitch(content, prefs, "Hide Message action", HIDE_ACTION_MESSAGE, false, null);
        addSwitch(content, prefs, "Show Copy direct-link action", COPY_LINK_BUTTON, false, null);
        addSwitch(content, prefs, "Show Share direct-link action", SHARE_LINK_BUTTON, false, null);
        TextView actionHelp = label(
            activity,
            "Copy and Share use space freed by hidden native actions. Both remain available in the post's three-dot menu."
        );
        actionHelp.setTextSize(12f);
        content.addView(actionHelp);

        addSection(content, "Profile controls");
        addSwitch(content, prefs, "Full-quality profile photo viewer", PROFILE_PHOTO_VIEWER, true, null);
        addSwitch(content, prefs, "Hide Follow/Following button", HIDE_PROFILE_FOLLOW, false, null);
        addSwitch(content, prefs, "Hide Message button", HIDE_PROFILE_MESSAGE, false, null);
        addSwitch(content, prefs, "Hide membership badge", HIDE_MEMBER_BADGE, false, null);

        addSection(content, "Feed cleanup");
        addSwitch(content, prefs, "Hide suggested-user carousels", HIDE_SUGGESTED_USERS, false, null);
        addSwitch(content, prefs, "Hide membership promotions", HIDE_MEMBERSHIP_PROMOTIONS, false, null);
        addSwitch(content, prefs, "Hide promotional cards", HIDE_PROMOTIONAL_CARDS, false, null);

        addSection(content, "Media controls");
        addSwitch(
            content,
            prefs,
            "Disable video autoplay",
            DISABLE_VIDEO_AUTOPLAY,
            false,
            checked -> applyAutoplayPreference(activity, checked)
        );
        addSwitch(content, prefs, "Always unmute videos", ALWAYS_UNMUTE_VIDEO, false, null);

        addSection(content, "Privacy controls");
        addSwitch(
            content,
            prefs,
            "Block usage analytics",
            BLOCK_USAGE_ANALYTICS,
            false,
            checked -> applyAnalyticsPreferences()
        );
        addSwitch(
            content,
            prefs,
            "Block marketing attribution",
            BLOCK_MARKETING_ATTRIBUTION,
            false,
            checked -> applyAnalyticsPreferences()
        );
        TextView privacyHelp = label(
            activity,
            "These controls leave account, network, messaging, and crash-handling components intact."
        );
        privacyHelp.setTextSize(12f);
        content.addView(privacyHelp);

        ScrollView scroll = new ScrollView(activity);
        scroll.addView(content);
        AlertDialog dialog = new AlertDialog.Builder(activity)
            .setTitle("Patch Settings")
            .setView(scroll)
            .setPositiveButton("Done", null)
            .setNegativeButton("Restore defaults", null)
            .create();
        dialog.setOnShowListener(ignored -> {
            dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(view -> {
                String value = template.getText().toString().trim();
                prefs.edit()
                    .putString(
                        FILE_NAME_TEMPLATE,
                        value.isEmpty() ? DEFAULT_FILE_NAME_TEMPLATE : value
                    )
                    .apply();
                applyPreferences(activity, activity.getWindow().getDecorView());
                dialog.dismiss();
            });
            dialog.getButton(AlertDialog.BUTTON_NEGATIVE).setOnClickListener(view -> {
                applyAutoplayPreference(activity, false);
                prefs.edit().clear().apply();
                applyAnalyticsPreferences();
                applyPreferences(activity, activity.getWindow().getDecorView());
                Toast.makeText(activity, "Patch settings restored", Toast.LENGTH_SHORT).show();
                dialog.dismiss();
                show(activity);
            });
        });
        dialog.show();
    }

    private interface ToggleListener {
        void changed(boolean checked);
    }

    private static void addSwitch(
        LinearLayout parent,
        SharedPreferences prefs,
        String title,
        String key,
        boolean defaultValue,
        ToggleListener listener
    ) {
        Switch toggle = new Switch(parent.getContext());
        toggle.setText(title);
        toggle.setChecked(prefs.getBoolean(key, defaultValue));
        toggle.setPadding(0, dp(parent.getContext(), 8), 0, dp(parent.getContext(), 8));
        toggle.setOnCheckedChangeListener((button, checked) -> {
            prefs.edit().putBoolean(key, checked).apply();
            if (listener != null) {
                listener.changed(checked);
            }
        });
        parent.addView(toggle, matchWrap());
    }

    private static void addSection(LinearLayout parent, String title) {
        TextView heading = label(parent.getContext(), title);
        heading.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        heading.setTextSize(17f);
        heading.setPadding(0, dp(parent.getContext(), 20), 0, dp(parent.getContext(), 8));
        parent.addView(heading, matchWrap());
    }

    private static TextView label(Context context, String value) {
        TextView view = new TextView(context);
        view.setText(value);
        view.setPadding(0, dp(context, 4), 0, dp(context, 4));
        return view;
    }

    private static LinearLayout.LayoutParams matchWrap() {
        return new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT,
            ViewGroup.LayoutParams.WRAP_CONTENT
        );
    }

    private static void applyPreferences(Activity activity, View root) {
        DownloadPostsPatch.attachFeedButtons(root);
        applyBeforeDraw(activity, root);
    }

    /** Applies layout-local preferences synchronously during view attachment. */
    static void applyBeforeDraw(Context context, View root) {
        Activity activity = findActivity(context);
        if (activity != null) {
            attachMenuEntry(activity, root);
        }
        applyVisibility(
            root,
            FAVORITE_ACTION_IDS,
            enabled(context, HIDE_ACTION_FAVORITE, false)
        );
        applyVisibility(
            root,
            REPOST_ACTION_IDS,
            enabled(context, HIDE_ACTION_REPOST, false)
        );
        applyVisibility(
            root,
            MESSAGE_ACTION_IDS,
            enabled(context, HIDE_ACTION_MESSAGE, false)
        );
        applyVisibility(root, "user_profile_follow_button", enabled(context, HIDE_PROFILE_FOLLOW, false));
        boolean hideMessage = enabled(context, HIDE_PROFILE_MESSAGE, false);
        applyVisibility(root, "user_profile_message_button", hideMessage);
        applyVisibility(root, "message_bullet_divider", hideMessage);
        applyVisibility(root, "membership_badge", enabled(context, HIDE_MEMBER_BADGE, false));
        applyVisibility(root, "member_badge", enabled(context, HIDE_MEMBER_BADGE, false));
        applyVisibility(root, SUGGESTED_USER_IDS, enabled(context, HIDE_SUGGESTED_USERS, false));
        applyVisibility(
            root,
            MEMBERSHIP_PROMOTION_IDS,
            enabled(context, HIDE_MEMBERSHIP_PROMOTIONS, false)
        );
        applyVisibility(
            root,
            PROMOTIONAL_CARD_IDS,
            enabled(context, HIDE_PROMOTIONAL_CARDS, false)
        );
        DownloadPostsPatch.applyButtonPreferences(root);
        if (enabled(context, ALWAYS_UNMUTE_VIDEO, false)) {
            forceUnmuted(root);
        }
    }

    private static Activity findActivity(Context context) {
        Context current = context;
        while (current instanceof ContextWrapper) {
            if (current instanceof Activity) {
                return (Activity) current;
            }
            Context base = ((ContextWrapper) current).getBaseContext();
            if (base == current) {
                break;
            }
            current = base;
        }
        return current instanceof Activity ? (Activity) current : null;
    }

    private static void applyVisibility(View root, String name, boolean hidden) {
        applyVisibility(root, Collections.singleton(name), hidden);
    }

    private static void applyVisibility(View root, Set<String> names, boolean hidden) {
        if (root.getId() != View.NO_ID) {
            try {
                String name = root.getResources().getResourceEntryName(root.getId());
                if (names.contains(name)) {
                    if (hidden) {
                        if (!ORIGINAL_VISIBILITY.containsKey(root)) {
                            ORIGINAL_VISIBILITY.put(root, root.getVisibility());
                        }
                        root.setVisibility(View.GONE);
                    } else {
                        Integer original = ORIGINAL_VISIBILITY.remove(root);
                        if (original != null) {
                            root.setVisibility(original);
                        }
                    }
                }
            } catch (RuntimeException ignored) {
                // Views without application resource IDs are irrelevant here.
            }
        }
        if (root instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) root;
            for (int i = 0; i < group.getChildCount(); i++) {
                applyVisibility(group.getChildAt(i), names, hidden);
            }
        }
    }

    private static void forceUnmuted(View root) {
        String className = root.getClass().getName();
        if (className.contains("video.consumption") && className.endsWith("VideoView")) {
            try {
                Method getPlayer = root.getClass().getMethod("getPlayer");
                Object player = getPlayer.invoke(root);
                if (player != null) {
                    player.getClass().getMethod("setVolume", float.class).invoke(player, 1.0f);
                }
            } catch (Exception ignored) {
                // Some specialized video views do not expose a player yet.
            }
            try {
                Field repositoryField = findField(root.getClass(), "videoAudioConsumptionRepository");
                Object repository = repositoryField.get(root);
                Class<?> volumeOnClass = Class.forName("com.vsco.cam.video.consumption.VolumeOn");
                Object volumeOn = volumeOnClass.getField("INSTANCE").get(null);
                Method setState = findCompatibleMethod(
                    repository.getClass(),
                    "setGlobalVolumeMuteState",
                    volumeOn
                );
                setState.invoke(repository, volumeOn);
            } catch (Exception ignored) {
                // Player volume above is still sufficient for implementations without the repository field.
            }
        }
        if (root instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) root;
            for (int i = 0; i < group.getChildCount(); i++) {
                forceUnmuted(group.getChildAt(i));
            }
        }
    }

    private static void applyAutoplayPreference(Context context, boolean disabled) {
        SharedPreferences nativePrefs = PreferenceManager.getDefaultSharedPreferences(context);
        SharedPreferences ours = preferences(context);
        String key = "key_video_autoplay_enabled_state";
        String backupKey = "native_autoplay_backup";
        if (disabled) {
            if (!ours.contains(backupKey)) {
                ours.edit().putString(backupKey, nativePrefs.getString(key, "WIFI_ONLY")).apply();
            }
            nativePrefs.edit().putString(key, "NEVER").apply();
        } else if (ours.contains(backupKey)) {
            nativePrefs.edit().putString(key, ours.getString(backupKey, "WIFI_ONLY")).apply();
            ours.edit().remove(backupKey).apply();
        }
    }

    @SuppressWarnings("unchecked")
    private static synchronized void applyAnalyticsPreferences() {
        Context context = currentContext();
        if (context == null) {
            return;
        }
        try {
            Class<?> analyticsClass = Class.forName("com.vsco.cam.analytics.A");
            Object analytics = analyticsClass.getMethod("get").invoke(null);
            Object integrations = analyticsClass.getMethod("getIntegrations").invoke(analytics);
            Field mapField = integrations.getClass().getField("integrations");
            Map<String, Object> map = (Map<String, Object>) mapField.get(integrations);
            toggleIntegrations(
                map,
                enabled(context, BLOCK_USAGE_ANALYTICS, false),
                "cantor",
                "cantorlite",
                "firebase",
                "rudderstack"
            );
            toggleIntegrations(
                map,
                enabled(context, BLOCK_MARKETING_ATTRIBUTION, false),
                "appsflyer"
            );
        } catch (Exception ignored) {
            // Analytics internals are optional and must never interfere with VSCO startup.
        }
    }

    private static void toggleIntegrations(Map<String, Object> map, boolean blocked, String... keys) {
        for (String key : keys) {
            if (blocked) {
                Object removed = map.remove(key);
                if (removed != null) {
                    REMOVED_ANALYTICS.put(key, removed);
                }
            } else {
                Object removed = REMOVED_ANALYTICS.remove(key);
                if (removed != null) {
                    map.put(key, removed);
                }
            }
        }
    }

    private static WeakReference<Context> lastContext = new WeakReference<>(null);

    private static Context currentContext() {
        return lastContext.get();
    }

    private static int resourceId(Context context, String type, String name) {
        lastContext = new WeakReference<>(context.getApplicationContext());
        return context.getResources().getIdentifier(name, type, context.getPackageName());
    }

    private static Field findField(Class<?> type, String name) throws NoSuchFieldException {
        Class<?> current = type;
        while (current != null) {
            try {
                Field field = current.getDeclaredField(name);
                field.setAccessible(true);
                return field;
            } catch (NoSuchFieldException ignored) {
                current = current.getSuperclass();
            }
        }
        throw new NoSuchFieldException(name);
    }

    private static Method findCompatibleMethod(Class<?> type, String name, Object argument)
        throws NoSuchMethodException {
        for (Method method : type.getMethods()) {
            if (method.getName().equals(name)
                && method.getParameterTypes().length == 1
                && method.getParameterTypes()[0].isInstance(argument)) {
                return method;
            }
        }
        throw new NoSuchMethodException(name);
    }

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    private static Set<String> setOf(String... values) {
        java.util.HashSet<String> set = new java.util.HashSet<>();
        Collections.addAll(set, values);
        return Collections.unmodifiableSet(set);
    }
}
