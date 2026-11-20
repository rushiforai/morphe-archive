package app.ahmedyarub.patches.instagram.distractionFree

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import app.morphe.library.instagram.patches.instagramExtensionPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val REELS_FEED_CLASS = "Lapp/ahmedyarub/extension/instagram/ReelsFeed;"
private const val IS_LIVE_HELPER = "morpheIsLiveReel"

/** The Reels feed's data source inserting items at a position, as injected units are. */
private object ReelsInsertItemsFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("I", "Ljava/util/List;"),
    strings = listOf("ClipsStandaloneAdapterDataSource:insertItemsGranular"),
)

private object ReelsIsCardExtensionFingerprint : Fingerprint(
    definingClass = REELS_FEED_CLASS,
    name = "isCard",
)

private object ReelsIsLiveExtensionFingerprint : Fingerprint(
    definingClass = REELS_FEED_CLASS,
    name = "isLive",
)

@Suppress("unused")
val hideReelsCardsPatch = bytecodePatch(
    name = "Hide Reels cards",
    description = "Hides suggested accounts, live videos and the other cards Instagram puts between reels.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)
    dependsOn(instagramExtensionPatch)

    execute {
        val insertItems = ReelsInsertItemsFingerprint.method

        // The Reels item, as both methods cast each element they take.
        val itemClass = insertItems.instructions.first { it.opcode == Opcode.CHECK_CAST }
            .getReference<TypeReference>()!!.type

        // The data source adding a page of items: of its methods taking a list, the one looking up
        // each item's live payload (a static key, then the item's lookup). It was found by its log
        // string until 456 dropped it.
        val addItems = mutableClassDefBy(insertItems.definingClass).methods.filter { method ->
            method.returnType == "V" && method.parameterTypes.map { it.toString() } == listOf("Ljava/util/List;") &&
                method.implementation?.instructions?.toList()?.let { code ->
                    code.withIndex().any { (index, instruction) ->
                        index > 0 && code[index - 1].opcode == Opcode.SGET_OBJECT &&
                            instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                            instruction.getReference<MethodReference>()?.let {
                                it.definingClass == itemClass && it.parameterTypes.size == 1 && it.returnType == "Ljava/lang/Object;"
                            } == true
                    }
                } == true
        }.singleOrNull() ?: throw PatchException("No single method of the Reels data source adds a page of items")

        // Its type, an enum listing what an item is: ORGANIC, AD, MIDCARD, NETEGO_SUGGESTED_USERS, ...
        // Instagram tells cards apart from reels with a static check on that enum; it is the
        // check that compares against SUGGESTED_USERS (the other one tells ads apart).
        val typeField = classDefBy(itemClass).fields.firstOrNull { field ->
            !AccessFlags.STATIC.isSet(field.accessFlags) &&
                classDefByOrNull(field.type)?.let { enum ->
                    enum.superclass == "Ljava/lang/Enum;" && enum.methods.any { method ->
                        method.name == "<clinit>" && method.implementation?.instructions?.any {
                            it.getReference<StringReference>()?.string == "NETEGO_SUGGESTED_USERS"
                        } == true
                    }
                } == true
        } ?: throw PatchException("The Reels item has no item type")
        val typeEnum = classDefBy(typeField.type)
        val suggestedUsers = typeEnum.methods.first { it.name == "<clinit>" }.implementation!!.instructions.toList().let { clinit ->
            val nameIndex = clinit.indexOfFirst { it.getReference<StringReference>()?.string == "SUGGESTED_USERS" }
            clinit.drop(nameIndex).first { it.opcode == Opcode.SPUT_OBJECT }.getReference<FieldReference>()!!
        }
        val isCard = typeEnum.methods.singleOrNull { method ->
            AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "Z" &&
                method.parameterTypes.map { it.toString() } == listOf(typeEnum.type) &&
                method.implementation?.instructions?.any {
                    it.getReference<FieldReference>()?.name == suggestedUsers.name &&
                        it.getReference<FieldReference>()?.definingClass == typeEnum.type
                } == true
        } ?: throw PatchException("No card check on ${typeEnum.type}")

        // Every item carries a payload under the live key; the data source subscribes to an
        // item's broadcast only when the payload's own flag says it is live, read through a
        // lambda of the app's. The same reads are copied into a helper on the data source's
        // class, where that lambda is accessible.
        val addInstructions = addItems.instructions.toList()
        val lookupIndex = addInstructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                instruction.getReference<MethodReference>()?.let {
                    it.definingClass == itemClass && it.parameterTypes.size == 1 && it.returnType == "Ljava/lang/Object;"
                } == true
        }
        if (lookupIndex < 1 || addInstructions[lookupIndex - 1].opcode != Opcode.SGET_OBJECT) {
            throw PatchException("The Reels feed never looks up a live payload")
        }
        val liveLookup = addInstructions[lookupIndex].getReference<MethodReference>()!!
        val liveKey = addInstructions[lookupIndex - 1].getReference<FieldReference>()!!
        fun after(start: Int, predicate: (Int) -> Boolean) =
            (start until addInstructions.size).firstOrNull(predicate)
                ?: throw PatchException("The Reels feed's live check is not as expected")
        val payloadCast = after(lookupIndex) { addInstructions[it].opcode == Opcode.CHECK_CAST }
        val payloadType = addInstructions[payloadCast].getReference<TypeReference>()!!.type
        val flagsRead = after(payloadCast) { addInstructions[it].opcode == Opcode.IGET_OBJECT }
        val flagsField = addInstructions[flagsRead].getReference<FieldReference>()!!
        val lambdaNew = after(flagsRead) { addInstructions[it].opcode == Opcode.NEW_INSTANCE }
        val lambdaArgument = (addInstructions[lambdaNew - 1] as NarrowLiteralInstruction).narrowLiteral
        val lambdaInitIndex = after(lambdaNew) { addInstructions[it].opcode == Opcode.INVOKE_DIRECT }
        val lambdaInit = addInstructions[lambdaInitIndex].getReference<MethodReference>()!!
        // Up to 455 the flags object's own getter took (key, lambda over the payload); from 456 a
        // static helper takes (flags, lambda, key) and the lambda no longer holds the payload.
        val flagRead = after(lambdaInitIndex + 1) {
            (addInstructions[it].opcode == Opcode.INVOKE_INTERFACE || addInstructions[it].opcode == Opcode.INVOKE_STATIC) &&
                addInstructions[it].getReference<MethodReference>()?.returnType == "Ljava/lang/Object;"
        }
        val flagKey = (lambdaInitIndex + 1 until flagRead).map { addInstructions[it] }
            .lastOrNull { it is NarrowLiteralInstruction }?.let { (it as NarrowLiteralInstruction).narrowLiteral }
            ?: throw PatchException("The Reels feed's live flag has no key")
        val flagGetter = addInstructions[flagRead].getReference<MethodReference>()!!
        val flagGetterIsStatic = addInstructions[flagRead].opcode == Opcode.INVOKE_STATIC
        // The lambda takes the payload too when its constructor has room for it.
        val lambdaArguments = if (lambdaInit.parameterTypes.size == 2) "v3, v0, v2" else "v3, v2"
        // v1 holds the flags object, v2 the key, v3 the lambda.
        val flagArguments = (if (flagGetterIsStatic) emptyList() else listOf("v1")) +
            flagGetter.parameterTypes.map { type ->
                when {
                    type.toString() == "I" -> "v2"
                    type.toString().startsWith("Lkotlin/jvm/functions/Function") -> "v3"
                    else -> "v1"
                }
            }
        val flagInvoke = if (flagGetterIsStatic) "invoke-static" else "invoke-interface"

        val dataSource = mutableClassDefBy(addItems.definingClass)
        dataSource.methods.add(
            ImmutableMethod(
                dataSource.type,
                IS_LIVE_HELPER,
                listOf(ImmutableMethodParameter("Ljava/lang/Object;", null, null)),
                "Z",
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                null,
                null,
                MutableMethodImplementation(5),
            ).toMutable().apply {
                addInstructionsWithLabels(
                    0,
                    """
                        check-cast p0, $itemClass
                        sget-object v0, $liveKey
                        invoke-virtual { p0, v0 }, $liveLookup
                        move-result-object v0
                        if-eqz v0, :not_live
                        check-cast v0, $payloadType
                        iget-object v1, v0, $flagsField
                        const v2, $lambdaArgument
                        new-instance v3, ${lambdaInit.definingClass}
                        invoke-direct { $lambdaArguments }, $lambdaInit
                        const v2, $flagKey
                        $flagInvoke { ${flagArguments.joinToString()} }, $flagGetter
                        move-result-object v0
                        if-eqz v0, :not_live
                        check-cast v0, Ljava/lang/Boolean;
                        invoke-virtual { v0 }, Ljava/lang/Boolean;->booleanValue()Z
                        move-result v0
                        return v0
                        :not_live
                        const/4 v0, 0x0
                        return v0
                    """,
                )
            },
        )

        ReelsIsCardExtensionFingerprint.method.addInstructions(
            0,
            """
                check-cast p0, $itemClass
                iget-object p0, p0, $itemClass->${typeField.name}:${typeField.type}
                invoke-static { p0 }, ${typeEnum.type}->${isCard.name}(${typeEnum.type})Z
                move-result p0
                return p0
            """,
        )
        ReelsIsLiveExtensionFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p0 }, ${dataSource.type}->$IS_LIVE_HELPER(Ljava/lang/Object;)Z
                move-result p0
                return p0
            """,
        )

        // Both take their list first thing, so it is filtered on the way in.
        listOf(addItems, insertItems).forEach { method ->
            val list = method.implementation!!.registerCount - 1
            method.addInstructions(
                0,
                """
                    invoke-static/range { v$list .. v$list }, $REELS_FEED_CLASS->filterItems(Ljava/util/List;)Ljava/util/List;
                    move-result-object v$list
                """,
            )
        }
    }
}
