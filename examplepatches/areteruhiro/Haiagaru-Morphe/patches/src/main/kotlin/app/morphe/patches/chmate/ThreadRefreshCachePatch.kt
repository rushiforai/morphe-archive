package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/** Keep Range/partial DAT updates but avoid stale conditional 304 responses. */
internal fun BytecodePatchContext.patchThreadRefreshValidators(version: String) {
    val spec = when (version) {
        "0.8.10.191 dev" -> Triple("Lo/getLabel;", "Lo/getCredentials;" to "e", "Lokhttp3/Headers\$IconCompatParcelizer;" to "a")
        "0.8.10.226 dev" -> Triple("Lo/OpenJSSEPlatformCompanion;", "Lo/isAvailable;" to "c", "Lo/zzdA\$IconCompatParcelizer;" to "a")
        "0.8.10.242 dev" -> Triple("Lo/getHostAppName;", "Lo/getDislikeTip;" to "a", "Lo/zzcvq\$read;" to "d")
        else -> return
    }
    // 226 wraps the downloader in a synthetic ([Object])Object lambda, so do not
    // require a BBSUrlInfo parameter here; identify the single request builder
    // carrying If-None-Match within the version-specific network owner instead.
    val methods = mutableClassDefBy(spec.first).methods.filter { method ->
        method.implementation?.instructions?.any { instruction ->
            ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string == "If-None-Match"
        } == true
    }
    check(methods.size == 1) { "$version DAT downloader with ETag changed: ${methods.size}" }
    val method = methods.single()
    val instructions = method.implementation!!.instructions.toList()
    val etagString = instructions.indices.last { index ->
        ((instructions[index] as? ReferenceInstruction)?.reference as? StringReference)?.string == "If-None-Match"
    }
    val modifiedSince = instructions.indices.filter { index ->
        val ref = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == spec.second.first && ref.name == spec.second.second && ref.returnType == "V"
    }
    check(modifiedSince.size == 1 && modifiedSince.single() < etagString) {
        "$version DAT If-Modified-Since call changed: $modifiedSince"
    }
    val etagHeader = instructions.indices.filter { index ->
        val ref = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
        index > etagString && index - etagString <= 16 && ref?.definingClass == spec.third.first &&
            ref.name == spec.third.second && ref.parameterTypes == listOf("Ljava/lang/String;", "Ljava/lang/String;")
    }
    check(etagHeader.size == 1) { "$version DAT If-None-Match call changed: $etagHeader" }
    // Both calls discard their result. NOP preserves all original registers and
    // branches; only the two request validators are omitted.
    for (index in listOf(modifiedSince.single(), etagHeader.single()).sortedDescending())
        method.replaceInstruction(index, "nop")
    println("$version DAT refresh: omit stale conditional validators, keep Range requests")
}
