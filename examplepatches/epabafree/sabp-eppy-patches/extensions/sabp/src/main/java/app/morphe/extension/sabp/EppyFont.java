package app.morphe.extension.sabp;

import android.app.Activity;
import android.app.Application;
import android.graphics.Typeface;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.TextView;

import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * "Modern font" patch: applies the bundled Outfit font to the classic SABP screens at runtime.
 * Each TextView keeps its weight (regular / medium / bold). Text that SABP paints on a Canvas
 * inside its custom widgets is not affected.
 */
@SuppressWarnings("unused")
public final class EppyFont {
    private static final Set<View> watched = Collections.newSetFromMap(new WeakHashMap<>());
    private static final Set<Typeface> ours = Collections.newSetFromMap(new WeakHashMap<>());

    private EppyFont() {
    }

    /** Injected at the start of SABPApplication.onCreate(). */
    public static void install(Application app) {
        app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityResumed(Activity a) {
                if (a instanceof EppyActivity) return;
                final View decor = a.getWindow().getDecorView();
                apply(decor);
                if (watched.add(decor)) {
                    decor.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() {
                        @Override
                        public void onGlobalLayout() {
                            apply(decor);
                        }
                    });
                }
            }

            @Override
            public void onActivityCreated(Activity a, Bundle b) {
            }

            @Override
            public void onActivityStarted(Activity a) {
            }

            @Override
            public void onActivityPaused(Activity a) {
            }

            @Override
            public void onActivityStopped(Activity a) {
            }

            @Override
            public void onActivitySaveInstanceState(Activity a, Bundle b) {
            }

            @Override
            public void onActivityDestroyed(Activity a) {
            }
        });
    }

    static void apply(View v) {
        if (v instanceof TextView) {
            TextView tv = (TextView) v;
            Typeface cur = tv.getTypeface();
            if (cur == null || !ours.contains(cur)) {
                int weight = 400;
                if (cur != null) {
                    weight = cur.getWeight();
                    if (cur.isBold() && weight < 600) weight = 600;
                }
                // Outfit runs slightly light; nudge regular text up for legibility.
                if (weight < 450) weight = 420;
                Typeface t = EppyTheme.font(tv.getContext(), weight);
                ours.add(t);
                tv.setTypeface(t);
            }
        } else if (v instanceof ViewGroup) {
            ViewGroup g = (ViewGroup) v;
            for (int i = 0; i < g.getChildCount(); i++) apply(g.getChildAt(i));
        }
    }
}
