package app.morphe.patches.instaprime.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val SUBSCRIPTION_MANAGER = "Lcom/primemods/module/subscription/SubscriptionManager;"
private const val SP_UTILS = "Lcom/primemods/utils/SPUtils;"

private const val FAR_FUTURE_MS = "4102444800000L"

private fun MutableSet<MutableMethod>.replaceNative(
    name: String,
    params: List<String>,
    registerCount: Int,
    smali: String,
) {
    val old = first { m ->
        m.name == name && m.parameterTypes.map { it.toString() } == params
    }

    val rebuilt = MutableMethod(
        ImmutableMethod(
            old.definingClass,
            old.name,
            old.parameters,
            old.returnType,
            old.accessFlags and AccessFlags.NATIVE.value.inv(),
            old.annotations,
            old.hiddenApiRestrictions,
            MutableMethodImplementation(registerCount),
        ),
    ).apply {
        addInstructionsWithLabels(0, smali)
    }

    remove(old)
    add(rebuilt)
}

private fun unlockExpiryBody(fallback: String) = """
    const-string v0, "unlock_expiry"
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :original
    const-wide v0, $FAR_FUTURE_MS
    return-wide v0
    :original
    $fallback
    return-wide v0
"""

@Suppress("unused")
val instaPrimePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Enables unlimited local PREMIUM subscription in the mod's functions and remove forced update.",
) {
    // APK InstaPrime_V7_2_64bit_Clone.apk
    compatibleWith("com.instaprime.android"("435.0.0.37.76"))

    dependsOn(
        InstaPrimeAboutPatch.patch,
        InstaPrimeBanner.patch,
        InstaPrimeNoUpdate.patch,
        InstaPrimeServerBlock.patch,
    )

    execute {
        val sub = mutableClassDefBy(SUBSCRIPTION_MANAGER)
        val sp = mutableClassDefBy(SP_UTILS)

        // SubscriptionManager.A36()Z -> false
        sub.methods.replaceNative(
            "A36", emptyList(), 1,
            "const/4 v0, 0x0\nreturn v0",
        )

        // SubscriptionManager.A38(Context)Z -> true
        sub.methods.replaceNative(
            "A38", listOf("Landroid/content/Context;"), 2,
            "const/4 v0, 0x1\nreturn v0",
        )

        val ig = mutableClassDefBy("Lcom/primemods/utils/IGUtils;")
        ig.methods.replaceNative(
            "isPrivate",
            listOf("Ljava/lang/String;", "Lcom/primemods/presenter/PrivateCallback;"),
            3, // v0 + p0(String) + p1(PrivateCallback)
            """
                const/4 v0, 0x0
                invoke-interface {p1, v0}, Lcom/primemods/presenter/PrivateCallback;->onResult(Z)V
                return-void
            """,
        )

        ig.methods.replaceNative(
            "getIgObject", emptyList(), 1,
            """
                const-string v0, "welcometoinstaprime"
                return-object v0
            """,
        )

        sp.methods.replaceNative(
            "getLong", listOf("Ljava/lang/String;", "J"), 5,
            unlockExpiryBody(
                """
                invoke-static {}, $SP_UTILS->getPreferences()Landroid/content/SharedPreferences;
                move-result-object v0
                invoke-interface {v0, p0, p1, p2}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J
                move-result-wide v0
                """,
            ),
        )

        sp.methods.replaceNative(
            "getLong", listOf("Ljava/lang/String;"), 4,
            unlockExpiryBody(
                """
                invoke-static {}, $SP_UTILS->getPreferences()Landroid/content/SharedPreferences;
                move-result-object v0
                const-wide/16 v1, 0x0
                invoke-interface {v0, p0, v1, v2}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J
                move-result-wide v0
                """,
            ),
        )
    }
}
