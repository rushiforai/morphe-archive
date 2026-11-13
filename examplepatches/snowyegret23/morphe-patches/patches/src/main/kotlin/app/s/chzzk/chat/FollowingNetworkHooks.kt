package app.s.chzzk.chat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.s.chzzk.common.utils.getReference
import app.s.chzzk.common.utils.parameterTypeNames
import app.s.chzzk.common.utils.smaliReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

private const val FOLLOWING = "Lapp/s/chzzk/extension/LocalFollowing;"
private const val CLIENT = "Lokhttp3/OkHttpClient;"
private const val BUILDER = "Lokhttp3/OkHttpClient${'$'}Builder;"
private const val REQUEST = "Lokhttp3/Request;"
private const val REQUEST_BUILDER = "Lokhttp3/Request${'$'}Builder;"
private const val CALL = "Lokhttp3/Call;"
private const val RESPONSE = "Lokhttp3/Response;"
private const val BODY = "Lokhttp3/ResponseBody;"
private const val HEADERS = "Lokhttp3/Headers;"
private const val SOURCE = "Lokio/BufferedSource;"

internal fun BytecodePatchContext.addFollowingNetworkHooks() {
    fun bridge(name: String, registers: Int, body: String) {
        val owner = mutableClassDefBy(FOLLOWING)
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

    val cookieType = "Lokhttp3/CookieJar;"
    val cookieField = classDefBy(BUILDER).fields.single { it.type == cookieType }
    val noCookies = classDefBy(cookieType).fields.single {
        it.type == cookieType && AccessFlags.STATIC.isSet(it.accessFlags)
    }
    val noCookiesType = "Lokhttp3/CookieJar${'$'}Companion${'$'}NoCookies;"
    check(classDefBy(noCookiesType).interfaces.contains(cookieType))
    val builderConstructor = classDefBy(BUILDER).methods.single { it.name == "<init>" && it.parameterTypes.isEmpty() }
    check(builderConstructor.implementation!!.instructions.any {
        it.opcode == Opcode.SGET_OBJECT && it.getReference<FieldReference>()?.let { field ->
            field.definingClass == cookieType && field.name == noCookies.name && field.type == cookieType
        } == true
    }) { "CHZZK independent HTTP client cookie contract changed" }
    val clientConstructor = classDefBy(CLIENT).methods.single {
        it.name == "<init>" && it.parameterTypeNames == listOf(BUILDER)
    }
    val redirects = listOf("i", "j").map { name ->
        classDefBy(BUILDER).fields.single { it.name == name && it.type == "Z" }
    }
    bridge("createPublicClient", 2, """
        new-instance v0, $BUILDER
        invoke-direct {v0}, ${builderConstructor.smaliReference}
        sget-object v1, ${noCookies.smaliReference}
        iput-object v1, v0, ${cookieField.smaliReference}
        const/4 v1, 0x0
        iput-boolean v1, v0, ${redirects[0].smaliReference}
        iput-boolean v1, v0, ${redirects[1].smaliReference}
        new-instance v1, $CLIENT
        invoke-direct {v1, v0}, ${clientConstructor.smaliReference}
        return-object v1
    """)

    val requestBuilderConstructor = classDefBy(REQUEST_BUILDER).methods.single {
        it.name == "<init>" && it.parameterTypes.isEmpty()
    }
    val url = classDefBy(REQUEST_BUILDER).methods.single {
        it.parameterTypeNames == listOf("Ljava/lang/String;") && it.returnType == "V" && it.name != "<init>"
    }
    val requestHeader = classDefBy(REQUEST_BUILDER).methods.single {
        it.name == "c" && it.parameterTypeNames == listOf("Ljava/lang/String;", "Ljava/lang/String;") && it.returnType == "V"
    }
    val requestConstructor = classDefBy(REQUEST).methods.single {
        it.name == "<init>" && it.parameterTypeNames == listOf(REQUEST_BUILDER)
    }
    val newCall = classDefBy(CLIENT).methods.single {
        it.parameterTypeNames == listOf(REQUEST) && it.returnType in setOf(CALL, "Lokhttp3/internal/connection/RealCall;")
    }
    bridge("createPublicCall", 5, """
        check-cast p0, $CLIENT
        new-instance v0, $REQUEST_BUILDER
        invoke-direct {v0}, ${requestBuilderConstructor.smaliReference}
        invoke-virtual {v0, p1}, ${url.smaliReference}
        const-string v1, "User-Agent"
        const-string v2, "CHZZK-S/1.4.7"
        invoke-virtual {v0, v1, v2}, ${requestHeader.smaliReference}
        new-instance v1, $REQUEST
        invoke-direct {v1, v0}, ${requestConstructor.smaliReference}
        invoke-virtual {p0, v1}, ${newCall.smaliReference}
        move-result-object v0
        return-object v0
    """)
    val execute = classDefBy(CALL).methods.single { it.parameterTypes.isEmpty() && it.returnType == RESPONSE }
    val cancel = classDefBy(CALL).methods.single { it.name == "cancel" && it.parameterTypes.isEmpty() && it.returnType == "V" }
    bridge("executePublicCall", 1, """
        check-cast p0, $CALL
        invoke-interface {p0}, ${execute.smaliReference}
        move-result-object p0
        return-object p0
    """)
    bridge("cancelPublicCall", 1, """
        if-eqz p0, :done
        check-cast p0, $CALL
        invoke-interface {p0}, ${cancel.smaliReference}
        :done
        return-void
    """)
    val response = classDefBy(RESPONSE)
    val code = response.fields.single { it.type == "I" }
    val responseHeaders = response.fields.single { it.type == HEADERS }
    val body = response.fields.single { it.type == BODY }
    val header = classDefBy(HEADERS).methods.single {
        it.parameterTypeNames == listOf("Ljava/lang/String;") && it.returnType == "Ljava/lang/String;" && !AccessFlags.STATIC.isSet(it.accessFlags)
    }
    val source = classDefBy(BODY).methods.single { it.parameterTypes.isEmpty() && it.returnType == SOURCE }
    val stream = classDefBy(SOURCE).methods.single { it.parameterTypes.isEmpty() && it.returnType == "Ljava/io/InputStream;" }
    bridge("publicResponseCode", 1, """
        check-cast p0, $RESPONSE
        iget p0, p0, ${code.smaliReference}
        return p0
    """)
    bridge("publicResponseHeader", 3, """
        check-cast p0, $RESPONSE
        iget-object v0, p0, ${responseHeaders.smaliReference}
        invoke-virtual {v0, p1}, ${header.smaliReference}
        move-result-object v0
        return-object v0
    """)
    bridge("publicResponseStream", 1, """
        check-cast p0, $RESPONSE
        iget-object p0, p0, ${body.smaliReference}
        invoke-virtual {p0}, ${source.smaliReference}
        move-result-object p0
        invoke-interface {p0}, ${stream.smaliReference}
        move-result-object p0
        return-object p0
    """)

    if (packageMetadata.versionName !in setOf("1.3.0", "1.4.0")) return
    val activityType = "Lcom/navercorp/game/android/community/tv/ui/TvActivity;"
    val overlayActivity = "Lcom/navercorp/game/android/community/tv/component/activity/OverlayPlayerActivity;"
    val overlayBase = "Lcom/navercorp/game/android/community/core/feature/feature/overlayplayer/component/OverlayPlayerViewModelBase;"
    val overlayData = "Lcom/navercorp/game/android/community/core/feature/feature/overlayplayer/data/OverlayPlayerData${'$'}Data;"
    val rectType = "Lcom/navercorp/game/android/community/core/ui/util/animation/LayoutAnim${'$'}Rect;"
    val factory = classDefBy("${overlayData.removeSuffix(";")}${'$'}Companion;").methods.single {
        AccessFlags.STATIC.isSet(it.accessFlags) && it.parameterTypeNames == listOf("Ljava/lang/String;", rectType, "I") && it.returnType == overlayData
    }
    val viewModel = classDefBy(overlayActivity).methods.single {
        it.parameterTypes.isEmpty() && it.returnType == "Lcom/navercorp/game/android/community/tv/component/activity/OverlayPlayerViewModel;"
    }
    val open = classDefBy(overlayBase).methods.single {
        it.parameterTypeNames == listOf(overlayData, "Z") && it.returnType == "V" && it.name == "j"
    }
    bridge("nativeChannelIntent", 5, """
        new-instance v0, Landroid/content/Intent;
        const-class v1, $activityType
        invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
        const-string v1, "app.s.chzzk.following.channelId"
        invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
        invoke-static {p1}, $FOLLOWING->channelUrl(Ljava/lang/String;)Ljava/lang/String;
        move-result-object v1
        invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
        move-result-object v1
        invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;
        return-object v0
    """)
    bridge("nativeOpenChannel", 5, """
        check-cast p0, $overlayActivity
        const/4 v0, 0x0
        const/4 v1, 0x2
        invoke-static {p1, v0, v1}, ${factory.smaliReference}
        move-result-object v0
        invoke-virtual {p0}, ${viewModel.smaliReference}
        move-result-object v1
        const/4 v2, 0x0
        invoke-virtual {v1, v0, v2}, ${open.smaliReference}
        return-void
    """)
    val activity = mutableClassDefBy(activityType)
    val create = activity.methods.single { it.name == "onCreate" && it.parameterTypeNames == listOf("Landroid/os/Bundle;") }
    check(create.implementation!!.registerCount in 3..16)
    create.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
        .reversed().forEach { (index, _) ->
            create.addInstructions(index, """
                invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
                move-result-object v0
                invoke-static {p0, v0}, $FOLLOWING->receiveChannelIntent(Landroid/app/Activity;Landroid/content/Intent;)Z
            """.trimIndent())
        }
    val newIntent = activity.methods.single { it.name == "J" && it.parameterTypeNames == listOf("Landroid/content/Intent;") }
    check(newIntent.implementation!!.registerCount in 3..16)
    newIntent.addInstructionsWithLabels(0, """
        invoke-static {p0, p1}, $FOLLOWING->receiveChannelIntent(Landroid/app/Activity;Landroid/content/Intent;)Z
        move-result v0
        if-eqz v0, :original_intent
        return-void
    """.trimIndent(), ExternalLabel("original_intent", newIntent.implementation!!.instructions[0]))
}
