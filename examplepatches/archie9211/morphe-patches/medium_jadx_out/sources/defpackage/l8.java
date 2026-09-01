package defpackage;

import android.os.Parcelable;
import androidx.credentials.playservices.controllers.identityauth.beginsignin.CredentialProviderBeginSignInController;
import androidx.credentials.playservices.controllers.identityauth.createpassword.CredentialProviderCreatePasswordController;
import androidx.credentials.playservices.controllers.identitycredentials.createdigitalcredential.CreateDigitalCredentialController;
import com.medium.android.admin.admintools.AdminToolsFragment;
import com.medium.android.catalogs.catalogdetail.CatalogDetailFragment;
import com.medium.android.donkey.audio.AudioService;
import com.medium.android.susi.ui.addInfo.AddInfoFragment;
import com.medium.android.susi.ui.auth.AuthFragment;
import com.medium.refinerecommendations.following.seeall.tags.AllFollowedTagsFragment;
import com.medium.refinerecommendations.suggestions.seeall.friends.AllSuggestionsFriendsFragment;
import com.medium.refinerecommendations.suggestions.seeall.publications.AllSuggestionsPublicationsFragment;
import com.medium.refinerecommendations.suggestions.seeall.tags.AllSuggestedTagsFragment;
import com.medium.refinerecommendations.suggestions.seeall.writers.AllSuggestedWritersFragment;
import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class l8 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ l8(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object next = null;
        Object obj = this.b;
        switch (i) {
            case 0:
                Parcelable parcelable = (Parcelable) ht2.r0(dm2.F((AddInfoFragment) obj), "bundle_info", AddInfoFragment.BundleInfo.class);
                if (parcelable != null) {
                    return (AddInfoFragment.BundleInfo) parcelable;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 1:
                Parcelable parcelable2 = (Parcelable) ht2.r0(dm2.F((AdminToolsFragment) obj), "bundle_info", AdminToolsFragment.BundleInfo.class);
                if (parcelable2 != null) {
                    return (AdminToolsFragment.BundleInfo) parcelable2;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 2:
                ((me) obj).a();
                return c1eVar;
            case 3:
                ((AllFollowedTagsFragment) ((zg7) obj).b).Q().getOnBackPressedDispatcher().d();
                return c1eVar;
            case 4:
                Parcelable parcelable3 = (Parcelable) ht2.r0(dm2.F((AllSuggestedTagsFragment) obj), "bundle_info", AllSuggestedTagsFragment.BundleInfo.class);
                if (parcelable3 != null) {
                    return (AllSuggestedTagsFragment.BundleInfo) parcelable3;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 5:
                Parcelable parcelable4 = (Parcelable) ht2.r0(dm2.F((AllSuggestedWritersFragment) obj), "bundle_info", AllSuggestedWritersFragment.BundleInfo.class);
                if (parcelable4 != null) {
                    return (AllSuggestedWritersFragment.BundleInfo) parcelable4;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 6:
                Parcelable parcelable5 = (Parcelable) ht2.r0(dm2.F((AllSuggestionsFriendsFragment) obj), "bundle_info", AllSuggestionsFriendsFragment.BundleInfo.class);
                if (parcelable5 != null) {
                    return (AllSuggestionsFriendsFragment.BundleInfo) parcelable5;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 7:
                Parcelable parcelable6 = (Parcelable) ht2.r0(dm2.F((AllSuggestionsPublicationsFragment) obj), "bundle_info", AllSuggestionsPublicationsFragment.BundleInfo.class);
                if (parcelable6 != null) {
                    return (AllSuggestionsPublicationsFragment.BundleInfo) parcelable6;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 8:
                wgf.y((yr) obj);
                return c1eVar;
            case 9:
                return ((ygd) obj).P();
            case 10:
                return w2g.A((Object[]) obj);
            case 11:
                ArrayList arrayList = new ArrayList();
                for (Object obj2 : (ArrayList) obj) {
                    if (((kb9) obj2).a != null) {
                        arrayList.add(obj2);
                    }
                }
                Iterator it2 = arrayList.iterator();
                if (it2.hasNext()) {
                    next = it2.next();
                    if (it2.hasNext()) {
                        long j = ((kb9) next).b;
                        do {
                            Object next2 = it2.next();
                            long j2 = ((kb9) next2).b;
                            if (j < j2) {
                                next = next2;
                                j = j2;
                            }
                        } while (it2.hasNext());
                    }
                }
                return (kb9) next;
            case 12:
                int i2 = AudioService.j;
                return new mj8((AudioService) obj);
            case 13:
                Parcelable parcelable7 = (Parcelable) ht2.r0(dm2.F((AuthFragment) obj), "bundle_info", AuthFragment.BundleInfo.class);
                if (parcelable7 != null) {
                    return (AuthFragment.BundleInfo) parcelable7;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 14:
                return (mx) obj;
            case 15:
                return wr0.b((wr0) obj);
            case 16:
                return Float.valueOf(((Number) ((ub7) obj).getValue()).floatValue());
            case 17:
                return Float.valueOf(((nx0) obj).a.a.f());
            case 18:
                return Float.valueOf(((mx0) obj).a.e.j());
            case 19:
                return (zwa) obj;
            case 20:
                Parcelable parcelable8 = (Parcelable) ht2.r0(dm2.F((CatalogDetailFragment) obj), "bundle_info", CatalogDetailFragment.BundleInfo.class);
                if (parcelable8 != null) {
                    return (CatalogDetailFragment.BundleInfo) parcelable8;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 21:
                String str = ((lt1) obj).f;
                return Boolean.valueOf(!(str == null || str.length() == 0));
            case 22:
                return ((Iterable) obj).iterator();
            case 23:
                return d46.Q((f09) obj);
            case 24:
                return ((s26) obj).D(":memory:");
            case 25:
                return new eid((hw8) obj, 0.0f);
            case 26:
                return ((kx6) obj).d();
            case 27:
                return CreateDigitalCredentialController.handleResponse$lambda$2((CreateDigitalCredentialController) obj);
            case 28:
                return CredentialProviderBeginSignInController.invokePlayServices$lambda$0$0((CredentialProviderBeginSignInController) obj);
            default:
                return CredentialProviderCreatePasswordController.invokePlayServices$lambda$0$0((CredentialProviderCreatePasswordController) obj);
        }
    }
}
