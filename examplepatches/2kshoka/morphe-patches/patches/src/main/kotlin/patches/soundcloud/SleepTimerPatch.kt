package patches.soundcloud

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.w3c.dom.Element
import patches.shared.uniqueMatch
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory

// Only APIs that the other patches in this repository already use are used here:
// Fingerprint(...).uniqueMatch(), addInstructions, instructions, classDefForEach,
// mutableClassDefBy, document(...).use, get(...), DocumentBuilderFactory for the manifest.

private const val ROOT = "Lcom/soundcloud/android/"
private const val MENU_ITEM = "${ROOT}features/bottomsheet/track/TrackMenuItem;"
/**
 * The menu item the Sleep timer is placed directly above. To move it, change this to another
 * TrackMenuItem subclass (for example SelectiveDownload for "Download"), but only pick one whose
 * creation is not a branch target in the mapper (see the notes in step 2 below).
 */
private const val ANCHOR_ITEM = "${ROOT}features/bottomsheet/track/TrackMenuItem\$AddToPlaylist;"
private const val SLEEP_ITEM = "Lnl/johninnl/soundcloud/SleepTimerMenuItem;"
private const val ENTRY = "Lnl/johninnl/soundcloud/SleepTimerEntry;"
private const val OBJECT = "Ljava/lang/Object;"
private const val COLLECTION = "Ljava/util/Collection;"
private const val KOTLIN_COLLECTIONS = "Lkotlin/collections/CollectionsKt;"
private const val STRING_NAME = "morphe_sleep_timer"

/** Launcher Activity (dotted class name), filled in by [sleepTimerResourcePatch]. */
private var launcherActivity: String? = null

/** The app's Application class (dotted name, from <application android:name>). */
private var applicationClass: String? = null

context(context: BytecodePatchContext)
private fun exact(owner: String, name: String, result: String, vararg parameters: String) =
    Fingerprint(definingClass = "$ROOT$owner;", name = name, returnType = result,
        parameters = parameters.toList()).uniqueMatch().method

/** <application android:name="..."> as a dotted class name, or null if the app has none. */
private fun applicationClassOf(manifestFile: File): String? {
    val ns = "http://schemas.android.com/apk/res/android"
    val manifest = DocumentBuilderFactory.newInstance().apply { isNamespaceAware = true }
        .newDocumentBuilder().parse(manifestFile)
    val pkg = manifest.documentElement.getAttribute("package")
    val applications = manifest.getElementsByTagName("application")
    if (applications.length == 0) return null
    val name = (applications.item(0) as? Element)?.getAttributeNS(ns, "name").orEmpty()
    return when {
        name.isEmpty() -> null
        name.startsWith(".") -> pkg + name
        '.' !in name -> "$pkg.$name"
        else -> name
    }
}

private fun launcherActivityOf(manifestFile: File): String? {
    val ns = "http://schemas.android.com/apk/res/android"
    val manifest = DocumentBuilderFactory.newInstance().apply { isNamespaceAware = true }
        .newDocumentBuilder().parse(manifestFile)
    val pkg = manifest.documentElement.getAttribute("package")

    fun qualify(name: String): String? = when {
        name.isEmpty() -> null
        name.startsWith(".") -> pkg + name
        '.' !in name -> "$pkg.$name"
        else -> name
    }

    fun isLauncher(element: Element): Boolean {
        val filters = element.getElementsByTagName("intent-filter")
        for (f in 0 until filters.length) {
            val filter = filters.item(f) as? Element ?: continue
            fun declares(tag: String, value: String): Boolean {
                val nodes = filter.getElementsByTagName(tag)
                for (n in 0 until nodes.length) {
                    val node = nodes.item(n) as? Element ?: continue
                    if (node.getAttributeNS(ns, "name") == value) return true
                }
                return false
            }
            if (declares("action", "android.intent.action.MAIN") &&
                declares("category", "android.intent.category.LAUNCHER")) return true
        }
        return false
    }

    val activities = manifest.getElementsByTagName("activity")
    for (i in 0 until activities.length) {
        val element = activities.item(i) as? Element ?: continue
        if (isLauncher(element)) qualify(element.getAttributeNS(ns, "name"))?.let { return it }
    }
    // An alias name is not a class; its targetActivity is.
    val aliases = manifest.getElementsByTagName("activity-alias")
    for (i in 0 until aliases.length) {
        val element = aliases.item(i) as? Element ?: continue
        if (isLauncher(element)) qualify(element.getAttributeNS(ns, "targetActivity"))?.let { return it }
    }
    return null
}

/**
 * Adds the menu item's English title to res/values/strings.xml and finds the launcher
 * Activity. Unnamed, so it is a dependency only (not listed as a user-selectable patch).
 * The Russian language patch depends on it too: it drops translated keys that are missing
 * from the base strings.xml, so this string must exist before that filter runs.
 */
internal val sleepTimerResourcePatch = resourcePatch {
    dependsOn(originalInput)
    execute {
        if (!get("res/values/strings.xml").isFile)
            throw PatchException("SoundCloud res/values/strings.xml not found")
        document("res/values/strings.xml").use { doc ->
            val strings = doc.getElementsByTagName("string")
            var present = false
            for (i in 0 until strings.length) {
                val element = strings.item(i) as? Element ?: continue
                if (element.getAttribute("name") == STRING_NAME) { present = true; break }
            }
            if (!present) {
                val element = doc.createElement("string")
                element.setAttribute("name", STRING_NAME)
                element.textContent = "Sleep timer"
                doc.documentElement.appendChild(element)
            }
        }
        launcherActivity = launcherActivityOf(get("AndroidManifest.xml"))
        applicationClass = applicationClassOf(get("AndroidManifest.xml"))
    }
}

@Suppress("unused")
val sleepTimerMenuPatch = bytecodePatch(
    name = "Sleep timer in track menu",
    description = "Adds a \"Таймер сна\" item to the track menu. It opens a dialog with 15, 30, 45 and " +
        "60 minute options and pauses playback when the time is up.",
    default = true,
) {
    compatibleWith(soundcloud)
    dependsOn(originalInput, sleepTimerResourcePatch)
    extendWith("extensions/soundcloud.mpe")

    execute {
        // 1a. Track Activities from the very start of the process. Application.onCreate runs in every
        //     process start, unlike LauncherActivity.onCreate, which only runs when the launcher
        //     Activity itself is created (it is skipped on task restore, process restart by the
        //     system, or when the process was started by a service/notification).
        val applicationName = applicationClass
            ?: throw PatchException("SoundCloud <application android:name> not found in AndroidManifest.xml")
        Fingerprint(
            definingClass = "L${applicationName.replace('.', '/')};",
            name = "onCreate",
            returnType = "V",
            parameters = listOf(),
        ).uniqueMatch().method.addInstructions(
            0,
            "invoke-static {p0}, $ENTRY->attachApplication(Landroid/app/Application;)V",
        )

        // 1b. Remember the host Activity: AlertDialog needs an Activity window token.
        val launcher = launcherActivity
            ?: throw PatchException("SoundCloud launcher activity not found in AndroidManifest.xml")
        Fingerprint(
            // Smali descriptors use '/', the manifest uses '.'.
            definingClass = "L${launcher.replace('.', '/')};",
            name = "onCreate",
            returnType = "V",
            parameters = listOf("Landroid/os/Bundle;"),
        ).uniqueMatch().method.addInstructions(
            0,
            "invoke-static {p0}, $ENTRY->attach(Landroid/app/Activity;)V",
        )

        // 2. Create the item, right above "Add to playlist". The list is built by appending in
        //    code order, so an item added earlier is shown higher. TrackBottomSheetDataMapper$from$1$3.a():
        //      ...
        //      invoke-virtual {v9}, Object->getClass()        (no label here)
        //      new-instance v12, TrackMenuItem$AddToPlaylist   <- insert right before this
        //      invoke-direct {v12, v15, v9}, ...
        //      if-nez v19, :cond_11
        //      invoke-static {v12, v13}, CollectionsKt->j0(Object, Collection)ArrayList
        //      move-result-object v13                          <- v13 is the list
        //      :cond_11
        //    (checked against the smali of SoundCloud 2026.11.16-release). v12 is the destination of
        //    that new-instance, so it is free at the insertion point; the list register is taken from
        //    the item's own add call. A plain insertion is only safe where no branch jumps to the
        //    instruction, which holds here; the instruction after the add call is a branch target
        //    (:cond_11), so inserting after the block would be skipped when the item is hidden.
        val mapper = exact("features/bottomsheet/track/TrackBottomSheetDataMapper\$from\$1\$3",
            "a", OBJECT, OBJECT, OBJECT, OBJECT, OBJECT, OBJECT)
        val list = mapper.instructions.toList()
        val anchorIndex = list.withIndex().filter { (_, instruction) ->
            instruction.opcode == Opcode.NEW_INSTANCE &&
                ((instruction as ReferenceInstruction).reference as? TypeReference)?.type == ANCHOR_ITEM
        }.map { it.index }.singleOrNull()
            ?: throw PatchException("SoundCloud track menu anchor item creation changed")

        val freeRegister = (list[anchorIndex] as OneRegisterInstruction).registerA

        // The anchor item's own "add to list" call: element = the new item, second argument = the list.
        var addCallIndex = -1
        for (i in anchorIndex + 1..minOf(anchorIndex + 12, list.lastIndex)) {
            val candidate = list[i]
            val ref = (candidate as? ReferenceInstruction)?.reference as? MethodReference ?: continue
            if (candidate.opcode == Opcode.INVOKE_STATIC && ref.definingClass == KOTLIN_COLLECTIONS &&
                ref.parameterTypes.map { it.toString() } == listOf(OBJECT, COLLECTION) &&
                candidate is FiveRegisterInstruction && candidate.registerC == freeRegister) {
                addCallIndex = i
                break
            }
        }
        if (addCallIndex < 0) throw PatchException("SoundCloud track menu anchor 'add item' call not found")
        val addCall = list[addCallIndex] as FiveRegisterInstruction
        val addRef = (addCall as ReferenceInstruction).reference as MethodReference
        val listRegister = addCall.registerD
        val moveResult = list.getOrNull(addCallIndex + 1)
        if (moveResult == null || moveResult.opcode != Opcode.MOVE_RESULT_OBJECT ||
            (moveResult as OneRegisterInstruction).registerA != listRegister)
            throw PatchException("SoundCloud track menu list register changed")
        if (listRegister > 15 || freeRegister > 15)
            throw PatchException("SoundCloud track menu registers are out of 4-bit range")

        // Same method SoundCloud itself uses to add an item: copied, not hard-coded, because
        // its obfuscated name changes between builds. Parameters are (element, list).
        val addSmali = "${addRef.definingClass}->${addRef.name}" +
            "(${addRef.parameterTypes.joinToString("")})${addRef.returnType}"
        mapper.addInstructions(
            anchorIndex,
            """
                new-instance v$freeRegister, $SLEEP_ITEM
                invoke-direct {v$freeRegister}, $SLEEP_ITEM-><init>()V
                invoke-static {v$freeRegister, v$listRegister}, $addSmali
                move-result-object v$listRegister
            """,
        )

        // 3. Click handling.
        // The clicked TrackMenuItem is stored in Lks/j;->b.
        // Tag 4 dispatches to the TrackBottomSheetFragment menu handler.

        val clickClass = mutableClassDefBy("Lks/j;")

        val handler = clickClass.methods.singleOrNull {
            it.name == "invoke" &&
            it.parameterTypes.isEmpty() &&
            it.returnType.toString() == OBJECT
        } ?: throw PatchException(
            "SoundCloud menu lambda Lks/j;->invoke()Ljava/lang/Object; not found"
        )

        val instructions = handler.instructions.toList()

        fun castType(index: Int): String? {
            val instruction = instructions[index]
            if (instruction.opcode != Opcode.CHECK_CAST) return null
            return ((instruction as? ReferenceInstruction)?.reference as? TypeReference)?.type
        }

        // Find the TrackMenuItem cast in the tag-4 branch.
        
        val hapticType = "Landroidx/compose/ui/hapticfeedback/HapticFeedback;"
        val fragmentType = "${ROOT}features/bottomsheet/track/TrackBottomSheetFragment;"

        val menuCastIndex = instructions.indices.filter { i ->
            castType(i) == MENU_ITEM &&
            i + 4 < instructions.size &&
            instructions[i + 1].opcode == Opcode.IGET_OBJECT &&
            castType(i + 2) == hapticType &&
            instructions[i + 3].opcode == Opcode.IGET_OBJECT &&
            castType(i + 4) == fragmentType
        }.singleOrNull() ?: throw PatchException(
            "Track menu handler branch in Lks/j;->invoke() not found or ambiguous"
        )

        val fragmentCastIndex = menuCastIndex + 4
        

        if (fragmentCastIndex + 1 >= instructions.size)
            throw PatchException("Unexpected end of Lks/j;->invoke()")

        // v1 = TrackMenuItem, v0 = TrackBottomSheetFragment.
        // :goto_12 dismisses the bottom sheet and returns Kotlin Unit.
        handler.addInstructionsWithLabels(
    fragmentCastIndex + 1,
    """
        instance-of v7, v1, $SLEEP_ITEM
        if-eqz v7, :morphe_not_sleep_timer
        invoke-static {}, $ENTRY->open()V
        invoke-virtual {v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialogFragment;->dismissAllowingStateLoss()V
        sget-object v6, Lkotlin/Unit;->a:Lkotlin/Unit;
        return-object v6
    """,
    ExternalLabel(
        "morphe_not_sleep_timer",
        handler.getInstruction(fragmentCastIndex + 1)
    ),
)
        
        
    }
}
