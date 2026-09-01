package defpackage;

import android.app.PendingIntent;
import android.content.Context;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Bundle;
import com.medium.android.core.navigation.EditPostReference;
import com.medium.android.core.susi.SusiDestination;
import com.medium.android.core.susi.SusiOperation;
import com.medium.android.susi.data.CreateAccountData;
import com.medium.android.susi.ui.addInfo.AddInfoFragment;
import com.medium.android.susi.ui.auth.AuthFragment;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class tc0 implements do4 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ String b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;
    public final /* synthetic */ que h;
    public final /* synthetic */ Object i;

    public tc0(rya ryaVar, do4 do4Var, rya ryaVar2, String str, rya ryaVar3, rya ryaVar4, ju3 ju3Var, rya ryaVar5) {
        this.c = ryaVar;
        this.d = do4Var;
        this.e = ryaVar2;
        this.b = str;
        this.f = ryaVar3;
        this.g = ryaVar4;
        this.h = ju3Var;
        this.i = ryaVar5;
    }

    @Override // defpackage.do4
    public final Object a(Object obj, n92 n92Var) throws PendingIntent.CanceledException {
        Object objC;
        switch (this.a) {
            case 0:
                kd0 kd0Var = (kd0) obj;
                AuthFragment authFragment = (AuthFragment) ((zg7) this.e).b;
                boolean z = kd0Var instanceof hd0;
                Object obj2 = this.c;
                c1e c1eVar = c1e.a;
                if (z) {
                    String string = ((Resources) this.d).getString(((hd0) kd0Var).a);
                    string.getClass();
                    objC = nhc.c((nhc) obj2, string, null, bhc.Long, n92Var, 6);
                    if (objC != tb2.COROUTINE_SUSPENDED) {
                        return c1eVar;
                    }
                } else {
                    if (!(kd0Var instanceof jd0)) {
                        if (kd0Var instanceof fd0) {
                            fd0 fd0Var = (fd0) kd0Var;
                            SusiDestination susiDestination = fd0Var.a;
                            String str = fd0Var.b;
                            if (susiDestination instanceof SusiDestination.Deeplink) {
                                wld.a.j("Relaying deep link: " + susiDestination, new Object[0]);
                                if (authFragment.m0) {
                                    ak4.a().b(n1b.a.b(AuthFragment.class).j() + " relaying deep link: " + susiDestination);
                                }
                                py2 py2Var = authFragment.y0;
                                if (py2Var == null) {
                                    g76.g0("deepLinkHandler");
                                    throw null;
                                }
                                py2Var.a(authFragment.S(), Uri.parse(((SusiDestination.Deeplink) susiDestination).getUrl()), str, null);
                            } else if (g76.L(susiDestination, SusiDestination.Search.INSTANCE)) {
                                ((p13) authFragment.Z()).F(authFragment.S(), str, true);
                            } else if (g76.L(susiDestination, SusiDestination.NewStory.INSTANCE)) {
                                b09.K(authFragment.Z(), authFragment.S(), EditPostReference.NewPost.INSTANCE, str);
                            } else if (susiDestination instanceof SusiDestination.Post) {
                                b09.O(authFragment.Z(), authFragment.S(), ((SusiDestination.Post) susiDestination).getId(), str, null, null, null, 120);
                            } else {
                                ((p13) authFragment.Z()).m(authFragment.S(), str, false);
                            }
                            m15 m15VarQ = authFragment.Q();
                            m15VarQ.setResult(-1);
                            m15VarQ.finish();
                            return c1eVar;
                        }
                        if (kd0Var instanceof gd0) {
                            gd0 gd0Var = (gd0) kd0Var;
                            SusiDestination susiDestination2 = gd0Var.a;
                            String str2 = gd0Var.b;
                            m15 m15VarQ2 = authFragment.Q();
                            ((p13) authFragment.Z()).o(m15VarQ2, str2, susiDestination2);
                            m15VarQ2.setResult(-1);
                            m15VarQ2.finish();
                            return c1eVar;
                        }
                        if (kd0Var instanceof dd0) {
                            dd0 dd0Var = (dd0) kd0Var;
                            CreateAccountData createAccountData = dd0Var.a;
                            SusiDestination susiDestination3 = dd0Var.b;
                            String str3 = dd0Var.c;
                            createAccountData.getClass();
                            lig ligVarI1 = authFragment.i1();
                            Bundle bundle = new Bundle();
                            bundle.putParcelable("bundle_info", new AddInfoFragment.BundleInfo(str3, createAccountData, susiDestination3));
                            ligVarI1.W(R.id.addInfoFragment, bundle);
                            return c1eVar;
                        }
                        if (!(kd0Var instanceof ed0)) {
                            if (!(kd0Var instanceof id0)) {
                                ygf.a();
                                return null;
                            }
                            vx0.c0(o7f.x((iy6) this.f), null, null, new ra(this.b, (Context) this.g, (yd0) this.h, (vq6) this.i, (n92) null), 3);
                            return c1eVar;
                        }
                        ed0 ed0Var = (ed0) kd0Var;
                        String str4 = ed0Var.d;
                        SusiOperation susiOperation = ed0Var.c;
                        String str5 = ed0Var.a;
                        SusiDestination susiDestination4 = ed0Var.b;
                        boolean z2 = ed0Var.e;
                        susiOperation.getClass();
                        str5.getClass();
                        b09.M(authFragment.i1(), str4, susiOperation, str5, null, susiDestination4, z2, 8);
                        return c1eVar;
                    }
                    objC = nhc.c((nhc) obj2, ((jd0) kd0Var).a, null, bhc.Long, n92Var, 6);
                    if (objC != tb2.COROUTINE_SUSPENDED) {
                        return c1eVar;
                    }
                }
                return objC;
            default:
                return b((tt3) obj, n92Var);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:135:0x03d9, code lost:
    
        return r15;
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x00e2, code lost:
    
        if (r4.a(r16, r11) == r12) goto L40;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x0120, code lost:
    
        if (r4.a(r16, r11) == r12) goto L40;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x0159, code lost:
    
        if (r4.a(r16, r11) == r12) goto L40;
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x019a, code lost:
    
        if (r10.a(defpackage.xt3.a, r11) == r12) goto L40;
     */
    /* JADX WARN: Code restructure failed: missing block: B:81:0x01e9, code lost:
    
        if (r10.a(r14, r11) == r12) goto L40;
     */
    /* JADX WARN: Removed duplicated region for block: B:101:0x02b8  */
    /* JADX WARN: Removed duplicated region for block: B:139:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:140:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:68:0x01ba  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x01d8  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0037  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x01db  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x01ed  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x0237  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x02a2  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object b(defpackage.tt3 r25, defpackage.n92 r26) {
        /*
            Method dump skipped, instruction units count: 1024
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.tc0.b(tt3, n92):java.lang.Object");
    }

    public tc0(nhc nhcVar, Resources resources, zg7 zg7Var, iy6 iy6Var, String str, Context context, yd0 yd0Var, vq6 vq6Var) {
        this.c = nhcVar;
        this.d = resources;
        this.e = zg7Var;
        this.f = iy6Var;
        this.b = str;
        this.g = context;
        this.h = yd0Var;
        this.i = vq6Var;
    }
}
