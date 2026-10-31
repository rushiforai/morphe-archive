package io.branch.search.internal;

import android.net.Uri;
import com.vungle.ads.internal.protos.Sdk;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class U7 {

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final String f63437a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final String f63438b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final String f63439c;

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public final Uri f63440d;

    /* renamed from: e, reason: collision with root package name */
    @Nullable
    public final String f63441e;

    /* renamed from: f, reason: collision with root package name */
    @Nullable
    public final String f63442f;

    /* renamed from: g, reason: collision with root package name */
    @Nullable
    public final String f63443g;

    public U7() {
        this(null, null, null, null, null, null, null, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof U7)) {
            return false;
        }
        U7 u72 = (U7) obj;
        return Intrinsics.b(this.f63437a, u72.f63437a) && Intrinsics.b(this.f63438b, u72.f63438b) && Intrinsics.b(this.f63439c, u72.f63439c) && Intrinsics.b(this.f63440d, u72.f63440d) && Intrinsics.b(this.f63441e, u72.f63441e) && Intrinsics.b(this.f63442f, u72.f63442f) && Intrinsics.b(this.f63443g, u72.f63443g);
    }

    public final int hashCode() {
        String str = this.f63437a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.f63438b;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f63439c;
        int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
        Uri uri = this.f63440d;
        int iHashCode4 = (iHashCode3 + (uri == null ? 0 : uri.hashCode())) * 31;
        String str4 = this.f63441e;
        int iHashCode5 = (iHashCode4 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.f63442f;
        int iHashCode6 = (iHashCode5 + (str5 == null ? 0 : str5.hashCode())) * 31;
        String str6 = this.f63443g;
        return iHashCode6 + (str6 != null ? str6.hashCode() : 0);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("IntentKey(action=");
        sb2.append(this.f63437a);
        sb2.append(", category=");
        sb2.append(this.f63438b);
        sb2.append(", packageName=");
        sb2.append(this.f63439c);
        sb2.append(", data=");
        sb2.append(this.f63440d);
        sb2.append(", type=");
        sb2.append(this.f63441e);
        sb2.append(", className=");
        sb2.append(this.f63442f);
        sb2.append(", uri=");
        return Z.a(sb2, this.f63443g, ')');
    }

    public U7(@Nullable String str, @Nullable String str2, @Nullable String str3, @Nullable Uri uri, @Nullable String str4, @Nullable String str5, @Nullable String str6) {
        this.f63437a = str;
        this.f63438b = str2;
        this.f63439c = str3;
        this.f63440d = uri;
        this.f63441e = str4;
        this.f63442f = str5;
        this.f63443g = str6;
    }

    public /* synthetic */ U7(String str, String str2, String str3, Uri uri, String str4, String str5, String str6, int i5) {
        this((i5 & 1) != 0 ? null : str, (i5 & 2) != 0 ? null : str2, (i5 & 4) != 0 ? null : str3, (i5 & 8) != 0 ? null : uri, (i5 & 16) != 0 ? null : str4, (i5 & 32) != 0 ? null : str5, (i5 & 64) != 0 ? null : str6);
    }
}
