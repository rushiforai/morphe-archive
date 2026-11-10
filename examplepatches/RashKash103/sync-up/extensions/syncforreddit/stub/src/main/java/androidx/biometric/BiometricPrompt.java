package androidx.biometric;

import androidx.fragment.app.FragmentActivity;

import java.util.concurrent.Executor;

/**
 * The fingerprint prompt the app already carries, as the app carries it.
 *
 * <p>Compile only. The library is obfuscated in the app, so the names here are the ones it
 * actually has rather than the ones it was written with; what each one is was established from
 * how Sync itself calls them.
 *
 * <p>Only needed where a PIN is offered <i>instead of</i> a fingerprint rather than beside one:
 * Sync's own prompt has to be stood down for that, and something has to offer the fingerprint in
 * its place.
 */
public class BiometricPrompt {
    public BiometricPrompt(FragmentActivity activity, Executor executor, b listening) {
        throw new UnsupportedOperationException("Stub");
    }

    /** authenticate: puts the prompt on the screen. */
    public void s(e asking) {
        throw new UnsupportedOperationException("Stub");
    }

    /** AuthenticationCallback. */
    public static class b {
        public b() {
        }

        /** onAuthenticationError: it gave up, or it was cancelled. */
        public void a(int code, CharSequence saying) {
        }

        /** onAuthenticationFailed: a finger that was not recognised; it is still asking. */
        public void b() {
        }

        /** onAuthenticationSucceeded. */
        public void c(c result) {
        }
    }

    /** AuthenticationResult, which is not read. */
    public static class c {
    }

    /** PromptInfo. */
    public static class e {
        /** PromptInfo.Builder. */
        public static class a {
            public a() {
                throw new UnsupportedOperationException("Stub");
            }

            /** setTitle. */
            public a d(CharSequence title) {
                throw new UnsupportedOperationException("Stub");
            }

            /** setConfirmationRequired. */
            public a c(boolean required) {
                throw new UnsupportedOperationException("Stub");
            }

            /** setDeviceCredentialAllowed. */
            public a b(boolean allowed) {
                throw new UnsupportedOperationException("Stub");
            }

            /** build. */
            public e a() {
                throw new UnsupportedOperationException("Stub");
            }
        }
    }
}
