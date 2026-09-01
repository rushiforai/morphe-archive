package defpackage;

import android.app.PendingIntent;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import com.medium.android.core.navigation.EditPostReference;
import com.medium.android.core.navigation.NotificationFilterType;
import com.medium.android.core.susi.SusiDestination;
import com.medium.android.data.preferences.DarkMode;
import com.medium.android.donkey.write.EditPostFragment;
import com.medium.android.following.FollowingTab;
import com.medium.android.postpage.displaysettings.DisplaySettingsDialogFragment;
import com.medium.android.profile.ui.edit.pronouns.PronounsPickerDialogFragment;
import com.medium.android.susi.ui.magicLinkConfirmation.MagicLinkConfirmationFragment;
import com.medium.reader.R;
import com.userleap.Sprig;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class aq implements do4 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ aq(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.do4
    public final Object a(Object obj, n92 n92Var) throws PendingIntent.CanceledException {
        Object objG;
        String str;
        Object objD0;
        int i = this.a;
        int i2 = 2;
        int i3 = 3;
        int i4 = 1;
        n92 n92Var2 = null;
        c1e c1eVar = c1e.a;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                s26 s26Var = (s26) obj2;
                if (Build.VERSION.SDK_INT >= 34) {
                    v4.y(s26Var.i0(), (View) s26Var.b);
                }
                return c1eVar;
            case 1:
                Boolean bool = (Boolean) obj;
                if (g76.L(bool, Boolean.TRUE)) {
                    o08 o08Var = (o08) ((lig) obj2).c;
                    o08Var.getClass();
                    km4.I(wld.a, null, "App backgrounded, flushing pending events", new Object[0], "App backgrounded, flushing pending events");
                    vx0.c0(o08Var.a, null, null, new xi7(o08Var, n92Var2, i2), 3);
                } else if (!g76.L(bool, Boolean.FALSE) && bool != null) {
                    ygf.a();
                    return null;
                }
                return c1eVar;
            case 2:
                lk9 lk9Var = (lk9) obj;
                n0c n0cVar = ((gl2) obj2).c;
                if (!(lk9Var instanceof hk9) && !(lk9Var instanceof ik9)) {
                    if (lk9Var instanceof kk9) {
                        Object objC0 = n0cVar.c0(n92Var);
                        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                        Object obj3 = objC0 == tb2Var ? objC0 : c1eVar;
                        if (obj3 == tb2Var) {
                            return obj3;
                        }
                    } else {
                        if (!(lk9Var instanceof jk9)) {
                            ygf.a();
                            return null;
                        }
                        Object objC02 = n0cVar.c0(n92Var);
                        tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                        Object obj4 = objC02 == tb2Var2 ? objC02 : c1eVar;
                        if (obj4 == tb2Var2) {
                            return obj4;
                        }
                    }
                }
                return c1eVar;
            case 3:
                mu2 mu2Var = (mu2) obj2;
                return ((mu2Var.h.j() instanceof ai4) || (objG = mu2Var.g(true, n92Var)) != tb2.COROUTINE_SUSPENDED) ? c1eVar : objG;
            case 4:
                rj2 rj2Var = (rj2) obj;
                pz2 pz2Var = (pz2) obj2;
                if (rj2Var != null && (str = rj2Var.a) != null && pz2Var.u.a.b(nl4.ENABLE_SPRIG)) {
                    Sprig.INSTANCE.setUserIdentifier(str);
                }
                pz2Var.getClass();
                wld.a.a("Current user profile changed; clearing Apollo store.", new Object[0]);
                zw2 zw2Var = (zw2) gr7.m(pz2Var.e);
                zw2Var.g.N(new nh2(2, zw2Var));
                return c1eVar;
            case 5:
                kh3 kh3Var = (kh3) obj;
                DisplaySettingsDialogFragment displaySettingsDialogFragment = ((ah3) obj2).b;
                if (kh3Var instanceof jh3) {
                    displaySettingsDialogFragment.Q().getTheme().applyStyle(mk7.x(((jh3) kh3Var).a), true);
                } else if (kh3Var instanceof hh3) {
                    DarkMode darkMode = ((hh3) kh3Var).a;
                    k40.X(displaySettingsDialogFragment).f();
                    t10.k(darkMode.getValue());
                } else {
                    if (!g76.L(kh3Var, ih3.a)) {
                        ygf.a();
                        return null;
                    }
                    k40.X(displaySettingsDialogFragment).f();
                }
                return c1eVar;
            case 6:
                if (g76.L((Boolean) obj, Boolean.TRUE)) {
                    EditPostFragment editPostFragment = (EditPostFragment) obj2;
                    int i5 = EditPostFragment.Q0;
                    xq3 xq3Var = editPostFragment.j1().x;
                    if (xq3Var != null && !(((or3) xq3Var.m) instanceof nr3)) {
                        xq3Var.a();
                        enc encVar = editPostFragment.J0;
                        if (encVar != null) {
                            encVar.m(null);
                        }
                        editPostFragment.J0 = vx0.c0(o7f.x(editPostFragment), null, null, new eq3(xq3Var, editPostFragment, n92Var2, i2), 3);
                    }
                }
                return c1eVar;
            case 7:
                List list = (List) obj;
                if (list != null) {
                    ju3 ju3Var = (ju3) obj2;
                    vx0.c0(f76.F(ju3Var), null, null, new xs3(ju3Var, list, n92Var2, i3), 3);
                }
                return c1eVar;
            case 8:
                return b((String) obj, n92Var);
            case 9:
                ((Collection) obj2).add(obj);
                return c1eVar;
            case 10:
                Object objA = ((wq4) obj2).a(obj, n92Var);
                return objA == tb2.COROUTINE_SUSPENDED ? objA : c1eVar;
            case 11:
                rd1 rd1Var = (rd1) obj;
                mv4 mv4Var = ((xv4) obj2).h;
                if (rd1Var instanceof kd1) {
                    Object objD02 = mv4Var.c.d0(new mb(((kd1) rd1Var).a, 23), n92Var);
                    tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                    Object obj5 = objD02 == tb2Var3 ? objD02 : c1eVar;
                    if (obj5 == tb2Var3) {
                        return obj5;
                    }
                } else if ((rd1Var instanceof ld1) || (rd1Var instanceof pd1)) {
                    Object objC03 = mv4Var.c.c0(n92Var);
                    tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                    Object obj6 = objC03 == tb2Var4 ? objC03 : c1eVar;
                    if (obj6 == tb2Var4) {
                        return obj6;
                    }
                } else if (!(rd1Var instanceof jd1) && !(rd1Var instanceof qd1) && !(rd1Var instanceof md1) && !(rd1Var instanceof nd1) && !(rd1Var instanceof od1)) {
                    ygf.a();
                    return null;
                }
                return c1eVar;
            case 12:
                ay4 ay4Var = (ay4) obj2;
                FollowingTab followingTab = (FollowingTab) ((i04) FollowingTab.getEntries()).get(((Number) obj).intValue());
                ay4Var.getClass();
                followingTab.getClass();
                ay4Var.b.c.d("selected_tab", followingTab);
                return c1eVar;
            case 13:
                int i6 = g45.a[((j45) obj).ordinal()];
                if (i6 == 1) {
                    ((i45) obj2).l();
                } else if (i6 != 2) {
                    ygf.a();
                    return null;
                }
                return c1eVar;
            case 14:
                Object objC04 = ((xc5) obj2).d.c0(n92Var);
                tb2 tb2Var5 = tb2.COROUTINE_SUSPENDED;
                if (objC04 != tb2Var5) {
                    objC04 = c1eVar;
                }
                return objC04 == tb2Var5 ? objC04 : c1eVar;
            case 15:
                mf9 mf9Var = (mf9) obj;
                vl5 vl5Var = ((dm5) obj2).b;
                if (mf9Var instanceof ff9) {
                    objD0 = vl5Var.c.c0(n92Var);
                    tb2 tb2Var6 = tb2.COROUTINE_SUSPENDED;
                    if (objD0 != tb2Var6) {
                        objD0 = c1eVar;
                    }
                    if (objD0 != tb2Var6) {
                        return c1eVar;
                    }
                } else {
                    if (!(mf9Var instanceof gf9)) {
                        return c1eVar;
                    }
                    objD0 = vl5Var.c.d0(new mb(((gf9) mf9Var).b, 26), n92Var);
                    tb2 tb2Var7 = tb2.COROUTINE_SUSPENDED;
                    if (objD0 != tb2Var7) {
                        objD0 = c1eVar;
                    }
                    if (objD0 != tb2Var7) {
                        return c1eVar;
                    }
                }
                return objD0;
            case 16:
                ((m45) obj2).invoke();
                return c1eVar;
            case 17:
                ((ibd) obj2).invoke();
                return c1eVar;
            case 18:
                qd7 qd7Var = (qd7) obj;
                MagicLinkConfirmationFragment magicLinkConfirmationFragment = ((hd7) obj2).a;
                if (qd7Var instanceof md7) {
                    String str2 = ((md7) qd7Var).a;
                    str2.getClass();
                    ((p13) magicLinkConfirmationFragment.Z()).m(magicLinkConfirmationFragment.S(), str2, false);
                    magicLinkConfirmationFragment.Q().finish();
                } else if (qd7Var instanceof nd7) {
                    nd7 nd7Var = (nd7) qd7Var;
                    SusiDestination susiDestination = nd7Var.a;
                    String str3 = nd7Var.b;
                    str3.getClass();
                    ((p13) magicLinkConfirmationFragment.Z()).o(magicLinkConfirmationFragment.S(), str3, susiDestination);
                    magicLinkConfirmationFragment.Q().finish();
                } else if (qd7Var instanceof od7) {
                    od7 od7Var = (od7) qd7Var;
                    String str4 = od7Var.b;
                    String str5 = od7Var.a;
                    SusiDestination susiDestination2 = od7Var.c;
                    String str6 = od7Var.d;
                    str6.getClass();
                    lig ligVar = magicLinkConfirmationFragment.u0;
                    if (ligVar == null) {
                        g76.g0("susiRouter");
                        throw null;
                    }
                    b09.T(ligVar, str6, str4 == null ? "" : str4, str5 == null ? "" : str5, susiDestination2, false, 16);
                } else {
                    if (!(qd7Var instanceof pd7)) {
                        ygf.a();
                        return null;
                    }
                    pd7 pd7Var = (pd7) qd7Var;
                    SusiDestination susiDestination3 = pd7Var.a;
                    String str7 = pd7Var.b;
                    str7.getClass();
                    if (susiDestination3.equals(SusiDestination.Search.INSTANCE)) {
                        ((p13) magicLinkConfirmationFragment.Z()).F(magicLinkConfirmationFragment.S(), str7, true);
                    } else if (susiDestination3.equals(SusiDestination.NewStory.INSTANCE)) {
                        b09.K(magicLinkConfirmationFragment.Z(), magicLinkConfirmationFragment.S(), EditPostReference.NewPost.INSTANCE, str7);
                    } else if (susiDestination3 instanceof SusiDestination.Deeplink) {
                        py2 py2Var = magicLinkConfirmationFragment.v0;
                        if (py2Var == null) {
                            g76.g0("deepLinkHandler");
                            throw null;
                        }
                        py2Var.a(magicLinkConfirmationFragment.S(), Uri.parse(((SusiDestination.Deeplink) susiDestination3).getUrl()), str7, null);
                    } else {
                        if (!(susiDestination3 instanceof SusiDestination.Post)) {
                            ygf.a();
                            return null;
                        }
                        b09.O(magicLinkConfirmationFragment.Z(), magicLinkConfirmationFragment.S(), ((SusiDestination.Post) susiDestination3).getId(), str7, null, null, null, 120);
                    }
                    magicLinkConfirmationFragment.Q().finish();
                }
                return c1eVar;
            case 19:
                ((b48) obj2).c.h(((Number) obj).floatValue());
                return c1eVar;
            case 20:
                ((m98) obj2).w.a(new kce(((Boolean) ((f09) obj).b).booleanValue()), n92Var);
                return c1eVar;
            case 21:
                vk8 vk8Var = (vk8) obj2;
                NotificationFilterType notificationFilterType = (NotificationFilterType) ((i04) NotificationFilterType.getEntries()).get(((Number) obj).intValue());
                vk8Var.getClass();
                notificationFilterType.getClass();
                nl8 nl8Var = vk8Var.b;
                if (((i04) NotificationFilterType.getEntries()).contains(notificationFilterType)) {
                    nl8Var.e.d("selectedFilter", notificationFilterType);
                }
                return c1eVar;
            case 22:
                h49 h49Var = (h49) obj2;
                int i7 = jj9.b;
                h49Var.h(h49Var.g() + 1);
                return c1eVar;
            case 23:
                y24 y24Var = (y24) obj;
                lo9 lo9Var = (lo9) obj2;
                if (y24Var instanceof o24) {
                    lo9Var.c(((o24) y24Var).a ? R.string.common_block_author_successful : R.string.common_unblock_author_successful, bhc.Short);
                } else if (y24Var instanceof n24) {
                    lo9Var.c(((n24) y24Var).a ? R.string.common_block_author_failed : R.string.common_unblock_author_failed, bhc.Long);
                } else if (y24Var instanceof u24) {
                    lo9Var.c(R.string.responses_hidden_success, bhc.Short);
                } else if (y24Var instanceof t24) {
                    lo9Var.c(R.string.responses_hidden_failed, bhc.Long);
                } else if (y24Var instanceof w24) {
                    lo9Var.c(((w24) y24Var).a ? R.string.responses_locked_success : R.string.responses_unlocked_success, bhc.Short);
                } else if (y24Var instanceof v24) {
                    lo9Var.c(((v24) y24Var).a ? R.string.responses_locked_failed : R.string.responses_unlocked_failed, bhc.Long);
                } else if (y24Var instanceof p24) {
                    lo9Var.c(R.string.response_delete_failed, bhc.Long);
                } else if (y24Var instanceof s24) {
                    lo9Var.c(f49.B(((s24) y24Var).b), bhc.Long);
                } else if (y24Var instanceof x24) {
                    lo9Var.c(R.string.common_undo_claps_failure, bhc.Long);
                } else if (y24Var instanceof q24) {
                    lo9Var.c(R.string.response_post_hide_failed, bhc.Long);
                } else {
                    if (!(y24Var instanceof r24)) {
                        ygf.a();
                        return null;
                    }
                    lo9Var.c(R.string.response_post_hide_success, bhc.Short);
                }
                return c1eVar;
            case 24:
                zdb zdbVar = (zdb) obj;
                sye syeVar = ((ko9) obj2).f;
                if (zdbVar instanceof xdb) {
                    Object objC = syeVar.c(((xdb) zdbVar).a, n92Var);
                    if (objC == tb2.COROUTINE_SUSPENDED) {
                        return objC;
                    }
                } else {
                    if (!(zdbVar instanceof ydb)) {
                        ygf.a();
                        return null;
                    }
                    Object objJ = syeVar.j(n92Var);
                    if (objJ == tb2.COROUTINE_SUSPENDED) {
                        return objJ;
                    }
                }
                return c1eVar;
            case 25:
                k4a k4aVar = (k4a) obj;
                if (!(k4aVar instanceof k4a)) {
                    ygf.a();
                    return null;
                }
                List list2 = k4aVar.a;
                list2.getClass();
                PronounsPickerDialogFragment pronounsPickerDialogFragment = (PronounsPickerDialogFragment) ((gg5) obj2).b;
                db8 db8VarX = k40.X(pronounsPickerDialogFragment);
                Bundle bundle = new Bundle();
                bundle.putStringArrayList("pronouns_picker_result", new ArrayList<>(list2));
                qo7.A(db8VarX, bundle);
                k40.X(pronounsPickerDialogFragment).f();
                return c1eVar;
            case 26:
                ((Boolean) obj).getClass();
                ((e9a) obj2).c();
                return c1eVar;
            case 27:
                zdb zdbVar2 = (zdb) obj;
                b0f b0fVar = ((nib) obj2).I;
                if (zdbVar2 instanceof xdb) {
                    Object objC2 = b0fVar.c(((xdb) zdbVar2).a, n92Var);
                    if (objC2 == tb2.COROUTINE_SUSPENDED) {
                        return objC2;
                    }
                } else {
                    if (!(zdbVar2 instanceof ydb)) {
                        ygf.a();
                        return null;
                    }
                    Object objJ2 = b0fVar.j(n92Var);
                    if (objJ2 == tb2.COROUTINE_SUSPENDED) {
                        return objJ2;
                    }
                }
                return c1eVar;
            case 28:
                iub iubVar = (iub) ((i04) iub.getEntries()).get(((Number) obj).intValue());
                iubVar.getClass();
                ((hub) obj2).b.f.d("current_tab", iubVar);
                return c1eVar;
            default:
                j6c j6cVar = (j6c) obj2;
                if (((Boolean) obj).booleanValue()) {
                    vx0.c0(f76.F(j6cVar), null, null, new i6c(j6cVar, n92Var2, i2), 3);
                } else {
                    vx0.c0(f76.F(j6cVar), null, null, new i6c(j6cVar, n92Var2, i4), 3);
                }
                return c1eVar;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object b(java.lang.String r9, defpackage.n92 r10) {
        /*
            r8 = this;
            java.lang.Object r0 = r8.b
            uc4 r0 = (defpackage.uc4) r0
            boolean r1 = r10 instanceof defpackage.cc4
            if (r1 == 0) goto L17
            r1 = r10
            cc4 r1 = (defpackage.cc4) r1
            int r2 = r1.e
            r3 = -2147483648(0xffffffff80000000, float:-0.0)
            r4 = r2 & r3
            if (r4 == 0) goto L17
            int r2 = r2 - r3
            r1.e = r2
            goto L1c
        L17:
            cc4 r1 = new cc4
            r1.<init>(r8, r10)
        L1c:
            java.lang.Object r8 = r1.c
            tb2 r10 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r1.e
            r3 = 0
            c1e r4 = defpackage.c1e.a
            r5 = 2
            r6 = 1
            if (r2 == 0) goto L3d
            if (r2 == r6) goto L37
            if (r2 != r5) goto L31
            defpackage.br7.v(r8)
            goto L74
        L31:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            return r3
        L37:
            java.lang.String r9 = r1.b
            defpackage.br7.v(r8)
            goto L5a
        L3d:
            defpackage.br7.v(r8)
            bc4 r8 = r0.l
            mb r2 = new mb
            r7 = 18
            r2.<init>(r9, r7)
            r1.b = r9
            r1.e = r6
            n0c r8 = r8.b
            java.lang.Object r8 = r8.d0(r2, r1)
            if (r8 != r10) goto L56
            goto L57
        L56:
            r8 = r4
        L57:
            if (r8 != r10) goto L5a
            goto L73
        L5a:
            bc4 r8 = r0.n
            mb r0 = new mb
            r2 = 19
            r0.<init>(r9, r2)
            r1.b = r3
            r1.e = r5
            n0c r8 = r8.b
            java.lang.Object r8 = r8.d0(r0, r1)
            if (r8 != r10) goto L70
            goto L71
        L70:
            r8 = r4
        L71:
            if (r8 != r10) goto L74
        L73:
            return r10
        L74:
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.aq.b(java.lang.String, n92):java.lang.Object");
    }
}
