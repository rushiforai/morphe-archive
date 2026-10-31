package iy;

import android.content.res.Resources;
import b10.c1;
import e00.v1;
import java.time.Duration;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import p1.e1;

/* loaded from: classes4.dex */
public final /* synthetic */ class s implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f68365a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ e1 f68366b;

    public /* synthetic */ s(e1 e1Var, int i5) {
        this.f68365a = i5;
        this.f68366b = e1Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:62:0x0157  */
    @Override // kotlin.jvm.functions.Function1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj) {
        List listD1;
        Set setEntrySet;
        List listI1;
        int i5 = this.f68365a;
        e1 e1Var = this.f68366b;
        switch (i5) {
            case 0:
                Boolean bool = (Boolean) obj;
                bool.booleanValue();
                e1Var.setValue(bool);
                break;
            case 1:
                Boolean bool2 = (Boolean) obj;
                bool2.booleanValue();
                e1Var.setValue(bool2);
                break;
            case 2:
                Boolean bool3 = (Boolean) obj;
                bool3.booleanValue();
                s0.g gVar = p0.f68345a;
                e1Var.setValue(bool3);
                break;
            case 3:
                e1Var.setValue(new y3.f(((int) (((y3.m) obj).f96611a & 4294967295L)) / Resources.getSystem().getDisplayMetrics().density));
                break;
            case 4:
                Boolean bool4 = (Boolean) obj;
                bool4.booleanValue();
                e1Var.setValue(bool4);
                break;
            case 5:
                e1Var.setValue((gy.n0) obj);
                break;
            case 6:
                int i11 = l00.o.f72967p;
                e1Var.setValue((z2.y) obj);
                break;
            case 7:
                Boolean bool5 = (Boolean) obj;
                bool5.booleanValue();
                e1Var.setValue(bool5);
                break;
            case 8:
                ((Float) obj).getClass();
                if (((Boolean) e1Var.getValue()).booleanValue()) {
                    e1Var.setValue(Boolean.FALSE);
                }
                break;
            case 9:
                m0.u uVar = (m0.u) obj;
                String str = n00.f.f77555a;
                Map map = (Map) e1Var.getValue();
                if (map == null || (setEntrySet = map.entrySet()) == null || (listI1 = b70.g.I1(setEntrySet)) == null) {
                    listD1 = EmptyList.f71733a;
                } else {
                    listD1 = b70.g.D1(new n00.e(), listI1);
                    if (listD1 == null) {
                    }
                }
                m0.g gVar2 = (m0.g) uVar;
                gVar2.h(listD1.size(), null, new v1(9, listD1), new x1.e(new e00.b(5, listD1, e1Var), true, 802480018));
                gVar2.g(n00.h.f77567d);
                break;
            case 10:
                e1Var.setValue(Long.valueOf(Duration.ofMillis(((Long) obj).longValue()).toMinutes()));
                break;
            case 11:
                Boolean bool6 = (Boolean) obj;
                bool6.booleanValue();
                e1Var.setValue(bool6);
                break;
            case 12:
                e1Var.setValue((String) obj);
                break;
            case 13:
                List list = o00.j.f78916a;
                e1Var.setValue((String) obj);
                break;
            case 14:
                ((m0.g) ((m0.u) obj)).g(new x1.e(new c1(e1Var, 3), true, 127808372));
                break;
            case 15:
                Function3 content = (Function3) obj;
                Intrinsics.g(content, "content");
                e1Var.setValue(content);
                break;
            case 16:
                p1.m0 m0Var = ps.g0.f82876a;
                e1Var.setValue((y3.m) obj);
                break;
            case 17:
                Boolean bool7 = (Boolean) obj;
                bool7.booleanValue();
                e1Var.setValue(bool7);
                break;
            case 18:
                e1Var.setValue(Boolean.valueOf(Intrinsics.b((gy.n0) obj, q00.k.f83359b)));
                break;
            case 19:
                Boolean bool8 = (Boolean) obj;
                bool8.booleanValue();
                e1Var.setValue(bool8);
                break;
            case 20:
                d1.h hVar = (d1.h) obj;
                e1Var.setValue(hVar.f48782c ? hVar.f48781b : hVar.f48780a);
                break;
            case 21:
                List list2 = (List) obj;
                if (e1Var != null) {
                    e1Var.setValue(list2);
                }
                break;
            case 22:
                ((Function1) e1Var.getValue()).invoke((h2.b) obj);
                break;
            case 23:
                Boolean bool9 = (Boolean) obj;
                bool9.booleanValue();
                e1Var.setValue(bool9);
                break;
            case 24:
                ((Float) obj).getClass();
                if (((Boolean) e1Var.getValue()).booleanValue()) {
                    e1Var.setValue(Boolean.FALSE);
                }
                break;
            case 25:
                g2.v it = (g2.v) obj;
                Intrinsics.g(it, "it");
                e1Var.setValue(Boolean.valueOf(((g2.w) it).b()));
                break;
            case 26:
                g2.v it2 = (g2.v) obj;
                Intrinsics.g(it2, "it");
                e1Var.setValue(Boolean.valueOf(((g2.w) it2).b()));
                break;
            case 27:
                g2.v it3 = (g2.v) obj;
                Intrinsics.g(it3, "it");
                e1Var.setValue(Boolean.valueOf(((g2.w) it3).b()));
                break;
            case 28:
                e1Var.setValue((String) obj);
                break;
            default:
                e1Var.setValue((String) obj);
                break;
        }
        return Unit.f71706a;
    }
}
