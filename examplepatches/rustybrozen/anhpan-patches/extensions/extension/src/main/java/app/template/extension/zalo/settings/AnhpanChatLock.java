package app.template.extension.zalo.settings;

import android.content.Context;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import app.template.extension.zalo.ui.ZaloUi;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

public final class AnhpanChatLock {
    private static final String TAG = "AnhpanChatLock";
    public static final int MENU_ITEM_ID = 0x414E4850;
    public static final int HIGHLIGHT_ITEM_ID = 0x414E4851;
    public static final int PREVIEW_ITEM_ID = 0x414E4852;
    public static final int AVATAR_ITEM_ID = 0x414E4853;
    public static final int RENAME_ITEM_ID = 0x414E4854;
    private static String pendingConvId;
    private static boolean activeConvLocked;
    private static int pendingActionResId;
    private static Field chatRowAvatarFlagField;
    private static Field chatRowNameLayoutField;

    private AnhpanChatLock() { }

    public static void setPendingConvId(String convId) {
        pendingConvId = convId;
    }

    public static String getMenuTitle(Context context, String convId) {
        return AnhpanPrefs.isChatLocked(context, convId) ? "Disable Read-only" : "Enable Read-only";
    }

    private static Method findMethod(Class<?> cls, String name, Class<?>... params) throws NoSuchMethodException {
        for (Class<?> cur = cls; cur != null; cur = cur.getSuperclass()) {
            try {
                Method m = cur.getDeclaredMethod(name, params);
                m.setAccessible(true);
                return m;
            } catch (NoSuchMethodException ignored) { }
        }
        throw new NoSuchMethodException(cls.getName() + "." + name);
    }

    private static Field findField(Class<?> cls, String name) throws NoSuchFieldException {
        for (Class<?> cur = cls; cur != null; cur = cur.getSuperclass()) {
            try {
                Field f = cur.getDeclaredField(name);
                f.setAccessible(true);
                return f;
            } catch (NoSuchFieldException ignored) { }
        }
        throw new NoSuchFieldException(cls.getName() + "." + name);
    }

    public static void captureConvId(Object pupVar) {
        if (pupVar == null) return;
        try {
            pendingConvId = (String) findMethod(pupVar.getClass(), "e").invoke(pupVar);
        } catch (Throwable t) {
            Log.e(TAG, "captureConvId failed", t);
        }
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    public static void addLockMenuItem(java.util.List list, Object menuView) {
        String convId = pendingConvId;
        if (list == null || menuView == null || convId == null) return;
        try {
            Context context = (Context) findMethod(menuView.getClass(), "O5").invoke(menuView);
            if (context == null) return;
            ClassLoader cl = menuView.getClass().getClassLoader();
            Class<?> itemCls = cl.loadClass("l7j");
            Class<?> typeCls = cl.loadClass("o7j");
            Object normalType = Enum.valueOf((Class<Enum>) typeCls, "NORMAL");
            Constructor<?> ctor = itemCls.getDeclaredConstructor(
                int.class,
                android.graphics.drawable.Drawable.class,
                String.class,
                boolean.class,
                typeCls,
                int.class
            );
            ctor.setAccessible(true);
            if (AnhpanPrefs.isReadOnlyEnabled(context)) {
                Object lockItem = ctor.newInstance(MENU_ITEM_ID, null, getMenuTitle(context, convId), true, normalType, 0);
                list.add(lockItem);
            }
            if (AnhpanPrefs.isChatHighlightFeatureEnabled(context)) {
                boolean overridden = AnhpanPrefs.isReadOnlyEnabled(context)
                    && AnhpanPrefs.isReadOnlyNoHighlight(context)
                    && AnhpanPrefs.isChatLocked(context, convId);
                String hlTitle = overridden
                    ? "Disable chat highlight (Read-only)"
                    : (AnhpanPrefs.isChatHighlightDisabled(context, convId) ? "Enable chat highlight" : "Disable chat highlight");
                Object hlItem = ctor.newInstance(HIGHLIGHT_ITEM_ID, null, hlTitle, !overridden, normalType, 0);
                list.add(hlItem);
            }
            String previewTitle = AnhpanPrefs.isChatPreviewHidden(context, convId) ? "Show preview" : "Hide preview";
            list.add(ctor.newInstance(PREVIEW_ITEM_ID, null, previewTitle, true, normalType, 0));
            String avatarTitle = AnhpanPrefs.isChatAvatarHidden(context, convId) ? "Show avatar" : "Hide avatar";
            list.add(ctor.newInstance(AVATAR_ITEM_ID, null, avatarTitle, true, normalType, 0));
            list.add(ctor.newInstance(RENAME_ITEM_ID, null, "Rename (Client)", true, normalType, 0));
        } catch (Throwable t) {
            Log.e(TAG, "addLockMenuItem failed", t);
        }
    }

    public static void wrapListener(Object ej1, Object menuView) {
        if (ej1 == null || menuView == null) return;
        try {
            Context context = (Context) findMethod(menuView.getClass(), "O5").invoke(menuView);
            if (context == null || !AnhpanPrefs.isReadOnlyEnabled(context)) return;
            Field hField = findField(ej1.getClass(), "h");
            Object original = hField.get(ej1);
            if (original == null) return;
            Class<?>[] interfaces = original.getClass().getInterfaces();
            if (interfaces.length == 0) {
                Log.e(TAG, "original listener has no interfaces: " + original.getClass().getName());
                return;
            }

            Object proxy = Proxy.newProxyInstance(
                original.getClass().getClassLoader(),
                interfaces,
                (p, method, args) -> {
                    if (args != null) {
                        for (Object arg : args) {
                            if (arg == null) continue;
                            try {
                                Object idVal = null;
                                if ("l7j".equals(arg.getClass().getName())) {
                                    idVal = findMethod(arg.getClass(), "getId").invoke(arg);
                                } else if (arg instanceof Integer) {
                                    idVal = arg;
                                }
                                if (idVal instanceof Integer && ((Integer) idVal) == MENU_ITEM_ID) {
                                    String convId = pendingConvId;
                                    boolean locked = AnhpanPrefs.toggleChatLock(context, convId);
                                    Toast.makeText(
                                        context,
                                        locked ? "Read-only enabled" : "Read-only disabled",
                                        Toast.LENGTH_SHORT
                                    ).show();
                                    try {
                                        findMethod(menuView.getClass(), "d7").invoke(menuView);
                                    } catch (Throwable ignored) { }
                                    return null;
                                }
                                if (idVal instanceof Integer && ((Integer) idVal) == PREVIEW_ITEM_ID) {
                                    String convId = pendingConvId;
                                    boolean hidden = AnhpanPrefs.toggleChatPreviewHidden(context, convId);
                                    Toast.makeText(context, hidden ? "Preview hidden" : "Preview shown", Toast.LENGTH_SHORT).show();
                                    try { findMethod(menuView.getClass(), "d7").invoke(menuView); } catch (Throwable ignored) { }
                                    return null;
                                }
                                if (idVal instanceof Integer && ((Integer) idVal) == AVATAR_ITEM_ID) {
                                    String convId = pendingConvId;
                                    boolean hidden = AnhpanPrefs.toggleChatAvatarHidden(context, convId);
                                    Toast.makeText(context, hidden ? "Avatar hidden" : "Avatar shown", Toast.LENGTH_SHORT).show();
                                    try { findMethod(menuView.getClass(), "d7").invoke(menuView); } catch (Throwable ignored) { }
                                    return null;
                                }
                                if (idVal instanceof Integer && ((Integer) idVal) == RENAME_ITEM_ID) {
                                    String convId = pendingConvId;
                                    Log.d("AnhpanDebug", "RENAME_ITEM_ID clicked convId=" + convId + " ctx=" + context.getClass().getName());
                                    try { findMethod(menuView.getClass(), "d7").invoke(menuView); } catch (Throwable ignored) { }
                                    new android.os.Handler(android.os.Looper.getMainLooper()).postDelayed(() -> {
                                        try {
                                            android.app.AlertDialog.Builder b = new android.app.AlertDialog.Builder(
                                                context, android.R.style.Theme_DeviceDefault_Dialog_Alert
                                            );
                                            b.setTitle("Rename (Client)");
                                            final android.widget.EditText input = new android.widget.EditText(context);
                                            String cur = AnhpanPrefs.getCustomName(context, convId);
                                            if (cur != null) input.setText(cur);
                                            input.setHint("Leave empty to reset");
                                            b.setView(input);
                                            b.setPositiveButton("Save", (d, w) -> {
                                                AnhpanPrefs.setCustomName(context, convId, input.getText().toString());
                                                Toast.makeText(context, "Saved: " + input.getText().toString(), Toast.LENGTH_SHORT).show();
                                            });
                                            b.setNegativeButton("Cancel", null);
                                            b.show();
                                        } catch (Throwable t) {
                                            Log.e("AnhpanDebug", "Rename dialog failed", t);
                                            Toast.makeText(context, "Rename error: " + t.getMessage(), Toast.LENGTH_LONG).show();
                                        }
                                    }, 150);
                                    return null;
                                }
                                if (idVal instanceof Integer && ((Integer) idVal) == HIGHLIGHT_ITEM_ID) {
                                    String convId = pendingConvId;
                                    boolean overridden = AnhpanPrefs.isReadOnlyEnabled(context)
                                        && AnhpanPrefs.isReadOnlyNoHighlight(context)
                                        && AnhpanPrefs.isChatLocked(context, convId);
                                    if (!overridden) {
                                        boolean disabled = AnhpanPrefs.toggleChatHighlightDisabled(context, convId);
                                        Toast.makeText(
                                            context,
                                            disabled ? "Chat highlight disabled" : "Chat highlight enabled",
                                            Toast.LENGTH_SHORT
                                        ).show();
                                    }
                                    try {
                                        findMethod(menuView.getClass(), "d7").invoke(menuView);
                                    } catch (Throwable ignored) { }
                                    return null;
                                }
                            } catch (Throwable t) {
                                Log.e(TAG, "proxy click error", t);
                            }
                        }
                    }
                    return method.invoke(original, args);
                }
            );
            hField.set(ej1, proxy);
        } catch (Throwable t) {
            Log.e(TAG, "wrapListener failed", t);
        }
    }

    public static void applyInputBar(View inputBar, String convId) {
        if (inputBar == null || convId == null) {
            activeConvLocked = false;
            return;
        }
        Context context = inputBar.getContext();
        activeConvLocked = AnhpanPrefs.isReadOnlyEnabled(context) && AnhpanPrefs.isChatLocked(context, convId);
        if (!activeConvLocked) return;
        if (!(inputBar instanceof ViewGroup)) {
            inputBar.setVisibility(View.GONE);
            return;
        }
        ViewGroup group = (ViewGroup) inputBar;
        for (int i = 0; i < group.getChildCount(); i++) {
            group.getChildAt(i).setVisibility(View.GONE);
        }
        boolean dark = ZaloUi.isDarkMode(context, inputBar);
        int bg = dark ? 0xFF1F2229 : 0xFFF4F5F7;
        int border = dark ? 0xFF2D313B : 0xFFE5E7EB;
        int textColor = dark ? 0xFFB0B5C0 : 0xFF5A606D;
        int iconColor = 0xFF4D8EFF;

        LinearLayout banner = new LinearLayout(context);
        banner.setTag("anhpan-locked-banner");
        banner.setOrientation(LinearLayout.HORIZONTAL);
        banner.setGravity(Gravity.CENTER);
        banner.setBackgroundColor(bg);
        banner.setClickable(true);
        banner.setFocusable(true);
        int padV = dp(context, 14);
        int padH = dp(context, 16);
        banner.setPadding(padH, padV, padH, padV);

        View divider = new View(context);
        divider.setBackgroundColor(border);

        TextView icon = new TextView(context);
        icon.setText("i");
        icon.setTextColor(iconColor);
        icon.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        icon.setTypeface(Typeface.SERIF, Typeface.BOLD);
        icon.setGravity(Gravity.CENTER);
        GradientDrawable circle = new GradientDrawable();
        circle.setShape(GradientDrawable.OVAL);
        circle.setStroke(dp(context, 1.5f), iconColor);
        icon.setBackground(circle);
        int iconSize = dp(context, 18);
        LinearLayout.LayoutParams iconLp = new LinearLayout.LayoutParams(iconSize, iconSize);
        iconLp.setMarginEnd(dp(context, 8));
        banner.addView(icon, iconLp);

        TextView label = new TextView(context);
        label.setText("Read Only");
        label.setTextColor(textColor);
        label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        banner.addView(label);

        LinearLayout wrapper = new LinearLayout(context);
        wrapper.setOrientation(LinearLayout.VERTICAL);
        wrapper.addView(divider, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 1)));
        wrapper.addView(banner, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        group.addView(wrapper, new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
    }

    private static int dp(Context context, float value) {
        return Math.round(TypedValue.applyDimension(
            TypedValue.COMPLEX_UNIT_DIP,
            value,
            context.getResources().getDisplayMetrics()
        ));
    }

    public static void applyReactionPicker(View picker) {
        if (picker != null && activeConvLocked) {
            picker.setVisibility(View.GONE);
        }
    }

    public static boolean isActiveConvLocked() {
        return activeConvLocked;
    }

    public static boolean shouldHideQuickHeart(View view) {
        return activeConvLocked || (view != null && AnhpanPrefs.isQuickHeartHidden(view.getContext()));
    }

    public static boolean shouldHideQuickShare(View view) {
        return view != null && AnhpanPrefs.isQuickShareHidden(view.getContext());
    }

    public static void captureActionResId(int resId) {
        pendingActionResId = resId;
    }

    public static void applyCapturedActionBarButton(View button) {
        applyActionBarButton(button, pendingActionResId);
    }

    public static void applyActionBarButton(View button, int resId) {
        if (!activeConvLocked || button == null || resId == 0) return;
        try {
            String name = button.getResources().getResourceEntryName(resId).toLowerCase(java.util.Locale.ROOT);
            if (name.contains("call")
                || name.contains("video")
                || name.contains("add")
                || name.contains("member")
                || name.contains("invite")
                || name.contains("user_plus")
                || name.contains("list")
                || name.contains("menu")) {
                button.setVisibility(View.GONE);
            }
        } catch (Throwable ignored) { }
        button.post(() -> lockChatActionBarHeader(button));
    }

    private static void lockChatActionBarHeader(View button) {
        if (!activeConvLocked || button == null) return;
        android.view.ViewParent cur = button.getParent();
        while (cur instanceof View) {
            View v = (View) cur;
            if (v.getClass().getName().endsWith("ZdsActionBar")) {
                try {
                    Object middle = findMethod(v.getClass(), "getMiddleContainer").invoke(v);
                    if (middle instanceof View) {
                        blockTouchTree((View) middle);
                    }
                } catch (Throwable ignored) { }
                break;
            }
            cur = cur.getParent();
        }
    }

    public static void hideUnreadBadge(View moduleView) {
        if (moduleView == null) return;
        try {
            Object badge = findMethod(moduleView.getClass(), "getMUnreadBadge").invoke(moduleView);
            if (badge != null) {
                findMethod(badge.getClass(), "o0", int.class).invoke(badge, View.GONE);
            }
        } catch (Throwable ignored) { }
    }

    public static boolean shouldDisableChatHighlight(Context context, Object pupVar) {
        if (context == null || pupVar == null) return false;
        try {
            String convId = (String) findMethod(pupVar.getClass(), "e").invoke(pupVar);
            if (convId == null || convId.isEmpty()) return false;
            if (AnhpanPrefs.isReadOnlyEnabled(context)
                && AnhpanPrefs.isReadOnlyNoHighlight(context)
                && AnhpanPrefs.isChatLocked(context, convId)) {
                return true;
            }
            return AnhpanPrefs.isChatHighlightFeatureEnabled(context)
                && AnhpanPrefs.isChatHighlightDisabled(context, convId);
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static void applyChatRowDraw(View chatRow) {
        if (!activeConvLocked || chatRow == null) return;
        if (!AnhpanPrefs.isReadOnlyHideAvatar(chatRow.getContext())) return;
        try {
            if (chatRowAvatarFlagField == null) {
                chatRowAvatarFlagField = findField(chatRow.getClass(), "N1");
            }
            chatRowAvatarFlagField.setBoolean(chatRow, false);
        } catch (Throwable ignored) { }
    }

    public static void applySenderNameColor(View chatRow) {
        if (!activeConvLocked || chatRow == null) return;
        Context context = chatRow.getContext();
        if (!AnhpanPrefs.isReadOnlyNoColorName(context)) return;
        try {
            if (chatRowNameLayoutField == null) {
                chatRowNameLayoutField = findField(chatRow.getClass(), "U1");
            }
            Object layoutObj = chatRowNameLayoutField.get(chatRow);
            if (layoutObj instanceof android.text.StaticLayout) {
                boolean dark = ZaloUi.isDarkMode(context, chatRow);
                ((android.text.StaticLayout) layoutObj).getPaint().setColor(dark ? 0xFFB0B5C0 : 0xFF5A606D);
            }
        } catch (Throwable ignored) { }
    }

    public static void applyMainTabMenu(Object mainTabView) {
        if (mainTabView == null) return;
        try {
            Context context = (Context) findMethod(mainTabView.getClass(), "O5").invoke(mainTabView);
            if (context == null) return;
            Runnable apply = () -> applyMainTabMenuOnce(mainTabView, context);
            apply.run();
            Object rootObj = findField(mainTabView.getClass(), "s1").get(mainTabView);
            if (rootObj instanceof View) {
                View root = (View) rootObj;
                if (!"anhpan-maintab-watched".equals(root.getTag())) {
                    root.setTag("anhpan-maintab-watched");
                    root.getViewTreeObserver().addOnGlobalLayoutListener(apply::run);
                }
            }
        } catch (Throwable ignored) { }
    }

    private static void applyMainTabMenuOnce(Object mainTabView, Context context) {
        if (AnhpanPrefs.isSearchBarHidden(context)) {
            try {
                Object searchBar = findField(mainTabView.getClass(), "D1").get(mainTabView);
                if (searchBar instanceof View) {
                    View sb = (View) searchBar;
                    sb.setVisibility(View.GONE);
                    if (sb.getParent() instanceof ViewGroup) {
                        ViewGroup barContainer = (ViewGroup) sb.getParent();
                        barContainer.setClickable(false);
                        for (int i = 0; i < barContainer.getChildCount(); i++) {
                            View child = barContainer.getChildAt(i);
                            if (child == sb || child instanceof android.widget.ImageView || child instanceof TextView) {
                                child.setVisibility(View.GONE);
                            }
                        }
                    }
                }
            } catch (Throwable ignored) { }
        }
        if (AnhpanPrefs.isPlusButtonHidden(context)) {
            hideMenuFieldByName(mainTabView, "q2");
        }
        if (AnhpanPrefs.isQrButtonHidden(context)) {
            hideMenuFieldByName(mainTabView, "n2");
            hideMenuByIdName(mainTabView, context, "action_bar_qrcode");
        }
    }

    private static void hideMenuFieldByName(Object target, String fieldName) {
        try {
            Object v = findField(target.getClass(), fieldName).get(target);
            if (v instanceof View) ((View) v).setVisibility(View.GONE);
        } catch (Throwable ignored) { }
    }

    private static void hideMenuByIdName(Object mainTabView, Context context, String idName) {
        int id = context.getResources().getIdentifier(idName, "id", context.getPackageName());
        if (id == 0) return;
        for (String fn : new String[] { "k2", "l2", "m2", "n2", "o2", "p2", "q2" }) {
            try {
                Object v = findField(mainTabView.getClass(), fn).get(mainTabView);
                if (v instanceof View && ((View) v).getId() == id) {
                    ((View) v).setVisibility(View.GONE);
                }
            } catch (Throwable ignored) { }
        }
    }

    @SuppressWarnings("unchecked")
    public static void filterHorizontalItems(Object a04Var) {
        if (!activeConvLocked || a04Var == null) return;
        try {
            Field bField = findField(a04Var.getClass(), "b");
            Object listObj = bField.get(a04Var);
            if (listObj instanceof java.util.List) {
                java.util.List list = (java.util.List) listObj;
                java.util.Iterator it = list.iterator();
                while (it.hasNext()) {
                    Object item = it.next();
                    String title = extractTitle(item);
                    if (title != null) {
                        String lower = title.toLowerCase(java.util.Locale.ROOT);
                        if (lower.contains("add member")
                            || lower.contains("thêm thành viên")
                            || lower.contains("thêm bạn")) {
                            it.remove();
                        }
                    }
                }
            }
        } catch (Throwable ignored) { }
    }

    public static void tagSettingItem(View view, Object a04Var) {
        if (view == null) return;
        if (!activeConvLocked || a04Var == null) {
            view.setTag(null);
            return;
        }
        String title = extractTitle(a04Var);
        if (title == null) {
            view.setTag(null);
            return;
        }
        String lower = title.toLowerCase(java.util.Locale.ROOT);
        boolean hide = lower.contains("members")
            || lower.contains("thành viên")
            || lower.contains("group board")
            || lower.contains("bảng tin")
            || lower.contains("group link")
            || lower.contains("link tham gia")
            || lower.contains("organize")
            || lower.contains("phân loại")
            || lower.contains("hide conversation")
            || lower.contains("ẩn trò chuyện")
            || lower.contains("report")
            || lower.contains("báo cáo")
            || lower.contains("delete conversation")
            || lower.contains("xóa trò chuyện")
            || lower.contains("xoá trò chuyện")
            || lower.contains("leave group")
            || lower.contains("rời nhóm");
        view.setTag(hide ? "anhpan-hide" : null);
    }

    public static void applySettingHideTag(View view) {
        if (view == null) return;
        if ("anhpan-hide".equals(view.getTag())) {
            view.setVisibility(View.GONE);
            ViewGroup.LayoutParams lp = view.getLayoutParams();
            if (lp != null && lp.height != 0) {
                lp.height = 0;
                view.setLayoutParams(lp);
            }
        } else {
            view.setVisibility(View.VISIBLE);
            ViewGroup.LayoutParams lp = view.getLayoutParams();
            if (lp != null && lp.height == 0) {
                lp.height = ViewGroup.LayoutParams.WRAP_CONTENT;
                view.setLayoutParams(lp);
            }
        }
    }

    private static String extractTitle(Object item) {
        if (item == null) return null;
        for (String fieldName : new String[] { "d", "f", "g", "h" }) {
            try {
                Field f = findField(item.getClass(), fieldName);
                Object val = f.get(item);
                if (val instanceof CharSequence) {
                    String s = val.toString();
                    if (!s.isEmpty()) return s;
                }
            } catch (Throwable ignored) { }
        }
        return null;
    }

    public static void applyChatInfoView(View root) {
        if (!activeConvLocked || root == null) return;
        root.post(() -> filterChatInfoTree(root));
        if (root instanceof ViewGroup) {
            root.getViewTreeObserver().addOnGlobalLayoutListener(() -> filterChatInfoTree(root));
        }
    }

    private static void filterChatInfoTree(View view) {
        if (!activeConvLocked || view == null) return;
        String clsName = view.getClass().getName();
        if (clsName.endsWith("ZdsActionBar")) {
            hideActionBarEditButton(view);
        } else if (clsName.contains("ChatHeaderItemModuleView")) {
            blockTouchTree(view);
        } else if (clsName.contains("ChatSettingModuleView") && "anhpan-hide".equals(view.getTag())) {
            view.setVisibility(View.GONE);
            ViewGroup.LayoutParams lp = view.getLayoutParams();
            if (lp != null && lp.height != 0) {
                lp.height = 0;
                view.setLayoutParams(lp);
            }
            return;
        }
        if (view instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) view;
            for (int i = 0; i < vg.getChildCount(); i++) {
                filterChatInfoTree(vg.getChildAt(i));
            }
        }
    }

    private static void hideActionBarEditButton(View actionBar) {
        if (!(actionBar instanceof ViewGroup)) return;
        int[] barLoc = new int[2];
        actionBar.getLocationOnScreen(barLoc);
        int midX = barLoc[0] + actionBar.getWidth() / 2;
        hideRightSideButtons((ViewGroup) actionBar, midX);
    }

    private static void hideRightSideButtons(ViewGroup vg, int midX) {
        for (int i = 0; i < vg.getChildCount(); i++) {
            View child = vg.getChildAt(i);
            if (child instanceof ViewGroup) {
                hideRightSideButtons((ViewGroup) child, midX);
            } else if (child.isClickable() && !(child instanceof TextView)) {
                int[] loc = new int[2];
                child.getLocationOnScreen(loc);
                if (loc[0] >= midX) {
                    child.setVisibility(View.GONE);
                }
            }
        }
    }

    private static void blockTouchTree(View view) {
        view.setClickable(false);
        view.setLongClickable(false);
        view.setOnTouchListener((v, ev) -> true);
        if (view instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) view;
            for (int i = 0; i < vg.getChildCount(); i++) {
                blockTouchTree(vg.getChildAt(i));
            }
        }
    }
}
