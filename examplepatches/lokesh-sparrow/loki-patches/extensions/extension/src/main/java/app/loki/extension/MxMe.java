/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.loki.extension;

import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

/**
 * A "Loki Patches" row on MX Player's Me page, built at runtime from MX's own Settings row so it follows whatever
 * theme is active: the same layout params, background, padding, text colour, text size and typeface, with the icon
 * and chevron copied from that row.
 *
 * The row is deliberately not added to res/layout/fragment_me.xml. An extra row there sent MX's skin inflater down a
 * fallback path that painted the whole page in the light theme on Android 16, whatever theme was set.
 */
public final class MxMe {
    private static final String ROW_TAG = "loki-patches";
    private static final String ICON = "loki_patches_pref_icon";

    private MxMe() {
    }

    public static void addRow(Object binding) {
        try {
            View settings = findSettings(binding);
            if (settings == null || !(settings.getParent() instanceof ViewGroup)) {
                LokiLog.note("me row: Settings row not found");
                return;
            }
            ViewGroup container = (ViewGroup) settings.getParent();
            for (int index = 0; index < container.getChildCount(); index++) {
                if (ROW_TAG.equals(container.getChildAt(index).getTag())) return;
            }
            container.addView(build(settings), container.indexOfChild(settings));
            LokiLog.debug("me row: added");
        } catch (Throwable error) {
            LokiLog.note("me row: " + error);
        }
    }

    private static View findSettings(Object binding) throws IllegalAccessException {
        for (View view : held(binding)) {
            Context context = view.getContext();
            int id = context.getResources().getIdentifier("settings", "id", context.getPackageName());
            if (id == 0) continue;
            View found = view.findViewById(id);
            if (found != null) return found;
        }
        return null;
    }

    /** Every View the binding holds; the first field is itself a row, so all of them are searched. */
    private static List<View> held(Object binding) throws IllegalAccessException {
        List<View> views = new ArrayList<>();
        if (binding instanceof View) {
            views.add((View) binding);
            return views;
        }
        if (binding == null) return views;
        for (Class<?> type = binding.getClass(); type != null; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (!View.class.isAssignableFrom(field.getType())) continue;
                field.setAccessible(true);
                Object value = field.get(binding);
                if (value instanceof View) views.add((View) value);
            }
        }
        return views;
    }

    private static View build(View settings) {
        Context context = settings.getContext();
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setTag(ROW_TAG);
        row.setClickable(true);
        row.setFocusable(true);
        row.setBackground(settings.getBackground());
        row.setPadding(settings.getPaddingLeft(), settings.getPaddingTop(), settings.getPaddingRight(),
                settings.getPaddingBottom());

        ViewGroup.LayoutParams params = settings.getLayoutParams();
        row.setLayoutParams(params != null
                ? new LinearLayout.LayoutParams(params.width, params.height)
                : new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT));

        List<ImageView> images = images(settings);
        if (!images.isEmpty()) row.addView(icon(context, images.get(0)));

        int textId = 0;
        TextView template = null;
        for (TextView candidate : texts(settings)) {
            if (candidate.getId() == 0 || candidate.getId() == View.NO_ID) {
                template = candidate;
                break;
            }
            if (template == null) template = candidate;
        }
        TextView label = new TextView(context);
        label.setText("Loki Patches");
        label.setSingleLine(true);
        label.setEllipsize(TextUtils.TruncateAt.END);
        if (template != null) {
            label.setTextColor(template.getCurrentTextColor());
            label.setTextSize(TypedValue.COMPLEX_UNIT_PX, template.getTextSize());
            label.setTypeface(template.getTypeface());
            label.setGravity(template.getGravity());
            label.setIncludeFontPadding(template.getIncludeFontPadding());
            ViewGroup.LayoutParams lp = template.getLayoutParams();
            LinearLayout.LayoutParams copy = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT,
                    lp instanceof LinearLayout.LayoutParams ? ((LinearLayout.LayoutParams) lp).weight : 1f);
            copy.setMarginStart(template.getPaddingLeft() == 0 ? dp(context, 12) : 0);
            label.setLayoutParams(copy);
        } else {
            label.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        }
        row.addView(label);

        if (images.size() > 1) row.addView(chevron(context, images.get(images.size() - 1)));

        row.setOnClickListener(view -> open(view.getContext()));
        return row;
    }

    /** MX's own chevron, kept as it is: only its size, tint and padding are copied over. */
    private static ImageView chevron(Context context, ImageView template) {
        ImageView view = new ImageView(context);
        android.graphics.drawable.Drawable arrow = template.getDrawable();
        if (arrow != null) view.setImageDrawable(arrow.mutate());
        view.setImageTintList(template.getImageTintList());
        view.setLayoutParams(paramsOf(template, dp(context, 16)));
        view.setPadding(template.getPaddingLeft(), template.getPaddingTop(), template.getPaddingRight(),
                template.getPaddingBottom());
        return view;
    }

    /** Our puzzle, sized and tinted like the row icon MX draws. */
    private static ImageView icon(Context context, ImageView template) {
        ImageView view = new ImageView(context);
        Resources resources = context.getResources();
        int drawable = resources.getIdentifier(ICON, "drawable", context.getPackageName());
        if (drawable != 0) view.setImageResource(drawable);
        view.setImageTintList(template.getImageTintList());
        view.setLayoutParams(paramsOf(template, dp(context, 24)));
        view.setPadding(template.getPaddingLeft(), template.getPaddingTop(), template.getPaddingRight(),
                template.getPaddingBottom());
        return view;
    }

    private static List<ImageView> images(View root) {
        List<ImageView> found = new ArrayList<>();
        collect(root, ImageView.class, found);
        return found;
    }

    private static List<TextView> texts(View root) {
        List<TextView> found = new ArrayList<>();
        collect(root, TextView.class, found);
        return found;
    }

    private static <T> void collect(View view, Class<T> type, List<T> into) {
        if (type.isInstance(view) && !(view instanceof ViewGroup)) into.add(type.cast(view));
        if (!(view instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) view;
        for (int index = 0; index < group.getChildCount(); index++) collect(group.getChildAt(index), type, into);
    }

    /** The template's own layout params, margins included - the chevron sits inset from the card edge that way. */
    private static LinearLayout.LayoutParams paramsOf(View template, int fallback) {
        ViewGroup.LayoutParams params = template.getLayoutParams();
        LinearLayout.LayoutParams copy = new LinearLayout.LayoutParams(
                params != null && params.width > 0 ? params.width : fallback,
                params != null && params.height > 0 ? params.height : fallback);
        if (params instanceof ViewGroup.MarginLayoutParams) {
            ViewGroup.MarginLayoutParams margins = (ViewGroup.MarginLayoutParams) params;
            copy.setMargins(margins.leftMargin, margins.topMargin, margins.rightMargin, margins.bottomMargin);
        }
        if (params instanceof LinearLayout.LayoutParams) {
            LinearLayout.LayoutParams source = (LinearLayout.LayoutParams) params;
            copy.gravity = source.gravity;
            copy.weight = source.weight;
        }
        return copy;
    }

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    private static void open(Context context) {
        Intent intent = new Intent();
        intent.setClassName(context, MenuActivity.class.getName());
        context.startActivity(intent);
    }
}
