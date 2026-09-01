package defpackage;

import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import com.medium.android.core.navigation.NotificationFilterType;
import com.medium.android.postpublishing.ui.TopicData;
import com.medium.android.reportpost.ui.ReportPostDialogFragment;
import com.medium.android.reportresponse.ui.ReportResponseDialogFragment;
import com.medium.android.reportresponse.ui.ReportResponseReference;
import com.medium.android.reportuser.ui.ReportUserDialogFragment;
import com.medium.refinerecommendations.RefineRecommendationsTab;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.CancellationException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class eb8 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ eb8(lz8 lz8Var, xrb xrbVar) {
        this.a = 4;
        this.b = lz8Var;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        kx6 kx6Var;
        int i = this.a;
        char c = 1;
        Object objInvoke = null;
        Object[] objArr = 0;
        Object[] objArr2 = 0;
        Object[] objArr3 = 0;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                db8 db8VarR = yo7.r((Context) obj2);
                db8VarR.g((Bundle) obj);
                return db8VarR;
            case 1:
                vk8 vk8Var = (vk8) obj2;
                NotificationFilterType notificationFilterType = (NotificationFilterType) ((i04) NotificationFilterType.getEntries()).get(((Integer) obj).intValue());
                vk8Var.getClass();
                notificationFilterType.getClass();
                nl8 nl8Var = vk8Var.b;
                if (((i04) NotificationFilterType.getEntries()).contains(notificationFilterType)) {
                    nl8Var.e.d("selectedFilter", notificationFilterType);
                }
                return c1e.a;
            case 2:
                xne xneVar = (xne) obj;
                bt4 bt4Var = bt4.FOLLOWING;
                String str = ((m7e) obj2).a;
                return xne.a(xneVar, bt4Var, str != null ? new bg8(str) : xneVar.g, 159);
            case 3:
                return xne.a((xne) obj, null, new bg8(((v7e) obj2).a), 191);
            case 4:
                float fFloatValue = ((Float) obj).floatValue();
                gz8 gz8Var = ((lz8) obj2).b;
                gz8Var.q.h(gz8Var.j(gz8Var.k() + nk7.w0(gz8Var.q() != 0 ? fFloatValue / gz8Var.q() : 0.0f)));
                return c1e.a;
            case 5:
                Uri uri = (Uri) obj;
                uri.getClass();
                n39 n39Var = ((r19) obj2).c;
                f09 f09VarA = j07.a(n39Var.d);
                LinkedHashMap linkedHashMapS = ei7.S((Map) f09VarA.a, (Map) f09VarA.b);
                ev9 ev9Var = n39Var.f;
                Uri uri2 = (Uri) linkedHashMapS.get(uri.toString());
                if (uri2 != null) {
                    uri = uri2;
                }
                ev9Var.a(uri);
                return c1e.a;
            case 6:
                jb9 jb9Var = (jb9) obj2;
                int iIntValue = ((Integer) obj).intValue();
                return jb9Var.e[iIntValue] + ": " + jb9Var.h(iIntValue).a();
            case 7:
                ki9 ki9Var = (ki9) obj2;
                float fFloatValue2 = ((Float) obj).floatValue();
                float f = ki9Var.b;
                ki9Var.b = fFloatValue2;
                g49 g49Var = ki9Var.a;
                if (fFloatValue2 <= f || f <= 0.0f || g49Var.g() < f) {
                    fFloatValue2 = iq7.u(g49Var.g(), 0.0f, fFloatValue2);
                }
                g49Var.h(fFloatValue2);
                return c1e.a;
            case 8:
                ((String) obj).getClass();
                xvb xvbVar = (xvb) ((que) obj2);
                xvbVar.c.invoke(xvbVar.b);
                return c1e.a;
            case 9:
                fha fhaVar = (fha) obj2;
                tga tgaVar = (tga) obj;
                tgaVar.getClass();
                fhaVar.getClass();
                vx0.c0(f76.F(fhaVar), null, null, new nx9(fhaVar, tgaVar, objArr == true ? 1 : 0, 10), 3);
                return c1e.a;
            case 10:
                TopicData topicData = (TopicData) obj;
                topicData.getClass();
                wea weaVar = (wea) ((a1a) obj2).b;
                weaVar.getClass();
                vx0.c0(f76.F(weaVar), null, null, new tea(weaVar, topicData, objArr2 == true ? 1 : 0, c == true ? 1 : 0), 3);
                return c1e.a;
            case 11:
                String str2 = (String) obj;
                str2.getClass();
                rja rjaVar = ((qia) obj2).a;
                vx0.c0(f76.F(rjaVar), null, null, new nx9(rjaVar, str2, objArr3 == true ? 1 : 0, 14), 3);
                return c1e.a;
            case 12:
                mn4 mn4Var = (mn4) obj2;
                jyb jybVar = (jyb) obj;
                if (mn4Var.invoke() > 0.0f) {
                    gyb.f(jybVar, new k3a(mn4Var.invoke(), new hp1(0.0f, 1.0f)));
                }
                return c1e.a;
            case 13:
                ((q22) obj2).y(obj);
                return c1e.a;
            case 14:
                swa swaVar = (swa) obj2;
                Throwable th = (Throwable) obj;
                CancellationException cancellationException = new CancellationException("Recomposer effect job completed");
                cancellationException.initCause(th);
                synchronized (swaVar.c) {
                    try {
                        va6 va6Var = swaVar.d;
                        if (va6Var != null) {
                            swaVar.u.l(pwa.ShuttingDown);
                            va6Var.m(cancellationException);
                            swaVar.r = null;
                            va6Var.R(new pda(swaVar, 6, th));
                        } else {
                            swaVar.e = cancellationException;
                            swaVar.u.l(pwa.ShutDown);
                        }
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
                return c1e.a;
            case 15:
                ((xwa) obj2).a((fp3) obj);
                return c1e.a;
            case 16:
                ((c0b) obj2).b.l(((i04) RefineRecommendationsTab.getEntries()).get(((Integer) obj).intValue()));
                return c1e.a;
            case 17:
                sr2 sr2Var = (sr2) obj;
                sr2Var.getClass();
                vq6 vq6Var = ((ReportPostDialogFragment) obj2).J0;
                String postId = ((ReportPostDialogFragment.BundleInfo) vq6Var.getValue()).getPostId();
                String authorId = ((ReportPostDialogFragment.BundleInfo) vq6Var.getValue()).getAuthorId();
                String referrerSource = ((ReportPostDialogFragment.BundleInfo) vq6Var.getValue()).getReferrerSource();
                ys2 ys2Var = (ys2) sr2Var.a.e;
                ko2 ko2Var = ys2Var.b;
                return new v5b(postId, authorId, referrerSource, new p5b((gn9) ko2Var.u.get(), ko2Var.q()), ys2Var.a);
            case 18:
                Boolean bool = (Boolean) obj;
                bool.getClass();
                ((k5b) obj2).a.g0().f.d("block_author", bool);
                return c1e.a;
            case 19:
                Boolean bool2 = (Boolean) obj;
                bool2.getClass();
                ((e6b) obj2).b.e.d("block_user", bool2);
                return c1e.a;
            case 20:
                ur2 ur2Var = (ur2) obj;
                ur2Var.getClass();
                vq6 vq6Var2 = ((ReportResponseDialogFragment) obj2).J0;
                ReportResponseReference reportResponseReference = ((ReportResponseDialogFragment.BundleInfo) vq6Var2.getValue()).getReportResponseReference();
                String authorId2 = ((ReportResponseDialogFragment.BundleInfo) vq6Var2.getValue()).getAuthorId();
                String referrerSource2 = ((ReportResponseDialogFragment.BundleInfo) vq6Var2.getValue()).getReferrerSource();
                ys2 ys2Var2 = (ys2) ur2Var.a.e;
                ko2 ko2Var2 = ys2Var2.b;
                t6b t6bVar = new t6b((nfb) ko2Var2.V.get(), ko2Var2.r());
                ko2 ko2Var3 = ys2Var2.b;
                return new a7b(reportResponseReference, authorId2, referrerSource2, t6bVar, new gg5((nfb) ko2Var3.V.get(), ko2Var3.r()), ys2Var2.m(), ys2Var2.a);
            case 21:
                vr2 vr2Var = (vr2) obj;
                vr2Var.getClass();
                vq6 vq6Var3 = ((ReportUserDialogFragment) obj2).J0;
                String userId = ((ReportUserDialogFragment.BundleInfo) vq6Var3.getValue()).getUserId();
                String referrerSource3 = ((ReportUserDialogFragment.BundleInfo) vq6Var3.getValue()).getReferrerSource();
                ys2 ys2Var3 = (ys2) vr2Var.a.e;
                return new o7b(userId, referrerSource3, new j7b(ys2Var3.N(), ys2Var3.b.z()), ys2Var3.a);
            case 22:
                Boolean bool3 = (Boolean) obj;
                bool3.getClass();
                ((c7b) obj2).a.g0().e.d("block_user", bool3);
                return c1e.a;
            case 23:
                z25 z25Var = (z25) obj;
                z25Var.getClass();
                ((w73) obj2).i = z25Var;
                return c1e.a;
            case 24:
                ((tu2) obj).getClass();
                ((elb) obj2).getClass();
                throw new ei8(0);
            case 25:
                qob qobVar = ((oob) obj2).c;
                return Boolean.valueOf(qobVar != null ? qobVar.a(obj) : true);
            case 26:
                mya myaVar = (mya) obj2;
                l78 l78Var = (l78) obj;
                if (!(l78Var instanceof yic)) {
                    ay0.e("Failed requirement.");
                    return null;
                }
                yic yicVar = (yic) l78Var;
                if (yicVar.getValue() != null) {
                    Object value = yicVar.getValue();
                    value.getClass();
                    objInvoke = ((x45) myaVar.c).invoke(value);
                }
                ajc ajcVarB = yicVar.b();
                ajcVarB.getClass();
                return new k49(objInvoke, ajcVarB);
            case 27:
                yrb yrbVar = (yrb) obj2;
                float fFloatValue3 = ((Float) obj).floatValue();
                h49 h49Var = yrbVar.a;
                float fG = h49Var.g() + fFloatValue3 + yrbVar.f;
                float fU = iq7.u(fG, 0.0f, yrbVar.e.g());
                z = fG == fU;
                float fG2 = fU - h49Var.g();
                int iRound = Math.round(fG2);
                h49Var.h(h49Var.g() + iRound);
                yrbVar.f = fG2 - iRound;
                if (!z) {
                    fFloatValue3 = fG2;
                }
                return Float.valueOf(fFloatValue3);
            case 28:
                vsb vsbVar = (vsb) obj2;
                return new ip8(vsbVar.c(vsbVar.k, ((ip8) obj).a, vsbVar.j));
            default:
                o72 o72Var = (o72) obj2;
                rb9 rb9Var = (rb9) obj;
                long j = rb9Var.c;
                lid lidVar = (lid) o72Var.d;
                if (lidVar.i() && lidVar.l().a.b.length() != 0 && (kx6Var = lidVar.d) != null && kx6Var.d() != null) {
                    o72Var.g(lidVar.l(), j, false, u3b.i);
                    z = true;
                }
                if (z) {
                    rb9Var.a();
                }
                return c1e.a;
        }
    }

    public /* synthetic */ eb8(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }
}
