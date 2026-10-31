package ni;

import android.os.Bundle;
import java.util.Map;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public class k extends q {

    /* renamed from: i, reason: collision with root package name */
    public final String f78283i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k(String adUnitId, Set categoryExclusions, String str, Map customTargeting, Bundle googleExtrasBundle, Set keywords, Set neighboringContentUrls, Map adSourceExtrasBundles, String str2) {
        super(adUnitId, categoryExclusions, str, customTargeting, googleExtrasBundle, keywords, neighboringContentUrls, adSourceExtrasBundles, str2);
        Intrinsics.g(adUnitId, "adUnitId");
        Intrinsics.g(categoryExclusions, "categoryExclusions");
        Intrinsics.g(customTargeting, "customTargeting");
        Intrinsics.g(googleExtrasBundle, "googleExtrasBundle");
        Intrinsics.g(keywords, "keywords");
        Intrinsics.g(neighboringContentUrls, "neighboringContentUrls");
        Intrinsics.g(adSourceExtrasBundles, "adSourceExtrasBundles");
        this.f78283i = adUnitId;
    }

    @Override // ni.q
    public final String l() {
        return this.f78283i;
    }
}
