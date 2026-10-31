package com.instabridge.mobilesdk.internal.auth;

import com.instabridge.mobilesdk.Brand;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0000\bÁ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0018\u0010\n\u001a\u0004\u0018\u00010\u00052\u0006\u0010\u000b\u001a\u00020\b2\u0006\u0010\f\u001a\u00020\rR\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u001a\u0010\u0006\u001a\u000e\u0012\u0004\u0012\u00020\b\u0012\u0004\u0012\u00020\u00050\u0007X\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010\t\u001a\u000e\u0012\u0004\u0012\u00020\b\u0012\u0004\u0012\u00020\u00050\u0007X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u000e"}, d2 = {"Lcom/instabridge/mobilesdk/internal/auth/GoogleOAuthIds;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "EYECON_WEB_CLIENT_ID", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "DEV", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/instabridge/mobilesdk/Brand;", "PROD", "defaultFor", "brand", "debug", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class GoogleOAuthIds {
    public static final int $stable;

    @NotNull
    private static final Map<Brand, String> DEV;

    @NotNull
    private static final String EYECON_WEB_CLIENT_ID = "820458390093-5bi3hdnbtrj6lugkjm0t1ot6sftk7cgq.apps.googleusercontent.com";

    @NotNull
    public static final GoogleOAuthIds INSTANCE = new GoogleOAuthIds();

    @NotNull
    private static final Map<Brand, String> PROD;

    static {
        Brand brand = Brand.INSTABRIDGE;
        Pair pair = new Pair(brand, "1058397901278-vjlh37mu4ama0v46dqrms61ci3t94l2i.apps.googleusercontent.com");
        Brand brand2 = Brand.NOVA;
        Pair pair2 = new Pair(brand2, "122365091362-gi4e98mhi76dfb2eg9cetrrtusctkseu.apps.googleusercontent.com");
        Brand brand3 = Brand.EYECON;
        DEV = MapsKt.j0(pair, pair2, new Pair(brand3, EYECON_WEB_CLIENT_ID));
        PROD = MapsKt.j0(new Pair(brand, "1058397901278-vjlh37mu4ama0v46dqrms61ci3t94l2i.apps.googleusercontent.com"), new Pair(brand2, "747441958287-gki6qgj07or293npcieq5pqomuuaj3l2.apps.googleusercontent.com"), new Pair(brand3, EYECON_WEB_CLIENT_ID));
        $stable = 8;
    }

    private GoogleOAuthIds() {
    }

    @Nullable
    public final String defaultFor(@NotNull Brand brand, boolean debug) {
        Intrinsics.g(brand, "brand");
        return (debug ? DEV : PROD).get(brand);
    }
}
