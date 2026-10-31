package com.spotify.sdk.android.auth;

import android.net.Uri;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.HashMap;
import java.util.Map;
import ww.c;

/* loaded from: classes4.dex */
public class AuthorizationRequest implements Parcelable {
    public static final Parcelable.Creator<AuthorizationRequest> CREATOR = new c(5);

    /* renamed from: a, reason: collision with root package name */
    public final String f42405a;

    /* renamed from: b, reason: collision with root package name */
    public final String f42406b;

    /* renamed from: c, reason: collision with root package name */
    public final String f42407c;

    /* renamed from: d, reason: collision with root package name */
    public final String f42408d;

    /* renamed from: e, reason: collision with root package name */
    public final String[] f42409e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f42410f;

    /* renamed from: g, reason: collision with root package name */
    public final Map f42411g;

    /* renamed from: h, reason: collision with root package name */
    public final String f42412h;

    public AuthorizationRequest(Parcel parcel) {
        this.f42405a = parcel.readString();
        this.f42406b = parcel.readString();
        this.f42407c = parcel.readString();
        this.f42408d = parcel.readString();
        this.f42409e = parcel.createStringArray();
        this.f42410f = parcel.readByte() == 1;
        this.f42411g = new HashMap();
        this.f42412h = parcel.readString();
        Bundle bundle = parcel.readBundle(getClass().getClassLoader());
        for (String str : bundle.keySet()) {
            this.f42411g.put(str, bundle.getString(str));
        }
    }

    public final Uri b() {
        Uri.Builder builder = new Uri.Builder();
        Uri.Builder builderAppendQueryParameter = builder.scheme("https").authority("accounts.spotify.com").appendPath("authorize").appendQueryParameter("client_id", this.f42405a).appendQueryParameter("response_type", this.f42406b).appendQueryParameter("redirect_uri", this.f42407c).appendQueryParameter("show_dialog", String.valueOf(this.f42410f)).appendQueryParameter("utm_source", "spotify-sdk").appendQueryParameter("utm_medium", "android-sdk");
        String str = this.f42412h;
        builderAppendQueryParameter.appendQueryParameter("utm_campaign", TextUtils.isEmpty(str) ? "android-sdk" : str);
        String[] strArr = this.f42409e;
        if (strArr != null && strArr.length > 0) {
            StringBuilder sb2 = new StringBuilder();
            for (String str2 : strArr) {
                sb2.append(str2);
                sb2.append(" ");
            }
            builder.appendQueryParameter("scope", sb2.toString().trim());
        }
        String str3 = this.f42408d;
        if (str3 != null) {
            builder.appendQueryParameter("state", str3);
        }
        Map map = this.f42411g;
        if (map.size() > 0) {
            for (Map.Entry entry : map.entrySet()) {
                builder.appendQueryParameter((String) entry.getKey(), (String) entry.getValue());
            }
        }
        return builder.build();
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f42405a);
        parcel.writeString(this.f42406b);
        parcel.writeString(this.f42407c);
        parcel.writeString(this.f42408d);
        parcel.writeStringArray(this.f42409e);
        parcel.writeByte(this.f42410f ? (byte) 1 : (byte) 0);
        parcel.writeString(this.f42412h);
        Bundle bundle = new Bundle();
        for (Map.Entry entry : this.f42411g.entrySet()) {
            bundle.putString((String) entry.getKey(), (String) entry.getValue());
        }
        parcel.writeBundle(bundle);
    }

    public AuthorizationRequest(String str, int i5, String str2, String[] strArr, HashMap map) {
        String str3;
        this.f42405a = str;
        if (i5 == 1) {
            str3 = TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE;
        } else if (i5 == 2) {
            str3 = "token";
        } else if (i5 == 3) {
            str3 = "error";
        } else if (i5 == 4) {
            str3 = "empty";
        } else {
            if (i5 != 5) {
                throw null;
            }
            str3 = "unknown";
        }
        this.f42406b = str3;
        this.f42407c = str2;
        this.f42408d = null;
        this.f42409e = strArr;
        this.f42410f = false;
        this.f42411g = map;
        this.f42412h = null;
    }
}
