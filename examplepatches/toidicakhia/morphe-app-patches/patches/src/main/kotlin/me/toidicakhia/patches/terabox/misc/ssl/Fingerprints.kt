/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package me.toidicakhia.patches.terabox.misc.ssl

import app.morphe.patcher.Fingerprint

private const val OKHTTP = "Lokhttp3/"
private const val APPLOVIN_OKHTTP = "Lcom/applovin/shadow/okhttp3/"
private const val BAIDU_OKHTTP = "Lcom/baidu/graph/sdk/opensource/okhttp/"

/**
 * `CertificatePinner` keeps a map of host name to certificate pins. The `List`
 * overload receives the verified chain straight from `RealConnection`, while
 * the `Function0` one lazily builds the chain and receives the same pins; every
 * other overload delegates to one of them.
 */
private fun certificatePinnerCheck(owner: String) = Fingerprint(
    definingClass = "${owner}CertificatePinner;",
    name = "check",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/util/List;",
    ),
)

private fun certificatePinnerCheckOkHttp(owner: String) = Fingerprint(
    definingClass = "${owner}CertificatePinner;",
    name = "check\$okhttp",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lkotlin/jvm/functions/Function0;",
    ),
)

/**
 * Default host name verifier of OkHttp. `RealConnection` calls the
 * `X509Certificate` overload directly with the leaf certificate, the
 * `SSLSession` one is the public `HostnameVerifier` implementation.
 */
private fun hostnameVerifierCertificate(owner: String) = Fingerprint(
    definingClass = "${owner}internal/tls/OkHostnameVerifier;",
    name = "verify",
    returnType = "Z",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/security/cert/X509Certificate;",
    ),
)

private fun hostnameVerifierSession(owner: String) = Fingerprint(
    definingClass = "${owner}internal/tls/OkHostnameVerifier;",
    name = "verify",
    returnType = "Z",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljavax/net/ssl/SSLSession;",
    ),
)

/** Third-party and obfuscated verifiers that wrap the strict platform one. */
private fun hostnameVerifier(owner: String) = Fingerprint(
    definingClass = owner,
    name = "verify",
    returnType = "Z",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljavax/net/ssl/SSLSession;",
    ),
)

/**
 * Strict wrapper around the platform trust manager: throws
 * `CertificateException` when the chain or host name does not match.
 */
private fun trustManager(owner: String) = Fingerprint(
    definingClass = owner,
    name = "checkServerTrusted",
    returnType = "V",
    parameters = listOf(
        "[Ljava/security/cert/X509Certificate;",
        "Ljava/lang/String;",
    ),
)

internal val OkHttpCertificatePinnerCheckFingerprint = certificatePinnerCheck(OKHTTP)

internal val OkHttpCertificatePinnerCheckOkHttpFingerprint = certificatePinnerCheckOkHttp(OKHTTP)

internal val OkHttpHostnameVerifierCertificateFingerprint = hostnameVerifierCertificate(OKHTTP)

internal val OkHttpHostnameVerifierSessionFingerprint = hostnameVerifierSession(OKHTTP)

internal val ApplovinCertificatePinnerCheckFingerprint =
    certificatePinnerCheck(APPLOVIN_OKHTTP)

internal val ApplovinCertificatePinnerCheckOkHttpFingerprint =
    certificatePinnerCheckOkHttp(APPLOVIN_OKHTTP)

internal val ApplovinHostnameVerifierCertificateFingerprint =
    hostnameVerifierCertificate(APPLOVIN_OKHTTP)

internal val ApplovinHostnameVerifierSessionFingerprint =
    hostnameVerifierSession(APPLOVIN_OKHTTP)

internal val BaiduCertificatePinnerCheckFingerprint = certificatePinnerCheck(BAIDU_OKHTTP)

internal val BaiduHostnameVerifierCertificateFingerprint =
    hostnameVerifierCertificate(BAIDU_OKHTTP)

internal val BaiduHostnameVerifierSessionFingerprint = hostnameVerifierSession(BAIDU_OKHTTP)

/** Obfuscated platform trust manager used by TeraBox's own HTTP clients. */
internal val TencentTrustManagerFingerprint = trustManager("Lld/____\$___;")

/**
 * Trust manager that verifies the chain through `X509TrustManagerExtensions`
 * and throws `CertificateException` on a mismatch. New in 4.29.0; it wraps the
 * same platform manager and is what pins the CDN hosts.
 */
internal val TencentPinnedTrustManagerFingerprint = trustManager("Lld/__\$___;")

/** Obfuscated host name verifiers wrapped around the strict platform verifier. */
internal val TencentHostnameVerifierFingerprint = hostnameVerifier("Lld/____\$_;")

internal val TencentLoginHostnameVerifierFingerprint = hostnameVerifier("Lld/__\$_;")

internal val TencentDownloadHostnameVerifierFingerprint = hostnameVerifier("Lld/__\$__;")

internal val ObfuscatedHostnameVerifierFingerprint = hostnameVerifier("L_____/___;")

internal val NcHostnameVerifierFingerprint = hostnameVerifier("Loc/______;")

internal val FeHostnameVerifierFingerprint = hostnameVerifier("Lge/__\$_;")

internal val QdHostnameVerifierFingerprint = hostnameVerifier("Lrd/__\$_;")

internal val HttpDnsHostnameVerifierFingerprint = hostnameVerifier("Lcu/n\$_;")

internal val MintegralHostnameVerifierFingerprint =
    hostnameVerifier("Lcom/mbridge/msdk/foundation/same/net/MBridgeHostnameVerifier;")

internal val MintegralOkHttpHostnameVerifierFingerprint =
    hostnameVerifier("Lcom/mbridge/msdk/thrid/okhttp/internal/tls/d;")

internal val GrpcHostnameVerifierFingerprint = hostnameVerifier("Lio/grpc/okhttp/internal/_____;")

internal val WebViewSslErrorFingerprint = Fingerprint(
    definingClass = "Lcom/dubox/drive/business/widget/webview/client/____;",
    name = "onReceivedSslError",
    returnType = "V",
    parameters = listOf(
        "Landroid/webkit/WebView;",
        "Landroid/webkit/SslErrorHandler;",
        "Landroid/net/http/SslError;",
    ),
)
