package app.lchanc3.patches.jptt.cache

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import com.android.tools.smali.dexlib2.Opcode

/** Fresco's default of 40 MiB for the image disk cache, set in the builder's constructor. */
internal const val DEFAULT_DISK_CACHE_SIZE = 41943040L

internal object DiskCacheConfigBuilderFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/cache/disk/DiskCacheConfig\$Builder;",
    name = "<init>",
    returnType = "V",
    filters = listOf(
        literal(DEFAULT_DISK_CACHE_SIZE),
        fieldAccess(
            definingClass = "this",
            name = "mMaxCacheSize",
            type = "J",
            opcode = Opcode.IPUT_WIDE,
            location = MatchAfterImmediately(),
        ),
    ),
)

/** Fresco's sizes for its cache of encoded images, asked for again every few minutes. */
internal object EncodedMemoryCacheParamsFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/imagepipeline/cache/DefaultEncodedMemoryCacheParamsSupplier;",
    name = "get",
    returnType = "Lcom/facebook/imagepipeline/cache/MemoryCacheParams;",
)
