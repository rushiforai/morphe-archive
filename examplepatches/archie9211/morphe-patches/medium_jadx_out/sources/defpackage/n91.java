package defpackage;

import android.content.res.Resources;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class n91 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ nhc d;
    public final /* synthetic */ Resources e;
    public final /* synthetic */ id1 f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ n91(nhc nhcVar, Resources resources, id1 id1Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = nhcVar;
        this.e = resources;
        this.f = id1Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new n91(this.d, this.e, this.f, n92Var, 0);
            case 1:
                return new n91(this.d, this.e, this.f, n92Var, 1);
            case 2:
                return new n91(this.d, this.e, this.f, n92Var, 2);
            case 3:
                return new n91(this.d, this.e, this.f, n92Var, 3);
            case 4:
                return new n91(this.d, this.e, this.f, n92Var, 4);
            case 5:
                return new n91(this.d, this.e, this.f, n92Var, 5);
            default:
                return new n91(this.d, this.e, this.f, n92Var, 6);
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
        return ((n91) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objC;
        Object objC2;
        Object objC3;
        u4b u4bVar;
        Object objC4;
        Object objC5;
        Object objC6;
        Object objC7;
        int i = this.b;
        int i2 = 0;
        int i3 = 2;
        c1e c1eVar = c1e.a;
        int i4 = 3;
        id1 id1Var = this.f;
        Resources resources = this.e;
        int i5 = 1;
        n92 n92Var = null;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i6 = this.c;
                if (i6 == 0) {
                    br7.v(obj);
                    String string = resources.getString(R.string.common_make_catalog_private_failed);
                    string.getClass();
                    String string2 = resources.getString(R.string.common_retry);
                    bhc bhcVar = bhc.Long;
                    this.c = 1;
                    objC = nhc.c(this.d, string, string2, bhcVar, this, 4);
                    if (objC == tb2Var) {
                    }
                } else if (i6 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                    objC = obj;
                }
                if (((aic) objC) == aic.ActionPerformed) {
                    vx0.c0(f76.F(id1Var), null, null, new xc1(i2, id1Var, n92Var), 3);
                }
                break;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i7 = this.c;
                if (i7 == 0) {
                    br7.v(obj);
                    String string3 = resources.getString(R.string.common_make_catalog_public_failed);
                    string3.getClass();
                    String string4 = resources.getString(R.string.common_retry);
                    bhc bhcVar2 = bhc.Long;
                    this.c = 1;
                    objC2 = nhc.c(this.d, string3, string4, bhcVar2, this, 4);
                    if (objC2 == tb2Var2) {
                    }
                } else if (i7 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                    objC2 = obj;
                }
                if (((aic) objC2) == aic.ActionPerformed) {
                    id1Var.n(false);
                }
                break;
            case 2:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i8 = this.c;
                if (i8 == 0) {
                    br7.v(obj);
                    String string5 = resources.getString(R.string.catalog_detail_reorder_failed);
                    string5.getClass();
                    String string6 = resources.getString(R.string.common_retry);
                    bhc bhcVar3 = bhc.Long;
                    this.c = 1;
                    objC3 = nhc.c(this.d, string5, string6, bhcVar3, this, 4);
                    if (objC3 == tb2Var3) {
                    }
                } else if (i8 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                    objC3 = obj;
                }
                if (((aic) objC3) == aic.ActionPerformed && (u4bVar = id1Var.K) != null) {
                    vx0.c0(f76.F(id1Var), null, null, new r91(id1Var, u4bVar, (n92) null), 3);
                    break;
                }
                break;
            case 3:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i9 = this.c;
                if (i9 == 0) {
                    br7.v(obj);
                    String string7 = resources.getString(R.string.common_unfollow_catalog_failed);
                    string7.getClass();
                    String string8 = resources.getString(R.string.common_retry);
                    bhc bhcVar4 = bhc.Long;
                    this.c = 1;
                    objC4 = nhc.c(this.d, string7, string8, bhcVar4, this, 4);
                    if (objC4 == tb2Var4) {
                    }
                } else if (i9 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                    objC4 = obj;
                }
                if (((aic) objC4) == aic.ActionPerformed) {
                    vx0.c0(f76.F(id1Var), null, null, new lc1(i4, id1Var, n92Var), 3);
                }
                break;
            case 4:
                tb2 tb2Var5 = tb2.COROUTINE_SUSPENDED;
                int i10 = this.c;
                if (i10 == 0) {
                    br7.v(obj);
                    String string9 = resources.getString(R.string.action_unavailable_list_while_offline_reading);
                    string9.getClass();
                    String string10 = resources.getString(R.string.common_reload);
                    bhc bhcVar5 = bhc.Long;
                    this.c = 1;
                    objC5 = nhc.c(this.d, string9, string10, bhcVar5, this, 4);
                    if (objC5 == tb2Var5) {
                    }
                } else if (i10 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                    objC5 = obj;
                }
                if (((aic) objC5) == aic.ActionPerformed) {
                    vx0.c0(f76.F(id1Var), null, null, new qd0(id1Var, yd4.NetworkOnly, n92Var, i3), 3);
                    vx0.c0(f76.F(id1Var), null, null, new kc1(9, id1Var, n92Var), 3);
                }
                break;
            case 5:
                tb2 tb2Var6 = tb2.COROUTINE_SUSPENDED;
                int i11 = this.c;
                if (i11 == 0) {
                    br7.v(obj);
                    String string11 = resources.getString(R.string.common_report_catalog_failed);
                    string11.getClass();
                    String string12 = resources.getString(R.string.common_retry);
                    bhc bhcVar6 = bhc.Long;
                    this.c = 1;
                    objC6 = nhc.c(this.d, string11, string12, bhcVar6, this, 4);
                    if (objC6 == tb2Var6) {
                    }
                } else if (i11 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                    objC6 = obj;
                }
                if (((aic) objC6) == aic.ActionPerformed) {
                    vx0.c0(f76.F(id1Var), null, null, new lc1(i3, id1Var, n92Var), 3);
                }
                break;
            default:
                tb2 tb2Var7 = tb2.COROUTINE_SUSPENDED;
                int i12 = this.c;
                if (i12 == 0) {
                    br7.v(obj);
                    String string13 = resources.getString(R.string.common_follow_catalog_failed);
                    string13.getClass();
                    String string14 = resources.getString(R.string.common_retry);
                    bhc bhcVar7 = bhc.Long;
                    this.c = 1;
                    objC7 = nhc.c(this.d, string13, string14, bhcVar7, this, 4);
                    if (objC7 == tb2Var7) {
                    }
                } else if (i12 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                    objC7 = obj;
                }
                if (((aic) objC7) == aic.ActionPerformed) {
                    vx0.c0(f76.F(id1Var), null, null, new lc1(i5, id1Var, n92Var), 3);
                }
                break;
        }
        return c1eVar;
    }
}
