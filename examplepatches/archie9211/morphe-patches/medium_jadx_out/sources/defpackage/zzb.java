package defpackage;

import android.app.PendingIntent;
import android.graphics.drawable.Drawable;
import com.medium.android.core.models.BillingPeriod;
import com.medium.android.core.share.RepostShareData;
import com.medium.android.donkey.susi.SusiActivity;
import com.medium.android.settings.main.SettingsFragment;
import com.medium.android.tag.tagpage.TagFragment;
import com.medium.android.yourfollowingfeed.ui.FollowedType;
import com.medium.android.yourlibrary.YourLibraryTab;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class zzb implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ zzb(zzb zzbVar, hgb hgbVar) {
        this.a = 14;
        this.b = zzbVar;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) throws PendingIntent.CanceledException {
        int i = this.a;
        n92 n92Var = null;
        int i2 = 1;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                a0c a0cVar = (a0c) obj2;
                int iIntValue = ((Integer) obj).intValue();
                return a0cVar.e[iIntValue] + ": " + a0cVar.f[iIntValue].a();
            case 1:
                as2 as2Var = (as2) obj;
                as2Var.getClass();
                String referrerSource = ((SettingsFragment.BundleInfo) ((SettingsFragment) obj2).y0.getValue()).getReferrerSource();
                eo2 eo2Var = as2Var.a;
                ko2 ko2Var = eo2Var.b;
                l2c l2cVarU = ko2Var.u();
                dm4 dm4Var = (dm4) ko2Var.j.get();
                pz2 pz2Var = (pz2) ko2Var.H.get();
                yx2 yx2VarL = ko2Var.l();
                mya myaVarA = ko2Var.A();
                ys2 ys2Var = (ys2) eo2Var.e;
                bye byeVar = new bye((zk2) ys2Var.b.r.get());
                wjc wjcVarY = ys2Var.y();
                ko2 ko2Var2 = ys2Var.b;
                z32 z32Var = new z32(wjcVarY, (zk2) ko2Var2.r.get(), 0);
                v32 v32Var = new v32(ys2Var.y(), (zk2) ko2Var2.r.get(), 1);
                v32 v32Var2 = new v32(ys2Var.y(), (zk2) ko2Var2.r.get(), 0);
                z32 z32Var2 = new z32(ys2Var.y(), (zk2) ko2Var2.r.get(), 1);
                cr0 cr0Var = (cr0) ko2Var.I.get();
                zxc zxcVarB = ys2Var.B();
                ub5 ub5VarL = ys2Var.l();
                ax2 ax2Var = new ax2(ko2Var.x(), 3);
                zk2 zk2Var = (zk2) ko2Var.r.get();
                sh2 sh2VarO = ys2Var.o();
                ax2 ax2VarT = ko2Var.t();
                slc slcVar = (slc) ko2Var.G.get();
                r13 r13Var = xg3.a;
                iq7.s(r13Var);
                return new f3c(referrerSource, l2cVarU, dm4Var, pz2Var, yx2VarL, myaVarA, byeVar, z32Var, v32Var, v32Var2, z32Var2, cr0Var, zxcVarB, ub5VarL, ax2Var, zk2Var, sh2VarO, ax2VarT, slcVar, r13Var);
            case 2:
                ((ok6) obj).getClass();
                wac wacVar = ((eac) obj2).b;
                vx0.c0(f76.F(wacVar), null, null, new uac(wacVar, n92Var, i2), 3);
                return c1e.a;
            case 3:
                ((ok6) obj).getClass();
                sdc sdcVar = ((cbc) obj2).b;
                vx0.c0(f76.F(sdcVar), null, null, new qdc(sdcVar, n92Var, 2), 3);
                return c1e.a;
            case 4:
                vec vecVar = (vec) obj2;
                xyb xybVar = vecVar.g;
                xybVar.getClass();
                if (!g76.L(vecVar.g, xybVar)) {
                    xx9.b("Requested a SingleSubscriptionSnapshotFlowManager to manage multiple subscriptions");
                }
                g78 g78Var = vecVar.f;
                Object obj3 = vecVar.d;
                if (g78Var != null) {
                    if (obj3 != null) {
                        xx9.b("workingSoleWatchedObject must be null when workingWatchSet is non-null");
                    }
                    g78Var.a(obj);
                } else if (obj3 == null) {
                    vecVar.d = obj;
                } else {
                    g78 g78Var2 = iqb.a;
                    g78 g78Var3 = new g78();
                    g78Var3.a(obj3);
                    g78Var3.a(obj);
                    vecVar.f = g78Var3;
                    vecVar.d = null;
                }
                return c1e.a;
            case 5:
                return Boolean.valueOf(g76.L(((k94) obj).a, (jhc) obj2));
            case 6:
                return Boolean.valueOf(g76.L(((j94) obj).a, (ihc) obj2));
            case 7:
                gjc gjcVar = (gjc) obj2;
                synchronized (gjcVar.g) {
                    fjc fjcVar = gjcVar.i;
                    fjcVar.getClass();
                    Object obj4 = fjcVar.b;
                    obj4.getClass();
                    int i3 = fjcVar.d;
                    t68 t68Var = fjcVar.c;
                    if (t68Var == null) {
                        t68Var = new t68();
                        fjcVar.c = t68Var;
                        fjcVar.f.m(obj4, t68Var);
                    }
                    fjcVar.b(obj, i3, obj4, t68Var);
                }
                return c1e.a;
            case 8:
                return Boolean.valueOf(((szc) obj).d != ((BillingPeriod) obj2));
            case 9:
                ns2 ns2Var = (ns2) obj;
                int i4 = SusiActivity.v;
                ns2Var.getClass();
                String str = (String) ((SusiActivity) obj2).t.getValue();
                ko2 ko2Var3 = ns2Var.a.b;
                return new a4d(str, (zk2) ko2Var3.r.get(), (n32) ko2Var3.q.get(), (w50) ko2Var3.L.get());
            case 10:
                vw vwVar = (vw) obj;
                ((b55) obj2).invoke(vwVar.e.getValue(), d46.i.b.invoke(vwVar.f));
                return c1e.a;
            case 11:
                rg1 rg1Var = (rg1) obj;
                String str2 = rg1Var.a;
                String str3 = rg1Var.n;
                str2.getClass();
                TagFragment tagFragment = ((u8d) obj2).a;
                ((p13) tagFragment.Z()).w0(tagFragment.S(), str2, str3);
                return c1e.a;
            case 12:
                Drawable drawable = (Drawable) obj2;
                zl3 zl3Var = (zl3) obj;
                e61 e61VarX = zl3Var.b0().x();
                drawable.setBounds(0, 0, (int) Float.intBitsToFloat((int) (zl3Var.f() >> 32)), (int) Float.intBitsToFloat((int) (zl3Var.f() & 4294967295L)));
                drawable.draw(qm.a(e61VarX));
                return c1e.a;
            case 13:
                ((x45) obj).invoke((ugd) obj2);
                return c1e.a;
            case 14:
                zzb zzbVar = (zzb) obj2;
                ssd ssdVar = (ssd) obj;
                if (ssdVar instanceof xa) {
                    zzbVar.invoke(((xa) ssdVar).o);
                    return Boolean.TRUE;
                }
                ygf.f("TextContextMenuDataNode.TraverseKey key must only be attached to instances of TextContextMenuDataNode.");
                return null;
            case 15:
                eid eidVar = (eid) obj2;
                float fFloatValue = ((Float) obj).floatValue();
                g49 g49Var = eidVar.a;
                float fG = g49Var.g() + fFloatValue;
                g49 g49Var2 = eidVar.b;
                if (fG > g49Var2.g()) {
                    fFloatValue = g49Var2.g() - g49Var.g();
                } else if (fG < 0.0f) {
                    fFloatValue = -g49Var.g();
                }
                g49Var.h(g49Var.g() + fFloatValue);
                return Float.valueOf(fFloatValue);
            case 16:
                return (hp6) ((nod) obj2).a.invoke();
            case 17:
                if9 if9Var = (if9) obj2;
                j8b j8bVar = (j8b) obj;
                j8bVar.getClass();
                dr9 dr9Var = j8bVar.i;
                if (!dr9Var.a.equals(if9Var.a)) {
                    return j8bVar;
                }
                String str4 = if9Var.b;
                i8b i8bVar = j8bVar.k;
                i8b i8bVar2 = new i8b(str4 != null, str4 != null, str4 == null, i8bVar.d, i8bVar.e, i8bVar.f, i8bVar.g, i8bVar.h, i8bVar.i, i8bVar.j);
                String str5 = j8bVar.a;
                String str6 = j8bVar.b;
                String str7 = j8bVar.c;
                String str8 = j8bVar.d;
                boolean z = j8bVar.e;
                boolean z2 = j8bVar.f;
                Long l = j8bVar.g;
                RepostShareData repostShareData = j8bVar.j;
                str5.getClass();
                str6.getClass();
                return new j8b(str5, str6, str7, str8, z, z2, l, str4, dr9Var, repostShareData, i8bVar2);
            case 18:
                c8f c8fVar = (c8f) obj2;
                anb anbVar = (anb) obj;
                anbVar.getClass();
                gnb gnbVarB0 = anbVar.B0("UPDATE OR ABORT `WorkSpec` SET `id` = ?,`state` = ?,`worker_class_name` = ?,`input_merger_class_name` = ?,`input` = ?,`output` = ?,`initial_delay` = ?,`interval_duration` = ?,`flex_duration` = ?,`run_attempt_count` = ?,`backoff_policy` = ?,`backoff_delay_duration` = ?,`last_enqueue_time` = ?,`minimum_retention_duration` = ?,`schedule_requested_at` = ?,`run_in_foreground` = ?,`out_of_quota_policy` = ?,`period_count` = ?,`generation` = ?,`next_schedule_time_override` = ?,`next_schedule_time_override_generation` = ?,`stop_reason` = ?,`trace_tag` = ?,`backoff_on_system_interruptions` = ?,`required_network_type` = ?,`required_network_request` = ?,`requires_charging` = ?,`requires_device_idle` = ?,`requires_battery_not_low` = ?,`requires_storage_not_low` = ?,`trigger_content_update_delay` = ?,`trigger_max_content_delay` = ?,`content_uri_triggers` = ? WHERE `id` = ?");
                try {
                    jzb.f(gnbVarB0, c8fVar);
                    gnbVarB0.w0();
                    xz5.F(gnbVarB0, null);
                    dl7.s(anbVar);
                    return c1e.a;
                } catch (Throwable th) {
                    try {
                        throw th;
                    } catch (Throwable th2) {
                        xz5.F(gnbVarB0, th);
                        throw th2;
                    }
                }
            case 19:
                q53 q53Var = (q53) obj;
                q53Var.getClass();
                ((md3) obj2).A(q53Var.c, q53Var.a, q53Var.b, true);
                return c1e.a;
            case 20:
                FollowedType followedType = (FollowedType) obj;
                followedType.getClass();
                ((ddf) obj2).a.c.d("selected_followed_type", followedType);
                return c1e.a;
            default:
                cp2 cp2Var = (cp2) obj;
                cp2Var.getClass();
                return new eff((YourLibraryTab) obj2, ((ys2) cp2Var.a.e).a);
        }
    }

    public /* synthetic */ zzb(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    public /* synthetic */ zzb(g8f g8fVar, c8f c8fVar) {
        this.a = 18;
        this.b = c8fVar;
    }
}
