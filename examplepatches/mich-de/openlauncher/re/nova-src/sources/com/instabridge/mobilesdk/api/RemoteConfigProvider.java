package com.instabridge.mobilesdk.api;

import com.amplitude.android.migration.DatabaseConstants;
import com.instabridge.mobilesdk.api.RemoteConfigProvider;
import com.instabridge.mobilesdk.internal.esim.CarrierConfigurator;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0006\n\u0002\b\u0002\bf\u0018\u0000 \n2\u00020\u0001:\u0001\nJ\u001a\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0003H\u0016J\u001a\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0007H\u0016J\u001a\u0010\b\u001a\u00020\t2\u0006\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\tH\u0016¨\u0006\u000b"}, d2 = {"Lcom/instabridge/mobilesdk/api/RemoteConfigProvider;", b.f42142b, "getString", b.f42142b, DatabaseConstants.KEY_FIELD, CarrierConfigurator.APN_TYPE, "getBoolean", b.f42142b, "getDouble", b.f42142b, k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public interface RemoteConfigProvider {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = Companion.$$INSTANCE;

    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\b"}, d2 = {"Lcom/instabridge/mobilesdk/api/RemoteConfigProvider$Companion;", b.f42142b, "<init>", "()V", "Empty", "Lcom/instabridge/mobilesdk/api/RemoteConfigProvider;", "getEmpty", "()Lcom/instabridge/mobilesdk/api/RemoteConfigProvider;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        static final /* synthetic */ Companion $$INSTANCE = new Companion();

        @NotNull
        private static final RemoteConfigProvider Empty = new RemoteConfigProvider() { // from class: com.instabridge.mobilesdk.api.RemoteConfigProvider$Companion$Empty$1
            @Override // com.instabridge.mobilesdk.api.RemoteConfigProvider
            public boolean getBoolean(String str, boolean z11) {
                return RemoteConfigProvider.DefaultImpls.getBoolean(this, str, z11);
            }

            @Override // com.instabridge.mobilesdk.api.RemoteConfigProvider
            public double getDouble(String str, double d5) {
                return RemoteConfigProvider.DefaultImpls.getDouble(this, str, d5);
            }

            @Override // com.instabridge.mobilesdk.api.RemoteConfigProvider
            public String getString(String str, String str2) {
                return RemoteConfigProvider.DefaultImpls.getString(this, str, str2);
            }
        };

        private Companion() {
        }

        @NotNull
        public final RemoteConfigProvider getEmpty() {
            return Empty;
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    public static final class DefaultImpls {
        public static boolean getBoolean(@NotNull RemoteConfigProvider remoteConfigProvider, @NotNull String key, boolean z11) {
            Intrinsics.g(key, "key");
            return z11;
        }

        public static /* synthetic */ boolean getBoolean$default(RemoteConfigProvider remoteConfigProvider, String str, boolean z11, int i5, Object obj) {
            if (obj != null) {
                throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: getBoolean");
            }
            if ((i5 & 2) != 0) {
                z11 = false;
            }
            return remoteConfigProvider.getBoolean(str, z11);
        }

        public static double getDouble(@NotNull RemoteConfigProvider remoteConfigProvider, @NotNull String key, double d5) {
            Intrinsics.g(key, "key");
            return d5;
        }

        public static /* synthetic */ double getDouble$default(RemoteConfigProvider remoteConfigProvider, String str, double d5, int i5, Object obj) {
            if (obj != null) {
                throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: getDouble");
            }
            if ((i5 & 2) != 0) {
                d5 = 0.0d;
            }
            return remoteConfigProvider.getDouble(str, d5);
        }

        @NotNull
        public static String getString(@NotNull RemoteConfigProvider remoteConfigProvider, @NotNull String key, @NotNull String str) {
            Intrinsics.g(key, "key");
            Intrinsics.g(str, "default");
            return str;
        }

        public static /* synthetic */ String getString$default(RemoteConfigProvider remoteConfigProvider, String str, String str2, int i5, Object obj) {
            if (obj != null) {
                throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: getString");
            }
            if ((i5 & 2) != 0) {
                str2 = b.f42142b;
            }
            return remoteConfigProvider.getString(str, str2);
        }
    }

    boolean getBoolean(@NotNull String key, boolean z11);

    double getDouble(@NotNull String key, double d5);

    @NotNull
    String getString(@NotNull String key, @NotNull String str);
}
