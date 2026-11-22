package app.ckzombies.patches.compat

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.packageMetadata
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.io.File
import java.nio.file.Files
import java.nio.file.StandardCopyOption

internal const val EMBEDDED_OBB_NAME = "main.310.com.glu.android.zombsniper.obb"
internal const val EMBEDDED_OBB_ASSET = "assets/$EMBEDDED_OBB_NAME"

private const val EMBEDDED_OBB = "Lapp/ckzombies/extension/EmbeddedObb;"
private const val UNCOMPRESSED_JSON = "uncompressed-files.json"

internal object FindGpkFileFingerprint : Fingerprint(
    definingClass = DOWNLOAD_MANAGER,
    name = "findGPKFile",
    returnType = "Ljava/io/File;",
    parameters = emptyList(),
)

internal object ResdlEventFingerprint : Fingerprint(
    definingClass = "Lcom/glu/platform/android/resdl/ResDLNativeCallback;",
    name = "resdlEvent",
    returnType = "I",
    parameters = listOf("I", "I", "[B"),
)

internal object MovieGpkSetDataSourceFingerprint : Fingerprint(
    definingClass = "Lcom/glu/platform/android/GluMovieActivity;",
    name = "setDataSource",
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        methodCall(definingClass = "Ljava/io/FileInputStream;", name = "getFD"),
        methodCall(
            definingClass = "Landroid/media/MediaPlayer;",
            name = "setDataSource",
            parameters = listOf("Ljava/io/FileDescriptor;", "J", "J"),
        ),
    ),
)

/**
 * Copies the NR OBB into the APK as a stored asset and points the engine at it. Unnamed, so it
 * is not a toggle: every visible patch depends on [obbMessagePatch], which depends on this.
 *
 * The OBB is six files end to end (four FGIB CBigFile_v2 sections, two raw 3GPs). Native
 * FileMgr never scans magic; event 100 is the Java size-table prefix, 102 is the slice
 * length. The hooks add the STORED payload offset to events 100 and 101 so CBigFile_v2::Load
 * sees FGIB instead of the zip PK header. Event 102 stays a length.
 *
 * Patching an APK that has no OBB leaves the copy out. The bytecode hooks still run; they
 * no-op when the asset is missing. [obbMessagePatch] is then the leftover folder message,
 * not the path a Morphe 2.4 bundle patch takes.
 */
internal val bundleObbPatch = patch {
    extendWith("extensions/extension.mpe")

    execute {
        pickObb(packageMetadata.obbFiles)?.let(::embedObb)

        val findGpk = FindGpkFileFingerprint.method
        val resdlEvent = ResdlEventFingerprint.method
        val movie = MovieGpkSetDataSourceFingerprint.method
        hookFindGpkFile(findGpk)
        hookResdlEvent(resdlEvent)
        hookMovieOffset(movie)
    }
}

internal fun pickObb(obbFiles: Map<String, File>): File? {
    val byName = obbFiles.entries.firstOrNull {
        it.key.substringAfterLast('/').equals(EMBEDDED_OBB_NAME, ignoreCase = true)
    }?.value
    if (byName != null) return byName
    return obbFiles.entries.firstOrNull { it.key.endsWith(".obb", ignoreCase = true) }?.value
}

internal const val FORCE_RESOURCE_DECODE_PATH = "AndroidManifest.xml"

internal fun embedObb(obb: File) {
    // assets/ is a raw extract. That writes uncompressed-files.json from the original
    // APK. The next patch that touches the manifest (Modern Android, unused
    // permissions, targetSdk) then decodes resources and overwrites that JSON.
    // Marking STORED before the overwrite is why the packed OBB landed DEFLATE:
    // openFd and the zip CD scan both refuse it, so findGPKFile falls through to
    // the empty OBB folder. Touch the manifest first so the decoder's last write
    // happens before we add .obb.
    resourceFile(FORCE_RESOURCE_DECODE_PATH)
    val dest = resourceFile(EMBEDDED_OBB_ASSET, copy = false)
    dest.parentFile?.mkdirs()
    markAssetStored(uncompressedJsonForAsset(dest), EMBEDDED_OBB_ASSET)
    Files.copy(obb.toPath(), dest.toPath(), StandardCopyOption.REPLACE_EXISTING)
}

internal fun uncompressedJsonForAsset(assetFile: File): File {
    val byLayout = jsonBesideRootAssets(assetFile)
    if (byLayout.isFile) return byLayout
    var dir = assetFile.absoluteFile.parentFile
    var hops = 0
    while (dir != null && hops < 4) {
        val json = File(dir, UNCOMPRESSED_JSON)
        if (json.isFile) return json
        dir = dir.parentFile
        hops++
    }
    return byLayout
}

internal fun jsonBesideRootAssets(assetFile: File): File {
    val assetsDir = assetFile.parentFile
        ?: throw PatchException("embedded OBB has no parent directory")
    val rootDir = assetsDir.parentFile
        ?: throw PatchException("embedded OBB is not under the APK root")
    val workingDir = rootDir.parentFile
        ?: throw PatchException("cannot find $UNCOMPRESSED_JSON next to the APK root")
    return File(workingDir, UNCOMPRESSED_JSON)
}

internal fun markAssetStored(jsonFile: File, assetPath: String) {
    val text = if (jsonFile.isFile) jsonFile.readText(Charsets.UTF_8) else ""
    jsonFile.parentFile?.mkdirs()
    jsonFile.writeText(markUncompressed(text, assetPath, ".obb"), Charsets.UTF_8)
}

/**
 * Adds [path] and [extension] to Morphe's `uncompressed-files.json` so finishApk / applyTo
 * store the new asset instead of deflating it. AssetFileDescriptor.getStartOffset is the zip
 * local-file payload only for a STORED entry.
 */
internal fun markUncompressed(json: String, path: String, extension: String): String {
    val ext = if (extension.startsWith(".")) extension else ".$extension"
    var text = json.trim().ifEmpty { """{"paths":[],"extensions":[]}""" }
    text = ensureStringArray(text, "paths")
    text = ensureStringArray(text, "extensions")
    text = addStringToArray(text, "paths", path)
    text = addStringToArray(text, "extensions", ext)
    return text
}

internal fun hookFindGpkFile(method: MutableMethod) {
    if (method.implementation == null) throw PatchException("findGPKFile has no code")
    val first = method.getInstruction(0)
    method.addInstructionsWithLabels(
        0,
        """
            invoke-static {}, $EMBEDDED_OBB->findEmbedded()Ljava/io/File;
            move-result-object v0
            if-eqz v0, :miss
            return-object v0
        """,
        ExternalLabel("miss", first),
    )
}

internal fun hookResdlEvent(method: MutableMethod) {
    val code = method.implementation ?: throw PatchException("resdlEvent has no code")
    val returns = code.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN }.map { it.index }
    if (returns.isEmpty()) throw PatchException("resdlEvent has no return")
    // Glu's method has one return. Event 100/101/102 all jump to it. Inserting before that
    // return leaves the jumps on the return itself, so native FileMgr never sees the zip
    // base. Replacing the return puts the label on adjustEvent, which is how the working
    // hand APK wraps the whole method.
    for (index in returns.reversed()) {
        val valueReg = method.getInstruction<OneRegisterInstruction>(index).registerA
        method.replaceInstruction(
            index,
            "invoke-static {p0, v$valueReg}, $EMBEDDED_OBB->adjustEvent(II)I",
        )
        method.addInstructions(
            index + 1,
            """
                move-result v$valueReg
                return v$valueReg
            """,
        )
    }
}

internal fun hookMovieOffset(method: MutableMethod) {
    val instructions = method.implementation?.instructions?.toList()
        ?: throw PatchException("GluMovieActivity.setDataSource has no code")
    val fdOffsetCalls = instructions.indices.filter { i -> isMediaPlayerFdOffset(instructions[i]) }
    if (fdOffsetCalls.size != 2) {
        throw PatchException(
            "GluMovieActivity.setDataSource: expected two MediaPlayer.setDataSource(fd, offset, size), " +
                "found ${fdOffsetCalls.size}",
        )
    }
    val call = fdOffsetCalls.singleOrNull { index ->
        (index - 1 downTo maxOf(0, index - 8)).any { i -> isFileInputStreamGetFd(instructions[i]) }
    } ?: throw PatchException(
        "GluMovieActivity.setDataSource: no FileInputStream.getFD before setDataSource(fd, offset, size)",
    )
    val start = when (val insn = instructions[call]) {
        is RegisterRangeInstruction -> insn.startRegister
        else -> throw PatchException("GluMovieActivity GPK setDataSource is not an invoke-range")
    }
    val offsetReg = start + 2
    val intToLong = (call - 1 downTo maxOf(0, call - 8)).firstOrNull { i ->
        val insn = instructions[i]
        insn.opcode == Opcode.INT_TO_LONG && (insn as TwoRegisterInstruction).registerB == offsetReg
    } ?: throw PatchException("GluMovieActivity: no int-to-long of the GPK movie offset before setDataSource")
    method.addInstructions(
        intToLong,
        """
            invoke-static {v$offsetReg}, $EMBEDDED_OBB->adjustOffset(I)I
            move-result v$offsetReg
        """,
    )
}

private fun isMediaPlayerFdOffset(insn: Instruction): Boolean {
    val call = insn.method() ?: return false
    return (insn.opcode == Opcode.INVOKE_VIRTUAL_RANGE || insn.opcode == Opcode.INVOKE_VIRTUAL) &&
        call.definingClass == "Landroid/media/MediaPlayer;" &&
        call.name == "setDataSource" &&
        call.parameterTypes.map { it.toString() } == listOf("Ljava/io/FileDescriptor;", "J", "J")
}

private fun isFileInputStreamGetFd(insn: Instruction): Boolean {
    val call = insn.method() ?: return false
    return call.definingClass == "Ljava/io/FileInputStream;" && call.name == "getFD"
}

private fun Instruction.method() = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun ensureStringArray(json: String, key: String): String {
    if (Regex("\"${Regex.escape(key)}\"\\s*:").containsMatchIn(json)) return json
    val brace = json.lastIndexOf('}')
    if (brace < 0) throw PatchException("$UNCOMPRESSED_JSON is not a JSON object")
    val before = json.substring(0, brace).trimEnd()
    val needsComma = before.isNotEmpty() && !before.endsWith("{") && !before.endsWith(",")
    return buildString {
        append(before)
        if (needsComma) append(",")
        append("\"$key\":[]")
        append(json.substring(brace))
    }
}

private fun addStringToArray(json: String, key: String, value: String): String {
    val quoted = jsonString(value)
    val header = Regex("\"${Regex.escape(key)}\"\\s*:\\s*\\[").find(json)
        ?: throw PatchException("$UNCOMPRESSED_JSON has no \"$key\" array")
    val open = header.range.last
    val close = matchingBracket(json, open)
    val body = json.substring(open + 1, close)
    if (arrayContainsQuoted(body, quoted)) return json
    val insertion = if (body.any { !it.isWhitespace() }) "$body,$quoted" else quoted
    return json.substring(0, open + 1) + insertion + json.substring(close)
}

private fun matchingBracket(json: String, open: Int): Int {
    var depth = 0
    var inString = false
    var escape = false
    for (i in open until json.length) {
        val c = json[i]
        if (inString) {
            when {
                escape -> escape = false
                c == '\\' -> escape = true
                c == '"' -> inString = false
            }
        } else {
            when (c) {
                '"' -> inString = true
                '[' -> depth++
                ']' -> {
                    depth--
                    if (depth == 0) return i
                }
            }
        }
    }
    throw PatchException("$UNCOMPRESSED_JSON: unclosed array")
}

private fun arrayContainsQuoted(body: String, quoted: String): Boolean {
    var inString = false
    var escape = false
    val token = StringBuilder()
    for (c in body) {
        if (inString) {
            token.append(c)
            when {
                escape -> escape = false
                c == '\\' -> escape = true
                c == '"' -> {
                    inString = false
                    if (token.toString() == quoted) return true
                    token.setLength(0)
                }
            }
        } else if (c == '"') {
            inString = true
            token.append(c)
        }
    }
    return false
}

private fun jsonString(value: String) =
    buildString {
        append('"')
        for (c in value) {
            when (c) {
                '\\' -> append("\\\\")
                '"' -> append("\\\"")
                else -> append(c)
            }
        }
        append('"')
    }
