package app.morphe.extension.twitch.emotes;

import android.content.Context;
import android.app.Activity;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.text.Editable;
import android.text.Selection;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.EditText;
import android.widget.GridLayout;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.PopupWindow;

import android.util.Log;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import app.morphe.extension.Utils;
import io.github.bakwudo.uyu.extension.settings.Settings;

public final class EmotePickerBridge {
    private static final String TAG = "KizuPicker";
    private static final ConcurrentHashMap<String, String> IMAGE_URLS = new ConcurrentHashMap<>();
    private static final ThreadLocal<Context> URL_CONTEXT = new ThreadLocal<>();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final EmoteImageLoader IMAGES =
            new EmoteImageLoader(EmotePickerBridge::imageUpdated);
    private static final String COMPOSER_WRAPPER_TAG = "kizu.third-party-picker.wrapper";
    private static final String COMPOSER_BUTTON_TAG = "kizu.third-party-picker.button";
    private static volatile ComposerSlot COMPOSER_SLOT;
    private static volatile PickerState CURRENT;
    private static volatile boolean COMPOSER_WATCH_STARTED;
    private static final Runnable COMPOSER_WATCHER = new Runnable() {
        @Override
        public void run() {
            try {
                Activity activity = Utils.getCurrentActivity();
                if (Settings.EMOTES_PICKER.get()) {
                    if (activity != null && !activity.isFinishing()) {
                        installComposerButton(activity);
                    }
                } else {
                    removeComposerButton();
                }
            } catch (Throwable t) {
                Log.w(TAG, "composer watcher failed", t);
            }
            MAIN.postDelayed(this, 700L);
        }
    };

    private static final String T_ASSET = "tv.twitch.android.models.emotes.EmoteModelAssetType";
    private static final String T_KIND = "tv.twitch.android.models.emotes.EmoteModelType";
    private static final String T_MODEL_GENERIC = "tv.twitch.android.models.emotes.EmoteModel$Generic";
    private static final String T_MESSAGE_INPUT = "tv.twitch.android.shared.emotes.models.EmoteMessageInput";
    private static final String T_CLICKED_UNLOCKED =
            "tv.twitch.android.shared.emotes.emotepicker.models.ClickedEmote$Unlocked";
    private static final String T_UI_MODEL =
            "tv.twitch.android.shared.emotes.emotepicker.models.EmoteUiModel";
    private static final String T_IMAGE_DESCRIPTOR =
            "tv.twitch.android.shared.emotes.emotepicker.models.EmoteImageDescriptor";

    private EmotePickerBridge() {}

    /**
     * URL resolver used only for synthetic KIZU-* emote IDs. Native Twitch IDs always
     * fall through to Twitch's original EmoteUrlUtil implementation.
     */
    public static String getEmoteUrl(String id) {
        if (id == null || !id.startsWith("KIZU-")) return null;
        return IMAGE_URLS.get(id);
    }

    /**
     * The Twitch 31.3.1 URL method has only p0/p1. Keep the Context out of p0 while
     * resolving a KIZU URL, then restore it before the original implementation runs.
     */
    public static void saveUrlContext(Context context) {
        URL_CONTEXT.set(context);
    }

    public static Context restoreUrlContext() {
        Context context = URL_CONTEXT.get();
        URL_CONTEXT.remove();
        return context;
    }

    /**
     * Kept as the picker-open observation hook. It deliberately does not create a dialog,
     * replace the native picker, or alter the native picker lifecycle.
     */
    public static void onPickerOpened(Object ignored) {
        try {
            if (Settings.EMOTES_PICKER.get()) {
                Log.d(TAG, "native picker opened; Kizu emotes enabled");
            }
        } catch (Throwable t) {
            Log.w(TAG, "onPickerOpened failed", t);
        }
    }

    /** Starts the optional third-party button watcher and keeps the native Twitch picker untouched. */
    public static void ensureComposerButton() {
        if (COMPOSER_WATCH_STARTED) return;
        COMPOSER_WATCH_STARTED = true;
        MAIN.post(COMPOSER_WATCHER);
    }

    private static void installComposerButton(Activity activity) {
        ComposerSlot slot = COMPOSER_SLOT;
        if (slot != null && slot.isAttached(activity)) return;
        if (slot != null) removeComposerButton();

        View nativeButton = findNativePickerButton(activity.getWindow().getDecorView());
        if (!(nativeButton instanceof ImageView)) return;
        if (!(nativeButton.getParent() instanceof ViewGroup)) return;

        ViewGroup parent = (ViewGroup) nativeButton.getParent();
        if (isInsideKizuWrapper(nativeButton)) return;

        int index = parent.indexOfChild(nativeButton);
        if (index < 0) return;

        ViewGroup.LayoutParams originalParams = nativeButton.getLayoutParams();
        if (originalParams == null) return;

        int originalWidth = originalParams.width;
        int originalHeight = originalParams.height;
        int nativeWidth = nativeButton.getMeasuredWidth();
        int nativeHeight = nativeButton.getMeasuredHeight();

        if (nativeWidth <= 0) {
            nativeWidth = originalWidth > 0 && originalWidth != ViewGroup.LayoutParams.MATCH_PARENT
                    ? originalWidth : dp(activity, 48);
        }
        if (nativeHeight <= 0) {
            nativeHeight = originalHeight > 0 && originalHeight != ViewGroup.LayoutParams.MATCH_PARENT
                    ? originalHeight : dp(activity, 48);
        }

        parent.removeViewAt(index);

        // The wrapper grows by the exact space needed for the new button + divider,
        // causing a sibling message field/weighted area to give up that width.
        int extraWidth = dp(activity, 41);
        if (originalWidth > 0 && originalWidth != ViewGroup.LayoutParams.MATCH_PARENT) {
            originalParams.width = originalWidth + extraWidth;
        }

        LinearLayout wrapper = new LinearLayout(activity);
        wrapper.setOrientation(LinearLayout.HORIZONTAL);
        wrapper.setGravity(Gravity.CENTER_VERTICAL);
        wrapper.setTag(COMPOSER_WRAPPER_TAG);
        wrapper.setBackgroundColor(Color.TRANSPARENT);
        parent.addView(wrapper, index, originalParams);

        TextView thirdParty = new TextView(activity);
        thirdParty.setTag(COMPOSER_BUTTON_TAG);
        thirdParty.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18);
        thirdParty.setCompoundDrawablesWithIntrinsicBounds(new WinkIconDrawable(dp(activity, 22)), null, null, null);
        thirdParty.setGravity(Gravity.CENTER);
        thirdParty.setContentDescription("Third-party emote picker");
        thirdParty.setClickable(true);
        thirdParty.setFocusable(true);
        thirdParty.setMinWidth(dp(activity, 40));
        thirdParty.setMinHeight(nativeHeight);
        thirdParty.setPadding(0, 0, 0, 0);
        thirdParty.setOnClickListener(v -> {
            try {
                Activity current = Utils.getCurrentActivity();
                if (current != null && !current.isFinishing() && Settings.EMOTES_PICKER.get()) {
                    showPicker(current);
                }
            } catch (Throwable t) {
                Log.w(TAG, "standalone picker open failed", t);
            }
        });

        View divider = new View(activity);
        divider.setBackgroundColor(Color.argb(72, 255, 255, 255));

        LinearLayout.LayoutParams thirdPartyParams =
                new LinearLayout.LayoutParams(dp(activity, 40), nativeHeight);
        thirdPartyParams.gravity = Gravity.CENTER_VERTICAL;
        LinearLayout.LayoutParams dividerParams =
                new LinearLayout.LayoutParams(dp(activity, 1), dp(activity, 24));
        dividerParams.gravity = Gravity.CENTER_VERTICAL;
        LinearLayout.LayoutParams nativeParams =
                new LinearLayout.LayoutParams(nativeWidth, nativeHeight);
        nativeParams.gravity = Gravity.CENTER_VERTICAL;

        wrapper.addView(thirdParty, thirdPartyParams);
        wrapper.addView(divider, dividerParams);
        wrapper.addView(nativeButton, nativeParams);
        wrapper.requestLayout();
        parent.requestLayout();

        COMPOSER_SLOT = new ComposerSlot(
                activity, parent, wrapper, nativeButton, index, originalParams, originalWidth, originalHeight
        );
    }

    private static void removeComposerButton() {
        ComposerSlot slot = COMPOSER_SLOT;
        if (slot == null) return;

        try {
            ViewGroup parent = slot.parent;
            LinearLayout wrapper = slot.wrapper;
            View nativeButton = slot.nativeButton;
            if (parent != null && wrapper != null && wrapper.getParent() == parent) {
                wrapper.removeView(nativeButton);
                wrapper.removeAllViews();
                int index = parent.indexOfChild(wrapper);
                parent.removeView(wrapper);

                slot.originalParams.width = slot.originalWidth;
                slot.originalParams.height = slot.originalHeight;
                int insertAt = Math.max(0, Math.min(slot.originalIndex, parent.getChildCount()));
                parent.addView(nativeButton, insertAt, slot.originalParams);
                parent.requestLayout();
            }
        } catch (Throwable t) {
            Log.w(TAG, "remove composer button failed", t);
        } finally {
            COMPOSER_SLOT = null;
        }
    }

    private static View findNativePickerButton(View root) {
        if (root instanceof ImageView && root.getVisibility() == View.VISIBLE && root.isShown()) {
            String description = root.getContentDescription() == null
                    ? "" : root.getContentDescription().toString().toLowerCase(java.util.Locale.ROOT);
            String resourceName = "";
            try {
                int id = root.getId();
                if (id != View.NO_ID) {
                    resourceName = root.getResources().getResourceEntryName(id)
                            .toLowerCase(java.util.Locale.ROOT);
                }
            } catch (Throwable ignored) {
            }

            boolean pickerNamed = description.contains("emote") ||
                    description.contains("emoji") ||
                    description.contains("smiley") ||
                    resourceName.contains("emote") ||
                    resourceName.contains("emoji") ||
                    resourceName.contains("smiley");

            if (pickerNamed && hasComposerInputNearby(root)) return root;
        }

        if (root instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) root;
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = findNativePickerButton(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    private static boolean hasComposerInputNearby(View view) {
        View current = view;
        for (int depth = 0; depth < 6 && current != null; depth++) {
            if (current instanceof ViewGroup && containsEditText((ViewGroup) current)) return true;
            Object parent = current.getParent();
            current = parent instanceof View ? (View) parent : null;
        }
        return false;
    }

    private static boolean containsEditText(ViewGroup group) {
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child instanceof EditText) return true;
            if (child instanceof ViewGroup && containsEditText((ViewGroup) child)) return true;
        }
        return false;
    }

    private static boolean isInsideKizuWrapper(View view) {
        Object parent = view.getParent();
        for (int i = 0; i < 6 && parent != null; i++) {
            if (parent instanceof View &&
                    COMPOSER_WRAPPER_TAG.equals(((View) parent).getTag())) return true;
            parent = parent instanceof View ? ((View) parent).getParent() : null;
        }
        return false;
    }

    private static void showPicker(Activity activity) {
        PickerState previous = CURRENT;
        if (previous != null && previous.popup != null && previous.popup.isShowing()) {
            previous.popup.dismiss();
        }

        View input = activity.getCurrentFocus();
        if (!(input instanceof EditText)) input = findEditText(activity.getWindow().getDecorView());

        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(activity, 8), dp(activity, 8), dp(activity, 8), dp(activity, 8));
        root.setBackgroundColor(Color.rgb(24, 24, 27));

        EditText search = new EditText(activity);
        search.setSingleLine(true);
        search.setHint("Search emotes");
        search.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        search.setPadding(dp(activity, 10), 0, dp(activity, 10), 0);
        root.addView(search, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(activity, 42)));

        ScrollView scroll = new ScrollView(activity);
        GridLayout grid = new GridLayout(activity);
        int columns = Math.max(4, Math.min(7,
                activity.getResources().getDisplayMetrics().widthPixels / dp(activity, 58)));
        grid.setColumnCount(columns);
        scroll.addView(grid, new ScrollView.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        root.addView(scroll, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        TextView status = new TextView(activity);
        status.setGravity(Gravity.CENTER);
        status.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        status.setText("Loading third-party emotes...");
        root.addView(status, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(activity, 30)));

        final PopupWindow popup = new PopupWindow(
                root,
                ViewGroup.LayoutParams.MATCH_PARENT,
                dp(activity, 520),
                true
        );
        GradientDrawable background = new GradientDrawable();
        background.setColor(Color.rgb(24, 24, 27));
        background.setCornerRadius(dp(activity, 12));
        popup.setBackgroundDrawable(background);
        popup.setOutsideTouchable(true);
        popup.setFocusable(true);
        popup.setElevation(dp(activity, 10));
        popup.setInputMethodMode(PopupWindow.INPUT_METHOD_NEEDED);
        popup.setClippingEnabled(true);

        View anchor = findComposerPickerButton(activity);
        if (anchor == null) {
            anchor = activity.getWindow().getDecorView();
        }

        PickerState state = new PickerState(activity, popup, grid, search, status, input, anchor);
        CURRENT = state;

        search.addTextChangedListener(new android.text.TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) {}
            @Override public void onTextChanged(CharSequence s, int start, int before, int count) {
                rebuild(state);
            }
            @Override public void afterTextChanged(Editable s) {}
        });

        popup.setOnDismissListener(() -> {
            if (CURRENT == state) CURRENT = null;
            stopAnimations(grid);
        });

        popup.showAsDropDown(
                anchor,
                0,
                -(dp(activity, 520) + anchor.getHeight() + dp(activity, 6)),
                Gravity.CENTER_HORIZONTAL
        );

        final String channel = EmoteSupport.getCurrentChannelId();
        new Thread(() -> {
            List<Emote> entries;
            try {
                entries = EmoteSupport.getAllForChannelForPicker(channel);
            } catch (Throwable t) {
                entries = java.util.Collections.emptyList();
            }
            state.entries = entries == null ? java.util.Collections.emptyList() : entries;
            MAIN.post(() -> {
                if (CURRENT != state || !popup.isShowing()) return;
                status.setText(state.entries.isEmpty()
                        ? "No third-party emotes loaded"
                        : state.entries.size() + " emotes");
                rebuild(state);
            });
        }, "kizu-picker-catalog").start();
    }

    private static View findComposerPickerButton(Activity activity) {
        ComposerSlot slot = COMPOSER_SLOT;
        if (slot != null && slot.isAttached(activity)) {
            View button = slot.wrapper.findViewWithTag(COMPOSER_BUTTON_TAG);
            if (button != null) return button;
        }
        return findNativePickerButton(activity.getWindow().getDecorView());
    }

    private static void rebuild(PickerState state) {
        if (state == null || state.grid == null) return;
        state.grid.removeAllViews();

        String query = state.search.getText() == null
                ? "" : state.search.getText().toString().trim().toLowerCase(java.util.Locale.ROOT);

        int count = 0;
        for (Emote emote : state.entries) {
            if (emote == null || emote.name == null || emote.url == null) continue;
            if (!query.isEmpty() &&
                    !emote.name.toLowerCase(java.util.Locale.ROOT).contains(query)) continue;

            Drawable drawable = IMAGES.createDrawable(state.activity.getResources(), emote);
            if (drawable != null) {
                ImageButton button = new ImageButton(state.activity);
                button.setBackgroundColor(Color.TRANSPARENT);
                button.setPadding(dp(state.activity, 5), dp(state.activity, 5),
                        dp(state.activity, 5), dp(state.activity, 5));
                button.setContentDescription(emote.name);
                button.setImageDrawable(drawable);
                button.setOnClickListener(v -> insertEmote(state, emote.name));
                state.grid.addView(button, cellParams(state.activity));
            } else {
                TextView placeholder = new TextView(state.activity);
                placeholder.setText(emote.name);
                placeholder.setGravity(Gravity.CENTER);
                placeholder.setTextSize(TypedValue.COMPLEX_UNIT_SP, 9);
                placeholder.setMaxLines(2);
                placeholder.setEllipsize(android.text.TextUtils.TruncateAt.END);
                placeholder.setOnClickListener(v -> insertEmote(state, emote.name));
                state.grid.addView(placeholder, cellParams(state.activity));
                IMAGES.request(state.activity, emote, dp(state.activity, 42));
            }
            count++;
        }

        if (count == 0 && !state.entries.isEmpty()) {
            TextView empty = new TextView(state.activity);
            empty.setText("No matching emotes");
            empty.setGravity(Gravity.CENTER);
            state.grid.addView(empty, new GridLayout.LayoutParams());
        }
    }

    private static GridLayout.LayoutParams cellParams(Context context) {
        GridLayout.LayoutParams params = new GridLayout.LayoutParams();
        int size = dp(context, 58);
        params.width = size;
        params.height = size;
        params.setMargins(dp(context, 1), dp(context, 1), dp(context, 1), dp(context, 1));
        return params;
    }

    private static void insertEmote(PickerState state, String code) {
        try {
            View view = state.input instanceof EditText
                    ? state.input
                    : findEditText(state.activity.getWindow().getDecorView());
            if (!(view instanceof EditText)) {
                state.popup.dismiss();
                return;
            }

            EditText input = (EditText) view;
            Editable editable = input.getText();
            if (editable == null) {
                state.popup.dismiss();
                return;
            }

            int start = Math.max(0, input.getSelectionStart());
            int end = Math.max(0, input.getSelectionEnd());
            start = Math.min(start, editable.length());
            end = Math.min(end, editable.length());
            if (start > end) {
                int swap = start;
                start = end;
                end = swap;
            }

            String prefix = start > 0 && !Character.isWhitespace(editable.charAt(start - 1))
                    ? " " : "";
            String suffix = end < editable.length() &&
                    !Character.isWhitespace(editable.charAt(end)) ? " " : "";
            String value = prefix + code + suffix;
            editable.replace(start, end, value);

            int cursor = start + value.length() - suffix.length();
            Selection.setSelection(editable, Math.max(0, Math.min(cursor, editable.length())));
            input.requestFocus();
            state.popup.dismiss();
        } catch (Throwable t) {
            Log.e(TAG, "insert failed", t);
            state.popup.dismiss();
        }
    }

    private static EditText findEditText(View root) {
        if (root instanceof EditText &&
                root.getVisibility() == View.VISIBLE && root.isShown()) return (EditText) root;
        if (root instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) root;
            for (int i = 0; i < group.getChildCount(); i++) {
                EditText result = findEditText(group.getChildAt(i));
                if (result != null) return result;
            }
        }
        return null;
    }

    private static void imageUpdated(String url) {
        PickerState state = CURRENT;
        if (state == null) return;
        MAIN.post(() -> {
            if (CURRENT == state && state.popup.isShowing()) rebuild(state);
        });
    }

    private static void stopAnimations(ViewGroup group) {
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child instanceof ImageView) {
                Drawable drawable = ((ImageView) child).getDrawable();
                if (drawable instanceof android.graphics.drawable.AnimatedImageDrawable) {
                    ((android.graphics.drawable.AnimatedImageDrawable) drawable).stop();
                }
            }
        }
    }

    /**
     * Adds Kizu emotes to Twitch's existing ALL picker model. The native Twitch picker
     * remains responsible for layout, scrolling, animation, click handling and insertion.
     * No separate dialog or alternate picker UI is created.
     */
    public static Object mergeGlobal(Object uiSet) {
        if (!Settings.EMOTES_PICKER.get() || uiSet == null) return uiSet;

        try {
            List<Entry> entries = loadForChannel(EmoteSupport.getCurrentChannelId());
            if (entries.isEmpty()) return uiSet;

            Method getHeader = findNoArgMethod(uiSet.getClass(), "c", "getHeader");
            if (getHeader == null) {
                getHeader = findObjectGetterByType(
                        uiSet.getClass(),
                        "tv.twitch.android.shared.emotes.emotepicker.models.EmoteHeaderUiModel");
            }

            if (getHeader != null) {
                Object header = getHeader.invoke(uiSet);
                if (header != null) {
                    Method getSection = findNoArgMethod(header.getClass(), "getEmotePickerSection");
                    if (getSection != null) {
                        Object section = getSection.invoke(header);
                        if (section != null && !"ALL".equals(section.toString())) {
                            return uiSet;
                        }
                    }
                }
            }

            Method getEmotes = findNoArgMethod(uiSet.getClass(), "b", "getEmotes");
            if (getEmotes == null) getEmotes = findListReturningGetter(uiSet.getClass());
            if (getEmotes == null) throw new NoSuchMethodException("EmoteUiSet emote-list getter not found");

            Object raw = getEmotes.invoke(uiSet);
            if (!(raw instanceof List)) return uiSet;

            @SuppressWarnings("unchecked")
            List<Object> list = (List<Object>) raw;
            Set<String> existingCodes = new HashSet<>();
            for (Object item : list) extractCode(item, existingCodes);

            ClassLoader cl = uiSet.getClass().getClassLoader();
            int added = 0;
            for (Entry entry : entries) {
                if (existingCodes.contains(entry.code)) continue;
                Object model = buildUiModel(cl, entry);
                if (model != null) {
                    list.add(model);
                    existingCodes.add(entry.code);
                    added++;
                }
            }

            Log.d(TAG, "native ALL picker added " + added + "/" + entries.size() + " Kizu emotes");
            return uiSet;
        } catch (Throwable t) {
            Log.e(TAG, "mergeGlobal failed; native picker is left unchanged", t);
            return uiSet;
        }
    }

    private static List<Entry> loadForChannel(String channelId) {
        try {
            List<Emote> source = EmoteSupport.getAllForChannelForPicker(channelId);
            if (source == null || source.isEmpty()) return java.util.Collections.emptyList();

            List<Entry> out = new ArrayList<>(source.size());
            for (Emote value : source) {
                if (value == null || value.name == null || value.name.isEmpty() ||
                        value.url == null || value.url.isEmpty()) continue;
                out.add(new Entry(value.name, pickerUrl(value.url, value.animated), value.animated));
            }
            return out;
        } catch (Throwable t) {
            Log.e(TAG, "loadForChannel failed", t);
            return java.util.Collections.emptyList();
        }
    }

    private static String pickerUrl(String url, boolean animated) {
        if (!animated || url == null) return url;
        if (url.endsWith(".webp")) return url.substring(0, url.length() - 5) + ".gif";
        return url;
    }

    private static Object buildUiModel(ClassLoader cl, Entry entry) throws Exception {
        Class<?> assetType = Class.forName(T_ASSET, false, cl);
        Class<?> modelKind = Class.forName(T_KIND, false, cl);
        Class<?> modelGeneric = Class.forName(T_MODEL_GENERIC, false, cl);
        Class<?> messageInput = Class.forName(T_MESSAGE_INPUT, false, cl);
        Class<?> clickedUnlocked = Class.forName(T_CLICKED_UNLOCKED, false, cl);
        Class<?> uiModel = Class.forName(T_UI_MODEL, false, cl);
        Class<?> imageDescriptor = Class.forName(T_IMAGE_DESCRIPTOR, false, cl);

        Object asset = enumConstant(assetType, entry.animated ? "ANIMATED" : "STATIC");
        Object kind = enumConstant(modelKind, "OTHER");

        String syntheticId = "KIZU-" + Integer.toHexString(entry.code.hashCode()) + "-" +
                Integer.toHexString(entry.url.hashCode());

        IMAGE_URLS.put(syntheticId, entry.url);

        Object emoteModel = newInstanceMatching(
                modelGeneric, syntheticId, entry.code, asset, kind
        );
        Object input = newInstanceMatching(
                messageInput, entry.code, syntheticId, false
        );
        Object clicked = newInstanceMatching(
                clickedUnlocked, emoteModel, input, null, null, 12, null
        );

        Context context = Utils.getContext();
        Object descriptor = enumConstant(imageDescriptor, "NONE");
        int widthRes = 0;
        int paddingRes = 0;
        if (context != null) {
            widthRes = context.getResources().getIdentifier(
                    "emote_picker_emote_size", "dimen", context.getPackageName());
            paddingRes = context.getResources().getIdentifier(
                    "emote_picker_emote_padding", "dimen", context.getPackageName());
        }

        return newInstanceMatching(
                uiModel,
                syntheticId,
                clicked,
                asset,
                descriptor,
                widthRes,
                paddingRes == 0 ? null : Integer.valueOf(paddingRes)
        );
    }

    private static Method findNoArgMethod(Class<?> cls, String... names) {
        for (String name : names) {
            try {
                Method m = cls.getMethod(name);
                if (m.getParameterCount() == 0) return m;
            } catch (Throwable ignored) {}
        }
        return null;
    }

    private static Method findObjectGetterByType(Class<?> cls, String typeName) {
        for (Method method : cls.getMethods()) {
            if (method.getParameterCount() == 0 &&
                    method.getReturnType().getName().equals(typeName)) return method;
        }
        return null;
    }

    private static Method findListReturningGetter(Class<?> cls) {
        for (Method method : cls.getMethods()) {
            if (method.getParameterCount() == 0 &&
                    List.class.isAssignableFrom(method.getReturnType())) return method;
        }
        return null;
    }

    private static void extractCode(Object uiModel, Set<String> out) {
        if (uiModel == null) return;
        try {
            Object clicked = findObjectField(uiModel, "clickedEmote", "b");
            if (clicked == null) return;

            Object input = findObjectField(clicked, "emoteMessageInput");
            if (input == null) {
                for (Method m : clicked.getClass().getMethods()) {
                    if (m.getParameterCount() == 0 &&
                            m.getReturnType().getName().endsWith("EmoteMessageInput")) {
                        input = m.invoke(clicked);
                        break;
                    }
                }
            }
            if (input == null) return;

            Object code = findObjectField(input, "code");
            if (code != null) out.add(String.valueOf(code));
        } catch (Throwable ignored) {}
    }

    private static Object findObjectField(Object owner, String... names) {
        for (String name : names) {
            try {
                java.lang.reflect.Field field = owner.getClass().getDeclaredField(name);
                field.setAccessible(true);
                return field.get(owner);
            } catch (Throwable ignored) {}
        }
        return null;
    }

    private static Object newInstanceMatching(Class<?> cls, Object... args) throws Exception {
        for (Constructor<?> constructor : cls.getDeclaredConstructors()) {
            Class<?>[] types = constructor.getParameterTypes();
            if (types.length != args.length) continue;

            boolean compatible = true;
            for (int i = 0; i < types.length; i++) {
                if (args[i] == null) {
                    if (types[i].isPrimitive()) {
                        compatible = false;
                        break;
                    }
                    continue;
                }
                if (!wrapPrimitive(types[i]).isAssignableFrom(args[i].getClass())) {
                    compatible = false;
                    break;
                }
            }
            if (!compatible) continue;

            constructor.setAccessible(true);
            return constructor.newInstance(args);
        }
        throw new NoSuchMethodException(cls.getName() + " has no compatible constructor");
    }

    private static Object enumConstant(Class<?> cls, String name) throws Exception {
        @SuppressWarnings({"rawtypes", "unchecked"})
        Object value = Enum.valueOf((Class<? extends Enum>) cls, name);
        return value;
    }

    private static Class<?> wrapPrimitive(Class<?> type) {
        if (!type.isPrimitive()) return type;
        if (type == boolean.class) return Boolean.class;
        if (type == byte.class) return Byte.class;
        if (type == short.class) return Short.class;
        if (type == int.class) return Integer.class;
        if (type == long.class) return Long.class;
        if (type == float.class) return Float.class;
        if (type == double.class) return Double.class;
        if (type == char.class) return Character.class;
        return type;
    }

    private static int dp(Context context, int value) {
        return Math.round(TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, value,
                context.getResources().getDisplayMetrics()));
    }

    private static final class WinkIconDrawable extends Drawable {
        private final android.graphics.Paint paint = new android.graphics.Paint(android.graphics.Paint.ANTI_ALIAS_FLAG);
        private final int size;

        WinkIconDrawable(int size) {
            this.size = size;
            paint.setColor(Color.rgb(225, 225, 225));
            paint.setStyle(android.graphics.Paint.Style.STROKE);
            paint.setStrokeCap(android.graphics.Paint.Cap.ROUND);
            paint.setStrokeJoin(android.graphics.Paint.Join.ROUND);
        }

        @Override public void draw(android.graphics.Canvas canvas) {
            float s = size;
            float cx = s / 2f;
            float cy = s / 2f;
            float r = s * 0.39f;
            paint.setStrokeWidth(Math.max(1.6f, s * 0.075f));
            canvas.drawCircle(cx, cy, r, paint);

            // Open eye.
            canvas.drawCircle(cx - s * 0.14f, cy - s * 0.08f, s * 0.035f, paint);

            // Wink.
            canvas.drawLine(cx + s * 0.08f, cy - s * 0.08f,
                    cx + s * 0.20f, cy - s * 0.08f, paint);

            // Small smile.
            android.graphics.RectF smile = new android.graphics.RectF(
                    cx - s * 0.17f, cy + s * 0.02f,
                    cx + s * 0.17f, cy + s * 0.22f);
            canvas.drawArc(smile, 20f, 140f, false, paint);
        }

        @Override public void setAlpha(int alpha) { paint.setAlpha(alpha); }
        @Override public void setColorFilter(android.graphics.ColorFilter filter) { paint.setColorFilter(filter); }
        @Override public int getOpacity() { return android.graphics.PixelFormat.TRANSLUCENT; }
        @Override public int getIntrinsicWidth() { return size; }
        @Override public int getIntrinsicHeight() { return size; }
    }

    private static final class PickerState {
        final Activity activity;
        final PopupWindow popup;
        final GridLayout grid;
        final EditText search;
        final TextView status;
        final View input;
        final View anchor;
        volatile List<Emote> entries = java.util.Collections.emptyList();

        PickerState(Activity activity, PopupWindow popup, GridLayout grid,
                    EditText search, TextView status, View input, View anchor) {
            this.activity = activity;
            this.popup = popup;
            this.grid = grid;
            this.search = search;
            this.status = status;
            this.input = input;
            this.anchor = anchor;
        }
    }

    private static final class ComposerSlot {
        final Activity activity;
        final ViewGroup parent;
        final LinearLayout wrapper;
        final View nativeButton;
        final int originalIndex;
        final ViewGroup.LayoutParams originalParams;
        final int originalWidth;
        final int originalHeight;

        ComposerSlot(Activity activity, ViewGroup parent, LinearLayout wrapper, View nativeButton,
                     int originalIndex, ViewGroup.LayoutParams originalParams,
                     int originalWidth, int originalHeight) {
            this.activity = activity;
            this.parent = parent;
            this.wrapper = wrapper;
            this.nativeButton = nativeButton;
            this.originalIndex = originalIndex;
            this.originalParams = originalParams;
            this.originalWidth = originalWidth;
            this.originalHeight = originalHeight;
        }

        boolean isAttached(Activity currentActivity) {
            return activity == currentActivity &&
                    wrapper != null && wrapper.getParent() == parent &&
                    nativeButton != null && nativeButton.getParent() == wrapper;
        }
    }

    private static final class Entry {
        final String code;
        final String url;
        final boolean animated;

        Entry(String code, String url, boolean animated) {
            this.code = code;
            this.url = url;
            this.animated = animated;
        }
    }
}
