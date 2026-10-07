package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val APP_ICONS = "app_icons"
/** Messenger's subscription benefit name for its paid launcher icons. */
internal const val APP_ICON_BENEFIT = "CUSTOM_APP_ICON"
/** The icon manager maps "default" to this launcher entry and every other icon to a disabled LauncherAlias. */
internal const val APP_ICON_DEFAULT_ENTRY = "com.facebook.orca.auth.StartScreenActivity"
internal const val APP_ICON_ALIAS_PREFIX = "com.facebook.orca.LauncherAlias"

private fun Method.literals() = implementation?.instructions
    ?.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }.orEmpty()

/**
 * The class whose static initializer maps every icon id to its launcher entry. Its apply method switches
 * those activity-aliases with PackageManager, so the icons are already in the APK and need no download.
 */
internal fun findAppIconManagers(classes: Iterable<ClassDef>): Set<String> = classes.filter { cls ->
    val strings = cls.methods.singleOrNull { it.name == "<clinit>" }?.literals().orEmpty()
    APP_ICON_DEFAULT_ENTRY in strings && strings.any { it.startsWith(APP_ICON_ALIAS_PREFIX) }
}.map { it.type }.toSet()

/** The manager's two benefit checks: one locks each icon in the picker, the other shows the App icon setting. */
internal fun Method.isAppIconGate() = AccessFlags.STATIC.isSet(accessFlags) && returnType == "Z" &&
    parameterTypes.map { it.toString() } == listOf(FB_USER_SESSION) && APP_ICON_BENEFIT in literals()

internal fun MutableMethod.validateAppIconGate() {
    validateScratch()
    if (!isAppIconGate()) throw PatchException("Messenger controls: ${hookId()} is no longer the app icon benefit check")
}

/** Answers yes while the control is on, so the picker unlocks every icon and applies it through Messenger's own alias switch. */
internal fun MutableMethod.injectAppIconGate() {
    validateAppIconGate()
    injectSwitch("unlockAppIcons", "0x1")
}
