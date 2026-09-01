package defpackage;

import android.content.Context;
import androidx.credentials.playservices.controllers.CredentialProviderController;
import androidx.credentials.playservices.controllers.blockstore.createrestorecredential.CredentialProviderCreateRestoreCredentialController;
import androidx.credentials.playservices.controllers.identitycredentials.createpublickeycredential.CreatePublicKeyCredentialController;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.medium.android.core.navigation.ResponsesReference;
import com.medium.android.data.preferences.DarkMode;
import com.medium.android.data.settings.Frequency;
import com.medium.android.domain.post.models.Highlight;
import com.medium.android.highlightdetail.HighlightDetailBottomSheetFragment;
import com.medium.android.home.ui.home.HomeFragment;
import com.medium.android.publicationadmin.ui.featuredposts.FeaturedPostsFragment;
import com.medium.reader.R;
import com.medium.refinerecommendations.RefineRecommendationsFragment;
import com.medium.refinerecommendations.following.seeall.tags.c;
import gen.model.SourceParameter;
import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class le0 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;

    public /* synthetic */ le0(p65 p65Var, tj1 tj1Var, egc egcVar, s48 s48Var) {
        this.a = 28;
        this.b = p65Var;
        this.d = tj1Var;
        this.c = egcVar;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i;
        k82 k82Var;
        zwa zwaVar;
        boolean zK0;
        int i2 = this.a;
        int i3 = 0;
        n92 n92Var = null;
        c1e c1eVar = c1e.a;
        Object obj = this.c;
        Object obj2 = this.d;
        Object obj3 = this.b;
        switch (i2) {
            case 0:
                ((b55) obj3).invoke(((rq9) obj2).a, (SourceParameter) obj);
                return c1eVar;
            case 1:
                String str = (String) obj2;
                b55 b55Var = (b55) obj3;
                SourceParameter sourceParameter = (SourceParameter) obj;
                if (str != null) {
                    b55Var.invoke(str, sourceParameter);
                }
                return c1eVar;
            case 2:
                sw9 sw9Var = ((cv9) obj3).a;
                vx0.c0(f76.F(sw9Var), null, null, new gs9(sw9Var, (String) obj2, (SourceParameter) obj, null, 8), 3);
                return c1eVar;
            case 3:
                ((ql0) obj3).a();
                x90 x90Var = (x90) ((iq1) obj2).d;
                int i4 = ((pya) obj).a;
                do {
                    i = x90Var.get();
                } while (!x90Var.compareAndSet(i, ((i >>> 27) & 15) == i4 ? i - 1 : i));
                return c1eVar;
            case 4:
                pod podVar = (pod) obj3;
                sb2 sb2Var = (sb2) obj2;
                l78 l78Var = (l78) obj;
                if (podVar.b()) {
                    vx0.c0(sb2Var, null, null, new z8(podVar, n92Var, 14), 3);
                    l78Var.setValue(Boolean.FALSE);
                }
                return c1eVar;
            case 5:
                ((js0) obj3).c((String) obj2, (SourceParameter) obj);
                return c1eVar;
            case 6:
                hv0 hv0Var = (hv0) obj3;
                pu0 pu0Var = (pu0) obj2;
                g08 g08Var = (g08) obj;
                if (hv0Var instanceof fv0) {
                    pu0Var.g(((fv0) hv0Var).a, g08Var);
                }
                return c1eVar;
            case 7:
                ((pu0) obj3).v(((g08) obj).b, (String) obj2, null, false);
                return c1eVar;
            case 8:
                uy0 uy0Var = (uy0) obj3;
                zwa zwaVarI0 = uy0.I0(uy0Var, (eh8) obj2, (cn) obj);
                if (zwaVarI0 == null) {
                    return null;
                }
                k82 k82Var2 = uy0Var.o;
                if (s46.a(k82Var2.v, -1L)) {
                    e26.c("Expected BringIntoViewRequester to not be used before parents are placed.");
                }
                return zwaVarI0.i(k82Var2.M0(zwaVarI0, k82Var2.J0(), 0L) ^ (-9223372034707292160L));
            case 9:
                dc1 dc1Var = (dc1) obj2;
                String str2 = ((gc1) obj3).a;
                String str3 = dc1Var.a;
                String str4 = dc1Var.b;
                dr9 dr9Var = dc1Var.c;
                ((y81) obj).H(dr9Var.x.b, str3, str2, str4, dr9Var.a);
                return c1eVar;
            case 10:
                f49 f49Var = ((oj1) obj3).b;
                f49Var.getClass();
                return f49Var.w(((cb) obj).h.d, ((ji5) obj2).a());
            case 11:
                k82 k82Var3 = (k82) obj3;
                d4e d4eVar = (d4e) obj2;
                xy0 xy0Var = (xy0) obj;
                zm7 zm7Var = k82Var3.t;
                while (true) {
                    o78 o78Var = (o78) zm7Var.b;
                    int i5 = o78Var.c;
                    if (i5 == 0) {
                        k82Var = k82Var3;
                    } else {
                        if (i5 == 0) {
                            ywb.h("MutableVector is empty.");
                            return null;
                        }
                        zwa zwaVar2 = (zwa) ((g82) o78Var.a[i5 - 1]).a.invoke();
                        if (zwaVar2 == null) {
                            k82Var = k82Var3;
                            zK0 = true;
                        } else {
                            k82 k82Var4 = k82Var3;
                            zK0 = k82.K0(k82Var4, zwaVar2, 0L, 0L, 3);
                            k82Var = k82Var4;
                        }
                        if (zK0) {
                            o78 o78Var2 = (o78) zm7Var.b;
                            ((g82) o78Var2.m(o78Var2.c - 1)).b.resumeWith(c1eVar);
                            k82Var3 = k82Var;
                        }
                    }
                }
                if (k82Var.u && (zwaVar = (zwa) k82Var.s.invoke()) != null && k82.K0(k82Var, zwaVar, 0L, 0L, 3)) {
                    k82Var.u = false;
                }
                d4eVar.e = k82Var.I0(xy0Var, 0L);
                return c1eVar;
            case 12:
                rq5 rq5Var = (rq5) obj3;
                r92 r92Var = (r92) obj2;
                SourceParameter sourceParameter2 = (SourceParameter) obj;
                rq5Var.getClass();
                r92Var.getClass();
                sourceParameter2.getClass();
                HomeFragment homeFragment = ((dq5) rq5Var.b).a;
                b09.O(homeFragment.Z(), homeFragment.S(), r92Var.getPostId(), gp7.u(sourceParameter2), r92Var.getParagraphName(), null, null, PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
                return c1eVar;
            case 13:
                return CreatePublicKeyCredentialController.invokePlayServices$lambda$0$2((Executor) obj3, (ah2) obj2, (gg2) obj);
            case 14:
                return CredentialProviderController.maybeReportErrorFromResultReceiver$lambda$0((Executor) obj3, (ah2) obj2, obj);
            case 15:
                return CredentialProviderCreateRestoreCredentialController.invokePlayServices$lambda$0$0((Executor) obj3, (ah2) obj2, (bf2) obj);
            case 16:
                ((x45) obj3).invoke((Frequency) obj2);
                ((l78) obj).setValue(Boolean.FALSE);
                return c1eVar;
            case 17:
                ((l78) obj).setValue(Boolean.FALSE);
                ph3 ph3Var = ((ah3) obj3).a;
                ph3Var.getClass();
                vx0.c0(f76.F(ph3Var), null, null, new r91((zy4) obj2, ph3Var, n92Var, 28), 3);
                return c1eVar;
            case 18:
                ((l78) obj).setValue(Boolean.FALSE);
                ph3 ph3Var2 = ((ah3) obj3).a;
                ph3Var2.getClass();
                vx0.c0(f76.F(ph3Var2), null, null, new r91((DarkMode) obj2, ph3Var2, n92Var, 27), 3);
                return c1eVar;
            case 19:
                ((x45) obj3).invoke((y5d) obj2);
                ((l78) obj).setValue(Boolean.FALSE);
                return c1eVar;
            case 20:
                s26 s26Var = (s26) obj3;
                sb4 sb4Var = (sb4) obj2;
                ((l78) obj).setValue(Boolean.FALSE);
                String str5 = sb4Var.a;
                SourceParameter sourceParameter3 = sb4Var.j;
                str5.getClass();
                rz2 rz2Var = (rz2) s26Var.b;
                String str6 = (String) s26Var.c;
                str6.getClass();
                FeaturedPostsFragment featuredPostsFragment = (FeaturedPostsFragment) rz2Var.b;
                ((p13) featuredPostsFragment.Z()).j0(featuredPostsFragment.S(), str5, str6, gp7.u(sourceParameter3));
                return c1eVar;
            case 21:
                ((l78) obj).setValue(Boolean.FALSE);
                ((xb4) obj3).b.h.d("selected_sort", (ec4) obj2);
                return c1eVar;
            case 22:
                zx4 zx4Var = (zx4) obj3;
                String str7 = (String) obj2;
                int i6 = ((hza) ((iza) obj)).a;
                zx4Var.getClass();
                str7.getClass();
                RefineRecommendationsFragment refineRecommendationsFragment = zx4Var.b.a;
                refineRecommendationsFragment.Z();
                m4.w(refineRecommendationsFragment.S(), R.id.allFollowedTagsFragment, c.a(i6, str7), null, 12);
                return c1eVar;
            case 23:
                zx4 zx4Var2 = (zx4) obj3;
                String str8 = (String) obj2;
                int i7 = ((aza) ((dza) obj)).a;
                zx4Var2.getClass();
                str8.getClass();
                RefineRecommendationsFragment refineRecommendationsFragment2 = zx4Var2.b.a;
                refineRecommendationsFragment2.Z();
                m4.w(refineRecommendationsFragment2.S(), R.id.allFollowedCollectionsFragment, com.medium.refinerecommendations.following.seeall.collections.c.a(i7, str8), null, 12);
                return c1eVar;
            case 24:
                ((l78) obj).setValue(Boolean.FALSE);
                xpc xpcVar = ((zx4) obj3).a.x;
                xpcVar.getClass();
                xpcVar.m(null, (eza) obj2);
                return c1eVar;
            case 25:
                zx4 zx4Var3 = (zx4) obj3;
                String str9 = (String) obj2;
                int i8 = ((lza) ((mza) obj)).a;
                zx4Var3.getClass();
                str9.getClass();
                RefineRecommendationsFragment refineRecommendationsFragment3 = zx4Var3.b.a;
                refineRecommendationsFragment3.Z();
                m4.w(refineRecommendationsFragment3.S(), R.id.allFollowedWritersFragment, com.medium.refinerecommendations.following.seeall.writers.c.a(i8, str9), null, 12);
                return c1eVar;
            case 26:
                vx0.c0((sb2) obj3, null, null, new f45((ul) obj2, (i45) obj, n92Var, i3), 3);
                return c1eVar;
            case 27:
                i45 i45Var = (i45) obj3;
                i45Var.t(((ub0) obj2).a);
                ((l78) obj).setValue(Boolean.FALSE);
                i45Var.l();
                return c1eVar;
            case 28:
                p65 p65Var = (p65) obj3;
                tj1 tj1Var = (tj1) obj2;
                egc egcVar = (egc) obj;
                y12 y12Var = p65Var.M;
                tj1 tj1Var2 = y12Var.b;
                try {
                    y12Var.b = tj1Var;
                    egc egcVar2 = p65Var.G;
                    int[] iArr = p65Var.o;
                    k68 k68Var = p65Var.v;
                    p65Var.o = null;
                    p65Var.v = null;
                    try {
                        p65Var.G = egcVar;
                        boolean z = y12Var.e;
                        try {
                            y12Var.e = false;
                            p65Var.D(null, null);
                            return c1eVar;
                        } finally {
                            y12Var.e = z;
                        }
                    } finally {
                        p65Var.G = egcVar2;
                        p65Var.o = iArr;
                        p65Var.v = k68Var;
                    }
                } finally {
                    y12Var.b = tj1Var2;
                }
            default:
                Highlight highlight = (Highlight) obj2;
                String str10 = (String) obj;
                highlight.getClass();
                HighlightDetailBottomSheetFragment highlightDetailBottomSheetFragment = ((dk5) obj3).b.a;
                p13 p13Var = highlightDetailBottomSheetFragment.H0;
                if (p13Var == null) {
                    g76.g0("router");
                    throw null;
                }
                Context contextS = highlightDetailBottomSheetFragment.S();
                String postId = highlight.getPostId();
                String groupId = highlight.getGroupId();
                if (groupId != null) {
                    p13Var.E(contextS, new ResponsesReference.HighlightResponses(postId, groupId, null, 4, null), str10, false);
                } else {
                    ay0.e("Required value was null.");
                }
                return c1eVar;
        }
    }

    public /* synthetic */ le0(Object obj, Object obj2, Object obj3, int i) {
        this.a = i;
        this.b = obj;
        this.d = obj2;
        this.c = obj3;
    }

    public /* synthetic */ le0(String str, b55 b55Var, SourceParameter sourceParameter) {
        this.a = 1;
        this.d = str;
        this.b = b55Var;
        this.c = sourceParameter;
    }
}
