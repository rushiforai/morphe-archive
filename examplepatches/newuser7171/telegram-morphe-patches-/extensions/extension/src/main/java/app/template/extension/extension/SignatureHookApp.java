package app.template.extension.extension;

import android.app.Application;
import android.content.pm.PackageInfo;
import android.content.pm.Signature;
import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.Base64;

import java.lang.reflect.Field;

/**
 * Application superclass used by the Morphe signature-spoof patch.
 *
 * The patch replaces the two placeholder strings in the static initializer
 * with the target package name and original APK certificate.
 */
public class SignatureHookApp extends Application {
    static {
        final String packageName = "<package-name>";
        final String signatureData = "<signature>";

        try {
            final Signature fakeSignature =
                    new Signature(Base64.decode(signatureData, Base64.DEFAULT));
            final Parcelable.Creator<PackageInfo> originalCreator = PackageInfo.CREATOR;

            final Parcelable.Creator<PackageInfo> hookedCreator =
                    new Parcelable.Creator<PackageInfo>() {
                        @Override
                        public PackageInfo createFromParcel(Parcel source) {
                            PackageInfo packageInfo = originalCreator.createFromParcel(source);
                            if (packageInfo != null && packageName.equals(packageInfo.packageName)) {
                                if (packageInfo.signatures != null
                                        && packageInfo.signatures.length > 0) {
                                    packageInfo.signatures[0] = fakeSignature;
                                }
                                if (Build.VERSION.SDK_INT >= 28
                                        && packageInfo.signingInfo != null) {
                                    Signature[] signers =
                                            packageInfo.signingInfo.getApkContentsSigners();
                                    if (signers != null && signers.length > 0) {
                                        signers[0] = fakeSignature;
                                    }
                                }
                            }
                            return packageInfo;
                        }

                        @Override
                        public PackageInfo[] newArray(int size) {
                            return new PackageInfo[size];
                        }
                    };

            Field creatorField = PackageInfo.class.getDeclaredField("CREATOR");
            creatorField.setAccessible(true);
            creatorField.set(null, hookedCreator);
        } catch (Throwable ignored) {
            // Some Android releases make framework CREATOR fields immutable.
            // The patch remains safe when that happens.
        }
    }
}
