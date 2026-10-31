package zi;

import android.os.Bundle;
import java.util.Set;
import kotlin.collections.EmptySet;
import kotlin.jvm.internal.Intrinsics;
import ps.j0;

/* loaded from: classes3.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final Bundle f98528a;

    /* renamed from: b, reason: collision with root package name */
    public final Bundle f98529b;

    /* renamed from: c, reason: collision with root package name */
    public final Set f98530c;

    /* renamed from: d, reason: collision with root package name */
    public final String f98531d;

    public a(String serverClientId) {
        Intrinsics.g(serverClientId, "serverClientId");
        Bundle bundleU = j0.u(serverClientId);
        Bundle bundleU2 = j0.u(serverClientId);
        EmptySet allowedProviders = EmptySet.f71734a;
        Intrinsics.g(allowedProviders, "allowedProviders");
        Intrinsics.g(allowedProviders, "allowedProviders");
        this.f98528a = bundleU;
        this.f98529b = bundleU2;
        this.f98530c = allowedProviders;
        bundleU.putBoolean("androidx.credentials.BUNDLE_KEY_IS_AUTO_SELECT_ALLOWED", false);
        bundleU2.putBoolean("androidx.credentials.BUNDLE_KEY_IS_AUTO_SELECT_ALLOWED", false);
        bundleU.putInt("androidx.credentials.BUNDLE_KEY_TYPE_PRIORITY_VALUE", 500);
        bundleU2.putInt("androidx.credentials.BUNDLE_KEY_TYPE_PRIORITY_VALUE", 500);
        this.f98531d = serverClientId;
        if (serverClientId.length() <= 0) {
            throw new IllegalArgumentException("serverClientId should not be empty");
        }
    }
}
