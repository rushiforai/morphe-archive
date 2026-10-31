package au;

import ab.e0;
import android.os.LocaleList;
import bu.b0;
import com.stripe.android.paymentsheet.analytics.EventReporter$Mode;
import dq.k;
import es.f0;
import es.l0;
import ps.i0;
import t70.k0;
import t70.y0;
import wv.l;
import y70.o;

/* loaded from: classes4.dex */
public final class c implements s40.d {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15674a;

    public /* synthetic */ c(int i5) {
        this.f15674a = i5;
    }

    @Override // w60.a
    public final Object get() {
        switch (this.f15674a) {
            case 0:
                a80.e eVar = y0.f88884a;
                a80.d dVar = a80.d.f488c;
                i0.i(dVar);
                return dVar;
            case 1:
                return Boolean.TRUE;
            case 2:
                ir.a aVar = ir.a.f67993b;
                i0.i(aVar);
                return aVar;
            case 3:
                return Boolean.FALSE;
            case 4:
                return EventReporter$Mode.f44779d;
            case 5:
                return e0.U("EmbeddedPaymentElement");
            case 6:
                a80.e eVar2 = y0.f88884a;
                u70.d dVar2 = o.f96819a;
                i0.i(dVar2);
                return dVar2;
            case 7:
                w4.g gVar = w4.g.f93750b;
                w4.g gVarF = w4.g.f(LocaleList.getAdjustedDefault());
                if (gVarF.d()) {
                    gVarF = null;
                }
                if (gVarF != null) {
                    return gVarF.b(0);
                }
                return null;
            case 8:
                a80.e eVar3 = y0.f88884a;
                u70.d dVar3 = o.f96819a;
                i0.i(dVar3);
                return dVar3;
            case 9:
                return new b0();
            case 10:
                a80.e eVar4 = y0.f88884a;
                return k0.a(o.f96819a);
            case 11:
                a80.e eVar5 = y0.f88884a;
                return k0.a(o.f96819a);
            case 12:
                f0 f0Var = new f0();
                f0Var.f52946a = true;
                return f0Var;
            case 13:
                return new l0();
            case 14:
                return Boolean.FALSE;
            case 15:
                ir.a aVar2 = ir.a.f67993b;
                i0.i(aVar2);
                return aVar2;
            case 16:
                return Boolean.FALSE;
            case 17:
                return Boolean.FALSE;
            case 18:
                return Boolean.FALSE;
            case 19:
                ir.a aVar3 = ir.a.f67993b;
                i0.i(aVar3);
                return aVar3;
            case 20:
                return Boolean.FALSE;
            case 21:
                ir.a aVar4 = ir.a.f67993b;
                i0.i(aVar4);
                return aVar4;
            case 22:
                k kVar = k.f49352b;
                i0.i(kVar);
                return kVar;
            case 23:
                return new l();
            case 24:
                a80.e eVar6 = y0.f88884a;
                a80.d dVar4 = a80.d.f488c;
                i0.i(dVar4);
                return dVar4;
            case 25:
                ir.a aVar5 = ir.a.f67993b;
                i0.i(aVar5);
                return aVar5;
            case 26:
                mr.b.f76622d.get();
                return Boolean.FALSE.booleanValue() ? xq.d.f96223a : xq.d.f96224b;
            case 27:
                return e0.U("CustomerSheet");
            case 28:
                return Boolean.FALSE;
            default:
                return new ot.a(com.stripe.android.paymentsheet.paymentdatacollection.bacs.k.f44918a);
        }
    }

    public /* synthetic */ c(Object obj, int i5) {
        this.f15674a = i5;
    }
}
