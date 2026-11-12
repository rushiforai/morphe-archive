package app.morphe.extension.syncforreddit.http;

import java.security.KeyStore;

import javax.net.ssl.SSLContext;

import app.morphe.extension.syncforreddit.redirects.ClientCertificate;

/**
 * Offline regression checks for reading a client certificate.
 *
 * <p>A certificate is pasted in rather than chosen from a file, because Sync asks for no
 * storage permission and so has no path it could read one from. Two shapes are accepted — a
 * PKCS#12 written out as base64, and the PEM blocks — and what they are read into is the thing
 * a Rimgo instance or a proxy is offered. Getting this wrong fails at the TLS handshake, on
 * someone else's server, with nothing useful said, so it is pinned down here instead.
 *
 * <p>The certificate below is a throwaway made for this test: a P-256 key and a self-signed
 * certificate for CN=sync-up-test, good for nothing and trusted by nobody.
 */
public final class ClientCertificateTest {
    private static int checks;

    private static final String PASSWORD = "secret";

    /** The same key and certificate as a PKCS#12 keystore, base64 as it would be pasted in. */
    private static final String AS_PKCS12 =
            "MIIEawIBAzCCBCEGCSqGSIb3DQEHAaCCBBIEggQOMIIECjCCApoGCSqGSIb3DQEHBqCCAoswggKH"
            + "AgEAMIICgAYJKoZIhvcNAQcBMF8GCSqGSIb3DQEFDTBSMDEGCSqGSIb3DQEFDDAkBBBDlzlbSH0k"
            + "muVVLUa+6Ge4AgIIADAMBggqhkiG9w0CCQUAMB0GCWCGSAFlAwQBKgQQACF1NOpBvNM+aeFI9N6E"
            + "gYCCAhDVNiBiwf3JCoB8tIqxdQ5GEVDdKB0m0I7XrVZy58Nut35/vP4zJGg98eoglsYGMVFt5Xxu"
            + "4kmPShFRehYBgJ3gZ/k+42Bh8vJMPG7BfBAVGZOSUHRqmRXU2/mAdh9l1Ja2r1+ZwhFMpxF/EOVD"
            + "IRa+4e9fS0V0Xn2vQAIG4AtyEaEoXc8T7bjTRy5qokzDZV32HsZSN8a1gFPhLvCz4hN2JVqx+CCd"
            + "atw/WvZ1RmI3mqr3UY3zlsYMfZGM108N74DTeYR1djv0s/kFTC5e4GN/1QgiSiF1MLo/hRkta0D4"
            + "0HAO0FJlzhX2MSDieTYPpd1bPzIrjpT/pDPZPwLdlhXfNJyuSvWB7G3rZpVez91rc/5to4Y6J4Ot"
            + "7dnn0fRdNMH68pYs8gqBFKo6IdtN6NmeXDEn9Z/KouvEnBGbkggjYO/UqEwBAymyh9eiw4W2hNwz"
            + "mQ5xy+09mZ4YCNTl2/esmwiu5EVmofs4Hte8AJnY8lKki0ZPxZWQ3vpTMGC2EvXbjpbN1pXk7CbK"
            + "TvxSMM8+WZI+Ojn/VMrmqi5A148xjWeFOWFemj382f9effu/Hl1BSW5Dlrs0/ZV4h8QU3F/3LazR"
            + "x0ucil4sEOj/bJ6H9p96VYdU56O169fkd4odul1K3RtrKLGXJwVVOizuTHL0lGYEKRFHeNUu6JKt"
            + "DT+bvYzcWUziQGm730zg58PAvjswggFoBgkqhkiG9w0BBwGgggFZBIIBVTCCAVEwggFNBgsqhkiG"
            + "9w0BDAoBAqCB9zCB9DBfBgkqhkiG9w0BBQ0wUjAxBgkqhkiG9w0BBQwwJAQQ55s43fYBvGnqU+vH"
            + "lb3iHQICCAAwDAYIKoZIhvcNAgkFADAdBglghkgBZQMEASoEEMRMD4L44gOKP6VZt19BQa4EgZBQ"
            + "Q7FUfIYLCKE/QHus9x56bB6aihsdwCy6EGp9wyznEQOJJ9b1GxLS0/o7Jt1rBprNVbQLAHeL8Siq"
            + "MWkDV7gipegGql0urqqkQa14y1Uw6FK4oqeTO28W5YH6+JkpHGuCFBgdv1ZBJLAK4D7sxXgUikvp"
            + "nqg6ttZCUFql/MWpwJia6OifhykXVb76mVtNqa4xRDAdBgkqhkiG9w0BCRQxEB4OAHMAeQBuAGMA"
            + "LQB1AHAwIwYJKoZIhvcNAQkVMRYEFK/heaWSYBZTQ+pmh2aZb0qSC0GPMEEwMTANBglghkgBZQME"
            + "AgEFAAQgSZ55DuPW4XAZ6unbCkf3oovprJDtPXVmTZ4a37zq3A4ECD6HclpNxMdSAgIIAA==";

    /** And as the PEM blocks, which is the other thing people are handed. */
    private static final String AS_PEM =
            "-----BEGIN CERTIFICATE-----\n"
            + "MIIBhTCCASugAwIBAgIUdt5GXigT7PDBX5IWv+TAURj2LvgwCgYIKoZIzj0EAwIw\n"
            + "FzEVMBMGA1UEAwwMc3luYy11cC10ZXN0MCAXDTI2MTExMDIwMTUxNloYDzIxMjYx\n"
            + "MDE3MjAxNTE2WjAXMRUwEwYDVQQDDAxzeW5jLXVwLXRlc3QwWTATBgcqhkjOPQIB\n"
            + "BggqhkjOPQMBBwNCAASO6ZOSpqX31GIZiSuSFMQUQgwxIgp90Szgy7MadZ6dMa7H\n"
            + "T7ARNtBUeaUm+kEBBHG6jVoD2ksll70axLqfslwbo1MwUTAdBgNVHQ4EFgQUwR5d\n"
            + "UQGkZj3trZPCqa94JwGtxygwHwYDVR0jBBgwFoAUwR5dUQGkZj3trZPCqa94JwGt\n"
            + "xygwDwYDVR0TAQH/BAUwAwEB/zAKBggqhkjOPQQDAgNIADBFAiAgOLRL5RMEw1T7\n"
            + "c1CtkR4iavdc8A+feqNTKVU+J7cnywIhAK90e88iIXhMKsTpOHL+sN8nn+pXjEvc\n"
            + "Ds08VVx1WZBN\n"
            + "-----END CERTIFICATE-----\n"
            + "-----BEGIN PRIVATE KEY-----\n"
            + "MIGHAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBG0wawIBAQQgPuMuRIU9v0GhZ0u5\n"
            + "hucR24udxaWA2Ls4Ts3h0rzbD6WhRANCAASO6ZOSpqX31GIZiSuSFMQUQgwxIgp9\n"
            + "0Szgy7MadZ6dMa7HT7ARNtBUeaUm+kEBBHG6jVoD2ksll70axLqfslwb\n"
            + "-----END PRIVATE KEY-----\n";

    public static void main(String[] args) {
        bothShapesAreRead();
        nothingElseIs();
        whatIsBuiltIsKept();

        System.out.println("Passed " + checks + " client certificate checks.");
    }

    private static void bothShapesAreRead() {
        SSLContext fromPkcs12 = ClientCertificate.contextFor(AS_PKCS12, PASSWORD);
        check(fromPkcs12 != null, "Could not read the PKCS#12");

        // The PEM key is unencrypted, which is what that shape means; the password is only
        // used for the keystore built to hold it, so any is as good as another.
        SSLContext fromPem = ClientCertificate.contextFor(AS_PEM, "");
        check(fromPem != null, "Could not read the PEM blocks");

        check(ClientCertificate.looksSet(AS_PEM), "Said a certificate was not set");
        check(!ClientCertificate.looksSet("   "), "Took whitespace for a certificate");
        check(!ClientCertificate.looksSet(null), "Took nothing for a certificate");
    }

    private static void nothingElseIs() {
        // Each of these has to answer null rather than throw: a certificate that cannot be read
        // must leave the app loading pictures the way it did, not take it down.
        check(ClientCertificate.contextFor("", PASSWORD) == null, "Read nothing as a certificate");
        check(ClientCertificate.contextFor("not a certificate at all", PASSWORD) == null,
                "Read a sentence as a certificate");
        check(ClientCertificate.contextFor(AS_PKCS12, "the wrong password") == null,
                "Read the PKCS#12 with the wrong password");

        // The certificate without its key is the mistake someone actually makes, since a
        // certificate is the half that is not secret and so the half that gets copied.
        String certificateOnly = AS_PEM.substring(0, AS_PEM.indexOf("-----BEGIN PRIVATE KEY"));
        check(ClientCertificate.contextFor(certificateOnly, "") == null,
                "Built something from a certificate with no key");
    }

    private static void whatIsBuiltIsKept() {
        SSLContext once = ClientCertificate.contextFor(AS_PKCS12, PASSWORD);
        SSLContext again = ClientCertificate.contextFor(AS_PKCS12, PASSWORD);
        check(once == again, "Built the same certificate twice");

        // A different password is a different thing to build, even for the same text, so that
        // correcting a password takes effect rather than being answered from what was kept.
        check(ClientCertificate.contextFor(AS_PKCS12, "another") != once,
                "Answered a changed password from what was kept");
    }

    private static void check(boolean passed, String failure) {
        if (!passed) {
            throw new AssertionError(failure);
        }
        checks++;
    }
}
