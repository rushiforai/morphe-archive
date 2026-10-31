package h10;

import android.net.Uri;
import com.teslacoilsw.launcher.search.NovaCustomSearchProvider;

/* loaded from: classes4.dex */
public abstract class p1 {

    /* renamed from: a, reason: collision with root package name */
    public static final NovaCustomSearchProvider f58956a;

    /* renamed from: b, reason: collision with root package name */
    public static final NovaCustomSearchProvider f58957b;

    static {
        Uri uri = Uri.parse(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        f58956a = new NovaCustomSearchProvider("HEADER", uri, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, uri);
        Uri uri2 = Uri.parse(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        f58957b = new NovaCustomSearchProvider("DIVIDER", uri2, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, uri2);
    }
}
