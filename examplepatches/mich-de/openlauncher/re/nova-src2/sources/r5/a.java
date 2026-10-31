package r5;

import a5.a1;
import android.os.Bundle;
import android.view.View;
import android.view.accessibility.AccessibilityManager;
import android.view.accessibility.AccessibilityNodeInfo;
import b5.g;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.WeakHashMap;

/* loaded from: classes2.dex */
public final class a extends vm.c {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ b f85494d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(b bVar) {
        super(3);
        this.f85494d = bVar;
    }

    @Override // vm.c
    public final g e(int i5) {
        return new g(AccessibilityNodeInfo.obtain(this.f85494d.m(i5).f17551a));
    }

    @Override // vm.c
    public final g g(int i5) {
        b bVar = this.f85494d;
        int i11 = i5 == 2 ? bVar.f85502k : bVar.f85503l;
        if (i11 == Integer.MIN_VALUE) {
            return null;
        }
        return e(i11);
    }

    @Override // vm.c
    public final boolean r(int i5, int i11, Bundle bundle) {
        int i12;
        int i13;
        b bVar = this.f85494d;
        View view = bVar.f85500i;
        if (i5 == -1) {
            WeakHashMap weakHashMap = a1.f250a;
            return view.performAccessibilityAction(i11, bundle);
        }
        if (i11 == 1) {
            View view2 = bVar.f85500i;
            if ((!view2.isFocused() && !view2.requestFocus()) || (i12 = bVar.f85503l) == i5) {
                return false;
            }
            if (i12 != Integer.MIN_VALUE) {
                bVar.f85503l = Integer.MIN_VALUE;
                bVar.r(i12, false);
                bVar.s(i12, 8);
            }
            if (i5 == Integer.MIN_VALUE) {
                return false;
            }
            bVar.f85503l = i5;
            bVar.r(i5, true);
            bVar.s(i5, 8);
            return true;
        }
        if (i11 == 2) {
            if (bVar.f85503l != i5) {
                return false;
            }
            bVar.f85503l = Integer.MIN_VALUE;
            bVar.r(i5, false);
            bVar.s(i5, 8);
            return true;
        }
        if (i11 != 64) {
            if (i11 != 128) {
                return bVar.n(i5, i11);
            }
            if (bVar.f85502k != i5) {
                return false;
            }
            bVar.f85502k = Integer.MIN_VALUE;
            view.invalidate();
            bVar.s(i5, SQLiteDatabase.OPEN_FULLMUTEX);
            return true;
        }
        AccessibilityManager accessibilityManager = bVar.f85499h;
        if (!accessibilityManager.isEnabled() || !accessibilityManager.isTouchExplorationEnabled() || (i13 = bVar.f85502k) == i5) {
            return false;
        }
        if (i13 != Integer.MIN_VALUE) {
            bVar.f85502k = Integer.MIN_VALUE;
            view.invalidate();
            bVar.s(i13, SQLiteDatabase.OPEN_FULLMUTEX);
        }
        bVar.f85502k = i5;
        view.invalidate();
        bVar.s(i5, SQLiteDatabase.OPEN_NOMUTEX);
        return true;
    }
}
