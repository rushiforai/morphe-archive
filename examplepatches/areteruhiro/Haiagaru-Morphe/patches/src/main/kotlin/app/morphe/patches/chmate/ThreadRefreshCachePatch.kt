package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.findFreeRegister
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
    // Preserve the native conditional request when the user disables the
    // expert option. When enabled, skip only these validators; Range/partial
    // DAT requests and the rest of the downloader remain native.
    val targets = listOf(modifiedSince.single(), etagHeader.single()).sortedDescending()
    for (index in targets) {
        val original = method.implementation!!.instructions[index]
        val after = method.implementation!!.instructions.getOrNull(index + 1)
            ?: error("$version DAT validator has no continuation: $index")
        val register = method.findFreeRegister(index)
        val suffix = index.toString()
        method.addInstructionsWithLabels(
            index,
            """
                invoke-static {}, Lapp/morphe/extension/chmate/ThreadRefreshOptions;->skipConditionalHeaders()Z
                move-result v$register
                if-eqz v$register, :haiagaru_keep_validator_$suffix
                goto :haiagaru_skip_validator_$suffix
            """.trimIndent(),
            ExternalLabel("haiagaru_keep_validator_$suffix", original),
            ExternalLabel("haiagaru_skip_validator_$suffix", after),
        )
    }
    println("$version DAT refresh: conditional validators controlled by expert setting; Range requests retained")
}
