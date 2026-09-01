package defpackage;

import android.content.res.Resources;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class gea extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ ohc d;
    public final /* synthetic */ Resources e;
    public final /* synthetic */ fha f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ gea(ohc ohcVar, Resources resources, fha fhaVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = ohcVar;
        this.e = resources;
        this.f = fhaVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new gea(this.d, this.e, this.f, n92Var, 0);
            case 1:
                return new gea(this.d, this.e, this.f, n92Var, 1);
            case 2:
                return new gea(this.d, this.e, this.f, n92Var, 2);
            default:
                return new gea(this.d, this.e, this.f, n92Var, 3);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((gea) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        fha fhaVar = this.f;
        Resources resources = this.e;
        ohc ohcVar = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    String string = resources.getString(R.string.couldnt_publish);
                    string.getClass();
                    chc chcVar = chc.Long;
                    this.c = 1;
                    obj = ohcVar.a(string, null, chcVar, this);
                    if (obj == tb2Var) {
                    }
                } else if (i2 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                }
                if (((bic) obj) == bic.ActionPerformed) {
                    fhaVar.e();
                }
                break;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    String string2 = resources.getString(R.string.couldnt_save_image_changed);
                    string2.getClass();
                    String string3 = resources.getString(R.string.common_retry);
                    chc chcVar2 = chc.Long;
                    this.c = 1;
                    obj = ohcVar.a(string2, string3, chcVar2, this);
                    if (obj == tb2Var2) {
                    }
                } else if (i3 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                }
                if (((bic) obj) == bic.ActionPerformed) {
                    fhaVar.getClass();
                    vx0.c0(f76.F(fhaVar), null, null, new xga(fhaVar, null, 0), 3);
                }
                break;
            case 2:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    String string4 = resources.getString(R.string.couldnt_save_changes);
                    string4.getClass();
                    String string5 = resources.getString(R.string.common_retry);
                    chc chcVar3 = chc.Long;
                    this.c = 1;
                    obj = ohcVar.a(string4, string5, chcVar3, this);
                    if (obj == tb2Var3) {
                    }
                } else if (i4 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                }
                if (((bic) obj) == bic.ActionPerformed) {
                    fhaVar.getClass();
                    vx0.c0(f76.F(fhaVar), null, null, new xga(fhaVar, null, 1), 3);
                }
                break;
            default:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 == 0) {
                    br7.v(obj);
                    String string6 = resources.getString(R.string.couldnt_publish);
                    string6.getClass();
                    chc chcVar4 = chc.Long;
                    this.c = 1;
                    obj = ohcVar.a(string6, null, chcVar4, this);
                    if (obj == tb2Var4) {
                    }
                } else if (i5 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                }
                if (((bic) obj) == bic.ActionPerformed) {
                    fhaVar.i();
                }
                break;
        }
        return c1eVar;
    }
}
