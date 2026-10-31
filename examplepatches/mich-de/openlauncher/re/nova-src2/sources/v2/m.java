package v2;

import android.os.Build;
import android.view.MotionEvent;
import e1.m0;
import java.util.List;

/* loaded from: classes.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public final List f91975a;

    /* renamed from: b, reason: collision with root package name */
    public final m0 f91976b;

    /* renamed from: c, reason: collision with root package name */
    public final int f91977c;

    /* renamed from: d, reason: collision with root package name */
    public final int f91978d;

    /* renamed from: e, reason: collision with root package name */
    public int f91979e;

    /* JADX WARN: Removed duplicated region for block: B:36:0x005f  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0061  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0063  */
    /* JADX WARN: Removed duplicated region for block: B:9:0x001e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public m(List list, m0 m0Var) {
        int classification;
        this.f91975a = list;
        this.f91976b = m0Var;
        int i5 = 0;
        if (Build.VERSION.SDK_INT < 29) {
            classification = 0;
        } else {
            MotionEvent motionEventI = m0Var != null ? m0Var.i() : null;
            if (motionEventI != null) {
                classification = motionEventI.getClassification();
            }
        }
        this.f91977c = classification;
        MotionEvent motionEventI2 = m0Var != null ? m0Var.i() : null;
        this.f91978d = motionEventI2 != null ? motionEventI2.getButtonState() : 0;
        MotionEvent motionEventI3 = m0Var != null ? m0Var.i() : null;
        if (motionEventI3 != null) {
            motionEventI3.getMetaState();
        }
        MotionEvent motionEventI4 = m0Var != null ? m0Var.i() : null;
        if (motionEventI4 != null) {
            int actionMasked = motionEventI4.getActionMasked();
            if (actionMasked == 0) {
                i5 = 1;
            } else if (actionMasked == 1) {
                i5 = 2;
            } else if (actionMasked != 2) {
                switch (actionMasked) {
                    case 7:
                        i5 = 3;
                        break;
                    case 8:
                        i5 = 6;
                        break;
                    case 9:
                        i5 = 4;
                        break;
                    case 10:
                        i5 = 5;
                        break;
                }
            }
        } else {
            int size = list.size();
            while (i5 < size) {
                t tVar = (t) list.get(i5);
                if (g0.d(tVar)) {
                    i5 = 2;
                } else if (g0.b(tVar)) {
                    i5 = 1;
                } else {
                    i5++;
                }
            }
            i5 = 3;
        }
        this.f91979e = i5;
    }
}
