package io.github.bakwudo.uyu.patches.twitch.channelpoints

import io.github.bakwudo.uyu.patches.twitch.shared.code
import io.github.bakwudo.uyu.patches.twitch.shared.hasStrings
import io.github.bakwudo.uyu.patches.twitch.shared.isInstance
import io.github.bakwudo.uyu.patches.twitch.shared.reference
import io.github.bakwudo.uyu.patches.twitch.shared.references
import io.github.bakwudo.uyu.patches.twitch.shared.uniqueHook

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val MODEL = "Ltv/twitch/android/models/communitypoints/CommunityPointsModel;"
internal const val CHANNEL = "Ltv/twitch/android/models/channel/ChannelInfo;"
internal const val TUID = "Ltv/twitch/android/models/Tuid;"
internal const val CONTENT_MODE = "Ltv/twitch/android/models/ContentMode;"
internal const val RUNTIME = "Ldev/twitchpatches/extension/channelpoints/ChannelPointsRuntime;"
private const val METADATA = "Ltv/twitch/android/shared/one/chat/pub/ChatModeMetadata;"
private const val IVS_PLAYER = "Lcom/amazonaws/ivs/player/MediaPlayer;"

internal data class PointsHooks(
    val provider: ClassDef,
    val claim: Method,
    val getClaim: Method,
    val id: Field,
    val claimChannel: Field,
    val delegate: Field,
    val delegateChannel: Field,
    val update: Method,
    val updateIndex: Int,
    val providerRegister: Int,
    val modelRegister: Int,
)

internal data class PlayerHooks(
    val player: ClassDef,
    val configure: Method,
    val metadataChannel: Method,
    val metadataMode: Method,
    val state: Method,
    val playing: Field,
    val release: Method,
)

internal fun BytecodePatchContext.resolvePointsHooks(): PointsHooks {
    val classes = mutableListOf<ClassDef>().apply { classDefForEach { add(it) } }
    val provider = classes.filter { type -> type.fields.any {
        it.type == MODEL && !AccessFlags.STATIC.isSet(it.accessFlags) && !AccessFlags.FINAL.isSet(it.accessFlags)
    } && type.methods.any { it.isInstance(listOf("Ljava/lang/String;", METADATA), "V") } }
        .uniqueHook("points provider")
    val claim = provider.methods.filter { it.isInstance(listOf("Ljava/lang/String;", METADATA), "V") }
        .uniqueHook("claim method")
    val model = classDefBy(MODEL)
    val getClaim = model.methods.filter { it.name == "getClaim" && it.isInstance(emptyList(), it.returnType) }
        .uniqueHook("claim getter")
    val claimType = classDefBy(getClaim.returnType)
    val id = claimType.publicInstanceFields("Ljava/lang/String;").uniqueHook("claim ID")
    val claimChannel = claimType.publicInstanceFields(CHANNEL).uniqueHook("claim channel")
    val delegateRead = claim.references().filterIsInstance<FieldReference>().filter {
        it.definingClass == provider.type && classDefByOrNull(it.type)?.fields?.any { field -> field.type == CHANNEL } == true
    }.distinct().uniqueHook("claim delegate read")
    val delegate = provider.fields.filter { it.name == delegateRead.name && it.type == delegateRead.type }
        .uniqueHook("claim delegate")
    requirePublic(delegate)
    val delegateChannelRef = claim.references().filterIsInstance<FieldReference>().filter {
        it.definingClass == delegate.type && it.type == CHANNEL
    }.distinct().uniqueHook("current channel read")
    val delegateChannel = classDefBy(delegate.type).fields.filter { it.name == delegateChannelRef.name && it.type == CHANNEL }
        .uniqueHook("current channel field")
    requirePublic(delegateChannel)
    val modelField = provider.fields.filter { it.type == MODEL && !AccessFlags.STATIC.isSet(it.accessFlags) }
        .uniqueHook("model storage")
    val stores = classes.flatMap { type -> type.methods.flatMap { method ->
        method.code().mapIndexedNotNull { index, instruction ->
            val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            if (instruction.opcode == Opcode.IPUT_OBJECT && field?.definingClass == provider.type &&
                field.name == modelField.name && field.type == MODEL && method.name != "<init>") method to index else null
        }
    } }.uniqueHook("model update store")
    val instruction = stores.first.implementation?.instructions?.elementAt(stores.second) as? TwoRegisterInstruction
        ?: throw PatchException("Channel points: model store is not a two-register instruction.")
    if (instruction.registerA !in 0..15 || instruction.registerB !in 0..15) {
        throw PatchException("Channel points: unexpected model/provider registers.")
    }
    val preceding = stores.first.implementation?.instructions?.elementAtOrNull(stores.second - 1)
    if (preceding?.opcode != Opcode.CHECK_CAST ||
        (preceding as? ReferenceInstruction)?.reference.toString() != MODEL) {
        throw PatchException("Channel points: model update lacks the inspected cast/store control flow.")
    }
    return PointsHooks(provider, claim, getClaim, id, claimChannel, delegate, delegateChannel,
        stores.first, stores.second, instruction.registerB, instruction.registerA)
}

internal fun BytecodePatchContext.resolvePlayerHooks(): PlayerHooks {
    val matches = mutableListOf<Pair<ClassDef, Method>>()
    classDefForEach { type ->
        if (type.fields.any { it.type == IVS_PLAYER }) {
            type.methods.filter { it.parameterTypes.size == 2 && it.returnType == "V" && it.hasStrings("player", "channel_id") }
                .forEach { matches.add(type to it) }
        }
    }
    val (player, configure) = matches.uniqueHook("IVS playback configuration")
    if (!configure.isInstance(configure.parameterTypes.map { it.toString() }, "V") ||
        configure.parameterTypes.any { !it.startsWith("L") }) throw PatchException("Channel points: invalid player parameters.")
    val metadata = classDefBy(configure.parameterTypes.last().toString())
    val channel = metadata.methods.filter { it.parameterTypes.isEmpty() && it.returnType == TUID }
        .uniqueHook("playback channel getter")
    val mode = metadata.methods.filter { it.parameterTypes.isEmpty() && it.returnType == CONTENT_MODE }
        .uniqueHook("content-mode getter")
    if (!AccessFlags.PUBLIC.isSet(channel.accessFlags) || !AccessFlags.PUBLIC.isSet(mode.accessFlags)) {
        throw PatchException("Channel points: metadata getters are inaccessible.")
    }
    val stateType = player.methods.filter { it.name == "getState" && it.parameterTypes.isEmpty() }
        .uniqueHook("player state getter").returnType
    val playing = classDefBy(stateType).fields.filter {
        it.name == "PLAYING" && it.type == stateType && AccessFlags.STATIC.isSet(it.accessFlags)
    }.uniqueHook("PLAYING state")
    val state = player.methods.filter { method -> method.isInstance(listOf(stateType), "V") &&
        method.references().filterIsInstance<MethodReference>().any { it.name == "setValue" } }
        .uniqueHook("player state publication")
    val release = player.methods.filter { method -> method.isInstance(emptyList(), "V") &&
        method.references().filterIsInstance<MethodReference>().any {
            it.definingClass == "Lcom/amazonaws/ivs/player/Player;" && it.name == "removeListener" &&
                it.parameterTypes.map { type -> type.toString() } == listOf("Lcom/amazonaws/ivs/player/Player\$Listener;") && it.returnType == "V"
        } }.uniqueHook("IVS player release")
    return PlayerHooks(player, configure, channel, mode, state, playing, release)
}

private fun ClassDef.publicInstanceFields(type: String): List<Field> = fields.filter {
    it.type == type && AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags)
}

private fun requirePublic(field: Field) {
    if (!AccessFlags.PUBLIC.isSet(field.accessFlags) || AccessFlags.STATIC.isSet(field.accessFlags)) {
        throw PatchException("Channel points: inaccessible ${field.name} field.")
    }
}
