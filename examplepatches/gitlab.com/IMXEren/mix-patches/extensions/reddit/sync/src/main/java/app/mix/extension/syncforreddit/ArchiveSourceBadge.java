/*
 * Copyright 2026 IMXEren.
 * https://gitlab.com/IMXEren/mix-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.mix.extension.syncforreddit;

import android.content.ContentValues;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.style.ReplacementSpan;
import android.widget.TextView;

import androidx.annotation.NonNull;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

@SuppressWarnings("unused")
public final class ArchiveSourceBadge {
    private static final String PREFS = "mix_arctic_shift_sources";
    private static final String IDS = "ids";
    private static final int MAX_IDS = 4000;
    private static final Object lock = new Object();
    private static final Map<Class<?>, Method> contentValuesMethods = new HashMap<>();
    private static Set<String> archiveIds;

    private ArchiveSourceBadge() {
    }

    static void remember(Context context, Set<String> archive, Set<String> nativeIds) {
        synchronized (lock) {
            Set<String> ids = ids(context);
            ids.removeAll(nativeIds);
            ids.addAll(archive);
            if (ids.size() > MAX_IDS) {
                ids.clear();
                ids.addAll(archive);
            }
            preferences(context).edit().putStringSet(IDS, new HashSet<>(ids)).apply();
        }
    }

    public static void decorate(TextView view, Object post) {
        String id = postId(post);
        if (id == null || !isArchive(view.getContext(), id)) {
            return;
        }
        CharSequence text = view.getText();
        if (TextUtils.isEmpty(text)) {
            return;
        }
        if (text instanceof Spannable
                && ((Spannable) text).getSpans(0, text.length(), LogoSpan.class).length > 0) {
            return;
        }

        SpannableStringBuilder decorated = new SpannableStringBuilder(text).append(" • ");
        int start = decorated.length();
        decorated.append((char) 0xFFFC);
        decorated.setSpan(new LogoSpan(view.getTextSize()), start, start + 1,
                Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
        view.setText(decorated, TextView.BufferType.SPANNABLE);
    }

    private static boolean isArchive(Context context, String id) {
        synchronized (lock) {
            return ids(context).contains(id);
        }
    }

    private static Set<String> ids(Context context) {
        if (archiveIds == null) {
            Set<String> stored = preferences(context).getStringSet(IDS, null);
            archiveIds = stored == null ? new HashSet<>() : new HashSet<>(stored);
        }
        return archiveIds;
    }

    private static SharedPreferences preferences(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static String postId(Object post) {
        if (post == null) {
            return null;
        }
        try {
            Method cached;
            synchronized (contentValuesMethods) {
                cached = contentValuesMethods.get(post.getClass());
            }
            if (cached != null) {
                Object result = cached.invoke(post);
                return result instanceof ContentValues
                        ? ((ContentValues) result).getAsString("_id") : null;
            }
            for (Method method : post.getClass().getMethods()) {
                if (method.getParameterTypes().length != 0
                        || method.getReturnType() != ContentValues.class) {
                    continue;
                }
                ContentValues values = (ContentValues) method.invoke(post);
                if (values != null && values.containsKey("_id")) {
                    synchronized (contentValuesMethods) {
                        contentValuesMethods.put(post.getClass(), method);
                    }
                    return values.getAsString("_id");
                }
            }
        } catch (Exception ignored) {
        }
        return null;
    }

    private static final class LogoSpan extends ReplacementSpan {
        private static final Path OUTER = path(
                "M 12.65 2.375 L 20.01 6.625 C 20.45 6.88 20.66 7.12 20.66 7.75 L 20.66 16.25 C 20.66 16.88 20.45 17.12 20.01 17.375 L 12.65 21.625 C 12.21 21.88 11.79 21.88 11.35 21.625 L 3.99 17.375 C 3.55 17.12 3.34 16.88 3.34 16.25 L 3.34 7.75 C 3.34 7.12 3.55 6.88 3.99 6.625 L 11.35 2.375 C 11.79 2.12 12.21 2.12 12.65 2.375 Z");
        private static final Path INNER = path(
                "M 7.85 16.8 C 6.9 16.8 6.55 16.2 6.9 15.3 L 9.7 8.4 C 10.1 7.4 10.7 7 12 7 C 13.3 7 13.9 7.4 14.3 8.4 L 17.1 15.3 C 17.45 16.2 17.1 16.8 16.15 16.8 L 15.6 16.8 C 14.9 16.8 14.5 16.5 14.3 15.85 L 14.05 15.15 C 13.95 14.85 13.8 14.75 13.45 14.75 L 10.55 14.75 C 10.2 14.75 10.05 14.85 9.95 15.15 L 9.7 15.85 C 9.5 16.5 9.1 16.8 8.4 16.8 Z M 11.05 12.4 C 10.9 12.8 11.1 13 11.5 13 L 12.5 13 C 12.9 13 13.1 12.8 12.95 12.4 L 12.4 10.75 C 12.25 10.3 11.75 10.3 11.6 10.75 Z");
        private final int size;

        LogoSpan(float textSize) {
            size = Math.max(1, Math.round(textSize * 1.15f));
        }

        @Override
        public int getSize(@NonNull Paint paint, @NonNull CharSequence text,
                           int start, int end, Paint.FontMetricsInt metrics) {
            return size;
        }

        @Override
        public void draw(@NonNull Canvas canvas, @NonNull CharSequence text,
                         int start, int end, float x, int top, int y, int bottom,
                         @NonNull Paint paint) {
            int save = canvas.save();
            canvas.translate(x, top + (bottom - top - size) / 2f);
            canvas.scale(size / 24f, size / 24f);
            Paint logo = new Paint(Paint.ANTI_ALIAS_FLAG);
            logo.setStyle(Paint.Style.FILL);
            logo.setAlpha(paint.getAlpha());
            logo.setColor(0xFFEF6C45);
            canvas.drawPath(OUTER, logo);
            logo.setColor(Color.WHITE);
            canvas.drawPath(INNER, logo);
            canvas.restoreToCount(save);
        }

        private static Path path(String data) {
            String[] tokens = data.trim().split("\\s+");
            Path path = new Path();
            char command = 0;
            int index = 0;
            while (index < tokens.length) {
                String token = tokens[index];
                if (token.length() == 1 && Character.isLetter(token.charAt(0))) {
                    command = token.charAt(0);
                    index++;
                    if (command == 'Z') {
                        path.close();
                    }
                    continue;
                }
                if (command == 'M') {
                    path.moveTo(Float.parseFloat(tokens[index]),
                            Float.parseFloat(tokens[index + 1]));
                    index += 2;
                    command = 'L';
                } else if (command == 'L') {
                    path.lineTo(Float.parseFloat(tokens[index]),
                            Float.parseFloat(tokens[index + 1]));
                    index += 2;
                } else if (command == 'C') {
                    path.cubicTo(
                            Float.parseFloat(tokens[index]), Float.parseFloat(tokens[index + 1]),
                            Float.parseFloat(tokens[index + 2]), Float.parseFloat(tokens[index + 3]),
                            Float.parseFloat(tokens[index + 4]), Float.parseFloat(tokens[index + 5]));
                    index += 6;
                } else {
                    break;
                }
            }
            path.setFillType(Path.FillType.EVEN_ODD);
            return path;
        }
    }
}
