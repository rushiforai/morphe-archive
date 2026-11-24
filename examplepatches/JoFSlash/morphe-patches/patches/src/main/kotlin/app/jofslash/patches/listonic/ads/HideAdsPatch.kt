package app.jofslash.patches.listonic.ads

import app.jofslash.patches.listonic.shared.Constants.AD_COMPANION
import app.jofslash.patches.listonic.shared.Constants.COMPATIBILITY_LISTONIC
import app.jofslash.patches.listonic.shared.methodOf
import app.jofslash.patches.listonic.shared.methodsWhere
import app.jofslash.patches.listonic.shared.requireLocalRegisters
import app.jofslash.patches.listonic.shared.returnEarly
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val AD_COMPANION_CLASS = "$AD_COMPANION/AdCompanion;"
private const val AD_PROVIDER_REGISTRY = "$AD_COMPANION/provider/AdProviderRegistry;"
private const val AD_TYPE = "$AD_COMPANION/data/model/AdType;"
private const val AD_FORMAT = "$AD_COMPANION/data/model/AdFormat;"
private const val AD_UNIT_CONFIG = "$AD_COMPANION/data/model/AdUnitConfig;"
private const val AD_FILTER = "Lapp/jofslash/extension/listonic/AdFilter;"
private const val CONSENT_FLOW_MANAGER = "Lcom/listonic/gdpr/flow/ConsentFlowManager;"

// toString() of the event the ad locks log when a lock is let go ("LockReleased(lockType=PREMIUM)").
// The event class is R8-renamed; its toString keeps the text.
internal object LockReleasedToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("LockReleased(lockType="),
)

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Hides the banners, ads between list items and full-screen ads, and doesn't start the ad " +
            "networks (AppLovin, Google, AdAdapted, Smart and their partners) when the app opens, or ask for ad " +
            "consent. The ads you choose to watch for Broccoli coins still work. Premium and your subscription " +
            "aren't touched.",
    default = true
) {
    category("Ads")
    compatibleWith(COMPATIBILITY_LISTONIC)

    extendWith("extensions/listonic.mpe")

    execute {
        // Every ad slot (banner, ads between list items, full-screen, text ads) asks its config for
        // the ad types to try in order. Hand it only the rewarded ones, so the other slots load
        // nothing and never start an ad network.
        methodOf(AD_UNIT_CONFIG, "getAdStack", emptyList()).apply {
            val returns = implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_OBJECT }
                .map { it.index to (it.value as OneRegisterInstruction).registerA }
            if (returns.isEmpty()) throw PatchException("$AD_UNIT_CONFIG->getAdStack has no return")
            returns.reversed().forEach { (index, register) ->
                addInstructions(
                    index,
                    """
                        invoke-static {v$register}, $AD_FILTER->rewardedOnly(Ljava/util/List;)Ljava/util/List;
                        move-result-object v$register
                    """
                )
            }
        }

        // Listonic's ad layer (AdCompanion) also keeps a set of "locks"; while one covers a slot's ad
        // types, the slot and the space it reserves are hidden, as for Premium. The app
        // engages a PREMIUM lock at start and releases it when the account isn't Premium. The locks
        // class and the lock types are R8-renamed, so they are found through AdCompanion.getLocks().
        val locksClass = methodOf(AD_COMPANION_CLASS, "getLocks", emptyList()).returnType
        val releasedEvent = LockReleasedToStringFingerprint.method.definingClass

        // release(lock) is the one (lock)V method of the locks class that creates the
        // LockReleased event. Keep the PREMIUM lock engaged: return before it is released.
        val release = methodsWhere(locksClass, "release(lock)") { method ->
            method.returnType == "V" && method.parameterTypes.size == 1 &&
                    method.implementation?.instructions?.any { insn ->
                        insn.opcode == Opcode.NEW_INSTANCE &&
                                ((insn as ReferenceInstruction).reference as TypeReference).type == releasedEvent
                    } == true
        }.singleOrNull() ?: throw PatchException("Expected one lock release method in $locksClass")
        val lockClass = release.parameterTypes.single().toString()
        // The lock's only instance field is its type: the enum PREMIUM or REWARDED.
        val lockTypeField = mutableClassDefBy(lockClass).fields.singleOrNull {
            it.accessFlags and 0x8 == 0
        } ?: throw PatchException("Expected one instance field in $lockClass")
        val lockType = "$lockClass->${lockTypeField.name}:${lockTypeField.type}"

        release.requireLocalRegisters(2)
        release.addInstructions(
            0,
            """
                iget-object v0, p1, $lockType
                invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;
                move-result-object v0
                const-string v1, "PREMIUM"
                invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :release
                return-void
                :release
                nop
            """
        )

        // lock.blocks(adType): the PREMIUM lock blocks every ad type, the REWARDED lock only
        // rewarded ads. Let the kept PREMIUM lock leave rewarded ads alone, so the ads you choose to
        // watch for Broccoli coins work as before (the app's own REWARDED lock still
        // decides about them).
        methodsWhere(lockClass, "blocks(AdType)") { method ->
            method.returnType == "Z" && method.parameterTypes.map { it.toString() } == listOf(AD_TYPE)
        }.single().apply {
            requireLocalRegisters(2)
            addInstructions(
                0,
                """
                    iget-object v0, p0, $lockType
                    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;
                    move-result-object v0
                    const-string v1, "PREMIUM"
                    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :other
                    invoke-virtual {p1}, $AD_TYPE->getFormat()$AD_FORMAT
                    move-result-object v0
                    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;
                    move-result-object v0
                    const-string v1, "REWARDED"
                    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                    move-result v0
                    xor-int/lit8 v0, v0, 0x1
                    return v0
                    :other
                    nop
                """
            )
        }

        // The ad consent form ("Listonic asks for your consent ... 223 partners") only serves the ad
        // networks. Skip it when the app shows it on its own: report it as dismissed at once, so the
        // app goes on. Privacy settings can still open it.
        methodOf(CONSENT_FLOW_MANAGER, "showIfNeeded").apply {
            val onDismissed = parameterTypes[1].toString()
            addInstructions(
                0,
                """
                    if-eqz p2, :done
                    invoke-interface {p2}, $onDismissed->invoke()Ljava/lang/Object;
                    :done
                    return-void
                """
            )
        }

        // AdCompanion.initialize() starts every ad network at once, before any ad is asked for (and
        // before the consent form is answered). Skip that; a network only starts if an ad you chose
        // to watch needs it.
        methodOf(AD_PROVIDER_REGISTRY, "initializeEager").returnEarly()
    }
}
