package defpackage;

import android.os.Bundle;
import android.os.Parcelable;
import com.medium.android.admin.admininternalstatus.jO.ziYqbdHrAXvj;
import com.medium.android.admin.stagebranch.StageBranchFragment;
import com.medium.android.core.fragments.AbstractMediumFragment;
import com.medium.android.postpage.share.SharePostDialogFragment;
import com.medium.android.reportpost.ui.ReportPostDialogFragment;
import com.medium.android.reportresponse.ui.ReportResponseDialogFragment;
import com.medium.android.reportuser.ui.ReportUserDialogFragment;
import com.medium.android.repost.ui.report.ReportRepostDialogFragment;
import com.medium.android.repost.ui.repostnote.RepostWithNoteBottomSheetFragment;
import com.medium.android.reposters.ui.RepostersFragment;
import com.medium.android.search.ui.main.SearchFragment;
import com.medium.android.settings.main.SettingsFragment;
import com.medium.android.susi.ui.signIn.SignInFragment;
import com.medium.android.susi.ui.signUp.SignUpFragment;
import com.squareup.wire.ReverseProtoWriter;
import java.io.File;
import java.net.URI;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Enumeration;
import java.util.concurrent.Callable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final /* synthetic */ class i5b implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ i5b(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int iE0;
        f09 f09Var;
        f09 f09Var2;
        m45 m45Var;
        boolean z;
        boolean z2;
        int i;
        boolean z3 = true;
        switch (this.a) {
            case 0:
                Parcelable parcelable = (Parcelable) ht2.r0(dm2.F((ReportPostDialogFragment) this.b), "bundle_info", ReportPostDialogFragment.BundleInfo.class);
                if (parcelable != null) {
                    return (ReportPostDialogFragment.BundleInfo) parcelable;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 1:
                Parcelable parcelable2 = (Parcelable) ht2.r0(dm2.F((ReportRepostDialogFragment) this.b), "bundle_info", ReportRepostDialogFragment.BundleInfo.class);
                if (parcelable2 != null) {
                    return (ReportRepostDialogFragment.BundleInfo) parcelable2;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 2:
                Parcelable parcelable3 = (Parcelable) ht2.r0(dm2.F((ReportResponseDialogFragment) this.b), "bundle_info", ReportResponseDialogFragment.BundleInfo.class);
                if (parcelable3 != null) {
                    return (ReportResponseDialogFragment.BundleInfo) parcelable3;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 3:
                Parcelable parcelable4 = (Parcelable) ht2.r0(dm2.F((ReportUserDialogFragment) this.b), "bundle_info", ReportUserDialogFragment.BundleInfo.class);
                if (parcelable4 != null) {
                    return (ReportUserDialogFragment.BundleInfo) parcelable4;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 4:
                Parcelable parcelable5 = (Parcelable) ht2.r0(((RepostWithNoteBottomSheetFragment) this.b).R(), "bundle_info", RepostWithNoteBottomSheetFragment.BundleInfo.class);
                if (parcelable5 != null) {
                    return (RepostWithNoteBottomSheetFragment.BundleInfo) parcelable5;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 5:
                Parcelable parcelable6 = (Parcelable) ht2.r0(dm2.F((RepostersFragment) this.b), "bundle_info", RepostersFragment.BundleInfo.class);
                if (parcelable6 != null) {
                    return (RepostersFragment.BundleInfo) parcelable6;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 6:
                ncb ncbVar = (ncb) this.b;
                ClassLoader classLoader = ncbVar.c;
                ch4 ch4Var = ncbVar.d;
                Enumeration<URL> resources = classLoader.getResources("");
                resources.getClass();
                ArrayList<URL> list = Collections.list(resources);
                list.getClass();
                ArrayList arrayList = new ArrayList();
                for (URL url : list) {
                    url.getClass();
                    if (g76.L(url.getProtocol(), "file")) {
                        String str = g59.b;
                        f09Var2 = new f09(ch4Var, cd7.s(new File(url.toURI())));
                    } else {
                        f09Var2 = null;
                    }
                    if (f09Var2 != null) {
                        arrayList.add(f09Var2);
                    }
                }
                Enumeration<URL> resources2 = classLoader.getResources("META-INF/MANIFEST.MF");
                resources2.getClass();
                ArrayList<URL> list2 = Collections.list(resources2);
                list2.getClass();
                ArrayList arrayList2 = new ArrayList();
                for (URL url2 : list2) {
                    url2.getClass();
                    String string = url2.toString();
                    string.getClass();
                    if (tuc.N(string, "jar:file:", false) && (iE0 = muc.e0(string, 0, 6, "!")) != -1) {
                        String str2 = g59.b;
                        f09Var = new f09(gq7.K(cd7.s(new File(URI.create(string.substring(4, iE0)))), ch4Var, new qna(17)), ncb.f);
                    } else {
                        f09Var = null;
                    }
                    if (f09Var != null) {
                        arrayList2.add(f09Var);
                    }
                }
                return bu1.Q0(arrayList2, arrayList);
            case 7:
                return new vj3(((sfb) this.b).d != null ? 16.0f : 12.0f);
            case 8:
                return ReverseProtoWriter.a((ReverseProtoWriter) this.b);
            case 9:
                return ((Callable) this.b).call();
            case 10:
                ((Runnable) this.b).run();
                return c1e.a;
            case 11:
                mob mobVar = (mob) this.b;
                kpb kpbVar = mobVar.a;
                Object obj = mobVar.d;
                if (obj != null) {
                    return kpbVar.b(mobVar, obj);
                }
                ay0.e("Value should be initialized");
                return null;
            case 12:
                fpb fpbVar = ((tob) this.b).c;
                if (fpbVar == null) {
                    return null;
                }
                Bundle bundleE = xz5.E((f09[]) Arrays.copyOf(new f09[0], 0));
                fpbVar.b(bundleE);
                if (bundleE.isEmpty()) {
                    return null;
                }
                return bundleE;
            case 13:
                return kyd.W((wue) this.b);
            case 14:
                hpb hpbVar = (hpb) this.b;
                hpbVar.getLifecycle().a(new ywa(0, hpbVar));
                return c1e.a;
            case 15:
                asb asbVar = (asb) this.b;
                fp fpVar = (fp) bo.K(asbVar, gx8.a);
                asbVar.A = fpVar;
                asbVar.B = fpVar != null ? new ep(fpVar.a, fpVar.b, fpVar.c, fpVar.d) : null;
                return c1e.a;
            case 16:
                Parcelable parcelable7 = (Parcelable) ht2.r0(dm2.F((SearchFragment) this.b), "bundle_info", AbstractMediumFragment.BundleInfo.class);
                if (parcelable7 != null) {
                    return (AbstractMediumFragment.BundleInfo) parcelable7;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 17:
                hwb hwbVar = (hwb) this.b;
                dsd dsdVar = hwbVar.f;
                hwbVar.g = dsdVar != null ? ((Number) dsdVar.l.getValue()).longValue() : 0L;
                return c1e.a;
            case 18:
                return this.b;
            case 19:
                a0c a0cVar = (a0c) this.b;
                return Integer.valueOf(jq7.q(a0cVar, a0cVar.i));
            case 20:
                Parcelable parcelable8 = (Parcelable) ht2.r0(dm2.F((SettingsFragment) this.b), "bundle_info", SettingsFragment.BundleInfo.class);
                if (parcelable8 != null) {
                    return (SettingsFragment.BundleInfo) parcelable8;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 21:
                h3c h3cVar = (h3c) this.b;
                k49 k49Var = h3cVar.c;
                if (((dfc) k49Var.getValue()).a == 9205357640488583168L || dfc.e(((dfc) k49Var.getValue()).a)) {
                    return null;
                }
                return h3cVar.a.b(((dfc) k49Var.getValue()).a);
            case 22:
                Parcelable parcelable9 = (Parcelable) ht2.r0(dm2.F((SharePostDialogFragment) this.b), "bundle_info", SharePostDialogFragment.BundleInfo.class);
                if (parcelable9 != null) {
                    return (SharePostDialogFragment.BundleInfo) parcelable9;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 23:
                return Integer.valueOf(((h6c) this.b).c.size() + 1);
            case 24:
                Parcelable parcelable10 = (Parcelable) ht2.r0(dm2.F((SignInFragment) this.b), "bundle_info", SignInFragment.BundleInfo.class);
                if (parcelable10 != null) {
                    return (SignInFragment.BundleInfo) parcelable10;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 25:
                return qo7.u(new uid(((wac) this.b).b, 6, 0L));
            case 26:
                Parcelable parcelable11 = (Parcelable) ht2.r0(dm2.F((SignUpFragment) this.b), ziYqbdHrAXvj.rgFSHhy, SignUpFragment.BundleInfo.class);
                if (parcelable11 != null) {
                    return (SignUpFragment.BundleInfo) parcelable11;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 27:
                bgc bgcVar = (bgc) this.b;
                if (!((Boolean) bgcVar.m.getValue()).booleanValue() && (m45Var = bgcVar.a) != null) {
                    m45Var.invoke();
                }
                return c1e.a;
            case 28:
                gjc gjcVar = (gjc) this.b;
                while (true) {
                    synchronized (gjcVar.g) {
                        try {
                            if (gjcVar.c) {
                                z = z3;
                            } else {
                                gjcVar.c = z3;
                                try {
                                    o78 o78Var = gjcVar.f;
                                    Object[] objArr = o78Var.a;
                                    int i2 = o78Var.c;
                                    int i3 = 0;
                                    while (i3 < i2) {
                                        fjc fjcVar = (fjc) objArr[i3];
                                        g78 g78Var = fjcVar.g;
                                        x45 x45Var = fjcVar.a;
                                        Object[] objArr2 = g78Var.b;
                                        long[] jArr = g78Var.a;
                                        int length = jArr.length - 2;
                                        if (length >= 0) {
                                            int i4 = 0;
                                            while (true) {
                                                long j = jArr[i4];
                                                boolean z4 = z3;
                                                if ((((~j) << 7) & j & (-9187201950435737472L)) != -9187201950435737472L) {
                                                    int i5 = 8;
                                                    int i6 = 8 - ((~(i4 - length)) >>> 31);
                                                    z2 = z4;
                                                    int i7 = 0;
                                                    while (i7 < i6) {
                                                        if ((j & 255) < 128) {
                                                            i = i5;
                                                            x45Var.invoke(objArr2[(i4 << 3) + i7]);
                                                        } else {
                                                            i = i5;
                                                        }
                                                        j >>= i;
                                                        i7++;
                                                        i5 = i;
                                                    }
                                                    if (i6 == i5) {
                                                    }
                                                } else {
                                                    z2 = z4;
                                                }
                                                if (i4 != length) {
                                                    i4++;
                                                    z3 = z2;
                                                }
                                            }
                                        } else {
                                            z2 = z3;
                                        }
                                        g78Var.b();
                                        i3++;
                                        z3 = z2;
                                    }
                                    z = z3;
                                    gjcVar.c = false;
                                } catch (Throwable th) {
                                    gjcVar.c = false;
                                    throw th;
                                }
                            }
                        } catch (Throwable th2) {
                            throw th2;
                        }
                    }
                    if (!gjcVar.c()) {
                        return c1e.a;
                    }
                    z3 = z;
                }
                break;
            default:
                Parcelable parcelable12 = (Parcelable) ht2.r0(dm2.F((StageBranchFragment) this.b), "bundle_info", StageBranchFragment.BundleInfo.class);
                if (parcelable12 != null) {
                    return (StageBranchFragment.BundleInfo) parcelable12;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
        }
    }
}
