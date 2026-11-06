package app.ayufa.extension.simeji;

import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * Adds the "Ayufaパッチ設定" entry to Simeji's settings tab. Called
 * from the patched {@code SettingHomeFragment.initSettingItems} with
 * the fragment's root view.
 *
 * <p>The primary strategy creates a genuine SimejiSettingItemView
 * (the app's own settings-row widget, loaded reflectively) and
 * inserts it right after the "about" item, so the entry is visually
 * indistinguishable from the stock rows: same icon slot, title,
 * arrow and dividers. Fallbacks, in order: repurpose the layout's
 * always-hidden test item, then append a plain row next to a known
 * item, then append to the scroll view's content.
 *
 * <p>The work is posted to the view's message queue: attach() itself
 * is called at the start of initSettingItems, and the fragment goes
 * on to set up the items afterwards, so changes that touch existing
 * items must be applied after that method has completed.
 */
public final class SimejiSettingsEntry {

    /** Id of the always-hidden test item in the settings layout. */
    private static final int TEST_ITEM_ID = 2131364907;
    /** Id of the "about" item, used as an anchor for insertion. */
    private static final int ABOUT_ITEM_ID = 2131364515;
    private static final String ITEM_CLASS = "com.simeji.common.ui.SimejiSettingItemView";
    private static final String NATIVE_TAG = "ayufa_simeji_native_item";
    private static final String ROW_TAG = "ayufa_simeji_settings_row";

    private SimejiSettingsEntry() {
    }

    public static void attach(final View root) {
        if (root == null) {
            return;
        }
        root.post(new Runnable() {
            @Override
            public void run() {
                if (!tryAttach(root)) {
                    // The list may still be settling; retry once.
                    root.postDelayed(new Runnable() {
                        @Override
                        public void run() {
                            tryAttach(root);
                        }
                    }, 600);
                }
            }
        });
    }

    private static boolean tryAttach(View root) {
        try {
            if (insertNativeItem(root)) {
                return true;
            }
            if (repurposeTestItem(root)) {
                return true;
            }
            if (appendNearKnownItem(root)) {
                return true;
            }
            return appendToScrollContent(root);
        } catch (Throwable ignored) {
            // Never crash the host app because of the settings entry.
            return false;
        }
    }

    private static boolean insertNativeItem(View root) {
        View about = root.findViewById(ABOUT_ITEM_ID);
        if (about == null || !(about.getParent() instanceof ViewGroup)) {
            return false;
        }
        ViewGroup parent = (ViewGroup) about.getParent();
        if (parent.findViewWithTag(NATIVE_TAG) != null) {
            return true;
        }
        try {
            Class<?> itemClass = Class.forName(ITEM_CLASS);
            Constructor<?> constructor =
                    itemClass.getConstructor(Context.class, AttributeSet.class);
            final View item = (View) constructor.newInstance(root.getContext(), null);
            item.setTag(NATIVE_TAG);
            itemClass.getMethod("setTitle", String.class)
                    .invoke(item, "Ayufaパッチ設定");
            copyIcon(itemClass, about, item);
            item.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    SimejiSettingsUi.show(view.getContext());
                }
            });
            int index = parent.indexOfChild(about);
            parent.addView(item, index + 1, new ViewGroup.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    /** Best effort: reuse the anchor item's icon for a consistent look. */
    private static void copyIcon(Class<?> itemClass, View from, View to) {
        try {
            Field iconField = itemClass.getDeclaredField("a");
            iconField.setAccessible(true);
            Object iconView = iconField.get(from);
            if (iconView instanceof ImageView) {
                Drawable icon = ((ImageView) iconView).getDrawable();
                if (icon != null) {
                    itemClass.getMethod("setIcon", Drawable.class).invoke(to, icon);
                }
            }
        } catch (Throwable ignored) {
            // No icon: still a native row, just without a glyph.
        }
    }

    private static boolean repurposeTestItem(final View root) {
        View item = root.findViewById(TEST_ITEM_ID);
        if (item == null) {
            return false;
        }
        try {
            Method setTitle = item.getClass().getMethod("setTitle", String.class);
            setTitle.invoke(item, "Ayufaパッチ設定");
        } catch (Throwable ignored) {
            // Without a title the row is useless; keep it hidden.
            return false;
        }
        item.setVisibility(View.VISIBLE);
        item.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                SimejiSettingsUi.show(view.getContext());
            }
        });
        return true;
    }

    private static boolean appendNearKnownItem(View root) {
        View anchor = root.findViewById(ABOUT_ITEM_ID);
        if (anchor == null || !(anchor.getParent() instanceof ViewGroup)) {
            return false;
        }
        ViewGroup parent = (ViewGroup) anchor.getParent();
        if (parent.findViewWithTag(ROW_TAG) != null) {
            return true;
        }
        parent.addView(buildRow(root.getContext()));
        return true;
    }

    private static boolean appendToScrollContent(View root) {
        ScrollView scrollView = findScrollView(root);
        if (scrollView == null || scrollView.getChildCount() == 0) {
            return false;
        }
        View child = scrollView.getChildAt(0);
        if (!(child instanceof ViewGroup)) {
            return false;
        }
        ViewGroup container = (ViewGroup) child;
        if (container.findViewWithTag(ROW_TAG) != null) {
            return true;
        }
        container.addView(buildRow(root.getContext()));
        return true;
    }

    private static View buildRow(final Context context) {
        float density = context.getResources().getDisplayMetrics().density;
        int padH = (int) (16 * density);
        int padV = (int) (14 * density);

        LinearLayout row = new LinearLayout(context);
        row.setTag(ROW_TAG);
        row.setOrientation(LinearLayout.VERTICAL);
        row.setPadding(padH, padV, padH, padV);
        row.setClickable(true);
        row.setBackgroundColor(Color.WHITE);

        TextView title = new TextView(context);
        title.setText("Ayufaパッチ設定");
        title.setTextSize(16);
        title.setTextColor(0xFF333333);
        row.addView(title);

        TextView summary = new TextView(context);
        summary.setText("広告・AIアシスタントなどの表示や、VIP偽装を切り替えます");
        summary.setTextSize(12);
        summary.setTextColor(0xFF999999);
        row.addView(summary);

        row.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                SimejiSettingsUi.show(context);
            }
        });
        return row;
    }

    private static ScrollView findScrollView(View view) {
        if (view instanceof ScrollView) {
            return (ScrollView) view;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                ScrollView found = findScrollView(group.getChildAt(i));
                if (found != null) {
                    return found;
                }
            }
        }
        return null;
    }
}
