package patches.flitsmeister

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

/**
 * Flitsmeister 15.0/1289 PairIP startup profile.
 *
 * Version 15 moved the real application, activity and background-service bodies
 * behind the PairIP native VM and dropped the version 14 embedded helper DEX.
 * The shipped 14.17 architecture is therefore followed: skip the startup
 * program, inject the captured startup string data, neutralize the Java-level
 * license/integrity checks, restore the matching MapLibre native library and
 * reconstruct all twenty functional VM-backed application callbacks.
 *
 * The two remaining VM callers are PairIP dispatchers. Static reconstruction
 * and Android runtime acceptance are verified separately.
 */
internal val startupManifestResources15 = resourcePatch {
    dependsOn(originalInput)
    execute {
        // Record the input version for the 14.17 startup chain's extendWithAll.
        flitsmeisterInputIs15 = isFlitsmeister15Resources()
        // Idempotent twin of the 14.17 manifest cleanup: removing the PairIP
        // license activity and permission is version-neutral and safe to run
        // for either input, so no version gate is needed here.
        document("AndroidManifest.xml").use { doc ->
            val namespace = "http://schemas.android.com/apk/res/android"
            val activities = doc.getElementsByTagName("activity")
            for (index in activities.length - 1 downTo 0) {
                val activity = activities.item(index) as? org.w3c.dom.Element ?: continue
                if (activity.getAttributeNS(namespace, "name") == "com.pairip.licensecheck.LicenseActivity") {
                    activity.parentNode.removeChild(activity)
                }
            }
            val permissions = doc.getElementsByTagName("uses-permission")
            for (index in permissions.length - 1 downTo 0) {
                val permission = permissions.item(index) as? org.w3c.dom.Element ?: continue
                if (permission.getAttributeNS(namespace, "name") == "com.android.vending.CHECK_LICENSE") {
                    permission.parentNode.removeChild(permission)
                }
            }
        }
    }
}

private fun smaliString15(value: String): String = buildString {
    append('"')
    value.forEach { char ->
        when (char) {
            '\\' -> append("\\\\")
            '"' -> append("\\\"")
            '\n' -> append("\\n")
            '\r' -> append("\\r")
            '\t' -> append("\\t")
            else -> if (char.code < 0x20) append("\\u%04x".format(char.code)) else append(char)
        }
    }
    append('"')
}

context(context: BytecodePatchContext)
private fun replaceBody15(
    descriptor: String,
    registerCount: Int,
    instructionCount: Int,
    code: String,
    newRegisterCount: Int = registerCount,
    program: String? = null,
    exceptions: Int = 0,
) {
    val cls = descriptor.substringBefore("->")
    val signature = descriptor.substringAfter("->")
    val parameters = Regex("\\[*L[^;]+;|\\[*[ZBCSIJFD]")
        .findAll(signature.substringAfter('(').substringBefore(')')).map { it.value }.toList()
    val method = exact(cls, signature.substringBefore('('), signature.substringAfter(')'), *parameters.toTypedArray()).method
    val implementation = method.implementation ?: error("Missing implementation: $descriptor")
    check(implementation.registerCount == registerCount && method.instructions.size == instructionCount) {
        "Changed startup method layout: $descriptor; expected registers=$registerCount instructions=$instructionCount, actual registers=${implementation.registerCount} instructions=${method.instructions.size}"
    }
    if (program != null) {
        val strings = method.instructions.mapNotNull {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
        }
        check(strings == listOf(program)) { "Changed protected callback program: $descriptor" }
    }
    val assembled = MutableMethod(ImmutableMethod(method.definingClass, method.name,
        method.parameters, method.returnType, method.accessFlags, method.annotations,
        method.hiddenApiRestrictions, ImmutableMethodImplementation(newRegisterCount,
            emptyList(), emptyList(), emptyList()))).apply { addRuntimeCallbackInstructions(code, exceptions) }
    // Inline assembly can retain branch labels owned by its temporary method.
    // Rebind the complete implementation so subsequent bounded edits move the
    // branch destinations and exception handlers with this method's code.
    val replacement = MutableMethod(ImmutableMethod(method.definingClass, method.name,
        method.parameters, method.returnType, method.accessFlags, method.annotations,
        method.hiddenApiRestrictions, ImmutableMethodImplementation.of(assembled.implementation)))
    val mutableClass = context.mutableClassDefBy(method.definingClass)
    check(mutableClass.methods.remove(method))
    check(mutableClass.methods.add(replacement))
}

context(context: BytecodePatchContext)
private fun addClinit15(type: String, registerCount: Int, body: String) {
    val cls = context.mutableClassDefBy(type)
    check(cls.methods.none { it.name == "<clinit>" }) { "Unexpected existing initializer: $type" }
    val method = MutableMethod(ImmutableMethod(type, "<clinit>", emptyList(), "V",
        AccessFlags.STATIC.value or AccessFlags.CONSTRUCTOR.value, null, null,
        ImmutableMethodImplementation(registerCount, emptyList(), emptyList(), emptyList())))
    method.addInstructions(0, body)
    check(cls.methods.add(method)) { "Duplicate initializer: $type" }
}

/**
 * Genuine FlitsmeisterApplication.onCreate reconstruction for 15.0/1289,
 * ported instruction-for-instruction from the recovered 14.17 lifecycle helper
 * body through the verified version 15 rename map. Initialization order and
 * observable effects are preserved: configuration manager registration, main
 * coroutine scope creation, install identifier persistence, Parse/Firebase
 * initialization, locale/country reporting, feature-provider work scheduling,
 * shortcut initialization, Android Auto car-connection observation, account
 * holder wiring, in-background state publication and the default uncaught
 * exception handler.
 *
 * The Crashlytics identifier runnable is h85 in 15.0; m85 now performs a
 * different map-based operation. Preserve the genuine identifier scheduling;
 * Disable tracking separately bypasses it while retaining country reporting's
 * existing guarded SDK boundary. Unlike 14.17, Parse initialization runs before the
 * configuration-manager request: the 15.0 DI provider for [ff4] resolves the
 * current Parse user, which requires Parse to be initialized first.
 */
private val applicationOnCreate15 = """
    move-object/from16 v1, p0
    invoke-static {v1}, Lnl/flitsmeister/FlitsmeisterApplication;->onCreate${'$'}001(Lnl/flitsmeister/Hilt_FlitsmeisterApplication;)V
    :try_start_0
    invoke-static {v1}, Lj4e;->b(Lnl/flitsmeister/FlitsmeisterApplication;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    goto :goto_0
    :catch_0
    move-exception v0
    const-string v3, "Exception occurred while initializing Parse: "
    invoke-static {v3, v0}, Lfze;->a(Ljava/lang/String;Ljava/lang/Exception;)Ljava/lang/String;
    move-result-object v3
    invoke-static {}, Lhha;->c()Lorg/slf4j/Logger;
    move-result-object v4
    invoke-static {v4, v3, v0}, Lhha;->i(Lorg/slf4j/Logger;Ljava/lang/String;Ljava/lang/Throwable;)V
    :goto_0
    sget-object v0, Ly80;->e:Ly80${'$'}a;
    invoke-static {v0, v1}, Lnl/flitsmeister/FlitsmeisterApplication;->getInstance${'$'}002(Lig0;Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lff4;
    invoke-static {v0}, Lnl/flitsmeister/FlitsmeisterApplication;->getClass${'$'}003(Ljava/lang/Object;)Ljava/lang/Class;
    sput-object v0, Llp0;->b:Lff4;
    sget-object v0, Lx2l;->f:Lx2l${'$'}a;
    new-instance v4, Lng8;
    invoke-direct {v4}, Ljava/lang/Object;-><init>()V
    new-instance v3, Log8;
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V
    new-instance v2, Lfb6;
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V
    invoke-static {v0}, Lnl/flitsmeister/FlitsmeisterApplication;->getClass${'$'}004(Ljava/lang/Object;)Ljava/lang/Class;
    sget-object v6, Lx2l;->g:Lwm4;
    new-instance v0, Lu2l;
    const/4 v5, 0x0
    invoke-direct/range {v0 .. v5}, Lu2l;-><init>(Lnl/flitsmeister/FlitsmeisterApplication;Lfb6;Log8;Lng8;Lsn4;)V
    const/4 v2, 0x3
    const/4 v7, 0x0
    invoke-static {v6, v7, v7, v0, v2}, Lbx1;->c(Lq45;Lb45;Lu45;Li49;I)Lyhi;
    new-instance v0, Lur4;
    const/4 v2, 0x0
    invoke-direct {v0, v2}, Lur4;-><init>(I)V
    new-instance v3, Lmg8;
    invoke-direct {v3, v0}, Lmg8;-><init>(Lur4;)V
    sput-object v3, Lv1g;->a:Lmg8;
    sget-object v0, Lt28;->u:Ltuh;
    invoke-static {v0, v1}, Lnl/flitsmeister/FlitsmeisterApplication;->e${'$'}005(Ltuh;Landroid/content/Context;)Ljava/lang/String;
    move-result-object v3
    sput-object v3, Lock;->a:Ljava/lang/String;
    if-eqz v3, :cond_0
    invoke-static {v3}, Lnl/flitsmeister/FlitsmeisterApplication;->length${'$'}006(Ljava/lang/String;)I
    move-result v3
    if-nez v3, :cond_1
    :cond_0
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;
    move-result-object v3
    invoke-static {v3}, Lnl/flitsmeister/FlitsmeisterApplication;->toString${'$'}007(Ljava/util/UUID;)Ljava/lang/String;
    move-result-object v3
    sput-object v3, Lock;->a:Ljava/lang/String;
    invoke-static {v0, v1, v3}, Lnl/flitsmeister/FlitsmeisterApplication;->m${'$'}008(Ltuh;Landroid/content/Context;Ljava/lang/String;)Z
    invoke-static {v3}, Lnl/flitsmeister/FlitsmeisterApplication;->getClass${'$'}009(Ljava/lang/Object;)Ljava/lang/Class;
    :cond_1
    new-instance v0, Lug8;
    invoke-direct {v0, v1, v7}, Lug8;-><init>(Lnl/flitsmeister/FlitsmeisterApplication;Lsn4;)V
    sget-object v3, Ln37;->a:Lre6;
    sget-object v3, Lv96;->a:Lv96;
    invoke-static {v3, v0}, Lhv0;->e(Lb45;Li49;)Lyhi;
    const-string v0, "java.vendor"
    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    const-string v3, ""
    if-eqz v0, :cond_2
    const-string v4, "Robolectric"
    const/4 v5, 0x1
    invoke-static {v0, v4, v5}, Lhmi;->y(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z
    move-result v0
    if-ne v0, v5, :cond_2
    goto :goto_1
    :cond_2
    const-string v0, "org.gradle.test.worker"
    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    if-eqz v0, :cond_3
    goto :goto_1
    :cond_3
    sget-object v0, Lt28;->i:Ltuh;
    invoke-static {v1}, Lnl/flitsmeister/FlitsmeisterApplication;->getApplicationContext${'$'}010(Landroid/content/Context;)Landroid/content/Context;
    move-result-object v4
    invoke-static {v4}, Lnl/flitsmeister/FlitsmeisterApplication;->getClass${'$'}011(Ljava/lang/Object;)Ljava/lang/Class;
    invoke-static {v0}, Lnl/flitsmeister/FlitsmeisterApplication;->getClass${'$'}012(Ljava/lang/Object;)Ljava/lang/Class;
    invoke-static {v0, v4}, Lnl/flitsmeister/FlitsmeisterApplication;->e${'$'}013(Ltuh;Landroid/content/Context;)Ljava/lang/String;
    move-result-object v4
    if-nez v4, :cond_4
    move-object v4, v3
    :cond_4
    invoke-static {v4}, Lnl/flitsmeister/FlitsmeisterApplication;->length${'$'}014(Ljava/lang/String;)I
    move-result v5
    if-nez v5, :cond_5
    invoke-static {}, Lmlc;->a()Ljava/lang/String;
    move-result-object v4
    invoke-static {v1}, Lnl/flitsmeister/FlitsmeisterApplication;->getApplicationContext${'$'}015(Landroid/content/Context;)Landroid/content/Context;
    move-result-object v5
    invoke-static {v5}, Lnl/flitsmeister/FlitsmeisterApplication;->getClass${'$'}016(Ljava/lang/Object;)Ljava/lang/Class;
    invoke-static {v0, v5, v4}, Lnl/flitsmeister/FlitsmeisterApplication;->m${'$'}017(Ltuh;Landroid/content/Context;Ljava/lang/String;)Z
    :cond_5
    invoke-static {}, Lfb8;->a()Lfb8;
    move-result-object v0
    iget-object v0, v0, Lfb8;->a:Lq85;
    iget-object v5, v0, Lq85;->o:Ly95;
    iget-object v5, v5, Ly95;->a:Lu95;
    new-instance v6, Lh85;
    invoke-direct {v6, v0, v4}, Lh85;-><init>(Lq85;Ljava/lang/String;)V
    invoke-static {v5, v6}, Lnl/flitsmeister/FlitsmeisterApplication;->a${'$'}018(Lu95;Ljava/lang/Runnable;)Lcom/google/android/gms/tasks/Task;
    invoke-static {}, Lfb8;->a()Lfb8;
    move-result-object v0
    sget v4, Lm65;->b:I
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v4
    invoke-static {v4}, Lnl/flitsmeister/fmcore/data/enums/UserCountries;->getCountryCode(Ljava/lang/Integer;)Ljava/lang/String;
    move-result-object v4
    const-string v5, "current_country"
    invoke-static {v0, v5, v4}, Lnl/flitsmeister/FlitsmeisterApplication;->d${'$'}019(Lfb8;Ljava/lang/String;Ljava/lang/String;)V
    :goto_1
    sget-object v0, Ln37;->a:Lre6;
    sget-object v6, Laab;->a:Loi9;
    new-instance v0, Lvg8;
    invoke-direct {v0, v1, v6, v7}, Lvg8;-><init>(Lnl/flitsmeister/FlitsmeisterApplication;Lg45;Lsn4;)V
    sget-object v8, Ln37;->a:Lre6;
    invoke-static {v8, v0}, Lhv0;->e(Lb45;Li49;)Lyhi;
    sget-object v0, Lt28;->a:Ltuh;
    invoke-static {v0, v1}, Lnl/flitsmeister/FlitsmeisterApplication;->a${'$'}020(Ltuh;Landroid/content/Context;)Z
    move-result v0
    if-eqz v0, :cond_6
    sget-object v0, Lt1b;->a:Lorg/slf4j/Logger;
    invoke-static {v2}, Lp08;->b(Z)Ljava/lang/String;
    move-result-object v2
    new-instance v4, Ljava/lang/StringBuilder;
    const-string v5, "FCD ID: "
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-static {v4, v2}, Lnl/flitsmeister/FlitsmeisterApplication;->append${'$'}021(Ljava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-static {v4}, Lnl/flitsmeister/FlitsmeisterApplication;->toString${'$'}022(Ljava/lang/StringBuilder;)Ljava/lang/String;
    move-result-object v2
    invoke-static {v0, v2}, Lnl/flitsmeister/FlitsmeisterApplication;->info${'$'}023(Lorg/slf4j/Logger;Ljava/lang/String;)V
    :cond_6
    iget-object v0, v1, Lnl/flitsmeister/FlitsmeisterApplication;->s:Le68;
    const-string v2, "featureProvider"
    if-eqz v0, :cond_b
    sget-object v0, Lsuh;->a0:Ltuh;
    invoke-static {v0, v1}, Lnl/flitsmeister/FlitsmeisterApplication;->a${'$'}024(Ltuh;Landroid/content/Context;)Z
    move-result v0
    if-eqz v0, :cond_7
    const-string v3, "Flitsmeister-Trip-logging"
    :cond_7
    move-object v14, v3
    iget-object v0, v1, Lnl/flitsmeister/FlitsmeisterApplication;->s:Le68;
    if-eqz v0, :cond_a
    const-string v18, "Flitsmeister-Android-Auto-Alerts"
    const-string v19, "dfu"
    const-string v9, "FMCore-Alerts"
    const-string v10, "Flitsmeister-Autostart"
    const-string v11, "FMCore-Base"
    const-string v12, "Flitsmeister-Mapbox-Navigation"
    const-string v13, "Flitsmeister-ONE"
    const-string v15, "Flitsmeister-Parking"
    const-string v16, "FMCore-Alerts"
    const-string v17, "Flitsmeister-Android-Auto-Navigation"
    filled-new-array/range {v9 .. v19}, [Ljava/lang/String;
    move-result-object v0
    invoke-static {v1, v0}, Lezc;->a(Landroid/content/ContextWrapper;[Ljava/lang/String;)V
    const-class v0, Landroid/content/pm/ShortcutManager;
    invoke-static {v1, v0}, Lnl/flitsmeister/FlitsmeisterApplication;->getSystemService${'$'}025(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Object;
    move-result-object v0
    move-object v4, v0
    check-cast v4, Landroid/content/pm/ShortcutManager;
    new-instance v3, Ljava/util/ArrayList;
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V
    new-instance v0, Lnl/flitsmeister/fmcore/data/databases/a;
    invoke-direct {v0, v1}, Lnl/flitsmeister/fmcore/data/databases/a;-><init>(Landroid/content/Context;)V
    move-object v1, v0
    new-instance v0, Lwvh;
    const/4 v5, 0x0
    move-object/from16 v2, p0
    invoke-direct/range {v0 .. v5}, Lwvh;-><init>(Lnl/flitsmeister/fmcore/data/databases/a;Lnl/flitsmeister/FlitsmeisterApplication;Ljava/util/ArrayList;Landroid/content/pm/ShortcutManager;Lsn4;)V
    move-object v1, v2
    invoke-static {v6, v0}, Lhv0;->e(Lb45;Li49;)Lyhi;
    new-instance v0, Landroidx/car/app/connection/CarConnection;
    invoke-direct {v0, v1}, Landroidx/car/app/connection/CarConnection;-><init>(Landroid/content/Context;)V
    invoke-static {v0}, Lnl/flitsmeister/FlitsmeisterApplication;->getType${'$'}026(Landroidx/car/app/connection/CarConnection;)Landroidx/lifecycle/LiveData;
    move-result-object v0
    invoke-static {v0}, Lnl/flitsmeister/FlitsmeisterApplication;->getClass${'$'}027(Ljava/lang/Object;)Ljava/lang/Class;
    new-instance v2, Llg8;
    const/4 v3, 0x0
    invoke-direct {v2, v1, v3}, Llg8;-><init>(Ljava/lang/Object;I)V
    new-instance v3, Lo7b;
    invoke-direct {v3, v2}, Lo7b;-><init>(Lu39;)V
    invoke-static {v0, v3}, Lnl/flitsmeister/FlitsmeisterApplication;->observeForever${'$'}028(Landroidx/lifecycle/LiveData;Landroidx/lifecycle/Observer;)V
    invoke-static {v0}, Lnl/flitsmeister/FlitsmeisterApplication;->getValue${'$'}029(Landroidx/lifecycle/LiveData;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Ljava/lang/Integer;
    if-eqz v0, :cond_9
    invoke-static {v0}, Lnl/flitsmeister/FlitsmeisterApplication;->intValue${'$'}030(Ljava/lang/Number;)I
    move-result v0
    sget v2, Lnl/flitsmeister/FlitsmeisterApplication;->X:I
    if-eq v2, v0, :cond_8
    invoke-static {}, Lnl/flitsmeister/fmcore/models/eventbuses/AndroidAutoEventBus;->getBusAndroidAutoCarConnection()Las7;
    move-result-object v2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v3
    invoke-static {v2, v3}, Lnl/flitsmeister/FlitsmeisterApplication;->a${'$'}031(Las7;Ljava/lang/Object;)V
    :cond_8
    sput v0, Lnl/flitsmeister/FlitsmeisterApplication;->X:I
    :cond_9
    const-class v0, Ll5a;
    invoke-static {v1, v0}, Lyig;->b(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ll5a;
    invoke-static {v2}, Lnl/flitsmeister/FlitsmeisterApplication;->B${'$'}032(Ll5a;)Llob;
    move-result-object v2
    invoke-static {v2}, Lnl/flitsmeister/FlitsmeisterApplication;->e${'$'}033(Llob;)Lcaf;
    move-result-object v2
    invoke-static {v1, v0}, Lyig;->b(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Ll5a;
    invoke-static {v0}, Lnl/flitsmeister/FlitsmeisterApplication;->B${'$'}034(Ll5a;)Llob;
    move-result-object v0
    invoke-static {v0}, Lnl/flitsmeister/FlitsmeisterApplication;->g${'$'}035(Llob;)Lcaf;
    move-result-object v0
    sput-object v2, Lro${'$'}b;->a:Lcaf;
    sput-object v0, Lro${'$'}b;->b:Lcaf;
    new-instance v0, Lwg8;
    invoke-direct {v0, v1, v7}, Lwg8;-><init>(Lnl/flitsmeister/FlitsmeisterApplication;Lsn4;)V
    invoke-static {v8, v0}, Lhv0;->e(Lb45;Li49;)Lyhi;
    invoke-static {}, Lnl/flitsmeister/fmcore/models/eventbuses/InBackgroundBus;->busInBackgroundChanged()Las7;
    move-result-object v0
    sget-boolean v2, Lnl/flitsmeister/FlitsmeisterApplication;->y:Z
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    move-result-object v2
    invoke-static {v0, v2}, Lnl/flitsmeister/FlitsmeisterApplication;->a${'$'}036(Las7;Ljava/lang/Object;)V
    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread${'$'}UncaughtExceptionHandler;
    move-result-object v0
    new-instance v2, Lkg8;
    invoke-direct {v2, v0, v1}, Lkg8;-><init>(Ljava/lang/Thread${'$'}UncaughtExceptionHandler;Lnl/flitsmeister/FlitsmeisterApplication;)V
    invoke-static {v2}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread${'$'}UncaughtExceptionHandler;)V
    return-void
    :cond_a
    invoke-static {v2}, Lq9a;->k(Ljava/lang/String;)V
    throw v7
    :cond_b
    invoke-static {v2}, Lq9a;->k(Ljava/lang/String;)V
    throw v7
"""

/**
 * Genuine LauncherActivity.onResume reconstruction for 15.0/1289, ported
 * from the recovered 14.17 lifecycle helper body through the verified 15.0
 * rename map (all 354 accessor call sites matched by signature). Publishes
 * the splash launch state, cancels the launch notification, stops a running
 * background service, performs the 4411 parking-method check with its
 * notification date persistence, and dispatches every deeplink/notification
 * intent action to its target activity. On-device validated: the app passes
 * the launcher and navigates onward.
 */
private val launcherOnResume15 = """
    move-object/from16 v2, p0
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->onResume${'$'}001(Lnl/flitsmeister/controllers/activities/base/BaseActivity;)V
    invoke-static {}, Lnl/flitsmeister/models/eventbuses/AppLaunchBusKt;->getAppLaunchStateBus()Las7;
    move-result-object v0
    sget-object v1, Lnl/flitsmeister/models/eventbuses/AppLaunchState;->SPLASH_SCREEN:Lnl/flitsmeister/models/eventbuses/AppLaunchState;
    invoke-static {v0, v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}002(Las7;Ljava/lang/Object;)V
    invoke-static {v2}, Landroidx/core/app/NotificationManagerCompat;->from(Landroid/content/Context;)Landroidx/core/app/NotificationManagerCompat;
    move-result-object v0
    const/16 v1, 0x71a2
    invoke-static {v0, v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->cancel${'$'}003(Landroidx/core/app/NotificationManagerCompat;I)V
    sget-boolean v0, Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->C1:Z
    const/4 v6, 0x0
    const/4 v1, 0x2
    invoke-static {v2, v6, v1}, Lnl/flitsmeister/services/base/FlitsmeisterBaseService${'$'}b;->a(Landroid/content/Context;Lev;I)V
    const-class v0, Lnl/flitsmeister/parking/di/CustomerRepositoryEntryPoint;
    invoke-static {v2, v0}, Lyig;->b(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lnl/flitsmeister/parking/di/CustomerRepositoryEntryPoint;
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->customerRepository${'$'}004(Lnl/flitsmeister/parking/di/CustomerRepositoryEntryPoint;)Lnl/flitsmeister/parking/domain/repository/customer/DefaultCustomerRepository;
    move-result-object v0
    const/4 v7, 0x1
    invoke-static {v0, v6, v7, v6}, Lnl/flitsmeister/parking/domain/repository/customer/CustomerRepository;->hasCustomerPaymentMethod${'$'}default(Lnl/flitsmeister/parking/domain/repository/customer/CustomerRepository;Lnl/flitsmeister/parking/domain/model/Customer;ILjava/lang/Object;)Z
    move-result v0
    sget-object v3, Lgb;->j:Lgb${'$'}a;
    invoke-static {v3, v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getInstance${'$'}005(Lig0;Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lgb;
    iget-object v3, v3, Lgb;->b:Lnl/flitsmeister/models/data/account/UserAccountFM;
    const/4 v4, 0x0
    if-eqz v3, :cond_0
    invoke-static {v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getHas4411Account${'$'}006(Lx4k;)Z
    move-result v3
    goto :goto_0
    :cond_0
    move v3, v4
    :goto_0
    const-wide/16 v8, -0x1
    if-nez v0, :cond_1
    if-eqz v3, :cond_1
    sget-object v0, Lt28;->M:Ltuh;
    invoke-static {v0, v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->d${'$'}007(Ltuh;Landroid/content/Context;)J
    move-result-wide v10
    cmp-long v3, v10, v8
    if-nez v3, :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v8
    invoke-static {v0, v2, v8, v9}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->l${'$'}008(Ltuh;Landroid/content/Context;J)V
    sget-object v0, Lt1b;->a:Lorg/slf4j/Logger;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v8
    new-instance v3, Ljava/lang/StringBuilder;
    const-string v5, "Saved date for parking notification: "
    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-static {v3, v8, v9}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->append${'$'}009(Ljava/lang/StringBuilder;J)Ljava/lang/StringBuilder;
    invoke-static {v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->toString${'$'}010(Ljava/lang/StringBuilder;)Ljava/lang/String;
    move-result-object v3
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->info${'$'}011(Lorg/slf4j/Logger;Ljava/lang/String;)V
    goto :goto_1
    :cond_1
    sget-object v0, Lt28;->M:Ltuh;
    invoke-static {v0, v2, v8, v9}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->l${'$'}008(Ltuh;Landroid/content/Context;J)V
    :cond_2
    :goto_1
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v3
    invoke-static {v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getClass${'$'}014(Ljava/lang/Object;)Ljava/lang/Class;
    invoke-static {v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getData${'$'}015(Landroid/content/Intent;)Landroid/net/Uri;
    move-result-object v0
    const-string v8, "source"
    const-string v9, "deeplink"
    if-eqz v0, :cond_b
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getPath${'$'}016(Landroid/net/Uri;)Ljava/lang/String;
    move-result-object v0
    if-eqz v0, :cond_b
    const-string v5, "/"
    invoke-static {v0, v5}, Lhmi;->O(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5
    invoke-static {v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getData${'$'}015(Landroid/content/Intent;)Landroid/net/Uri;
    move-result-object v0
    const-string v10, "utm_campaign"
    if-eqz v0, :cond_4
    invoke-static {v0, v10}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getQueryParameter${'$'}018(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    if-nez v0, :cond_3
    goto :goto_3
    :cond_3
    :goto_2
    move-object v10, v0
    goto :goto_4
    :cond_4
    :goto_3
    invoke-static {v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getExtras${'$'}019(Landroid/content/Intent;)Landroid/os/Bundle;
    move-result-object v0
    if-eqz v0, :cond_5
    invoke-static {v0, v10}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getString${'$'}020(Landroid/os/BaseBundle;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    goto :goto_2
    :cond_5
    move-object v10, v6
    :goto_4
    const-string v0, "[LauncherActivity] Intent received with path: "
    const-string v11, " and utm_campaign:"
    invoke-static {v0, v5, v11, v10}, Lo30;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-static {}, Lhha;->c()Lorg/slf4j/Logger;
    move-result-object v11
    if-eqz v11, :cond_6
    invoke-static {v11, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->info${'$'}011(Lorg/slf4j/Logger;Ljava/lang/String;)V
    :cond_6
    :try_start_0
    invoke-static {}, Lfb8;->a()Lfb8;
    move-result-object v11
    invoke-static {v11, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->b${'$'}022(Lfb8;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0
    goto :goto_5
    :catch_0
    move-exception v0
    const-string v11, "Exception logging to firebase crashlytics"
    invoke-static {v11, v0}, Lhha;->g(Ljava/lang/String;Ljava/lang/Throwable;)V
    :goto_5
    invoke-static {v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getExtras${'$'}019(Landroid/content/Intent;)Landroid/os/Bundle;
    move-result-object v0
    if-eqz v0, :cond_7
    const-string v3, "notification_tag"
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getString${'$'}020(Landroid/os/BaseBundle;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    goto :goto_6
    :cond_7
    move-object v0, v6
    :goto_6
    if-eqz v0, :cond_8
    const-string v3, "notification"
    goto :goto_7
    :cond_8
    move-object v3, v9
    :goto_7
    new-instance v11, Ljava/util/LinkedHashMap;
    invoke-direct {v11}, Ljava/util/LinkedHashMap;-><init>()V
    if-eqz v10, :cond_9
    const-string v12, "campaign"
    invoke-static {v11, v12, v10}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->put${'$'}025(Ljava/util/Map;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :cond_9
    if-eqz v0, :cond_a
    const-string v10, "tag"
    invoke-static {v11, v10, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->put${'$'}025(Ljava/util/Map;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :cond_a
    invoke-static {v11, v9, v5}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->put${'$'}025(Ljava/util/Map;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    invoke-static {v11, v8, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->put${'$'}025(Ljava/util/Map;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    const-string v0, "deeplink_opened"
    invoke-static {v2, v0, v11}, Lho;->a(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;)V
    :cond_b
    const-string v10, "LauncherActivity"
    invoke-static {v10, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v0
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getClass${'$'}014(Ljava/lang/Object;)Ljava/lang/Class;
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getAction${'$'}031(Landroid/content/Intent;)Ljava/lang/String;
    move-result-object v0
    const-string v3, "addHome"
    invoke-static {v0, v3}, Lq9a;->e(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v3
    sget-object v11, Lon7;->a:Lon7;
    const-string v12, "extra_navigate_to"
    const-class v13, Lnl/flitsmeister/features/onboarding/composables/OnboardingActivity;
    const-class v14, Lnl/flitsmeister/controllers/activities/settings/SettingsActivity;
    const-class v5, Lnl/flitsmeister/fmx/activities/main/MainActivity;
    sget-object v15, Lhha;->a:Lhha;
    if-nez v3, :cond_c
    const-string v3, "addWork"
    invoke-static {v0, v3}, Lq9a;->e(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :cond_d
    :cond_c
    move-object v7, v5
    goto/16 :goto_e
    :cond_d
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v0
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getClass${'$'}014(Ljava/lang/Object;)Ljava/lang/Class;
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getAction${'$'}031(Landroid/content/Intent;)Ljava/lang/String;
    move-result-object v0
    const-string v3, "startRoute"
    invoke-static {v0, v3}, Lq9a;->e(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :cond_15
    const-string v0, "Intent action is \'start route to\'"
    invoke-static {v15, v10, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}035(Ltu6;Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v0
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getClass${'$'}014(Ljava/lang/Object;)Ljava/lang/Class;
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getExtras${'$'}019(Landroid/content/Intent;)Landroid/os/Bundle;
    move-result-object v0
    if-eqz v0, :cond_e
    const-string v3, "destination"
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getString${'$'}020(Landroid/os/BaseBundle;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    goto :goto_8
    :cond_e
    move-object v0, v6
    :goto_8
    if-eqz v0, :cond_11
    const-string v3, "home"
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->equals${'$'}040(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :cond_f
    sget-object v0, Lnl/flitsmeister/fmcore/data/enums/DestinationGroup;->HOME:Lnl/flitsmeister/fmcore/data/enums/DestinationGroup;
    goto :goto_9
    :cond_f
    const-string v3, "work"
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->equals${'$'}040(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :cond_10
    sget-object v0, Lnl/flitsmeister/fmcore/data/enums/DestinationGroup;->WORK:Lnl/flitsmeister/fmcore/data/enums/DestinationGroup;
    goto :goto_9
    :cond_10
    move-object v0, v6
    :goto_9
    if-eqz v0, :cond_12
    new-instance v3, Lnl/flitsmeister/fmcore/data/databases/a;
    invoke-direct {v3, v2}, Lnl/flitsmeister/fmcore/data/databases/a;-><init>(Landroid/content/Context;)V
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getDatabaseEnum${'$'}042(Lnl/flitsmeister/fmcore/data/enums/DestinationGroup;)I
    move-result v4
    new-instance v7, Ldja;
    invoke-direct {v7, v2, v1}, Ldja;-><init>(Ljava/lang/Object;I)V
    new-instance v1, Lc76;
    invoke-direct {v1, v7, v3, v4, v6}, Lc76;-><init>(Ldja;Lnl/flitsmeister/fmcore/data/databases/a;ILsn4;)V
    sget-object v3, Ln37;->a:Lre6;
    sget-object v3, Lv96;->a:Lv96;
    invoke-static {v3, v1}, Lhv0;->e(Lb45;Li49;)Lyhi;
    goto :goto_a
    :cond_11
    move-object v0, v6
    :cond_12
    :goto_a
    new-instance v1, Landroid/content/Intent;
    invoke-direct {v1, v2, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    if-nez v0, :cond_13
    const-string v0, "searchRoute"
    invoke-static {v1, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->setAction${'$'}043(Landroid/content/Intent;Ljava/lang/String;)Landroid/content/Intent;
    :cond_13
    invoke-static {v2, v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    :cond_14
    :goto_b
    move-object v7, v5
    goto/16 :goto_f
    :cond_15
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v0
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getExtras${'$'}019(Landroid/content/Intent;)Landroid/os/Bundle;
    move-result-object v0
    if-eqz v0, :cond_16
    const-string v1, "START_AUTOSTART"
    invoke-static {v0, v1, v4}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getBoolean${'$'}047(Landroid/os/BaseBundle;Ljava/lang/String;Z)Z
    move-result v0
    const/4 v1, 0x1
    if-ne v0, v1, :cond_16
    const-string v0, "Boolean intent extra START_AUTOSTART is true"
    invoke-static {v15, v10, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}035(Ltu6;Ljava/lang/String;Ljava/lang/String;)V
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v2, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    const/high16 v3, 0x10000000
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->addFlags${'$'}066(Landroid/content/Intent;I)Landroid/content/Intent;
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v2, v14}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    const-string v3, "auto_start_key"
    invoke-static {v0, v3, v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->putExtra${'$'}051(Landroid/content/Intent;Ljava/lang/String;Z)Landroid/content/Intent;
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    goto :goto_b
    :cond_16
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v0
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getAction${'$'}031(Landroid/content/Intent;)Ljava/lang/String;
    move-result-object v0
    const-string v1, "viewAddTripDetail"
    invoke-static {v0, v1}, Lq9a;->e(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :cond_17
    const-string v0, "Intent action is \'add trip detail\'"
    invoke-static {v15, v10, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}035(Ltu6;Ljava/lang/String;Ljava/lang/String;)V
    const-string v0, "trip_logging_notification_tapped"
    invoke-static {v2, v0, v11}, Lho;->a(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;)V
    new-instance v0, Landroid/content/Intent;
    const-class v1, Lnl/flitsmeister/features/triplogging/main/AddTripDetailsActivity;
    invoke-direct {v0, v2, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    goto :goto_b
    :cond_17
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v0
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getAction${'$'}031(Landroid/content/Intent;)Ljava/lang/String;
    move-result-object v0
    const-string v1, "viewLoginUser"
    invoke-static {v0, v1}, Lq9a;->e(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :cond_18
    const-string v0, "Intent action is \'login user\'"
    invoke-static {v15, v10, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}035(Ltu6;Ljava/lang/String;Ljava/lang/String;)V
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v2, v13}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    const-string v1, "navigate_to_login"
    invoke-static {v0, v12, v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->putExtra${'$'}060(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    goto :goto_b
    :cond_18
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v0
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getAction${'$'}031(Landroid/content/Intent;)Ljava/lang/String;
    move-result-object v0
    const-string v1, "viewAchievements"
    invoke-static {v0, v1}, Lq9a;->e(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :cond_19
    const-string v0, "Intent action is \'achievement\'"
    invoke-static {v15, v10, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}035(Ltu6;Ljava/lang/String;Ljava/lang/String;)V
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v2, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    new-instance v0, Landroid/content/Intent;
    const-class v1, Lnl/flitsmeister/controllers/activities/achievements/AchievementsActivity;
    invoke-direct {v0, v2, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    const/high16 v3, 0x10000000
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->addFlags${'$'}066(Landroid/content/Intent;I)Landroid/content/Intent;
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    const-string v0, "open_achievement_notification"
    invoke-static {v2, v0, v11}, Lho;->a(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;)V
    goto/16 :goto_b
    :cond_19
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v0
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getAction${'$'}031(Landroid/content/Intent;)Ljava/lang/String;
    move-result-object v0
    const-string v1, "installApp"
    invoke-static {v0, v1}, Lq9a;->e(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :cond_1a
    const-string v0, "Intent action is \'install app\'"
    invoke-static {v15, v10, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}035(Ltu6;Ljava/lang/String;Ljava/lang/String;)V
    sget-object v0, Ls08;->b:Ls08${'$'}a;
    invoke-static {v0, v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getInstance${'$'}005(Lig0;Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Ls08;
    iget-object v0, v0, Ls08;->a:Lee0;
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}072(Lee0;)Lcom/google/android/gms/tasks/Task;
    goto/16 :goto_b
    :cond_1a
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v0
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getClass${'$'}014(Ljava/lang/Object;)Ljava/lang/Class;
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getData${'$'}015(Landroid/content/Intent;)Landroid/net/Uri;
    move-result-object v1
    if-eqz v1, :cond_1b
    invoke-static {v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getPath${'$'}016(Landroid/net/Uri;)Ljava/lang/String;
    move-result-object v1
    goto :goto_c
    :cond_1b
    move-object v1, v6
    :goto_c
    const-string v3, "/start-route-to-coordinate"
    invoke-static {v1, v3}, Lq9a;->e(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :cond_1d
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getAction${'$'}031(Landroid/content/Intent;)Ljava/lang/String;
    move-result-object v1
    const-string v3, "geo"
    invoke-static {v1, v3}, Lq9a;->e(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :cond_1d
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getAction${'$'}031(Landroid/content/Intent;)Ljava/lang/String;
    move-result-object v0
    const-string v1, "google.navigation"
    invoke-static {v0, v1}, Lq9a;->e(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :cond_1c
    goto :goto_d
    :cond_1c
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v0
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getAction${'$'}031(Landroid/content/Intent;)Ljava/lang/String;
    move-result-object v0
    const-string v1, "traffic_cams_dialog"
    invoke-static {v0, v1}, Lq9a;->e(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :cond_14
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v2, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    const/high16 v3, 0x10000000
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->addFlags${'$'}066(Landroid/content/Intent;I)Landroid/content/Intent;
    invoke-static {v0, v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->setAction${'$'}043(Landroid/content/Intent;Ljava/lang/String;)Landroid/content/Intent;
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    goto/16 :goto_b
    :cond_1d
    :goto_d
    const-string v0, "Scheme of intent is navigation"
    invoke-static {v15, v10, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}035(Ltu6;Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v0
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getClass${'$'}014(Ljava/lang/Object;)Ljava/lang/Class;
    invoke-static {v0}, Ldt4;->b(Landroid/content/Intent;)Ljava/lang/String;
    move-result-object v3
    invoke-static {v0}, Ldt4;->d(Landroid/content/Intent;)Z
    move-result v1
    if-eqz v1, :cond_1f
    new-instance v1, Lnl/flitsmeister/fmcore/models/data/destinations/Destination;
    invoke-direct {v1}, Lnl/flitsmeister/fmcore/models/data/destinations/Destination;-><init>()V
    invoke-static {v0}, Ldt4;->a(Landroid/content/Intent;)[Ljava/lang/String;
    move-result-object v0
    invoke-static {v0}, Ldt4;->c([Ljava/lang/String;)Landroid/location/Location;
    move-result-object v0
    if-eqz v0, :cond_1e
    move-object v2, v0
    new-instance v0, Lija;
    move-object v4, v5
    const/4 v5, 0x0
    move-object v7, v4
    move-object/from16 v4, p0
    invoke-direct/range {v0 .. v5}, Lija;-><init>(Lnl/flitsmeister/fmcore/models/data/destinations/Destination;Landroid/location/Location;Ljava/lang/String;Lnl/flitsmeister/launcher/presentation/LauncherActivity;Lsn4;)V
    move-object v2, v4
    sget-object v1, Ln37;->a:Lre6;
    invoke-static {v1, v0}, Lhv0;->e(Lb45;Li49;)Lyhi;
    goto :goto_f
    :cond_1e
    move-object v7, v5
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v2, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    const/high16 v3, 0x10000000
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->addFlags${'$'}066(Landroid/content/Intent;I)Landroid/content/Intent;
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    sget-object v0, Ll1k;->a:Ll1k;
    goto :goto_f
    :cond_1f
    move-object v7, v5
    new-instance v0, Ljja;
    invoke-direct {v0, v2, v3, v6}, Ljja;-><init>(Lnl/flitsmeister/launcher/presentation/LauncherActivity;Ljava/lang/String;Lsn4;)V
    sget-object v1, Ln37;->a:Lre6;
    sget-object v1, Laab;->a:Loi9;
    invoke-static {v1, v0}, Lhv0;->e(Lb45;Li49;)Lyhi;
    goto :goto_f
    :goto_e
    const-string v0, "Intent action is \'add destination item\'"
    invoke-static {v15, v10, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}035(Ltu6;Ljava/lang/String;Ljava/lang/String;)V
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v2, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v1
    invoke-static {v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getAction${'$'}031(Landroid/content/Intent;)Ljava/lang/String;
    move-result-object v1
    invoke-static {v0, v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->setAction${'$'}043(Landroid/content/Intent;Ljava/lang/String;)Landroid/content/Intent;
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    :goto_f
    iget-object v0, v2, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->q1:Ld06;
    const-string v1, "deepLinkProvider"
    if-eqz v0, :cond_4f
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}094(Ld06;)Ljava/lang/String;
    move-result-object v0
    iget-object v3, v2, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->q1:Ld06;
    if-eqz v3, :cond_4e
    invoke-static {v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->b${'$'}095(Ld06;)Ljava/util/List;
    move-result-object v1
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v3
    invoke-static {v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getClass${'$'}014(Ljava/lang/Object;)Ljava/lang/Class;
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getClass${'$'}014(Ljava/lang/Object;)Ljava/lang/Class;
    sget-object v4, Lxz5;->K1:Lsq7;
    invoke-static {v4}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->iterator${'$'}099(Ljava/lang/Iterable;)Ljava/util/Iterator;
    move-result-object v4
    :goto_10
    invoke-static {v4}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->hasNext${'$'}100(Ljava/util/Iterator;)Z
    move-result v5
    if-eqz v5, :cond_21
    invoke-static {v4}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->next${'$'}101(Ljava/util/Iterator;)Ljava/lang/Object;
    move-result-object v5
    move-object/from16 v16, v6
    move-object v6, v5
    check-cast v6, Lxz5;
    invoke-static {v3, v6, v0}, Ly2e;->a(Landroid/content/Intent;Lxz5;Ljava/lang/String;)Z
    move-result v6
    if-eqz v6, :cond_20
    goto :goto_11
    :cond_20
    move-object/from16 v6, v16
    goto :goto_10
    :cond_21
    move-object/from16 v16, v6
    move-object/from16 v5, v16
    :goto_11
    check-cast v5, Lxz5;
    invoke-static {v1, v5}, Ls33;->F(Ljava/lang/Iterable;Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :cond_22
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->v${'$'}102(Lnl/flitsmeister/launcher/presentation/LauncherActivity;)V
    goto/16 :goto_19
    :cond_22
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v1
    invoke-static {v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getClass${'$'}014(Ljava/lang/Object;)Ljava/lang/Class;
    sget-object v3, Lxz5;->X:Lxz5;
    invoke-static {v1, v3, v0}, Ly2e;->a(Landroid/content/Intent;Lxz5;Ljava/lang/String;)Z
    move-result v1
    const-string v4, "android.intent.action.VIEW"
    const-string v5, "Intent deeplink contains "
    if-eqz v1, :cond_26
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->append${'$'}105(Ljava/lang/StringBuilder;Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->toString${'$'}010(Ljava/lang/StringBuilder;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v15, v10, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}035(Ltu6;Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v0
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getData${'$'}015(Landroid/content/Intent;)Landroid/net/Uri;
    move-result-object v0
    if-eqz v0, :cond_23
    const-string v1, "code"
    invoke-static {v0, v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getQueryParameter${'$'}018(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    move-object v3, v0
    goto :goto_12
    :cond_23
    move-object/from16 v3, v16
    :goto_12
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v0
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getData${'$'}015(Landroid/content/Intent;)Landroid/net/Uri;
    move-result-object v0
    if-eqz v0, :cond_24
    const-string v1, "lang"
    invoke-static {v0, v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getQueryParameter${'$'}018(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    goto :goto_13
    :cond_24
    move-object/from16 v6, v16
    :goto_13
    sget-object v0, Lgb;->j:Lgb${'$'}a;
    invoke-static {v0, v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getInstance${'$'}005(Lig0;Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lgb;
    iget-object v0, v0, Lgb;->b:Lnl/flitsmeister/models/data/account/UserAccountFM;
    const v1, 0x7f1402d0
    invoke-static {v2, v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getString${'$'}115(Landroid/content/Context;I)Ljava/lang/String;
    move-result-object v1
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
    move-result-object v1
    if-eqz v0, :cond_25
    if-eqz v3, :cond_25
    new-instance v0, Lgja;
    const/4 v5, 0x0
    move-object v4, v6
    invoke-direct/range {v0 .. v5}, Lgja;-><init>(Landroid/net/Uri;Lnl/flitsmeister/launcher/presentation/LauncherActivity;Ljava/lang/String;Ljava/lang/String;Lsn4;)V
    sget-object v1, Ln37;->a:Lre6;
    sget-object v1, Lv96;->a:Lv96;
    invoke-static {v1, v0}, Lhv0;->e(Lb45;Li49;)Lyhi;
    goto/16 :goto_18
    :cond_25
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->setData${'$'}116(Landroid/content/Intent;Landroid/net/Uri;)Landroid/content/Intent;
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->finish${'$'}118(Landroid/app/Activity;)V
    sget-object v0, Ll1k;->a:Ll1k;
    goto/16 :goto_18
    :cond_26
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v1
    invoke-static {v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getClass${'$'}014(Ljava/lang/Object;)Ljava/lang/Class;
    sget-object v3, Lxz5;->s1:Lxz5;
    invoke-static {v1, v3, v0}, Ly2e;->a(Landroid/content/Intent;Lxz5;Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :cond_28
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->append${'$'}105(Ljava/lang/StringBuilder;Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->toString${'$'}010(Ljava/lang/StringBuilder;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v15, v10, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}035(Ltu6;Ljava/lang/String;Ljava/lang/String;)V
    sget-object v0, Lgb;->j:Lgb${'$'}a;
    invoke-static {v0, v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getInstance${'$'}005(Lig0;Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lgb;
    iget-object v0, v0, Lgb;->b:Lnl/flitsmeister/models/data/account/UserAccountFM;
    if-eqz v0, :cond_27
    new-instance v0, Landroid/content/Intent;
    const-class v1, Lnl/flitsmeister/menu/presentation/deprecated/MenuActivity;
    invoke-direct {v0, v2, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    const-string v1, "extraDeeplinkProfile"
    const/4 v3, 0x1
    invoke-static {v0, v1, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->putExtra${'$'}051(Landroid/content/Intent;Ljava/lang/String;Z)Landroid/content/Intent;
    new-instance v1, Landroid/content/Intent;
    invoke-direct {v1, v2, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-static {v2, v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    goto :goto_14
    :cond_27
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v2, v13}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    const-string v1, "navigate_to_register"
    invoke-static {v0, v12, v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->putExtra${'$'}060(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    new-instance v1, Landroid/content/Intent;
    invoke-direct {v1, v2, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-static {v2, v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    :goto_14
    sget-object v0, Ll1k;->a:Ll1k;
    goto/16 :goto_18
    :cond_28
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v1
    invoke-static {v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getClass${'$'}014(Ljava/lang/Object;)Ljava/lang/Class;
    sget-object v3, Lxz5;->x:Lxz5;
    invoke-static {v1, v3, v0}, Ly2e;->a(Landroid/content/Intent;Lxz5;Ljava/lang/String;)Z
    move-result v1
    const-string v6, "state"
    if-eqz v1, :cond_2b
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->append${'$'}105(Ljava/lang/StringBuilder;Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->toString${'$'}010(Ljava/lang/StringBuilder;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v15, v10, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}035(Ltu6;Ljava/lang/String;Ljava/lang/String;)V
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v2, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    const-string v1, "extra_open_app_login_bottom_sheet"
    const/4 v3, 0x1
    invoke-static {v0, v1, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->putExtra${'$'}051(Landroid/content/Intent;Ljava/lang/String;Z)Landroid/content/Intent;
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v1
    invoke-static {v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getData${'$'}015(Landroid/content/Intent;)Landroid/net/Uri;
    move-result-object v1
    if-eqz v1, :cond_29
    invoke-static {v1, v6}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getQueryParameter${'$'}018(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    goto :goto_15
    :cond_29
    move-object/from16 v1, v16
    :goto_15
    const-string v3, "extra_delegate_app_login_state"
    invoke-static {v0, v3, v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->putExtra${'$'}060(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v1
    invoke-static {v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getData${'$'}015(Landroid/content/Intent;)Landroid/net/Uri;
    move-result-object v1
    if-eqz v1, :cond_2a
    const-string v3, "display_name"
    invoke-static {v1, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getQueryParameter${'$'}018(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    goto :goto_16
    :cond_2a
    move-object/from16 v6, v16
    :goto_16
    const-string v1, "extra_delegate_app_login_display_name"
    invoke-static {v0, v1, v6}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->putExtra${'$'}060(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    sget-object v0, Ll1k;->a:Ll1k;
    goto/16 :goto_18
    :cond_2b
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v1
    invoke-static {v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getClass${'$'}014(Ljava/lang/Object;)Ljava/lang/Class;
    sget-object v3, Lxz5;->y:Lxz5;
    invoke-static {v1, v3, v0}, Ly2e;->a(Landroid/content/Intent;Lxz5;Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :cond_2c
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->append${'$'}105(Ljava/lang/StringBuilder;Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->toString${'$'}010(Ljava/lang/StringBuilder;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v15, v10, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}035(Ltu6;Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v2}, Lan4;->f(Landroid/content/Context;)V
    sget-object v0, Ll1k;->a:Ll1k;
    goto/16 :goto_18
    :cond_2c
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v1
    invoke-static {v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getClass${'$'}014(Ljava/lang/Object;)Ljava/lang/Class;
    sget-object v3, Lxz5;->I:Lxz5;
    invoke-static {v1, v3, v0}, Ly2e;->a(Landroid/content/Intent;Lxz5;Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :cond_2d
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->append${'$'}105(Ljava/lang/StringBuilder;Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->toString${'$'}010(Ljava/lang/StringBuilder;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v15, v10, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}035(Ltu6;Ljava/lang/String;Ljava/lang/String;)V
    sget-object v0, Lnl/flitsmeister/models/data/purchase/Product;->FLITSMEISTER_PRO_SUBSCRIPTION:Lnl/flitsmeister/models/data/purchase/Product;
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getProductId${'$'}156(Lnl/flitsmeister/models/data/purchase/Product;)Ljava/lang/String;
    move-result-object v0
    const-string v1, "nl.flitsmeister"
    filled-new-array {v0, v1}, [Ljava/lang/Object;
    move-result-object v0
    const v1, 0x7f140b8c
    invoke-static {v2, v1, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getString${'$'}157(Landroid/content/Context;I[Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getClass${'$'}014(Ljava/lang/Object;)Ljava/lang/Class;
    new-instance v1, Landroid/content/Intent;
    invoke-direct {v1, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
    move-result-object v0
    invoke-static {v1, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->setData${'$'}116(Landroid/content/Intent;Landroid/net/Uri;)Landroid/content/Intent;
    const/high16 v3, 0x10000000
    invoke-static {v1, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->addFlags${'$'}066(Landroid/content/Intent;I)Landroid/content/Intent;
    invoke-static {v2, v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    sget-object v0, Ll1k;->a:Ll1k;
    goto/16 :goto_18
    :cond_2d
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v1
    invoke-static {v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getClass${'$'}014(Ljava/lang/Object;)Ljava/lang/Class;
    sget-object v3, Lxz5;->Z:Lxz5;
    invoke-static {v1, v3, v0}, Ly2e;->a(Landroid/content/Intent;Lxz5;Ljava/lang/String;)Z
    move-result v1
    const-class v4, Lnl/flitsmeister/features/common4411/tolling/TollingActivity;
    if-eqz v1, :cond_2e
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->append${'$'}105(Ljava/lang/StringBuilder;Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->toString${'$'}010(Ljava/lang/StringBuilder;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v15, v10, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}035(Ltu6;Ljava/lang/String;Ljava/lang/String;)V
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v2, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v2, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    sget-object v0, Ll1k;->a:Ll1k;
    goto/16 :goto_18
    :cond_2e
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v1
    invoke-static {v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getClass${'$'}014(Ljava/lang/Object;)Ljava/lang/Class;
    sget-object v3, Lxz5;->o1:Lxz5;
    invoke-static {v1, v3, v0}, Ly2e;->a(Landroid/content/Intent;Lxz5;Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :cond_2f
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->append${'$'}105(Ljava/lang/StringBuilder;Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->toString${'$'}010(Ljava/lang/StringBuilder;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v15, v10, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}035(Ltu6;Ljava/lang/String;Ljava/lang/String;)V
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v2, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    const-string v1, "extraDeeplinkHistory"
    const/4 v3, 0x1
    invoke-static {v0, v1, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->putExtra${'$'}051(Landroid/content/Intent;Ljava/lang/String;Z)Landroid/content/Intent;
    new-instance v1, Landroid/content/Intent;
    invoke-direct {v1, v2, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-static {v2, v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    sget-object v0, Ll1k;->a:Ll1k;
    goto/16 :goto_18
    :cond_2f
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v1
    invoke-static {v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getClass${'$'}014(Ljava/lang/Object;)Ljava/lang/Class;
    sget-object v3, Lxz5;->p1:Lxz5;
    invoke-static {v1, v3, v0}, Ly2e;->a(Landroid/content/Intent;Lxz5;Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :cond_30
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->append${'$'}105(Ljava/lang/StringBuilder;Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->toString${'$'}010(Ljava/lang/StringBuilder;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v15, v10, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}035(Ltu6;Ljava/lang/String;Ljava/lang/String;)V
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v2, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    const-string v1, "extraDeeplinkPayment"
    const/4 v3, 0x1
    invoke-static {v0, v1, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->putExtra${'$'}051(Landroid/content/Intent;Ljava/lang/String;Z)Landroid/content/Intent;
    new-instance v1, Landroid/content/Intent;
    invoke-direct {v1, v2, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-static {v2, v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    sget-object v0, Ll1k;->a:Ll1k;
    goto/16 :goto_18
    :cond_30
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v1
    invoke-static {v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getClass${'$'}014(Ljava/lang/Object;)Ljava/lang/Class;
    sget-object v3, Lxz5;->s:Lxz5;
    invoke-static {v1, v3, v0}, Ly2e;->a(Landroid/content/Intent;Lxz5;Ljava/lang/String;)Z
    move-result v1
    const-string v12, ""
    if-eqz v1, :cond_31
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->append${'$'}105(Ljava/lang/StringBuilder;Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->toString${'$'}010(Ljava/lang/StringBuilder;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v15, v10, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}035(Ltu6;Ljava/lang/String;Ljava/lang/String;)V
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v2, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    invoke-static {v2, v12}, Lnsj;->a(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    move-result-object v0
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    sget-object v0, Ll1k;->a:Ll1k;
    goto/16 :goto_18
    :cond_31
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v1
    invoke-static {v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getClass${'$'}014(Ljava/lang/Object;)Ljava/lang/Class;
    sget-object v3, Lxz5;->C1:Lxz5;
    invoke-static {v1, v3, v0}, Ly2e;->a(Landroid/content/Intent;Lxz5;Ljava/lang/String;)Z
    move-result v1
    const-string v13, "extraTwikeyPaymentAddedOnboarding"
    if-eqz v1, :cond_32
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->append${'$'}105(Ljava/lang/StringBuilder;Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->toString${'$'}010(Ljava/lang/StringBuilder;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v15, v10, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}035(Ltu6;Ljava/lang/String;Ljava/lang/String;)V
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v2, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    sget-object v1, Lt28;->D0:Ltuh;
    invoke-static {v1, v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->e${'$'}197(Ltuh;Landroid/content/Context;)Ljava/lang/String;
    move-result-object v3
    invoke-static {v0, v13, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->putExtra${'$'}060(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    const/high16 v3, 0x10000000
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->addFlags${'$'}066(Landroid/content/Intent;I)Landroid/content/Intent;
    invoke-static {v1, v2, v12}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->m${'$'}200(Ltuh;Landroid/content/Context;Ljava/lang/String;)Z
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    sget-object v0, Ll1k;->a:Ll1k;
    goto/16 :goto_18
    :cond_32
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v1
    invoke-static {v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getClass${'$'}014(Ljava/lang/Object;)Ljava/lang/Class;
    sget-object v3, Lxz5;->B1:Lxz5;
    invoke-static {v1, v3, v0}, Ly2e;->a(Landroid/content/Intent;Lxz5;Ljava/lang/String;)Z
    move-result v1
    move/from16 v17, v1
    const-string v1, "extraTwikeyPaymentAdded"
    if-eqz v17, :cond_33
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->append${'$'}105(Ljava/lang/StringBuilder;Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->toString${'$'}010(Ljava/lang/StringBuilder;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v15, v10, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}035(Ltu6;Ljava/lang/String;Ljava/lang/String;)V
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v2, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    sget-object v3, Lt28;->D0:Ltuh;
    invoke-static {v3, v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->e${'$'}197(Ltuh;Landroid/content/Context;)Ljava/lang/String;
    move-result-object v4
    invoke-static {v0, v1, v4}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->putExtra${'$'}060(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    invoke-static {v3, v2, v12}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->m${'$'}200(Ltuh;Landroid/content/Context;Ljava/lang/String;)Z
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    sget-object v0, Ll1k;->a:Ll1k;
    goto/16 :goto_18
    :cond_33
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v3
    invoke-static {v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getClass${'$'}014(Ljava/lang/Object;)Ljava/lang/Class;
    move-object/from16 v17, v14
    sget-object v14, Lxz5;->D1:Lxz5;
    invoke-static {v3, v14, v0}, Ly2e;->a(Landroid/content/Intent;Lxz5;Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :cond_34
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-static {v0, v14}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->append${'$'}105(Ljava/lang/StringBuilder;Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->toString${'$'}010(Ljava/lang/StringBuilder;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v15, v10, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}035(Ltu6;Ljava/lang/String;Ljava/lang/String;)V
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v2, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    sget-object v3, Lt28;->D0:Ltuh;
    invoke-static {v3, v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->e${'$'}197(Ltuh;Landroid/content/Context;)Ljava/lang/String;
    move-result-object v4
    invoke-static {v0, v1, v4}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->putExtra${'$'}060(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    const/high16 v1, 0x10000000
    invoke-static {v0, v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->addFlags${'$'}066(Landroid/content/Intent;I)Landroid/content/Intent;
    invoke-static {v3, v2, v12}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->m${'$'}200(Ltuh;Landroid/content/Context;Ljava/lang/String;)Z
    new-instance v1, Landroid/content/Intent;
    invoke-direct {v1, v2, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-static {v2, v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    sget-object v0, Ll1k;->a:Ll1k;
    goto/16 :goto_18
    :cond_34
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v1
    invoke-static {v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getClass${'$'}014(Ljava/lang/Object;)Ljava/lang/Class;
    sget-object v3, Lxz5;->E1:Lxz5;
    invoke-static {v1, v3, v0}, Ly2e;->a(Landroid/content/Intent;Lxz5;Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :cond_35
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->append${'$'}105(Ljava/lang/StringBuilder;Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->toString${'$'}010(Ljava/lang/StringBuilder;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v15, v10, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}035(Ltu6;Ljava/lang/String;Ljava/lang/String;)V
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v2, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    sget-object v1, Lt28;->D0:Ltuh;
    invoke-static {v1, v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->e${'$'}197(Ltuh;Landroid/content/Context;)Ljava/lang/String;
    move-result-object v3
    invoke-static {v0, v13, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->putExtra${'$'}060(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    const/high16 v3, 0x10000000
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->addFlags${'$'}066(Landroid/content/Intent;I)Landroid/content/Intent;
    invoke-static {v1, v2, v12}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->m${'$'}200(Ltuh;Landroid/content/Context;Ljava/lang/String;)Z
    new-instance v1, Landroid/content/Intent;
    invoke-direct {v1, v2, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-static {v2, v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    sget-object v0, Ll1k;->a:Ll1k;
    goto/16 :goto_18
    :cond_35
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v1
    invoke-static {v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getClass${'$'}014(Ljava/lang/Object;)Ljava/lang/Class;
    sget-object v3, Lxz5;->G1:Lxz5;
    invoke-static {v1, v3, v0}, Ly2e;->a(Landroid/content/Intent;Lxz5;Ljava/lang/String;)Z
    move-result v1
    const-string v12, "extraCreditCardPaymentAddedOnboarding"
    if-eqz v1, :cond_36
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->append${'$'}105(Ljava/lang/StringBuilder;Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->toString${'$'}010(Ljava/lang/StringBuilder;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v15, v10, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}035(Ltu6;Ljava/lang/String;Ljava/lang/String;)V
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v2, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    const/4 v3, 0x1
    invoke-static {v0, v12, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->putExtra${'$'}051(Landroid/content/Intent;Ljava/lang/String;Z)Landroid/content/Intent;
    const/high16 v3, 0x10000000
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->addFlags${'$'}066(Landroid/content/Intent;I)Landroid/content/Intent;
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    sget-object v0, Ll1k;->a:Ll1k;
    goto/16 :goto_18
    :cond_36
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v1
    invoke-static {v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getClass${'$'}014(Ljava/lang/Object;)Ljava/lang/Class;
    sget-object v3, Lxz5;->F1:Lxz5;
    invoke-static {v1, v3, v0}, Ly2e;->a(Landroid/content/Intent;Lxz5;Ljava/lang/String;)Z
    move-result v1
    const-string v13, "extraCreditCardPaymentAdded"
    if-eqz v1, :cond_37
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->append${'$'}105(Ljava/lang/StringBuilder;Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->toString${'$'}010(Ljava/lang/StringBuilder;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v15, v10, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}035(Ltu6;Ljava/lang/String;Ljava/lang/String;)V
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v2, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    const/4 v3, 0x1
    invoke-static {v0, v13, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->putExtra${'$'}051(Landroid/content/Intent;Ljava/lang/String;Z)Landroid/content/Intent;
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    sget-object v0, Ll1k;->a:Ll1k;
    goto/16 :goto_18
    :cond_37
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v1
    invoke-static {v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getClass${'$'}014(Ljava/lang/Object;)Ljava/lang/Class;
    sget-object v3, Lxz5;->H1:Lxz5;
    invoke-static {v1, v3, v0}, Ly2e;->a(Landroid/content/Intent;Lxz5;Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :cond_38
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->append${'$'}105(Ljava/lang/StringBuilder;Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->toString${'$'}010(Ljava/lang/StringBuilder;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v15, v10, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}035(Ltu6;Ljava/lang/String;Ljava/lang/String;)V
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v2, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    const/4 v3, 0x1
    invoke-static {v0, v13, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->putExtra${'$'}051(Landroid/content/Intent;Ljava/lang/String;Z)Landroid/content/Intent;
    const/high16 v3, 0x10000000
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->addFlags${'$'}066(Landroid/content/Intent;I)Landroid/content/Intent;
    new-instance v1, Landroid/content/Intent;
    invoke-direct {v1, v2, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-static {v2, v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    sget-object v0, Ll1k;->a:Ll1k;
    goto/16 :goto_18
    :cond_38
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v1
    invoke-static {v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getClass${'$'}014(Ljava/lang/Object;)Ljava/lang/Class;
    sget-object v3, Lxz5;->I1:Lxz5;
    invoke-static {v1, v3, v0}, Ly2e;->a(Landroid/content/Intent;Lxz5;Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :cond_39
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->append${'$'}105(Ljava/lang/StringBuilder;Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->toString${'$'}010(Ljava/lang/StringBuilder;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v15, v10, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}035(Ltu6;Ljava/lang/String;Ljava/lang/String;)V
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v2, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    const/4 v3, 0x1
    invoke-static {v0, v12, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->putExtra${'$'}051(Landroid/content/Intent;Ljava/lang/String;Z)Landroid/content/Intent;
    const/high16 v3, 0x10000000
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->addFlags${'$'}066(Landroid/content/Intent;I)Landroid/content/Intent;
    new-instance v1, Landroid/content/Intent;
    invoke-direct {v1, v2, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-static {v2, v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    sget-object v0, Ll1k;->a:Ll1k;
    goto/16 :goto_18
    :cond_39
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v1
    invoke-static {v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getClass${'$'}014(Ljava/lang/Object;)Ljava/lang/Class;
    sget-object v3, Lxz5;->q1:Lxz5;
    invoke-static {v1, v3, v0}, Ly2e;->a(Landroid/content/Intent;Lxz5;Ljava/lang/String;)Z
    move-result v1
    const-string v4, "tapped"
    if-eqz v1, :cond_3b
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->append${'$'}105(Ljava/lang/StringBuilder;Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->toString${'$'}010(Ljava/lang/StringBuilder;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v15, v10, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}035(Ltu6;Ljava/lang/String;Ljava/lang/String;)V
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v2, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    const-string v1, "extra_open_parking"
    const/4 v3, 0x1
    invoke-static {v0, v1, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->putExtra${'$'}051(Landroid/content/Intent;Ljava/lang/String;Z)Landroid/content/Intent;
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v0
    const-string v1, "persuade"
    invoke-static {v0, v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->hasExtra${'$'}274(Landroid/content/Intent;Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :cond_3a
    new-instance v0, Lnl/flitsmeister/fmcore/data/model/StringParam;
    const/4 v1, 0x0
    const-string v1, "action"
    invoke-direct {v0, v1, v4}, Lnl/flitsmeister/fmcore/data/model/StringParam;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    filled-new-array {v0}, [Lnl/flitsmeister/fmcore/data/model/StringParam;
    move-result-object v0
    const-string v1, "Parking_persuade_notification"
    invoke-static {v2, v1, v0}, Lho;->c(Landroid/content/Context;Ljava/lang/String;[Lnl/flitsmeister/fmcore/data/model/StringParam;)V
    sget-object v0, Lnl/flitsmeister/services/parking/Parking4411Service;->Companion:Lnl/flitsmeister/services/parking/Parking4411Service${'$'}Companion;
    invoke-static {v0, v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getInstance${'$'}005(Lig0;Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lnl/flitsmeister/services/parking/Parking4411Service;
    const/4 v3, 0x1
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->setUserTappedNotification${'$'}276(Lnl/flitsmeister/services/parking/Parking4411Service;Z)V
    :cond_3a
    sget-object v0, Ll1k;->a:Ll1k;
    goto/16 :goto_18
    :cond_3b
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v1
    invoke-static {v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getClass${'$'}014(Ljava/lang/Object;)Ljava/lang/Class;
    sget-object v3, Lxz5;->t1:Lxz5;
    invoke-static {v1, v3, v0}, Ly2e;->a(Landroid/content/Intent;Lxz5;Ljava/lang/String;)Z
    move-result v1
    const-string v12, "proStatusProvider"
    const-class v13, Lnl/flitsmeister/pro/presentation/ProPricingActivity;
    if-eqz v1, :cond_3e
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->append${'$'}105(Ljava/lang/StringBuilder;Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->toString${'$'}010(Ljava/lang/StringBuilder;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v15, v10, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}035(Ltu6;Ljava/lang/String;Ljava/lang/String;)V
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v2, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    iget-object v0, v2, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->p1:Laqe;
    if-eqz v0, :cond_3d
    invoke-static {v0, v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->b${'$'}283(Laqe;Landroid/content/Context;)Z
    move-result v0
    if-eqz v0, :cond_3c
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v2, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    const-string v1, "extra_open_fuel"
    const/4 v3, 0x1
    invoke-static {v0, v1, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->putExtra${'$'}051(Landroid/content/Intent;Ljava/lang/String;Z)Landroid/content/Intent;
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    goto :goto_17
    :cond_3c
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v2, v13}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    :goto_17
    sget-object v0, Ll1k;->a:Ll1k;
    goto/16 :goto_18
    :cond_3d
    invoke-static {v12}, Lq9a;->k(Ljava/lang/String;)V
    throw v16
    :cond_3e
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v1
    invoke-static {v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getClass${'$'}014(Ljava/lang/Object;)Ljava/lang/Class;
    sget-object v3, Lxz5;->u1:Lxz5;
    invoke-static {v1, v3, v0}, Ly2e;->a(Landroid/content/Intent;Lxz5;Ljava/lang/String;)Z
    move-result v1
    const-string v14, "extra_open_car_wash"
    if-eqz v1, :cond_3f
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->append${'$'}105(Ljava/lang/StringBuilder;Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->toString${'$'}010(Ljava/lang/StringBuilder;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v15, v10, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}035(Ltu6;Ljava/lang/String;Ljava/lang/String;)V
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v2, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    const/4 v3, 0x1
    invoke-static {v0, v14, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->putExtra${'$'}051(Landroid/content/Intent;Ljava/lang/String;Z)Landroid/content/Intent;
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    sget-object v0, Ll1k;->a:Ll1k;
    goto/16 :goto_18
    :cond_3f
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v1
    invoke-static {v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getClass${'$'}014(Ljava/lang/Object;)Ljava/lang/Class;
    sget-object v3, Lxz5;->v1:Lxz5;
    invoke-static {v1, v3, v0}, Ly2e;->a(Landroid/content/Intent;Lxz5;Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :cond_40
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->append${'$'}105(Ljava/lang/StringBuilder;Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->toString${'$'}010(Ljava/lang/StringBuilder;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v15, v10, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}035(Ltu6;Ljava/lang/String;Ljava/lang/String;)V
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v2, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    const/4 v3, 0x1
    invoke-static {v0, v14, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->putExtra${'$'}051(Landroid/content/Intent;Ljava/lang/String;Z)Landroid/content/Intent;
    const-string v1, "extra_car_wash_checkout_redirect"
    invoke-static {v0, v1, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->putExtra${'$'}051(Landroid/content/Intent;Ljava/lang/String;Z)Landroid/content/Intent;
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    sget-object v0, Ll1k;->a:Ll1k;
    goto/16 :goto_18
    :cond_40
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v1
    invoke-static {v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getClass${'$'}014(Ljava/lang/Object;)Ljava/lang/Class;
    sget-object v3, Lxz5;->r1:Lxz5;
    invoke-static {v1, v3, v0}, Ly2e;->a(Landroid/content/Intent;Lxz5;Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :cond_41
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->append${'$'}105(Ljava/lang/StringBuilder;Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->toString${'$'}010(Ljava/lang/StringBuilder;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v15, v10, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}035(Ltu6;Ljava/lang/String;Ljava/lang/String;)V
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v2, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    const-string v1, "extra_open_parking_payment"
    const/4 v3, 0x1
    invoke-static {v0, v1, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->putExtra${'$'}051(Landroid/content/Intent;Ljava/lang/String;Z)Landroid/content/Intent;
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    new-instance v0, Lnl/flitsmeister/fmcore/data/model/StringParam;
    invoke-direct {v0, v6, v4}, Lnl/flitsmeister/fmcore/data/model/StringParam;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    filled-new-array {v0}, [Lnl/flitsmeister/fmcore/data/model/StringParam;
    move-result-object v0
    const-string v1, "parking_missing_payment_method_notification"
    invoke-static {v2, v1, v0}, Lho;->c(Landroid/content/Context;Ljava/lang/String;[Lnl/flitsmeister/fmcore/data/model/StringParam;)V
    sget-object v0, Ll1k;->a:Ll1k;
    goto/16 :goto_18
    :cond_41
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v1
    invoke-static {v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getClass${'$'}014(Ljava/lang/Object;)Ljava/lang/Class;
    sget-object v3, Lxz5;->x1:Lxz5;
    invoke-static {v1, v3, v0}, Ly2e;->a(Landroid/content/Intent;Lxz5;Ljava/lang/String;)Z
    move-result v1
    const-string v4, "pro_purchase_opened"
    if-eqz v1, :cond_44
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->append${'$'}105(Ljava/lang/StringBuilder;Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->toString${'$'}010(Ljava/lang/StringBuilder;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v15, v10, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}035(Ltu6;Ljava/lang/String;Ljava/lang/String;)V
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v2, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    iget-object v0, v2, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->p1:Laqe;
    if-eqz v0, :cond_43
    invoke-static {v0, v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->b${'$'}283(Laqe;Landroid/content/Context;)Z
    move-result v0
    if-nez v0, :cond_42
    new-instance v0, Lnl/flitsmeister/fmcore/data/model/StringParam;
    invoke-direct {v0, v8, v9}, Lnl/flitsmeister/fmcore/data/model/StringParam;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    filled-new-array {v0}, [Lnl/flitsmeister/fmcore/data/model/StringParam;
    move-result-object v0
    invoke-static {v2, v4, v0}, Lho;->c(Landroid/content/Context;Ljava/lang/String;[Lnl/flitsmeister/fmcore/data/model/StringParam;)V
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v2, v13}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    :cond_42
    sget-object v0, Ll1k;->a:Ll1k;
    goto/16 :goto_18
    :cond_43
    invoke-static {v12}, Lq9a;->k(Ljava/lang/String;)V
    throw v16
    :cond_44
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v1
    invoke-static {v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getClass${'$'}014(Ljava/lang/Object;)Ljava/lang/Class;
    sget-object v3, Lxz5;->y1:Lxz5;
    invoke-static {v1, v3, v0}, Ly2e;->a(Landroid/content/Intent;Lxz5;Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :cond_47
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->append${'$'}105(Ljava/lang/StringBuilder;Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->toString${'$'}010(Ljava/lang/StringBuilder;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v15, v10, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}035(Ltu6;Ljava/lang/String;Ljava/lang/String;)V
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v2, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    iget-object v0, v2, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->p1:Laqe;
    if-eqz v0, :cond_46
    invoke-static {v0, v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->b${'$'}283(Laqe;Landroid/content/Context;)Z
    move-result v0
    if-nez v0, :cond_45
    new-instance v0, Lnl/flitsmeister/fmcore/data/model/StringParam;
    invoke-direct {v0, v8, v9}, Lnl/flitsmeister/fmcore/data/model/StringParam;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    filled-new-array {v0}, [Lnl/flitsmeister/fmcore/data/model/StringParam;
    move-result-object v0
    invoke-static {v2, v4, v0}, Lho;->c(Landroid/content/Context;Ljava/lang/String;[Lnl/flitsmeister/fmcore/data/model/StringParam;)V
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v2, v13}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    const-string v1, "pro_type"
    const-string v3, "pro_plus"
    invoke-static {v0, v1, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->putExtra${'$'}060(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    :cond_45
    sget-object v0, Ll1k;->a:Ll1k;
    goto/16 :goto_18
    :cond_46
    invoke-static {v12}, Lq9a;->k(Ljava/lang/String;)V
    throw v16
    :cond_47
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v1
    invoke-static {v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getClass${'$'}014(Ljava/lang/Object;)Ljava/lang/Class;
    sget-object v3, Lxz5;->w1:Lxz5;
    invoke-static {v1, v3, v0}, Ly2e;->a(Landroid/content/Intent;Lxz5;Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :cond_4b
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->append${'$'}105(Ljava/lang/StringBuilder;Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->toString${'$'}010(Ljava/lang/StringBuilder;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v15, v10, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}035(Ltu6;Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v0
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getExtras${'$'}019(Landroid/content/Intent;)Landroid/os/Bundle;
    move-result-object v0
    if-eqz v0, :cond_48
    const-string v1, "pro_renew"
    invoke-static {v0, v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getBoolean${'$'}333(Landroid/os/BaseBundle;Ljava/lang/String;)Z
    move-result v0
    const/4 v3, 0x1
    if-ne v0, v3, :cond_48
    const-string v0, "Extend_PRO_because_FM_2_notification_is_opened"
    invoke-static {v2, v0, v11}, Lho;->a(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;)V
    :cond_48
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v2, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    iget-object v0, v2, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->p1:Laqe;
    if-eqz v0, :cond_4a
    invoke-static {v0, v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->b${'$'}283(Laqe;Landroid/content/Context;)Z
    move-result v0
    if-nez v0, :cond_49
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v2, v13}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    :cond_49
    sget-object v0, Ll1k;->a:Ll1k;
    goto/16 :goto_18
    :cond_4a
    invoke-static {v12}, Lq9a;->k(Ljava/lang/String;)V
    throw v16
    :cond_4b
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v1
    invoke-static {v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getClass${'$'}014(Ljava/lang/Object;)Ljava/lang/Class;
    sget-object v3, Lxz5;->z1:Lxz5;
    invoke-static {v1, v3, v0}, Ly2e;->a(Landroid/content/Intent;Lxz5;Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :cond_4c
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->append${'$'}105(Ljava/lang/StringBuilder;Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->toString${'$'}010(Ljava/lang/StringBuilder;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v15, v10, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}035(Ltu6;Ljava/lang/String;Ljava/lang/String;)V
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v2, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    const-string v1, "fmDevice"
    const/4 v3, 0x1
    invoke-static {v0, v1, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->putExtra${'$'}051(Landroid/content/Intent;Ljava/lang/String;Z)Landroid/content/Intent;
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    new-instance v0, Landroid/content/Intent;
    const-class v1, Lnl/flitsmeister/features/bledevices/views/activities/DeviceActivity;
    invoke-direct {v0, v2, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    sget-object v0, Ll1k;->a:Ll1k;
    goto :goto_18
    :cond_4c
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getIntent${'$'}013(Landroid/app/Activity;)Landroid/content/Intent;
    move-result-object v1
    invoke-static {v1}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->getClass${'$'}014(Ljava/lang/Object;)Ljava/lang/Class;
    sget-object v3, Lxz5;->A1:Lxz5;
    invoke-static {v1, v3, v0}, Ly2e;->a(Landroid/content/Intent;Lxz5;Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :cond_4d
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-static {v0, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->append${'$'}105(Ljava/lang/StringBuilder;Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-static {v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->toString${'$'}010(Ljava/lang/StringBuilder;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v15, v10, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->a${'$'}035(Ltu6;Ljava/lang/String;Ljava/lang/String;)V
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v2, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    new-instance v0, Landroid/content/Intent;
    move-object/from16 v1, v17
    invoke-direct {v0, v2, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    const-string v1, "notifications_key"
    const/4 v3, 0x1
    invoke-static {v0, v1, v3}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->putExtra${'$'}051(Landroid/content/Intent;Ljava/lang/String;Z)Landroid/content/Intent;
    invoke-static {v2, v0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->startActivity${'$'}044(Landroid/content/Context;Landroid/content/Intent;)V
    sget-object v0, Ll1k;->a:Ll1k;
    goto :goto_18
    :cond_4d
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->v${'$'}102(Lnl/flitsmeister/launcher/presentation/LauncherActivity;)V
    sget-object v0, Ll1k;->a:Ll1k;
    :goto_18
    invoke-static {v2}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->finish${'$'}118(Landroid/app/Activity;)V
    :goto_19
    return-void
    :cond_4e
    move-object/from16 v16, v6
    invoke-static {v1}, Lq9a;->k(Ljava/lang/String;)V
    throw v16
    :cond_4f
    move-object/from16 v16, v6
    invoke-static {v1}, Lq9a;->k(Ljava/lang/String;)V
    throw v16
"""

internal val startupCompatibility15 = bytecodePatch {
    compatibleWith(flitsmeister)
    dependsOn(originalInput, startupManifestResources15, startupNativeResources15)
    execute {
        if (!isFlitsmeister15()) return@execute
        check(StartupRestoreData15.strings.size == 32)
        check(StartupRestoreData15.strings.values.sumOf { it.size } == 1421)
        StartupRestoreData15.strings.forEach { (type, fields) ->
            val body = buildString {
                fields.forEach { (name, value) ->
                    append("const-string v0, ${smaliString15(value)}\n")
                    append("sput-object v0, $type->$name:Ljava/lang/String;\n")
                }
                append("return-void")
            }
            addClinit15(type, 1, body)
        }
        replaceBody15("Lcom/pairip/SignatureCheck;->verifyIntegrity(Landroid/content/Context;)V", 3, 41, "return-void")
        replaceBody15("Lcom/pairip/StartupLauncher;->launch()V", 3, 17, "return-void")
        replaceBody15("Lcom/pairip/licensecheck/LicenseClient;->checkLicense(Landroid/content/Context;)V", 3, 16, "return-void")
        replaceBody15("Lcom/pairip/licensecheck/LicenseClient;->initializeLicenseCheck()V", 4, 29, "return-void")
        replaceBody15("Lcom/pairip/licensecheck/LicenseClient;->startErrorDialogActivity()V", 4, 9, "return-void")
        replaceBody15("Lcom/pairip/licensecheck/LicenseClient;->startPaywallActivity(Landroid/app/PendingIntent;)V", 4, 11, "return-void")
        replaceBody15("Lcom/pairip/licensecheck/LicenseActivity;->onStart()V", 3, 20, """
            invoke-super {p0}, Landroid/app/Activity;->onStart()V
            invoke-virtual {p0}, Lcom/pairip/licensecheck/LicenseActivity;->finish()V
            return-void
        """.trimIndent())
        replaceBody15("Lcom/pairip/VMRunner;-><clinit>()V", 1, 3, "return-void")
        replaceBody15("Lcom/pairip/VMRunner;->invoke(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;", 8, 46, "const/4 v0, 0x0\nreturn-object v0")
        replaceBody15("Lcom/pairip/VMRunner;->isDebuggingEnabled()Z", 2, 5, "const/4 v0, 0x1\nreturn v0")
        // Restore genuine service commands and typed return paths before any
        // feature, telemetry or navigation controls edit these bodies.
        replaceBody15(
            "Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->onStartCommand(Landroid/content/Intent;II)I",
            9, 21, serviceOnStartCommand15,
            newRegisterCount = serviceOnStartCommandRegisterCount15,
            program = "Fxz6YV9Xh1xFSXmr", exceptions = 8,
        )
        replaceBody15(
            "Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->onDestroy()V",
            6, 8, serviceOnDestroy15,
            newRegisterCount = serviceOnDestroyRegisterCount15,
            program = "1UkEu2lRMiAKdriN", exceptions = 15,
        )
        replaceBody15(
            "Landroidx/media3/exoplayer/offline/DownloadService;->onStartCommand(Landroid/content/Intent;II)I",
            9, 21, downloadServiceOnStartCommand15,
            newRegisterCount = downloadServiceOnStartCommandRegisterCount15,
            program = "8mSuPMx3MPD7iDZw",
        )
        replaceBody15(
            "Lwei/mark/standout/StandOutWindow;->onStartCommand(Landroid/content/Intent;II)I",
            9, 21, standOutWindowOnStartCommand15,
            newRegisterCount = standOutWindowOnStartCommandRegisterCount15,
            program = "J2vU3MI3gmqrWyZ6", exceptions = 8,
        )
        replaceBody15(
            "Landroidx/media3/ui/PlayerNotificationManager\$NotificationBroadcastReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V",
            8, 12, playerNotificationReceiverOnReceive15,
            newRegisterCount = playerNotificationReceiverOnReceiveRegisterCount15,
            program = "45SSFJsyXBEwWtgz",
        )
        replaceBody15(
            "Lnl/flitsmeister/FlitsmeisterApplication;->onCreate()V",
            6, 8, applicationOnCreate15, newRegisterCount = 21,
            program = "LBsZjgwAdSdCGW1e", exceptions = 1,
        )
        replaceBody15(
            "Lnl/flitsmeister/launcher/presentation/LauncherActivity;->onResume()V",
            6, 8, launcherOnResume15, newRegisterCount = 19,
            program = "QV2QafOREIGgSZyv", exceptions = 1,
        )
        replaceBody15(
            "Lnl/flitsmeister/fmx/activities/main/MainActivity;->onCreate(Landroid/os/Bundle;)V",
            7, 10, mainActivityOnCreate15, newRegisterCount = 22,
            program = "mq2oLwBmLnxLU6o1",
        )
        replaceBody15(
            "Lnl/flitsmeister/features/hud/views/activities/HUDActivity;->onCreate(Landroid/os/Bundle;)V",
            7, 10, hudActivityOnCreate15, newRegisterCount = hudActivityOnCreateRegisterCount15,
            program = "EoRT8Q0n0KbLAu50",
        )
        replaceBody15(
            "Lnl/flitsmeister/controllers/activities/cropimage/CropImageActivity;->onCreate(Landroid/os/Bundle;)V",
            7, 10, cropImageActivityOnCreate15, newRegisterCount = cropImageActivityOnCreateRegisterCount15,
            program = "OayAk1B8xFetCqjZ", exceptions = 1,
        )
        replaceBody15(
            "Lnl/flitsmeister/controllers/activities/citsParking/CitsParkingActivity;->onResume()V",
            6, 8, citsParkingActivityOnResume15, newRegisterCount = citsParkingActivityOnResumeRegisterCount15,
            program = "b0w8vgPuA1eoFNTt",
        )
        replaceBody15(
            "Lcom/useinsider/insider/InsiderLoginActivity;->onCreate(Landroid/os/Bundle;)V",
            7, 10, insiderLoginActivityOnCreate15, newRegisterCount = insiderLoginActivityOnCreateRegisterCount15,
            program = "WqKu6HXMirrJtgGO", exceptions = 2,
        )
        receiverBodies15.forEach { body ->
            replaceBody15(body.descriptor, 8, 12, body.code,
                newRegisterCount = body.registers, program = body.program,
                exceptions = body.exceptions)
        }
    }
}
