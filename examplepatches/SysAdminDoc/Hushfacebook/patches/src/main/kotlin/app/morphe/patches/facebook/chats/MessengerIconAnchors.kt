/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.chats

import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.feed.resolveStatic
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/*
 * Where a tap on the Messenger icon in Facebook's top bar goes, on the 577 and 580 builds.
 *
 * The icon's click listener and its long-click listener both call one static tap method with the
 * context, the user session, four renamed helpers, the surface the icon sits on and three flags.
 * The second flag is the long press: the click listener hands it 0 and the long-click listener 1.
 * The long-click listener only exists behind a MobileConfig flag (580 0x8105b2000f2771, 577
 * 0x8105b8000f276a), which also gives the top bar's touch listener the gesture detector that calls
 * it. Without the flag, a press lifted on the icon is a click however long it was held, so a long
 * press reaches the tap with 0.
 * The method is the only one in either build that loads both
 * "entry_point_navbar_global_icon_reels_tab" and "entry_point_navbar_global_icon_", the entry
 * points it names the tap by.
 *
 * Behind a MobileConfig flag the tap goes on to a shared static Messenger button handler,
 * (Context, FbUserSession, String entry point, Z long press, Z)V, which the older title bar and
 * the Professional dashboard's Messenger icon call too. It logs "long_press" only for a long press,
 * and it's the one static method of that shape loading that string. Without the flag the tap opens
 * Chats itself. Both routes end in Facebook's own Chats (InboxActivity), and a long press there
 * opens a preview sheet of chats where Facebook offers one.
 *
 * Every class and method name here is Redex's (580's tap is LX/21h;->A01 and its handler
 * LX/cuh;->A00, 577's LX/3Ee;->A01 and LX/ZsI;->A00), and the Messenger activity's own name moved
 * from the tap into the handler between the two builds. So the tap is found by its entry points
 * and its shape, and the handler as the one static method of the handler's shape the tap calls.
 * 582 (tap LX/28V;->A01) puts a cooldown wrapper of the same shape in front of it, an instance
 * method on the handler class's singleton, so the tap's call is followed through that wrapper.
 */
internal const val ICON_PATCH = "Open Messenger from the top bar"

/** The prefix the tap puts in front of the surface to name its entry point. */
internal const val NAVBAR_ENTRY = "entry_point_navbar_global_icon_"

/** The entry point the tap hands the handler for the icon on the Reels tab. */
internal const val REELS_TAB_ENTRY = "entry_point_navbar_global_icon_reels_tab"

/** The key the handler logs a long press under. */
internal const val LONG_PRESS = "long_press"

/** The tap's long-press parameter: 0 from the click listener, 1 from the long-click listener. */
internal const val TAP_LONG_PRESS = 8

/** The handler's long-press parameter, which the tap fills from its own. */
internal const val BUTTON_LONG_PRESS = 3

private const val ANDROID_CONTEXT = "Landroid/content/Context;"
private const val FB_USER_SESSION = "Lcom/facebook/auth/usersession/FbUserSession;"

internal val BUTTON_PARAMETERS = listOf(ANDROID_CONTEXT, FB_USER_SESSION, "Ljava/lang/String;", "Z", "Z")

private fun Method.parameters(): List<String> = parameterTypes.map { it.toString() }

private fun Method.isStaticVoidWithBody(): Boolean =
    implementation != null && AccessFlags.STATIC.isSet(accessFlags) && returnType == "V"

/**
 * The icon's tap: a static void method over the context, the user session, four helpers, the
 * surface and three flags, loading both entry points.
 */
internal fun isIconTap(method: Method): Boolean {
    val parameters = method.parameters()
    return method.isStaticVoidWithBody() && parameters.size == 10 && parameters[0] == ANDROID_CONTEXT &&
        parameters[1] == FB_USER_SESSION && parameters[6] == "Ljava/lang/String;" &&
        parameters.subList(7, 10).all { it == "Z" } &&
        holdsString(method, NAVBAR_ENTRY) && holdsString(method, REELS_TAB_ENTRY)
}

/** The Messenger button handler: static (Context, FbUserSession, String, Z, Z)V, loading "long_press". */
internal fun isButtonHandler(method: Method): Boolean =
    method.isStaticVoidWithBody() && method.parameters() == BUTTON_PARAMETERS && holdsString(method, LONG_PRESS)

private val STATIC_CALLS = setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE)

/** The calls in [method] of a method with the button handler's shape, among [opcodes]. */
private fun handlerShapedCalls(method: Method, opcodes: Set<Opcode>): List<MethodReference> =
    method.implementation?.instructions?.toList().orEmpty().mapNotNull { instruction ->
        if (instruction.opcode !in opcodes) return@mapNotNull null
        val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@mapNotNull null
        call.takeIf { it.returnType == "V" && it.parameterTypes.map { type -> type.toString() } == BUTTON_PARAMETERS }
    }

/**
 * The calls in [tap] of a method with the button handler's shape: static up to 581, and from 582 a
 * virtual call on the handler's singleton (see [buttonHandler]).
 */
internal fun buttonHandlerCalls(tap: Method): List<MethodReference> =
    handlerShapedCalls(tap, STATIC_CALLS + setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE))

/**
 * The button handler the tap's [call] reaches in [owner], the call's class: the method it names
 * when that's the handler, or else, when it names an instance method of the handler's shape with
 * exactly one static call of that shape into [owner], the method that call names. 582's tap calls
 * such a wrapper on a singleton (LX/eh9;->A01), which waits out a MobileConfig cooldown and then
 * calls the static handler (LX/eh9;->A00) with its own arguments.
 */
internal fun buttonHandler(owner: ClassDef, call: MethodReference): Method? {
    val named = owner.methods.firstOrNull {
        it.name == call.name && it.returnType == call.returnType &&
            it.parameters() == call.parameterTypes.map { type -> type.toString() }
    } ?: return null
    if (isButtonHandler(named)) return named
    if (AccessFlags.STATIC.isSet(named.accessFlags)) return null
    val inner = handlerShapedCalls(named, STATIC_CALLS).filter { it.definingClass == owner.type }.distinctBy { it.toString() }
    return inner.singleOrNull()?.let { resolveStatic(owner, it) }?.takeIf(::isButtonHandler)
}
