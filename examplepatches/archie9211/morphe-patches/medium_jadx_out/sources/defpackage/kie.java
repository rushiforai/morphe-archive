package defpackage;

import android.content.res.Resources;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class kie extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ nhc d;
    public final /* synthetic */ hje e;
    public final /* synthetic */ Resources f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public kie(Resources resources, hje hjeVar, nhc nhcVar, n92 n92Var) {
        super(2, n92Var);
        this.b = 9;
        this.f = resources;
        this.e = hjeVar;
        this.d = nhcVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        nhc nhcVar = this.d;
        hje hjeVar = this.e;
        Resources resources = this.f;
        switch (i) {
            case 0:
                return new kie(this.d, this.e, this.f, n92Var, 0);
            case 1:
                return new kie(this.d, this.e, this.f, n92Var, 1);
            case 2:
                return new kie(this.e, this.f, this.d, n92Var, 2);
            case 3:
                return new kie(this.d, this.f, this.e, n92Var, 3);
            case 4:
                return new kie(this.d, this.f, this.e, n92Var, 4);
            case 5:
                return new kie(this.e, this.f, this.d, n92Var, 5);
            case 6:
                return new kie(this.d, this.e, this.f, n92Var, 6);
            case 7:
                return new kie(hjeVar, nhcVar, resources, n92Var);
            case 8:
                return new kie(this.e, this.f, this.d, n92Var, 8);
            case 9:
                return new kie(resources, hjeVar, nhcVar, n92Var);
            case 10:
                return new kie(this.d, this.f, this.e, n92Var, 10);
            default:
                return new kie(this.e, this.f, this.d, n92Var, 11);
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
        return ((kie) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        Resources resources = this.f;
        hje hjeVar = this.e;
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
                String str = ((aje) hjeVar).a;
                String string = str == null ? resources.getString(R.string.common_unfollow_user_successful) : resources.getString(R.string.common_unfollow_user_with_name_successful, str);
                string.getClass();
                bhc bhcVar = bhc.Short;
                this.c = 1;
                return nhc.c(this.d, string, null, bhcVar, this, 6) == tb2Var ? tb2Var : c1eVar;
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
                String str2 = ((cje) hjeVar).a;
                String string2 = str2 == null ? resources.getString(R.string.common_unfollow_user_successful) : resources.getString(R.string.common_unfollow_user_with_name_successful, str2);
                string2.getClass();
                bhc bhcVar2 = bhc.Short;
                this.c = 1;
                return nhc.c(this.d, string2, null, bhcVar2, this, 6) == tb2Var2 ? tb2Var2 : c1eVar;
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
                String string3 = resources.getString(((dje) hjeVar).a instanceof x14 ? R.string.common_unmute_user_network_failure : R.string.common_unmute_user_failure);
                string3.getClass();
                bhc bhcVar3 = bhc.Long;
                this.c = 1;
                return nhc.c(this.d, string3, null, bhcVar3, this, 2) == tb2Var3 ? tb2Var3 : c1eVar;
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
                String string4 = resources.getString(R.string.common_unsubscribe_newsletter_failure, ((fje) hjeVar).a);
                string4.getClass();
                bhc bhcVar4 = bhc.Long;
                this.c = 1;
                return nhc.c(this.d, string4, null, bhcVar4, this, 6) == tb2Var4 ? tb2Var4 : c1eVar;
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
                String string5 = resources.getString(R.string.common_unsubscribe_newsletter_successful, ((gje) hjeVar).a);
                string5.getClass();
                bhc bhcVar5 = bhc.Short;
                this.c = 1;
                return nhc.c(this.d, string5, null, bhcVar5, this, 6) == tb2Var5 ? tb2Var5 : c1eVar;
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
                String string6 = resources.getString(((pie) hjeVar).a instanceof x14 ? R.string.common_block_user_network_failure : R.string.common_block_user_failure);
                string6.getClass();
                bhc bhcVar6 = bhc.Long;
                this.c = 1;
                return nhc.c(this.d, string6, null, bhcVar6, this, 2) == tb2Var6 ? tb2Var6 : c1eVar;
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
                String str3 = ((rie) hjeVar).a;
                String string7 = str3 != null ? resources.getString(R.string.common_follow_user_with_name_successful, str3) : resources.getString(R.string.common_follow_user_successful);
                string7.getClass();
                bhc bhcVar7 = bhc.Short;
                this.c = 1;
                return nhc.c(this.d, string7, null, bhcVar7, this, 6) == tb2Var7 ? tb2Var7 : c1eVar;
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
                String string8 = resources.getString(((sie) hjeVar).a instanceof x14 ? R.string.common_follow_user_network_failure : R.string.common_follow_user_failed);
                string8.getClass();
                bhc bhcVar8 = bhc.Long;
                this.c = 1;
                return nhc.c(this.d, string8, null, bhcVar8, this, 6) == tb2Var8 ? tb2Var8 : c1eVar;
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
                String string9 = resources.getString(((uie) hjeVar).a instanceof x14 ? R.string.common_mute_user_network_failure : R.string.common_mute_user_failure);
                string9.getClass();
                bhc bhcVar9 = bhc.Long;
                this.c = 1;
                return nhc.c(this.d, string9, null, bhcVar9, this, 2) == tb2Var9 ? tb2Var9 : c1eVar;
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
                String string10 = resources.getString(R.string.common_subscribe_newsletter_failure, ((wie) hjeVar).a);
                string10.getClass();
                bhc bhcVar10 = bhc.Long;
                this.c = 1;
                return nhc.c(this.d, string10, null, bhcVar10, this, 2) == tb2Var10 ? tb2Var10 : c1eVar;
            case 10:
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
                String string11 = resources.getString(R.string.common_subscribe_newsletter_successful, ((xie) hjeVar).a);
                string11.getClass();
                bhc bhcVar11 = bhc.Short;
                this.c = 1;
                return nhc.c(this.d, string11, null, bhcVar11, this, 6) == tb2Var11 ? tb2Var11 : c1eVar;
            default:
                tb2 tb2Var12 = tb2.COROUTINE_SUSPENDED;
                int i13 = this.c;
                if (i13 != 0) {
                    if (i13 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                String string12 = resources.getString(((yie) hjeVar).a instanceof x14 ? R.string.common_unblock_user_network_failure : R.string.common_unblock_user_failure);
                string12.getClass();
                bhc bhcVar12 = bhc.Long;
                this.c = 1;
                return nhc.c(this.d, string12, null, bhcVar12, this, 2) == tb2Var12 ? tb2Var12 : c1eVar;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ kie(nhc nhcVar, Resources resources, hje hjeVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = nhcVar;
        this.f = resources;
        this.e = hjeVar;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public kie(hje hjeVar, nhc nhcVar, Resources resources, n92 n92Var) {
        super(2, n92Var);
        this.b = 7;
        this.e = hjeVar;
        this.d = nhcVar;
        this.f = resources;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ kie(hje hjeVar, Resources resources, nhc nhcVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = hjeVar;
        this.f = resources;
        this.d = nhcVar;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ kie(nhc nhcVar, hje hjeVar, Resources resources, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = nhcVar;
        this.e = hjeVar;
        this.f = resources;
    }
}
