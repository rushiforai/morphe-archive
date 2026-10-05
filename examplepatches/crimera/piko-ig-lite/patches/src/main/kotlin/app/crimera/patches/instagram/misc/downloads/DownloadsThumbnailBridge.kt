/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.misc.downloads

import app.crimera.bytecode.Block
import app.crimera.bytecode.Target
import app.crimera.bytecode.fieldReference
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
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val STRING_DESCRIPTOR = "Ljava/lang/String;"
private const val BITMAP_DESCRIPTOR = "Landroid/graphics/Bitmap;"
private const val FLOAT_DESCRIPTOR = "F"
private const val INT_DESCRIPTOR = "I"
private const val SIMPLE_IMAGE_URL_DESCRIPTOR = "Lcom/instagram/common/typedurl/SimpleImageUrl;"
private const val IMAGE_URL_BASE_DESCRIPTOR = "Lcom/instagram/common/typedurl/ImageUrlBase;"
private const val EXTENDED_IMAGE_URL_DESCRIPTOR = "Lcom/instagram/model/mediasize/ExtendedImageUrl;"
private const val THUMBNAIL_LOADER_DESCRIPTOR = "$DOWNLOAD_DESCRIPTOR/ThumbnailLoader;"

/** Log message only the cached-bitmap helper carries. */
private const val CACHED_BITMAP_ERROR_ANCHOR = "Error getting bitmap from cache"

/** Analytics tag of the helper owning the lookup; narrows the error anchor to one method. */
private const val SAVE_AS_STICKER_ANCHOR = "SaveAsStickerHelper"

/**
 * Instagram's "URL string to cached bitmap" helper, the only cheap preview source in an app with
 * no Coil/Glide/Fresco. Obfuscated owners move between releases (`LX/0PoN` on 448, `LX/0jhc` on
 * 449), so the method is anchored by its log strings plus its public shape: static, one `String`,
 * returns `Bitmap`. A cache miss returns null and never starts a load.
 */
private val cachedBitmapLookupFingerprint =
    Fingerprint(
        returnType = BITMAP_DESCRIPTOR,
        parameters = listOf(STRING_DESCRIPTOR),
        strings = listOf(CACHED_BITMAP_ERROR_ANCHOR, SAVE_AS_STICKER_ANCHOR),
        custom = { method, _ -> AccessFlags.STATIC.isSet(method.accessFlags) },
    )

/** One dependency step of the cache receiver, emitted root first. */
internal sealed interface CacheSourceStep {
    class StaticCall(val reference: MethodReference) : CacheSourceStep

    class FieldRead(val field: FieldReference) : CacheSourceStep

    class InstanceCall(val reference: MethodReference, val opcode: Opcode) : CacheSourceStep
}

/**
 * Value of one parameter at the cache lookup call, decoded from the resolved method's register
 * flow. [CacheKey] is the `ImageCacheKey` the bridge produces, [Constant] is a literal (0 = null
 * for reference parameters), [StringParameter] is the URL string that the original method received
 * and that the cache implementation requires to be non-null, [StringLiteral] is a string the original
 * method passes as a constant.
 */
internal sealed interface BjdArgument {
    object CacheKey : BjdArgument

    class Constant(val value: Int) : BjdArgument

    class StringParameter(val descriptor: String) : BjdArgument

    /** A string literal the original method passes, such as the caller tag 449 added to the lookup. */
    class StringLiteral(val value: String) : BjdArgument
}

/** Every reference the object-driven bridge needs, all taken from the resolved lookup's bytecode. */
internal class CachedBitmapChain(
    val lookup: MethodReference,
    val imageUrlFactory: MethodReference,
    val cacheKeyGetter: MethodReference,
    val cacheKeyGetterOwner: String,
    val cacheKeyDescriptor: String,
    val cacheSourceSteps: List<CacheSourceStep>,
    val cacheLookup: MethodReference,
    val bjdArguments: List<BjdArgument>,
    val bitmapField: FieldReference,
)

/**
 * Reuses the resolved cached-bitmap method's own `ImageUrlBase -> ImageCacheKey -> cache interface`
 * machinery so the extension can drive the lookup from the real `ExtendedImageUrl` (which carries
 * width/height) instead of a `SimpleImageUrl` built from a bare URL string (which always has
 * dimensions -1). No obfuscated owner name is hardcoded: every step is read from the resolved
 * method's instructions and asserted exactly once.
 */
context(patchContext: BytecodePatchContext)
private fun resolveCachedBitmapChain(): CachedBitmapChain {
    val lookup =
        requireExactlyOne(
            "Instagram cached bitmap lookup",
            cachedBitmapLookupFingerprint.matchAllOrNull().orEmpty(),
        ).originalMethod
    val instructions =
        lookup.implementation?.instructions?.toList()
            ?: throw PatchException("Instagram cached bitmap lookup has no implementation: $lookup")

    val imageUrlFactory =
        requireExactlyOne(
            "SimpleImageUrl factory in $lookup",
            instructions
                .mapNotNull { instruction ->
                    instruction.methodRef()?.takeIf { reference ->
                        reference.returnType == SIMPLE_IMAGE_URL_DESCRIPTOR &&
                            reference.parameterTypes.map(CharSequence::toString) == listOf(STRING_DESCRIPTOR)
                    }
                }.distinctBy { it.toString() },
        )

    val cacheKeyGetterInstruction =
        requireExactlyOne(
            "ImageCacheKey getter in $lookup",
            instructions.filter { instruction ->
                val reference = instruction.methodRef() ?: return@filter false
                reference.parameterTypes.isEmpty() && reference.returnType == OBJECT_DESCRIPTOR
            },
        )
    val cacheKeyGetter =
        cacheKeyGetterInstruction.methodRef()
            ?: throw PatchException("ImageCacheKey getter has no method reference in $lookup")
    if (cacheKeyGetterInstruction.opcode != Opcode.INVOKE_VIRTUAL &&
        cacheKeyGetterInstruction.opcode != Opcode.INVOKE_INTERFACE
    ) {
        throw PatchException(
            "Unsupported ImageCacheKey getter opcode ${cacheKeyGetterInstruction.opcode} in $lookup",
        )
    }

    val keyGetterIndex = instructions.indexOf(cacheKeyGetterInstruction)
    val keyResultRegister =
        (instructions.getOrNull(keyGetterIndex + 1) as? OneRegisterInstruction)?.registerA
            ?: throw PatchException("ImageCacheKey getter result is not a move-result in $lookup")
    val cacheKeyDescriptor =
        requireExactlyOne(
            "ImageCacheKey cast after the getter in $lookup",
            instructions.mapIndexedNotNull { index, instruction ->
                if (index <= keyGetterIndex || instruction.opcode != Opcode.CHECK_CAST) return@mapIndexedNotNull null
                if ((instruction as? OneRegisterInstruction)?.registerA != keyResultRegister) return@mapIndexedNotNull null
                instruction.getReference<TypeReference>()?.type
            },
        )

    val lookupInvoke =
        requireExactlyOne(
            "cache lookup invoke in $lookup",
            instructions.filter { instruction ->
                val reference = instruction.methodRef() ?: return@filter false
                if (!isInterfaceInvoke(instruction.opcode)) return@filter false
                val parameters = reference.parameterTypes.map(CharSequence::toString)
                // The key, one or more reference slots, then the float and the int. 449 added a second
                // string (a caller tag) to the reference slots.
                parameters.size >= 5 &&
                    parameters[0] == cacheKeyDescriptor &&
                    parameters.subList(1, parameters.size - 2).all(::isReferenceDescriptor) &&
                    parameters[parameters.size - 2] == FLOAT_DESCRIPTOR &&
                    parameters[parameters.size - 1] == INT_DESCRIPTOR &&
                    patchContext.hasSingleBitmapField(reference.returnType.toString())
            },
        )
    val cacheLookup =
        lookupInvoke.methodRef()
            ?: throw PatchException("Cache lookup invoke has no method reference in $lookup")
    val bitmapField =
        requireExactlyOne(
            "bitmap field on ${cacheLookup.returnType}",
            patchContext.classDefByOrNull(cacheLookup.returnType.toString())
                ?.fields
                ?.filter { it.type == BITMAP_DESCRIPTOR }
                .orEmpty(),
        )

    val lookupReceiver =
        lookupInvoke.registers().firstOrNull()
            ?: throw PatchException("Cache lookup invoke ${cacheLookup} has no receiver register in $lookup")
    val lookupInvokeIndex = instructions.indexOf(lookupInvoke)
    val cacheSourceSteps =
        resolveCacheSourceSteps(instructions, lookupInvokeIndex, lookupReceiver)

    val lookupRegisters = lookupInvoke.registers()
    val argumentCount = cacheLookup.parameterTypes.size
    if (lookupRegisters.size != argumentCount + 1) {
        throw PatchException(
            "Cache lookup invoke $cacheLookup must carry a receiver and $argumentCount arguments in $lookup",
        )
    }
    val bjdArguments =
        (0 until argumentCount).map { parameterIndex ->
            resolveBjdArgument(
                instructions,
                lookupInvokeIndex,
                lookupRegisters[1 + parameterIndex],
                keyResultRegister,
                lookup,
            ) ?: throw PatchException(
                "Could not resolve argument $parameterIndex of $cacheLookup from the register flow in $lookup",
            )
        }
    if (bjdArguments[0] !is BjdArgument.CacheKey) {
        throw PatchException("Argument 0 of $cacheLookup is not the ImageCacheKey in $lookup")
    }

    val cacheKeyGetterOwner = cacheKeyGetter.definingClass.toString()
    val ownerAssignable =
        if (patchContext.classDefByOrNull(EXTENDED_IMAGE_URL_DESCRIPTOR) == null) {
            cacheKeyGetterOwner == IMAGE_URL_BASE_DESCRIPTOR
        } else {
            patchContext.isAssignableFrom(EXTENDED_IMAGE_URL_DESCRIPTOR, cacheKeyGetterOwner)
        }
    if (!ownerAssignable) {
        throw PatchException(
            "$EXTENDED_IMAGE_URL_DESCRIPTOR is not assignable to the key getter owner $cacheKeyGetterOwner",
        )
    }

    return CachedBitmapChain(
        lookup = lookup,
        imageUrlFactory = imageUrlFactory,
        cacheKeyGetter = cacheKeyGetter,
        cacheKeyGetterOwner = cacheKeyGetterOwner,
        cacheKeyDescriptor = cacheKeyDescriptor,
        cacheSourceSteps = cacheSourceSteps,
        cacheLookup = cacheLookup,
        bjdArguments = bjdArguments,
        bitmapField = bitmapField,
    )
}

/**
 * Walks the value producers of the cache receiver register back to the static root, so the
 * shape with a static singleton and a field read and the shape with a static factory and an interface
 * call resolve from the same code.
 */
private fun resolveCacheSourceSteps(
    instructions: List<Instruction>,
    lookupInvokeIndex: Int,
    lookupReceiver: Int,
): List<CacheSourceStep> {
    val steps = mutableListOf<CacheSourceStep>()
    var register = lookupReceiver
    var beforeIndex = lookupInvokeIndex

    while (true) {
        val (producerIndex, producer) =
            findValueProducer(instructions, register, beforeIndex)
                ?: throw PatchException(
                    "Could not resolve the producer of cache register v$register before instruction $beforeIndex",
                )

        when (producer.opcode) {
            Opcode.IGET_OBJECT -> {
                val field =
                    producer.getReference<FieldReference>()
                        ?: throw PatchException("iget-object without a field reference in the cache source chain")
                steps += CacheSourceStep.FieldRead(field)
                register = (producer as TwoRegisterInstruction).registerB
                beforeIndex = producerIndex
            }

            Opcode.MOVE_RESULT_OBJECT -> {
                val invoke =
                    instructions.getOrNull(producerIndex - 1)
                        ?: throw PatchException("move-result-object without a preceding invoke in the cache source chain")
                val reference =
                    invoke.methodRef()
                        ?: throw PatchException("Cache source invoke without a method reference")
                if (invoke.opcode == Opcode.INVOKE_STATIC) {
                    if (reference.parameterTypes.isNotEmpty()) {
                        throw PatchException("Cache source root ${reference} must be a no-argument static call")
                    }
                    steps += CacheSourceStep.StaticCall(reference)
                    return steps.reversed()
                }
                if (!isInstanceInvoke(invoke.opcode)) {
                    throw PatchException("Unsupported cache source invoke ${invoke.opcode} for $reference")
                }
                steps += CacheSourceStep.InstanceCall(reference, invoke.opcode)
                register = invoke.registers().firstOrNull()
                    ?: throw PatchException("Cache source invoke $reference has no receiver register")
                beforeIndex = producerIndex - 1
            }

            else -> throw PatchException("Unsupported cache source producer ${producer.opcode} for v$register")
        }
    }
}

private fun findValueProducer(
    instructions: List<Instruction>,
    register: Int,
    beforeIndex: Int,
): Pair<Int, Instruction>? {
    for (index in beforeIndex - 1 downTo 0) {
        val instruction = instructions[index]
        if (instruction.opcode != Opcode.MOVE_RESULT_OBJECT && instruction.opcode != Opcode.IGET_OBJECT) continue
        if (writtenRegister(instruction) == register) return index to instruction
    }
    return null
}

/**
 * Decodes the value the resolved method holds in one lookup-argument register at the call:
 * the key it just produced, a literal (0 = null for reference parameters), or the URL string
 * parameter. Anything else fails closed instead of guessing a value the cache may reject.
 */
private fun resolveBjdArgument(
    instructions: List<Instruction>,
    invokeIndex: Int,
    register: Int,
    keyRegister: Int,
    lookup: Method,
): BjdArgument? {
    for (index in invokeIndex - 1 downTo 0) {
        val instruction = instructions[index]
        if (instruction.opcode !in VALUE_PRODUCING_OPCODES) continue
        if (writtenRegister(instruction) != register) continue
        return when (instruction.opcode) {
            Opcode.MOVE_RESULT_OBJECT ->
                if (register == keyRegister) BjdArgument.CacheKey else null

            Opcode.CONST_4, Opcode.CONST_16 ->
                (instruction as? NarrowLiteralInstruction)?.let { BjdArgument.Constant(it.narrowLiteral) }

            Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO ->
                instruction.getReference<StringReference>()?.let { BjdArgument.StringLiteral(it.string) }

            Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16 -> {
                val source = (instruction as TwoRegisterInstruction).registerB
                val wordOffset = source - lookup.parameterRegisterStart()
                if (wordOffset < 0) return null
                val descriptor = parameterDescriptorAt(lookup, wordOffset) ?: return null
                BjdArgument.StringParameter(descriptor)
            }

            else -> null
        }
    }
    return null
}

private fun writtenRegister(instruction: Instruction): Int? =
    when (instruction) {
        is OneRegisterInstruction -> instruction.registerA
        is TwoRegisterInstruction -> instruction.registerA
        else -> null
    }

/** Opcodes that genuinely write their destination register (branches and casts do not). */
private val VALUE_PRODUCING_OPCODES =
    setOf(
        Opcode.MOVE_RESULT,
        Opcode.MOVE_RESULT_WIDE,
        Opcode.MOVE_RESULT_OBJECT,
        Opcode.CONST_4,
        Opcode.CONST_16,
        Opcode.CONST,
        Opcode.CONST_HIGH16,
        Opcode.CONST_STRING,
        Opcode.CONST_STRING_JUMBO,
        Opcode.MOVE,
        Opcode.MOVE_FROM16,
        Opcode.MOVE_16,
        Opcode.MOVE_OBJECT,
        Opcode.MOVE_OBJECT_FROM16,
        Opcode.MOVE_OBJECT_16,
        Opcode.IGET,
        Opcode.IGET_OBJECT,
        Opcode.IGET_WIDE,
        Opcode.IGET_BOOLEAN,
        Opcode.IGET_BYTE,
        Opcode.IGET_CHAR,
        Opcode.IGET_SHORT,
    )

private fun parameterDescriptorAt(method: Method, wordOffset: Int): String? {
    var offset = wordOffset
    if (!AccessFlags.STATIC.isSet(method.accessFlags)) {
        if (offset == 0) return method.definingClass.toString()
        offset -= 1
    }
    for (type in method.parameterTypes) {
        val descriptor = type.toString()
        if (offset == 0) return descriptor
        offset -= if (descriptor == "J" || descriptor == "D") 2 else 1
    }
    return null
}

private fun Block.emitBjdArgument(
    argument: BjdArgument,
    slot: Int,
    urlParameter: Int,
) {
    when (argument) {
        is BjdArgument.CacheKey ->
            throw PatchException("The ImageCacheKey argument is emitted by the key getter, not as a value")

        is BjdArgument.Constant -> constInt(slot, argument.value)

        is BjdArgument.StringParameter -> {
            if (argument.descriptor != STRING_DESCRIPTOR) {
                throw PatchException("Unsupported lookup string argument type ${argument.descriptor}")
            }
            move(slot, urlParameter, STRING_DESCRIPTOR)
        }

        is BjdArgument.StringLiteral -> constString(slot, argument.value)
    }
}

private fun Block.emitCacheSourceStep(
    step: CacheSourceStep,
    input: Int,
    output: Int,
) {
    when (step) {
        is CacheSourceStep.StaticCall -> {
            invokeStatic(methodReference(step.reference.toString()))
            moveResult(output, step.reference.returnType.toString())
        }

        is CacheSourceStep.FieldRead -> iget(output, input, fieldReference(step.field.toString()))

        is CacheSourceStep.InstanceCall -> {
            val reference = methodReference(step.reference.toString())
            when (step.opcode) {
                Opcode.INVOKE_VIRTUAL -> invokeVirtual(reference, input)
                Opcode.INVOKE_INTERFACE -> invokeInterface(reference, input)
                else -> throw PatchException("Unsupported cache source invoke ${step.opcode} for ${step.reference}")
            }
            moveResult(output, step.reference.returnType.toString())
        }
    }
}

private fun BytecodePatchContext.hasSingleBitmapField(descriptor: String): Boolean {
    val classDef = classDefByOrNull(descriptor) ?: return false
    return classDef.fields.count { it.type == BITMAP_DESCRIPTOR } == 1
}

private fun BytecodePatchContext.isAssignableFrom(fromDescriptor: String, toDescriptor: String): Boolean {
    var current = classDefByOrNull(fromDescriptor)
    while (current != null) {
        if (current.type == toDescriptor) return true
        if (current.interfaces.any { it.toString() == toDescriptor }) return true
        current = current.superclass?.let { classDefByOrNull(it) }
    }
    return false
}

private fun isReferenceDescriptor(descriptor: String): Boolean =
    descriptor.startsWith("L") || descriptor.startsWith("[")

internal fun isInterfaceInvoke(opcode: Opcode): Boolean =
    opcode == Opcode.INVOKE_INTERFACE || opcode == Opcode.INVOKE_INTERFACE_RANGE

private fun isInstanceInvoke(opcode: Opcode): Boolean =
    opcode in
        setOf(
            Opcode.INVOKE_VIRTUAL,
            Opcode.INVOKE_VIRTUAL_RANGE,
            Opcode.INVOKE_INTERFACE,
            Opcode.INVOKE_INTERFACE_RANGE,
            Opcode.INVOKE_DIRECT,
            Opcode.INVOKE_DIRECT_RANGE,
            Opcode.INVOKE_SUPER,
            Opcode.INVOKE_SUPER_RANGE,
        )

/**
 * Emits the extension bridges walk the resolved chain:
 * - `cachedBitmap(String)` keeps Instagram's own helper as the fallback tier.
 * - `cachedBitmap(Object, String)` drives the same cache from the real `ExtendedImageUrl`, whose
 *   `ImageCacheKey` carries the actual width/height instead of -1 dimensions, and replays every
 *   lookup argument (the `String` slot is the URL the cache requires to be non-null).
 * - `cacheKeyDebug(String)` and `cacheKeyDebugObject(Object)` expose the derived keys so a miss
 *   can be compared in logcat.
 *
 * The resolved chain is returned so the thumbnail mirror can reuse the same cache interface and
 * bitmap field instead of resolving them a second time.
 */
context(patchContext: BytecodePatchContext)
internal fun injectCachedBitmapLookup(): CachedBitmapChain {
    val chain = resolveCachedBitmapChain()

    replaceBridgeBody(
        THUMBNAIL_LOADER_DESCRIPTOR,
        "cachedBitmap",
        listOf(STRING_DESCRIPTOR),
        BITMAP_DESCRIPTOR,
        registers = 1,
    ) {
        val url = 0
        invokeStatic(methodReference(chain.lookup.toString()), url)
        moveResult(url, BITMAP_DESCRIPTOR)
        returnObject(url)
    }

    replaceBridgeBody(
        THUMBNAIL_LOADER_DESCRIPTOR,
        "cachedBitmap",
        listOf(OBJECT_DESCRIPTOR, STRING_DESCRIPTOR),
        BITMAP_DESCRIPTOR,
        registers = chain.bjdArguments.size + 7,
    ) {
        // v0/v1: chain scratch, v2: lookup receiver, v3: key, then one register per remaining lookup
        // argument, then the result and the bitmap, then the imageUrl and url parameters.
        val chainFirst = 0
        val receiver = 2
        val key = 3
        val lookupArguments = (1 until chain.bjdArguments.size).map { 3 + it }
        val result = 4 + lookupArguments.size
        val bitmap = result + 1
        val imageUrl = bitmap + 1
        val url = imageUrl + 1

        checkCast(imageUrl, chain.cacheKeyGetterOwner)
        invokeVirtual(methodReference(chain.cacheKeyGetter.toString()), imageUrl)
        moveResult(key, OBJECT_DESCRIPTOR)
        checkCast(key, chain.cacheKeyDescriptor)

        when (chain.cacheSourceSteps.size) {
            1 -> {
                emitCacheSourceStep(chain.cacheSourceSteps[0], -1, receiver)
                ifEqz(receiver, Target.Local("none"))
            }

            2 -> {
                emitCacheSourceStep(chain.cacheSourceSteps[0], -1, chainFirst)
                ifEqz(chainFirst, Target.Local("none"))
                emitCacheSourceStep(chain.cacheSourceSteps[1], chainFirst, receiver)
                ifEqz(receiver, Target.Local("none"))
            }

            else -> throw PatchException(
                "Unsupported cache source chain length ${chain.cacheSourceSteps.size} in ${chain.lookup}",
            )
        }

        // Each remaining argument is replayed from the resolved method's register flow: the
        // postprocessor slot stays null, the String slot is the URL the cache requires, and a caller
        // tag string is replayed as the literal the original method passes.
        lookupArguments.forEachIndexed { index, slot ->
            emitBjdArgument(chain.bjdArguments[index + 1], slot, url)
        }

        invokeInterface(
            methodReference(chain.cacheLookup.toString()),
            receiver,
            key,
            *lookupArguments.toIntArray(),
        )
        moveResult(result, chain.cacheLookup.returnType.toString())
        ifEqz(result, Target.Local("none"))
        iget(bitmap, result, fieldReference(chain.bitmapField.toString()))
        returnObject(bitmap)

        label("none")
        constInt(chainFirst, 0)
        returnObject(chainFirst)
    }

    replaceBridgeBody(
        THUMBNAIL_LOADER_DESCRIPTOR,
        "cacheKeyDebug",
        listOf(STRING_DESCRIPTOR),
        OBJECT_DESCRIPTOR,
        registers = 1,
    ) {
        val url = 0
        invokeStatic(methodReference(chain.imageUrlFactory.toString()), url)
        moveResult(url, SIMPLE_IMAGE_URL_DESCRIPTOR)
        invokeVirtual(methodReference(chain.cacheKeyGetter.toString()), url)
        moveResult(url, OBJECT_DESCRIPTOR)
        returnObject(url)
    }

    replaceBridgeBody(
        THUMBNAIL_LOADER_DESCRIPTOR,
        "cacheKeyDebugObject",
        listOf(OBJECT_DESCRIPTOR),
        OBJECT_DESCRIPTOR,
        registers = 2,
    ) {
        val value = 0
        val imageUrl = 1
        checkCast(imageUrl, chain.cacheKeyGetterOwner)
        invokeVirtual(methodReference(chain.cacheKeyGetter.toString()), imageUrl)
        moveResult(value, OBJECT_DESCRIPTOR)
        returnObject(value)
    }

    return chain
}
