package io.branch.search;

import android.os.Parcel;
import android.os.Parcelable;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import io.branch.search.internal.C3296o5;
import io.branch.search.internal.F6;
import io.branch.search.internal.Z;
import java.util.UUID;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.json.JSONException;
import org.json.JSONObject;
import ww.c;
import y40.a;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0001\u0003¨\u0006\u0004"}, d2 = {"Lio/branch/search/AnalyticsEvent;", "Landroid/os/Parcelable;", k.O, "y40/a", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes.dex */
public final /* data */ class AnalyticsEvent implements Parcelable {

    /* renamed from: a, reason: collision with root package name */
    public final String f61883a;

    /* renamed from: b, reason: collision with root package name */
    public String f61884b;

    /* renamed from: c, reason: collision with root package name */
    public final JSONObject f61885c;

    @NotNull
    public static final a Companion = new a();

    @NotNull
    public static final Parcelable.Creator<AnalyticsEvent> CREATOR = new c(17);

    public AnalyticsEvent(String eventType, String str) throws JSONException {
        Intrinsics.g(eventType, "eventType");
        this.f61883a = eventType;
        this.f61884b = str;
        JSONObject jSONObject = str != null ? new JSONObject(str) : new JSONObject();
        this.f61885c = jSONObject;
        try {
            jSONObject.put("timestamp", System.currentTimeMillis());
        } catch (JSONException unused) {
            C3296o5.a(UUID.randomUUID().toString(), this.f61883a);
        }
    }

    public final void a(String str, Object obj) throws JSONException {
        JSONObject jSONObject = this.f61885c;
        try {
            jSONObject.put(str, obj);
            this.f61884b = jSONObject.toString();
        } catch (JSONException e3) {
            String string = UUID.randomUUID().toString();
            String str2 = "passed in non json compliant object: " + obj + ", for key " + str;
            C3296o5.a aVar = C3296o5.f65426a;
            C3296o5.a(new F6(string, this.f61883a, str2, e3, null));
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
        if (!(obj instanceof AnalyticsEvent)) {
            return false;
        }
        AnalyticsEvent analyticsEvent = (AnalyticsEvent) obj;
        return Intrinsics.b(this.f61883a, analyticsEvent.f61883a) && Intrinsics.b(this.f61884b, analyticsEvent.f61884b);
    }

    public final int hashCode() {
        int iHashCode = this.f61883a.hashCode() * 31;
        String str = this.f61884b;
        return iHashCode + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("AnalyticsEvent(eventType=");
        sb2.append(this.f61883a);
        sb2.append(", rawData=");
        return Z.a(sb2, this.f61884b, ')');
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel out, int i5) {
        Intrinsics.g(out, "out");
        out.writeString(this.f61883a);
        out.writeString(this.f61884b);
    }

    public /* synthetic */ AnalyticsEvent() {
        this("activation_status_changed_events", null);
    }
}
