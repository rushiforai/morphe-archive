package app.stayfree.patches.sync

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.stayfree.patches.shared.Constants.COMPATIBILITY_STAYFREE
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

@Suppress("unused")
val refreshPairedDevicesPatch = bytecodePatch(
    name = "Refresh paired devices list",
    description = "Fixes Settings > Paired Devices staying empty after a device pairs successfully. " +
        "StayFree reloads the device list and announces it on a flow that nothing observes, while " +
        "the screen waits on a flow that nothing ever updates, so it never recomposes. Announce " +
        "the reload on the flow the screen actually watches.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STAYFREE)

    execute {
        // `Lyl2;->s()` reloads the paired devices out of the Room `Device` table and publishes
        // them for the UI:
        //
        //     devices = db.getDevices()            // sput -> Lyl2;->B0:Ljava/util/List;
        //     deviceListChangedAt.postValue(now)   // sget -> Lyl2;->T:Lu87;
        //
        // Settings > Paired Devices (`Lst9;`, obfuscated) reads the list straight out of the static `B0` and
        // feeds it to `DeviceRegistry.deviceGroups-impl(...)`, but wraps that whole computation in
        // a Compose cache keyed on `Lyl2;->h0:Lu87;` — a *different* flow. Across the entire app:
        //
        //   - `T`  is posted to here and read by nothing.
        //   - `h0` is collected by this screen and eight others, and written nowhere but <clinit>.
        //
        // So the device list is reloaded correctly and the screen is simply never told. It
        // composes once against whatever `B0` held when it was first shown — an empty list on a
        // cold start — and keeps showing that. Restarting the app does not help: the reload still
        // lands after the screen's first composition.
        //
        // This is StayFree's own bug, not something local sync introduces. It stayed invisible
        // because until pairing worked the list was genuinely empty; the only way to see it is to
        // pair successfully and then watch the screen fail to notice.
        //
        // Post to `h0` as well as `T` rather than redirecting `T` to `h0`: `T` is dead in this
        // build, but it is a public field and some path not visible here may yet read it, whereas
        // an extra invalidation on `h0` can only ever cost one recomposition of screens that are
        // already recomputing from `B0`. Those eight other screens read device data too, so
        // waking them on a device-list change is correct for them as well.
        val publish = DeviceListPublishFingerprint.methodOrNull
            ?: throw PatchException("Paired-device list publish method not found")

        // Insert immediately after the existing `T.postValue(timestamp)`, which is where p2 still
        // holds the boxed timestamp — it is reassigned from the suspend sentinel to the new Long
        // two instructions earlier, and is dead from the postValue onwards. Anchoring on that call
        // rather than on the end of the method keeps the insertion away from the `Unit`/return
        // pair that trails it.
        //
        // The method is `.locals 4`, so v0 is free here and the frame needs no widening — which a
        // patch could not do anyway, dexlib2's registerCount being read-only.
        val index = publish.implementation!!.instructions.toList().indexOfFirst { instruction ->
            instruction.opcode == Opcode.SGET_OBJECT &&
                ((instruction as ReferenceInstruction).reference as FieldReference).let {
                    it.definingClass == DEVICE_REPOSITORY && it.name == "T"
                }
        }

        if (index < 0) throw PatchException("Device-list timestamp post not found")

        // +2: past the `sget-object` itself and past the `invoke-virtual` postValue it feeds.
        publish.addInstructions(
            index + 2,
            """
                sget-object v0, $DEVICE_REPOSITORY->h0:$DEVICE_FLOW
                invoke-virtual {v0, p2}, $DEVICE_FLOW_POST->postValue(Ljava/lang/Object;)V
            """,
        )
    }
}
