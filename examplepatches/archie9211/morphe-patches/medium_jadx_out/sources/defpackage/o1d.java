package defpackage;

import android.app.PendingIntent;
import android.content.Context;
import android.os.Bundle;
import com.medium.reader.R;
import com.medium.refinerecommendations.RefineRecommendationsFragment;
import com.medium.refinerecommendations.suggestions.seeall.friends.AllSuggestionsFriendsFragment;
import com.medium.refinerecommendations.suggestions.seeall.publications.AllSuggestionsPublicationsFragment;
import com.medium.refinerecommendations.suggestions.seeall.tags.AllSuggestedTagsFragment;
import com.medium.refinerecommendations.suggestions.seeall.writers.AllSuggestedWritersFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class o1d implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ q1d b;
    public final /* synthetic */ String c;

    public /* synthetic */ o1d(q1d q1dVar, String str, int i) {
        this.a = i;
        this.b = q1dVar;
        this.c = str;
    }

    @Override // defpackage.m45
    public final Object invoke() throws PendingIntent.CanceledException {
        int i = this.a;
        c1e c1eVar = c1e.a;
        String str = this.c;
        q1d q1dVar = this.b;
        switch (i) {
            case 0:
                q1dVar.getClass();
                str.getClass();
                RefineRecommendationsFragment refineRecommendationsFragment = ((uza) q1dVar.b.a).a;
                refineRecommendationsFragment.Z();
                Context contextS = refineRecommendationsFragment.S();
                Bundle bundle = new Bundle();
                bundle.putParcelable("bundle_info", new AllSuggestedTagsFragment.BundleInfo(str));
                m4.w(contextS, R.id.allSuggestedTagsFragment, bundle, null, 12);
                break;
            case 1:
                q1dVar.getClass();
                str.getClass();
                RefineRecommendationsFragment refineRecommendationsFragment2 = ((uza) q1dVar.b.a).a;
                refineRecommendationsFragment2.Z();
                Context contextS2 = refineRecommendationsFragment2.S();
                Bundle bundle2 = new Bundle();
                bundle2.putParcelable("bundle_info", new AllSuggestionsPublicationsFragment.BundleInfo(str));
                m4.w(contextS2, R.id.allSuggestedPublicationsFragment, bundle2, null, 12);
                break;
            case 2:
                q1dVar.getClass();
                str.getClass();
                RefineRecommendationsFragment refineRecommendationsFragment3 = ((uza) q1dVar.b.a).a;
                refineRecommendationsFragment3.Z();
                Context contextS3 = refineRecommendationsFragment3.S();
                Bundle bundle3 = new Bundle();
                bundle3.putParcelable("bundle_info", new AllSuggestionsFriendsFragment.BundleInfo(str));
                m4.w(contextS3, R.id.allSuggestionsFriendsFragment, bundle3, null, 12);
                break;
            default:
                q1dVar.getClass();
                str.getClass();
                RefineRecommendationsFragment refineRecommendationsFragment4 = ((uza) q1dVar.b.a).a;
                refineRecommendationsFragment4.Z();
                Context contextS4 = refineRecommendationsFragment4.S();
                Bundle bundle4 = new Bundle();
                bundle4.putParcelable("bundle_info", new AllSuggestedWritersFragment.BundleInfo(str));
                m4.w(contextS4, R.id.allSuggestedWritersFragment, bundle4, null, 12);
                break;
        }
        return c1eVar;
    }
}
