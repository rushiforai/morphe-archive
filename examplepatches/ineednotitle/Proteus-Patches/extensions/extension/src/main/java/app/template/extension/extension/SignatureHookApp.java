package app.template.extension.extension;

import android.app.Application;
import android.content.pm.PackageInfo;
import android.content.pm.Signature;
import android.os.Parcelable;
import android.util.Base64;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;

/**
 * Application subclass that reports the ORIGINAL signing certificate of the
 * package, even though Morphe re-signed the APK.
 *
 * The two placeholder strings below are rewritten at patch time by the
 * "Spoof app signature" patch (SpoofSignatureVerificationPatch.kt), which
 * locates this class' static initializer by those exact two const-strings.
 *
 * Mechanism: PackageInfo objects handed out by the package manager are
 * unparceled through {@code PackageInfo.CREATOR}. We replace that field with a
 * dynamic proxy that post-processes every {@code createFromParcel()} result and
 * swaps the re-signed certificate back to the original one, so every signature
 * read in this process (PackageManager calls, direct Parcel unpacking,
 * reflection-based checks) sees the original certificate.
 *
 * Everything is best-effort: if the platform refuses the reflective hook the
 * class degrades to a plain Application and the app keeps working normally.
 *
 * Ported from jkennethcarino/adobo, itself based on
 * https://github.com/L-JINBIN/ApkSignatureKillerEx.
 */
public class SignatureHookApp extends Application {

    /*
     * NB: these are deliberately NOT `static final`. A `static final String`
     * initialised from a literal is a compile-time constant: javac inlines it at
     * every use site and <clinit> never contains the const-string, which is
     * exactly what the patch needs in order to find and rewrite them.
     */
    private static String hookPackageName;
    private static String hookSignature;

    static {
        hookPackageName = "<package-name>";
        hookSignature = "<signature>";
        try {
            install();
        } catch (Throwable ignored) {
            // A failed hook must never take the app down.
        }
    }

    private static void install() throws Throwable {
        if (hookSignature == null || hookSignature.length() == 0
                || "<signature>".equals(hookSignature)) {
            return; // Patch did not run / no certificate available.
        }

        // Signature(String) takes the hex form of the DER bytes (the same encoding
        // toCharsString() returns), so decode the Base64 and re-encode as hex.
        final Signature original = new Signature(toHex(Base64.decode(hookSignature, Base64.DEFAULT)));

        final String target = (hookPackageName == null
                || hookPackageName.length() == 0
                || "<package-name>".equals(hookPackageName))
                ? null
                : hookPackageName;

        final Field creatorField = PackageInfo.class.getField("CREATOR");
        creatorField.setAccessible(true);
        final Object realCreator = creatorField.get(null);
        if (realCreator == null || Proxy.isProxyClass(realCreator.getClass())) {
            return; // Nothing to hook, or already hooked.
        }

        InvocationHandler handler = new InvocationHandler() {
            @Override
            public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                Object result = method.invoke(realCreator, args);
                if (result instanceof PackageInfo
                        && "createFromParcel".equals(method.getName())) {
                    spoof((PackageInfo) result, original, target);
                }
                return result;
            }
        };

        // Use this class' loader: it resolves both PackageInfo and
        // Parcelable.Creator (both bootclasspath types).
        Object proxyCreator = Proxy.newProxyInstance(
                SignatureHookApp.class.getClassLoader(),
                new Class<?>[]{Parcelable.Creator.class},
                handler);

        // Writing a `public static final` field: ART honours setAccessible(true)
        // for final fields, but drop the FINAL bit as well for good measure
        // (throws on platforms that hide Field.modifiers — harmless).
        try {
            Field modifiers = Field.class.getDeclaredField("modifiers");
            modifiers.setAccessible(true);
            modifiers.setInt(creatorField, creatorField.getModifiers() & ~Modifier.FINAL);
        } catch (Throwable ignored) {
            // Ignored: ART does not require this.
        }
        creatorField.set(null, proxyCreator);
    }

    private static String toHex(byte[] bytes) {
        char[] hex = new char[bytes.length * 2];
        char[] digits = "0123456789abcdef".toCharArray();
        for (int i = 0; i < bytes.length; i++) {
            int value = bytes[i] & 0xFF;
            hex[i * 2] = digits[value >>> 4];
            hex[i * 2 + 1] = digits[value & 0x0F];
        }
        return new String(hex);
    }

    private static void spoof(PackageInfo info, Signature original, String target) {
        if (info == null) return;
        if (target != null && !target.equals(info.packageName)) return;

        try {
            Field signaturesField = PackageInfo.class.getField("signatures");
            signaturesField.setAccessible(true);
            signaturesField.set(info, new Signature[]{original});
        } catch (Throwable ignored) {
            // Deprecated field, absent or blocked — nothing else we can do here.
        }
        // Note: PackageInfo.signingInfo (API 28+) is a final object with hidden
        // internals and cannot be rebuilt from public API. Apps that read their
        // certificate through signingInfo are not covered by this hook; they need
        // an app-specific patch (as Telegram's "Bypass integrity check" does).
    }
}
