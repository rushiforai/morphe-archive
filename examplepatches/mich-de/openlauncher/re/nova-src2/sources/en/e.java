package en;

import android.net.Uri;
import com.moloco.sdk.internal.services.bidtoken.s;
import java.net.URL;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final bn.b f52828a;

    /* renamed from: b, reason: collision with root package name */
    public final CoroutineContext f52829b;

    public e(bn.b appInfo, CoroutineContext blockingDispatcher) {
        Intrinsics.g(appInfo, "appInfo");
        Intrinsics.g(blockingDispatcher, "blockingDispatcher");
        this.f52828a = appInfo;
        this.f52829b = blockingDispatcher;
    }

    public static final URL a(e eVar) {
        eVar.getClass();
        Uri.Builder builderAppendPath = new Uri.Builder().scheme("https").authority("firebase-settings.crashlytics.com").appendPath("spi").appendPath(s.f37884a).appendPath("platforms").appendPath("android").appendPath("gmp");
        bn.b bVar = eVar.f52828a;
        Uri.Builder builderAppendPath2 = builderAppendPath.appendPath(bVar.f18126a).appendPath("settings");
        bn.a aVar = bVar.f18127b;
        return new URL(builderAppendPath2.appendQueryParameter("build_version", aVar.f18118c).appendQueryParameter("display_version", aVar.f18117b).build().toString());
    }
}
