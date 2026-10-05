package dev.twitchpatches.patches.twitch.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.twitchpatches.patches.twitch.shared.*

private const val RESULT = "Ldev/twitchpatches/extension/ads/TokenResult;"
private const val ACCESS_TOKEN = "Ltv/twitch/android/models/AccessTokenResponse;"
private const val PLATFORM_FIELD = "twitchPatchesPlatform"

internal fun BytecodePatchContext.applyNativeTokens(hooks: NativeTokenContract) = with(hooks) {
    val paramsClass = mutableClassDefBy(params.definingClass)
    if (paramsClass.fields.any { it.name == PLATFORM_FIELD }) throw PatchException("Token platform bridge already exists")
    paramsClass.fields.add(ImmutableField(paramsClass.type, PLATFORM_FIELD, "Ljava/lang/String;",
        AccessFlags.PUBLIC.value, null, null, null).toMutable())
    val platform = createAdMethod(AD_RUNTIME, "platformForNativeParams", listOf(paramsClass.type),
        "Ljava/lang/String;", 1, """
        iget-object v0, p0, ${paramsClass.type}->$PLATFORM_FIELD:Ljava/lang/String;
        if-nez v0, :done
        const-string v0, "android"
        :done
        return-object v0
    """)
    // Apply the platform override to alternate request objects only.
    mutable(serializer).insertBeforeWithLabels(platformIndex + 1, """
        invoke-static/range {v$paramsRegister .. v$paramsRegister}, ${platform.reference}
        move-result-object v$platformRegister
    """)
    val native = mutableClassDefBy(AD_RUNTIME).methods.filter { it.name == "nativeToken" &&
        it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/Object;", "Ljava/lang/String;", "Ljava/lang/String;", RESULT) &&
        AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V"
    }.uniqueHook("extension native token stub")
    mutableClassDefBy(AD_RUNTIME).methods.remove(native)
    createAdMethod(AD_RUNTIME, "nativeToken", listOf("Ljava/lang/Object;", "Ljava/lang/String;", "Ljava/lang/String;", RESULT),
        "V", 12, """
        move-object v0, p0
        check-cast v0, ${service.type}
        new-instance v1, ${params.definingClass}
        sget-object v2, $absent
        const/16 v3, $paramsMask
        invoke-direct {v1, v2, p2, v3}, $params
        invoke-static/range {p2 .. p2}, $AD_RUNTIME->platform(Ljava/lang/String;)Ljava/lang/String;
        move-result-object v2
        iput-object v2, v1, ${paramsClass.type}->$PLATFORM_FIELD:Ljava/lang/String;
        new-instance v2, ${query.definingClass}
        invoke-direct {v2, p1, v1}, $query
        new-instance v3, ${mapper.definingClass}
        const/16 v4, ${mapperArguments[0]}
        iget-object v5, v0, $parser
        const-class v6, ${parser.type}
        const-string v7, "parseStreamAccessTokenResponse"
        const-string v8, "parseStreamAccessTokenResponse(Ltv/twitch/gql/StreamAccessTokenQuery${'$'}Data;)Ltv/twitch/android/models/AccessTokenResponse;"
        const/16 v9, ${mapperArguments[1]}
        const/16 v10, ${mapperArguments[2]}
        invoke-direct/range {v3 .. v10}, $mapper
        iget-object v4, v0, $graphqlField
        const/16 v5, $queryFlags
        invoke-static {v4, v2, v3, v5}, $graphql
        move-result-object v0
        invoke-virtual {v0, p3}, ${subscribe.reference}
        return-void
    """)
    val token = classDefBy(ACCESS_TOKEN)
    val signature = token.methods.filter { it.name == "getSig" && it.isInstance(emptyList(), "Ljava/lang/String;") }
        .uniqueHook("native token signature")
    val value = token.methods.filter { it.name == "getToken" && it.isInstance(emptyList(), "Ljava/lang/String;") }
        .uniqueHook("native token value")
    val callback = mutableClassDefBy(RESULT)
    callback.interfaces.add(subscribe.parameterTypes.single().toString())
    if (callback.methods.any { it.name == subscribed.name }) throw PatchException("Token observer callback name collides")
    val onSubscribe = ImmutableMethod(RESULT, subscribed.name,
        listOf(ImmutableMethodParameter(subscribed.parameterTypes.single().toString(), null, null)), "V",
        AccessFlags.PUBLIC.value, null, null, MutableMethodImplementation(2)).toMutable()
    onSubscribe.addInstructionsWithLabels(0, """
        invoke-virtual {p0, p1}, $RESULT->acceptDisposable(Ljava/lang/Object;)V
        return-void
    """)
    callback.methods.add(onSubscribe)
    replaceResultStub("decode", listOf("Ljava/lang/Object;", RESULT), 3, """
        move-object v0, p0
        instance-of v1, v0, ${result.definingClass}
        if-eqz v1, :failed
        check-cast v0, ${result.definingClass}
        iget-object v0, v0, $result
        instance-of v1, v0, $ACCESS_TOKEN
        if-eqz v1, :failed
        check-cast v0, $ACCESS_TOKEN
        invoke-virtual {v0}, ${signature.reference}
        move-result-object v1
        invoke-virtual {v0}, ${value.reference}
        move-result-object v2
        invoke-virtual {p1, v1, v2}, $RESULT->receive(Ljava/lang/String;Ljava/lang/String;)V
        return-void
        :failed
        invoke-virtual {p1}, $RESULT->fail()V
        return-void
    """)
    replaceResultStub("cancelDisposable", listOf("Ljava/lang/Object;"), 1, """
        instance-of v0, p0, ${dispose.definingClass}
        if-eqz v0, :done
        check-cast p0, ${dispose.definingClass}
        invoke-interface {p0}, ${dispose.reference}
        :done
        return-void
    """)
    val ctor = mutable(constructor)
    ctor.code().withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }
        .asReversed().forEach { ctor.insertAtReturn(it, "invoke-static/range {p0 .. p0}, $AD_RUNTIME->tokenOwner(Ljava/lang/Object;)V") }
}

private fun BytecodePatchContext.replaceResultStub(name: String, parameters: List<String>, locals: Int, body: String) {
    val type = mutableClassDefBy(RESULT)
    val old = type.methods.filter { it.name == name && it.parameterTypes.map { p -> p.toString() } == parameters &&
        AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" }.uniqueHook("extension $name stub")
    type.methods.remove(old)
    createAdMethod(RESULT, name, parameters, "V", locals, body)
}
