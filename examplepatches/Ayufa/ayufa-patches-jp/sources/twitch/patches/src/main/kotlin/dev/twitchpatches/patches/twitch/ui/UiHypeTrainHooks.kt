package dev.twitchpatches.patches.twitch.ui

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import dev.twitchpatches.patches.twitch.reload.nativeReloadMethod
import dev.twitchpatches.patches.twitch.shared.*

private const val HYPE = "Ldev/twitchpatches/extension/ui/UiHypeTrainRuntime;"
private const val STATE = "Ldev/twitchpatches/extension/ui/UiHypeTrainState;"

private class HypeTrainEventFingerprint(label: String) : Fingerprint(
    name = "toString",
    strings = listOf(label),
)

private object HypeTrainHandlerFingerprint : Fingerprint(
    isStatic = false,
    returnType = "V",
    parameters = listOf("Ljava/lang/Object;"),
    strings = listOf("hypetrain"),
)

internal fun BytecodePatchContext.injectUiHypeTrainEvents() {
    val approaching = HypeTrainEventFingerprint("AddApproachingHypeTrain(bannerViewDelegate=").originalClassDef.type
    val active = HypeTrainEventFingerprint("AddHypeTrain(bannerViewDelegate=").originalClassDef.type
    val collapse = HypeTrainEventFingerprint("CollapseHypeTrain(reason=").originalClassDef.type
    val expand = HypeTrainEventFingerprint("ExpandHypeTrain(expandedViewDelegate=").originalClassDef.type
    val level = HypeTrainEventFingerprint("AddHypeTrainLevelUpPill(level=").originalClassDef.type
    val base = classDefBy(active).superclass
    require(listOf(approaching, collapse, expand, level).all { classDefBy(it).superclass == base }) {
        "UI settings: Hype Train event hierarchy changed."
    }
    val handler = HypeTrainHandlerFingerprint.originalMethod
    val refs = handler.references().filterIsInstance<TypeReference>().map { it.type }
    require(refs.containsAll(listOf(approaching, active, expand, collapse, level))) {
        "UI settings: Hype Train event handler references changed."
    }
    val removed = handler.references().filterIsInstance<FieldReference>().filter {
        it.type == it.definingClass && classDefBy(it.type).superclass == base
    }.distinctBy { it.toString() }.uniqueHook("native Hype Train removal event")
    val variants = handler.code().filter { it.opcode == Opcode.INSTANCE_OF }.map {
        ((it as ReferenceInstruction).reference as TypeReference).type
    }.toSet()
    require(variants.size == 7 && variants.all { classDefBy(it).superclass == base }) {
        "UI settings: Hype Train presentation variants changed."
    }
    val kinds = variants.associateWith { when (it) { approaching -> 1; active -> 2; collapse, expand -> 4; else -> 3 } }
    val owner = mutableClassDefBy(handler.definingClass)
    owner.fields.add(ImmutableField(owner.type, "twitchPatchesHypeState", STATE,
        AccessFlags.PUBLIC.value, null, null, null).toMutable())
    val original = owner.methods.single { it.reference == handler.reference }
    val handlerName = original.name
    owner.methods.remove(original)
    original.name = "twitchPatchesHypeEventOriginal"
    owner.methods.add(original)
    val classify = kinds.entries.mapIndexed { index, (type, kind) -> """
        instance-of v0, p1, $type
        if-eqz v0, :next$index
        const/4 v0, $kind
        goto :dispatch
        :next$index
    """ }.joinToString("\n")
    owner.methods.add(nativeReloadMethod(owner.type, handlerName, listOf("Ljava/lang/Object;"), "V", 3, """
        $classify
        const/4 v0, 0x0
        :dispatch
        invoke-static {p0, p1, v0}, $HYPE->accept(Ljava/lang/Object;Ljava/lang/Object;I)V
        return-void
    """))
    val bridge = mutableClassDefBy(HYPE)
    bridge.methods.remove(bridge.methods.single { it.name == "state" })
    bridge.methods.add(nativeReloadMethod(HYPE, "state", listOf("Ljava/lang/Object;"), STATE, 2, """
        check-cast p0, ${owner.type}
        iget-object v0, p0, ${owner.type}->twitchPatchesHypeState:$STATE
        if-nez v0, :ready
        new-instance v0, $STATE
        invoke-direct {v0}, $STATE-><init>()V
        iput-object v0, p0, ${owner.type}->twitchPatchesHypeState:$STATE
        :ready
        return-object v0
    """, static = true))
    val render = bridge.methods.single { it.name == "render" }
    bridge.methods.remove(render)
    bridge.methods.add(nativeReloadMethod(HYPE, "render", listOf("Ljava/lang/Object;", "Ljava/lang/Object;"), "V", 2, """
        check-cast p0, ${owner.type}
        invoke-virtual {p0, p1}, ${original.reference}
        return-void
    """, static = true))
    val remove = bridge.methods.single { it.name == "remove" }
    bridge.methods.remove(remove)
    bridge.methods.add(nativeReloadMethod(HYPE, "remove", listOf("Ljava/lang/Object;"), "V", 2, """
        check-cast p0, ${owner.type}
        sget-object v0, $removed
        invoke-virtual {p0, v0}, ${original.reference}
        return-void
    """, static = true))
}
