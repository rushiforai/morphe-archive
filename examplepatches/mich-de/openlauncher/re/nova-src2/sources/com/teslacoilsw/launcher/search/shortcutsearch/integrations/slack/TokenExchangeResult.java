package com.teslacoilsw.launcher.search.shortcutsearch.integrations.slack;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import mc0.b;
import mc0.d;
import nv.f;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/teslacoilsw/launcher/search/shortcutsearch/integrations/slack/TokenExchangeResult;", "Landroid/os/Parcelable;", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final /* data */ class TokenExchangeResult implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<TokenExchangeResult> CREATOR = new f(1);

    /* renamed from: a, reason: collision with root package name */
    public final String f46282a;

    /* renamed from: b, reason: collision with root package name */
    public final String f46283b;

    /* renamed from: c, reason: collision with root package name */
    public final String f46284c;

    /* renamed from: d, reason: collision with root package name */
    public final String f46285d;

    public TokenExchangeResult(String str, String str2, String str3, String str4) {
        this.f46282a = str;
        this.f46283b = str2;
        this.f46284c = str3;
        this.f46285d = str4;
    }

    public final boolean b() {
        try {
            if (Intrinsics.b(this.f46282a, "error")) {
                throw new IllegalStateException("status cannot be error");
            }
            if (this.f46283b == null) {
                throw new IllegalStateException("accessToken cannot be null");
            }
            if (this.f46284c == null) {
                throw new IllegalStateException("packageName cannot be null");
            }
            if (this.f46285d != null) {
                return true;
            }
            throw new IllegalStateException("redirectUri cannot be null");
        } catch (IllegalStateException e3) {
            b bVar = d.f76206a;
            bVar.r("TokenExchangeResult");
            bVar.a(e3);
            return false;
        }
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof TokenExchangeResult)) {
            return false;
        }
        TokenExchangeResult tokenExchangeResult = (TokenExchangeResult) obj;
        return Intrinsics.b(this.f46282a, tokenExchangeResult.f46282a) && Intrinsics.b(this.f46283b, tokenExchangeResult.f46283b) && Intrinsics.b(this.f46284c, tokenExchangeResult.f46284c) && Intrinsics.b(this.f46285d, tokenExchangeResult.f46285d);
    }

    public final int hashCode() {
        int iHashCode = this.f46282a.hashCode() * 31;
        String str = this.f46283b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f46284c;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f46285d;
        return iHashCode3 + (str3 != null ? str3.hashCode() : 0);
    }

    public final String toString() {
        return c0.s(c0.w("TokenExchangeResult(status=", this.f46282a, ", accessToken=", this.f46283b, ", packageName="), this.f46284c, ", redirectUri=", this.f46285d, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f46282a);
        parcel.writeString(this.f46283b);
        parcel.writeString(this.f46284c);
        parcel.writeString(this.f46285d);
    }
}
