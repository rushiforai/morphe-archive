package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.StripeIntent;
import java.io.ByteArrayInputStream;
import java.io.Serializable;
import java.security.PublicKey;
import java.security.cert.Certificate;
import java.security.cert.CertificateException;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0081\b\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/Stripe3ds2Fingerprint;", "Landroid/os/Parcelable;", "DirectoryServerEncryption", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class Stripe3ds2Fingerprint implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<Stripe3ds2Fingerprint> CREATOR = new o5();

    /* renamed from: a, reason: collision with root package name */
    public final String f43924a;

    /* renamed from: b, reason: collision with root package name */
    public final String f43925b;

    /* renamed from: c, reason: collision with root package name */
    public final String f43926c;

    /* renamed from: d, reason: collision with root package name */
    public final DirectoryServerEncryption f43927d;

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/Stripe3ds2Fingerprint$DirectoryServerEncryption;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class DirectoryServerEncryption implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<DirectoryServerEncryption> CREATOR = new p5();

        /* renamed from: a, reason: collision with root package name */
        public final String f43928a;

        /* renamed from: b, reason: collision with root package name */
        public final PublicKey f43929b;

        /* renamed from: c, reason: collision with root package name */
        public final ArrayList f43930c;

        /* renamed from: d, reason: collision with root package name */
        public final String f43931d;

        public DirectoryServerEncryption(String directoryServerId, PublicKey directoryServerPublicKey, ArrayList arrayList, String str) {
            Intrinsics.g(directoryServerId, "directoryServerId");
            Intrinsics.g(directoryServerPublicKey, "directoryServerPublicKey");
            this.f43928a = directoryServerId;
            this.f43929b = directoryServerPublicKey;
            this.f43930c = arrayList;
            this.f43931d = str;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof DirectoryServerEncryption)) {
                return false;
            }
            DirectoryServerEncryption directoryServerEncryption = (DirectoryServerEncryption) obj;
            return Intrinsics.b(this.f43928a, directoryServerEncryption.f43928a) && Intrinsics.b(this.f43929b, directoryServerEncryption.f43929b) && this.f43930c.equals(directoryServerEncryption.f43930c) && Intrinsics.b(this.f43931d, directoryServerEncryption.f43931d);
        }

        public final int hashCode() {
            int iHashCode = (this.f43930c.hashCode() + ((this.f43929b.hashCode() + (this.f43928a.hashCode() * 31)) * 31)) * 31;
            String str = this.f43931d;
            return iHashCode + (str == null ? 0 : str.hashCode());
        }

        public final String toString() {
            return "DirectoryServerEncryption(directoryServerId=" + this.f43928a + ", directoryServerPublicKey=" + this.f43929b + ", rootCerts=" + this.f43930c + ", keyId=" + this.f43931d + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43928a);
            dest.writeSerializable(this.f43929b);
            Iterator itJ = fq.c.j(this.f43930c, dest);
            while (itJ.hasNext()) {
                dest.writeSerializable((Serializable) itJ.next());
            }
            dest.writeString(this.f43931d);
        }
    }

    public Stripe3ds2Fingerprint(String source, String directoryServerName, String serverTransactionId, DirectoryServerEncryption directoryServerEncryption) {
        Intrinsics.g(source, "source");
        Intrinsics.g(directoryServerName, "directoryServerName");
        Intrinsics.g(serverTransactionId, "serverTransactionId");
        Intrinsics.g(directoryServerEncryption, "directoryServerEncryption");
        this.f43924a = source;
        this.f43925b = directoryServerName;
        this.f43926c = serverTransactionId;
        this.f43927d = directoryServerEncryption;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Stripe3ds2Fingerprint)) {
            return false;
        }
        Stripe3ds2Fingerprint stripe3ds2Fingerprint = (Stripe3ds2Fingerprint) obj;
        return Intrinsics.b(this.f43924a, stripe3ds2Fingerprint.f43924a) && Intrinsics.b(this.f43925b, stripe3ds2Fingerprint.f43925b) && Intrinsics.b(this.f43926c, stripe3ds2Fingerprint.f43926c) && Intrinsics.b(this.f43927d, stripe3ds2Fingerprint.f43927d);
    }

    public final int hashCode() {
        return this.f43927d.hashCode() + b.c0.e(b.c0.e(this.f43924a.hashCode() * 31, 31, this.f43925b), 31, this.f43926c);
    }

    public final String toString() {
        StringBuilder sbW = b.c0.w("Stripe3ds2Fingerprint(source=", this.f43924a, ", directoryServerName=", this.f43925b, ", serverTransactionId=");
        sbW.append(this.f43926c);
        sbW.append(", directoryServerEncryption=");
        sbW.append(this.f43927d);
        sbW.append(")");
        return sbW.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f43924a);
        dest.writeString(this.f43925b);
        dest.writeString(this.f43926c);
        this.f43927d.writeToParcel(dest, i5);
    }

    public Stripe3ds2Fingerprint(StripeIntent.NextActionData.SdkData.Use3DS2 sdkData) throws CertificateException {
        Intrinsics.g(sdkData, "sdkData");
        String str = sdkData.f43949a;
        String str2 = sdkData.f43950b;
        String str3 = sdkData.f43951c;
        StripeIntent.NextActionData.SdkData.Use3DS2.DirectoryServerEncryption directoryServerEncryption = sdkData.f43952d;
        String directoryServerId = directoryServerEncryption.f43955a;
        String dsCertificateData = directoryServerEncryption.f43956b;
        List rootCertsData = directoryServerEncryption.f43957c;
        String str4 = directoryServerEncryption.f43958d;
        Intrinsics.g(directoryServerId, "directoryServerId");
        Intrinsics.g(dsCertificateData, "dsCertificateData");
        Intrinsics.g(rootCertsData, "rootCertsData");
        CertificateFactory certificateFactory = CertificateFactory.getInstance("X.509");
        byte[] bytes = dsCertificateData.getBytes(Charsets.f72000b);
        Intrinsics.f(bytes, "getBytes(...)");
        Certificate certificateGenerateCertificate = certificateFactory.generateCertificate(new ByteArrayInputStream(bytes));
        Intrinsics.e(certificateGenerateCertificate, "null cannot be cast to non-null type java.security.cert.X509Certificate");
        PublicKey publicKey = ((X509Certificate) certificateGenerateCertificate).getPublicKey();
        Intrinsics.f(publicKey, "getPublicKey(...)");
        List<String> list = rootCertsData;
        ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
        for (String str5 : list) {
            CertificateFactory certificateFactory2 = CertificateFactory.getInstance("X.509");
            byte[] bytes2 = str5.getBytes(Charsets.f72000b);
            Intrinsics.f(bytes2, "getBytes(...)");
            Certificate certificateGenerateCertificate2 = certificateFactory2.generateCertificate(new ByteArrayInputStream(bytes2));
            Intrinsics.e(certificateGenerateCertificate2, "null cannot be cast to non-null type java.security.cert.X509Certificate");
            arrayList.add((X509Certificate) certificateGenerateCertificate2);
        }
        this(str, str2, str3, new DirectoryServerEncryption(directoryServerId, publicKey, arrayList, str4));
    }
}
