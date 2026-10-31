package com.stripe.android.link.model;

import a80.m;
import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.ConsumerSession;
import com.stripe.android.model.DisplayablePaymentDetails;
import com.stripe.android.model.MobileFallbackWebviewParams;
import ft.j0;
import java.util.Iterator;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.CharRange;
import kw.z1;
import ls.d;
import ls.e;
import ls.f;
import org.jetbrains.annotations.NotNull;
import r70.j;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/link/model/LinkAccount;", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class LinkAccount implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<LinkAccount> CREATOR = new ji.a(20);

    /* renamed from: a, reason: collision with root package name */
    public final ConsumerSession f43009a;

    /* renamed from: b, reason: collision with root package name */
    public final String f43010b;

    /* renamed from: c, reason: collision with root package name */
    public final DisplayablePaymentDetails f43011c;

    /* renamed from: d, reason: collision with root package name */
    public final LinkAuthIntentInfo f43012d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f43013e;

    /* renamed from: f, reason: collision with root package name */
    public final String f43014f;

    /* renamed from: g, reason: collision with root package name */
    public final String f43015g;

    /* renamed from: h, reason: collision with root package name */
    public final String f43016h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f43017i;

    /* renamed from: j, reason: collision with root package name */
    public final boolean f43018j;

    /* renamed from: k, reason: collision with root package name */
    public final boolean f43019k;

    /* renamed from: l, reason: collision with root package name */
    public final f f43020l;

    /* renamed from: m, reason: collision with root package name */
    public final String f43021m;

    /* JADX WARN: Removed duplicated region for block: B:16:0x005f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public LinkAccount(ConsumerSession consumerSession, String str, DisplayablePaymentDetails displayablePaymentDetails, LinkAuthIntentInfo linkAuthIntentInfo, boolean z11) {
        Object next;
        f bVar;
        String str2;
        Object next2;
        Intrinsics.g(consumerSession, "consumerSession");
        this.f43009a = consumerSession;
        this.f43010b = str;
        this.f43011c = displayablePaymentDetails;
        this.f43012d = linkAuthIntentInfo;
        this.f43013e = z11;
        boolean z12 = false;
        this.f43014f = j.F0(consumerSession.f43318c, "*", "•", false);
        this.f43015g = consumerSession.f43316a;
        this.f43016h = consumerSession.f43317b;
        this.f43017i = a(consumerSession);
        if (a(consumerSession) || d(consumerSession)) {
            z12 = true;
        } else {
            Iterator it = consumerSession.f43322g.iterator();
            while (true) {
                if (!it.hasNext()) {
                    next2 = null;
                    break;
                }
                next2 = it.next();
                ConsumerSession.VerificationSession verificationSession = (ConsumerSession.VerificationSession) next2;
                if (verificationSession.f43325a == ConsumerSession.VerificationSession.SessionType.f43336d && verificationSession.f43326b == ConsumerSession.VerificationSession.SessionState.f43330e) {
                    break;
                }
            }
            if (next2 != null) {
            }
        }
        this.f43018j = z12;
        this.f43019k = d(this.f43009a);
        if (z12) {
            boolean z13 = this.f43017i;
            LinkAuthIntentInfo linkAuthIntentInfo2 = this.f43012d;
            bVar = new e(z13, linkAuthIntentInfo2 != null ? linkAuthIntentInfo2.f43023b : null);
        } else {
            Iterator it2 = this.f43009a.f43322g.iterator();
            while (true) {
                if (!it2.hasNext()) {
                    next = null;
                    break;
                }
                next = it2.next();
                ConsumerSession.VerificationSession verificationSession2 = (ConsumerSession.VerificationSession) next;
                if (verificationSession2.f43325a == ConsumerSession.VerificationSession.SessionType.f43338f && verificationSession2.f43326b == ConsumerSession.VerificationSession.SessionState.f43329d) {
                    break;
                }
            }
            if (next != null) {
                bVar = d.f75090a;
            } else {
                MobileFallbackWebviewParams mobileFallbackWebviewParams = this.f43009a.f43323h;
                bVar = new ls.b((mobileFallbackWebviewParams == null || (str2 = mobileFallbackWebviewParams.f43530b) == null || mobileFallbackWebviewParams.f43529a != j0.f55951d) ? null : str2);
            }
        }
        this.f43020l = bVar;
        MobileFallbackWebviewParams mobileFallbackWebviewParams2 = this.f43009a.f43323h;
        this.f43021m = mobileFallbackWebviewParams2 != null ? mobileFallbackWebviewParams2.f43530b : null;
    }

    public static boolean a(ConsumerSession consumerSession) {
        Object next;
        Iterator it = consumerSession.f43322g.iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            ConsumerSession.VerificationSession verificationSession = (ConsumerSession.VerificationSession) next;
            if (verificationSession.f43325a == ConsumerSession.VerificationSession.SessionType.f43338f && verificationSession.f43326b == ConsumerSession.VerificationSession.SessionState.f43330e) {
                break;
            }
        }
        return next != null;
    }

    public static boolean d(ConsumerSession consumerSession) {
        Object next;
        Iterator it = consumerSession.f43322g.iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            ConsumerSession.VerificationSession verificationSession = (ConsumerSession.VerificationSession) next;
            if (verificationSession.f43325a == ConsumerSession.VerificationSession.SessionType.f43337e && verificationSession.f43326b == ConsumerSession.VerificationSession.SessionState.f43329d) {
                break;
            }
        }
        return next != null;
    }

    public final String b() {
        ConsumerSession consumerSession = this.f43009a;
        String str = consumerSession.f43320e;
        String str2 = consumerSession.f43321f;
        if (str == null || str2 == null) {
            return null;
        }
        CharRange charRange = z1.f72740a;
        return i30.j.A(str2).e(str);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof LinkAccount)) {
            return false;
        }
        LinkAccount linkAccount = (LinkAccount) obj;
        return Intrinsics.b(this.f43009a, linkAccount.f43009a) && Intrinsics.b(this.f43010b, linkAccount.f43010b) && Intrinsics.b(this.f43011c, linkAccount.f43011c) && Intrinsics.b(this.f43012d, linkAccount.f43012d) && this.f43013e == linkAccount.f43013e;
    }

    public final int hashCode() {
        int iHashCode = this.f43009a.hashCode() * 31;
        String str = this.f43010b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        DisplayablePaymentDetails displayablePaymentDetails = this.f43011c;
        int iHashCode3 = (iHashCode2 + (displayablePaymentDetails == null ? 0 : displayablePaymentDetails.hashCode())) * 31;
        LinkAuthIntentInfo linkAuthIntentInfo = this.f43012d;
        return Boolean.hashCode(this.f43013e) + ((iHashCode3 + (linkAuthIntentInfo != null ? linkAuthIntentInfo.hashCode() : 0)) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("LinkAccount(consumerSession=");
        sb2.append(this.f43009a);
        sb2.append(", consumerPublishableKey=");
        sb2.append(this.f43010b);
        sb2.append(", displayablePaymentDetails=");
        sb2.append(this.f43011c);
        sb2.append(", linkAuthIntentInfo=");
        sb2.append(this.f43012d);
        sb2.append(", viewedWebviewOpenUrl=");
        return m.k(sb2, this.f43013e, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f43009a, i5);
        dest.writeString(this.f43010b);
        dest.writeParcelable(this.f43011c, i5);
        LinkAuthIntentInfo linkAuthIntentInfo = this.f43012d;
        if (linkAuthIntentInfo == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            linkAuthIntentInfo.writeToParcel(dest, i5);
        }
        dest.writeInt(this.f43013e ? 1 : 0);
    }
}
