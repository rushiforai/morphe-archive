import android.content.Context;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.os.Looper;
import java.lang.reflect.Field;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

/** Checks the real local certificate decision without starting Curve or contacting its services. */
public final class SigningCertificateProbe {
    private static final String PACKAGE = "com.imaginecurve.curve.prd";

    private static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }

    private static Object model(String name) throws Exception {
        // Test-only allocation avoids constructing analytics and authenticated app services.
        Class<?> unsafeClass = Class.forName("sun.misc.Unsafe");
        Field field = unsafeClass.getDeclaredField("theUnsafe");
        field.setAccessible(true);
        return unsafeClass.getMethod("allocateInstance", Class.class).invoke(field.get(null), Class.forName(name));
    }

    private static void field(Object instance, String name, Object value) throws Exception {
        Field field = instance.getClass().getDeclaredField(name);
        field.setAccessible(true);
        field.set(instance, value);
    }

    public static void main(String[] args) throws Exception {
        require(args.length == 1 && (args[0].equals("original") || args[0].equals("patched")),
            "Usage: SigningCertificateProbe original|patched");
        boolean patched = args[0].equals("patched");
        Set<?> certificates = (Set<?>) Class.forName("bba").getField("a").get(null);
        Set<String> actual = new HashSet<>();
        for (Object certificate : certificates) {
            require(certificate instanceof String, "Unexpected certificate value");
            actual.add(((String) certificate).replace(":", "").toLowerCase(Locale.ROOT));
        }
        Set<String> expected = new HashSet<>(Arrays.asList(
            "8d5b3f8424d18558320617b4f6f0dc2052d3bdb550c75dd47a4f8807b10c22ae",
            "b07e5e3dd170bce069df765ebe335861dc2b03714332d133281a3f282885e221"
        ));
        require(certificates.size() == expected.size() && actual.equals(expected), "Certificate allowlist changed unexpectedly");

        if (Looper.myLooper() == null) Looper.prepareMainLooper();
        Class<?> activityThread = Class.forName("android.app.ActivityThread");
        Object thread = activityThread.getMethod("systemMain").invoke(null);
        Context systemContext = (Context) activityThread.getMethod("getSystemContext").invoke(thread);
        Context context = systemContext.createPackageContext(PACKAGE, Context.CONTEXT_IGNORE_SECURITY);
        Signature[] signers = context.getPackageManager()
            .getPackageInfo(PACKAGE, PackageManager.GET_SIGNING_CERTIFICATES).signingInfo.getApkContentsSigners();
        require(signers.length == 1, "Expected one installed APK signer");
        StringBuilder fingerprint = new StringBuilder();
        for (byte value : MessageDigest.getInstance("SHA-256").digest(signers[0].toByteArray())) {
            fingerprint.append(String.format(Locale.ROOT, "%02x", value & 0xff));
        }
        require(!actual.contains(fingerprint.toString()), "Install Curve with a nonofficial signing key before this probe");

        Object detector = model("uo3");
        field(detector, "a", context);
        field(detector, "b", model("hy"));
        Object mismatch = detector.getClass().getMethod("c").invoke(detector);
        require(Boolean.valueOf(!patched).equals(mismatch), "Wrong local signing-certificate decision");
        if (patched) {
            // No Context or signer lookup is needed, so acceptance cannot depend on a particular key.
            Object withoutContext = model("uo3");
            require(Boolean.FALSE.equals(withoutContext.getClass().getMethod("c").invoke(withoutContext)),
                "Signer-independent decision requires a Context");
        }
        System.out.println("PASS " + args[0] + ": official allowlist unchanged; installed nonofficial signer "
            + (patched ? "accepted; context-free decision accepts any key" : "rejected"));
    }
}
