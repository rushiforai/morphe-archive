package ni;

import android.os.Bundle;
import java.util.Map;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class q {

    /* renamed from: a, reason: collision with root package name */
    public final Set f78308a;

    /* renamed from: b, reason: collision with root package name */
    public final String f78309b;

    /* renamed from: c, reason: collision with root package name */
    public final Map f78310c;

    /* renamed from: d, reason: collision with root package name */
    public final Bundle f78311d;

    /* renamed from: e, reason: collision with root package name */
    public final Set f78312e;

    /* renamed from: f, reason: collision with root package name */
    public final Set f78313f;

    /* renamed from: g, reason: collision with root package name */
    public final Map f78314g;

    /* renamed from: h, reason: collision with root package name */
    public final String f78315h;

    public q(String str, Set categoryExclusions, String str2, Map customTargeting, Bundle googleExtrasBundle, Set keywords, Set neighboringContentUrls, Map adSourceExtrasBundles, String str3) {
        Intrinsics.g(categoryExclusions, "categoryExclusions");
        Intrinsics.g(customTargeting, "customTargeting");
        Intrinsics.g(googleExtrasBundle, "googleExtrasBundle");
        Intrinsics.g(keywords, "keywords");
        Intrinsics.g(neighboringContentUrls, "neighboringContentUrls");
        Intrinsics.g(adSourceExtrasBundles, "adSourceExtrasBundles");
        this.f78308a = categoryExclusions;
        this.f78309b = str2;
        this.f78310c = customTargeting;
        this.f78311d = googleExtrasBundle;
        this.f78312e = keywords;
        this.f78313f = neighboringContentUrls;
        this.f78314g = adSourceExtrasBundles;
        this.f78315h = str3;
    }

    public abstract String l();
}
