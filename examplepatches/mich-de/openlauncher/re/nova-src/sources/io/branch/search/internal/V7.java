package io.branch.search.internal;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import com.vungle.ads.internal.protos.Sdk;
import java.net.URISyntaxException;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class V7 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final U7 f63505a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final Intent f63506b;

    public V7(U7 u72, Intent intent) {
        this.f63505a = u72;
        this.f63506b = intent;
    }

    public static final class a {
        @JvmStatic
        @NotNull
        public static V7 a(@NotNull String action, @Nullable String str, @Nullable Uri uri, @Nullable String str2, @Nullable String str3, @Nullable String str4) {
            Intrinsics.g(action, "action");
            U7 u72 = new U7(action, str3, str, uri, str2, str4, null, 64);
            Intent intent = new Intent(action);
            if (uri != null) {
                intent.setData(uri);
            }
            if (str2 != null) {
                intent.setType(str2);
            }
            if (str3 != null) {
                intent.addCategory(str3);
            }
            if (str != null && str4 != null) {
                intent.setClassName(str, str4);
            } else if (str != null) {
                intent.setPackage(str);
            }
            return new V7(u72, intent);
        }

        @JvmStatic
        @Nullable
        public static V7 a(@NotNull Context context, @NotNull String packageName) {
            Intrinsics.g(context, "context");
            Intrinsics.g(packageName, "packageName");
            Intent launchIntentForPackage = context.getPackageManager().getLaunchIntentForPackage(packageName);
            if (launchIntentForPackage != null) {
                return new V7(new U7(null, "android.intent.category.LAUNCHER", packageName, null, null, null, null, Sdk.SDKError.Reason.TPAT_ERROR_VALUE), launchIntentForPackage);
            }
            return null;
        }

        @JvmStatic
        @Nullable
        public static V7 a(@Nullable String str) throws URISyntaxException {
            if (str == null || str.length() <= 0) {
                return null;
            }
            U7 u72 = new U7("URI", null, null, null, null, null, str, 62);
            Intent uri = Intent.parseUri(str, 1);
            Intrinsics.f(uri, "parseUri(uri, Intent.URI_INTENT_SCHEME)");
            return new V7(u72, uri);
        }

        @JvmStatic
        @NotNull
        public static V7 a(@NotNull Uri data, @Nullable String str) {
            Intrinsics.g(data, "data");
            U7 u72 = new U7("android.intent.action.VIEW", null, str, data, null, null, null, 114);
            Intent intent = new Intent("android.intent.action.VIEW", data);
            if (str != null) {
                intent.setPackage(str);
            }
            return new V7(u72, intent);
        }
    }
}
