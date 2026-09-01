package defpackage;

import android.content.res.Resources;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class fea extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ ohc d;
    public final /* synthetic */ Resources e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ fea(ohc ohcVar, Resources resources, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = ohcVar;
        this.e = resources;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new fea(this.d, this.e, n92Var, 0);
            case 1:
                return new fea(this.d, this.e, n92Var, 1);
            case 2:
                return new fea(this.d, this.e, n92Var, 2);
            case 3:
                return new fea(this.d, this.e, n92Var, 3);
            case 4:
                return new fea(this.d, this.e, n92Var, 4);
            case 5:
                return new fea(this.d, this.e, n92Var, 5);
            case 6:
                return new fea(this.d, this.e, n92Var, 6);
            case 7:
                return new fea(this.d, this.e, n92Var, 7);
            case 8:
                return new fea(this.d, this.e, n92Var, 8);
            case 9:
                return new fea(this.d, this.e, n92Var, 9);
            default:
                return new fea(this.d, this.e, n92Var, 10);
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
        return ((fea) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        Resources resources = this.e;
        ohc ohcVar = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 != 0) {
                    if (i2 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                String string = resources.getString(R.string.publication_flow_submission_requirements_not_met);
                string.getClass();
                chc chcVar = chc.Long;
                this.c = 1;
                return ohcVar.a(string, null, chcVar, this) == tb2Var ? tb2Var : c1eVar;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 != 0) {
                    if (i3 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                String string2 = resources.getString(R.string.account_suspended);
                string2.getClass();
                chc chcVar2 = chc.Short;
                this.c = 1;
                return ohcVar.a(string2, null, chcVar2, this) == tb2Var2 ? tb2Var2 : c1eVar;
            case 2:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 != 0) {
                    if (i4 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                String string3 = resources.getString(R.string.publishing_restricted_banned_links);
                string3.getClass();
                chc chcVar3 = chc.Short;
                this.c = 1;
                return ohcVar.a(string3, null, chcVar3, this) == tb2Var3 ? tb2Var3 : c1eVar;
            case 3:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 != 0) {
                    if (i5 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                String string4 = resources.getString(R.string.publication_flow_rate_limited);
                string4.getClass();
                chc chcVar4 = chc.Short;
                this.c = 1;
                return ohcVar.a(string4, null, chcVar4, this) == tb2Var4 ? tb2Var4 : c1eVar;
            case 4:
                tb2 tb2Var5 = tb2.COROUTINE_SUSPENDED;
                int i6 = this.c;
                if (i6 != 0) {
                    if (i6 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                String string5 = resources.getString(R.string.couldnt_publish);
                string5.getClass();
                chc chcVar5 = chc.Long;
                this.c = 1;
                return ohcVar.a(string5, null, chcVar5, this) == tb2Var5 ? tb2Var5 : c1eVar;
            case 5:
                tb2 tb2Var6 = tb2.COROUTINE_SUSPENDED;
                int i7 = this.c;
                if (i7 != 0) {
                    if (i7 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                String string6 = resources.getString(R.string.couldnt_publish);
                string6.getClass();
                chc chcVar6 = chc.Long;
                this.c = 1;
                return ohcVar.a(string6, null, chcVar6, this) == tb2Var6 ? tb2Var6 : c1eVar;
            case 6:
                tb2 tb2Var7 = tb2.COROUTINE_SUSPENDED;
                int i8 = this.c;
                if (i8 != 0) {
                    if (i8 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                String string7 = resources.getString(R.string.publication_flow_submission_not_accepting_submissions);
                string7.getClass();
                chc chcVar7 = chc.Short;
                this.c = 1;
                return ohcVar.a(string7, null, chcVar7, this) == tb2Var7 ? tb2Var7 : c1eVar;
            case 7:
                tb2 tb2Var8 = tb2.COROUTINE_SUSPENDED;
                int i9 = this.c;
                if (i9 != 0) {
                    if (i9 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                String string8 = resources.getString(R.string.publication_flow_submission_only_accepts_drafts);
                string8.getClass();
                chc chcVar8 = chc.Short;
                this.c = 1;
                return ohcVar.a(string8, null, chcVar8, this) == tb2Var8 ? tb2Var8 : c1eVar;
            case 8:
                tb2 tb2Var9 = tb2.COROUTINE_SUSPENDED;
                int i10 = this.c;
                if (i10 != 0) {
                    if (i10 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                String string9 = resources.getString(R.string.publication_flow_submission_only_accepts_published_posts);
                string9.getClass();
                chc chcVar9 = chc.Short;
                this.c = 1;
                return ohcVar.a(string9, null, chcVar9, this) == tb2Var9 ? tb2Var9 : c1eVar;
            case 9:
                tb2 tb2Var10 = tb2.COROUTINE_SUSPENDED;
                int i11 = this.c;
                if (i11 != 0) {
                    if (i11 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                String string10 = resources.getString(R.string.publication_flow_submission_already_exists);
                string10.getClass();
                chc chcVar10 = chc.Short;
                this.c = 1;
                return ohcVar.a(string10, null, chcVar10, this) == tb2Var10 ? tb2Var10 : c1eVar;
            default:
                tb2 tb2Var11 = tb2.COROUTINE_SUSPENDED;
                int i12 = this.c;
                if (i12 != 0) {
                    if (i12 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                String string11 = resources.getString(R.string.publication_flow_submission_cap_reached);
                string11.getClass();
                chc chcVar11 = chc.Short;
                this.c = 1;
                return ohcVar.a(string11, null, chcVar11, this) == tb2Var11 ? tb2Var11 : c1eVar;
        }
    }
}
