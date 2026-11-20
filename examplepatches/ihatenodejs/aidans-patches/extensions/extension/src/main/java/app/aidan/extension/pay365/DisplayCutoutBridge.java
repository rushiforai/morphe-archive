package app.aidan.extension.pay365;

import android.app.Activity;
import android.graphics.Insets;
import android.os.Build;
import android.view.DisplayCutout;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowInsets;
import android.widget.ImageView;
import java.util.WeakHashMap;

/**
 * Dynamically adapts 365 Pay screens (Home, Pay, Account) for devices with camera display cutouts.
 *
 * Uses continuous OnPreDraw and OnGlobalLayout listeners so that layout adaptations are guaranteed,
 * consistent, and never undone by asynchronous React Native / Yoga re-layouts or tab transitions.
 */
public final class DisplayCutoutBridge {
    private static final float BASELINE_STATUS_BAR_DP = 24.0f;
    private static final float HEADER_HEIGHT_BASELINE_DP = 78.0f;
    private static final WeakHashMap<View, Integer> INSET_MAP = new WeakHashMap<>();

    private DisplayCutoutBridge() {
    }

    public static void init(final Activity activity) {
        if (activity == null || activity.isFinishing()) {
            return;
        }

        final Window window = activity.getWindow();
        if (window == null) {
            return;
        }

        final View decorView = window.getDecorView();
        if (decorView == null) {
            return;
        }

        decorView.post(new Runnable() {
            @Override
            public void run() {
                if (activity.isFinishing()) {
                    return;
                }
                setupInsetsListener(activity, decorView);
            }
        });
    }

    private static void setupInsetsListener(final Activity activity, final View decorView) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            WindowInsets currentInsets = decorView.getRootWindowInsets();
            if (currentInsets != null) {
                applyInsets(activity, decorView, currentInsets);
            }
        }

        decorView.setOnApplyWindowInsetsListener(new View.OnApplyWindowInsetsListener() {
            @Override
            public WindowInsets onApplyWindowInsets(View v, WindowInsets insets) {
                applyInsets(activity, decorView, insets);
                return v.onApplyWindowInsets(insets);
            }
        });
    }

    private static void applyInsets(final Activity activity, final View decorView, WindowInsets insets) {
        if (insets == null || activity == null || activity.isFinishing()) {
            return;
        }

        int cutoutTop = 0;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            DisplayCutout cutout = insets.getDisplayCutout();
            if (cutout != null) {
                cutoutTop = cutout.getSafeInsetTop();
            }
        }

        int statusBarTop = 0;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            Insets sb = insets.getInsets(WindowInsets.Type.statusBars());
            if (sb != null) {
                statusBarTop = sb.top;
            }
        } else {
            statusBarTop = insets.getSystemWindowInsetTop();
        }

        float density = activity.getResources().getDisplayMetrics().density;
        int effectiveTop = Math.max(cutoutTop, statusBarTop);
        int thresholdPx = Math.round(36.0f * density);

        if (cutoutTop <= 0 && effectiveTop <= thresholdPx) {
            return;
        }

        final int cutoutInsetTop = effectiveTop;
        if (cutoutInsetTop <= 0) {
            return;
        }

        boolean alreadyRegistered;
        synchronized (INSET_MAP) {
            alreadyRegistered = INSET_MAP.containsKey(decorView);
            INSET_MAP.put(decorView, cutoutInsetTop);
        }

        if (alreadyRegistered) {
            decorView.postInvalidate();
            return;
        }

        final ViewTreeObserver vto = decorView.getViewTreeObserver();

        vto.addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() {
            @Override
            public boolean onPreDraw() {
                if (activity.isFinishing()) {
                    return true;
                }
                Integer inset;
                synchronized (INSET_MAP) {
                    inset = INSET_MAP.get(decorView);
                }
                if (inset != null && inset > 0) {
                    float currentDensity = decorView.getResources().getDisplayMetrics().density;
                    adaptViewHierarchy(decorView, currentDensity, inset);
                }
                return true;
            }
        });

        vto.addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() {
            @Override
            public void onGlobalLayout() {
                if (activity.isFinishing()) {
                    return;
                }
                Integer inset;
                synchronized (INSET_MAP) {
                    inset = INSET_MAP.get(decorView);
                }
                if (inset != null && inset > 0) {
                    float currentDensity = decorView.getResources().getDisplayMetrics().density;
                    adaptViewHierarchy(decorView, currentDensity, inset);
                }
            }
        });
        adaptViewHierarchy(decorView, density, cutoutInsetTop);
    }

    private static void adaptViewHierarchy(View root, float density, int cutoutTop) {
        if (root == null || cutoutTop <= 0) {
            return;
        }

        View locationBtn = findViewByTag(root, "qa_dpd_SelectLocation");
        if (locationBtn != null) {
            adaptHeaderScreen(locationBtn, density, cutoutTop);
        }

        View accountTitle = findViewByTag(root, "qa_Account.PageTitle_txt");
        if (accountTitle != null) {
            adaptHeaderScreen(accountTitle, density, cutoutTop);
        }

        View payQr = findViewByTag(root, "QRCode");
        if (payQr != null) {
            adaptPayScreen(payQr, density, cutoutTop);
        }
    }

    private static void adaptHeaderScreen(View anchor, float density, int cutoutTop) {
        ViewGroup headerView = null;
        ViewParent curr = anchor.getParent();
        while (curr instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) curr;
            if (vg.getChildCount() >= 1 && vg.getChildAt(0) instanceof ImageView) {
                headerView = vg;
                break;
            }
            curr = curr.getParent();
        }

        if (headerView == null) {
            return;
        }

        headerView.setClipChildren(false);
        headerView.setClipToPadding(false);

        ViewParent hp = headerView.getParent();
        ViewGroup screenContainer = (hp instanceof ViewGroup) ? (ViewGroup) hp : null;
        if (screenContainer != null) {
            screenContainer.setClipChildren(false);
            screenContainer.setClipToPadding(false);
        }

        int expectedHeaderHeight = Math.round(HEADER_HEIGHT_BASELINE_DP * density);
        int targetHeaderBottom = cutoutTop + expectedHeaderHeight;
        float centerLine = cutoutTop + (expectedHeaderHeight / 2.0f);

        View child0 = headerView.getChildAt(0);
        if (child0 instanceof ImageView) {
            ImageView gradientImage = (ImageView) child0;
            gradientImage.setPivotY(0f);
            float targetScale = (float) targetHeaderBottom / (float) expectedHeaderHeight;
            if (Math.abs(gradientImage.getScaleY() - targetScale) > 0.005f) {
                gradientImage.setScaleY(targetScale);
            }
            if (headerView.getBottom() < targetHeaderBottom) {
                headerView.setBottom(targetHeaderBottom);
            }
        }

        if (headerView.getChildCount() >= 2) {
            View controls = headerView.getChildAt(1);
            if (controls instanceof ViewGroup) {
                int anchorH = anchor.getHeight();
                if (anchorH <= 0) {
                    anchorH = Math.round(40f * density);
                }
                float desiredAnchorTop = centerLine - (anchorH / 2.0f);

                int[] anchorLoc = new int[2];
                int[] headerLoc = new int[2];
                anchor.getLocationOnScreen(anchorLoc);
                headerView.getLocationOnScreen(headerLoc);
                float currentRelTop = anchorLoc[1] - headerLoc[1];
                float unshiftedRelTop = currentRelTop - controls.getTranslationY();

                float neededShift = desiredAnchorTop - unshiftedRelTop;
                if (Math.abs(controls.getTranslationY() - neededShift) > 0.5f) {
                    controls.setTranslationY(neededShift);
                }
            }
        }

        if (screenContainer != null && screenContainer.getChildCount() >= 2 && screenContainer.getChildAt(0) == headerView) {
            View body = screenContainer.getChildAt(1);
            if (body != null && Math.abs(body.getTranslationY() - (float) cutoutTop) > 0.5f) {
                body.setTranslationY((float) cutoutTop);
                body.setPadding(
                    body.getPaddingLeft(),
                    body.getPaddingTop(),
                    body.getPaddingRight(),
                    cutoutTop
                );
            }
        }
    }

    private static void adaptPayScreen(View qrView, float density, int cutoutTop) {
        ViewParent curr = qrView.getParent();
        ViewGroup payScreen = null;
        while (curr instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) curr;
            if (vg.getChildCount() >= 4 && vg.getChildAt(0) instanceof View) {
                View c0 = vg.getChildAt(0);
                if (c0.getTop() == 0 && c0.getHeight() > 1000) {
                    payScreen = vg;
                    break;
                }
            }
            curr = curr.getParent();
        }

        if (payScreen == null) {
            return;
        }

        payScreen.setClipChildren(false);
        payScreen.setClipToPadding(false);

        int expectedHeaderHeight = Math.round(HEADER_HEIGHT_BASELINE_DP * density);
        float centerLine = cutoutTop + (expectedHeaderHeight / 2.0f);

        if (payScreen.getChildCount() >= 2) {
            View titleView = payScreen.getChildAt(1);
            int titleH = titleView.getHeight();
            if (titleH <= 0) {
                titleH = Math.round(28f * density);
            }
            float desiredTitleTop = centerLine - (titleH / 2.0f);
            float unshiftedTitleTop = titleView.getTop();
            float neededShift = desiredTitleTop - unshiftedTitleTop;
            if (Math.abs(titleView.getTranslationY() - neededShift) > 0.5f) {
                titleView.setTranslationY(neededShift);
            }
        }

        int count = payScreen.getChildCount();
        for (int i = 2; i < count; i++) {
            View child = payScreen.getChildAt(i);
            if (child != null && Math.abs(child.getTranslationY() - (float) cutoutTop) > 0.5f) {
                child.setTranslationY((float) cutoutTop);
            }
        }
    }

    private static View findViewByTag(View root, String targetTag) {
        if (root == null || targetTag == null) {
            return null;
        }
        Object tag = root.getTag();
        if (tag instanceof String && targetTag.equals(tag)) {
            return root;
        }
        if (root instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) root;
            int count = vg.getChildCount();
            for (int i = 0; i < count; i++) {
                View found = findViewByTag(vg.getChildAt(i), targetTag);
                if (found != null) {
                    return found;
                }
            }
        }
        return null;
    }
}
