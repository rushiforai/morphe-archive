package app.template.patches.shared.misc.ads

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

// AGENTS.md hard-won rule 9. A patch that no-ops MobileAds.initialize must also neuter the other
// MobileAds statics: without init, setAppVolume, setAppMuted, openDebugMenu, the private setPlugin
// and putPublisherFirstPartyIdEnabled throw "MobileAds.initialize() must be called prior to ...".
// That crashed Simple Radio on every fresh install (2026-10-14). getInitializationStatus throws
// too, but it returns an object and no patched app calls it, so it is left alone.

private const val MOBILE_ADS = "Lcom/google/android/gms/ads/MobileAds;"
private const val INIT_LOG = "Initializing on calling thread"

/**
 * Makes every concrete static void on Google Mobile Ads' `MobileAds` return at once
 * (initialize included) and forces `putPublisherFirstPartyIdEnabled` to answer false.
 *
 * With [required] names the call is mandatory: MobileAds must be found and each name must be a
 * concrete static void on it, otherwise the patch fails. Without them it is optional: an app
 * whose MobileAds cannot be located is skipped. Returns whether MobileAds was neutralised.
 */
fun BytecodePatchContext.neutraliseMobileAdsStatics(vararg required: String): Boolean {
    val mobileAds = mutableClassDefByOrNull(MOBILE_ADS)
        ?: renamedMobileAds()?.let { mutableClassDefBy(it) }
        ?: if (required.isEmpty()) return false else throw PatchException("Disable ads: $MOBILE_ADS not found")

    val staticVoids = mobileAds.methods.filter { it.isConcreteStaticVoid() }
    for (name in required) {
        if (staticVoids.none { it.name == name }) {
            throw PatchException("Disable ads: no concrete static void ${mobileAds.type}->$name")
        }
    }
    staticVoids.forEach { it.returnEarly() }
    mobileAds.methods.filter {
        it.name == "putPublisherFirstPartyIdEnabled" && it.returnType == "Z" && it.implementation != null
    }.forEach { it.returnEarly(false) }
    return true
}

// R8 has kept the MobileAds class name in every app seen so far (its private setPlugin is a keep
// target) while renaming or inlining the methods: BoxBox 5.4.17 inlines initialize into a static
// a(BoxBoxApplication, ...), Interval Timer keeps it as a(Context). Should the class itself be
// renamed, the SDK's init log line still finds it: either the line was inlined into one of its
// static voids (BoxBox shape), or MobileAds is the class whose static void calls the settings
// manager method that logs it (Interval Timer shape). Either way it must be a static-only holder,
// so an app class that happens to inline the init is never taken for it; anything else is skipped.
private fun BytecodePatchContext.renamedMobileAds(): ClassDef? {
    val logOwner = classDefByOrNull { classDef -> classDef.methods.any { it.logsInit() } } ?: return null
    val init = logOwner.methods.first { it.logsInit() }
    if (AccessFlags.STATIC.isSet(init.accessFlags)) return logOwner.takeIf { it.isStaticHolder() }

    val callers = mutableListOf<ClassDef>()
    classDefForEach { classDef ->
        if (classDef.isStaticHolder() && classDef.methods.any { it.isConcreteStaticVoid() && it.calls(init) }) {
            callers += classDef
        }
    }
    return callers.singleOrNull()
}

private fun Method.isConcreteStaticVoid() =
    AccessFlags.STATIC.isSet(accessFlags) && returnType == "V" && implementation != null && name != "<clinit>"

private fun Method.logsInit() = returnType == "V" && implementation?.instructions?.any {
    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string?.startsWith(INIT_LOG) == true
} == true

private fun Method.calls(target: Method) = implementation?.instructions?.any {
    val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
    ref != null && ref.definingClass == target.definingClass && ref.name == target.name &&
        ref.returnType == target.returnType &&
        ref.parameterTypes.map(CharSequence::toString) == target.parameterTypes.map(CharSequence::toString)
} == true

// Object subclass with no interfaces, no instance state and nothing but statics and constructors.
private fun ClassDef.isStaticHolder() =
    superclass == "Ljava/lang/Object;" && interfaces.isEmpty() && instanceFields.none() &&
        methods.all { AccessFlags.STATIC.isSet(it.accessFlags) || it.name == "<init>" }
