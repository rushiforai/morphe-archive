package app.template.extension.extension;

import android.content.pm.PackageInfo;
import android.content.pm.Signature;
import android.util.Base64;

@SuppressWarnings("unused")
public class SignatureSpoof {

    // 원본(패치 전) 카카오톡 base.apk 의 APK Signing Block v2 에서 추출한 서명 인증서 (DER, base64).
    // 앱이 자기 서명을 물어볼 때, 패치로 바뀐 서명 대신 이 값을 돌려준다.
    private static final String ORIGINAL_CERT_BASE64 =
        "MIIB2zCCAUSgAwIBAgIETHBxlzANBgkqhkiG9w0BAQUFADAxMQswCQYDVQQGEwJrbzEOMAwGA1UEChMFa2FrYW8xEjAQBgNVBAsTCWtha2FvdGVhbTAgFw0xMDA4MjIwMDM4NDdaGA8yMTEwMDcyOTAwMzg0N1owMTELMAkGA1UEBhMCa28xDjAMBgNVBAoTBWtha2FvMRIwEAYDVQQLEwlrYWthb3RlYW0wgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAK7zh7yG4CKofma4xCFTKE8Y4MRoz5yHokG5iXKd/a092eGEdUbQGigZunfzl0pHtHPJJqyuFz/ZDH5jUAByH+7vZwXaeulJo1uCkAoPZ9lGTXPtipjDf0rHBylJShdGm8QNTuBtBDsJFH663FX6ECCWjXA2xfubjBSMuh2OnZ/BAgMBAAEwDQYJKoZIhvcNAQEFBQADgYEAVWm+cExoz/YiHB4E3YoTERD59c0hOAQihjN/1gFKGx0tPusmauFjCv5Wv2PAfdC1yPrUbcufgC+aeAL7ies7R3e5Zlux7Z/q8dx8rE+Rq+38gRh/9tL0cdvRIzXSwO8OLucZ3252P4FLmskfi+N/0R1AaGcA1mvm3iKhg28GDwE=";

    private static Signature cachedSignature;

    private static Signature originalSignature() {
        if (cachedSignature == null) {
            byte[] der = Base64.decode(ORIGINAL_CERT_BASE64, Base64.DEFAULT);
            cachedSignature = new Signature(der);
        }
        return cachedSignature;
    }

    // PackageManager#getPackageInfo(...) 호출 직후에 끼워 넣는다.
    // GET_SIGNATURES(구버전) 플래그로 조회한 경우를 겨냥한다.
    public static PackageInfo spoof(PackageInfo info) {
        try {
            if (info != null && info.signatures != null && info.signatures.length > 0) {
                info.signatures = new Signature[]{ originalSignature() };
            }
        } catch (Throwable ignored) {
            // 조용히 무시: 원본 PackageInfo 를 그대로 반환한다.
        }
        return info;
    }
}