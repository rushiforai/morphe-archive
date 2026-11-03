package dev.utaa.linimal.extension.features;

import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;

import java.lang.reflect.Method;

import dev.utaa.linimal.extension.config.LinimalConfig;

/** Smart Channel の枠と renderer を presentation 層だけで止めます。 */
public final class SmartChannelHooks {
    /** renderer の停止 callback。難読化名なので取得できなくても抑制の成否は左右しません。 */
    private static final String RENDERER_STOP_METHOD = "j";

    interface RendererCleanup {
        boolean cleanup(Object renderer) throws Throwable;
    }

    interface FrameSuppression {
        boolean hide(Object frame) throws Throwable;
    }

    /** production の抑制経路。test は同じ seam へ別の実装を渡すため、判定は 1 か所だけに保てます。 */
    private static final FrameSuppression ANDROID_FRAME_SUPPRESSION = new FrameSuppression() {
        @Override
        public boolean hide(Object frame) {
            return hideAndroidFrame(frame);
        }
    };

    private static final RendererCleanup ANDROID_RENDERER_CLEANUP = new RendererCleanup() {
        @Override
        public boolean cleanup(Object renderer) {
            return cleanupAndroidRenderer(renderer);
        }
    };

    private SmartChannelHooks() {
    }

    /**
     * Smart Channel の枠（SmartChannelViewLayout）ごと非表示にできたときだけ true を返します。
     * true のとき caller は UI state 処理全体を飛ばすため、枠は layout XML の既定値 gone のまま
     * 維持され、トーク一覧は上に詰まります。設定 OFF・未初期化・例外時は false を返し、
     * LINE の元の UI state 処理（枠の表示切替と広告の bind）がそのまま実行されます。
     */
    public static boolean shouldSuppressPlacement(Object frame) {
        try {
            return shouldSuppressPlacementWith(
                    LinimalConfig.get().isSmartChannelAdsSuppressionEnabled(),
                    frame,
                    ANDROID_FRAME_SUPPRESSION);
        } catch (Throwable ignored) {
            return false;
        }
    }

    /**
     * renderer が既にある場合は親からの取り外しを完了できたときだけ true を返します。
     * 失敗時は caller が元の bind/rebind を実行するため、広告取得や lifecycle を壊しません。
     */
    public static boolean shouldSuppressRenderer(Object renderer) {
        try {
            return shouldSuppressWith(
                    LinimalConfig.get().isSmartChannelAdsSuppressionEnabled(),
                    renderer,
                    ANDROID_RENDERER_CLEANUP);
        } catch (Throwable ignored) {
            return false;
        }
    }

    /**
     * rebindのreceiverを型安全に変換します。抑制とcleanupに成功した場合だけnullを返し、
     * OFFまたは失敗時は元のrenderer instanceをそのまま返します。
     */
    public static Object rendererForBinding(Object renderer) {
        try {
            return rendererForBindingWith(
                    LinimalConfig.get().isSmartChannelAdsSuppressionEnabled(),
                    renderer,
                    ANDROID_RENDERER_CLEANUP);
        } catch (Throwable ignored) {
            return renderer;
        }
    }

    /**
     * 枠を隠せないときは抑制を成立させません。ここで true を返すと caller は元の表示切替を
     * 実行しなくなるため、枠が表示されたまま取り残される経路を作らないための fail-open です。
     */
    static boolean shouldSuppressPlacementWith(
            boolean suppressAds, Object frame, FrameSuppression suppression) {
        if (!suppressAds) {
            return false;
        }
        if (frame == null || suppression == null) {
            return false;
        }
        try {
            return suppression.hide(frame);
        } catch (Throwable ignored) {
            return false;
        }
    }

    static Object rendererForBindingWith(
            boolean suppressAds, Object renderer, RendererCleanup cleanup) {
        return shouldSuppressWith(suppressAds, renderer, cleanup) ? null : renderer;
    }

    static boolean shouldSuppressWith(boolean suppressAds, Object renderer, RendererCleanup cleanup) {
        if (!suppressAds) {
            return false;
        }
        if (renderer == null) {
            return true;
        }
        if (cleanup == null) {
            return false;
        }
        try {
            return cleanup.cleanup(renderer);
        } catch (Throwable ignored) {
            return false;
        }
    }

    /**
     * 枠を GONE にしてから、表示中の renderer を best-effort で取り外します。
     * 枠は wrap_content の親にだけ属する専用コンテナなので、GONE にすれば minHeight ごと畳まれ、
     * 下のトーク一覧が上に詰まります。取り外しに失敗しても GONE のままなので抑制は成立します。
     */
    private static boolean hideAndroidFrame(Object frame) {
        if (!(frame instanceof View)) {
            return false;
        }
        View view = (View) frame;
        view.setVisibility(View.GONE);
        detachRenderersQuietly(view);
        return true;
    }

    private static void detachRenderersQuietly(View frame) {
        try {
            if (!(frame instanceof ViewGroup)) {
                return;
            }
            ViewGroup group = (ViewGroup) frame;
            for (int index = group.getChildCount() - 1; index >= 0; index--) {
                View child = group.getChildAt(index);
                stopRendererQuietly(child);
                group.removeViewAt(index);
            }
        } catch (Throwable ignored) {
            // 枠は既に GONE なので、取り外せなくても広告は表示されません。
        }
    }

    /**
     * 取り外せることを確かめてから停止 callback を呼びます。false を返す経路では caller が元の
     * bind/rebind を実行するため、停止済みの renderer を再利用させないための順序です。
     */
    private static boolean cleanupAndroidRenderer(Object renderer) {
        if (!(renderer instanceof View)) {
            return false;
        }
        View view = (View) renderer;
        ViewParent parent = view.getParent();
        if (parent != null && !(parent instanceof ViewGroup)) {
            return false;
        }

        stopRendererQuietly(view);
        if (parent != null) {
            ((ViewGroup) parent).removeView(view);
        }
        return true;
    }

    /** 停止 callback は best-effort です。難読化名が変わっても取り外しと非表示は成立します。 */
    private static void stopRendererQuietly(Object renderer) {
        try {
            Method stop = renderer.getClass().getMethod(RENDERER_STOP_METHOD);
            if (stop.getParameterTypes().length == 0 && stop.getReturnType() == Void.TYPE) {
                stop.invoke(renderer);
            }
        } catch (Throwable ignored) {
            // 停止 callback を呼べなくても presentation 層の抑制自体は継続します。
        }
    }
}
