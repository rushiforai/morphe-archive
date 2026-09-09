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
import android.graphics.Matrix;
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
                "M 0 0 C 8.6 5.261 14.696 12.748 17.527 22.496 C 19.215 31.435 18.184 39.008 14.68 47.344 C 13.823 50.693 14.586 51.906 16 55 C 17.772 66.033 17.104 75.045 10.992 84.535 C 3.455 93.861 -8.812 99.734 -18.988 105.79 C -20.705 106.823 -22.402 107.888 -24.094 108.961 C -33.175 114.707 -41.891 116.445 -52.609 114.535 C -62.859 111.845 -70.949 105.646 -77 97 C -81.113 89.388 -82.094 81.539 -81 73 C -80.328 70.939 -79.599 68.895 -78.812 66.875 C -76.709 61.302 -77.364 58.36 -79.234 52.844 C -81.619 43.988 -79.011 35.8 -75.059 27.852 C -69.43 20.055 -61.139 15.314 -53.062 10.375 C -52.029 9.733 -50.996 9.091 -49.932 8.43 C -33.961 -1.442 -18.545 -9.809 0 0 Z",
                96f, 9f);
        private static final Path INNER = path(
                "M 0 0 C 6.106 2.576 10.24 7.329 13.012 13.25 C 13.999 18.088 14.22 22.562 12.637 27.312 C 7.793 25.859 2.783 24.28 -1.363 21.312 C -2.863 18.062 -2.863 18.062 -3.363 15.312 C -6.687 14.481 -8.706 14.055 -11.941 15.324 C -12.823 15.877 -13.705 16.43 -14.613 17 C -15.636 17.641 -16.658 18.281 -17.711 18.941 C -18.28 19.312 -18.848 19.682 -19.434 20.063 C -21.643 21.494 -23.877 22.883 -26.109 24.277 C -27.758 25.329 -29.405 26.382 -31.051 27.438 C -31.854 27.94 -32.656 28.442 -33.483 28.96 C -39.067 32.62 -39.067 32.62 -40.508 35.992 C -40.363 38.313 -40.363 38.313 -38.363 41.312 C -32.663 42.085 -29.148 40.513 -24.551 37.375 C -23.419 36.636 -22.288 35.898 -21.156 35.16 C -20.235 34.55 -19.313 33.941 -18.363 33.312 C -13.819 31.04 -7.036 31.659 -2.191 32.844 C 3.932 35.337 8.158 38.924 10.91 44.898 C 12.678 50.771 12.402 56.881 10.574 62.688 C 5.844 69.096 -0.985 73.187 -7.676 77.312 C -8.514 77.834 -9.352 78.356 -10.215 78.894 C -12.594 80.372 -14.979 81.843 -17.363 83.312 C -17.911 83.655 -17.911 83.655 -20.684 85.387 C -26.933 89.239 -31.835 91.215 -39.363 90.312 C -46.413 88.507 -51.56 85.63 -55.363 79.312 C -57.675 73.427 -58.315 67.412 -56.363 61.312 C -54.689 61.961 -53.025 62.634 -51.363 63.312 C -50.616 63.581 -49.868 63.849 -49.098 64.125 C -42.697 66.603 -42.697 66.603 -40.863 70.5 C -40.698 71.428 -40.533 72.356 -40.363 73.312 C -39.363 74.312 -39.363 74.312 -36.422 74.762 C -30.88 74.676 -26.816 71.178 -22.426 68.125 C -20.709 66.964 -18.991 65.804 -17.273 64.645 C -16.452 64.079 -15.63 63.513 -14.783 62.929 C -11.874 60.986 -8.875 59.232 -5.821 57.527 C -4.363 56.312 -4.363 56.312 -3.738 52.625 C -4.363 49.312 -4.363 49.312 -6.363 47.312 C -12.64 47.179 -16.572 50.113 -21.617 53.621 C -27.285 57.112 -32.824 58.19 -39.363 57.312 C -45.522 55.439 -49.87 51.664 -53.363 46.312 C -55.132 42.642 -55.71 39.565 -55.801 35.5 C -55.841 34.524 -55.881 33.548 -55.922 32.543 C -55.027 27.367 -52.631 23.283 -48.649 19.823 C -46.704 18.452 -44.723 17.213 -42.676 16 C -41.937 15.548 -41.198 15.096 -40.437 14.63 C -38.877 13.675 -37.313 12.727 -35.747 11.784 C -33.352 10.305 -31.028 8.75 -28.703 7.164 C -19.162 0.765 -11.728 -3.412 0 0 Z",
                86.36328f, 19.6875f);
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
            canvas.scale(size / 128f, size / 128f);
            Paint logo = new Paint(Paint.ANTI_ALIAS_FLAG);
            logo.setStyle(Paint.Style.FILL);
            logo.setAlpha(paint.getAlpha());
            logo.setColor(Color.BLACK);
            canvas.drawPath(OUTER, logo);
            logo.setColor(Color.WHITE);
            canvas.drawPath(INNER, logo);
            canvas.restoreToCount(save);
        }

        private static Path path(String data, float dx, float dy) {
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
            Matrix transform = new Matrix();
            transform.setTranslate(dx, dy);
            path.transform(transform);
            return path;
        }
    }
}
