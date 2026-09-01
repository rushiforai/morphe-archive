package defpackage;

import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class flc {
    public static final dlc Companion;
    public static final flc GONE;
    public static final flc INVISIBLE;
    public static final flc REMOVED;
    public static final flc VISIBLE;
    public static final /* synthetic */ flc[] a;

    static {
        flc flcVar = new flc("REMOVED", 0);
        REMOVED = flcVar;
        flc flcVar2 = new flc("VISIBLE", 1);
        VISIBLE = flcVar2;
        flc flcVar3 = new flc("GONE", 2);
        GONE = flcVar3;
        flc flcVar4 = new flc("INVISIBLE", 3);
        INVISIBLE = flcVar4;
        a = new flc[]{flcVar, flcVar2, flcVar3, flcVar4};
        Companion = new dlc();
    }

    public static final flc from(int i) {
        Companion.getClass();
        return dlc.b(i);
    }

    public static flc valueOf(String str) {
        return (flc) Enum.valueOf(flc.class, str);
    }

    public static flc[] values() {
        return (flc[]) a.clone();
    }

    public final void applyState(View view) {
        view.getClass();
        int i = elc.a[ordinal()];
        if (i == 1) {
            ViewParent parent = view.getParent();
            ViewGroup viewGroup = parent instanceof ViewGroup ? (ViewGroup) parent : null;
            if (viewGroup != null) {
                if (f25.I(2)) {
                    Log.v("FragmentManager", "SpecialEffectsController: Removing view " + view + " from container " + viewGroup);
                }
                viewGroup.removeView(view);
                return;
            }
            return;
        }
        if (i == 2) {
            if (f25.I(2)) {
                Log.v("FragmentManager", "SpecialEffectsController: Setting view " + view + " to VISIBLE");
            }
            view.setVisibility(0);
            return;
        }
        if (i == 3) {
            if (f25.I(2)) {
                Log.v("FragmentManager", "SpecialEffectsController: Setting view " + view + " to GONE");
            }
            view.setVisibility(8);
            return;
        }
        if (i != 4) {
            return;
        }
        if (f25.I(2)) {
            Log.v("FragmentManager", "SpecialEffectsController: Setting view " + view + " to INVISIBLE");
        }
        view.setVisibility(4);
    }
}
