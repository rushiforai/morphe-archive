package defpackage;

import android.app.PendingIntent;
import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import com.google.android.gms.analytics.wYI.ivbZv;
import com.medium.android.core.navigation.PublicationReference;
import com.medium.android.core.navigation.PublicationTab;
import com.medium.android.donkey.write.EditPostFragment;
import com.medium.android.postpage.featuredinpublication.FeaturedInPublicationFragment;
import com.medium.android.profile.ui.edit.EditProfileFragment;
import com.medium.android.profile.ui.edit.pronouns.PronounsPickerDialogFragment;
import com.medium.reader.R;
import com.medium.refinerecommendations.RefineRecommendationsFragment;
import gen.model.SourceParameter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final /* synthetic */ class gd3 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    public /* synthetic */ gd3(ba8 ba8Var, ga8 ga8Var, k25 k25Var, j15 j15Var) {
        this.a = 19;
        this.b = ga8Var;
        this.c = j15Var;
    }

    @Override // defpackage.m45
    public final Object invoke() throws PendingIntent.CanceledException {
        int i = 1;
        int i2 = 0;
        n92 n92Var = null;
        switch (this.a) {
            case 0:
                ld3 ld3Var = (ld3) this.b;
                le3 le3Var = (le3) ((me3) this.c);
                ld3Var.a(le3Var.c, le3Var.a, le3Var.b, le3Var.d);
                return c1e.a;
            case 1:
                ld3 ld3Var2 = (ld3) this.b;
                SourceParameter sourceParameter = (SourceParameter) this.c;
                sourceParameter.getClass();
                ld3Var2.a.l(sourceParameter);
                return c1e.a;
            case 2:
                return new om3((pm3) this.b, (x45) this.c);
            case 3:
                EditPostFragment editPostFragment = (EditPostFragment) this.b;
                yr3 yr3Var = (yr3) this.c;
                int i3 = EditPostFragment.Q0;
                editPostFragment.j1().h();
                ht3 ht3VarJ1 = editPostFragment.j1();
                vx0.c0(f76.F(ht3VarJ1), null, null, new vs3(ht3VarJ1, yr3Var.a, n92Var, i2), 3);
                return c1e.a;
            case 4:
                nt3 nt3Var = (nt3) this.b;
                eu3 eu3Var = (eu3) this.c;
                List list = eu3Var.f;
                String str = eu3Var.g;
                nt3Var.getClass();
                list.getClass();
                str.getClass();
                EditProfileFragment editProfileFragment = (EditProfileFragment) nt3Var.b.b;
                editProfileFragment.Z();
                Context contextS = editProfileFragment.S();
                Bundle bundle = new Bundle();
                bundle.putParcelable(ivbZv.ncEqH, new PronounsPickerDialogFragment.BundleInfo(list, str));
                bundle.putString("referrer_source", str);
                bundle.putStringArrayList("selected_pronouns_key", new ArrayList<>(list));
                m4.w(contextS, R.id.pronounsPickerFragment, bundle, null, 12);
                return c1e.a;
            case 5:
                b55 b55Var = (b55) this.b;
                ky3 ky3Var = (ky3) this.c;
                b55Var.invoke(ky3Var.a, ky3Var.c);
                return c1e.a;
            case 6:
                ua4 ua4Var = (ua4) this.b;
                ab4 ab4Var = (ab4) this.c;
                ua4Var.a(ab4Var.e, ab4Var.g);
                return c1e.a;
            case 7:
                ua4 ua4Var2 = (ua4) this.b;
                db4 db4Var = (db4) this.c;
                ua4Var2.a(db4Var.d, db4Var.f);
                return c1e.a;
            case 8:
                ob4 ob4Var = (ob4) this.b;
                pb4 pb4Var = (pb4) this.c;
                String str2 = pb4Var.a;
                SourceParameter sourceParameter2 = pb4Var.d;
                str2.getClass();
                FeaturedInPublicationFragment featuredInPublicationFragment = ob4Var.a.a;
                p13 p13Var = featuredInPublicationFragment.H0;
                if (p13Var != null) {
                    p13Var.y(featuredInPublicationFragment.S(), new PublicationReference.Id(str2), gp7.u(sourceParameter2), PublicationTab.Home.INSTANCE);
                    return c1e.a;
                }
                g76.g0("router");
                throw null;
            case 9:
                xb4 xb4Var = (xb4) this.b;
                if (((Boolean) ((l78) this.c).getValue()).booleanValue()) {
                    uc4 uc4Var = xb4Var.b;
                    vx0.c0(f76.F(uc4Var), null, null, new dc4(uc4Var, n92Var, i), 3);
                }
                return c1e.a;
            case 10:
                hi4 hi4Var = (hi4) this.b;
                ((l78) this.c).setValue(Boolean.FALSE);
                hi4Var.b.o.l(ni4.UploadingContacts);
                return c1e.a;
            case 11:
                lm4 lm4Var = (lm4) this.b;
                String str3 = ((rm4) this.c).a;
                str3.getClass();
                xm4 xm4Var = lm4Var.a;
                vx0.c0(f76.F(xm4Var), null, null, new um4(xm4Var, str3, n92Var, i), 3);
                return c1e.a;
            case 12:
                lm4 lm4Var2 = (lm4) this.b;
                l78 l78Var = (l78) this.c;
                String str4 = (String) l78Var.getValue();
                str4.getClass();
                xm4 xm4Var2 = lm4Var2.a;
                vx0.c0(f76.F(xm4Var2), null, null, new um4(xm4Var2, str4, n92Var, i2), 3);
                l78Var.setValue("");
                return c1e.a;
            case 13:
                ((rya) this.b).a = bo.K((ls4) this.c, q99.a);
                return c1e.a;
            case 14:
                rt4 rt4Var = (rt4) this.b;
                nt4 nt4Var = (nt4) ((l78) this.c).getValue();
                nt4Var.getClass();
                qu4 qu4Var = rt4Var.a;
                vx0.c0(f76.F(qu4Var), null, null, new xs3(qu4Var, nt4Var, n92Var, 9), 3);
                return c1e.a;
            case 15:
                ((x45) this.b).invoke(((dw4) this.c).a);
                return c1e.a;
            case 16:
                ((x45) this.b).invoke(((gw4) this.c).a);
                return c1e.a;
            case 17:
                zx4 zx4Var = (zx4) this.b;
                String str5 = ((nza) this.c).g;
                zx4Var.getClass();
                str5.getClass();
                RefineRecommendationsFragment refineRecommendationsFragment = zx4Var.b.a;
                ((p13) refineRecommendationsFragment.Z()).i(refineRecommendationsFragment.S(), str5);
                return c1e.a;
            case 18:
                ((x45) this.b).invoke(((jy4) this.c).f);
                return c1e.a;
            case 19:
                ga8 ga8Var = (ga8) this.b;
                j15 j15Var = (j15) this.c;
                for (ba8 ba8Var : (Iterable) ga8Var.f.a.getValue()) {
                    if (k25.n()) {
                        Log.v("FragmentNavigator", "Marking transition complete for entry " + ba8Var + " due to fragment " + j15Var + " viewmodel being cleared");
                    }
                    ga8Var.c(ba8Var);
                }
                return c1e.a;
            case 20:
                i45 i45Var = (i45) this.b;
                i45Var.t(((ub0) this.c).a);
                i45Var.l();
                return c1e.a;
            case 21:
                ((i45) this.b).n(((g49) this.c).g());
                return c1e.a;
            case 22:
                ((i45) this.b).m(gp7.u((SourceParameter) this.c));
                return c1e.a;
            case 23:
                i45 i45Var2 = (i45) this.b;
                ((l78) this.c).setValue(Boolean.FALSE);
                i45Var2.o();
                return c1e.a;
            case 24:
                ((x45) this.b).invoke(((b85) this.c).b);
                return c1e.a;
            case 25:
                dk5 dk5Var = (dk5) this.b;
                ((l78) this.c).setValue(Boolean.FALSE);
                dl5 dl5Var = dk5Var.a;
                vx0.c0(f76.F(dl5Var), null, null, new m1(dl5Var, n92Var, 21), 3);
                return c1e.a;
            case 26:
                sl5 sl5Var = (sl5) this.b;
                kl5 kl5Var = (kl5) this.c;
                sl5Var.b.k(kl5Var.d, kl5Var.g, kl5Var.j);
                return c1e.a;
            case 27:
                ((no5) this.b).a(((uo5) this.c).e);
                return c1e.a;
            case 28:
                ((no5) this.b).a((SourceParameter) this.c);
                return c1e.a;
            default:
                qs5 qs5Var = (qs5) this.b;
                xs5 xs5Var = (xs5) this.c;
                try {
                    qs5Var.a.b(xs5Var);
                    break;
                } catch (IOException e) {
                    ea9 ea9Var = ea9.a;
                    ea9.a.i(4, "Http2Connection.Listener failure for " + qs5Var.c, e);
                    try {
                        xs5Var.c(b14.PROTOCOL_ERROR, e);
                        break;
                    } catch (IOException unused) {
                    }
                }
                return c1e.a;
        }
    }

    public /* synthetic */ gd3(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }
}
