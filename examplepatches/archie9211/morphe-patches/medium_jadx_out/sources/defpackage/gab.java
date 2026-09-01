package defpackage;

import android.app.PendingIntent;
import android.content.ClipData;
import android.content.ClipboardManager;
import com.medium.android.graphql.type.ResponseSortType;
import com.medium.android.reposters.ui.RepostersFragment;
import com.medium.android.reposters.ui.a;
import com.medium.reader.R;
import gen.model.SourceParameter;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class gab implements c55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;

    public /* synthetic */ gab(int i, Object obj, Object obj2, Object obj3, boolean z) {
        this.a = i;
        this.c = obj;
        this.d = obj2;
        this.b = obj3;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        o28 o28Var;
        boolean z;
        boolean z2;
        boolean z3;
        boolean z4;
        boolean z5;
        koc kocVar;
        boolean z6;
        int i;
        int i2;
        int i3;
        int i4;
        int i5;
        int i6;
        int i7;
        int i8;
        int i9 = this.a;
        int i10 = 5;
        int i11 = 8;
        int i12 = 2;
        final int i13 = 3;
        o28 o28Var2 = o28.b;
        uob uobVar = w12.a;
        c1e c1eVar = c1e.a;
        Object obj4 = this.d;
        Object obj5 = this.b;
        Object obj6 = this.c;
        Object[] objArr = 0;
        switch (i9) {
            case 0:
                final bab babVar = (bab) obj6;
                final nab nabVar = (nab) obj5;
                final l78 l78Var = (l78) obj4;
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                Integer numValueOf = Integer.valueOf(R.drawable.ic_unlisted_24);
                ((xv1) obj).getClass();
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                    aab aabVar = babVar.d;
                    boolean z7 = aabVar.e;
                    boolean z8 = aabVar.d;
                    boolean z9 = aabVar.c;
                    boolean z10 = aabVar.b;
                    String str = aabVar.a;
                    o28 o28Var3 = o28.b;
                    if (str != null) {
                        p65Var.Y(1200938908);
                        bq7 bq7Var = new bq7(vo7.R(p65Var, R.string.reposter_copy_link), false, Integer.valueOf(R.drawable.ic_link_24), null, 26);
                        boolean zF = p65Var.f(nabVar) | p65Var.f(babVar);
                        Object objM = p65Var.M();
                        if (zF || objM == uobVar) {
                            objM = new m45() { // from class: fab
                                @Override // defpackage.m45
                                public final Object invoke() throws PendingIntent.CanceledException {
                                    int i14 = i;
                                    c1e c1eVar2 = c1e.a;
                                    l78 l78Var2 = l78Var;
                                    bab babVar2 = babVar;
                                    nab nabVar2 = nabVar;
                                    switch (i14) {
                                        case 0:
                                            hne hneVar = babVar2.a;
                                            String str2 = hneVar.a;
                                            SourceParameter sourceParameter = hneVar.i;
                                            nabVar2.getClass();
                                            str2.getClass();
                                            mab mabVar = nabVar2.d;
                                            mabVar.getClass();
                                            jbb jbbVar = mabVar.b;
                                            vx0.c0(f76.F(jbbVar), null, null, new fbb(jbbVar, str2, sourceParameter, null, 0), 3);
                                            l78Var2.setValue(Boolean.FALSE);
                                            break;
                                        case 1:
                                            hne hneVar2 = babVar2.a;
                                            String str3 = hneVar2.a;
                                            SourceParameter sourceParameter2 = hneVar2.i;
                                            nabVar2.getClass();
                                            str3.getClass();
                                            mab mabVar2 = nabVar2.d;
                                            mabVar2.getClass();
                                            jbb jbbVar2 = mabVar2.b;
                                            vx0.c0(f76.F(jbbVar2), null, null, new fbb(jbbVar2, str3, sourceParameter2, null, 1), 3);
                                            l78Var2.setValue(Boolean.FALSE);
                                            break;
                                        case 2:
                                            hne hneVar3 = babVar2.a;
                                            String str4 = hneVar3.a;
                                            SourceParameter sourceParameter3 = hneVar3.i;
                                            nabVar2.getClass();
                                            str4.getClass();
                                            mab mabVar3 = nabVar2.d;
                                            mabVar3.getClass();
                                            jbb jbbVar3 = mabVar3.b;
                                            vx0.c0(f76.F(jbbVar3), null, null, new ebb(jbbVar3, str4, sourceParameter3, null, 1), 3);
                                            l78Var2.setValue(Boolean.FALSE);
                                            break;
                                        case 3:
                                            hne hneVar4 = babVar2.a;
                                            String str5 = hneVar4.a;
                                            SourceParameter sourceParameter4 = hneVar4.i;
                                            nabVar2.getClass();
                                            str5.getClass();
                                            mab mabVar4 = nabVar2.d;
                                            mabVar4.getClass();
                                            jab jabVar = mabVar4.a;
                                            String str6 = mabVar4.c;
                                            str6.getClass();
                                            RepostersFragment repostersFragment = ((a) jabVar).a;
                                            ((p13) repostersFragment.Z()).r0(repostersFragment.S(), str6, str5, ((RepostersFragment.BundleInfo) repostersFragment.w0.getValue()).getReferrerSource());
                                            l78Var2.setValue(Boolean.FALSE);
                                            break;
                                        default:
                                            String str7 = babVar2.d.a;
                                            SourceParameter sourceParameter5 = babVar2.a.i;
                                            nabVar2.getClass();
                                            str7.getClass();
                                            ClipboardManager clipboardManager = (ClipboardManager) nabVar2.c.getSystemService(ClipboardManager.class);
                                            if (clipboardManager != null) {
                                                clipboardManager.setPrimaryClip(ClipData.newPlainText(str7, str7));
                                            }
                                            l78Var2.setValue(Boolean.FALSE);
                                            break;
                                    }
                                    return c1eVar2;
                                }
                            };
                            p65Var.j0(objM);
                        }
                        aq7.b(bq7Var, (m45) objM, bgf.N(o28Var3, "copy_link"), 0L, 0L, p65Var, 384, 24);
                        if (z10 || z9 || z8 || z7) {
                            p65Var.Y(1201802413);
                            o28Var = o28Var3;
                            tp7.c(0.0f, 6, 6, 0L, p65Var, w2g.G(o28Var3, 0.0f, 8.0f, 0.0f, 8.0f, 5));
                            z = false;
                            p65Var.p(false);
                        } else {
                            p65Var.Y(1194205584);
                            z = false;
                            p65Var.p(false);
                            o28Var = o28Var3;
                        }
                    } else {
                        o28Var = o28Var3;
                        z = false;
                        p65Var.Y(1194205584);
                    }
                    p65Var.p(z);
                    if (z10) {
                        p65Var.Y(1201979423);
                        bq7 bq7Var2 = new bq7(vo7.R(p65Var, R.string.reposter_hide_note), false, numValueOf, null, 26);
                        boolean zF2 = p65Var.f(nabVar) | p65Var.f(babVar);
                        Object objM2 = p65Var.M();
                        if (zF2 || objM2 == uobVar) {
                            z2 = false;
                            final Object[] objArr2 = 0 == true ? 1 : 0;
                            objM2 = new m45() { // from class: fab
                                @Override // defpackage.m45
                                public final Object invoke() throws PendingIntent.CanceledException {
                                    int i14 = objArr2;
                                    c1e c1eVar2 = c1e.a;
                                    l78 l78Var2 = l78Var;
                                    bab babVar2 = babVar;
                                    nab nabVar2 = nabVar;
                                    switch (i14) {
                                        case 0:
                                            hne hneVar = babVar2.a;
                                            String str2 = hneVar.a;
                                            SourceParameter sourceParameter = hneVar.i;
                                            nabVar2.getClass();
                                            str2.getClass();
                                            mab mabVar = nabVar2.d;
                                            mabVar.getClass();
                                            jbb jbbVar = mabVar.b;
                                            vx0.c0(f76.F(jbbVar), null, null, new fbb(jbbVar, str2, sourceParameter, null, 0), 3);
                                            l78Var2.setValue(Boolean.FALSE);
                                            break;
                                        case 1:
                                            hne hneVar2 = babVar2.a;
                                            String str3 = hneVar2.a;
                                            SourceParameter sourceParameter2 = hneVar2.i;
                                            nabVar2.getClass();
                                            str3.getClass();
                                            mab mabVar2 = nabVar2.d;
                                            mabVar2.getClass();
                                            jbb jbbVar2 = mabVar2.b;
                                            vx0.c0(f76.F(jbbVar2), null, null, new fbb(jbbVar2, str3, sourceParameter2, null, 1), 3);
                                            l78Var2.setValue(Boolean.FALSE);
                                            break;
                                        case 2:
                                            hne hneVar3 = babVar2.a;
                                            String str4 = hneVar3.a;
                                            SourceParameter sourceParameter3 = hneVar3.i;
                                            nabVar2.getClass();
                                            str4.getClass();
                                            mab mabVar3 = nabVar2.d;
                                            mabVar3.getClass();
                                            jbb jbbVar3 = mabVar3.b;
                                            vx0.c0(f76.F(jbbVar3), null, null, new ebb(jbbVar3, str4, sourceParameter3, null, 1), 3);
                                            l78Var2.setValue(Boolean.FALSE);
                                            break;
                                        case 3:
                                            hne hneVar4 = babVar2.a;
                                            String str5 = hneVar4.a;
                                            SourceParameter sourceParameter4 = hneVar4.i;
                                            nabVar2.getClass();
                                            str5.getClass();
                                            mab mabVar4 = nabVar2.d;
                                            mabVar4.getClass();
                                            jab jabVar = mabVar4.a;
                                            String str6 = mabVar4.c;
                                            str6.getClass();
                                            RepostersFragment repostersFragment = ((a) jabVar).a;
                                            ((p13) repostersFragment.Z()).r0(repostersFragment.S(), str6, str5, ((RepostersFragment.BundleInfo) repostersFragment.w0.getValue()).getReferrerSource());
                                            l78Var2.setValue(Boolean.FALSE);
                                            break;
                                        default:
                                            String str7 = babVar2.d.a;
                                            SourceParameter sourceParameter5 = babVar2.a.i;
                                            nabVar2.getClass();
                                            str7.getClass();
                                            ClipboardManager clipboardManager = (ClipboardManager) nabVar2.c.getSystemService(ClipboardManager.class);
                                            if (clipboardManager != null) {
                                                clipboardManager.setPrimaryClip(ClipData.newPlainText(str7, str7));
                                            }
                                            l78Var2.setValue(Boolean.FALSE);
                                            break;
                                    }
                                    return c1eVar2;
                                }
                            };
                            p65Var.j0(objM2);
                        } else {
                            z2 = false;
                        }
                        aq7.b(bq7Var2, (m45) objM2, bgf.N(o28Var, "hide_note"), 0L, 0L, p65Var, 384, 24);
                    } else {
                        z2 = false;
                        p65Var.Y(1194205584);
                    }
                    p65Var.p(z2);
                    if (z9) {
                        p65Var.Y(1202680953);
                        bq7 bq7Var3 = new bq7(vo7.R(p65Var, R.string.reposter_unhide_note), false, numValueOf, null, 26);
                        boolean zF3 = p65Var.f(nabVar) | p65Var.f(babVar);
                        Object objM3 = p65Var.M();
                        if (zF3 || objM3 == uobVar) {
                            final int i14 = 1;
                            objM3 = new m45() { // from class: fab
                                @Override // defpackage.m45
                                public final Object invoke() throws PendingIntent.CanceledException {
                                    int i142 = i14;
                                    c1e c1eVar2 = c1e.a;
                                    l78 l78Var2 = l78Var;
                                    bab babVar2 = babVar;
                                    nab nabVar2 = nabVar;
                                    switch (i142) {
                                        case 0:
                                            hne hneVar = babVar2.a;
                                            String str2 = hneVar.a;
                                            SourceParameter sourceParameter = hneVar.i;
                                            nabVar2.getClass();
                                            str2.getClass();
                                            mab mabVar = nabVar2.d;
                                            mabVar.getClass();
                                            jbb jbbVar = mabVar.b;
                                            vx0.c0(f76.F(jbbVar), null, null, new fbb(jbbVar, str2, sourceParameter, null, 0), 3);
                                            l78Var2.setValue(Boolean.FALSE);
                                            break;
                                        case 1:
                                            hne hneVar2 = babVar2.a;
                                            String str3 = hneVar2.a;
                                            SourceParameter sourceParameter2 = hneVar2.i;
                                            nabVar2.getClass();
                                            str3.getClass();
                                            mab mabVar2 = nabVar2.d;
                                            mabVar2.getClass();
                                            jbb jbbVar2 = mabVar2.b;
                                            vx0.c0(f76.F(jbbVar2), null, null, new fbb(jbbVar2, str3, sourceParameter2, null, 1), 3);
                                            l78Var2.setValue(Boolean.FALSE);
                                            break;
                                        case 2:
                                            hne hneVar3 = babVar2.a;
                                            String str4 = hneVar3.a;
                                            SourceParameter sourceParameter3 = hneVar3.i;
                                            nabVar2.getClass();
                                            str4.getClass();
                                            mab mabVar3 = nabVar2.d;
                                            mabVar3.getClass();
                                            jbb jbbVar3 = mabVar3.b;
                                            vx0.c0(f76.F(jbbVar3), null, null, new ebb(jbbVar3, str4, sourceParameter3, null, 1), 3);
                                            l78Var2.setValue(Boolean.FALSE);
                                            break;
                                        case 3:
                                            hne hneVar4 = babVar2.a;
                                            String str5 = hneVar4.a;
                                            SourceParameter sourceParameter4 = hneVar4.i;
                                            nabVar2.getClass();
                                            str5.getClass();
                                            mab mabVar4 = nabVar2.d;
                                            mabVar4.getClass();
                                            jab jabVar = mabVar4.a;
                                            String str6 = mabVar4.c;
                                            str6.getClass();
                                            RepostersFragment repostersFragment = ((a) jabVar).a;
                                            ((p13) repostersFragment.Z()).r0(repostersFragment.S(), str6, str5, ((RepostersFragment.BundleInfo) repostersFragment.w0.getValue()).getReferrerSource());
                                            l78Var2.setValue(Boolean.FALSE);
                                            break;
                                        default:
                                            String str7 = babVar2.d.a;
                                            SourceParameter sourceParameter5 = babVar2.a.i;
                                            nabVar2.getClass();
                                            str7.getClass();
                                            ClipboardManager clipboardManager = (ClipboardManager) nabVar2.c.getSystemService(ClipboardManager.class);
                                            if (clipboardManager != null) {
                                                clipboardManager.setPrimaryClip(ClipData.newPlainText(str7, str7));
                                            }
                                            l78Var2.setValue(Boolean.FALSE);
                                            break;
                                    }
                                    return c1eVar2;
                                }
                            };
                            p65Var.j0(objM3);
                        }
                        aq7.b(bq7Var3, (m45) objM3, bgf.N(o28Var, "unhide_note"), 0L, 0L, p65Var, 384, 24);
                        z3 = false;
                    } else {
                        z3 = false;
                        p65Var.Y(1194205584);
                    }
                    p65Var.p(z3);
                    if (z8) {
                        p65Var.Y(1203390016);
                        bq7 bq7Var4 = new bq7(vo7.R(p65Var, R.string.user_activity_block_reposter), false, null, null, 30);
                        boolean zF4 = p65Var.f(nabVar) | p65Var.f(babVar);
                        Object objM4 = p65Var.M();
                        if (zF4 || objM4 == uobVar) {
                            final int i15 = 2;
                            objM4 = new m45() { // from class: fab
                                @Override // defpackage.m45
                                public final Object invoke() throws PendingIntent.CanceledException {
                                    int i142 = i15;
                                    c1e c1eVar2 = c1e.a;
                                    l78 l78Var2 = l78Var;
                                    bab babVar2 = babVar;
                                    nab nabVar2 = nabVar;
                                    switch (i142) {
                                        case 0:
                                            hne hneVar = babVar2.a;
                                            String str2 = hneVar.a;
                                            SourceParameter sourceParameter = hneVar.i;
                                            nabVar2.getClass();
                                            str2.getClass();
                                            mab mabVar = nabVar2.d;
                                            mabVar.getClass();
                                            jbb jbbVar = mabVar.b;
                                            vx0.c0(f76.F(jbbVar), null, null, new fbb(jbbVar, str2, sourceParameter, null, 0), 3);
                                            l78Var2.setValue(Boolean.FALSE);
                                            break;
                                        case 1:
                                            hne hneVar2 = babVar2.a;
                                            String str3 = hneVar2.a;
                                            SourceParameter sourceParameter2 = hneVar2.i;
                                            nabVar2.getClass();
                                            str3.getClass();
                                            mab mabVar2 = nabVar2.d;
                                            mabVar2.getClass();
                                            jbb jbbVar2 = mabVar2.b;
                                            vx0.c0(f76.F(jbbVar2), null, null, new fbb(jbbVar2, str3, sourceParameter2, null, 1), 3);
                                            l78Var2.setValue(Boolean.FALSE);
                                            break;
                                        case 2:
                                            hne hneVar3 = babVar2.a;
                                            String str4 = hneVar3.a;
                                            SourceParameter sourceParameter3 = hneVar3.i;
                                            nabVar2.getClass();
                                            str4.getClass();
                                            mab mabVar3 = nabVar2.d;
                                            mabVar3.getClass();
                                            jbb jbbVar3 = mabVar3.b;
                                            vx0.c0(f76.F(jbbVar3), null, null, new ebb(jbbVar3, str4, sourceParameter3, null, 1), 3);
                                            l78Var2.setValue(Boolean.FALSE);
                                            break;
                                        case 3:
                                            hne hneVar4 = babVar2.a;
                                            String str5 = hneVar4.a;
                                            SourceParameter sourceParameter4 = hneVar4.i;
                                            nabVar2.getClass();
                                            str5.getClass();
                                            mab mabVar4 = nabVar2.d;
                                            mabVar4.getClass();
                                            jab jabVar = mabVar4.a;
                                            String str6 = mabVar4.c;
                                            str6.getClass();
                                            RepostersFragment repostersFragment = ((a) jabVar).a;
                                            ((p13) repostersFragment.Z()).r0(repostersFragment.S(), str6, str5, ((RepostersFragment.BundleInfo) repostersFragment.w0.getValue()).getReferrerSource());
                                            l78Var2.setValue(Boolean.FALSE);
                                            break;
                                        default:
                                            String str7 = babVar2.d.a;
                                            SourceParameter sourceParameter5 = babVar2.a.i;
                                            nabVar2.getClass();
                                            str7.getClass();
                                            ClipboardManager clipboardManager = (ClipboardManager) nabVar2.c.getSystemService(ClipboardManager.class);
                                            if (clipboardManager != null) {
                                                clipboardManager.setPrimaryClip(ClipData.newPlainText(str7, str7));
                                            }
                                            l78Var2.setValue(Boolean.FALSE);
                                            break;
                                    }
                                    return c1eVar2;
                                }
                            };
                            p65Var.j0(objM4);
                        }
                        aq7.b(bq7Var4, (m45) objM4, bgf.N(o28Var, "block_reposter"), 0L, 0L, p65Var, 384, 24);
                        z4 = false;
                    } else {
                        z4 = false;
                        p65Var.Y(1194205584);
                    }
                    p65Var.p(z4);
                    if (z7) {
                        p65Var.Y(1204060515);
                        bq7 bq7Var5 = new bq7(vo7.R(p65Var, R.string.user_activity_report_repost), false, null, null, 30);
                        boolean zF5 = p65Var.f(nabVar) | p65Var.f(babVar);
                        Object objM5 = p65Var.M();
                        if (zF5 || objM5 == uobVar) {
                            objM5 = new m45() { // from class: fab
                                @Override // defpackage.m45
                                public final Object invoke() throws PendingIntent.CanceledException {
                                    int i142 = i13;
                                    c1e c1eVar2 = c1e.a;
                                    l78 l78Var2 = l78Var;
                                    bab babVar2 = babVar;
                                    nab nabVar2 = nabVar;
                                    switch (i142) {
                                        case 0:
                                            hne hneVar = babVar2.a;
                                            String str2 = hneVar.a;
                                            SourceParameter sourceParameter = hneVar.i;
                                            nabVar2.getClass();
                                            str2.getClass();
                                            mab mabVar = nabVar2.d;
                                            mabVar.getClass();
                                            jbb jbbVar = mabVar.b;
                                            vx0.c0(f76.F(jbbVar), null, null, new fbb(jbbVar, str2, sourceParameter, null, 0), 3);
                                            l78Var2.setValue(Boolean.FALSE);
                                            break;
                                        case 1:
                                            hne hneVar2 = babVar2.a;
                                            String str3 = hneVar2.a;
                                            SourceParameter sourceParameter2 = hneVar2.i;
                                            nabVar2.getClass();
                                            str3.getClass();
                                            mab mabVar2 = nabVar2.d;
                                            mabVar2.getClass();
                                            jbb jbbVar2 = mabVar2.b;
                                            vx0.c0(f76.F(jbbVar2), null, null, new fbb(jbbVar2, str3, sourceParameter2, null, 1), 3);
                                            l78Var2.setValue(Boolean.FALSE);
                                            break;
                                        case 2:
                                            hne hneVar3 = babVar2.a;
                                            String str4 = hneVar3.a;
                                            SourceParameter sourceParameter3 = hneVar3.i;
                                            nabVar2.getClass();
                                            str4.getClass();
                                            mab mabVar3 = nabVar2.d;
                                            mabVar3.getClass();
                                            jbb jbbVar3 = mabVar3.b;
                                            vx0.c0(f76.F(jbbVar3), null, null, new ebb(jbbVar3, str4, sourceParameter3, null, 1), 3);
                                            l78Var2.setValue(Boolean.FALSE);
                                            break;
                                        case 3:
                                            hne hneVar4 = babVar2.a;
                                            String str5 = hneVar4.a;
                                            SourceParameter sourceParameter4 = hneVar4.i;
                                            nabVar2.getClass();
                                            str5.getClass();
                                            mab mabVar4 = nabVar2.d;
                                            mabVar4.getClass();
                                            jab jabVar = mabVar4.a;
                                            String str6 = mabVar4.c;
                                            str6.getClass();
                                            RepostersFragment repostersFragment = ((a) jabVar).a;
                                            ((p13) repostersFragment.Z()).r0(repostersFragment.S(), str6, str5, ((RepostersFragment.BundleInfo) repostersFragment.w0.getValue()).getReferrerSource());
                                            l78Var2.setValue(Boolean.FALSE);
                                            break;
                                        default:
                                            String str7 = babVar2.d.a;
                                            SourceParameter sourceParameter5 = babVar2.a.i;
                                            nabVar2.getClass();
                                            str7.getClass();
                                            ClipboardManager clipboardManager = (ClipboardManager) nabVar2.c.getSystemService(ClipboardManager.class);
                                            if (clipboardManager != null) {
                                                clipboardManager.setPrimaryClip(ClipData.newPlainText(str7, str7));
                                            }
                                            l78Var2.setValue(Boolean.FALSE);
                                            break;
                                    }
                                    return c1eVar2;
                                }
                            };
                            p65Var.j0(objM5);
                        }
                        aq7.b(bq7Var5, (m45) objM5, bgf.N(o28Var, "report_repost"), 0L, 0L, p65Var, 384, 24);
                        z5 = false;
                    } else {
                        z5 = false;
                        p65Var.Y(1194205584);
                    }
                    p65Var.p(z5);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            case 1:
                kv6 kv6Var = (kv6) obj6;
                abb abbVar = (abb) obj4;
                nab nabVar2 = (nab) obj5;
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                ((hy0) obj).getClass();
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 17) != 16)) {
                    r28 r28VarD = jfc.d(o28Var2, 1.0f);
                    jy8 jy8VarH = w2g.h(0.0f, 0.0f, 0.0f, 48.0f, 7);
                    boolean zF6 = p65Var2.f(abbVar) | p65Var2.f(nabVar2);
                    Object objM6 = p65Var2.M();
                    if (zF6 || objM6 == uobVar) {
                        objM6 = new pda(abbVar, i11, nabVar2);
                        p65Var2.j0(objM6);
                    }
                    k40.t(r28VarD, kv6Var, jy8VarH, null, null, null, false, null, (x45) objM6, p65Var2, 390, 504);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
            case 2:
                List list = (List) obj6;
                x45 x45Var = (x45) obj5;
                l78 l78Var2 = (l78) obj4;
                x12 x12Var3 = (x12) obj2;
                int iIntValue3 = ((Integer) obj3).intValue();
                ((xv1) obj).getClass();
                p65 p65Var3 = (p65) x12Var3;
                if (p65Var3.P(iIntValue3 & 1, (iIntValue3 & 17) != 16)) {
                    int i16 = 0;
                    for (Object obj7 : list) {
                        int i17 = i16 + 1;
                        if (i16 < 0) {
                            d46.i0();
                            throw null;
                        }
                        ResponseSortType responseSortType = (ResponseSortType) obj7;
                        mz1 mz1VarE = pxf.E(-1406889431, new h9b(3, responseSortType), p65Var3);
                        boolean zF7 = p65Var3.f(x45Var) | p65Var3.h(list) | p65Var3.d(i16);
                        Object objM7 = p65Var3.M();
                        if (zF7 || objM7 == uobVar) {
                            objM7 = new qv2(x45Var, list, i16, l78Var2);
                            p65Var3.j0(objM7);
                        }
                        oq.b(mz1VarE, (m45) objM7, bgf.N(o28Var2, "response_sorting_item_dropdown_item_" + responseSortType.name()), null, null, false, null, null, p65Var3, 6, 504);
                        i16 = i17;
                    }
                } else {
                    p65Var3.S();
                }
                return c1eVar;
            case 3:
                roc rocVar = (roc) obj6;
                koc kocVar2 = (koc) obj5;
                nr8 nr8Var = (nr8) obj4;
                hy8 hy8Var = (hy8) obj;
                x12 x12Var4 = (x12) obj2;
                int iIntValue4 = ((Integer) obj3).intValue();
                hy8Var.getClass();
                if ((iIntValue4 & 6) == 0) {
                    iIntValue4 |= ((p65) x12Var4).f(hy8Var) ? 4 : 2;
                }
                p65 p65Var4 = (p65) x12Var4;
                if (!p65Var4.P(iIntValue4 & 1, (iIntValue4 & 19) != 18)) {
                    p65Var4.S();
                } else if (rocVar instanceof qoc) {
                    p65Var4.Y(1901693242);
                    yi2.z(w2g.B(o28Var2, hy8Var), p65Var4, 0);
                    p65Var4.p(false);
                } else if (rocVar instanceof poc) {
                    p65Var4.Y(1901698972);
                    poc pocVar = (poc) rocVar;
                    boolean zF8 = p65Var4.f(kocVar2);
                    Object objM8 = p65Var4.M();
                    if (zF8 || objM8 == uobVar) {
                        objM8 = new j5c(0, kocVar2, koc.class, "onRetry", "onRetry()V", 0, 27);
                        p65Var4.j0(objM8);
                    }
                    yi2.v(pocVar, (m45) ((qh6) objM8), w2g.B(o28Var2, hy8Var), p65Var4, 0);
                    p65Var4.p(false);
                } else if (rocVar instanceof ooc) {
                    p65Var4.Y(1901707823);
                    ooc oocVar = (ooc) rocVar;
                    boolean zF9 = p65Var4.f(kocVar2);
                    Object objM9 = p65Var4.M();
                    if (zF9 || objM9 == uobVar) {
                        objM9 = new j5c(0, kocVar2, koc.class, "onExploreStarterPacksClicked", "onExploreStarterPacksClicked()V", 0, 28);
                        p65Var4.j0(objM9);
                    }
                    yi2.t(oocVar, nr8Var, (m45) ((qh6) objM9), w2g.B(o28Var2, hy8Var), p65Var4, 0);
                    p65Var4.p(false);
                } else {
                    if (!(rocVar instanceof noc)) {
                        throw ho2.L(p65Var4, 1901691426, false);
                    }
                    p65Var4.Y(1901719277);
                    noc nocVar = (noc) rocVar;
                    boolean zF10 = p65Var4.f(kocVar2);
                    Object objM10 = p65Var4.M();
                    if (zF10 || objM10 == uobVar) {
                        kocVar = kocVar2;
                        objM10 = new j5c(0, kocVar, koc.class, "onRefresh", "onRefresh()V", 0, 29);
                        p65Var4.j0(objM10);
                    } else {
                        kocVar = kocVar2;
                    }
                    yi2.r(nocVar, kocVar, (m45) ((qh6) objM10), w2g.B(o28Var2, hy8Var), p65Var4, 0);
                    p65Var4.p(false);
                }
                return c1eVar;
            case 4:
                usc uscVar = (usc) obj6;
                kv6 kv6Var2 = (kv6) obj5;
                isc iscVar = (isc) obj4;
                hy8 hy8Var2 = (hy8) obj;
                x12 x12Var5 = (x12) obj2;
                int iIntValue5 = ((Integer) obj3).intValue();
                hy8Var2.getClass();
                if ((iIntValue5 & 6) == 0) {
                    iIntValue5 |= ((p65) x12Var5).f(hy8Var2) ? 4 : 2;
                }
                p65 p65Var5 = (p65) x12Var5;
                if (p65Var5.P(iIntValue5 & 1, (iIntValue5 & 19) != 18)) {
                    r28 r28VarB = w2g.B(o28Var2, hy8Var2);
                    if (uscVar instanceof jsc) {
                        p65Var5.Y(607870530);
                        ok7.m((jsc) uscVar, kv6Var2, iscVar, r28VarB, p65Var5, 0);
                        p65Var5.p(false);
                    } else if (uscVar instanceof ksc) {
                        p65Var5.Y(607878449);
                        ok7.n((ksc) uscVar, iscVar, r28VarB, p65Var5, 0);
                        p65Var5.p(false);
                    } else {
                        if (!(uscVar instanceof psc)) {
                            throw ho2.L(p65Var5, 607868594, false);
                        }
                        p65Var5.Y(607884797);
                        ok7.o(r28VarB, p65Var5, 0);
                        p65Var5.p(false);
                    }
                } else {
                    p65Var5.S();
                }
                return c1eVar;
            case 5:
                msc mscVar = (msc) obj6;
                xqc xqcVar = mscVar.b;
                isc iscVar2 = (isc) obj5;
                jsc jscVar = (jsc) obj4;
                x12 x12Var6 = (x12) obj2;
                int iIntValue6 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var6 = (p65) x12Var6;
                if (p65Var6.P(iIntValue6 & 1, (iIntValue6 & 17) != 16)) {
                    jp7 jp7Var = (jp7) p65Var6.j(kt7.a);
                    o28 o28Var4 = o28.b;
                    r28 r28VarJ = ka1.j(jp7Var, o28Var4, 3, 1.0f);
                    zk7 zk7VarC = dy0.c(z46.h, false);
                    long j = p65Var6.T;
                    int i18 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var6.l();
                    r28 r28VarR = gx1.R(p65Var6, r28VarJ);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var6.c0();
                    if (p65Var6.S) {
                        p65Var6.k(ot2Var);
                    } else {
                        p65Var6.m0();
                    }
                    cu cuVar = q12.f;
                    tp7.B(p65Var6, cuVar, zk7VarC);
                    cu cuVar2 = q12.e;
                    tp7.B(p65Var6, cuVar2, i89VarL);
                    Integer numValueOf2 = Integer.valueOf(i18);
                    cu cuVar3 = q12.g;
                    tp7.B(p65Var6, cuVar3, numValueOf2);
                    fn fnVar = q12.h;
                    tp7.y(p65Var6, fnVar);
                    cu cuVar4 = q12.d;
                    tp7.B(p65Var6, cuVar4, r28VarR);
                    r28 r28VarD2 = jfc.d(jfc.o(o28Var4, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC2 = dy0.c(z46.d, false);
                    long j2 = p65Var6.T;
                    int i19 = (int) (j2 ^ (j2 >>> 32));
                    i89 i89VarL2 = p65Var6.l();
                    r28 r28VarR2 = gx1.R(p65Var6, r28VarD2);
                    p65Var6.c0();
                    if (p65Var6.S) {
                        p65Var6.k(ot2Var);
                    } else {
                        p65Var6.m0();
                    }
                    tp7.B(p65Var6, cuVar, zk7VarC2);
                    tp7.B(p65Var6, cuVar2, i89VarL2);
                    ka1.z(i19, p65Var6, cuVar3, p65Var6, fnVar);
                    tp7.B(p65Var6, cuVar4, r28VarR2);
                    xqc xqcVar2 = xqc.LIFETIME_EARNINGS_DESC;
                    if (xqcVar == xqcVar2 || xqcVar == xqc.LIFETIME_EARNINGS_ASC) {
                        z6 = false;
                        i = 1815328230;
                        i2 = R.string.stats_no_partner_program_posts;
                    } else {
                        i = 1815451734;
                        i2 = R.string.stats_no_posts;
                        z6 = false;
                    }
                    String strW = km4.w(p65Var6, i, i2, p65Var6, z6);
                    if (xqcVar == xqcVar2 || xqcVar == xqc.LIFETIME_EARNINGS_ASC) {
                        i3 = 1815755162;
                        i4 = R.string.learn_more;
                    } else {
                        i3 = 1815859601;
                        i4 = R.string.stats_start_writing;
                    }
                    String strW2 = km4.w(p65Var6, i3, i4, p65Var6, z6);
                    boolean zF11 = p65Var6.f(mscVar) | p65Var6.h(iscVar2) | p65Var6.f(jscVar);
                    Object objM11 = p65Var6.M();
                    if (zF11 || objM11 == uobVar) {
                        objM11 = new i16(mscVar, iscVar2, jscVar, 24);
                        p65Var6.j0(objM11);
                    }
                    gq7.a(null, null, strW, null, 0L, strW2, (m45) objM11, null, null, 40.0f, 40.0f, p65Var6, 805306368, 6, 411);
                    p65Var6.p(true);
                    p65Var6.p(true);
                } else {
                    p65Var6.S();
                }
                return c1eVar;
            case 6:
                e2d e2dVar = (e2d) obj6;
                q1d q1dVar = (q1d) obj5;
                l78 l78Var3 = (l78) obj4;
                x12 x12Var7 = (x12) obj2;
                int iIntValue7 = ((Integer) obj3).intValue();
                ((xv1) obj).getClass();
                p65 p65Var7 = (p65) x12Var7;
                if (p65Var7.P(iIntValue7 & 1, (iIntValue7 & 17) != 16)) {
                    for (d2d d2dVar : e2dVar.b) {
                        bq7 bq7Var6 = new bq7(vo7.R(p65Var7, d2dVar.getTitleResId()), d2dVar == e2dVar.c, null, null, 28);
                        r28 r28VarN = bgf.N(o28Var2, "refine_recommendation_filter_item_" + d2dVar.name());
                        boolean zF12 = p65Var7.f(q1dVar) | p65Var7.d(d2dVar.ordinal());
                        Object objM12 = p65Var7.M();
                        if (zF12 || objM12 == uobVar) {
                            objM12 = new i16(q1dVar, d2dVar, l78Var3, 27);
                            p65Var7.j0(objM12);
                        }
                        aq7.b(bq7Var6, (m45) objM12, r28VarN, 0L, 0L, p65Var7, 0, 24);
                    }
                } else {
                    p65Var7.S();
                }
                return c1eVar;
            case 7:
                ycd ycdVar = (ycd) obj6;
                lbd lbdVar = (lbd) obj5;
                d9d d9dVar = (d9d) obj4;
                x12 x12Var8 = (x12) obj2;
                int iIntValue8 = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var8 = (p65) x12Var8;
                if (p65Var8.P(iIntValue8 & 1, (iIntValue8 & 17) != 16)) {
                    if (ycdVar.b instanceof ocd) {
                        p65Var8.Y(824302356);
                        boolean zF13 = p65Var8.f(lbdVar) | p65Var8.f(ycdVar) | p65Var8.f(d9dVar);
                        Object objM13 = p65Var8.M();
                        if (zF13 || objM13 == uobVar) {
                            objM13 = new i16(lbdVar, ycdVar, d9dVar, 29);
                            p65Var8.j0(objM13);
                        }
                        f49.l((m45) objM13, null, false, null, null, t02.a, p65Var8, 1572864, 62);
                    } else {
                        p65Var8.Y(796393614);
                    }
                    p65Var8.p(false);
                } else {
                    p65Var8.S();
                }
                return c1eVar;
            case 8:
                vcd vcdVar = (vcd) obj6;
                cs1 cs1Var = (cs1) obj5;
                obe obeVar = (obe) obj4;
                x12 x12Var9 = (x12) obj2;
                int iIntValue9 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var9 = (p65) x12Var9;
                if (!p65Var9.P(iIntValue9 & 1, (iIntValue9 & 17) != 16)) {
                    p65Var9.S();
                    return c1eVar;
                }
                jp7 jp7Var2 = (jp7) p65Var9.j(kt7.a);
                o28 o28Var5 = o28.b;
                r28 r28VarJ2 = ka1.j(jp7Var2, o28Var5, 3, 1.0f);
                zk7 zk7VarC3 = dy0.c(z46.h, false);
                long j3 = p65Var9.T;
                int i20 = (int) (j3 ^ (j3 >>> 32));
                i89 i89VarL3 = p65Var9.l();
                r28 r28VarR3 = gx1.R(p65Var9, r28VarJ2);
                r12.W.getClass();
                ot2 ot2Var2 = q12.b;
                p65Var9.c0();
                if (p65Var9.S) {
                    p65Var9.k(ot2Var2);
                } else {
                    p65Var9.m0();
                }
                cu cuVar5 = q12.f;
                tp7.B(p65Var9, cuVar5, zk7VarC3);
                cu cuVar6 = q12.e;
                tp7.B(p65Var9, cuVar6, i89VarL3);
                Integer numValueOf3 = Integer.valueOf(i20);
                cu cuVar7 = q12.g;
                tp7.B(p65Var9, cuVar7, numValueOf3);
                fn fnVar2 = q12.h;
                tp7.y(p65Var9, fnVar2);
                cu cuVar8 = q12.d;
                tp7.B(p65Var9, cuVar8, r28VarR3);
                r28 r28VarD3 = jfc.d(jfc.o(o28Var5, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                zk7 zk7VarC4 = dy0.c(z46.d, false);
                long j4 = p65Var9.T;
                int i21 = (int) (j4 ^ (j4 >>> 32));
                i89 i89VarL4 = p65Var9.l();
                r28 r28VarR4 = gx1.R(p65Var9, r28VarD3);
                p65Var9.c0();
                if (p65Var9.S) {
                    p65Var9.k(ot2Var2);
                } else {
                    p65Var9.m0();
                }
                tp7.B(p65Var9, cuVar5, zk7VarC4);
                tp7.B(p65Var9, cuVar6, i89VarL4);
                ka1.z(i21, p65Var9, cuVar7, p65Var9, fnVar2);
                tp7.B(p65Var9, cuVar8, r28VarR4);
                h70 h70Var = new h70(24.0f, true, new z10(21));
                jy8 jy8Var = new jy8(24.0f, 32.0f, 24.0f, 8.0f);
                r28 r28VarD4 = jfc.d(o28Var5, 1.0f);
                boolean zF14 = p65Var9.f(vcdVar) | p65Var9.f(cs1Var) | p65Var9.f(obeVar);
                Object objM14 = p65Var9.M();
                if (zF14 || objM14 == uobVar) {
                    objM14 = new pi9(vcdVar, cs1Var, obeVar, 12);
                    p65Var9.j0(objM14);
                }
                k40.u(r28VarD4, null, jy8Var, h70Var, null, null, false, null, (x45) objM14, p65Var9, 24582, 490);
                p65Var9.p(true);
                p65Var9.p(true);
                return c1eVar;
            case 9:
                kv6 kv6Var3 = (kv6) obj6;
                x3e x3eVar = (x3e) obj5;
                obe obeVar2 = (obe) obj4;
                x12 x12Var10 = (x12) obj2;
                int iIntValue10 = ((Integer) obj3).intValue();
                ((hy0) obj).getClass();
                p65 p65Var10 = (p65) x12Var10;
                if (p65Var10.P(iIntValue10 & 1, (iIntValue10 & 17) != 16)) {
                    r28 r28VarD5 = jfc.d(o28Var2, 1.0f);
                    boolean zF15 = p65Var10.f(x3eVar) | p65Var10.f(obeVar2);
                    Object objM15 = p65Var10.M();
                    if (zF15 || objM15 == uobVar) {
                        objM15 = new vrd(x3eVar, i11, obeVar2);
                        p65Var10.j0(objM15);
                    }
                    k40.t(r28VarD5, kv6Var3, null, null, null, null, false, null, (x45) objM15, p65Var10, 6, 508);
                } else {
                    p65Var10.S();
                }
                return c1eVar;
            case 10:
                g4e g4eVar = (g4e) obj6;
                akc akcVar = (akc) obj5;
                upc upcVar = (upc) obj4;
                hy8 hy8Var3 = (hy8) obj;
                x12 x12Var11 = (x12) obj2;
                int iIntValue11 = ((Integer) obj3).intValue();
                hy8Var3.getClass();
                if ((iIntValue11 & 6) == 0) {
                    iIntValue11 |= ((p65) x12Var11).f(hy8Var3) ? 4 : 2;
                }
                p65 p65Var11 = (p65) x12Var11;
                if (p65Var11.P(iIntValue11 & 1, (iIntValue11 & 19) != 18)) {
                    r28 r28VarB2 = w2g.B(o28Var2, hy8Var3);
                    d5e d5eVar = (d5e) upcVar.getValue();
                    if (d5eVar instanceof c5e) {
                        p65Var11.Y(-881947662);
                        t40.x(r28VarB2, p65Var11, 0);
                        p65Var11.p(false);
                    } else if (d5eVar instanceof b5e) {
                        p65Var11.Y(-881944481);
                        t40.w((b5e) d5eVar, g4eVar, r28VarB2, p65Var11, 0);
                        p65Var11.p(false);
                    } else {
                        if (!(d5eVar instanceof a5e)) {
                            throw ho2.L(p65Var11, -881949878, false);
                        }
                        p65Var11.Y(-881937798);
                        t40.v((a5e) d5eVar, akcVar, g4eVar, r28VarB2, p65Var11, 0);
                        p65Var11.p(false);
                    }
                } else {
                    p65Var11.S();
                }
                return c1eVar;
            case 11:
                vaf vafVar = (vaf) obj6;
                laf lafVar = (laf) obj5;
                l78 l78Var4 = (l78) obj4;
                x12 x12Var12 = (x12) obj2;
                int iIntValue12 = ((Integer) obj3).intValue();
                ((xv1) obj).getClass();
                p65 p65Var12 = (p65) x12Var12;
                if (p65Var12.P(iIntValue12 & 1, (iIntValue12 & 17) != 16)) {
                    for (paf pafVar : paf.getEntries()) {
                        int i22 = haf.a[pafVar.ordinal()];
                        if (i22 == 1) {
                            i5 = -1767132528;
                            i6 = R.string.you_posts_public_posts;
                        } else if (i22 == i12) {
                            i5 = -1767129966;
                            i6 = R.string.you_posts_unlisted_posts;
                        } else if (i22 == 3) {
                            i5 = -1767127441;
                            i6 = R.string.you_posts_draft_posts;
                        } else {
                            if (i22 != 4) {
                                throw ho2.L(p65Var12, -1767133758, false);
                            }
                            i5 = -1767124817;
                            i6 = R.string.you_posts_submissions;
                        }
                        String strW3 = km4.w(p65Var12, i5, i6, p65Var12, false);
                        r28 r28VarN2 = bgf.N(o28Var2, "you_posts_post_type_selector_" + pafVar);
                        bq7 bq7Var7 = new bq7(strW3, pafVar == vafVar.a, null, null, 28);
                        boolean zD = p65Var12.d(pafVar.ordinal()) | p65Var12.f(lafVar);
                        Object objM16 = p65Var12.M();
                        if (zD || objM16 == uobVar) {
                            objM16 = new ukd(lafVar, pafVar, l78Var4, i10);
                            p65Var12.j0(objM16);
                        }
                        aq7.b(bq7Var7, (m45) objM16, r28VarN2, 0L, 0L, p65Var12, 0, 24);
                        i12 = 2;
                    }
                } else {
                    p65Var12.S();
                }
                return c1eVar;
            case 12:
                ddf ddfVar = (ddf) obj6;
                l78 l78Var5 = (l78) obj4;
                wdf wdfVar = (wdf) obj5;
                x12 x12Var13 = (x12) obj2;
                int iIntValue13 = ((Integer) obj3).intValue();
                ((xv1) obj).getClass();
                p65 p65Var13 = (p65) x12Var13;
                if (p65Var13.P(iIntValue13 & 1, (iIntValue13 & 17) != 16)) {
                    for (wdf wdfVar2 : wdf.getEntries()) {
                        int i23 = bdf.a[wdfVar2.ordinal()];
                        if (i23 == 1) {
                            i7 = 1310181091;
                            i8 = R.string.common_sort_latest;
                        } else {
                            if (i23 != 2) {
                                throw ho2.L(p65Var13, 1310176797, false);
                            }
                            i7 = 1310186792;
                            i8 = R.string.common_sort_recommended;
                        }
                        mz1 mz1VarE2 = pxf.E(1302260072, new pb(km4.w(p65Var13, i7, i8, p65Var13, false), 9, objArr == true ? 1 : 0), p65Var13);
                        boolean zF16 = p65Var13.f(ddfVar) | p65Var13.d(wdfVar2.ordinal());
                        Object objM17 = p65Var13.M();
                        if (zF16 || objM17 == uobVar) {
                            objM17 = new ukd(ddfVar, wdfVar2, l78Var5, i11);
                            p65Var13.j0(objM17);
                        }
                        oq.b(mz1VarE2, (m45) objM17, null, null, pxf.E(152695404, new xre(wdfVar2, i10, wdfVar), p65Var13), false, null, null, p65Var13, 24582, 492);
                    }
                } else {
                    p65Var13.S();
                }
                return c1eVar;
            default:
                ev4 ev4Var = (ev4) obj6;
                SourceParameter sourceParameter = (SourceParameter) obj5;
                ddf ddfVar2 = (ddf) obj4;
                x12 x12Var14 = (x12) obj2;
                int iIntValue14 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var14 = (p65) x12Var14;
                if (p65Var14.P(iIntValue14 & 1, (iIntValue14 & 17) != 16)) {
                    jp7 jp7Var3 = (jp7) p65Var14.j(kt7.a);
                    o28 o28Var6 = o28.b;
                    r28 r28VarJ3 = ka1.j(jp7Var3, o28Var6, 3, 1.0f);
                    zk7 zk7VarC5 = dy0.c(z46.h, false);
                    long j5 = p65Var14.T;
                    int i24 = (int) (j5 ^ (j5 >>> 32));
                    i89 i89VarL5 = p65Var14.l();
                    r28 r28VarR5 = gx1.R(p65Var14, r28VarJ3);
                    r12.W.getClass();
                    ot2 ot2Var3 = q12.b;
                    p65Var14.c0();
                    if (p65Var14.S) {
                        p65Var14.k(ot2Var3);
                    } else {
                        p65Var14.m0();
                    }
                    cu cuVar9 = q12.f;
                    tp7.B(p65Var14, cuVar9, zk7VarC5);
                    cu cuVar10 = q12.e;
                    tp7.B(p65Var14, cuVar10, i89VarL5);
                    Integer numValueOf4 = Integer.valueOf(i24);
                    cu cuVar11 = q12.g;
                    tp7.B(p65Var14, cuVar11, numValueOf4);
                    fn fnVar3 = q12.h;
                    tp7.y(p65Var14, fnVar3);
                    cu cuVar12 = q12.d;
                    tp7.B(p65Var14, cuVar12, r28VarR5);
                    r28 r28VarD6 = jfc.d(jfc.o(o28Var6, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC6 = dy0.c(z46.d, false);
                    long j6 = p65Var14.T;
                    int i25 = (int) (j6 ^ (j6 >>> 32));
                    i89 i89VarL6 = p65Var14.l();
                    r28 r28VarR6 = gx1.R(p65Var14, r28VarD6);
                    p65Var14.c0();
                    if (p65Var14.S) {
                        p65Var14.k(ot2Var3);
                    } else {
                        p65Var14.m0();
                    }
                    tp7.B(p65Var14, cuVar9, zk7VarC6);
                    tp7.B(p65Var14, cuVar10, i89VarL6);
                    ka1.z(i25, p65Var14, cuVar11, p65Var14, fnVar3);
                    tp7.B(p65Var14, cuVar12, r28VarR6);
                    wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var14, 0);
                    long j7 = p65Var14.T;
                    int i26 = (int) (j7 ^ (j7 >>> 32));
                    i89 i89VarL7 = p65Var14.l();
                    r28 r28VarR7 = gx1.R(p65Var14, o28Var6);
                    p65Var14.c0();
                    if (p65Var14.S) {
                        p65Var14.k(ot2Var3);
                    } else {
                        p65Var14.m0();
                    }
                    tp7.B(p65Var14, cuVar9, wv1VarA);
                    tp7.B(p65Var14, cuVar10, i89VarL7);
                    ka1.z(i26, p65Var14, cuVar11, p65Var14, fnVar3);
                    tp7.B(p65Var14, cuVar12, r28VarR7);
                    if (ev4Var instanceof aw4) {
                        p65Var14.Y(-1421210748);
                        flb.L((aw4) ev4Var, sourceParameter, ddfVar2, null, p65Var14, 0);
                        p65Var14.p(false);
                    } else {
                        if (!(ev4Var instanceof jw4)) {
                            throw ho2.L(p65Var14, -1421213297, false);
                        }
                        p65Var14.Y(-1421200710);
                        flb.M((jw4) ev4Var, sourceParameter, ddfVar2, null, p65Var14, 0);
                        p65Var14.p(false);
                    }
                    tp7.c(0.0f, 6, 6, 0L, p65Var14, w2g.G(o28Var6, 24.0f, 0.0f, 24.0f, 0.0f, 10));
                    b09.H(p65Var14, true, true, true);
                } else {
                    p65Var14.S();
                }
                return c1eVar;
        }
    }

    public /* synthetic */ gab(Object obj, Object obj2, Object obj3, int i) {
        this.a = i;
        this.c = obj;
        this.b = obj2;
        this.d = obj3;
    }
}
