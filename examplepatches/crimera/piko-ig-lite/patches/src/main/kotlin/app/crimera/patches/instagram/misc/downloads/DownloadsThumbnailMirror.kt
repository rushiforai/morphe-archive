/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.misc.downloads

import app.crimera.bytecode.Block
import app.crimera.bytecode.Target
import app.crimera.bytecode.insertHook
import app.crimera.bytecode.methodReference
import app.crimera.patches.common.requireExactlyOne
import app.crimera.patches.instagram.utils.Constants.DOWNLOAD_DESCRIPTOR
import app.crimera.patches.instagram.utils.replaceBridgeBody
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val STRING_DESCRIPTOR = "Ljava/lang/String;"
private const val MAP_DESCRIPTOR = "Ljava/util/Map;"
private const val LIST_DESCRIPTOR = "Ljava/util/List;"
private const val INPUT_STREAM_DESCRIPTOR = "Ljava/io/InputStream;"
private const val IMAGE_URL_DESCRIPTOR = "Lcom/instagram/common/typedurl/ImageUrl;"
private const val IMAGE_CACHE_KEY_DESCRIPTOR = "Lcom/instagram/common/typedurl/ImageCacheKey;"

/** Log line carried only by the image memory cache's decode-and-add implementation. */
private const val DECODE_ANCHOR = "ImageInfraMemoryCache::decodeAndMaybeAdd"

/** Log line carried only by the image disk cache reader. */
private const val DISK_READ_ANCHOR = "ERROR_CONTENT_ID_NULL_ON_DISK_CACHE_LOOKUP"

private const val THUMBNAIL_MIRROR_DESCRIPTOR = "$DOWNLOAD_DESCRIPTOR/ThumbnailMirror;"
private const val THUMBNAIL_LOADER_DESCRIPTOR = "$DOWNLOAD_DESCRIPTOR/ThumbnailLoader;"
private const val ON_DECODED =
    "$THUMBNAIL_MIRROR_DESCRIPTOR->onDecoded(Landroid/graphics/Bitmap;Ljava/lang/String;Ljava/lang/Object;)V"

private const val MAXIMUM_TRACE_STEPS = 8
private const val MAXIMUM_TYPE_DEPTH = 16

private val MOVE_OBJECT_OPCODES =
    setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)

/** Opcodes that can be the last writer of the register under a data-flow trace. */
private val VALUE_PRODUCING_OPCODES =
    MOVE_OBJECT_OPCODES +
        setOf(
            Opcode.MOVE,
            Opcode.MOVE_FROM16,
            Opcode.MOVE_16,
            Opcode.IGET_OBJECT,
            Opcode.MOVE_RESULT_OBJECT,
            Opcode.CONST_4,
            Opcode.CONST_16,
            Opcode.CONST,
        )

/** One concrete decode facade and the registers its return hook needs. */
private class FacadeCapture(
    val facade: MethodReference,
    val returnIndex: Int,
    val resultRegister: Int,
    val keyRegister: Int,
    val postRegister: Int,
    val postType: String,
)

private class DecodeCapture(
    val bitmapField: FieldReference,
    val facades: List<FacadeCapture>,
)

/** The singleton/interface members one disk read needs, all resolved from the facade reader. */
private class DiskCapture(
    val singletonAccessor: MethodReference,
    val singletonType: String,
    val facadeField: FieldReference,
    val cachesAccessor: MethodReference,
    val cachesInvoke: Opcode,
    val diskKeyAccessor: MethodReference,
    val diskKeyInvoke: Opcode,
    val cacheInterface: String,
    val getWithMetadata: MethodReference,
    val holderType: String,
    val holderField: FieldReference,
    val entryType: String,
    val streamField: FieldReference,
)

/**
 * Installs the instant-thumbnail tiers on top of the resolved cached-bitmap chain:
 *
 * - A typed return hook on every image cache decode facade mirrors the decoded bitmap into
 *   `ThumbnailMirror` under the feed's own `ImageCacheKey` identity string.
 * - `ThumbnailLoader.cacheKeyString`, `igDiskKey`, `igDiskCaches` and `igDiskOpen` are emitted
 *   from the resolved image-cache singleton and disk reader so the loader can also read
 *   Instagram's own disk cache.
 */
context(patchContext: BytecodePatchContext)
internal fun injectThumbnailMirror(chain: CachedBitmapChain) {
    val identityField = resolveImageCacheKeyIdentityField(chain.cacheKeyDescriptor)
    emitDecodeCapture(resolveDecodeCapture(chain, identityField))
    emitDiskBridges(chain, identityField, resolveDiskCapture(chain))
}

/**
 * The identity field of `ImageCacheKey` is the one its `hashCode` reads: that is the field the
 * facade callers load into the decode key parameter, so it identifies a decode without knowing an
 * obfuscated field name.
 */
context(patchContext: BytecodePatchContext)
private fun resolveImageCacheKeyIdentityField(cacheKeyDescriptor: String): FieldReference {
    if (cacheKeyDescriptor != IMAGE_CACHE_KEY_DESCRIPTOR) {
        throw PatchException("Resolved cache key type $cacheKeyDescriptor is not $IMAGE_CACHE_KEY_DESCRIPTOR")
    }
    val classDef =
        patchContext.classDefByOrNull(cacheKeyDescriptor)
            ?: throw PatchException("ImageCacheKey class $cacheKeyDescriptor is missing")
    val hashCode =
        requireExactlyOne(
            "ImageCacheKey.hashCode on $cacheKeyDescriptor",
            classDef.methods.filter { method ->
                method.name == "hashCode" && method.returnType == "I" && method.parameterTypes.isEmpty()
            },
        )
    val instructions =
        hashCode.implementation?.instructions?.toList()
            ?: throw PatchException("ImageCacheKey.hashCode has no implementation: $hashCode")
    val identityFields =
        requireExactlyOne(
            "ImageCacheKey identity field",
            instructions.mapNotNull { instruction ->
                if (instruction.opcode != Opcode.IGET_OBJECT) return@mapNotNull null
                instruction.getReference<FieldReference>()?.takeIf { it.type == STRING_DESCRIPTOR }
            }.distinctBy { it.toString() },
        )
    if (identityFields.definingClass != cacheKeyDescriptor) {
        throw PatchException("Identity field $identityFields is not declared on $cacheKeyDescriptor")
    }
    return identityFields
}

/**
 * The decode-and-add method is the one method carrying [DECODE_ANCHOR]; its cache interface owns
 * the matching abstract method, and every concrete method that invokes that interface method is a
 * facade whose return is hooked. A release has one or two facades.
 */
context(patchContext: BytecodePatchContext)
private fun resolveDecodeCapture(chain: CachedBitmapChain, identityField: FieldReference): DecodeCapture {
    val interfaceType = chain.cacheLookup.definingClass.toString()
    val implementation =
        requireExactlyOne(
            "image decode-and-cache method",
            Fingerprint(strings = listOf(DECODE_ANCHOR)).matchAllOrNull().orEmpty(),
        ).originalMethod
    val implementationClass =
        patchContext.classDefByOrNull(implementation.definingClass)
            ?: throw PatchException("Decode method class ${implementation.definingClass} is missing")
    if (interfaceType !in implementationClass.interfaces.map { it.toString() }) {
        throw PatchException("Decode method class ${implementation.definingClass} does not implement $interfaceType")
    }
    if (implementation.returnType.toString() != chain.cacheLookup.returnType.toString()) {
        throw PatchException("Decode method $implementation does not return ${chain.cacheLookup.returnType}")
    }
    if (implementation.returnType.toString() != chain.bitmapField.definingClass) {
        throw PatchException("Bitmap field $chain.bitmapField is not on the decode result ${implementation.returnType}")
    }
    val implementationParameters = implementation.parameterTypes.map { it.toString() }

    val interfaceClass =
        patchContext.classDefByOrNull(interfaceType)
            ?: throw PatchException("Image cache interface $interfaceType is missing")
    val decodeMethod =
        requireExactlyOne(
            "cache interface decode method",
            interfaceClass.methods.filter { method ->
                method.name == implementation.name &&
                    method.returnType == implementation.returnType &&
                    method.parameterTypes.map { it.toString() } == implementationParameters
            },
        )
    val decodeReference = methodReference(decodeMethod.toString())
    val decodeParameters = decodeMethod.parameterTypes.map { it.toString() }

    val facadeMethods = mutableListOf<Method>()
    patchContext.classDefForEach { classDef ->
        classDef.methods.forEach methodLoop@ { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@methodLoop
            val invokesDecode =
                instructions.any { instruction ->
                    isInterfaceInvoke(instruction.opcode) &&
                        instruction.methodRef()?.let { reference ->
                            reference.definingClass == interfaceType && reference.sameSignatureAs(decodeReference)
                        } == true
                }
            if (invokesDecode) facadeMethods += method
        }
    }
    if (facadeMethods.size !in 1..2) {
        throw PatchException("Expected 1..2 image decode facades, found ${facadeMethods.size}: $facadeMethods")
    }

    val facades =
        facadeMethods.map { facade ->
            resolveFacade(facade, decodeReference, decodeParameters, identityField, chain)
        }
    return DecodeCapture(chain.bitmapField, facades)
}

/**
 * Resolves one facade: the decode invoke is followed by the single `move-result-object` the facade
 * returns. The key parameter is the `String` parameter every external call site loads from the
 * `ImageCacheKey` identity field. The postprocessor parameter is the parameter forwarded to the
 * cache interface's postprocessor slot, so transformed decodes can be excluded at runtime.
 */
context(patchContext: BytecodePatchContext)
private fun resolveFacade(
    facade: Method,
    decodeReference: MethodReference,
    decodeParameters: List<String>,
    identityField: FieldReference,
    chain: CachedBitmapChain,
): FacadeCapture {
    val instructions =
        facade.implementation?.instructions?.toList()
            ?: throw PatchException("Decode facade $facade has no implementation")
    val decodeInvokes =
        instructions.withIndex().filter { (_, instruction) ->
            instruction.methodRef()?.let { reference ->
                reference.definingClass == decodeReference.definingClass &&
                    reference.sameSignatureAs(decodeReference)
            } == true
        }
    val decodeInvoke = requireExactlyOne("decode invoke in $facade", decodeInvokes)
    val invoke = decodeInvoke.value

    val afterInvoke = instructions.getOrNull(decodeInvoke.index + 1)
    if (afterInvoke?.opcode != Opcode.MOVE_RESULT_OBJECT) {
        throw PatchException("Decode invoke in $facade is not followed by move-result-object: $afterInvoke")
    }
    val resultRegister = (afterInvoke as OneRegisterInstruction).registerA
    val returnInstruction =
        requireExactlyOne(
            "return-object in $facade",
            instructions.withIndex().filter { (_, instruction) -> instruction.opcode == Opcode.RETURN_OBJECT },
        )
    if ((returnInstruction.value as OneRegisterInstruction).registerA != resultRegister) {
        throw PatchException("Facade $facade does not return the decode result in v$resultRegister")
    }

    val parameters = facade.parameterTypes.map { it.toString() }
    val stringParameters =
        parameters.withIndex().filter { (_, descriptor) -> descriptor == STRING_DESCRIPTOR }.map { it.index }
    val callSites = decodeCallSites(facade)
    if (callSites.isEmpty()) {
        throw PatchException("Decode facade $facade has no call sites to resolve its ImageCacheKey parameter")
    }
    val keyCandidates =
        stringParameters.filter { parameterIndex ->
            callSites.all { (callerInstructions, callIndex) ->
                val argument = callArgumentRegister(callerInstructions[callIndex], 1 + parameterIndex)
                tracesToField(callerInstructions, argument, callIndex, identityField)
            }
        }
    val keyParameter = requireExactlyOne("ImageCacheKey parameter of $facade", keyCandidates)

    val postprocessorType = chain.cacheLookup.parameterTypes.map { it.toString() }.getOrNull(1)
        ?: throw PatchException("Cache lookup ${chain.cacheLookup} has no postprocessor slot")
    val postParameters =
        parameters.withIndex().filter { (_, descriptor) -> descriptor == postprocessorType }.map { it.index }
    val postParameter = requireExactlyOne("postprocessor parameter of $facade", postParameters)
    // The postprocessor is found by its type: 449 put another parameter in front of it in the decode method.
    val decodePostIndex =
        requireExactlyOne(
            "postprocessor parameter of the decode method",
            decodeParameters.withIndex().filter { (_, descriptor) -> descriptor == postprocessorType }.map { it.index },
        )
    val postArgument =
        callArgumentRegister(invoke, 1 + parameterWordOffset(decodeParameters, decodePostIndex))
    val forwardedPost =
        traceArgumentToParameter(facade, instructions, decodeInvoke.index, postArgument)
    if (forwardedPost != postParameter) {
        throw PatchException(
            "Postprocessor parameter $postParameter of $facade is forwarded as $forwardedPost",
        )
    }

    return FacadeCapture(
        facade = methodReference(facade.toString()),
        returnIndex = returnInstruction.index,
        resultRegister = resultRegister,
        keyRegister = facade.registerOfParameterIndex(keyParameter),
        postRegister = facade.registerOfParameterIndex(postParameter),
        postType = parameters[postParameter],
    )
}

/** Every invoke of [facade] anywhere in the app, with the caller's instruction list and index. */
context(patchContext: BytecodePatchContext)
private fun decodeCallSites(facade: Method): List<Pair<List<Instruction>, Int>> {
    val facadeReference = methodReference(facade.toString())
    val callSites = mutableListOf<Pair<List<Instruction>, Int>>()
    patchContext.classDefForEach { classDef ->
        classDef.methods.forEach methodLoop@ { caller ->
            val instructions = caller.implementation?.instructions?.toList() ?: return@methodLoop
            instructions.withIndex().forEach { (index, instruction) ->
                val reference = instruction.methodRef() ?: return@forEach
                if (reference.definingClass == facadeReference.definingClass &&
                    reference.sameSignatureAs(facadeReference)
                ) {
                    callSites += instructions to index
                }
            }
        }
    }
    return callSites
}

/** True when [register] at [beforeIndex] is a move chain ending in a read of [field]. */
private fun tracesToField(
    instructions: List<Instruction>,
    startRegister: Int,
    beforeIndex: Int,
    field: FieldReference,
): Boolean {
    var register = startRegister
    var bound = beforeIndex
    repeat(MAXIMUM_TRACE_STEPS) {
        val producer = findValueProducer(instructions, register, bound) ?: return false
        val instruction = producer.instruction
        if (instruction.opcode == Opcode.IGET_OBJECT) {
            val reference = instruction.getReference<FieldReference>() ?: return false
            return reference.definingClass == field.definingClass &&
                reference.name == field.name &&
                reference.type == field.type
        }
        if (instruction.opcode !in MOVE_OBJECT_OPCODES) return false
        register = (instruction as TwoRegisterInstruction).registerB
        bound = producer.index
    }
    return false
}

/** Resolves the facade parameter a decode-invoke argument register was copied from. */
private fun traceArgumentToParameter(
    facade: Method,
    instructions: List<Instruction>,
    beforeIndex: Int,
    startRegister: Int,
): Int? {
    val parameterStart = facade.parameterRegisterStart()
    var register = startRegister
    var bound = beforeIndex
    if (register >= parameterStart) return parameterIndexAtRegister(facade, register)
    repeat(MAXIMUM_TRACE_STEPS) {
        val producer = findValueProducer(instructions, register, bound) ?: return null
        val instruction = producer.instruction
        if (instruction.opcode !in MOVE_OBJECT_OPCODES) return null
        val source = (instruction as TwoRegisterInstruction).registerB
        if (source >= parameterStart) return parameterIndexAtRegister(facade, source)
        register = source
        bound = producer.index
    }
    return null
}

private class ValueProducer(
    val index: Int,
    val instruction: Instruction,
)

/** The nearest instruction before [beforeIndex] that writes [register] with a value. */
private fun findValueProducer(
    instructions: List<Instruction>,
    register: Int,
    beforeIndex: Int,
): ValueProducer? {
    for (index in beforeIndex - 1 downTo 0) {
        val instruction = instructions[index]
        if (instruction.opcode !in VALUE_PRODUCING_OPCODES) continue
        val written =
            when (instruction) {
                is OneRegisterInstruction -> instruction.registerA
                is TwoRegisterInstruction -> instruction.registerA
                else -> null
            }
        if (written == register) return ValueProducer(index, instruction)
    }
    return null
}

private fun parameterIndexAtRegister(method: Method, register: Int): Int? {
    var current = method.parameterRegisterStart() + if (AccessFlags.STATIC.isSet(method.accessFlags)) 0 else 1
    method.parameterTypes.forEachIndexed { index, type ->
        if (current == register) return index
        current += if (type.toString() == "J" || type.toString() == "D") 2 else 1
    }
    return null
}

private fun parameterWordOffset(parameters: List<String>, parameterIndex: Int): Int {
    var offset = 0
    for (index in 0 until parameterIndex) {
        offset += if (parameters[index] == "J" || parameters[index] == "D") 2 else 1
    }
    return offset
}

/** One argument register of an invoke, counted in words with the receiver as word 0. */
private fun callArgumentRegister(instruction: Instruction, wordIndex: Int): Int {
    var position = 0
    for (register in instruction.registers()) {
        if (position == wordIndex) return register
        position++
    }
    throw PatchException("Invoke $instruction has no argument word $wordIndex")
}

/**
 * Emits the mirror hook in front of the facade's return, after the decode result is in the result
 * register: skip a failed decode, read the bitmap out of the result object, and move the resolved
 * key and postprocessor parameter registers into scratch registers for the mirror call.
 */
context(patchContext: BytecodePatchContext)
private fun emitDecodeCapture(capture: DecodeCapture) {
    capture.facades.forEach { facade ->
        val mutable =
            requireExactlyOne(
                "mutable decode facade ${facade.facade}",
                patchContext.mutableClassDefBy(facade.facade.definingClass).methods.filter {
                    it.sameSignatureAs(facade.facade)
                },
            )
        mutable.insertHook(
            index = facade.returnIndex,
            excludedRegisters = mutable.parameterBlock() + facade.resultRegister,
            relocateBranchTargets = false,
        ) {
            ifEqz(facade.resultRegister, Target.Original)
            val bitmap = scratchRegister()
            iget(bitmap, facade.resultRegister, capture.bitmapField)
            val key = scratchRegister()
            move(key, facade.keyRegister, STRING_DESCRIPTOR)
            val post = scratchRegister()
            move(post, facade.postRegister, facade.postType)
            invokeStatic(methodReference(ON_DECODED), bitmap, key, post)
        }
    }
}

/**
 * The disk reader is the method carrying [DISK_READ_ANCHOR]. Its cache call is the only
 * `(String, Map)` interface call returning a holder with one `Object` field; the entry cast after
 * the holder accessor carries the only `InputStream` subtype field. The reader's cache receiver is
 * produced by the facade type, whose no-arg `List` accessor lists every disk cache instance.
 */
context(patchContext: BytecodePatchContext)
private fun resolveDiskCapture(chain: CachedBitmapChain): DiskCapture {
    val staticRoot =
        requireExactlyOne(
            "static image cache accessor",
            chain.cacheSourceSteps.filterIsInstance<CacheSourceStep.StaticCall>(),
        )
    if (chain.cacheSourceSteps.indexOf(staticRoot) != 0) {
        throw PatchException("Image cache accessor $staticRoot is not the cache chain root")
    }
    if (staticRoot.reference.parameterTypes.isNotEmpty()) {
        throw PatchException("Image cache accessor $staticRoot must take no parameters")
    }
    val singletonType = staticRoot.reference.returnType.toString()

    val reader =
        requireExactlyOne(
            "image disk cache reader",
            Fingerprint(strings = listOf(DISK_READ_ANCHOR)).matchAllOrNull().orEmpty(),
        ).originalMethod
    val readerInstructions =
        reader.implementation?.instructions?.toList()
            ?: throw PatchException("Image disk cache reader has no implementation: $reader")

    val getCalls =
        readerInstructions.withIndex().filter { (_, instruction) ->
            if (!isInterfaceInvoke(instruction.opcode)) return@filter false
            val reference = instruction.methodRef() ?: return@filter false
            val parameters = reference.parameterTypes.map { it.toString() }
            parameters.size == 2 &&
                parameters[0] == STRING_DESCRIPTOR &&
                parameters[1] == MAP_DESCRIPTOR &&
                patchContext.classDefByOrNull(reference.returnType.toString())
                    ?.fields
                    ?.count { it.type == OBJECT_DESCRIPTOR } == 1
        }
    val getCall = requireExactlyOne("disk cache read call in $reader", getCalls)
    val getInvoke = getCall.value
    val getWithMetadata =
        getInvoke.methodRef() ?: throw PatchException("Disk cache read call has no method reference in $reader")
    val holderType = getWithMetadata.returnType.toString()
    val holderClass =
        patchContext.classDefByOrNull(holderType)
            ?: throw PatchException("Disk cache holder $holderType is missing")
    val holderField =
        requireExactlyOne(
            "disk cache holder payload on $holderType",
            holderClass.fields.filter { it.type == OBJECT_DESCRIPTOR },
        )
    val holderAccessor =
        requireExactlyOne(
            "disk cache holder accessor on $holderType",
            holderClass.methods.filter { method ->
                method.parameterTypes.isEmpty() && method.returnType == OBJECT_DESCRIPTOR
            },
        )
    val entryType = resolveEntryType(readerInstructions, holderAccessor)
    val entryClass =
        patchContext.classDefByOrNull(entryType)
            ?: throw PatchException("Disk cache entry $entryType is missing")
    val streamField =
        requireExactlyOne(
            "disk cache stream field on $entryType",
            entryClass.fields.filter { patchContext.extendsInputStream(it.type.toString()) },
        )

    val receiverRegister = callArgumentRegister(getInvoke, 0)
    val receiverProducer =
        findValueProducer(readerInstructions, receiverRegister, getCall.index)
            ?: throw PatchException("Could not resolve the disk cache facade receiver in $reader")
    if (receiverProducer.instruction.opcode != Opcode.MOVE_RESULT_OBJECT) {
        throw PatchException("Disk cache facade receiver in $reader is not a call result")
    }
    val receiverInvoke = readerInstructions.getOrNull(receiverProducer.index - 1)
    val facadeReference =
        receiverInvoke?.methodRef() ?: throw PatchException("Disk cache facade invoke is missing in $reader")
    val facadeType = facadeReference.definingClass.toString()
    val facadeClass =
        patchContext.classDefByOrNull(facadeType)
            ?: throw PatchException("Disk cache facade $facadeType is missing")
    val cachesAccessor =
        requireExactlyOne(
            "disk cache list accessor on $facadeType",
            facadeClass.methods.filter { method ->
                method.parameterTypes.isEmpty() && method.returnType == LIST_DESCRIPTOR
            },
        )

    val singletonClass =
        patchContext.classDefByOrNull(singletonType)
            ?: throw PatchException("Image cache singleton $singletonType is missing")
    val facadeField =
        requireExactlyOne(
            "facade field on $singletonType",
            singletonClass.fields.filter { it.type == facadeType },
        )
    val diskKeyAccessor =
        requireExactlyOne(
            "disk cache key accessor on $singletonType",
            singletonClass.methods.filter { method ->
                AccessFlags.PUBLIC.isSet(method.accessFlags) &&
                    !AccessFlags.STATIC.isSet(method.accessFlags) &&
                    method.parameterTypes.map { it.toString() } == listOf(IMAGE_URL_DESCRIPTOR) &&
                    method.returnType.toString() == STRING_DESCRIPTOR
            },
        )

    return DiskCapture(
        singletonAccessor = staticRoot.reference,
        singletonType = singletonType,
        facadeField = facadeField,
        cachesAccessor = methodReference(cachesAccessor.toString()),
        cachesInvoke = invokeOpcodeFor(facadeClass),
        diskKeyAccessor = methodReference(diskKeyAccessor.toString()),
        diskKeyInvoke = invokeOpcodeFor(singletonClass),
        cacheInterface = getWithMetadata.definingClass.toString(),
        getWithMetadata = getWithMetadata,
        holderType = holderType,
        holderField = holderField,
        entryType = entryType,
        streamField = streamField,
    )
}

/** The entry type is the cast applied to the holder accessor result that carries a stream field. */
context(patchContext: BytecodePatchContext)
private fun resolveEntryType(instructions: List<Instruction>, holderAccessor: Method): String {
    val accessorReference = methodReference(holderAccessor.toString())
    val castTypes = mutableListOf<String>()
    instructions.withIndex().forEach { (index, instruction) ->
        val reference = instruction.methodRef() ?: return@forEach
        if (reference.definingClass != holderAccessor.definingClass ||
            !reference.sameSignatureAs(accessorReference)
        ) {
            return@forEach
        }
        val moveResult = instructions.getOrNull(index + 1) ?: return@forEach
        if (moveResult.opcode != Opcode.MOVE_RESULT_OBJECT) return@forEach
        val moveResultRegister = (moveResult as OneRegisterInstruction).registerA
        val cast = instructions.getOrNull(index + 2) ?: return@forEach
        if (cast.opcode != Opcode.CHECK_CAST ||
            (cast as OneRegisterInstruction).registerA != moveResultRegister
        ) {
            return@forEach
        }
        cast.getReference<TypeReference>()?.type?.let { castTypes += it }
    }

    // Holder reads also unwrap JSON metadata; only the payload with an InputStream field is the entry.
    val entryTypes =
        castTypes.distinct().filter { type ->
            patchContext.classDefByOrNull(type)
                ?.fields
                ?.any { patchContext.extendsInputStream(it.type.toString()) } == true
        }
    return requireExactlyOne("disk cache entry type (casts: $castTypes)", entryTypes)
}

private fun BytecodePatchContext.extendsInputStream(descriptor: String): Boolean {
    if (descriptor == INPUT_STREAM_DESCRIPTOR) return true
    var currentDescriptor = descriptor
    repeat(MAXIMUM_TYPE_DEPTH) {
        val classDef = classDefByOrNull(currentDescriptor) ?: return false
        val superclass = classDef.superclass?.toString() ?: return false
        if (superclass == INPUT_STREAM_DESCRIPTOR) return true
        currentDescriptor = superclass
    }
    return false
}

private fun invokeOpcodeFor(classDef: ClassDef): Opcode =
    if (AccessFlags.INTERFACE.isSet(classDef.accessFlags)) Opcode.INVOKE_INTERFACE else Opcode.INVOKE_VIRTUAL

/** Emits the extension bridges the loader drives Instagram's disk cache through. */
context(patchContext: BytecodePatchContext)
private fun emitDiskBridges(chain: CachedBitmapChain, identityField: FieldReference, capture: DiskCapture) {
    replaceBridgeBody(
        THUMBNAIL_LOADER_DESCRIPTOR,
        "cacheKeyString",
        listOf(OBJECT_DESCRIPTOR),
        STRING_DESCRIPTOR,
        registers = 4,
    ) {
        // v0 key, v1 result, v3 imageUrl.
        val key = 0
        val value = 1
        val imageUrl = 3
        checkCast(imageUrl, chain.cacheKeyGetterOwner)
        invokeVirtual(chain.cacheKeyGetter, imageUrl)
        moveResult(key, OBJECT_DESCRIPTOR)
        checkCast(key, chain.cacheKeyDescriptor)
        iget(value, key, identityField)
        returnObject(value)
    }

    replaceBridgeBody(
        THUMBNAIL_LOADER_DESCRIPTOR,
        "igDiskKey",
        listOf(OBJECT_DESCRIPTOR),
        STRING_DESCRIPTOR,
        registers = 4,
    ) {
        // v0 singleton, v1 result, v3 imageUrl.
        val singleton = 0
        val value = 1
        val imageUrl = 3
        invokeStatic(capture.singletonAccessor)
        moveResult(singleton, capture.singletonType)
        ifEqz(singleton, Target.Local("none"))
        checkCast(imageUrl, IMAGE_URL_DESCRIPTOR)
        invokeByOpcode(capture.diskKeyInvoke, capture.diskKeyAccessor, singleton, imageUrl)
        moveResult(value, STRING_DESCRIPTOR)
        returnObject(value)

        label("none")
        constInt(singleton, 0)
        returnObject(singleton)
    }

    replaceBridgeBody(
        THUMBNAIL_LOADER_DESCRIPTOR,
        "igDiskCaches",
        emptyList(),
        LIST_DESCRIPTOR,
        registers = 3,
    ) {
        // v0 singleton, v1 facade, v2 result.
        val singleton = 0
        val facade = 1
        val caches = 2
        invokeStatic(capture.singletonAccessor)
        moveResult(singleton, capture.singletonType)
        ifEqz(singleton, Target.Local("none"))
        iget(facade, singleton, capture.facadeField)
        ifEqz(facade, Target.Local("none"))
        invokeByOpcode(capture.cachesInvoke, capture.cachesAccessor, facade)
        moveResult(caches, LIST_DESCRIPTOR)
        returnObject(caches)

        label("none")
        constInt(singleton, 0)
        returnObject(singleton)
    }

    replaceBridgeBody(
        THUMBNAIL_LOADER_DESCRIPTOR,
        "igDiskOpen",
        listOf(OBJECT_DESCRIPTOR, STRING_DESCRIPTOR, MAP_DESCRIPTOR),
        INPUT_STREAM_DESCRIPTOR,
        registers = 8,
    ) {
        // v0 holder, v1 payload, v2 stream, v5 cache, v6 key, v7 extras.
        val holder = 0
        val payload = 1
        val stream = 2
        val cache = 5
        val key = 6
        val extras = 7
        checkCast(cache, capture.cacheInterface)
        invokeInterface(capture.getWithMetadata, cache, key, extras)
        moveResult(holder, capture.holderType)
        ifEqz(holder, Target.Local("none"))
        iget(payload, holder, capture.holderField)
        ifEqz(payload, Target.Local("none"))
        checkCast(payload, capture.entryType)
        iget(stream, payload, capture.streamField)
        returnObject(stream)

        label("none")
        constInt(holder, 0)
        returnObject(holder)
    }
}

private fun Block.invokeByOpcode(
    opcode: Opcode,
    reference: MethodReference,
    vararg registers: Int,
) {
    when (opcode) {
        Opcode.INVOKE_VIRTUAL -> invokeVirtual(reference, *registers)
        Opcode.INVOKE_INTERFACE -> invokeInterface(reference, *registers)
        Opcode.INVOKE_STATIC -> invokeStatic(reference, *registers)
        else -> throw PatchException("Unsupported disk cache invoke $opcode for $reference")
    }
}
