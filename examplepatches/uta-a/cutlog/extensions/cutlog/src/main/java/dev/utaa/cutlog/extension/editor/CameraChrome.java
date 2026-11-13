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
 * 1 単位とした slot で指定する（フラッシュは -1）。レイアウトのたびに合わせ直す。
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
        View parent = (View) control.getParent();
        // 親は画面の幅いっぱいだが、カメラ映像の枠は内側に約 12dp 入っている。枠より内側に収める。
        float centerX = centerX(shutterX, unit, slot, control.getWidth(), parent.getWidth(), Ui.dp(control.getContext(), 16));
        control.setTranslationX(centerX - control.getWidth() / 2f);
        control.setTranslationY(centerY - control.getHeight() / 2f);
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
