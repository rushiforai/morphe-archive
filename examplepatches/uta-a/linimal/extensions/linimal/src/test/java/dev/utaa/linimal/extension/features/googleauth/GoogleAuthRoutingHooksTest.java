package dev.utaa.linimal.extension.features.googleauth;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import dev.utaa.linimal.extension.features.googleauth.GoogleAuthRoutingHooks.Routing;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Test;

/** Google 認証の MicroG-RE への向け替えが GetToken だけに限られ、fail-open であることを検証します。 */
public final class GoogleAuthRoutingHooksTest {
    private static final String GMS = GoogleAuthRoutingHooks.GMS_PACKAGE;
    private static final String MICROG = GoogleAuthRoutingHooks.MICROG_PACKAGE;
    private static final String GET_TOKEN = GoogleAuthRoutingHooks.GET_TOKEN_CLASS;

    @Test
    public void enabledWithMicrogRoutesToMicrog() {
        assertEquals(Routing.MICROG, GoogleAuthRoutingHooks.routing(true, MICROG::equals));
    }

    /** 設定 ON でも MicroG-RE がなければ元の経路を使い、導入を案内します。 */
    @Test
    public void enabledWithoutMicrogKeepsTheOriginalPathAndAsksForInstall() {
        assertEquals(Routing.MICROG_MISSING, GoogleAuthRoutingHooks.routing(true, packageName -> false));
    }

    @Test
    public void disabledSettingKeepsTheOriginalPathEvenWithMicrog() {
        assertEquals(Routing.ORIGINAL, GoogleAuthRoutingHooks.routing(false, MICROG::equals));
        assertEquals(Routing.ORIGINAL, GoogleAuthRoutingHooks.routing(true, null));
    }

    /** bind の失敗は、MicroG-RE の GetToken へ向けたときだけ通知します。 */
    @Test
    public void onlyBindFailuresToMicrogGetTokenAreReported() {
        assertTrue(GoogleAuthRoutingHooks.isMicrogGetToken(MICROG, GET_TOKEN));
        assertFalse(GoogleAuthRoutingHooks.isMicrogGetToken(GMS, GET_TOKEN));
        assertFalse(GoogleAuthRoutingHooks.isMicrogGetToken(MICROG, "com.google.android.gms.auth.Other"));
        assertFalse(GoogleAuthRoutingHooks.isMicrogGetToken(null, null));
    }

    @Test
    public void onlyTheGmsGetTokenComponentIsRouted() {
        assertEquals(MICROG, GoogleAuthRoutingHooks.routedPackage(true, GMS, GET_TOKEN));
        assertEquals(GMS, GoogleAuthRoutingHooks.routedPackage(false, GMS, GET_TOKEN));
        assertEquals(GMS, GoogleAuthRoutingHooks.routedPackage(true, GMS, "com.google.android.gms.auth.Other"));
        assertEquals("other.pkg", GoogleAuthRoutingHooks.routedPackage(true, "other.pkg", GET_TOKEN));
        assertNull(GoogleAuthRoutingHooks.routedPackage(true, null, GET_TOKEN));
    }

    @Test
    public void pinnedCertificateIsASha256Digest() {
        byte[] certificate = GoogleAuthRoutingHooks.hexToBytes(GoogleAuthRoutingHooks.MICROG_CERTIFICATE_SHA256);

        assertEquals(32, certificate.length);
        assertArrayEquals(new byte[] {0x0b, 0x6c, (byte) 0x95}, java.util.Arrays.copyOf(certificate, 3));
    }

    /** この単体テストでは LinimalConfig を初期化しないため、hook は元の経路を返します。 */
    @Test
    public void uninitializedConfigurationFailsOpen() {
        assertFalse(GoogleAuthRoutingHooks.shouldSkipAuthServiceClient(null));
        assertNull(GoogleAuthRoutingHooks.authServiceComponent(null, null));
    }

    @Test
    public void onlyTheGmsIdentitySignInPackageAndActionAreRouted() {
        String action = GoogleAuthRoutingHooks.GMS_IDENTITY_SIGN_IN_ACTION;
        assertEquals(MICROG, GoogleAuthRoutingHooks.routedIdentityPackage(true, GMS));
        assertEquals(GMS, GoogleAuthRoutingHooks.routedIdentityPackage(false, GMS));
        assertEquals("other.pkg", GoogleAuthRoutingHooks.routedIdentityPackage(true, "other.pkg"));
        assertEquals(GoogleAuthRoutingHooks.MICROG_IDENTITY_SIGN_IN_ACTION,
                GoogleAuthRoutingHooks.routedIdentityAction(true, action));
        assertEquals(action, GoogleAuthRoutingHooks.routedIdentityAction(false, action));
        String saving = "com.google.android.gms.auth.api.identity.service.credentialsaving.START";
        assertEquals(saving, GoogleAuthRoutingHooks.routedIdentityAction(true, saving));
    }

    /** request の型は難読化されるため、option の String field の値だけで Google ID token の要求を見分けます。 */
    @Test
    public void onlyRequestsMadeOfGoogleIdTokenOptionsAreDetected() throws Exception {
        assertTrue(GoogleAuthRoutingHooks.isGoogleIdTokenOnlyRequest(
                new Request(Collections.singletonList(new SignInOption()))));
        assertTrue(GoogleAuthRoutingHooks.isGoogleIdTokenOnlyRequest(
                new Request(Arrays.asList(new SignInOption(), new SignInOption()))));
        // パスキー・パスワードを含む混合要求は、元の provider 選択のままにします。
        assertFalse(GoogleAuthRoutingHooks.isGoogleIdTokenOnlyRequest(
                new Request(Arrays.asList(new SignInOption(), new Option("androidx.credentials.TYPE_PASSWORD_CREDENTIAL")))));
        assertFalse(GoogleAuthRoutingHooks.isGoogleIdTokenOnlyRequest(
                new Request(Collections.singletonList(new Option("androidx.credentials.TYPE_PUBLIC_KEY_CREDENTIAL")))));
        assertFalse(GoogleAuthRoutingHooks.isGoogleIdTokenOnlyRequest(new Request(Collections.emptyList())));
        assertFalse(GoogleAuthRoutingHooks.isGoogleIdTokenOnlyRequest(new Option(GoogleAuthRoutingHooks.GOOGLE_ID_TOKEN_CREDENTIAL_TYPE)));
        assertFalse(GoogleAuthRoutingHooks.isGoogleIdTokenOnlyRequest(null));
    }

    @Test
    public void signInHooksFailOpenWithoutConfigurationOrContext() {
        assertFalse(GoogleAuthRoutingHooks.shouldUsePlayServicesCredentialProvider(new Object(),
                new Request(Collections.singletonList(new SignInOption()))));
        assertEquals(GMS, GoogleAuthRoutingHooks.identitySignInPackage(new Object(), GMS));
        assertEquals(GoogleAuthRoutingHooks.GMS_IDENTITY_SIGN_IN_ACTION, GoogleAuthRoutingHooks.identitySignInAction(
                null, GoogleAuthRoutingHooks.GMS_IDENTITY_SIGN_IN_ACTION));
        assertTrue(GoogleAuthRoutingHooks.identitySignInDynamicLookup(null, true));
        // 未初期化では端末本体のアカウント検索（元の処理）を続けます。
        assertNull(GoogleAuthRoutingHooks.selectedAccount(new Object(), "user@example.com"));
        assertNull(GoogleAuthRoutingHooks.selectedAccount(new Object(), ""));
        assertNull(GoogleAuthRoutingHooks.chooseAccountIntent(null));
        assertTrue(GoogleAuthRoutingHooks.useIdentityCredentialsApi(true, null,
                new Request(Collections.singletonList(new SignInOption()))));
        assertFalse(GoogleAuthRoutingHooks.useIdentityCredentialsApi(false, null,
                new Request(Collections.singletonList(new SignInOption()))));
    }

    /** androidx.credentials の CredentialOption に相当します。type は基底 class の field に入ります。 */
    private static class Option {
        private final String type;

        Option(String type) {
            this.type = type;
        }
    }

    private static final class SignInOption extends Option {
        SignInOption() {
            super(GoogleAuthRoutingHooks.GOOGLE_ID_TOKEN_CREDENTIAL_TYPE);
        }
    }

    private static final class Request {
        private final List<Object> options;

        Request(List<?> options) {
            this.options = new java.util.ArrayList<>(options);
        }
    }
}
