package defpackage;

import android.app.PendingIntent;
import com.medium.android.catalogs.listscatalogselector.ListsCatalogSelectorDialogFragment;
import com.medium.android.core.susi.SusiOperation;
import com.medium.android.data.notification.YMl.DtuT;
import com.medium.android.susi.ui.magicLink.MagicLinkBottomSheetDialogFragment;
import com.medium.proto.event.SignUpSignInMagicLinkResendClicked;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class ek5 extends x55 implements m45 {
    public final /* synthetic */ int a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ek5(int i, Object obj, Class cls, String str, String str2, int i2, int i3) {
        super(i, i2, cls, obj, str, str2);
        this.a = i3;
    }

    @Override // defpackage.m45
    public final Object invoke() throws PendingIntent.CanceledException {
        int i = this.a;
        int i2 = 1;
        int i3 = 28;
        int i4 = 0;
        int i5 = 2;
        n92 n92Var = null;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((dk5) this.receiver).a();
                return c1eVar;
            case 1:
                ((sl5) this.receiver).a();
                return c1eVar;
            case 2:
                ((sl5) this.receiver).a();
                return c1eVar;
            case 3:
                dm5 dm5Var = (dm5) this.receiver;
                dm5Var.getClass();
                vx0.c0(f76.F(dm5Var), null, null, new bm5(dm5Var, n92Var, i4), 3);
                return c1eVar;
            case 4:
                ap5 ap5Var = ((no5) this.receiver).a;
                vx0.c0(f76.F(ap5Var), null, null, new wo5(ap5Var, n92Var, i5), 3);
                return c1eVar;
            case 5:
                ap5 ap5Var2 = ((no5) this.receiver).a;
                vx0.c0(f76.F(ap5Var2), null, null, new wo5(ap5Var2, n92Var, i5), 3);
                return c1eVar;
            case 6:
                ap5 ap5Var3 = ((no5) this.receiver).a;
                vx0.c0(f76.F(ap5Var3), null, null, new wo5(ap5Var3, n92Var, i4), 3);
                return c1eVar;
            case 7:
                bq5 bq5Var = ((jp5) this.receiver).a;
                vx0.c0(f76.F(bq5Var), null, null, new yp5(bq5Var, n92Var, i5), 3);
                return c1eVar;
            case 8:
                bq5 bq5Var2 = ((jp5) this.receiver).a;
                vx0.c0(f76.F(bq5Var2), null, null, new yp5(bq5Var2, n92Var, i4), 3);
                return c1eVar;
            case 9:
                bq5 bq5Var3 = ((jp5) this.receiver).a;
                vx0.c0(f76.F(bq5Var3), null, null, new yp5(bq5Var3, n92Var, i5), 3);
                return c1eVar;
            case 10:
                ((rq5) this.receiver).g();
                return c1eVar;
            case 11:
                ((rq5) this.receiver).g();
                return c1eVar;
            case 12:
                ((xv5) this.receiver).b();
                return c1eVar;
            case 13:
                uu6 uu6Var = (uu6) this.receiver;
                uu6Var.d.invoke();
                uu6Var.h = null;
                uu6Var.e.setValue(null);
                uu6Var.f.h(0.0f);
                return c1eVar;
            case 14:
                uu6 uu6Var2 = (uu6) this.receiver;
                uu6Var2.h = null;
                uu6Var2.e.setValue(null);
                uu6Var2.f.h(0.0f);
                return c1eVar;
            case 15:
                x47 x47VarG0 = ((u37) this.receiver).a.g0();
                vx0.c0(f76.F(x47VarG0), null, null, new wm4(x47VarG0, null), 3);
                return c1eVar;
            case 16:
                ListsCatalogSelectorDialogFragment listsCatalogSelectorDialogFragment = ((u37) this.receiver).a;
                p13 p13Var = listsCatalogSelectorDialogFragment.H0;
                if (p13Var != null) {
                    p13Var.g0(listsCatalogSelectorDialogFragment.S(), "my_lists");
                    return c1eVar;
                }
                g76.g0("router");
                throw null;
            case 17:
                x47 x47VarG02 = ((u37) this.receiver).a.g0();
                vx0.c0(f76.F(x47VarG02), null, null, new e47(x47VarG02, n92Var, i2), 3);
                return c1eVar;
            case 18:
                u97 u97Var = ((x87) this.receiver).b;
                vx0.c0(f76.F(u97Var), null, null, new r97(u97Var, n92Var, i5), 3);
                return c1eVar;
            case 19:
                u97 u97Var2 = ((x87) this.receiver).b;
                vx0.c0(f76.F(u97Var2), null, null, new xs3(i3, n92Var, u97Var2), 3);
                return c1eVar;
            case 20:
                u97 u97Var3 = ((x87) this.receiver).b;
                vx0.c0(f76.F(u97Var3), null, null, new r97(u97Var3, n92Var, i2), 3);
                return c1eVar;
            case 21:
                k40.X(((x87) this.receiver).a.a).f();
                return c1eVar;
            case 22:
                k40.X(((ld7) this.receiver).a.a).f();
                return c1eVar;
            case 23:
                me7 me7Var = ((ee7) this.receiver).b;
                a13 a13Var = me7Var.h;
                SusiOperation susiOperation = me7Var.f;
                String str = me7Var.j;
                String str2 = me7Var.k;
                String str3 = me7Var.b;
                a13Var.getClass();
                susiOperation.getClass();
                str.getClass();
                str2.getClass();
                str3.getClass();
                rqd rqdVar = a13Var.a;
                String strP = a13Var.b.p();
                rqd.a(rqdVar, new SignUpSignInMagicLinkResendClicked(null, DtuT.VAnEo, susiOperation.getValue(), strP, null, 17, null), str3, str2, false, null, str, 24);
                vx0.c0(f76.F(me7Var), null, null, new m1(me7Var, n92Var, i3), 3);
                return c1eVar;
            case 24:
                k40.X((MagicLinkBottomSheetDialogFragment) ((ee7) this.receiver).a.b).f();
                return c1eVar;
            case 25:
                ((rv7) this.receiver).a();
                return c1eVar;
            case 26:
                ((rv7) this.receiver).c();
                return c1eVar;
            case 27:
                ((rv7) this.receiver).a();
                return c1eVar;
            case 28:
                ((rv7) this.receiver).a();
                return c1eVar;
            default:
                ((rv7) this.receiver).a();
                return c1eVar;
        }
    }
}
