package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method

/** Whether signing in may use a passkey the phone's credential manager holds. */
internal const val PASSKEY_LOGIN = "passkey_login"

/**
 * The question androidx's credential library asks each of its providers before it uses one: does this phone have a
 * credential manager this provider can talk to. Messenger carries that library, Meta's own sign-in reaches passkeys
 * through it, and the library's names survive the build untouched, since the provider is named in a manifest entry and
 * loaded by name. A no from every provider leaves the library with nothing to ask, which is the state of a phone that
 * has no passkey support at all.
 */
internal const val PASSKEY_AVAILABILITY = "isAvailableOnDevice"

/** A provider's own name for the call that hands a passkey or a password back to whoever asked for one. */
private const val CREDENTIAL_GET = "onGetCredential"

/**
 * Play services' provider, the one that offers the passkeys a Google account holds, and the one a sign-in on this phone
 * actually gets its passkey from. The library loads it by name from a manifest entry, so the build leaves the name
 * alone. Without it in hand the switch couldn't promise the sign-in has no passkey to offer, so it stays unapplied.
 */
internal const val PASSKEY_PLAY_SERVICES = "Landroidx/credentials/playservices/CredentialProviderPlayServicesImpl;"

/** The no-argument availability question, as a provider implements it: an instance (Z) with code behind it. */
internal fun Method.isPasskeyAvailability() =
    name == PASSKEY_AVAILABILITY && returnType == "Z" && parameterTypes.isEmpty() &&
        !AccessFlags.STATIC.isSet(accessFlags) && implementation != null

private fun ClassDef.isCredentialProvider() =
    methods.any { it.name == CREDENTIAL_GET } && methods.any { it.isPasskeyAvailability() }

/**
 * Every provider's availability question, but only while the providers between them hold the whole route. Play
 * services' provider has to be one of them, they have to share one interface, and every class in the build that
 * implements it has to be one of them, so a build with a provider the switch wouldn't reach gets no hook at all and the
 * switch never claims more than it stops. 587 has two, Android's own credential manager and Play services'.
 */
internal fun findPasskeyLogin(classes: Iterable<ClassDef>): List<Method> {
    val providers = classes.filter { it.isCredentialProvider() }
    if (providers.none { it.type == PASSKEY_PLAY_SERVICES }) return emptyList()
    val shared = providers.map { it.interfaces.toSet() }.reduceOrNull { held, next -> held intersect next }
        ?.singleOrNull() ?: return emptyList()
    val covered = providers.map { it.type }.toSet()
    if (classes.any { shared in it.interfaces && it.type !in covered }) return emptyList()
    return providers.flatMap { cls -> cls.methods.filter { it.isPasskeyAvailability() } }
}

private fun passkeyChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: the credential providers changed ($detail)")

internal fun MutableMethod.validatePasskeyLogin() {
    if (!isPasskeyAvailability()) passkeyChanged("unexpected method ${hookId()}")
    validateSwitch()
    // The answer goes in front of the provider's own check, so nothing may jump back to the first instruction.
    if (0 in jumpTargets()) passkeyChanged("a jump back to the start of ${hookId()}")
}

/**
 * While the switch is on each provider answers no, so Meta's sign-in finds no passkey to offer and asks you to approve
 * the login from another device instead, as it does for an account without one. Off, Pause and safe mode run the
 * provider's own check, and the answer is read fresh each time, so turning the switch off needs no restart.
 */
internal fun MutableMethod.injectPasskeyLogin() {
    validatePasskeyLogin()
    injectSwitch("$SETTINGS->skipPasskeySignIn()Z", "0x0")
}
