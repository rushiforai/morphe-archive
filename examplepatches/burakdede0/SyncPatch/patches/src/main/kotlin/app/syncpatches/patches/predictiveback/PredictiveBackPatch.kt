package app.syncpatches.patches.predictiveback

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.syncpatches.patches.shared.Constants
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Node

private const val MAIN_ACTIVITY_CLASS =
    "Lcom/laurencedawson/reddit_sync/ui/activities/MainActivity;"
private const val BASE_ACTIVITY_CLASS =
    "Lcom/laurencedawson/reddit_sync/ui/activities/BaseActivity;"
private const val BASE_MATERIAL_ACTIVITY_CLASS =
    "Lcom/laurencedawson/reddit_sync/ui/activities/BaseMaterialActivity;"
private const val SYNC_DRAWER_LAYOUT_CLASS =
    "Lcom/laurencedawson/reddit_sync/ui/views/drawer/SyncDrawerLayout;"
private const val OVERLAPPING_PANELS_LAYOUT_CLASS =
    "Lcom/laurencedawson/reddit_sync/discord/OverlappingPanelsLayout;"
private const val EXTENSION_CLASS = Constants.PREDICTIVE_BACK_EXTENSION_CLASS

private const val REGISTER_CALL =
    "invoke-static {p0}, $EXTENSION_CLASS->register(Landroid/app/Activity;)V"
private const val UNREGISTER_CALL =
    "invoke-static {p0}, $EXTENSION_CLASS->unregister(Landroid/app/Activity;)V"
private const val ON_RESUMED_CALL =
    "invoke-static {p0}, $EXTENSION_CLASS->onResumed(Landroid/app/Activity;)V"
private const val ON_DRAWER_ATTACHED_CALL =
    "invoke-static {p0}, $EXTENSION_CLASS->onViewAttached(Landroid/view/View;)V"
private const val ON_PANEL_UPDATE_CALL =
    "invoke-static {p0}, $EXTENSION_CLASS->onOverlayUpdate(Landroid/view/View;)V"
private const val ON_FEED_CHANGED_CALL =
    "invoke-static {p0}, $EXTENSION_CLASS->onFeedChanged(Ljava/lang/Object;)V"

/** Predictive back is broken in these activities and stays opt-out, because
 *  their onKeyUp back handling (image pan / zoom / close behavior) cannot be
 *  replayed safely. */
private val EXCLUDED_ACTIVITIES = setOf(
    "com.laurencedawson.reddit_sync.ui.activities.media.SingleImageActivity",
    "com.laurencedawson.reddit_sync.ui.activities.media.MultiImageActivity",
)

/**
 * Manifest change: Opt MainActivity and every other activity into predictive
 * back.
 *
 * Unlike the manifest of the media viewer activities, which have their own
 * back behavior, MainActivity is deliberately NOT excluded here. MainActivity
 * self-reports through the PredictiveBackFix extension when it has in-app back
 * state (drawer, panel, feed switch) to consume: only then is a back callback
 * registered on its window. At the root screen no callback is registered, so
 * the system plays its native predictive back-to-home transition and finishes
 * the app on commit (see PredictiveBackFix for the tracking hooks below).
 *
 * This resource patch is constructed INLINE inside the bytecode patch's
 * dependsOn(...) (the same pattern HK Morphe Patches uses for inline
 * dependencies), so it is not registered as a separate user-facing patch.
 */
@Suppress("unused")
val predictiveBackExitPatch = bytecodePatch(
    name = "Predictive back gesture",
    description = "Enables predictive back gestures.",
    default = true,
) {
    compatibleWith(
        Constants.SYNC_FREE,
        Constants.SYNC_PRO,
        Constants.SYNC_DEV,
    )

    dependsOn(
        resourcePatch(
            name = "Predictive back gesture (manifest)",
            description = "Manifest part of \"Predictive back gesture\" (internal dependency).",
        ) {
            compatibleWith(
                Constants.SYNC_FREE,
                Constants.SYNC_PRO,
                Constants.SYNC_DEV,
            )

            execute {
                val flag = "android:enableOnBackInvokedCallback"

                document("AndroidManifest.xml").use { document ->
                    fun Node.setFlag(enabled: Boolean) {
                        val existing = attributes.getNamedItem(flag)
                        if (existing == null) {
                            document.createAttributeNS(
                                "http://schemas.android.com/apk/res/android",
                                flag,
                            ).apply { value = enabled.toString() }
                                .let(attributes::setNamedItem)
                        } else {
                            existing.nodeValue = enabled.toString()
                        }
                    }

                    val application = document.getElementsByTagName("application").item(0)
                        ?: throw PatchException("Application element not found in AndroidManifest.xml")
                    application.setFlag(true)

                    var excluded = 0
                    val activities = document.getElementsByTagName("activity")
                    for (i in 0 until activities.length) {
                        val node = activities.item(i)
                        if (node.attributes.getNamedItem("android:name")?.nodeValue in EXCLUDED_ACTIVITIES) {
                            node.setFlag(false)
                            excluded++
                        }
                    }
                    if (excluded != EXCLUDED_ACTIVITIES.size) {
                        throw PatchException(
                            "Expected ${EXCLUDED_ACTIVITIES.size} image viewer activities in the manifest but found $excluded"
                        )
                    }
                }
            }
        }
    )

    extendWith("extensions/predictiveback.mpe")

    execute {
        // Patch 1: MainActivity.onCreate - insert PredictiveBackFix.register(this)
        // directly after super.onCreate.
        val mainActivity = mutableClassDefByOrNull(MAIN_ACTIVITY_CLASS)
            ?: throw PatchException("Class $MAIN_ACTIVITY_CLASS not found")

        val onCreate = mainActivity.methods.firstOrNull {
            it.name == "onCreate" &&
                    it.returnType == "V" &&
                    it.parameterTypes == listOf("Landroid/os/Bundle;")
        } ?: throw PatchException("MainActivity.onCreate not found")

        val onCreateImpl = onCreate.implementation!!
        val superCreateIndex = onCreateImpl.instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.INVOKE_SUPER &&
                    (instruction as ReferenceInstruction).reference.let { reference ->
                        reference as MethodReference
                        reference.name == "onCreate" &&
                                reference.parameterTypes == listOf("Landroid/os/Bundle;")
                    }
        }
        if (superCreateIndex < 0) {
            throw PatchException("super.onCreate call not found in MainActivity.onCreate")
        }
        onCreate.addInstructions(superCreateIndex + 1, REGISTER_CALL)

        // Patch 2: BaseActivity.onDestroy - insert PredictiveBackFix.unregister(this)
        // before the teardown. This hook is reached by every activity in the
        // app; the extension ignores calls for activities it is not registered
        // on.
        val baseActivity = mutableClassDefByOrNull(BASE_ACTIVITY_CLASS)
            ?: throw PatchException("Class $BASE_ACTIVITY_CLASS not found")

        val onDestroy = baseActivity.methods.firstOrNull {
            it.name == "onDestroy" && it.returnType == "V" && it.parameterTypes.isEmpty()
        } ?: throw PatchException("BaseActivity.onDestroy not found")

        onDestroy.addInstructions(0, UNREGISTER_CALL)

        // Patch 3: BaseMaterialActivity.onResume - re-evaluate whether the back
        // callback should be registered on every resume (covers app launches
        // and returns from inner activities).
        val baseMaterialActivity = mutableClassDefByOrNull(BASE_MATERIAL_ACTIVITY_CLASS)
            ?: throw PatchException("Class $BASE_MATERIAL_ACTIVITY_CLASS not found")

        val onResume = baseMaterialActivity.methods.firstOrNull {
            it.name == "onResume" && it.returnType == "V" && it.parameterTypes.isEmpty()
        } ?: throw PatchException("BaseMaterialActivity.onResume not found")

        onResume.addInstructions(0, ON_RESUMED_CALL)

        // Patch 4: SyncDrawerLayout.onAttachedToWindow - let the extension
        // attach a drawer state listener, which covers drawer opens by button,
        // menu, and touch drag alike (no other single hook can observe a
        // drawer drag that rolls back to closed).
        val syncDrawerLayout = mutableClassDefByOrNull(SYNC_DRAWER_LAYOUT_CLASS)
            ?: throw PatchException("Class $SYNC_DRAWER_LAYOUT_CLASS not found")

        val drawerAttached = syncDrawerLayout.methods.firstOrNull {
            it.name == "onAttachedToWindow" && it.returnType == "V" && it.parameterTypes.isEmpty()
        } ?: throw PatchException("SyncDrawerLayout.onAttachedToWindow not found")

        drawerAttached.addInstructions(0, ON_DRAWER_ATTACHED_CALL)

        // Patch 5: OverlappingPanelsLayout.w(F,F) - the main choke point of
        // panel state changes (touch drags and programmatic opens alike);
        // injected before every return so the extension sees the post-change
        // state.
        val overlappingPanelsLayout = mutableClassDefByOrNull(OVERLAPPING_PANELS_LAYOUT_CLASS)
            ?: throw PatchException("Class $OVERLAPPING_PANELS_LAYOUT_CLASS not found")

        val panelUpdate = overlappingPanelsLayout.methods.firstOrNull {
            it.name == "w" &&
                    it.returnType == "V" &&
                    it.parameterTypes == listOf("F", "F")
        } ?: throw PatchException("OverlappingPanelsLayout.w(F,F) not found")

        val panelUpdateImpl = panelUpdate.implementation!!
        val returnIndices = panelUpdateImpl.instructions.indices.filter {
            panelUpdateImpl.instructions[it].opcode == Opcode.RETURN_VOID
        }
        if (returnIndices.isEmpty()) {
            throw PatchException("No return instruction found in OverlappingPanelsLayout.w(F,F)")
        }
        for (index in returnIndices.reversed()) {
            panelUpdate.addInstructions(index, ON_PANEL_UPDATE_CALL)
        }

        // Patch 6: VerticalPostsFragment.I3(String) - the single choke point
        // every home feed change goes through in "posts home" mode (chip and
        // menu feed switches, plus the back-press feed reset itself). Firing
        // here lets the extension re-run the decision the moment the home
        // feed changes, so back correctly flips between "reset the feed" and
        // the system's predictive back-to-home exit.
        val postsFragmentClass =
            "Lcom/laurencedawson/reddit_sync/ui/fragments/posts/VerticalPostsFragment;"
        val postsFragment = mutableClassDefByOrNull(postsFragmentClass)
            ?: throw PatchException("Class $postsFragmentClass not found")

        val feedSwitch = postsFragment.methods.firstOrNull {
            it.name == "I3" &&
                    it.returnType == "V" &&
                    it.parameterTypes == listOf("Ljava/lang/String;")
        } ?: throw PatchException("VerticalPostsFragment.I3(String) not found")

        val feedSwitchImpl = feedSwitch.implementation!!
        val feedReturnIndices = feedSwitchImpl.instructions.indices.filter {
            feedSwitchImpl.instructions[it].opcode == Opcode.RETURN_VOID
        }
        if (feedReturnIndices.isEmpty()) {
            throw PatchException("No return instruction found in VerticalPostsFragment.I3(String)")
        }
        for (index in feedReturnIndices.reversed()) {
            feedSwitch.addInstructions(index, ON_FEED_CHANGED_CALL)
        }
    }
}
