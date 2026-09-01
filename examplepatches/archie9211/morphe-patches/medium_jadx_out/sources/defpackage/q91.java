package defpackage;

import android.content.res.Resources;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q91 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ nhc d;
    public final /* synthetic */ Resources e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ q91(nhc nhcVar, Resources resources, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = nhcVar;
        this.e = resources;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Resources resources = this.e;
        nhc nhcVar = this.d;
        switch (i) {
            case 0:
                return new q91(nhcVar, resources, n92Var, 0);
            case 1:
                return new q91(nhcVar, resources, n92Var, 1);
            case 2:
                return new q91(nhcVar, resources, n92Var, 2);
            case 3:
                return new q91(nhcVar, resources, n92Var, 3);
            case 4:
                return new q91(nhcVar, resources, n92Var, 4);
            case 5:
                return new q91(nhcVar, resources, n92Var, 5);
            case 6:
                return new q91(nhcVar, resources, n92Var, 6);
            case 7:
                return new q91(nhcVar, resources, n92Var, 7);
            case 8:
                return new q91(nhcVar, resources, n92Var, 8);
            case 9:
                return new q91(nhcVar, resources, n92Var, 9);
            case 10:
                return new q91(nhcVar, resources, n92Var, 10);
            case 11:
                return new q91(nhcVar, resources, n92Var, 11);
            case 12:
                return new q91(nhcVar, resources, n92Var, 12);
            case 13:
                return new q91(nhcVar, resources, n92Var, 13);
            case 14:
                return new q91(nhcVar, resources, n92Var, 14);
            case 15:
                return new q91(nhcVar, resources, n92Var, 15);
            default:
                return new q91(nhcVar, resources, n92Var, 16);
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
        return ((q91) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        Resources resources = this.e;
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
                String string = resources.getString(R.string.common_unfollow_catalog_success);
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
                String string2 = resources.getString(R.string.common_undo_claps_success);
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
                String string3 = resources.getString(R.string.common_report_catalog_successful);
                string3.getClass();
                bhc bhcVar3 = bhc.Short;
                this.c = 1;
                return nhc.c(this.d, string3, null, bhcVar3, this, 6) == tb2Var3 ? tb2Var3 : c1eVar;
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
                String string4 = resources.getString(R.string.common_follow_catalog_success);
                string4.getClass();
                bhc bhcVar4 = bhc.Short;
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
                String string5 = resources.getString(R.string.digest_digest_not_found);
                string5.getClass();
                bhc bhcVar5 = bhc.Long;
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
                String string6 = resources.getString(R.string.external_web_open_in_browser_error);
                string6.getClass();
                bhc bhcVar6 = bhc.Long;
                this.c = 1;
                return nhc.c(this.d, string6, null, bhcVar6, this, 6) == tb2Var6 ? tb2Var6 : c1eVar;
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
                String string7 = resources.getString(R.string.common_copy_to_clipboard_failure);
                string7.getClass();
                bhc bhcVar7 = bhc.Long;
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
                String string8 = resources.getString(R.string.find_friends_follow_all_contacts_failed);
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
                String string9 = resources.getString(R.string.repost_rate_limit_failure_snackbar);
                string9.getClass();
                bhc bhcVar9 = bhc.Long;
                this.c = 1;
                return nhc.c(this.d, string9, null, bhcVar9, this, 6) == tb2Var9 ? tb2Var9 : c1eVar;
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
                String string10 = resources.getString(R.string.common_oops);
                string10.getClass();
                bhc bhcVar10 = bhc.Long;
                this.c = 1;
                return nhc.c(this.d, string10, null, bhcVar10, this, 6) == tb2Var10 ? tb2Var10 : c1eVar;
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
                String string11 = resources.getString(R.string.common_follow_tag_failed);
                string11.getClass();
                bhc bhcVar11 = bhc.Long;
                this.c = 1;
                return nhc.c(this.d, string11, null, bhcVar11, this, 4) == tb2Var11 ? tb2Var11 : c1eVar;
            case 11:
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
                String string12 = resources.getString(R.string.common_unfollow_tag_failed);
                string12.getClass();
                bhc bhcVar12 = bhc.Long;
                this.c = 1;
                return nhc.c(this.d, string12, null, bhcVar12, this, 4) == tb2Var12 ? tb2Var12 : c1eVar;
            case 12:
                tb2 tb2Var13 = tb2.COROUTINE_SUSPENDED;
                int i14 = this.c;
                if (i14 != 0) {
                    if (i14 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                String string13 = resources.getString(R.string.common_unblock_user_successful);
                string13.getClass();
                bhc bhcVar13 = bhc.Short;
                this.c = 1;
                return nhc.c(this.d, string13, null, bhcVar13, this, 6) == tb2Var13 ? tb2Var13 : c1eVar;
            case 13:
                tb2 tb2Var14 = tb2.COROUTINE_SUSPENDED;
                int i15 = this.c;
                if (i15 != 0) {
                    if (i15 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                String string14 = resources.getString(R.string.common_unfollow_user_failed);
                string14.getClass();
                bhc bhcVar14 = bhc.Long;
                this.c = 1;
                return nhc.c(this.d, string14, null, bhcVar14, this, 6) == tb2Var14 ? tb2Var14 : c1eVar;
            case 14:
                tb2 tb2Var15 = tb2.COROUTINE_SUSPENDED;
                int i16 = this.c;
                if (i16 != 0) {
                    if (i16 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                String string15 = resources.getString(R.string.common_unmute_user_success);
                string15.getClass();
                bhc bhcVar15 = bhc.Short;
                this.c = 1;
                return nhc.c(this.d, string15, null, bhcVar15, this, 6) == tb2Var15 ? tb2Var15 : c1eVar;
            case 15:
                tb2 tb2Var16 = tb2.COROUTINE_SUSPENDED;
                int i17 = this.c;
                if (i17 != 0) {
                    if (i17 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                String string16 = resources.getString(R.string.common_block_user_successful);
                string16.getClass();
                bhc bhcVar16 = bhc.Short;
                this.c = 1;
                return nhc.c(this.d, string16, null, bhcVar16, this, 6) == tb2Var16 ? tb2Var16 : c1eVar;
            default:
                tb2 tb2Var17 = tb2.COROUTINE_SUSPENDED;
                int i18 = this.c;
                if (i18 != 0) {
                    if (i18 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                String string17 = resources.getString(R.string.common_mute_user_success);
                string17.getClass();
                bhc bhcVar17 = bhc.Short;
                this.c = 1;
                return nhc.c(this.d, string17, null, bhcVar17, this, 6) == tb2Var17 ? tb2Var17 : c1eVar;
        }
    }
}
