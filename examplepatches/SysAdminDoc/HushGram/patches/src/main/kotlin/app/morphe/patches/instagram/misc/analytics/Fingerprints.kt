/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.misc.analytics

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * The method that builds the address Instagram uploads its usage events to, from a host and a
 * flag: "https://" + host + "/logging_client_events", or "/pigeon_nest" for Instagram's own
 * pipeline. Its class and name are Redex names, so the fingerprint uses its shape and strings.
 */
internal object AnalyticsEndpointFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/lang/String;", "Z"),
    strings = listOf("https://", "/pigeon_nest", "/logging_client_events"),
    custom = { method, _ -> AccessFlags.STATIC.isSet(method.accessFlags) },
)

/** The address Instagram also sends usage events to, Facebook's Graph API logging endpoint. */
internal const val GRAPH_LOGGING_ENDPOINT = "https://graph.facebook.com/logging_client_events"

/**
 * The address Instagram's error reporter, Lacrima, posts its startup and debug pings to, a
 * constant in each Runnable that sends one.
 */
internal const val ERROR_PING_ENDPOINT = "https://b-www.facebook.com/mobile/extra_data_collector/"

/**
 * The method that builds a Uri on b-www.facebook.com from path segments, for Lacrima's crash and
 * reliability report uploads (/mobile/reliability_event_log_upload/). On 449 it's the one static
 * method taking a String array that holds both pieces of the address.
 */
internal object ReportAddressFingerprint : Fingerprint(
    returnType = "Landroid/net/Uri;",
    parameters = listOf("[Ljava/lang/String;"),
    strings = listOf("https", "b-www.facebook.com"),
    custom = { method, _ -> AccessFlags.STATIC.isSet(method.accessFlags) },
)
