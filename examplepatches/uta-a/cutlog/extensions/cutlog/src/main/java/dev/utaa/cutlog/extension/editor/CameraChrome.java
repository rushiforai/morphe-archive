package dev.utaa.cutlog.extension.editor;

import android.content.Context;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import dev.utaa.cutlog.extension.hook.CaptureInterceptor;
import java.util.function.BooleanSupplier;

/**
 * 撮影画面のシャッターの並びに cutlog のボタンを足す。
 *
 * <p>setlog の撮影画面は、シャッター（{@code CameraSmileButton}）の左にフラッシュボタン（50dp）を置き、
 * 画面の大きさに合わせて位置を動かしている。ボタンの位置は「シャッターからフラッシュまでの距離」を
 * 1 単位とした slot で指定する（フラッシュは -1）。レイアウトのたびに合わせ直す。同じ並びに本体のボタンが
 * 見えていて重なるときは、その外側へずらす。
 *
 * <p>ボタンは設定で OFF にされていても追加しておき、表示だけを切り替える。設定を変えたら
 * {@link #refresh(View)} で並びを合わせ直す。
 */
final class CameraChrome {
    private static final String SHUTTER_CLASS = "com.newchat.setlog.feature.camera.CameraSmileButton";

    private CameraChrome() {}

    /** @return 追加した場合 true。シャッターが見つからない、または追加済みなら false。 */
    static boolean place(View cameraRoot, View control, String tag, float slot) {
        return place(cameraRoot, control, tag, slot, () -> true);
    }

    /** @param shown false の間はボタンを隠す（設定で機能が OFF のとき）。 */
    static boolean place(View cameraRoot, View control, String tag, float slot, BooleanSupplier shown) {
        View shutter = find(cameraRoot);
        if (shutter == null || !(shutter.getParent() instanceof FrameLayout)) {
            Log.w(CaptureInterceptor.TAG, "Shutter button not found; skipping " + tag + ".");
            return false;
        }
        FrameLayout parent = (FrameLayout) shutter.getParent();
        if (parent.findViewWithTag(tag) != null) {
            return false;
        }
        Context context = parent.getContext();
        control.setTag(tag);
        int size = Ui.dp(context, 50);
        parent.addView(control, new FrameLayout.LayoutParams(size, size, Gravity.TOP | Gravity.START));
        parent.addOnLayoutChangeListener(
                (v, l, t, r, b, ol, ot, or, ob) -> align(control, shutter, flashOf(parent, shutter), slot, shown));
        return true;
    }

    /** 設定を変えたあと、同じ並びのボタンの表示と位置を合わせ直す。 */
    static void refresh(View control) {
        if (control.getParent() instanceof View) {
            ((View) control.getParent()).requestLayout();
        }
    }

    /** シャッターと同じ親にある、シャッター以外の ImageButton（フラッシュ）。 */
    private static View flashOf(ViewGroup parent, View shutter) {
        for (int i = 0; i < parent.getChildCount(); i++) {
            View child = parent.getChildAt(i);
            if (child != shutter && child instanceof ImageButton) {
                return child;
            }
        }
        return null;
    }

    private static void align(View control, View shutter, View flash, float slot, BooleanSupplier shown) {
        float shutterX = shutter.getLeft() + shutter.getTranslationX() + shutter.getWidth() / 2f;
        float centerY = shutter.getTop() + shutter.getTranslationY() + shutter.getHeight() / 2f;
        float unit = Ui.dp(control.getContext(), 89);
        boolean visible = shown.getAsBoolean();
        if (flash != null && flash.getWidth() > 0) {
            unit = shutterX - (flash.getLeft() + flash.getTranslationX() + flash.getWidth() / 2f);
            centerY = flash.getTop() + flash.getTranslationY() + flash.getHeight() / 2f;
            // setlog 1.3 はフラッシュを GONE にしない（カメラの権限が無いときも INVISIBLE、フラッシュが使えないときは
            // 半透明にするだけ）。今後の版でシャッターの並びごと消すようになった場合に合わせて隠す。
            visible &= flash.getVisibility() != View.GONE;
        }
        // 同じ値を入れ直すと余計なレイアウト要求になるため、変わるときだけ設定する。
        int visibility = visible ? View.VISIBLE : View.GONE;
        if (control.getVisibility() != visibility) {
            control.setVisibility(visibility);
        }
        ViewGroup parent = (ViewGroup) control.getParent();
        // 親は画面の幅いっぱいだが、カメラ映像の枠は内側に約 12dp 入っている。枠より内側に収める。
        int margin = Ui.dp(control.getContext(), 16);
        float centerX = centerX(shutterX, unit, slot, control.getWidth(), parent.getWidth(), margin);
        float[] placed = avoidSetlogControls(parent, control, shutter, centerX, centerY, slot >= 0, margin);
        centerX = placed[0];
        // 縮めるときは setScale を使う（レイアウトをやり直さず、押せる範囲も見た目と一緒に縮む）。
        if (control.getScaleX() != placed[1]) {
            control.setScaleX(placed[1]);
            control.setScaleY(placed[1]);
        }
        control.setTranslationX(centerX - control.getWidth() / 2f);
        control.setTranslationY(centerY - control.getHeight() / 2f);
    }

    /**
     * 同じ並びに見えている本体のボタン（setlog 1.3 (89) のエフェクトボタンなど）と重なるなら、その外側へずらす。
     * 本体のボタンは表示・位置が実行時に変わるため、名前ではなく見えている兄弟 View の位置で判断する。
     *
     * @return {中心の横位置, 縮める比率}
     */
    private static float[] avoidSetlogControls(
            ViewGroup parent, View control, View shutter, float centerX, float centerY, boolean towardEnd, int margin) {
        int count = parent.getChildCount();
        float[] lefts = new float[count];
        float[] rights = new float[count];
        int n = 0;
        for (int i = 0; i < count; i++) {
            View other = parent.getChildAt(i);
            if (other == control || other == shutter || other.getVisibility() != View.VISIBLE || other.getWidth() == 0) {
                continue;
            }
            if (other.getTag() instanceof String && ((String) other.getTag()).startsWith("cutlog-")) {
                continue;
            }
            float top = other.getTop() + other.getTranslationY();
            if (centerY < top || centerY > top + other.getHeight()) {
                continue;
            }
            lefts[n] = other.getLeft() + other.getTranslationX();
            rights[n] = lefts[n] + other.getWidth();
            n++;
        }
        return avoid(centerX, control.getWidth() / 2f, java.util.Arrays.copyOf(lefts, n), java.util.Arrays.copyOf(rights, n),
                towardEnd, Ui.dp(control.getContext(), GAP_DP), margin, parent.getWidth() - margin);
    }

    /** 本体のボタンとの間を空ける幅。 */
    private static final int GAP_DP = 4;
    /** 縮めるときの下限（50dp のボタンを 36dp まで）。 */
    static final float MIN_SCALE = 0.72f;

    /**
     * ボタン（中心 center、半幅 half）が [lefts[i], rights[i]] の範囲と重なるなら、towardEnd に応じてその右か左へ
     * gap を空けてずらす。ずらした先と画面の端（start / end）の間に入りきらなければ {@link #MIN_SCALE} まで縮める。
     * 最後に [start, end] の内側に収める。
     *
     * @return {中心の横位置, 縮める比率}
     */
    static float[] avoid(float center, float half, float[] lefts, float[] rights, boolean towardEnd, float gap,
            float start, float end) {
        float scale = 1f;
        for (int i = 0; i < lefts.length; i++) {
            float scaledHalf = half * scale;
            if (center + scaledHalf <= lefts[i] || center - scaledHalf >= rights[i]) {
                continue;
            }
            float room = towardEnd ? end - (rights[i] + gap) : (lefts[i] - gap) - start;
            scale = Math.max(MIN_SCALE, Math.min(scale, room / (half * 2f)));
            scaledHalf = half * scale;
            center = towardEnd ? rights[i] + gap + scaledHalf : lefts[i] - gap - scaledHalf;
        }
        float scaledHalf = half * scale;
        return new float[] {Math.max(start + scaledHalf, Math.min(end - scaledHalf, center)), scale};
    }

    /**
     * ボタンの中心の横位置。slot の位置が端（親の端から margin 内側）からはみ出す幅の端末では、端と隣の
     * slot のボタン（同じ幅とみなす）の間の真ん中に置く。それでも入らなければ端に寄せる。
     */
    static float centerX(float shutterX, float unit, float slot, float width, float parentWidth, float margin) {
        float half = width / 2f;
        float center = shutterX + unit * slot;
        float start = margin;
        float end = parentWidth - margin;
        if (center - half < start) {
            float neighborLeft = shutterX + unit * (slot + 1) - half;
            center = Math.max(start + half, (start + neighborLeft) / 2f);
        } else if (center + half > end) {
            float neighborRight = shutterX + unit * (slot - 1) + half;
            center = Math.min(end - half, (neighborRight + end) / 2f);
        }
        return center;
    }

    private static View find(View view) {
        if (SHUTTER_CLASS.equals(view.getClass().getName())) {
            return view;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = find(group.getChildAt(i));
                if (found != null) {
                    return found;
                }
            }
        }
        return null;
    }
}
