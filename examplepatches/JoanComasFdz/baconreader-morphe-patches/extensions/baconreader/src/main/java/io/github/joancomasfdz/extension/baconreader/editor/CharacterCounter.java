// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.editor;

import static app.morphe.extension.shared.StringRef.str;

import android.app.Activity;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;

import org.json.JSONObject;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.text.NumberFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;
import app.morphe.extension.shared.Utils;

/**
 * "1,234 / 10,000" next to the format bar: Reddit's limit for the text being written (comments and messages
 * 10,000 characters, posts 40,000), or the subreddit's own post requirements for a text post. Orange from 90% of
 * the limit or below the subreddit's minimum, red over the limit.
 */
final class CharacterCounter {
    private static final int COMMENT_LIMIT = 10_000;
    private static final int POST_LIMIT = 40_000;
    private static final int RED = 0xFFE53935;
    private static final long REQUIREMENTS_DELAY_MS = 800;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ExecutorService LOADER = Executors.newSingleThreadExecutor();
    /** Subreddit (lower case) → its post requirements, for the session. */
    private static final Map<String, int[]> REQUIREMENTS = new HashMap<>();

    private final EditText editText;
    private final TextView view;
    private final int normalColor;
    private final int warningColor;
    private int max;
    private int min;
    private boolean textNotAllowed;
    private String subreddit;

    CharacterCounter(EditText editText, int normalColor, int warningColor) {
        this.editText = editText;
        this.normalColor = normalColor;
        this.warningColor = warningColor;
        Context context = editText.getContext();
        view = new TextView(context);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        view.setGravity(Gravity.CENTER_VERTICAL | Gravity.END);
        int padding = Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 8,
                context.getResources().getDisplayMetrics()));
        view.setPadding(padding, 0, padding * 2, 0);

        max = isPost(context) ? POST_LIMIT : COMMENT_LIMIT;
        editText.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
            }

            @Override
            public void afterTextChanged(Editable s) {
                update();
            }
        });
        followSubreddit();
        update();
    }

    View view() {
        return view;
    }

    /** A text post, or the edit of a post (PostEditActivity with a link): 40,000. Else a comment or message. */
    private static boolean isPost(Context context) {
        if (!(context instanceof Activity)) return false;
        String name = context.getClass().getName();
        if (name.endsWith(".SubmitActivity")) return true;
        if (!name.endsWith(".PostEditActivity")) return false;
        try {
            for (Class<?> type = context.getClass(); type != null; type = type.getSuperclass()) {
                try {
                    Field link = type.getDeclaredField("link");
                    link.setAccessible(true);
                    return link.get(context) != null;
                } catch (NoSuchFieldException ignored) {
                }
            }
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not tell a post edit from a comment edit", ex);
        }
        return false;
    }

    private void update() {
        String text = editText.getText().toString();
        // Reddit counts characters, not UTF-16 units (an emoji is one).
        int count = text.codePointCount(0, text.length());
        NumberFormat format = NumberFormat.getIntegerInstance();
        if (textNotAllowed) {
            view.setText(str("revanced_markdown_counter_not_allowed", subreddit));
            view.setTextColor(count > 0 ? RED : warningColor);
            return;
        }
        String label = str("revanced_markdown_counter", format.format(count), format.format(max));
        if (min > 0 && count < min) {
            label = str("revanced_markdown_counter_min", format.format(count), format.format(max), format.format(min));
        }
        view.setText(label);
        if (count > max) view.setTextColor(RED);
        else if (count >= max * 9 / 10 || (min > 0 && count > 0 && count < min)) view.setTextColor(warningColor);
        else view.setTextColor(normalColor);
    }

    // region Subreddit post requirements

    /** Text posts: the subreddit's own limits, when it has some, whenever the subreddit field changes. */
    private void followSubreddit() {
        if (!(editText.getContext() instanceof Activity)
                || !editText.getContext().getClass().getName().endsWith(".SubmitActivity")) {
            return;
        }
        View root = editText.getRootView();
        View field = root.findViewById(ResourceUtils.getIdentifier(ResourceType.ID, "storySR"));
        if (!(field instanceof EditText)) return;
        final EditText subredditField = (EditText) field;
        final Runnable load = () -> loadRequirements(subredditField.getText().toString());
        subredditField.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
            }

            @Override
            public void afterTextChanged(Editable s) {
                MAIN.removeCallbacks(load);
                MAIN.postDelayed(load, REQUIREMENTS_DELAY_MS);
            }
        });
        load.run();
    }

    private void loadRequirements(String name) {
        final String subreddit = name.trim().replaceFirst("^/?r/", "");
        if (subreddit.isEmpty() || !subreddit.matches("[A-Za-z0-9_]{2,21}")) {
            apply(null, null);
            return;
        }
        final String key = subreddit.toLowerCase();
        int[] cached;
        synchronized (REQUIREMENTS) {
            cached = REQUIREMENTS.get(key);
        }
        if (cached != null) {
            apply(subreddit, cached);
            return;
        }
        LOADER.execute(() -> {
            int[] requirements = null;
            try {
                JSONObject json = new JSONObject(apiGet("api/v1/" + subreddit + "/post_requirements"));
                requirements = new int[]{
                        json.optInt("body_text_max_length", 0),
                        json.optInt("body_text_min_length", 0),
                        "notAllowed".equals(json.optString("body_restriction_policy")) ? 1 : 0,
                };
                synchronized (REQUIREMENTS) {
                    REQUIREMENTS.put(key, requirements);
                }
            } catch (Exception ex) {
                // No such subreddit yet (still typing), or offline: Reddit's general limit.
                Logger.printInfo(() -> "Could not load the post requirements of r/" + subreddit, ex);
            }
            final int[] loaded = requirements;
            MAIN.post(() -> apply(subreddit, loaded));
        });
    }

    private void apply(String subreddit, int[] requirements) {
        this.subreddit = subreddit;
        max = POST_LIMIT;
        min = 0;
        textNotAllowed = false;
        if (requirements != null) {
            if (requirements[0] > 0) max = Math.min(POST_LIMIT, requirements[0]);
            min = requirements[1];
            textNotAllowed = requirements[2] == 1;
        }
        update();
    }

    /** A GET through the app's own request code (login, the app's user agent), as the avatars. */
    private static String apiGet(String path) throws Exception {
        Object token = Class.forName("com.onelouder.baconreader.data.SessionManager")
                .getMethod("getToken").invoke(null);
        Class<?> requestMethod = Class.forName("com.onelouder.baconreader.RequestMethod");
        Class<?> api = Class.forName("com.onelouder.baconreader.reddit.RedditApi");
        Method httpRequest = api.getDeclaredMethod("httpRequest", Context.class, requestMethod, String.class,
                Map.class, Class.forName("com.onelouder.baconreader.data.SessionToken"));
        httpRequest.setAccessible(true);
        // Without a login the app calls www.reddit.com, which needs the .json suffix.
        if (token == null) path += ".json";
        @SuppressWarnings({"unchecked", "rawtypes"})
        Object get = Enum.valueOf((Class<Enum>) requestMethod, "GET");
        return (String) httpRequest.invoke(null, Utils.getContext(), get, path, new HashMap<String, String>(), token);
    }

    // endregion
}
