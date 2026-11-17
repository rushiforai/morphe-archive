package app.zdrgon.patches.timemark.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.timemark.shared.Constants.COMPATIBILITY_TIMEMARK
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

private const val EXTENSION = "Lapp/template/extension/timemark/"

/**
 * Timemark — patch settings wiring (internal; pulled in by the
 * "Spoof watermark location" patch, the same way hxreborn's
 * BeReal settings patch backs his feature patches).
 *
 * Merges the bundle extension (app.template.extension.timemark:
 * PatchContext, the OpenStreetMap pin-drop picker, the saved
 * location store, the spoof hook) and wires it into the app with
 * three hooks:
 *
 *  1. PatchContext.attach(Application) at TodayApplication
 *     .onCreate entry — hxreborn's launcher pattern: it stores
 *     the app context and tracks the resumed activity through
 *     ActivityLifecycleCallbacks.
 *  2. A REAL row in Timemark's own settings list: the settings
 *     fragment (Lcom/xhey/xcamera/ui/setting/z0;) builds its
 *     NewSettingItem rows in onViewCreated and copies them into
 *     the adapter's list with an ArrayList.addAll right before
 *     setAdapter; the append call lands immediately after that
 *     addAll, and the extension adds a "Timemark patches" item
 *     (key "morphe_timemark_patches") to both lists. A refresh
 *     call at the fragment's p() (its onResume refresh) keeps
 *     the row's value text (current spoof state) current. No
 *     floating or overlay UI — the row occupies real layout
 *     space in the list, like every stock row.
 *  3. The row's click: settings row clicks are delivered by the
 *     adapter as a synthetic Lbz/i; Function1 whose e0 field
 *     holds the clicked NewSettingItem. Its invoke is hooked at
 *     entry: if the item's key is the patch row's, the patch
 *     settings open (from the clicked view's activity) and the
 *     stock dispatch is skipped by returning Unit; every other
 *     row falls through to the original code untouched.
 *
 * The range-form invoke instructions for hooks 1 and 2 are built
 * as dexlib2 builder instructions with the `this` register
 * computed from each method's register count, so they encode
 * correctly no matter how wide the target method's frame is.
 *
 * The settings screen itself is a full-screen dialog hosted by
 * the settings activity rather than a manifest-registered
 * activity: Timemark's stock binary manifest declares
 * android:extractNativeLibs twice on <application>, the decoded
 * manifest is not well-formed XML, and Morphe's document()-based
 * manifest editing fails on it (SAXParseException, proven in this
 * bundle's v1.79.6 test run). The user flow is hxreborn's either
 * way: settings tab → "Timemark patches" row → picker.
 */
internal val timemarkSettingsPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_TIMEMARK)

    extendWith("extensions/extension.mpe")

    execute {
        // 1. PatchContext.attach(Application) at app start.
        val appMethod = ApplicationOnCreateFingerprint.method
        val appImpl = appMethod.implementation
            ?: throw PatchException("TodayApplication.onCreate has no implementation")
        appImpl.addInstruction(
            0,
            BuilderInstruction3rc(
                Opcode.INVOKE_STATIC_RANGE,
                appImpl.registerCount - 1,
                1,
                ImmutableMethodReference(
                    EXTENSION + "PatchContext;",
                    "attach",
                    listOf("Landroid/app/Application;"),
                    "V"
                )
            )
        )

        // 2a. Append the patch row right after the stock rows are
        // copied into the settings adapter's list.
        val settingsMethod = SettingsOnViewCreatedFingerprint.method
        val settingsImpl = settingsMethod.implementation
            ?: throw PatchException("Settings onViewCreated has no implementation")
        val instructions = settingsImpl.instructions
        var addAllIndex = -1
        for (index in 1 until instructions.size) {
            val instruction = instructions[index]
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            if (reference == null || reference.name != "addAll" ||
                reference.definingClass != "Ljava/util/ArrayList;"
            ) {
                continue
            }
            val previous = (instructions[index - 1] as? ReferenceInstruction)?.reference as? FieldReference
            if (previous != null && previous.definingClass == "Lcom/xhey/xcamera/ui/setting/e;" &&
                previous.name == "n"
            ) {
                addAllIndex = index
                break
            }
        }
        if (addAllIndex < 0) {
            throw PatchException("Could not find the settings adapter list copy (ArrayList.addAll) in onViewCreated")
        }
        settingsImpl.addInstruction(
            addAllIndex + 1,
            BuilderInstruction3rc(
                Opcode.INVOKE_STATIC_RANGE,
                settingsImpl.registerCount - 3,
                1,
                ImmutableMethodReference(
                    EXTENSION + "SettingsRows;",
                    "appendRow",
                    listOf("Ljava/lang/Object;"),
                    "V"
                )
            )
        )

        // 2b. Keep the row's value current on the settings refresh.
        val refreshMethod = SettingsRefreshFingerprint.method
        val refreshImpl = refreshMethod.implementation
            ?: throw PatchException("Settings p() has no implementation")
        refreshImpl.addInstruction(
            0,
            BuilderInstruction3rc(
                Opcode.INVOKE_STATIC_RANGE,
                refreshImpl.registerCount - 1,
                1,
                ImmutableMethodReference(
                    EXTENSION + "SettingsRows;",
                    "refreshRow",
                    listOf("Ljava/lang/Object;"),
                    "V"
                )
            )
        )

        // 3. Open the patch settings when the patch row is clicked.
        // All registers used are v0/v1 scratch plus the parameters
        // (p0 = v14, p1 = v15 in this 16-register method), so every
        // instruction encodes in its 4-bit register fields; the
        // desktop verification reads the block back instruction by
        // instruction.
        SettingsClickFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, Lbz/i;->e0:Ljava/lang/Object;
                instance-of v1, v0, Lcom/xhey/xcamera/data/model/bean/settting/NewSettingItem;
                if-eqz v1, :morphe_timemark_skip
                check-cast v0, Lcom/xhey/xcamera/data/model/bean/settting/NewSettingItem;
                invoke-virtual { v0 }, Lcom/xhey/xcamera/data/model/bean/settting/NewSettingItem;->getKey()Ljava/lang/String;
                move-result-object v0
                const-string v1, "morphe_timemark_patches"
                invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :morphe_timemark_skip
                invoke-static { p1 }, ${EXTENSION}PatchContext;->openSettings(Ljava/lang/Object;)V
                sget-object v0, Lrf0/z;->a:Lrf0/z;
                return-object v0
                :morphe_timemark_skip
            """.trimIndent()
        )
    }
}
