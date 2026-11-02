package patches.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import patches.waze.CatalogCompatibility.COMPATIBILITY_WAZE

private const val PLACES = "Lcom/waze/places/PlacesNativeManager;"
private const val FETCH_RECENTS = "$PLACES->fetchRecentsNTV()[B"
private const val RECENTS_BRIDGE = "uaRecents"

private object RecentPlacesReadFingerprint : Fingerprint(
    definingClass = "Lcom/waze/main_screen/p/a/b/a/o;",
    name = "invoke", parameters = emptyList(), returnType = "Ljava/lang/Object;",
)

/** Forsigh/waze-patches' recent-list suppression, adapted to the moved 5.26 bridge. */
@Suppress("unused")
val wazeHideRecentsPatch = bytecodePatch(
    name = "Hide recent destinations",
    description = "Hides the native recent-destination list. Waze still stores the history; favorites and future events stay available.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    dependsOn(wazeCustomizationPatch)

    execute {
        val reader = RecentPlacesReadFingerprint.method
        val instructions = reader.implementation!!.instructions.toList()
        val at = instructions.indices.singleOrNull {
            (instructions[it] as? ReferenceInstruction)?.reference?.toString() == FETCH_RECENTS
        } ?: throw PatchException("Expected exactly one native recents read in the places bridge")
        val receiver = when (val call = instructions[at]) {
            is FiveRegisterInstruction -> call.registerC
            is RegisterRangeInstruction -> call.startRegister
            else -> throw PatchException("Unexpected recents invocation format")
        }
        val places = mutableClassDefBy(PLACES)
        if (places.methods.any { it.name == RECENTS_BRIDGE }) throw PatchException("Recents bridge already exists")
        places.methods.add(ImmutableMethod(
            PLACES, RECENTS_BRIDGE, emptyList(), "[B", AccessFlags.PUBLIC.value,
            null, null, MutableMethodImplementation(2),
        ).toMutable().apply {
            addInstructions(0, """
                const-string v0, "hideRecents"
                invoke-static { v0 }, $WAZE_CUSTOMIZATION->on(Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :original
                const/4 v0, 0x0
                new-array v0, v0, [B
                return-object v0
                :original
                invoke-virtual { p0 }, $FETCH_RECENTS
                move-result-object v0
                return-object v0
            """)
        })
        // Only replace the recents call, not the merged function's other branches or JNI method.
        reader.replaceInstruction(at, "invoke-virtual/range { v$receiver .. v$receiver }, $PLACES->$RECENTS_BRIDGE()[B")
        declareWazeToggle("hideRecents")
    }
}
