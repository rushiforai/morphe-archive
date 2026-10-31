package a1;

import android.content.res.Resources;
import android.graphics.Point;
import android.view.MotionEvent;
import com.google.android.gms.internal.consent_sdk.w;
import e00.h6;
import gy.m0;
import h00.p;
import hv.s2;
import iy.q;
import java.util.regex.Pattern;
import k30.x;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;
import m3.l0;
import p1.e1;
import z2.y;

/* loaded from: classes2.dex */
public final /* synthetic */ class g implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f91a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ e1 f92b;

    public /* synthetic */ g(e1 e1Var, int i5) {
        this.f91a = i5;
        this.f92b = e1Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        int i5 = this.f91a;
        e1 e1Var = this.f92b;
        switch (i5) {
            case 0:
                e1Var.setValue((y) obj);
                break;
            case 1:
                MotionEvent motionEvent = (MotionEvent) obj;
                e1Var.setValue(new Point(MathKt.b(motionEvent.getRawX()), MathKt.b(motionEvent.getRawY())));
                break;
            case 2:
                e1Var.setValue((x) obj);
                break;
            case 3:
                break;
            case 4:
                break;
            case 5:
                l0 it = (l0) obj;
                Intrinsics.g(it, "it");
                e1Var.setValue(it);
                break;
            case 6:
                Boolean bool = (Boolean) obj;
                bool.booleanValue();
                e1Var.setValue(bool);
                break;
            case 7:
                e1Var.setValue(Boolean.valueOf(ha.g.a() == null));
                break;
            case 8:
                e1Var.setValue((String) obj);
                break;
            case 9:
                e1Var.setValue((String) obj);
                break;
            case 10:
                Boolean bool2 = (Boolean) obj;
                bool2.booleanValue();
                e1Var.setValue(bool2);
                break;
            case 11:
                Boolean bool3 = (Boolean) obj;
                bool3.booleanValue();
                e1Var.setValue(bool3);
                break;
            case 12:
                e1Var.setValue((x) obj);
                break;
            case 13:
                e1Var.setValue((String) obj);
                break;
            case 14:
                e1Var.setValue((String) obj);
                break;
            case 15:
                float f11 = 255;
                int iB = MathKt.b(f11 - (((Float) obj).floatValue() * f11));
                w wVar = h6.f50482a;
                e1Var.setValue(Integer.valueOf(iB));
                break;
            case 16:
                int iB2 = MathKt.b(((Float) obj).floatValue() * 100.0f);
                w wVar2 = h6.f50482a;
                e1Var.setValue(Integer.valueOf(iB2));
                break;
            case 17:
                long j11 = ((tz.n) obj).f90163a;
                w wVar3 = h6.f50482a;
                e1Var.setValue(new tz.n(j11));
                break;
            case 18:
                Integer num = (Integer) obj;
                num.intValue();
                e1Var.setValue(num);
                break;
            case 19:
                Integer num2 = (Integer) obj;
                num2.intValue();
                e1Var.setValue(num2);
                break;
            case 20:
                Float f12 = (Float) obj;
                f12.getClass();
                ((Function1) e1Var.getValue()).invoke(f12);
                break;
            case 21:
                Boolean bool4 = (Boolean) obj;
                bool4.booleanValue();
                e1Var.setValue(bool4);
                break;
            case 22:
                e1Var.setValue((String) m0.f58431c.invoke((String) obj));
                break;
            case 23:
                e1Var.setValue((String) m0.f58434f.invoke((String) obj));
                break;
            case 24:
                Pattern pattern = p.f58832a;
                e1Var.setValue((String) obj);
                break;
            case 25:
                e1Var.setValue(new y3.f(((int) (((y3.m) obj).f96611a & 4294967295L)) / Resources.getSystem().getDisplayMetrics().density));
                break;
            case 26:
                s2 s2Var = (s2) e1Var.getValue();
                if (s2Var != null) {
                    s2Var.f60584d.invoke();
                }
                break;
            case 27:
                if (((Float) obj).floatValue() == 0.0f) {
                    e1Var.setValue(Boolean.TRUE);
                }
                break;
            case 28:
                e1Var.setValue((q) obj);
                break;
            default:
                Boolean bool5 = (Boolean) obj;
                bool5.booleanValue();
                e1Var.setValue(bool5);
                break;
        }
        return Unit.f71706a;
    }
}
