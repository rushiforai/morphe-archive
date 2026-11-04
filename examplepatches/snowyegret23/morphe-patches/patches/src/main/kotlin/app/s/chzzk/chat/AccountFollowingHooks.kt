package app.s.chzzk.chat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.s.chzzk.common.utils.getReference
import app.s.chzzk.common.utils.smaliReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

private const val ACCOUNT_FOLLOWING = "Lapp/s/chzzk/extension/AccountFollowing;"
private const val ACCOUNT_COMMUNITY = "Lcom/navercorp/game/android/community/"

internal fun BytecodePatchContext.addAccountFollowingHooks() {
    fun bridge(name: String, registers: Int, body: String) {
        val owner = mutableClassDefBy(ACCOUNT_FOLLOWING)
        val original = owner.methods.single { it.name == name }
        val replacement = MutableMethod(ImmutableMethod(
            owner.type, original.name, original.parameters, original.returnType, original.accessFlags,
            original.annotations, original.hiddenApiRestrictions,
            ImmutableMethodImplementation(registers, emptyList(), emptyList(), emptyList())
        ))
        replacement.addInstructions(0, body.trimIndent())
        owner.methods.remove(original)
        owner.methods.add(replacement)
    }
    fun getter(owner: String, name: String, type: String) = classDefBy(owner).methods.single { method ->
        method.parameterTypes.isEmpty() && method.returnType == type &&
            method.implementation?.instructions?.count() == 2 &&
            method.implementation?.instructions?.any {
                it.getReference<FieldReference>()?.let { field ->
                    field.definingClass == owner && field.name == name && field.type == type
                } == true
            } == true
    }

    val account = classDefBy("${ACCOUNT_COMMUNITY}core/base/delegate/AccountManagerDelegate${'$'}Companion;")
        .methods.single { it.parameterTypes.isEmpty() && it.returnType == "Z" && AccessFlags.STATIC.isSet(it.accessFlags) }
    val currentUser = classDefBy("${ACCOUNT_COMMUNITY}data/core/cache/current/CurrentUser;")
        .methods.single { it.name == "a" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;" }
    bridge("isLoggedIn", 1, """
        invoke-static {}, ${account.smaliReference}
        move-result v0
        return v0
    """)
    bridge("currentAccount", 1, """
        invoke-static {}, ${currentUser.smaliReference}
        move-result-object v0
        return-object v0
    """)

    val row = "${ACCOUNT_COMMUNITY}data/core/entity/channel/StreamingFollowingChannel;"
    val micro = "${ACCOUNT_COMMUNITY}data/core/entity/channel/StreamingMicroChannelPersonal;"
    val personal = "${ACCOUNT_COMMUNITY}data/core/entity/channel/ChannelPersonalData;"
    val following = "${ACCOUNT_COMMUNITY}data/core/entity/channel/FollowingInfo;"
    val channelGetter = getter(row, "channel", micro)
    val idGetter = getter(micro, "channelId", "Ljava/lang/String;")
    val nameGetter = getter(micro, "channelName", "Ljava/lang/String;")
    val imageGetter = getter(micro, "channelImageUrl", "Ljava/lang/String;")
    val personalGetter = getter(micro, "personalData", personal)
    val followingGetter = getter(personal, "following", following)
    val followingFlag = getter(following, "following", "Z")
    bridge("metadata", 9, """
        instance-of v0, p0, $row
        if-eqz v0, :missing
        check-cast p0, $row
        invoke-virtual {p0}, ${channelGetter.smaliReference}
        move-result-object v0
        if-eqz v0, :missing
        invoke-virtual {v0}, ${idGetter.smaliReference}
        move-result-object v1
        invoke-virtual {v0}, ${nameGetter.smaliReference}
        move-result-object v2
        invoke-virtual {v0}, ${imageGetter.smaliReference}
        move-result-object v3
        const/4 v4, 0x0
        invoke-virtual {v0}, ${personalGetter.smaliReference}
        move-result-object v0
        if-eqz v0, :result
        invoke-virtual {v0}, ${followingGetter.smaliReference}
        move-result-object v0
        if-eqz v0, :result
        invoke-virtual {v0}, ${followingFlag.smaliReference}
        move-result v5
        invoke-static {v5}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;
        move-result-object v4
        :result
        const/4 v5, 0x4
        new-array v0, v5, [Ljava/lang/String;
        const/4 v5, 0x0
        aput-object v1, v0, v5
        const/4 v5, 0x1
        aput-object v2, v0, v5
        const/4 v5, 0x2
        aput-object v3, v0, v5
        const/4 v5, 0x3
        aput-object v4, v0, v5
        return-object v0
        :missing
        const/4 v0, 0x0
        return-object v0
    """)

    val listType = if (packageMetadata.versionName == "1.3.0") {
        "${ACCOUNT_COMMUNITY}data/tv/entity/TvFollowingChannelList;"
    } else {
        "${ACCOUNT_COMMUNITY}data/mobile/entity/following/FollowingChannelList;"
    }
    val mutableGetter = mutableClassDefBy(listType).methods.single { method ->
        method.parameterTypes.isEmpty() && method.returnType == "Ljava/util/List;" &&
            method.implementation?.instructions?.any {
                it.getReference<FieldReference>()?.let { field ->
                    field.definingClass == listType && field.name == "followingList" && field.type == "Ljava/util/List;"
                } == true
            } == true
    }
    val listRead = mutableGetter.implementation!!.instructions.withIndex().single {
        it.value.opcode == Opcode.IGET_OBJECT && it.value.getReference<FieldReference>()?.let { field ->
            field.definingClass == listType && field.name == "followingList"
        } == true
    }
    val register = (listRead.value as OneRegisterInstruction).registerA
    mutableGetter.addInstructions(listRead.index + 1,
        "invoke-static/range {v$register .. v$register}, $ACCOUNT_FOLLOWING->capture(Ljava/util/List;)V")

    val logout = mutableClassDefBy("${ACCOUNT_COMMUNITY}core/feature/util/account/AccountUtils;")
        .methods.single { method ->
            AccessFlags.STATIC.isSet(method.accessFlags) && method.parameterTypes.isEmpty() && method.returnType == "V" &&
                method.implementation?.instructions?.any {
                    it.getReference<StringReference>()?.string == "user_id_hash"
                } == true
        }
    logout.addInstructions(0, "invoke-static {}, $ACCOUNT_FOLLOWING->clear()V")
}
