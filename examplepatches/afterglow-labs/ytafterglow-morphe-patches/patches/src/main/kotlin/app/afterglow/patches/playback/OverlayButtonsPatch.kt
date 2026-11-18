package app.afterglow.patches.playback

import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.addFieldGetter
import app.afterglow.patches.shared.addMethod
import app.afterglow.patches.shared.smali
import app.afterglow.patches.video.addPublicMethod
import app.afterglow.patches.tweaks.navigation.shortsPlayerLayerHookPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import app.morphe.patcher.string
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Stock 21.43.523: Locy owns this activity's Larol lock entity and Laske watch
 * facade. Laske.am/aE/aJ are its native mute getter/mute/unmute, including both
 * player architectures. The legacy path reaches Lastx.aV -> aP -> setVolume;
 * Lastx.ax controls skip-silence and must not be used for mute.
 */
internal val overlayButtonsHookPatch = bytecodePatch {
    dependsOn(fullscreenHookPatch, shortsPlayerLayerHookPatch)
    execute {
        val extension = "$EXTENSION_PACKAGE/playback/OverlayButtons;"
        val bridge = "$EXTENSION_PACKAGE/playback/OverlayActionController;"
        val entity = Fingerprint(name = "<clinit>", filters = listOf(
            string("/youtube/app/watch/lock_mode_state_entity_key"))).classDef
        val lockEnum = Fingerprint(name = "<clinit>", filters = listOf(
            string("LOCK_MODE_STATE_ENUM_UNKNOWN"), string("LOCK_MODE_STATE_ENUM_UNLOCKED"),
            string("LOCK_MODE_STATE_ENUM_LOCKED"))).classDef
        val enumCode = lockEnum.methods.single { it.name == "<clinit>" }.implementation!!.instructions.toList()
        fun enumField(name: String): FieldReference {
            val index = enumCode.indexOfFirst {
                ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == name
            }
            require(index >= 0)
            return (enumCode.drop(index).first { it.opcode == Opcode.SPUT_OBJECT } as ReferenceInstruction)
                .reference as FieldReference
        }
        val locked = enumField("LOCK_MODE_STATE_ENUM_LOCKED")
        val unlocked = enumField("LOCK_MODE_STATE_ENUM_UNLOCKED")
        val state = entity.fields.single { it.type == lockEnum.type }
        val setLock = entity.methods.single {
            it.parameterTypes.map { p -> p.toString() } == listOf(lockEnum.type, "Z") && it.returnType == "V"
        }
        require(AccessFlags.PUBLIC.isSet(state.accessFlags) && AccessFlags.PUBLIC.isSet(setLock.accessFlags))
        val create = Fingerprint(name = "<init>", custom = { _, cls ->
            cls.fields.any { it.type == entity.type } && cls.fields.any { it.type == "Landroid/app/Activity;" }
                    && cls.type == "Locy;"
        }).method
        val host = mutableClassDefBy(create.definingClass)
        val activity = host.fields.single { it.type == "Landroid/app/Activity;" }
        val lockOwner = host.fields.single { it.type == entity.type }
        val facade = host.fields.single { it.type == "Laske;" }
        val getMute = Fingerprint(definingClass = facade.type, name = "am", parameters = listOf(), returnType = "Z",
            filters = listOf(fieldAccess(smali = "Lasmi;->b:Z"), fieldAccess(smali = "Lasbj;->w:I"), literal(2))).method
        val mute = Fingerprint(definingClass = facade.type, name = "aE", parameters = listOf(), returnType = "V",
            filters = listOf(methodCall(smali = "Lasmi;-><init>(Z)V"), methodCall(smali = "Lbxnd;->r(ZZ)V"))).method
        val unmute = Fingerprint(definingClass = facade.type, name = "aJ", parameters = listOf(), returnType = "V",
            filters = listOf(methodCall(smali = "Lasmi;-><init>(Z)V"), methodCall(smali = "Lbxnd;->r(ZZ)V"))).method
        val videoId = Fingerprint(definingClass = facade.type, name = "s", parameters = listOf(),
            returnType = "Ljava/lang/String;").method
        for (field in listOf(activity, lockOwner, facade)) require(AccessFlags.PUBLIC.isSet(field.accessFlags))

        host.interfaces.add(bridge)
        host.addFieldGetter("afterglow_overlayActivity", "Landroid/app/Activity;", activity)
        host.addMethod("afterglow_overlayVideoId", "Ljava/lang/String;", 2, """
            iget-object v0, p0, ${facade.smali}
            invoke-virtual { v0 }, ${videoId.smali}
            move-result-object v0
            return-object v0
        """)
        host.addMethod("afterglow_isMuted", "Z", 2, """
            iget-object v0, p0, ${facade.smali}
            invoke-virtual { v0 }, ${getMute.smali}
            move-result v0
            return v0
        """)
        host.addPublicMethod("afterglow_setMuted", listOf("Z"), "V", 3, """
            iget-object v0, p0, ${facade.smali}
            if-eqz p1, :unmute
            invoke-virtual { v0 }, ${mute.smali}
            return-void
            :unmute
            invoke-virtual { v0 }, ${unmute.smali}
            return-void
        """)
        host.addMethod("afterglow_lockState", "I", 2, """
            iget-object v0, p0, ${lockOwner.smali}
            iget-object v0, v0, ${state.smali}
            invoke-virtual { v0 }, ${lockEnum.type}->getNumber()I
            move-result v0
            return v0
        """)
        host.addPublicMethod("afterglow_setLocked", listOf("Z"), "V", 5, """
            iget-object v0, p0, ${lockOwner.smali}
            if-eqz p1, :unlock
            sget-object v1, ${locked.smali}
            goto :apply
            :unlock
            sget-object v1, ${unlocked.smali}
            :apply
            const/4 v2, 0x1
            invoke-virtual { v0, v1, v2 }, ${setLock.smali}
            return-void
        """)
        create.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
            .map { it.index }.reversed().forEach { index ->
                create.addInstructionsAtControlFlowLabel(index,
                    "invoke-static/range { p0 .. p0 }, $extension->setController($bridge)V")
            }

        // Resolve the controls' root, then bind when that root is created. The controls
        // binder itself is lazy: a cold watch can play before the first tap builds it.
        val controls = Fingerprint(returnType = "V", filters = listOf(literal(159962),
            resourceLiteral(ResourceType.ID, "player_control_previous_button_touch_area"),
            resourceLiteral(ResourceType.ID, "player_control_next_button_touch_area"))).method
        val controlHost = mutableClassDefBy(controls.definingClass)
        val root = controls.implementation!!.instructions.filter { it.opcode == Opcode.IGET_OBJECT }
            .mapNotNull { (it as? ReferenceInstruction)?.reference as? FieldReference }
            .filter { it.definingClass == controlHost.type && it.type == "Landroid/widget/FrameLayout;" }
            .distinctBy { it.smali }.single()
        val rootSetup = controlHost.methods.single { method ->
            method.returnType == "V" && method.parameterTypes.isEmpty()
                    && method.implementation?.instructions?.any {
                it.opcode == Opcode.IPUT_OBJECT
                        && ((it as? ReferenceInstruction)?.reference as? FieldReference)?.smali == root.smali
            } == true
        }
        controlHost.addMethod("afterglow_bindOverlayButtons", "V", 2, """
            iget-object v0, p0, ${root.smali}
            invoke-static { v0 }, $extension->bind(Landroid/widget/FrameLayout;)V
            return-void
        """)
        rootSetup.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
            .map { it.index }.reversed().forEach { index ->
                rootSetup.addInstructionsAtControlFlowLabel(index,
                    "invoke-virtual/range { p0 .. p0 }, ${controlHost.type}->afterglow_bindOverlayButtons()V")
            }
        installOverlayModes(controlHost, rootSetup, root)
        println("Afterglow overlay buttons: host=${host.type}; root=${root.smali}; setup=${rootSetup.smali}; mute=${mute.smali}; unmute=${unmute.smali}; lock=${setLock.smali}")
    }
}
