package app.template.patches.wemuslim.misc.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.util.cloneParameters
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_WEMUSLIM
import app.template.patches.wemuslim.misc.encryption.bypassNativeEncryptionPatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val CONTINUATION = "Lkotlin/coroutines/Continuation;"
private const val STATE_FLOW_KT = "Lkotlinx/coroutines/flow/StateFlowKt;"
private const val MUTABLE_STATE_FLOW = "Lkotlinx/coroutines/flow/MutableStateFlow;"
private const val GMA = "Lcom/google/android/gms/ads/"

// WeMuslim's membership is server-side (protobuf MembershipDetail / privilege lists from the
// server), so it is not faked. One of its privileges, AUTHORITY_TYPE_NO_ADS, is what the app
// itself consults before every ad: the ad managers' shared "can show ads" check, the open-ad
// (splash) gate, the home/prayer/Ummah feed ads, the points page banner and the ad-resource views
// all ask IWalletExport, the router interface the inapppay module exports, either synchronously
// ((AuthorityType)Z) or as a StateFlow<Boolean> ((AuthorityType, Continuation)Object). Answering
// "yes" for NO_ADS only (every other privilege still asks the server's state) removes the ad slots
// instead of leaving empty boxes, and no membership UI or server call is unlocked by it.
//
// Rewarded ads are deliberately left working: they are opt-in and their rewards are granted
// server-side (server-side verification with the user id and task data). They are the free path
// to make-up prayers in the prayer tracker (ResignDialogFragment "Watch Ads"), free golds,
// point-task rewards and mini-program / web rewards. So MobileAds.initialize and RewardedAd.load
// stay untouched (rule 9 does not apply), and only the other formats get SDK backstops. The app
// itself only calls Google Mobile Ads; AppLovin, Pangle, Unity and Meta Audience Network are GMA
// mediation adapters, reached only through the GMA loads below (or a rewarded load).
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads. Opt-in rewarded ads keep working.",
) {
    compatibleWith(COMPATIBILITY_WEMUSLIM)

    dependsOn(bypassNativeEncryptionPatch)

    execute {
        // 1. The app's own ad gate: IWalletExport answers "has AUTHORITY_TYPE_NO_ADS" for both the
        // synchronous and the StateFlow form. The implementation (inapppay.WalletExport in 3.5.0
        // and 3.5.4) is found as the single class implementing the kept router interface.
        if (classDefBy(AUTHORITY_TYPE).fields.none { it.name == NO_ADS && it.type == AUTHORITY_TYPE }) {
            throw PatchException("Disable ads: $AUTHORITY_TYPE has no $NO_ADS")
        }
        val implementations = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            if (WALLET_EXPORT in classDef.interfaces && !AccessFlags.INTERFACE.isSet(classDef.accessFlags)) {
                implementations += classDef
            }
        }
        val wallet = implementations.singleOrNull()
            ?: throw PatchException("Disable ads: expected one $WALLET_EXPORT implementation, found ${implementations.map { it.type }}")
        val walletMethods = mutableClassDefBy(wallet).methods

        fun authorityMethod(returnType: String, parameters: List<String>): MutableMethod {
            val method = walletMethods.singleOrNull {
                it.returnType == returnType && it.implementation != null &&
                    !AccessFlags.STATIC.isSet(it.accessFlags) &&
                    it.parameterTypes.map(CharSequence::toString) == parameters
            } ?: throw PatchException("Disable ads: no single ${wallet.type} (${parameters.joinToString()})$returnType")
            // This method, or a copy of it with v0 free at entry. R8 may leave a method no local
            // register at all (3.5.4's (AuthorityType)Z reuses p0 as its scratch register); the
            // patcher's clone then adds registers and moves the parameters back down at entry, so
            // the stock body is unchanged. (morphe-patches-library 2.0.0 made its
            // cloneParameters(MutableClass) internal; the patcher's public cloneParameters() makes
            // the same clone and swaps it into the class.)
            val implementation = method.implementation ?: throw PatchException("${method.definingClass}->${method.name} has no body")
            val parameterRegisters = method.parameterTypes
                .sumOf { if (it.toString() in setOf("J", "D")) 2 else 1 } +
                if (AccessFlags.STATIC.isSet(method.accessFlags)) 0 else 1
            return if (implementation.registerCount > parameterRegisters) method
            else method.cloneParameters()
        }

        // p1 is the AuthorityType; v0 is the first local, written before it is read.
        val hasAuthority = authorityMethod("Z", listOf(AUTHORITY_TYPE))
        hasAuthority.addInstructionsWithLabels(
            0,
            """
                sget-object v0, $AUTHORITY_TYPE->$NO_ADS:$AUTHORITY_TYPE
                if-ne p1, v0, :stock
                const/4 v0, 0x1
                return v0
            """,
            ExternalLabel("stock", hasAuthority.getInstruction(0)),
        )

        // The suspend form returns its StateFlow<Boolean> directly (never COROUTINE_SUSPENDED for
        // NO_ADS): a MutableStateFlow holding Boolean.TRUE, which callers collect or read.
        if (classDefBy(STATE_FLOW_KT).methods.none {
                it.name == "MutableStateFlow" && it.returnType == MUTABLE_STATE_FLOW &&
                    it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/Object;")
            }
        ) {
            throw PatchException("Disable ads: $STATE_FLOW_KT has no MutableStateFlow(Object)")
        }
        val authorityFlow = authorityMethod("Ljava/lang/Object;", listOf(AUTHORITY_TYPE, CONTINUATION))
        authorityFlow.addInstructionsWithLabels(
            0,
            """
                sget-object v0, $AUTHORITY_TYPE->$NO_ADS:$AUTHORITY_TYPE
                if-ne p1, v0, :stock
                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                invoke-static {v0}, $STATE_FLOW_KT->MutableStateFlow(Ljava/lang/Object;)$MUTABLE_STATE_FLOW
                move-result-object v0
                return-object v0
            """,
            ExternalLabel("stock", authorityFlow.getInstruction(0)),
        )

        // 2. The splash (open-page) ad gate answers false on its own as well, so the launcher
        // never routes through the ad platform and its 20-second ad timeout, whatever the
        // membership state. The warm-start app-open ad is gated by the same NO_ADS check. The gate
        // is the one open-page check that reads the new-user grace period, inline or through its
        // helper.
        val graceChecks = NewUserAdGraceFingerprint.matchAllOrNull().orEmpty().map { it.originalMethod.key() }.toSet()
        val gates = OpenPageAdGateFingerprint.matchAllOrNull().orEmpty().filter { match ->
            match.originalMethod.implementation?.instructions?.any { instruction ->
                when (val reference = (instruction as? ReferenceInstruction)?.reference) {
                    is StringReference -> reference.string == NEW_USER_AD_DAYS
                    is MethodReference -> reference.key() in graceChecks
                    else -> false
                }
            } == true
        }
        val gate = gates.singleOrNull()
            ?: throw PatchException("Disable ads: expected one open-page ad gate, found ${gates.map { it.originalMethod.key() }}")
        gate.method.returnEarly(false)

        // 3. GMA backstops for every format the app loads except rewarded: banners
        // (BaseAdView.loadAd; AdView has none of its own), natives (AdLoader, also the native
        // splash ad), interstitials and app-open ads. Every overload is a no-op; no load callback
        // fires, and no app path waits on one once step 1 has removed the slots.
        for ((owner, names) in mapOf(
            "${GMA}BaseAdView;" to setOf("loadAd"),
            "${GMA}AdLoader;" to setOf("loadAd", "loadAds"),
            "${GMA}interstitial/InterstitialAd;" to setOf("load"),
            "${GMA}appopen/AppOpenAd;" to setOf("load"),
        )) {
            val methods = mutableClassDefByOrNull(owner)?.methods
                ?: throw PatchException("Disable ads: $owner not found")
            for (name in names) {
                // returnEarly() is void-only and NPEs on abstract declarations.
                val targets = methods.filter { it.name == name && it.returnType == "V" && it.implementation != null }
                if (targets.isEmpty()) throw PatchException("Disable ads: no concrete void $owner->$name")
                targets.forEach { it.returnEarly() }
            }
        }
    }
}

private fun MethodReference.key() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
