package defpackage;

import android.content.res.Resources;
import androidx.compose.runtime.tooling.Dp.CspinKvYN;
import com.medium.reader.R;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class kab extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ xab d;
    public final /* synthetic */ nhc e;
    public final /* synthetic */ Resources f;
    public final /* synthetic */ jbb g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ kab(xab xabVar, nhc nhcVar, Resources resources, jbb jbbVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = xabVar;
        this.e = nhcVar;
        this.f = resources;
        this.g = jbbVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new kab(this.e, this.f, this.g, this.d, n92Var, 0);
            case 1:
                return new kab(this.d, this.e, this.f, this.g, n92Var, 1);
            case 2:
                return new kab(this.e, this.f, this.g, this.d, n92Var, 2);
            case 3:
                return new kab(this.d, this.e, this.f, this.g, n92Var, 3);
            case 4:
                return new kab(this.d, this.e, this.f, this.g, n92Var, 4);
            default:
                return new kab(this.d, this.e, this.f, this.g, n92Var, 5);
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
        return ((kab) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objC;
        Object objC2;
        Object objC3;
        Object objC4;
        Object objC5;
        Object objC6;
        int i = this.b;
        jbb jbbVar = this.g;
        c1e c1eVar = c1e.a;
        String str = CspinKvYN.QAR;
        xab xabVar = this.d;
        Resources resources = this.f;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    String string = resources.getString(R.string.user_activity_block_reposter_successful);
                    string.getClass();
                    String string2 = resources.getString(R.string.common_undo);
                    bhc bhcVar = bhc.Short;
                    this.c = 1;
                    objC = nhc.c(this.e, string, string2, bhcVar, this, 4);
                    if (objC == tb2Var) {
                    }
                } else if (i2 != 1) {
                    ygf.f(str);
                } else {
                    br7.v(obj);
                    objC = obj;
                }
                if (((aic) objC) == aic.ActionPerformed) {
                    rab rabVar = (rab) xabVar;
                    String str2 = rabVar.a;
                    SourceParameter sourceParameter = rabVar.b;
                    str2.getClass();
                    sourceParameter.getClass();
                    jbb jbbVar2 = this.g;
                    vx0.c0(f76.F(jbbVar2), null, null, new ebb(jbbVar2, str2, sourceParameter, null, 2), 3);
                }
                break;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    String string3 = resources.getString(((qab) xabVar).c instanceof x14 ? R.string.user_activity_block_reposter_network_failure : R.string.user_activity_block_reposter_failure);
                    string3.getClass();
                    String string4 = resources.getString(R.string.common_retry);
                    bhc bhcVar2 = bhc.Long;
                    this.c = 1;
                    objC2 = nhc.c(this.e, string3, string4, bhcVar2, this, 4);
                    if (objC2 == tb2Var2) {
                    }
                } else if (i3 != 1) {
                    ygf.f(str);
                } else {
                    br7.v(obj);
                    objC2 = obj;
                }
                if (((aic) objC2) == aic.ActionPerformed) {
                    qab qabVar = (qab) xabVar;
                    jbbVar.e(qabVar.a, qabVar.b);
                }
                break;
            case 2:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    String string5 = resources.getString(R.string.common_unblock_user_successful);
                    string5.getClass();
                    String string6 = resources.getString(R.string.common_undo);
                    bhc bhcVar3 = bhc.Short;
                    this.c = 1;
                    objC3 = nhc.c(this.e, string5, string6, bhcVar3, this, 4);
                    if (objC3 == tb2Var3) {
                    }
                } else if (i4 != 1) {
                    ygf.f(str);
                } else {
                    br7.v(obj);
                    objC3 = obj;
                }
                if (((aic) objC3) == aic.ActionPerformed) {
                    uab uabVar = (uab) xabVar;
                    jbbVar.e(uabVar.a, uabVar.b);
                }
                break;
            case 3:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 == 0) {
                    br7.v(obj);
                    String string7 = resources.getString(((tab) xabVar).c instanceof x14 ? R.string.common_unblock_user_network_failure : R.string.common_unblock_user_failure);
                    string7.getClass();
                    String string8 = resources.getString(R.string.common_retry);
                    bhc bhcVar4 = bhc.Long;
                    this.c = 1;
                    objC4 = nhc.c(this.e, string7, string8, bhcVar4, this, 4);
                    if (objC4 == tb2Var4) {
                    }
                } else if (i5 != 1) {
                    ygf.f(str);
                } else {
                    br7.v(obj);
                    objC4 = obj;
                }
                if (((aic) objC4) == aic.ActionPerformed) {
                    tab tabVar = (tab) xabVar;
                    String str3 = tabVar.a;
                    SourceParameter sourceParameter2 = tabVar.b;
                    str3.getClass();
                    sourceParameter2.getClass();
                    jbb jbbVar3 = this.g;
                    vx0.c0(f76.F(jbbVar3), null, null, new ebb(jbbVar3, str3, sourceParameter2, null, 2), 3);
                }
                break;
            case 4:
                tb2 tb2Var5 = tb2.COROUTINE_SUSPENDED;
                int i6 = this.c;
                if (i6 == 0) {
                    br7.v(obj);
                    String string9 = resources.getString(((sab) xabVar).c instanceof x14 ? R.string.reposter_hide_note_network_failure : R.string.reposter_hide_note_failure);
                    string9.getClass();
                    String string10 = resources.getString(R.string.common_retry);
                    bhc bhcVar5 = bhc.Long;
                    this.c = 1;
                    objC5 = nhc.c(this.e, string9, string10, bhcVar5, this, 4);
                    if (objC5 == tb2Var5) {
                    }
                } else if (i6 != 1) {
                    ygf.f(str);
                } else {
                    br7.v(obj);
                    objC5 = obj;
                }
                if (((aic) objC5) == aic.ActionPerformed) {
                    sab sabVar = (sab) xabVar;
                    String str4 = sabVar.a;
                    SourceParameter sourceParameter3 = sabVar.b;
                    str4.getClass();
                    jbb jbbVar4 = this.g;
                    vx0.c0(f76.F(jbbVar4), null, null, new fbb(jbbVar4, str4, sourceParameter3, null, 0), 3);
                }
                break;
            default:
                tb2 tb2Var6 = tb2.COROUTINE_SUSPENDED;
                int i7 = this.c;
                if (i7 == 0) {
                    br7.v(obj);
                    String string11 = resources.getString(((vab) xabVar).c instanceof x14 ? R.string.reposter_unhide_note_network_failure : R.string.reposter_unhide_note_failure);
                    string11.getClass();
                    String string12 = resources.getString(R.string.common_retry);
                    bhc bhcVar6 = bhc.Long;
                    this.c = 1;
                    objC6 = nhc.c(this.e, string11, string12, bhcVar6, this, 4);
                    if (objC6 == tb2Var6) {
                    }
                } else if (i7 != 1) {
                    ygf.f(str);
                } else {
                    br7.v(obj);
                    objC6 = obj;
                }
                if (((aic) objC6) == aic.ActionPerformed) {
                    vab vabVar = (vab) xabVar;
                    String str5 = vabVar.a;
                    SourceParameter sourceParameter4 = vabVar.b;
                    str5.getClass();
                    jbb jbbVar5 = this.g;
                    vx0.c0(f76.F(jbbVar5), null, null, new fbb(jbbVar5, str5, sourceParameter4, null, 1), 3);
                }
                break;
        }
        return c1eVar;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ kab(nhc nhcVar, Resources resources, jbb jbbVar, xab xabVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = nhcVar;
        this.f = resources;
        this.g = jbbVar;
        this.d = xabVar;
    }
}
