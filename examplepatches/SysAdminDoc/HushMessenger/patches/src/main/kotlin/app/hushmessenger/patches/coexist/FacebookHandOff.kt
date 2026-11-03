package app.hushmessenger.patches.coexist

import app.hushmessenger.patches.controls.hookId
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/*
 * Messenger hands people to the Facebook app by package name: profile and marketplace links, shared stories and games,
 * and the "is Facebook installed" tests that decide whether those links work at all. A Facebook clone has another
 * package name, so none of that reaches it. These sites load the literal "com.facebook.katana", so the patch swaps the
 * literal for the clone's name at build time.
 *
 * Patch time beats a runtime hook here. The callers are dozens of obfuscated methods with no shared entry point, a
 * runtime filter on PackageManager or Intent would also catch the sign-in and account-sharing code that has to keep
 * talking to whichever Facebook holds the account, and a literal is rewritten only where every use of it is a hand-off.
 * A load whose register is also compared, stored, passed to sign-in or logged stays as it is.
 */

internal const val FACEBOOK_PACKAGE = "com.facebook.katana"
private const val PACKAGE_MANAGER = "Landroid/content/pm/PackageManager;"
private const val CONTEXT = "Landroid/content/Context;"
private const val STRING = "Ljava/lang/String;"
private const val INTENT_SET_PACKAGE = "Landroid/content/Intent;->setPackage($STRING)Landroid/content/Intent;"
private const val INTENT_SET_CLASS_NAME = "Landroid/content/Intent;->setClassName($STRING$STRING)Landroid/content/Intent;"
private const val COMPONENT_NAME_INIT = "Landroid/content/ComponentName;-><init>($STRING$STRING)V"
private val packageManagerProbes = setOf("getLaunchIntentForPackage", "getPackageInfo", "getApplicationInfo")

/** Meta's own "is this app installed (at this version)" helpers, which take the package name as their String argument. */
private val installedChecks = setOf(
    "($PACKAGE_MANAGER$STRING)Z", "($PACKAGE_MANAGER${STRING}Z)Z", "($CONTEXT${STRING}I)Z",
)
private val installedMethodChecks = setOf("($STRING)Z", "($STRING" + "I)Landroid/content/pm/PackageInfo;")

private val handOffPattern = Regex("^[a-zA-Z][a-zA-Z0-9_]*(\\.[a-zA-Z][a-zA-Z0-9_]*)+$")

/** The Facebook app's own name, or a clone of it: com.facebook.katana.<anything valid>. */
internal fun isFacebookPackage(name: String?) = name != null && name.length <= 150 && handOffPattern.matches(name) &&
    (name == FACEBOOK_PACKAGE || name.startsWith("$FACEBOOK_PACKAGE.") && name.length > FACEBOOK_PACKAGE.length + 1)

private fun Instruction.loadsFacebook() = (opcode == Opcode.CONST_STRING || opcode == Opcode.CONST_STRING_JUMBO) &&
    ((this as ReferenceInstruction).reference as StringReference).string == FACEBOOK_PACKAGE

/** Whether this instruction sends [register], as the package name, to something that opens or looks for the Facebook app. */
private fun Instruction.isHandOff(register: Int): Boolean {
    val method = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    val operands = registers()
    // The name is the first argument after the receiver, or after the Context or PackageManager of a static helper.
    if (operands.indexOf(register) != 1 || operands.count { it == register } != 1) return false
    val shape = method.parameterTypes.joinToString("", "(", ")") + method.returnType
    val ours = !method.definingClass.startsWith("Ljava/") && !method.definingClass.startsWith("Landroid/")
    return when (opcode) {
        Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE -> method.toString() == INTENT_SET_PACKAGE ||
            method.toString() == INTENT_SET_CLASS_NAME ||
            method.definingClass == PACKAGE_MANAGER && method.name in packageManagerProbes ||
            ours && shape in installedMethodChecks
        Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE -> method.toString() == COMPONENT_NAME_INIT
        Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE -> ours && shape in installedChecks
        else -> false
    }
}

/** Every Facebook-name load in [this] whose register only goes to hand-offs, by instruction index. */
private fun Method.handOffLoads(): List<Int> {
    val code = implementation?.instructions?.toList() ?: return emptyList()
    return code.indices.filter { code[it].loadsFacebook() }.filter { load ->
        val register = (code[load] as OneRegisterInstruction).registerA
        if (register > 255) return@filter false
        val readers = runCatching { readersOf(load, register) }.getOrNull() ?: return@filter false
        readers.isNotEmpty() && readers.all { code[it].isHandOff(register) }
    }
}

/** Each place Messenger hands off to, or asks about, the Facebook app, as "class->method(args)return@index". */
internal fun findFacebookHandOffs(classes: Iterable<ClassDef>): Set<String> = classes.flatMap { it.methods }.flatMap { method ->
    method.handOffLoads().map { "${method.hookId()}@$it" }
}.toSet()

/**
 * Loads [target] where each of [sites] loaded the Facebook app's name. Every site is checked first, so a build that
 * doesn't match stops the patch with nothing changed. Last first, as a longer instruction can move the padding before
 * a switch table.
 */
internal fun applyFacebookHandOffs(sites: List<Pair<MutableMethod, Int>>, target: String) {
    if (!isFacebookPackage(target)) throw PatchException("$CLONE_PATCH_NAME: $target can't be used as the Facebook app's name. Start with an unmodified supported APK.")
    val loads = sites.map { (method, at) ->
        val load = method.implementation?.instructions?.elementAtOrNull(at)
        if (load == null || !load.loadsFacebook()) {
            throw PatchException("$CLONE_PATCH_NAME: ${method.hookId()}@$at no longer loads the Facebook app's name. Start with an unmodified supported APK.")
        }
        Triple(method, at, method.register(at, "the Facebook app's name"))
    }
    for ((method, at, register) in loads.sortedByDescending { it.second }) {
        method.replaceInstruction(at, "const-string/jumbo v$register, \"$target\"")
    }
}
