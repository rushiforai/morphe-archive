package defpackage;

import android.app.PendingIntent;
import android.content.Context;
import android.os.Build;
import android.os.Parcelable;
import android.provider.Settings;
import android.speech.tts.TextToSpeech;
import androidx.credentials.playservices.controllers.identityauth.createpublickeycredential.CredentialProviderCreatePublicKeyCredentialController;
import androidx.credentials.playservices.controllers.identityauth.getsigninintent.CredentialProviderGetSignInIntentController;
import com.medium.android.addressbook.ui.findfriends.FindFriendsFragment;
import com.medium.android.admin.designsystem.DesignSystem3Fragment;
import com.medium.android.admin.designsystem.DesignSystemFragment;
import com.medium.android.core.fragments.AbstractMediumFragment;
import com.medium.android.digest.ui.digesthistory.DigestHistoryDialogFragment;
import com.medium.android.digest.ui.settings.DigestSettingsFragment;
import com.medium.android.donkey.read.web.ExternalWebViewBottomSheetDialogFragment;
import com.medium.android.donkey.read.web.ExternalWebViewFragment;
import com.medium.android.explore.ui.ExploreFragment;
import com.medium.android.postpage.displaysettings.DisplaySettingsDialogFragment;
import com.medium.android.postpage.featuredinpublication.FeaturedInPublicationFragment;
import com.medium.android.profile.ui.edit.EditProfileFragment;
import com.medium.android.publicationadmin.ui.featuredposts.FeaturedPostsFragment;
import com.medium.android.publicationadmin.ui.featurepost.FeaturePostBottomSheetFragment;
import com.medium.android.settings.ui.discoverability.DiscoverabilityFragment;
import com.medium.android.yourlibrary.YourLibraryTab;
import com.medium.android.yourlibrary.c;
import com.medium.reader.R;
import com.squareup.wire.internal.FieldOrOneOfBinding;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class nh2 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ nh2(f24 f24Var, pr0 pr0Var) {
        this.a = 19;
        this.b = pr0Var;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.m45
    public final Object invoke() throws InterruptedException, PendingIntent.CanceledException {
        x77 iq1Var;
        vod vodVarD;
        int i = this.a;
        char c = 1;
        boolean z = false;
        c1e c1eVar = c1e.a;
        Object[] objArr = 0;
        Object obj = this.b;
        switch (i) {
            case 0:
                return CredentialProviderCreatePublicKeyCredentialController.invokePlayServices$lambda$2$0((CredentialProviderCreatePublicKeyCredentialController) obj);
            case 1:
                return CredentialProviderGetSignInIntentController.invokePlayServices$lambda$1$0((CredentialProviderGetSignInIntentController) obj);
            case 2:
                vv8 vv8VarA = ((zw2) obj).a();
                vv8VarA.b.clear();
                ex7 ex7Var = vv8VarA.a;
                if (ex7Var != null) {
                    ex7Var.c();
                }
                return c1eVar;
            case 3:
                hy2 hy2Var = (hy2) obj;
                l66 l66VarA = uu2.a(null);
                ysb feature = l66VarA.getFeature("logs");
                ha7 ha7Var = feature != null ? (ha7) feature.c : null;
                if (ha7Var == null) {
                    f49.K(l66VarA.e(), d66.ERROR, e66.USER, ot2.D, null, false, 56);
                    iq1Var = new tz7(20, z);
                } else {
                    iq1Var = new iq1(ha7Var.e, new ev2(l66VarA.c(), l66VarA.e()), l66VarA, ha7Var.c, new gg5(100.0f));
                }
                e87 e87Var = new e87(iq1Var);
                e87Var.a("sdk", Integer.valueOf(Build.VERSION.SDK_INT));
                e87Var.a("locale", Locale.getDefault().toString());
                e87Var.a("device_type", Build.PRODUCT + " - " + Build.DEVICE + " - " + Build.MODEL);
                Context context = hy2Var.a;
                e87Var.a("areDeveloperOptionsEnabled", Boolean.valueOf(Settings.Global.getInt(context.getContentResolver(), "development_settings_enabled", 0) != 0));
                String strD = u4.d(context);
                if (strD != null) {
                    e87Var.a("install-source", strD);
                }
                e87Var.a("is_play_services_available", Boolean.valueOf(be5.b.c(context, be5.a) == 0));
                return e87Var;
            case 4:
                return Boolean.valueOf(((p13) obj).a.b(nl4.ENABLE_POST_PAGE_COMPOSE));
            case 5:
                ((khd) obj).close();
                return c1eVar;
            case 6:
                y23 y23Var = (y23) obj;
                TextToSpeech textToSpeech = new TextToSpeech(y23Var.a, y23Var.r, "com.google.android.tts");
                textToSpeech.setOnUtteranceProgressListener(y23Var.u);
                y23Var.p.l(textToSpeech.getVoice());
                return textToSpeech;
            case 7:
                uod uodVar = ((gud) obj).o;
                return Float.valueOf((uodVar == null || (vodVarD = uodVar.d()) == null) ? 0.0f : vodVarD.a());
            case 8:
                return (up8) ((ef6) obj).invoke();
            case 9:
                ((DesignSystem3Fragment) obj).Q().getOnBackPressedDispatcher().d();
                return c1eVar;
            case 10:
                ((DesignSystemFragment) obj).Q().getOnBackPressedDispatcher().d();
                return c1eVar;
            case 11:
                Parcelable parcelable = (Parcelable) ht2.r0(((DigestHistoryDialogFragment) obj).R(), "bundle_info", DigestHistoryDialogFragment.BundleInfo.class);
                if (parcelable != null) {
                    return (DigestHistoryDialogFragment.BundleInfo) parcelable;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 12:
                ((DigestSettingsFragment) ((zm7) obj).b).Q().getOnBackPressedDispatcher().d();
                return c1eVar;
            case 13:
                Parcelable parcelable2 = (Parcelable) ht2.r0(dm2.F((DiscoverabilityFragment) obj), "bundle_info", DiscoverabilityFragment.BundleInfo.class);
                if (parcelable2 != null) {
                    return (DiscoverabilityFragment.BundleInfo) parcelable2;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 14:
                Parcelable parcelable3 = (Parcelable) ht2.r0(((DisplaySettingsDialogFragment) obj).R(), "bundle_info", DisplaySettingsDialogFragment.BundleInfo.class);
                if (parcelable3 != null) {
                    return (DisplaySettingsDialogFragment.BundleInfo) parcelable3;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 15:
                return new bw(2, (hm3) obj);
            case 16:
                m73 m73VarA = ((om3) obj).a();
                cud cudVar = nm3.a;
                return Float.valueOf(m73VarA.Z(400.0f));
            case 17:
                Parcelable parcelable4 = (Parcelable) ht2.r0(dm2.F((EditProfileFragment) obj), "bundle_info", EditProfileFragment.BundleInfo.class);
                if (parcelable4 != null) {
                    return (EditProfileFragment.BundleInfo) parcelable4;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 18:
                ju3 ju3Var = (ju3) obj;
                vx0.c0(f76.F(ju3Var), null, null, new gu3(ju3Var, objArr == true ? 1 : 0, c == true ? 1 : 0), 3);
                return c1eVar;
            case 19:
                Context context2 = ((g24) ((pr0) obj).t).a.getContext();
                context2.getClass();
                m4.w(context2, R.id.yourLibraryFragment, c.b("home", YourLibraryTab.YOUR_LISTS, 4), null, 12);
                return c1eVar;
            case 20:
                Parcelable parcelable5 = (Parcelable) ht2.r0(dm2.F((ExploreFragment) obj), "bundle_info", AbstractMediumFragment.BundleInfo.class);
                if (parcelable5 != null) {
                    return (AbstractMediumFragment.BundleInfo) parcelable5;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 21:
                Parcelable parcelable6 = (Parcelable) ht2.r0(dm2.F((ExternalWebViewBottomSheetDialogFragment) obj), "bundle_info", ExternalWebViewBottomSheetDialogFragment.BundleInfo.class);
                if (parcelable6 != null) {
                    return (ExternalWebViewBottomSheetDialogFragment.BundleInfo) parcelable6;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 22:
                Parcelable parcelable7 = (Parcelable) ht2.r0(dm2.F((ExternalWebViewFragment) obj), "bundle_info", ExternalWebViewFragment.BundleInfo.class);
                if (parcelable7 != null) {
                    return (ExternalWebViewFragment.BundleInfo) parcelable7;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 23:
                Parcelable parcelable8 = (Parcelable) ht2.r0(dm2.F((FeaturePostBottomSheetFragment) obj), "bundle_info", FeaturePostBottomSheetFragment.BundleInfo.class);
                if (parcelable8 != null) {
                    return (FeaturePostBottomSheetFragment.BundleInfo) parcelable8;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 24:
                Parcelable parcelable9 = (Parcelable) ht2.r0(dm2.F((FeaturedInPublicationFragment) obj), "bundle_info", FeaturedInPublicationFragment.BundleInfo.class);
                if (parcelable9 != null) {
                    return (FeaturedInPublicationFragment.BundleInfo) parcelable9;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 25:
                Parcelable parcelable10 = (Parcelable) ht2.r0(dm2.F((FeaturedPostsFragment) obj), "bundle_info", FeaturedPostsFragment.BundleInfo.class);
                if (parcelable10 != null) {
                    return (FeaturedPostsFragment.BundleInfo) parcelable10;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 26:
                return FieldOrOneOfBinding.adapter_delegate$lambda$0((FieldOrOneOfBinding) obj);
            case 27:
                Parcelable parcelable11 = (Parcelable) ht2.r0(dm2.F((FindFriendsFragment) obj), "bundle_info", FindFriendsFragment.BundleInfo.class);
                if (parcelable11 != null) {
                    return (FindFriendsFragment.BundleInfo) parcelable11;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 28:
                xi4 xi4Var = (xi4) obj;
                if (xi4Var instanceof ti4) {
                    z = ((ti4) xi4Var).g;
                } else if (xi4Var instanceof vi4) {
                    z = ((vi4) xi4Var).a;
                }
                return Boolean.valueOf(z);
            default:
                ((uk4) obj).a.await();
                return c1eVar;
        }
    }

    public /* synthetic */ nh2(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }
}
