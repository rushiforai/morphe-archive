package app.zonghome.extension;

import android.app.Activity;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.WeakHashMap;

/** Independent visual-only controls for the second cleanup pass. */
public final class FurtherCleanup {
    private FurtherCleanup() {}
    private static final WeakHashMap<View, State> STATES = new WeakHashMap<>();
    private static final int MYOB = 8, BACHAT = 16, ZONG4U = 32;
    private static final int SPACING = 512, MORE = 1024, ZPLAY = 2048;
    private static final int CITY_OFFERS = 4096, CHATBOT = 8192;
    private static final String[][] GROUPS = {
        {"z_wallet_view"},
        {"clStepCount", "fragment_step_counter"},
        {"layoutWeatherWaly", "imgWeatherExpend"},
        {"tv_myob", "iv_myob", "view_purple"},
        {"tv_bachat_bazar", "iv_bachat_bazar", "viewBachatBazar"},
        {"tvZong4U", "ivZong4U", "viewZong4U"},
        {"tvActiveInternetOffers", "tvActiveVoiceOffers", "tvActiveSmsOffers"},
        {"cvBanner"},
        {"tvBanner", "layoutAdaptiveParentAd"},
        {}, // 512: spacing uses layout parameters rather than hiding views.
        {}, // 1024: More is a menu item.
        {}, // 2048: Z Play is a menu item.
        {"card_regional_offers"},
        {"ivChatbot", "ivChatbotAvatar", "chatbotOverlay", "clChatView", "chatView"},
        {"includeBanner", "adParentLayout", "cvBanner"},
        {"btnRecharge"},
        {"cvBanner", "tvBanner", "layoutAdaptiveParentAd"},
        {} // 131072: drawer items are framework MenuItems.
    };
    private static final String[][] SHORTCUTS = {
        {"tv_myob", "iv_myob", "view_purple"},
        {"tv_bachat_bazar", "iv_bachat_bazar", "viewBachatBazar"},
        {"tvZong4U", "ivZong4U", "viewZong4U"}
    };

    public static void hideBundlePromotions(View v) { install(v, 16384); }
    public static void hideHomeRecharge(View v) { install(v, 32768); }
    public static void hideOnlinePromotions(View v) { install(v, 65536); }
    public static void hideDrawerExtras(Activity a) { install(a.getWindow().getDecorView(), 131072); }
    public static void hideWallet(View v) { install(v, 1); }
    public static void hideSteps(View v) { install(v, 2); }
    public static void hideWeather(View v) { install(v, 4); }
    public static void hideMyob(View v) { install(v, MYOB); }
    public static void hideBachat(View v) { install(v, BACHAT); }
    public static void hideZong4u(View v) { install(v, ZONG4U); }
    public static void hideOfferCounts(View v) { install(v, 64); }
    public static void hideUsageBanner(View v) { install(v, 128); }
    public static void hideUsagePromotions(View v) { install(v, 256); }
    public static void spaceHomeSections(View v) { install(v, SPACING); }
    public static void hideMore(Activity a) { install(a.getWindow().getDecorView(), MORE); }
    public static void hideZPlay(Activity a) { install(a.getWindow().getDecorView(), ZPLAY); }
    public static void hideCityOffers(View v) { install(v, CITY_OFFERS); }
    public static void hideChatbot(Activity a) { install(a.getWindow().getDecorView(), CHATBOT); }

    private static View find(View root, String name) {
        int id = root.getResources().getIdentifier(name, "id", "com.zong.customercare");
        return id == 0 ? null : root.findViewById(id);
    }

    private static void install(View root, int flag) {
        if (root == null) return;
        State state = STATES.get(root);
        if (state == null) {
            state = new State(root);
            STATES.put(root, state);
            root.addOnAttachStateChangeListener(state);
            if (root.isAttachedToWindow()) state.onViewAttachedToWindow(root);
        }
        state.addGroup(root, flag);
        state.apply(root);
    }

    // Pure selection logic is also tested without an Android device.
    static int[] visibleShortcuts(int mask) {
        int count = 0;
        for (int i = 0; i < 3; i++) if ((mask & (MYOB << i)) == 0) count++;
        int[] result = new int[count];
        for (int i = 0, j = 0; i < 3; i++) if ((mask & (MYOB << i)) == 0) result[j++] = i;
        return result;
    }

    private static final class State implements ViewTreeObserver.OnPreDrawListener,
            View.OnAttachStateChangeListener {
        private final WeakReference<View> root;
        private final ArrayList<Integer> ids = new ArrayList<>();
        private int mask;
        private ViewTreeObserver observer;

        State(View v) { root = new WeakReference<>(v); }

        void addGroup(View root, int flag) {
            if ((mask & flag) != 0) return;
            mask |= flag;
            for (int i = 0; i < GROUPS.length; i++) {
                if ((flag & (1 << i)) == 0) continue;
                for (String name : GROUPS[i]) {
                    int id = root.getResources().getIdentifier(name, "id", "com.zong.customercare");
                    if (id != 0 && !ids.contains(id)) ids.add(id);
                }
            }
        }

        boolean apply(View root) {
            boolean changed = false;
            View rechargeAnchor = (mask & 32768) != 0 ? find(root, "btnRecharge") : null;
            for (int id : ids) {
                View v = root.findViewById(id);
                // Preserve the invisible Recharge anchor that supplies btnLoan's width.
                int visibility = v == rechargeAnchor ? View.INVISIBLE : View.GONE;
                if (v != null && v.getVisibility() != visibility) {
                    v.setVisibility(visibility);
                    changed = true;
                }
            }
            if ((mask & (MYOB | BACHAT | ZONG4U)) != 0) changed |= reflowShortcuts(root, mask);
            if ((mask & SPACING) != 0) {
                changed |= ensureTopGap(find(root, "cardTray"), root, 24);
                changed |= ensureTopGap(find(root, "card_regional_offers"), root, 24);
            }
            if ((mask & (MORE | ZPLAY)) != 0) changed |= hideMenuItems(root, mask);
            if ((mask & 131072) != 0) changed |= hideDrawerExtrasMenu(root);
            return changed;
        }

        @Override public boolean onPreDraw() {
            View v = root.get();
            return v == null || !apply(v);
        }
        @Override public void onViewAttachedToWindow(View v) {
            detach();
            observer = v.getViewTreeObserver();
            if (observer.isAlive()) observer.addOnPreDrawListener(this);
            apply(v);
        }
        @Override public void onViewDetachedFromWindow(View v) { detach(); }
        private void detach() {
            if (observer != null && observer.isAlive()) observer.removeOnPreDrawListener(this);
            observer = null;
        }
    }

    private static boolean ensureTopGap(View v, View root, int dp) {
        if (v == null || !(v.getLayoutParams() instanceof ViewGroup.MarginLayoutParams)) return false;
        ViewGroup.MarginLayoutParams params = (ViewGroup.MarginLayoutParams) v.getLayoutParams();
        int minimum = Math.round(dp * root.getResources().getDisplayMetrics().density);
        if (params.topMargin >= minimum) return false;
        params.topMargin = minimum;
        v.setLayoutParams(params);
        return true;
    }

    private static boolean hideMenuItems(View root, int mask) {
        View nav = find(root, "bottomNav");
        if (nav == null) return false;
        // Only the framework Menu API is referenced. Material's parent class is obfuscated.
        final Menu menu;
        try {
            java.lang.reflect.Method getter;
            try {
                getter = nav.getClass().getMethod("getMenu");
            } catch (NoSuchMethodException renamed) {
                getter = null;
                // R8 can rename Material's API; identify the getter by its framework type.
                for (java.lang.reflect.Method candidate : nav.getClass().getMethods()) {
                    if (candidate.getParameterTypes().length == 0 &&
                            Menu.class.isAssignableFrom(candidate.getReturnType())) {
                        getter = candidate;
                        break;
                    }
                }
                if (getter == null) return false;
            }
            Object value = getter.invoke(nav);
            if (!(value instanceof Menu)) return false;
            menu = (Menu) value;
        } catch (ReflectiveOperationException | SecurityException ignored) {
            return false;
        }
        boolean changed = false;
        String[] names = {"fragMore", "fragZClub"};
        int[] flags = {MORE, ZPLAY};
        for (int i = 0; i < names.length; i++) {
            if ((mask & flags[i]) == 0) continue;
            int id = root.getResources().getIdentifier(names[i], "id", "com.zong.customercare");
            MenuItem item = id == 0 ? null : menu.findItem(id);
            if (item != null && item.isVisible()) {
                item.setVisible(false);
                changed = true;
            }
        }
        return changed;
    }

    private static boolean hideDrawerExtrasMenu(View root) {
        View nav=find(root,"nav_view");if(nav==null)return false;
        Menu menu=null;
        try {
            for(java.lang.reflect.Method method:nav.getClass().getMethods()) {
                if(method.getParameterTypes().length==0 && Menu.class.isAssignableFrom(method.getReturnType())) {
                    Object result=method.invoke(nav);if(result instanceof Menu){menu=(Menu)result;break;}
                }
            }
        }catch(ReflectiveOperationException | SecurityException ignored){return false;}
        if(menu==null)return false;boolean changed=false;
        for(String name:new String[]{"pressRelease","fragFindUs","fragContactUs","fragvideotut","fragFaq","fragFeedback"}) {
            int id=root.getResources().getIdentifier(name,"id","com.zong.customercare");
            MenuItem item=id==0?null:menu.findItem(id);
            if(item!=null && item.isVisible()){item.setVisible(false);changed=true;}
        }
        return changed;
    }
    private static boolean reflowShortcuts(View root, int mask) {
        View card = find(root, "card_view_myob");
        if (card == null) return false;
        int[] visible = visibleShortcuts(mask);
        if (visible.length == 0) {
            if (card.getVisibility() != View.GONE) { card.setVisibility(View.GONE); return true; }
            return false;
        }
        View first = find(root, "tv_myob");
        if (first == null || !(first.getParent() instanceof View)) return false;
        View host = (View) first.getParent();
        int width = host.getWidth(), height = host.getHeight();
        if (width <= 0 || height <= 0 || card.getVisibility() != View.VISIBLE) return false;
        Drawable background = host.getBackground();
        int rowMask = mask & (MYOB | BACHAT | ZONG4U);
        if (!(background instanceof ShortcutBackground) || ((ShortcutBackground) background).mask != rowMask)
            host.setBackground(new ShortcutBackground(rowMask));
        float density = root.getResources().getDisplayMetrics().density;
        int pad = Math.round(8 * density), gap = Math.round(3 * density);
        for (int i = 0; i < visible.length; i++) {
            String[] names = SHORTCUTS[visible[i]];
            View label = find(root, names[0]), icon = find(root, names[1]), hit = find(root, names[2]);
            int left = i * width / visible.length, right = (i + 1) * width / visible.length;
            int iconSize = Math.min(Math.round(24 * density), Math.max(1, (right - left) / 4));
            int textWidth = Math.max(1, right - left - 2 * pad - iconSize - gap);
            if (label != null) {
                label.measure(View.MeasureSpec.makeMeasureSpec(textWidth, View.MeasureSpec.AT_MOST),
                        View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.AT_MOST));
                int start = left + Math.max(pad, (right - left - label.getMeasuredWidth() - gap - iconSize) / 2);
                int top = (height - label.getMeasuredHeight()) / 2;
                frame(label, start, top, start + label.getMeasuredWidth(), top + label.getMeasuredHeight());
                if (icon != null) {
                    icon.measure(View.MeasureSpec.makeMeasureSpec(iconSize, View.MeasureSpec.EXACTLY),
                            View.MeasureSpec.makeMeasureSpec(iconSize, View.MeasureSpec.EXACTLY));
                    int x = start + label.getMeasuredWidth() + gap, y = (height - iconSize) / 2;
                    frame(icon, x, y, x + iconSize, y + iconSize);
                }
            }
            // Retain original views/listeners; only their clickable bounds change.
            if (hit != null) frame(hit, left, 0, right, height);
        }
        return false;
    }

    private static void frame(View v, int l, int t, int r, int b) {
        if (v.getLeft() != l || v.getTop() != t || v.getRight() != r || v.getBottom() != b) v.layout(l, t, r, b);
    }

    /** Same source-vector colors/radius proportions, reflowed to selected shortcuts. */
    private static final class ShortcutBackground extends Drawable {
        final int mask;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();
        private int alpha = 255;
        private static final int[] COLORS = {0xff662d91, 0xffed0181, 0xfffbb040};
        ShortcutBackground(int mask) { this.mask = mask; }
        @Override public void draw(Canvas canvas) {
            int[] visible = visibleShortcuts(mask);
            if (visible.length == 0) return;
            RectF rect = new RectF(getBounds());
            float w = rect.width(), h = rect.height(), slope = h * 32.5f / 66;
            float radius = h * 19 / 66;
            int save = canvas.save();
            path.reset(); path.addRoundRect(rect, radius, radius, Path.Direction.CW); canvas.clipPath(path);
            for (int i = 0; i < visible.length; i++) {
                float l = rect.left + i * w / visible.length, r = rect.left + (i + 1) * w / visible.length;
                float lt = i == 0 ? l : l - slope / 2, lb = i == 0 ? l : l + slope / 2;
                float rt = i == visible.length - 1 ? r : r - slope / 2;
                float rb = i == visible.length - 1 ? r : r + slope / 2;
                path.reset(); path.moveTo(lt, rect.top); path.lineTo(rt, rect.top);
                path.lineTo(rb, rect.bottom); path.lineTo(lb, rect.bottom); path.close();
                paint.setStyle(Paint.Style.FILL); paint.setColor(COLORS[visible[i]]); paint.setAlpha(alpha);
                canvas.drawPath(path, paint);
            }
            paint.setColor(0xffffffff); paint.setAlpha(alpha); paint.setStrokeWidth(h * 3.5f / 66);
            for (int i = 1; i < visible.length; i++) {
                float x = rect.left + i * w / visible.length;
                canvas.drawLine(x - slope / 2, rect.top, x + slope / 2, rect.bottom, paint);
            }
            canvas.restoreToCount(save);
        }
        @Override public void setAlpha(int value) { alpha = value; invalidateSelf(); }
        @Override public void setColorFilter(ColorFilter filter) { paint.setColorFilter(filter); invalidateSelf(); }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }
}
