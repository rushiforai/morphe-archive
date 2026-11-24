package fr.josselinonduty.snapchat;

import android.content.pm.PackageInfo;
import android.content.pm.Signature;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.Base64;
import android.util.Log;

import java.lang.reflect.Field;

/** Process-wide PackageInfo signature spoof, including calls made through JNI. */
public final class SignatureSpoof {
    private static final String TAG = "SnapSigSpoof";
    private static final String PACKAGE_NAME = "com.snapchat.android";
    private static final String CERTIFICATE =
            "MIIDdDCCAlygAwIBAgIEUE8NHDANBgkqhkiG9w0BAQUFADB8MQswCQYDVQQGEwIwMTETMBEGA1UECBMKQ2FsaWZvcm5pYTEUMBIGA1UEBxMLTG9zIEFuZ2VsZXMxETAPBgNVBAoTCFNuYXBjaGF0MRgwFgYDVQQLEw9DYXB0YWluIENhcHRjaGExFTATBgNVBAMTDERhbmllbCBTbWl0aDAeFw0xMjA5MTExMDA2MjBaFw00MDAxMjgxMDA2MjBaMHwxCzAJBgNVBAYTAjAxMRMwEQYDVQQIEwpDYWxpZm9ybmlhMRQwEgYDVQQHEwtMb3MgQW5nZWxlczERMA8GA1UEChMIU25hcGNoYXQxGDAWBgNVBAsTD0NhcHRhaW4gQ2FwdGNoYTEVMBMGA1UEAxMMRGFuaWVsIFNtaXRoMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApEp+SAdIOY+5fQUwcfa8gknDMqyxUSY6KRrpQv5sh4kdmrp1JSzBJgSFY88GshRliQNUQxW+P6VqriCu+cBVlqcf0KeiKWb+HjyUU7H+2/odog087dnPKJxilsQerjyOBopI4hewS6TYv2N6hvCwsPC3juQGAl2O76eVtPwoeGC9Y6TWjA1nF5rP4aKEAuSCHA1/JbC3ffUTRjwHU2cOgdfwxg/Hp2Vwvur6/QQdM+psmKf+FKd694qxwjb/JNo2FztOqW/c7YSHExuq5s1cVFmCswbQk0Ml929V14pjRwfk+nyw8SGDRZSIiRbrEEHjv0LSpcPNM2BaL+MpEAtY9wIDAQABMA0GCSqGSIb3DQEBBQUAA4IBAQBDRuuNn8e8c5PPtKkBtVGqwRRxoYj0CHpM3/IYijI9xzLt0chNbHTdRn07hegh1aNKKhbY4w6Vl5+k5CFE6PvcdBFKltCL8KQCM7nTQJjDhthLvHJW7o3QkJdHLVkSHecEsy9VX34VPVlFB9q5QbZLm4b1dwkMZcr02Rxs+DeZqSDDAnBFYBFcjHCQuxy9XuYzTxLqxogu9MpDLZ4TSg4KBRYBcNCA5pxV3e11McZ0t8xKqh3AM4izHl31Kr1m/njUXI105Bh0w8wyIg85ZIhJmXvX4Zyo7RN8dcmjCmNPKICTx5ieCz4sCLZCz9u2XgUnZfB5neyChFX2K6jodnv5";

    private static boolean installed;

    private SignatureSpoof() {}

    public static synchronized void install() {
        if (installed) return;
        installed = true;

        final Signature original = new Signature(Base64.decode(CERTIFICATE, Base64.DEFAULT));
        final Parcelable.Creator<PackageInfo> originalCreator = PackageInfo.CREATOR;
        try {
            Parcelable.Creator<PackageInfo> spoofingCreator = new Parcelable.Creator<PackageInfo>() {
                @Override
                public PackageInfo createFromParcel(Parcel source) {
                    PackageInfo info = originalCreator.createFromParcel(source);
                    if (PACKAGE_NAME.equals(info.packageName)) {
                        replace(info.signatures, original);
                        if (info.signingInfo != null) {
                            replace(info.signingInfo.getApkContentsSigners(), original);
                            replace(info.signingInfo.getSigningCertificateHistory(), original);
                        }
                        Log.i(TAG, "Returned original Snapchat certificate");
                    }
                    return info;
                }

                @Override
                public PackageInfo[] newArray(int size) {
                    return originalCreator.newArray(size);
                }
            };
            Field creatorField = PackageInfo.class.getField("CREATOR");
            creatorField.setAccessible(true);
            creatorField.set(null, spoofingCreator);
            Log.i(TAG, "PackageInfo creator installed");
        } catch (Throwable error) {
            Log.e(TAG, "Failed to install PackageInfo creator", error);
        }
    }

    private static void replace(Signature[] signatures, Signature original) {
        if (signatures != null && signatures.length > 0) signatures[0] = original;
    }
}
