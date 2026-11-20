package app.morphe.extension.telegraph;

import android.app.Application;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.Base64;

import org.lsposed.hiddenapibypass.HiddenApiBypass;

import java.lang.reflect.Field;
import java.util.Map;

/**
 * Superclasse do Application do Telegraph usada pelo patch "Spoof Telegraph signature".
 *
 * Técnica igual à que o próprio MorpheApp usa no patch "Spoof signature" do Reddit
 * (extensions/reddit/.../SpoofSignaturePatch.java), por sua vez baseada no
 * ApkSignatureKillerEx (L-JINBIN). As duas etapas que faltavam no patch anterior, e que
 * provavelmente são a causa de ele não ter resolvido o crash, estão aqui:
 *
 *  1) HiddenApiBypass.addHiddenApiExemptions: sem isso, a partir do Android 9+ (e de forma
 *     mais agressiva a partir do 14/16) a reflexão sobre campos internos do android.os/.content.pm
 *     pode ser silenciosamente bloqueada.
 *  2) Limpeza dos caches de PackageInfo/Parcel (sPackageInfoCache, mCreators, sPairedCreators):
 *     sem isso, o Android pode continuar entregando o PackageInfo (com a assinatura real do
 *     Morphe) que já estava em cache antes do hook ser instalado, fazendo o CREATOR trocado
 *     nunca ser usado.
 */
public class SignatureHookApp extends Application {
    private static final String PACKAGE_NAME = "ir.ilmili.telegraph";
    private static final String ORIGINAL_CERT =
            "MIIDczCCAlugAwIBAgIEZ5eYnTANBgkqhkiG9w0BAQsFADBqMQswCQYDVQQGEwJJUjETMBEGA1UE" +
            "CBMKTWF6YW5kYXJhbjEPMA0GA1UEBxMGUmFtc2FyMQ8wDQYDVQQKEwZpbG1pbGkxEDAOBgNVBAsT" +
            "B0FuZHJvaWQxEjAQBgNVBAMTCU1hc291ZCBCSDAeFw0xNjAxMjEyMTMyNTlaFw00MTAxMTQyMTMy" +
            "NTlaMGoxCzAJBgNVBAYTAklSMRMwEQYDVQQIEwpNYXphbmRhcmFuMQ8wDQYDVQQHEwZSYW1zYXIx" +
            "DzANBgNVBAoTBmlsbWlsaTEQMA4GA1UECxMHQW5kcm9pZDESMBAGA1UEAxMJTWFzb3VkIEJIMIIB" +
            "IjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApZ0E8Q5APGIZAe7pF/HMEGBH9isIpW1k3L6P" +
            "nIin56Ic3jdBXKCeQVmc9YTm4UBEPc4mQ3TOGSE6VbbU8rcBgzMLqGZBni04MvnDnQgevOzku2vk" +
            "O9la0IAcGR0wfpHiBlWK7cRAznG0mjy+mB1GTNBx4w91NGJke/Q0bm02Z0ZxqP+4iPQE8RlIDBTE" +
            "334LBJNViJZTuRn2xJbGfOubav1UaxFjc0SGcePd6BMuQ7hc1Al+cO5UP1KASIjgsPngWdslk6PL" +
            "1QsFxihgP/kRBKFInjkh21pf4W5VZ3T7l/+EEdLRKmJXvIrJLLGyvW+hiCew1Po3bQ8XRbAc6kJ8" +
            "lQIDAQABoyEwHzAdBgNVHQ4EFgQUyCq0lIVWBSNmfd6NQoz1XZCGHccwDQYJKoZIhvcNAQELBQAD" +
            "ggEBADRF60RuLD9jcEQlxy6dd0Wu1pq+gsR5A7WCDhYXNnZJiyRjSC003JSKf/4xF4svB7+ISwJw" +
            "mJ/N2+1ttqk/uOWwhECOchJeRYkFVsLx61UMq1A1CJiND+JtTseSIlld4h5H16hHrqxxIt5J6+ri" +
            "RxMQfzbjqpZd1gpTCWThrq8EGrdZdf53zARVkQQytP9w+Ulys27YugBdfgpgmvWWqIKWjUxzdfN1" +
            "KdwOAEqosScBtZx9amqkdm8A4aMQGFRGpJJebg6sjTpx14ibOX0RfdtxV6z5qP9K7iKQSM+zkJPp" +
            "MfzxAahM3Mhv3FoNYC8gXq+uVUGNDWGJ8/gbz+xRQJE=";

    static {
        killPM();
    }

    @SuppressWarnings({"deprecation", "ExtractMethodRecommender"})
    private static void killPM() {
        try {
            final Signature fakeSignature =
                    new Signature(Base64.decode(ORIGINAL_CERT, Base64.DEFAULT));
            final Parcelable.Creator<PackageInfo> originalCreator = PackageInfo.CREATOR;

            final Parcelable.Creator<PackageInfo> hookedCreator =
                    new Parcelable.Creator<PackageInfo>() {
                        @Override
                        public PackageInfo createFromParcel(Parcel source) {
                            PackageInfo packageInfo = originalCreator.createFromParcel(source);
                            if (packageInfo != null && PACKAGE_NAME.equals(packageInfo.packageName)) {
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
                            return originalCreator.newArray(size);
                        }
                    };

            findField(PackageInfo.class, "CREATOR").set(null, hookedCreator);

            HiddenApiBypass.addHiddenApiExemptions(
                    "Landroid/os/Parcel;", "Landroid/content/pm", "Landroid/app");

            try {
                Object cache = findField(PackageManager.class, "sPackageInfoCache").get(null);
                if (cache != null) {
                    cache.getClass().getMethod("clear").invoke(cache);
                }
            } catch (Throwable ignored) {
            }

            try {
                Map<?, ?> mCreators = (Map<?, ?>) findField(Parcel.class, "mCreators").get(null);
                if (mCreators != null) {
                    mCreators.clear();
                }
            } catch (Throwable ignored) {
            }

            try {
                Map<?, ?> sPairedCreators =
                        (Map<?, ?>) findField(Parcel.class, "sPairedCreators").get(null);
                if (sPairedCreators != null) {
                    sPairedCreators.clear();
                }
            } catch (Throwable ignored) {
            }
        } catch (Throwable ignored) {
            // Se alguma etapa falhar (ex.: campo renomeado numa versão futura do Android),
            // o app segue sem o spoof em vez de falhar na inicialização.
        }
    }

    private static Field findField(Class<?> clazz, String fieldName) throws NoSuchFieldException {
        try {
            Field field = clazz.getDeclaredField(fieldName);
            field.setAccessible(true);
            return field;
        } catch (NoSuchFieldException e) {
            while (true) {
                clazz = clazz.getSuperclass();
                if (clazz == null || clazz.equals(Object.class)) {
                    break;
                }
                try {
                    Field field = clazz.getDeclaredField(fieldName);
                    field.setAccessible(true);
                    return field;
                } catch (NoSuchFieldException ignored) {
                }
            }
            throw e;
        }
    }
}
