package com.teslacoilsw.launcher.search.shortcutsearch.authorization;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import gi.g;
import h20.a;
import java.util.Arrays;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/teslacoilsw/launcher/search/shortcutsearch/authorization/DefaultOAuthRequest;", "Landroid/os/Parcelable;", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class DefaultOAuthRequest implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<DefaultOAuthRequest> CREATOR = new g(19);

    /* renamed from: a, reason: collision with root package name */
    public final String f46273a;

    /* renamed from: b, reason: collision with root package name */
    public final String f46274b;

    /* renamed from: c, reason: collision with root package name */
    public final String f46275c;

    /* renamed from: d, reason: collision with root package name */
    public final String f46276d;

    /* renamed from: e, reason: collision with root package name */
    public final String[] f46277e;

    /* renamed from: f, reason: collision with root package name */
    public final a f46278f;

    public DefaultOAuthRequest(String str, String str2, String str3, String str4, String[] strArr, a aVar) {
        this.f46273a = str;
        this.f46274b = str2;
        this.f46275c = str3;
        this.f46276d = str4;
        this.f46277e = strArr;
        this.f46278f = aVar;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof DefaultOAuthRequest)) {
            return false;
        }
        DefaultOAuthRequest defaultOAuthRequest = (DefaultOAuthRequest) obj;
        return Intrinsics.b(this.f46273a, defaultOAuthRequest.f46273a) && Intrinsics.b(this.f46274b, defaultOAuthRequest.f46274b) && Intrinsics.b(this.f46275c, defaultOAuthRequest.f46275c) && Intrinsics.b(this.f46276d, defaultOAuthRequest.f46276d) && Intrinsics.b(this.f46277e, defaultOAuthRequest.f46277e) && this.f46278f == defaultOAuthRequest.f46278f;
    }

    public final int hashCode() {
        return this.f46278f.hashCode() + ((c0.e(c0.e(c0.e(this.f46273a.hashCode() * 31, 31, this.f46274b), 31, this.f46275c), 31, this.f46276d) + Arrays.hashCode(this.f46277e)) * 31);
    }

    public final String toString() {
        String string = Arrays.toString(this.f46277e);
        StringBuilder sbW = c0.w("DefaultOAuthRequest(clientId=", this.f46273a, ", redirect=", this.f46274b, ", urlAuthorize=");
        c0.D(sbW, this.f46275c, ", state=", this.f46276d, ", scopes=");
        sbW.append(string);
        sbW.append(", type=");
        sbW.append(this.f46278f);
        sbW.append(")");
        return sbW.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f46273a);
        parcel.writeString(this.f46274b);
        parcel.writeString(this.f46275c);
        parcel.writeString(this.f46276d);
        parcel.writeStringArray(this.f46277e);
        parcel.writeString(this.f46278f.name());
    }

    public /* synthetic */ DefaultOAuthRequest(String str, String str2, String str3, String str4, String[] strArr) {
        this(str, str2, str3, str4, strArr, a.f59031a);
    }
}
