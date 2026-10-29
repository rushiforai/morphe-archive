package patches.flitsmeister

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode

// Read before SDK startup, including Measurement loaded from Play services.
private val trackingCollectionResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { doc ->
            val namespace = "http://schemas.android.com/apk/res/android"
            val manifest = doc.documentElement
            val applications = doc.getElementsByTagName("application")
            check(applications.length == 1) { "Changed Flitsmeister application manifest" }
            val application = applications.item(0) as org.w3c.dom.Element
            val metadata = linkedMapOf(
                "firebase_analytics_collection_deactivated" to "true",
                "firebase_analytics_collection_enabled" to "false",
                "google_analytics_adid_collection_enabled" to "false",
                "google_analytics_automatic_screen_reporting_enabled" to "false",
                "firebase_crashlytics_collection_enabled" to "false",
                "firebase_performance_collection_deactivated" to "true",
                "firebase_performance_collection_enabled" to "false",
                "firebase_sessions_enabled" to "false",
            )
            val existing = application.getElementsByTagName("meta-data")
            check((0 until existing.length).none {
                (existing.item(it) as org.w3c.dom.Element).getAttributeNS(namespace, "name") in metadata
            }) { "Changed SDK collection metadata" }
            metadata.forEach { (name, value) ->
                val element = doc.createElement("meta-data")
                element.setAttributeNS(namespace, "android:name", name)
                element.setAttributeNS(namespace, "android:value", value)
                application.appendChild(element)
            }
            val removedPermissions = setOf(
                "com.google.android.gms.permission.AD_ID",
                "android.permission.ACCESS_ADSERVICES_AD_ID",
                "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
            )
            val permissions = manifest.getElementsByTagName("uses-permission")
            val matched = mutableSetOf<String>()
            for (index in permissions.length - 1 downTo 0) {
                val permission = permissions.item(index) as org.w3c.dom.Element
                val name = permission.getAttributeNS(namespace, "name")
                if (name in removedPermissions) {
                    check(permission.attributes.length == 1 && matched.add(name)) {
                        "Changed advertising permission contract: $name"
                    }
                    manifest.removeChild(permission)
                }
            }
            check(matched == removedPermissions) { "Missing advertising permission contract" }
        }
    }
}

/**
 * Exact 14.17 SDK boundaries. Keep Firebase's shared provider, messaging,
 * installations and asynchronous token contracts intact. A saved opt-in cannot
 * override the SDK collection gates below.
 *
 * Measurement returns its existing explicit-deactivation status (1). Crashlytics
 * denies its data-collection grant before settings/report continuations run;
 * logging, exceptions and custom keys stop at their void SDK sinks. Performance
 * and Sessions return disabled settings and stop their own config/event paths.
 * Sessions' suspend settings update returns real Unit synchronously.
 *
 * Insider does not register its core/lifecycle handlers. getCurrentUser already
 * returns the SDK's inactive user when uninitialized; retain that typed fallback.
 * Event builders return a real empty event without adding it to the pre-init
 * queue. Its geofence receiver exits before goAsync, and persisted job services
 * return false (completed synchronously), so no required callback is abandoned.
 * The SDK-only HTTP boundary returns a real empty 204 response for callers that
 * may outlive normal startup; completion code can still run without retries.
 * No shared HTTP, Android location, account, map or explicit report API changes.
 */
@Suppress("unused")
val disableTracking = bytecodePatch(
    name = "Disable tracking",
    description = "Disables automatic usage/location telemetry, Firebase analytics/crash/performance/session collection, Insider marketing and advertising identifier access while retaining account, navigation and explicit reports.",
    default = true,
) {
    compatibleWith(flitsmeister)
    dependsOn(originalInput, startupCompatibility, firstPartyTelemetry, trackingCollectionResources)
    execute {
        applyPlans(listOf(
            MethodPlan(
                "Lcom/google/android/gms/measurement/internal/zzic;->zzC()I", 4, 49,
                listOf(
                    Guard(0, Opcode.IGET_OBJECT, listOf(0, 3), "Lcom/google/android/gms/measurement/internal/zzic;->zzj:Lcom/google/android/gms/measurement/internal/zzhz;"),
                    Guard(1, Opcode.INVOKE_STATIC, listOf(0), "Lcom/google/android/gms/measurement/internal/zzic;->zzP(Lcom/google/android/gms/measurement/internal/zzjf;)V"),
                    Guard(2, Opcode.INVOKE_VIRTUAL, listOf(0), "Lcom/google/android/gms/measurement/internal/zzhz;->zzg()V"),
                    Guard(48, Opcode.RETURN, listOf(3)),
                ),
                listOf(Edit(0, "body", "const/4 v0, 0x1\nreturn v0")),
                mapOf("Lcom/google/android/gms/measurement/internal/zzic;->zzj:Lcom/google/android/gms/measurement/internal/zzhz;" to 1, "Lcom/google/android/gms/measurement/internal/zzic;->zzP(Lcom/google/android/gms/measurement/internal/zzjf;)V" to 2, "Lcom/google/android/gms/measurement/internal/zzhz;->zzg()V" to 2),
            ),
            MethodPlan(
                "Lcom/google/android/gms/measurement/internal/zzal;->zzu()Z", 2, 12,
                listOf(
                    Guard(0, Opcode.CONST_STRING, listOf(0)),
                    Guard(1, Opcode.INVOKE_VIRTUAL, listOf(1, 0), "Lcom/google/android/gms/measurement/internal/zzal;->zzr(Ljava/lang/String;)Ljava/lang/Boolean;"),
                    Guard(4, Opcode.INVOKE_VIRTUAL, listOf(1), "Ljava/lang/Boolean;->booleanValue()Z"),
                    Guard(11, Opcode.RETURN, listOf(1)),
                ),
                listOf(Edit(0, "body", "const/4 v0, 0x0\nreturn v0")),
                mapOf("Lcom/google/android/gms/measurement/internal/zzal;->zzr(Ljava/lang/String;)Ljava/lang/Boolean;" to 1, "Ljava/lang/Boolean;->booleanValue()Z" to 1),
            ),
            MethodPlan(
                "Lcom/google/android/gms/measurement/internal/zzal;->zzv()Z", 2, 12,
                listOf(
                    Guard(0, Opcode.CONST_STRING, listOf(0)),
                    Guard(1, Opcode.INVOKE_VIRTUAL, listOf(1, 0), "Lcom/google/android/gms/measurement/internal/zzal;->zzr(Ljava/lang/String;)Ljava/lang/Boolean;"),
                    Guard(4, Opcode.INVOKE_VIRTUAL, listOf(1), "Ljava/lang/Boolean;->booleanValue()Z"),
                    Guard(11, Opcode.RETURN, listOf(1)),
                ),
                listOf(Edit(0, "body", "const/4 v0, 0x0\nreturn v0")),
                mapOf("Lcom/google/android/gms/measurement/internal/zzal;->zzr(Ljava/lang/String;)Ljava/lang/Boolean;" to 1, "Ljava/lang/Boolean;->booleanValue()Z" to 1),
            ),
            MethodPlan(
                "Lcom/google/android/gms/internal/measurement/zzez;->zzX(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;ZZLjava/lang/Long;Ljava/lang/Long;)V", 17, 12,
                listOf(
                    Guard(0, Opcode.NEW_INSTANCE, listOf(0), "Lcom/google/android/gms/internal/measurement/zzen;"),
                    Guard(1, Opcode.MOVE_OBJECT, listOf(1, 9)),
                    Guard(9, Opcode.INVOKE_DIRECT_RANGE, listOf(0, 1, 2, 3, 4, 5, 6, 7, 8), "Lcom/google/android/gms/internal/measurement/zzen;-><init>(Lcom/google/android/gms/internal/measurement/zzez;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;ZZ)V"),
                    Guard(10, Opcode.INVOKE_DIRECT, listOf(9, 0), "Lcom/google/android/gms/internal/measurement/zzez;->zzV(Lcom/google/android/gms/internal/measurement/zzeo;)V"),
                    Guard(11, Opcode.RETURN_VOID, listOf()),
                ),
                listOf(Edit(0, "body", "return-void")),
                mapOf("Lcom/google/android/gms/internal/measurement/zzen;" to 1, "Lcom/google/android/gms/internal/measurement/zzen;-><init>(Lcom/google/android/gms/internal/measurement/zzez;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;ZZ)V" to 1, "Lcom/google/android/gms/internal/measurement/zzez;->zzV(Lcom/google/android/gms/internal/measurement/zzeo;)V" to 1),
            ),
            MethodPlan(
                "Lcom/google/android/gms/internal/measurement/zzez;->zzk(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Z)V", 11, 9,
                listOf(
                    Guard(0, Opcode.NEW_INSTANCE, listOf(0), "Lcom/google/android/gms/internal/measurement/zzdf;"),
                    Guard(1, Opcode.MOVE_OBJECT, listOf(1, 6)),
                    Guard(6, Opcode.INVOKE_DIRECT_RANGE, listOf(0, 1, 2, 3, 4, 5), "Lcom/google/android/gms/internal/measurement/zzdf;-><init>(Lcom/google/android/gms/internal/measurement/zzez;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Z)V"),
                    Guard(7, Opcode.INVOKE_DIRECT, listOf(1, 0), "Lcom/google/android/gms/internal/measurement/zzez;->zzV(Lcom/google/android/gms/internal/measurement/zzeo;)V"),
                    Guard(8, Opcode.RETURN_VOID, listOf()),
                ),
                listOf(Edit(0, "body", "return-void")),
                mapOf("Lcom/google/android/gms/internal/measurement/zzdf;" to 1, "Lcom/google/android/gms/internal/measurement/zzdf;-><init>(Lcom/google/android/gms/internal/measurement/zzez;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Z)V" to 1, "Lcom/google/android/gms/internal/measurement/zzez;->zzV(Lcom/google/android/gms/internal/measurement/zzeo;)V" to 1),
            ),
            MethodPlan(
                "Lcom/google/android/gms/internal/measurement/zzez;->zzl(Landroid/os/Bundle;)V", 3, 4,
                listOf(
                    Guard(0, Opcode.NEW_INSTANCE, listOf(0), "Lcom/google/android/gms/internal/measurement/zzdg;"),
                    Guard(1, Opcode.INVOKE_DIRECT, listOf(0, 1, 2), "Lcom/google/android/gms/internal/measurement/zzdg;-><init>(Lcom/google/android/gms/internal/measurement/zzez;Landroid/os/Bundle;)V"),
                    Guard(2, Opcode.INVOKE_DIRECT, listOf(1, 0), "Lcom/google/android/gms/internal/measurement/zzez;->zzV(Lcom/google/android/gms/internal/measurement/zzeo;)V"),
                    Guard(3, Opcode.RETURN_VOID, listOf()),
                ),
                listOf(Edit(0, "body", "return-void")),
                mapOf("Lcom/google/android/gms/internal/measurement/zzdg;" to 1, "Lcom/google/android/gms/internal/measurement/zzdg;-><init>(Lcom/google/android/gms/internal/measurement/zzez;Landroid/os/Bundle;)V" to 1, "Lcom/google/android/gms/internal/measurement/zzez;->zzV(Lcom/google/android/gms/internal/measurement/zzeo;)V" to 1),
            ),
            MethodPlan(
                "Lcom/google/android/gms/internal/measurement/zzez;->zzo(Ljava/lang/String;)V", 3, 4,
                listOf(
                    Guard(0, Opcode.NEW_INSTANCE, listOf(0), "Lcom/google/android/gms/internal/measurement/zzdj;"),
                    Guard(1, Opcode.INVOKE_DIRECT, listOf(0, 1, 2), "Lcom/google/android/gms/internal/measurement/zzdj;-><init>(Lcom/google/android/gms/internal/measurement/zzez;Ljava/lang/String;)V"),
                    Guard(2, Opcode.INVOKE_DIRECT, listOf(1, 0), "Lcom/google/android/gms/internal/measurement/zzez;->zzV(Lcom/google/android/gms/internal/measurement/zzeo;)V"),
                    Guard(3, Opcode.RETURN_VOID, listOf()),
                ),
                listOf(Edit(0, "body", "return-void")),
                mapOf("Lcom/google/android/gms/internal/measurement/zzdj;" to 1, "Lcom/google/android/gms/internal/measurement/zzdj;-><init>(Lcom/google/android/gms/internal/measurement/zzez;Ljava/lang/String;)V" to 1, "Lcom/google/android/gms/internal/measurement/zzez;->zzV(Lcom/google/android/gms/internal/measurement/zzeo;)V" to 1),
            ),
            MethodPlan(
                "Lcom/google/android/gms/internal/measurement/zzez;->zzp(Lcom/google/android/gms/internal/measurement/zzdd;Ljava/lang/String;Ljava/lang/String;)V", 5, 4,
                listOf(
                    Guard(0, Opcode.NEW_INSTANCE, listOf(0), "Lcom/google/android/gms/internal/measurement/zzdk;"),
                    Guard(1, Opcode.INVOKE_DIRECT, listOf(0, 1, 2, 3, 4), "Lcom/google/android/gms/internal/measurement/zzdk;-><init>(Lcom/google/android/gms/internal/measurement/zzez;Lcom/google/android/gms/internal/measurement/zzdd;Ljava/lang/String;Ljava/lang/String;)V"),
                    Guard(2, Opcode.INVOKE_DIRECT, listOf(1, 0), "Lcom/google/android/gms/internal/measurement/zzez;->zzV(Lcom/google/android/gms/internal/measurement/zzeo;)V"),
                    Guard(3, Opcode.RETURN_VOID, listOf()),
                ),
                listOf(Edit(0, "body", "return-void")),
                mapOf("Lcom/google/android/gms/internal/measurement/zzdk;" to 1, "Lcom/google/android/gms/internal/measurement/zzdk;-><init>(Lcom/google/android/gms/internal/measurement/zzez;Lcom/google/android/gms/internal/measurement/zzdd;Ljava/lang/String;Ljava/lang/String;)V" to 1, "Lcom/google/android/gms/internal/measurement/zzez;->zzV(Lcom/google/android/gms/internal/measurement/zzeo;)V" to 1),
            ),
            MethodPlan(
                "Lcom/google/android/gms/internal/measurement/zzez;->zzL(Landroid/os/Bundle;)V", 3, 4,
                listOf(
                    Guard(0, Opcode.NEW_INSTANCE, listOf(0), "Lcom/google/android/gms/internal/measurement/zzei;"),
                    Guard(1, Opcode.INVOKE_DIRECT, listOf(0, 1, 2), "Lcom/google/android/gms/internal/measurement/zzei;-><init>(Lcom/google/android/gms/internal/measurement/zzez;Landroid/os/Bundle;)V"),
                    Guard(2, Opcode.INVOKE_DIRECT, listOf(1, 0), "Lcom/google/android/gms/internal/measurement/zzez;->zzV(Lcom/google/android/gms/internal/measurement/zzeo;)V"),
                    Guard(3, Opcode.RETURN_VOID, listOf()),
                ),
                listOf(Edit(0, "body", "return-void")),
                mapOf("Lcom/google/android/gms/internal/measurement/zzei;" to 1, "Lcom/google/android/gms/internal/measurement/zzei;-><init>(Lcom/google/android/gms/internal/measurement/zzez;Landroid/os/Bundle;)V" to 1, "Lcom/google/android/gms/internal/measurement/zzez;->zzV(Lcom/google/android/gms/internal/measurement/zzeo;)V" to 1),
            ),
            MethodPlan(
                "Lcom/google/android/gms/internal/measurement/zzez;->zzu(Ljava/lang/String;)V", 3, 4,
                listOf(
                    Guard(0, Opcode.NEW_INSTANCE, listOf(0), "Lcom/google/android/gms/internal/measurement/zzdq;"),
                    Guard(1, Opcode.INVOKE_DIRECT, listOf(0, 1, 2), "Lcom/google/android/gms/internal/measurement/zzdq;-><init>(Lcom/google/android/gms/internal/measurement/zzez;Ljava/lang/String;)V"),
                    Guard(2, Opcode.INVOKE_DIRECT, listOf(1, 0), "Lcom/google/android/gms/internal/measurement/zzez;->zzV(Lcom/google/android/gms/internal/measurement/zzeo;)V"),
                    Guard(3, Opcode.RETURN_VOID, listOf()),
                ),
                listOf(Edit(0, "body", "return-void")),
                mapOf("Lcom/google/android/gms/internal/measurement/zzdq;" to 1, "Lcom/google/android/gms/internal/measurement/zzdq;-><init>(Lcom/google/android/gms/internal/measurement/zzez;Ljava/lang/String;)V" to 1, "Lcom/google/android/gms/internal/measurement/zzez;->zzV(Lcom/google/android/gms/internal/measurement/zzeo;)V" to 1),
            ),
            MethodPlan(
                "Lcom/google/android/gms/internal/measurement/zzez;->zzv(Ljava/lang/String;)V", 3, 4,
                listOf(
                    Guard(0, Opcode.NEW_INSTANCE, listOf(0), "Lcom/google/android/gms/internal/measurement/zzdr;"),
                    Guard(1, Opcode.INVOKE_DIRECT, listOf(0, 1, 2), "Lcom/google/android/gms/internal/measurement/zzdr;-><init>(Lcom/google/android/gms/internal/measurement/zzez;Ljava/lang/String;)V"),
                    Guard(2, Opcode.INVOKE_DIRECT, listOf(1, 0), "Lcom/google/android/gms/internal/measurement/zzez;->zzV(Lcom/google/android/gms/internal/measurement/zzeo;)V"),
                    Guard(3, Opcode.RETURN_VOID, listOf()),
                ),
                listOf(Edit(0, "body", "return-void")),
                mapOf("Lcom/google/android/gms/internal/measurement/zzdr;" to 1, "Lcom/google/android/gms/internal/measurement/zzdr;-><init>(Lcom/google/android/gms/internal/measurement/zzez;Ljava/lang/String;)V" to 1, "Lcom/google/android/gms/internal/measurement/zzez;->zzV(Lcom/google/android/gms/internal/measurement/zzeo;)V" to 1),
            ),
            MethodPlan(
                "Lko;->a(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;)V", 11, 118,
                listOf(
                    Guard(0, Opcode.INVOKE_VIRTUAL, listOf(8), "Ljava/lang/Object;->getClass()Ljava/lang/Class;"),
                    Guard(1, Opcode.INVOKE_VIRTUAL, listOf(9), "Ljava/lang/Object;->getClass()Ljava/lang/Class;"),
                    Guard(5, Opcode.INVOKE_STATIC, listOf(9, 0, 1), "Lshi;->y(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z"),
                    Guard(12, Opcode.INVOKE_STATIC, listOf(9), "Lshi;->H(Ljava/lang/CharSequence;)Z"),
                    Guard(117, Opcode.RETURN_VOID, listOf()),
                ),
                listOf(Edit(0, "body", "return-void")),
                mapOf("Ljava/lang/Object;->getClass()Ljava/lang/Class;" to 6, "Lshi;->y(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z" to 2, "Lshi;->H(Ljava/lang/CharSequence;)Z" to 1),
            ),
            MethodPlan(
                "Lxp5;->a()Z", 4, 20,
                listOf(
                    Guard(0, Opcode.MONITOR_ENTER, listOf(3)),
                    Guard(1, Opcode.IGET_OBJECT, listOf(0, 3), "Lxp5;->d:Ljava/lang/Boolean;"),
                    Guard(3, Opcode.INVOKE_VIRTUAL, listOf(0), "Ljava/lang/Boolean;->booleanValue()Z"),
                    Guard(8, Opcode.IGET_OBJECT, listOf(0, 3), "Lxp5;->a:Lbb8;"),
                    Guard(19, Opcode.THROW, listOf(0)),
                ),
                listOf(Edit(0, "body", "const/4 v0, 0x0\nreturn v0")),
                mapOf("Lxp5;->d:Ljava/lang/Boolean;" to 1, "Ljava/lang/Boolean;->booleanValue()Z" to 1, "Lxp5;->a:Lbb8;" to 1),
            ),
            MethodPlan(
                "Lgb8;->b(Ljava/lang/String;)V", 6, 11,
                listOf(
                    Guard(0, Opcode.INVOKE_STATIC, listOf(), "Ljava/lang/System;->currentTimeMillis()J"),
                    Guard(1, Opcode.MOVE_RESULT_WIDE, listOf(0)),
                    Guard(2, Opcode.IGET_OBJECT, listOf(4, 4), "Lgb8;->a:Lu85;"),
                    Guard(3, Opcode.IGET_WIDE, listOf(2, 4), "Lu85;->d:J"),
                    Guard(10, Opcode.RETURN_VOID, listOf()),
                ),
                listOf(Edit(0, "body", "return-void")),
                mapOf("Ljava/lang/System;->currentTimeMillis()J" to 1, "Lgb8;->a:Lu85;" to 1, "Lu85;->d:J" to 1),
            ),
            MethodPlan(
                "Lgb8;->c(Ljava/lang/Throwable;)V", 4, 14,
                listOf(
                    Guard(0, Opcode.IF_NEZ, listOf(3), target = 6),
                    Guard(1, Opcode.CONST_4, listOf(2)),
                    Guard(4, Opcode.INVOKE_STATIC, listOf(3, 0, 2), "Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I"),
                    Guard(6, Opcode.SGET_OBJECT, listOf(0), "Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;"),
                    Guard(7, Opcode.IGET_OBJECT, listOf(2, 2), "Lgb8;->a:Lu85;"),
                    Guard(13, Opcode.RETURN_VOID, listOf()),
                ),
                listOf(Edit(0, "body", "return-void")),
                mapOf("Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I" to 1, "Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;" to 1, "Lgb8;->a:Lu85;" to 1),
            ),
            MethodPlan(
                "Lgb8;->d(Ljava/lang/String;Ljava/lang/String;)V", 5, 7,
                listOf(
                    Guard(0, Opcode.IGET_OBJECT, listOf(2, 2), "Lgb8;->a:Lu85;"),
                    Guard(1, Opcode.IGET_OBJECT, listOf(0, 2), "Lu85;->o:Lca5;"),
                    Guard(2, Opcode.IGET_OBJECT, listOf(0, 0), "Lca5;->a:Ly95;"),
                    Guard(6, Opcode.RETURN_VOID, listOf()),
                ),
                listOf(Edit(0, "body", "return-void")),
                mapOf("Lgb8;->a:Lu85;" to 1, "Lu85;->o:Lca5;" to 1, "Lca5;->a:Ly95;" to 1),
            ),
            MethodPlan(
                "Lgb8;->e(Ljava/lang/String;Z)V", 5, 9,
                listOf(
                    Guard(0, Opcode.INVOKE_STATIC, listOf(4), "Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;"),
                    Guard(1, Opcode.MOVE_RESULT_OBJECT, listOf(4)),
                    Guard(2, Opcode.IGET_OBJECT, listOf(2, 2), "Lgb8;->a:Lu85;"),
                    Guard(3, Opcode.IGET_OBJECT, listOf(0, 2), "Lu85;->o:Lca5;"),
                    Guard(8, Opcode.RETURN_VOID, listOf()),
                ),
                listOf(Edit(0, "body", "return-void")),
                mapOf("Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;" to 1, "Lgb8;->a:Lu85;" to 1, "Lu85;->o:Lca5;" to 1),
            ),
            MethodPlan(
                "Lbe4;->f()Ljava/lang/Boolean;", 4, 61,
                listOf(
                    Guard(0, Opcode.CONST_CLASS, listOf(0), "Lee4;"),
                    Guard(1, Opcode.MONITOR_ENTER, listOf(0)),
                    Guard(2, Opcode.SGET_OBJECT, listOf(1), "Lee4;->q:Lee4;"),
                    Guard(5, Opcode.INVOKE_DIRECT, listOf(1), "Lee4;-><init>()V"),
                    Guard(60, Opcode.THROW, listOf(3)),
                ),
                listOf(Edit(0, "body", "sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;\nreturn-object v0")),
                mapOf("Lee4;" to 2, "Lee4;->q:Lee4;" to 2, "Lee4;-><init>()V" to 1),
            ),
            MethodPlan(
                "Lbe4;->n()Z", 7, 119,
                listOf(
                    Guard(0, Opcode.INVOKE_VIRTUAL, listOf(6), "Lbe4;->f()Ljava/lang/Boolean;"),
                    Guard(1, Opcode.MOVE_RESULT_OBJECT, listOf(0)),
                    Guard(5, Opcode.INVOKE_VIRTUAL, listOf(0), "Ljava/lang/Boolean;->booleanValue()Z"),
                    Guard(8, Opcode.CONST_CLASS, listOf(0), "Loe4;"),
                    Guard(118, Opcode.THROW, listOf(6)),
                ),
                listOf(Edit(0, "body", "const/4 v0, 0x0\nreturn v0")),
                mapOf("Lbe4;->f()Ljava/lang/Boolean;" to 1, "Ljava/lang/Boolean;->booleanValue()Z" to 4, "Loe4;" to 2),
            ),
            MethodPlan(
                "Lcom/google/firebase/perf/config/RemoteConfigManager;->triggerRemoteConfigFetchIfNecessary()V", 3, 18,
                listOf(
                    Guard(0, Opcode.INVOKE_VIRTUAL, listOf(2), "Lcom/google/firebase/perf/config/RemoteConfigManager;->isFirebaseRemoteConfigAvailable()Z"),
                    Guard(1, Opcode.MOVE_RESULT, listOf(0)),
                    Guard(4, Opcode.IGET_OBJECT, listOf(0, 2), "Lcom/google/firebase/perf/config/RemoteConfigManager;->allRcConfigMap:Ljava/util/concurrent/ConcurrentHashMap;"),
                    Guard(5, Opcode.INVOKE_VIRTUAL, listOf(0), "Ljava/util/concurrent/ConcurrentHashMap;->isEmpty()Z"),
                    Guard(17, Opcode.RETURN_VOID, listOf()),
                ),
                listOf(Edit(0, "body", "return-void")),
                mapOf("Lcom/google/firebase/perf/config/RemoteConfigManager;->isFirebaseRemoteConfigAvailable()Z" to 1, "Lcom/google/firebase/perf/config/RemoteConfigManager;->allRcConfigMap:Ljava/util/concurrent/ConcurrentHashMap;" to 2, "Ljava/util/concurrent/ConcurrentHashMap;->isEmpty()Z" to 1),
            ),
            MethodPlan(
                "Laya;->c()Ljava/lang/Boolean;", 3, 13,
                listOf(
                    Guard(0, Opcode.IGET_OBJECT, listOf(2, 2), "Laya;->a:Landroid/os/Bundle;"),
                    Guard(1, Opcode.CONST_4, listOf(0)),
                    Guard(2, Opcode.SGET_OBJECT, listOf(0), "Lcom/octo/android/robospice/request/XoY/MLlURoUpZDDHF;->urTwuijUlTp:Ljava/lang/String;"),
                    Guard(3, Opcode.INVOKE_VIRTUAL, listOf(2, 0), "Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z"),
                    Guard(12, Opcode.RETURN_OBJECT, listOf(2)),
                ),
                listOf(Edit(0, "body", "sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;\nreturn-object v0")),
                mapOf("Laya;->a:Landroid/os/Bundle;" to 1, "Lcom/octo/android/robospice/request/XoY/MLlURoUpZDDHF;->urTwuijUlTp:Ljava/lang/String;" to 1, "Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z" to 1),
            ),
            MethodPlan(
                "Lj6f;->c()Ljava/lang/Boolean;", 1, 4,
                listOf(
                    Guard(0, Opcode.IGET_OBJECT, listOf(0, 0), "Lj6f;->e:Ltvg;"),
                    Guard(1, Opcode.INVOKE_INTERFACE, listOf(0), "Ltvg;->d()Ljava/lang/Boolean;"),
                    Guard(3, Opcode.RETURN_OBJECT, listOf(0)),
                ),
                listOf(Edit(0, "body", "sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;\nreturn-object v0")),
                mapOf("Lj6f;->e:Ltvg;" to 1, "Ltvg;->d()Ljava/lang/Boolean;" to 1),
            ),
            MethodPlan(
                "Lj6f;->a(Ltn4;)Ljava/lang/Object;", 15, 153,
                listOf(
                    Guard(0, Opcode.CONST_STRING, listOf(0)),
                    Guard(1, Opcode.INSTANCE_OF, listOf(1, 14), "Lj6f\$a;"),
                    Guard(5, Opcode.IGET, listOf(2, 1), "Lj6f\$a;->d:I"),
                    Guard(13, Opcode.CHECK_CAST, listOf(14), "Lvn4;"),
                    Guard(152, Opcode.THROW, listOf(14)),
                ),
                listOf(Edit(0, "body", "sget-object v0, Ltvj;->a:Ltvj;\nreturn-object v0")),
                mapOf("Lj6f\$a;" to 3, "Lj6f\$a;->d:I" to 6, "Lvn4;" to 1),
            ),
            MethodPlan(
                "Lbqg;->a(Lwpg;)V", 5, 9,
                listOf(
                    Guard(0, Opcode.IGET_OBJECT, listOf(0, 3), "Lbqg;->e:Lh45;"),
                    Guard(1, Opcode.INVOKE_STATIC, listOf(0), "La55;->a(Lh45;)Lvm4;"),
                    Guard(3, Opcode.NEW_INSTANCE, listOf(1), "Lbqg\$a;"),
                    Guard(8, Opcode.RETURN_VOID, listOf()),
                ),
                listOf(Edit(0, "body", "return-void")),
                mapOf("Lbqg;->e:Lh45;" to 1, "La55;->a(Lh45;)Lvm4;" to 1, "Lbqg\$a;" to 1),
            ),
            MethodPlan(
                "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;->getAdvertisingIdInfo(Landroid/content/Context;)Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;", 10, 38,
                listOf(
                    Guard(0, Opcode.NEW_INSTANCE, listOf(1), "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;"),
                    Guard(1, Opcode.CONST_4, listOf(5)),
                    Guard(5, Opcode.INVOKE_DIRECT_RANGE, listOf(1, 2, 3, 4, 5, 6), "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;-><init>(Landroid/content/Context;JZZ)V"),
                    Guard(6, Opcode.INVOKE_STATIC, listOf(), "Landroid/os/SystemClock;->elapsedRealtime()J"),
                    Guard(37, Opcode.THROW, listOf(9)),
                ),
                listOf(Edit(0, "body", "new-instance v0, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;\nconst-string v1, \"00000000-0000-0000-0000-000000000000\"\nconst/4 v2, 0x1\ninvoke-direct {v0, v1, v2}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;-><init>(Ljava/lang/String;Z)V\nreturn-object v0")),
                mapOf("Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;" to 1, "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;-><init>(Landroid/content/Context;JZZ)V" to 1, "Landroid/os/SystemClock;->elapsedRealtime()J" to 2),
            ),
            MethodPlan(
                "Lcom/useinsider/insider/Insider;->init(Landroid/app/Application;Ljava/lang/String;)V", 5, 16,
                listOf(
                    Guard(0, Opcode.INVOKE_STATIC, listOf(), "Lc6l;->h()Lc6l;"),
                    Guard(1, Opcode.MOVE_RESULT_OBJECT, listOf(0)),
                    Guard(2, Opcode.INVOKE_VIRTUAL, listOf(0), "Lc6l;->f()Lo3l;"),
                    Guard(4, Opcode.CHECK_CAST, listOf(0), "Le4l;"),
                    Guard(15, Opcode.RETURN_VOID, listOf()),
                ),
                listOf(Edit(0, "body", "return-void")),
                mapOf("Lc6l;->h()Lc6l;" to 1, "Lc6l;->f()Lo3l;" to 1, "Le4l;" to 1),
            ),
            MethodPlan(
                "Lcom/useinsider/insider/Insider;->f()Z", 2, 12,
                listOf(
                    Guard(0, Opcode.IGET_OBJECT, listOf(0, 1), "Lcom/useinsider/insider/Insider;->a:Lcom/useinsider/insider/v;"),
                    Guard(1, Opcode.IF_EQZ, listOf(0), target = 10),
                    Guard(2, Opcode.IGET_BOOLEAN, listOf(0, 0), "Lcom/useinsider/insider/v;->q:Z"),
                    Guard(5, Opcode.INVOKE_VIRTUAL, listOf(1), "Lcom/useinsider/insider/v;->c()Z"),
                    Guard(11, Opcode.RETURN, listOf(1)),
                ),
                listOf(Edit(0, "body", "const/4 v0, 0x0\nreturn v0")),
                mapOf("Lcom/useinsider/insider/Insider;->a:Lcom/useinsider/insider/v;" to 2, "Lcom/useinsider/insider/v;->q:Z" to 1, "Lcom/useinsider/insider/v;->c()Z" to 1),
            ),
            MethodPlan(
                "Lcom/useinsider/insider/v;->c()Z", 11, 135,
                listOf(
                    Guard(0, Opcode.IGET_BOOLEAN, listOf(0, 10), "Lcom/useinsider/insider/v;->w1:Z"),
                    Guard(1, Opcode.CONST_4, listOf(1)),
                    Guard(4, Opcode.INVOKE_VIRTUAL, listOf(10), "Lcom/useinsider/insider/v;->e0()Landroid/content/SharedPreferences;"),
                    Guard(7, Opcode.INVOKE_INTERFACE, listOf(0, 2), "Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z"),
                    Guard(134, Opcode.RETURN, listOf(10)),
                ),
                listOf(Edit(0, "body", "const/4 v0, 0x0\nreturn v0")),
                mapOf("Lcom/useinsider/insider/v;->w1:Z" to 2, "Lcom/useinsider/insider/v;->e0()Landroid/content/SharedPreferences;" to 10, "Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z" to 4),
            ),
            MethodPlan(
                "Lcom/useinsider/insider/Insider;->tagEvent(Ljava/lang/String;)Lcom/useinsider/insider/InsiderEvent;", 3, 19,
                listOf(
                    Guard(0, Opcode.INVOKE_VIRTUAL, listOf(1), "Lcom/useinsider/insider/Insider;->f()Z"),
                    Guard(1, Opcode.MOVE_RESULT, listOf(0)),
                    Guard(3, Opcode.IGET_BOOLEAN, listOf(1, 1), "Lcom/useinsider/insider/Insider;->c:Z"),
                    Guard(5, Opcode.NEW_INSTANCE, listOf(1), "Lcom/useinsider/insider/InsiderEvent;"),
                    Guard(18, Opcode.RETURN_OBJECT, listOf(1)),
                ),
                listOf(Edit(0, "body", "new-instance v0, Lcom/useinsider/insider/InsiderEvent;\nconst-string v1, \"\"\ninvoke-direct {v0, v1}, Lcom/useinsider/insider/InsiderEvent;-><init>(Ljava/lang/String;)V\nreturn-object v0")),
                mapOf("Lcom/useinsider/insider/Insider;->f()Z" to 1, "Lcom/useinsider/insider/Insider;->c:Z" to 1, "Lcom/useinsider/insider/InsiderEvent;" to 3),
            ),
            MethodPlan(
                "Lcom/useinsider/insider/Insider;->putException(Ljava/lang/Exception;)V", 3, 10,
                listOf(
                    Guard(0, Opcode.MONITOR_ENTER, listOf(1)),
                    Guard(1, Opcode.INVOKE_VIRTUAL, listOf(1), "Lcom/useinsider/insider/Insider;->f()Z"),
                    Guard(4, Opcode.IGET_OBJECT, listOf(0, 1), "Lcom/useinsider/insider/Insider;->a:Lcom/useinsider/insider/v;"),
                    Guard(5, Opcode.INVOKE_VIRTUAL, listOf(0, 2), "Lcom/useinsider/insider/v;->u(Ljava/lang/Exception;)V"),
                    Guard(9, Opcode.RETURN_VOID, listOf()),
                ),
                listOf(Edit(0, "body", "return-void")),
                mapOf("Lcom/useinsider/insider/Insider;->f()Z" to 1, "Lcom/useinsider/insider/Insider;->a:Lcom/useinsider/insider/v;" to 1, "Lcom/useinsider/insider/v;->u(Ljava/lang/Exception;)V" to 1),
            ),
            MethodPlan(
                "Lcom/useinsider/insider/InsiderEvent;->build()V", 5, 36,
                listOf(
                    Guard(0, Opcode.CONST_STRING, listOf(0)),
                    Guard(1, Opcode.IGET_OBJECT, listOf(1, 4), "Lcom/useinsider/insider/InsiderEvent;->c:Ljava/util/Map;"),
                    Guard(2, Opcode.IGET_OBJECT, listOf(2, 4), "Lcom/useinsider/insider/InsiderEvent;->a:Ljava/lang/String;"),
                    Guard(3, Opcode.INVOKE_STATIC, listOf(2, 1), "Lcom/useinsider/insider/o;->C(Ljava/lang/String;Ljava/util/Map;)Z"),
                    Guard(35, Opcode.RETURN_VOID, listOf()),
                ),
                listOf(Edit(0, "body", "return-void")),
                mapOf("Lcom/useinsider/insider/InsiderEvent;->c:Ljava/util/Map;" to 2, "Lcom/useinsider/insider/InsiderEvent;->a:Ljava/lang/String;" to 2, "Lcom/useinsider/insider/o;->C(Ljava/lang/String;Ljava/util/Map;)Z" to 1),
            ),
            MethodPlan(
                "Lcom/useinsider/insider/InsiderGeofence;->initialize(Landroid/content/Context;)V", 2, 23,
                listOf(
                    Guard(0, Opcode.IF_NEZ, listOf(1), target = 2),
                    Guard(1, Opcode.GOTO, listOf(), target = 10),
                    Guard(2, Opcode.SGET_OBJECT, listOf(0), "Lcom/useinsider/insider/Insider;->Instance:Lcom/useinsider/insider/Insider;"),
                    Guard(3, Opcode.INVOKE_VIRTUAL, listOf(0), "Lcom/useinsider/insider/Insider;->isSdkFrozen()Z"),
                    Guard(7, Opcode.INVOKE_STATIC, listOf(), "Lcom/useinsider/insider/InsiderGeofence;->beginRegistration()Z"),
                    Guard(22, Opcode.RETURN_VOID, listOf()),
                ),
                listOf(Edit(0, "body", "return-void")),
                mapOf("Lcom/useinsider/insider/Insider;->Instance:Lcom/useinsider/insider/Insider;" to 2, "Lcom/useinsider/insider/Insider;->isSdkFrozen()Z" to 1, "Lcom/useinsider/insider/InsiderGeofence;->beginRegistration()Z" to 1),
            ),
            MethodPlan(
                "Lcom/useinsider/insider/InsiderGeofenceReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V", 6, 41,
                listOf(
                    Guard(0, Opcode.INVOKE_STATIC, listOf(), "Lc6l;->h()Lc6l;"),
                    Guard(1, Opcode.MOVE_RESULT_OBJECT, listOf(0)),
                    Guard(2, Opcode.INVOKE_VIRTUAL, listOf(0), "Lc6l;->f()Lo3l;"),
                    Guard(4, Opcode.CHECK_CAST, listOf(0), "Le4l;"),
                    Guard(40, Opcode.RETURN_VOID, listOf()),
                ),
                listOf(Edit(0, "body", "return-void")),
                mapOf("Lc6l;->h()Lc6l;" to 1, "Lc6l;->f()Lo3l;" to 1, "Le4l;" to 1),
            ),
            MethodPlan(
                "Lcom/useinsider/insider/SessionPayloadJobService;->onStartJob(Landroid/app/job/JobParameters;)Z", 4, 14,
                listOf(
                    Guard(0, Opcode.SGET_OBJECT, listOf(0), "Ly2l;->d:Le7l;"),
                    Guard(1, Opcode.INVOKE_VIRTUAL, listOf(0), "Le7l;->a()Ljava/lang/Object;"),
                    Guard(3, Opcode.CHECK_CAST, listOf(0), "Ljava/util/concurrent/ExecutorService;"),
                    Guard(13, Opcode.RETURN, listOf(2)),
                ),
                listOf(Edit(0, "body", "const/4 v0, 0x0\nreturn v0")),
                mapOf("Ly2l;->d:Le7l;" to 1, "Le7l;->a()Ljava/lang/Object;" to 1, "Ljava/util/concurrent/ExecutorService;" to 1),
            ),
            MethodPlan(
                "Lcom/useinsider/insider/SessionPayloadJobService;->b(Landroid/content/Context;)V", 5, 33,
                listOf(
                    Guard(0, Opcode.IF_NEZ, listOf(4), target = 2),
                    Guard(1, Opcode.GOTO, listOf(), target = 28),
                    Guard(2, Opcode.NEW_INSTANCE, listOf(0), "Landroid/content/ComponentName;"),
                    Guard(3, Opcode.CONST_CLASS, listOf(1), "Lcom/useinsider/insider/SessionPayloadJobService;"),
                    Guard(4, Opcode.INVOKE_DIRECT, listOf(0, 4, 1), "Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V"),
                    Guard(32, Opcode.RETURN_VOID, listOf()),
                ),
                listOf(Edit(0, "body", "return-void")),
                mapOf("Landroid/content/ComponentName;" to 1, "Lcom/useinsider/insider/SessionPayloadJobService;" to 1, "Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V" to 1),
            ),
            MethodPlan(
                "Lcom/useinsider/insider/InsiderAmplificationService;->onStartJob(Landroid/app/job/JobParameters;)Z", 4, 10,
                listOf(
                    Guard(0, Opcode.SGET_OBJECT, listOf(0), "Lcom/useinsider/insider/DebuggingTag;->insiderAmplificationServiceStarting:Lcom/useinsider/insider/DebuggingTag;"),
                    Guard(1, Opcode.CONST_4, listOf(1)),
                    Guard(2, Opcode.INVOKE_STATIC, listOf(0, 1), "Lcom/useinsider/insider/Debugger;->a(Lcom/useinsider/insider/DebuggingTag;I)V"),
                    Guard(3, Opcode.NEW_INSTANCE, listOf(0), "Ljava/lang/Thread;"),
                    Guard(9, Opcode.RETURN, listOf(2)),
                ),
                listOf(Edit(0, "body", "const/4 v0, 0x0\nreturn v0")),
                mapOf("Lcom/useinsider/insider/DebuggingTag;->insiderAmplificationServiceStarting:Lcom/useinsider/insider/DebuggingTag;" to 1, "Lcom/useinsider/insider/Debugger;->a(Lcom/useinsider/insider/DebuggingTag;I)V" to 1, "Ljava/lang/Thread;" to 1),
            ),
            MethodPlan(
                "Lcom/useinsider/insider/InsiderAmplificationService;->onStopJob(Landroid/app/job/JobParameters;)Z", 2, 2,
                listOf(
                    Guard(0, Opcode.CONST_4, listOf(0)),
                    Guard(1, Opcode.RETURN, listOf(0)),
                ),
                listOf(Edit(0, "body", "const/4 v0, 0x0\nreturn v0")),
            ),
            MethodPlan(
                "Le4l;->d()V", 3, 21,
                listOf(
                    Guard(0, Opcode.MONITOR_ENTER, listOf(2)),
                    Guard(1, Opcode.IGET_BOOLEAN, listOf(0, 2), "Le4l;->c:Z"),
                    Guard(4, Opcode.INVOKE_VIRTUAL, listOf(2), "Le4l;->a()Landroid/content/Context;"),
                    Guard(6, Opcode.INSTANCE_OF, listOf(1, 0), "Landroid/app/Application;"),
                    Guard(20, Opcode.THROW, listOf(0)),
                ),
                listOf(Edit(0, "body", "return-void")),
                mapOf("Le4l;->c:Z" to 2, "Le4l;->a()Landroid/content/Context;" to 1, "Landroid/app/Application;" to 2),
            ),
            MethodPlan(
                "Lcom/useinsider/insider/o;->d(Ljava/lang/String;Lorg/json/JSONObject;Landroid/content/Context;ZLe8l;)Lyzk;", 26, 292,
                listOf(
                    Guard(0, Opcode.MOVE_OBJECT_FROM16, listOf(0, 21)),
                    Guard(1, Opcode.MOVE_OBJECT_FROM16, listOf(1, 22)),
                    Guard(6, Opcode.NEW_INSTANCE, listOf(7), "Ljava/sql/Timestamp;"),
                    Guard(7, Opcode.INVOKE_STATIC, listOf(), "Ljava/lang/System;->currentTimeMillis()J"),
                    Guard(9, Opcode.INVOKE_DIRECT, listOf(7, 8, 9), "Ljava/sql/Timestamp;-><init>(J)V"),
                    Guard(291, Opcode.RETURN_OBJECT, listOf(0)),
                ),
                listOf(Edit(0, "body", "new-instance v0, Lyzk;\nconst-string v1, \"\"\nconst/16 v2, 0xcc\ninvoke-direct {v0, v1, v2}, Lyzk;-><init>(Ljava/lang/String;I)V\nreturn-object v0")),
                mapOf("Ljava/sql/Timestamp;" to 1, "Ljava/lang/System;->currentTimeMillis()J" to 1, "Ljava/sql/Timestamp;-><init>(J)V" to 1),
            ),
            MethodPlan(
                "Lz80;->j(Ljava/lang/String;Ljava/util/Map;)V", 10, 135,
                listOf(
                    Guard(0, Opcode.SGET_OBJECT, listOf(7), "Lcom/useinsider/insider/Insider;->Instance:Lcom/useinsider/insider/Insider;"),
                    Guard(1, Opcode.INVOKE_VIRTUAL, listOf(7, 8), "Lcom/useinsider/insider/Insider;->tagEvent(Ljava/lang/String;)Lcom/useinsider/insider/InsiderEvent;"),
                    Guard(3, Opcode.INVOKE_INTERFACE, listOf(9), "Ljava/util/Map;->entrySet()Ljava/util/Set;"),
                    Guard(134, Opcode.RETURN_VOID, listOf()),
                ),
                listOf(Edit(0, "body", "return-void")),
                mapOf("Lcom/useinsider/insider/Insider;->Instance:Lcom/useinsider/insider/Insider;" to 1, "Lcom/useinsider/insider/Insider;->tagEvent(Ljava/lang/String;)Lcom/useinsider/insider/InsiderEvent;" to 1, "Ljava/util/Map;->entrySet()Ljava/util/Set;" to 1),
            ),
            MethodPlan(
                "Lj5a;->a(Ljava/lang/Object;Ljava/lang/String;)V", 7, 130,
                listOf(
                    Guard(0, Opcode.INVOKE_VIRTUAL, listOf(6), "Ljava/lang/Object;->getClass()Ljava/lang/Class;"),
                    Guard(1, Opcode.INVOKE_VIRTUAL, listOf(5), "Ljava/lang/Object;->getClass()Ljava/lang/Class;"),
                    Guard(2, Opcode.INSTANCE_OF, listOf(4, 5), "Ljava/lang/String;"),
                    Guard(4, Opcode.SGET_OBJECT, listOf(4), "Lcom/useinsider/insider/Insider;->Instance:Lcom/useinsider/insider/Insider;"),
                    Guard(129, Opcode.RETURN_VOID, listOf()),
                ),
                listOf(Edit(0, "body", "return-void")),
                mapOf("Ljava/lang/Object;->getClass()Ljava/lang/Class;" to 3, "Ljava/lang/String;" to 2, "Lcom/useinsider/insider/Insider;->Instance:Lcom/useinsider/insider/Insider;" to 7),
            ),
            MethodPlan(
                "Lj5a;->c(Luo;)V", 10, 208,
                listOf(
                    Guard(0, Opcode.INVOKE_VIRTUAL, listOf(9), "Ljava/lang/Object;->getClass()Ljava/lang/Class;"),
                    Guard(1, Opcode.SGET_OBJECT, listOf(8), "Lcom/useinsider/insider/Insider;->Instance:Lcom/useinsider/insider/Insider;"),
                    Guard(2, Opcode.INVOKE_VIRTUAL, listOf(9), "Luo;->a()Ljava/lang/String;"),
                    Guard(207, Opcode.RETURN_VOID, listOf()),
                ),
                listOf(Edit(0, "body", "return-void")),
                mapOf("Ljava/lang/Object;->getClass()Ljava/lang/Class;" to 2, "Lcom/useinsider/insider/Insider;->Instance:Lcom/useinsider/insider/Insider;" to 1, "Luo;->a()Ljava/lang/String;" to 1),
            ),
            MethodPlan(
                "Ll6c;->a()Z", 6, 40,
                listOf(
                    Guard(0, Opcode.CONST_STRING, listOf(0)),
                    Guard(1, Opcode.CONST_4, listOf(1)),
                    Guard(2, Opcode.INVOKE_STATIC, listOf(), "Lbb8;->c()Lbb8;"),
                    Guard(5, Opcode.INVOKE_VIRTUAL, listOf(2), "Lbb8;->a()V"),
                    Guard(6, Opcode.IGET_OBJECT, listOf(2, 2), "Lbb8;->a:Landroid/content/Context;"),
                    Guard(39, Opcode.RETURN, listOf(1)),
                ),
                listOf(Edit(0, "body", "const/4 v0, 0x0\nreturn v0")),
                mapOf("Lbb8;->c()Lbb8;" to 2, "Lbb8;->a()V" to 1, "Lbb8;->a:Landroid/content/Context;" to 1),
            ),
            MethodPlan(
                "Ll6c;->c(Landroid/os/Bundle;Ljava/lang/String;)V", 7, 113,
                listOf(
                    Guard(0, Opcode.CONST_STRING, listOf(0)),
                    Guard(1, Opcode.INVOKE_STATIC, listOf(), "Lbb8;->c()Lbb8;"),
                    Guard(3, Opcode.NEW_INSTANCE, listOf(5), "Landroid/os/Bundle;"),
                    Guard(4, Opcode.INVOKE_DIRECT, listOf(5), "Landroid/os/Bundle;-><init>()V"),
                    Guard(112, Opcode.RETURN_VOID, listOf()),
                ),
                listOf(Edit(0, "body", "return-void")),
                mapOf("Lbb8;->c()Lbb8;" to 2, "Landroid/os/Bundle;" to 2, "Landroid/os/Bundle;-><init>()V" to 2),
            ),
        ))
    }
}
