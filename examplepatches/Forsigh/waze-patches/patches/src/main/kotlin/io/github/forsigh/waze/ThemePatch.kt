package io.github.forsigh.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE

/**
 * Theme - one row, two selectors: Day theme and Night theme.
 *
 * Both selectors offer the WHOLE menu (see `THEMES` in MapThemeSupport): the AMOLED family
 * (true-black backgrounds), the Dark family (Waze's own night background) and the light themes
 * (Paper, Lavender, Mint, Coastal). Any theme can go in either slot - an OLED theme over the
 * daytime map, a light theme at night, a matched pair, the user's call. A theme whose canvas
 * clashes with the mode's text design also swaps the map-text family (a dark canvas in the day
 * slot, a light canvas at night), so the labels stay readable on the new background. Each slot
 * defaults so that enabling the row changes nothing until something is picked: night = AMOLED
 * (as this row has always defaulted to), day = Stock (untouched). Setting both slots to Stock
 * stops the patch with a message - a themed row with nothing picked is almost certainly a
 * mistake.
 *
 * The picks are applied as palette substitutions that run at RUNTIME, installed at the two
 * points where Waze's own code streams skin bytes:
 *
 *  1. the extractor that unpacks the bundled `assets/res/skins` into the app's data directory
 *     on first run (`com/waze/resources/h.h` - it copies every zip entry through a 1 MiB
 *     buffer, so one read() hands us a whole skin file). This is the path the rendered map
 *     reads from, so the copy loop calls a small helper method this patch adds to the same
 *     class (`themePaletteHook`), which rewrites the palette bytes just before they are
 *     written to disk. A helper with its own registers keeps the loop's live registers
 *     (enumeration, entry list, exception-handler invariants) untouched - inlining the
 *     transform there fails the dex verifier.
 *  2. the `loadSkinJNI` bridge the resources layer uses when it refreshes or re-reads a skin
 *     (through JNI, on the way back to the caller).
 *
 * The night slot's pairs apply to `.night.lua` skin files, the day slot's pairs to `.day.lua`,
 * and each block is only generated when that slot is actually themed. Both hooks are
 * idempotent (they match stock values only, so an already-themed file passes through). The
 * files inside the APK stay exactly as Waze built them, so a themed build packs like any other
 * code-only patch.
 *
 * WHY NOT EDIT THE FILES (the previous design): patches that write under `assets/` make current
 * Morphe packers emit zip folder records the moment the output APK is assembled, and Waze's
 * renderer dies on them at launch (SIGSEGV in the render thread). Patches run before packaging,
 * so no bundle-side trick can undo that - a code-only theme sidesteps it entirely.
 */
internal val SkinLoadFingerprint = Fingerprint(
    definingClass = "Lcom/waze/resources/ResourcesNativeManagerBase;",
    name = "loadSkinJNI",
    parameters = listOf("Ljava/lang/String;"),
    returnType = "[B",
    // No instruction filter on purpose: the delegate call inside the method was renamed between
    // builds (ResourcesNativeManager.loadSkin -> .f on 5.25.90.900), while class + name + signature
    // uniquely identify this bridge on every supported version. The delegate's presence is asserted
    // in execute() instead, so a future shape change still fails loudly.
)

/**
 * The routine that unpacks Waze's bundled `assets/res/...` into the app's data directory
 * (`com/waze/resources/h.h` on the older builds, `com/waze/resources/g.h` on 5.25.90.900 - the
 * package letters shift a notch down). The copy loop streams each entry through one 1 MiB buffer,
 * so the whole skin file is in memory at the write site the extraction hook targets. Resolution
 * goes through [resolveAnchor] and the helper is added to whichever class actually bound, so the
 * descriptor is never hardcoded.
 */
internal val ExtractCopyFingerprint = Fingerprint(
    definingClass = "Lcom/waze/resources/h;",
    name = "h",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "I",
        "[Lcom/waze/resources/f;",
    ),
    returnType = "V",
)

/** 5.25.90.900: the extractor re-lettered h -> g and its entry type f -> e. */
internal val ExtractCopyV2Fingerprint = Fingerprint(
    definingClass = "Lcom/waze/resources/g;",
    name = "h",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "I",
        "[Lcom/waze/resources/e;",
    ),
    returnType = "V",
)

@Suppress("unused")
val themePatch = bytecodePatch(
    name = "Theme",
    description = "Picks the map theme for day and night.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    category("UI Customization")
    // The hooks rewrite skins on the way to the renderer, and Waze still re-extracts its bundled
    // resources only when the app's versionCode rises - the refresh keeps a re-patch re-extracting.
    dependsOn(skinRefreshPatch)

    val dayTheme by stringOption(
        "dayTheme", "Stock",
        THEME_CHOICES,
        title = "Day theme",
        description = "The day map's theme. Stock leaves it untouched.",
    )

    val nightTheme by stringOption(
        "nightTheme", "AMOLED",
        THEME_CHOICES,
        title = "Night theme",
        description = "The night map's theme. Stock leaves it untouched.",
    )

    execute {
        val day = dayTheme ?: "Stock"
        val night = nightTheme ?: "AMOLED"

        val dayWanted: Map<String, String>? = if (day == "Stock") {
            null
        } else {
            THEMES[day] ?: throw PatchException("themePatch: unknown day theme '$day'")
        }
        val nightWanted: Map<String, String>? = if (night == "Stock") {
            null
        } else {
            THEMES[night] ?: throw PatchException("themePatch: unknown night theme '$night'")
        }
        if (dayWanted == null && nightWanted == null) {
            throw PatchException(
                "themePatch: both selectors are Stock - pick at least one theme, or disable the Theme row",
            )
        }

        // Palette pairs plus - when the theme's canvas clashes with the mode - the twelve-line
        // map-text swap, so labels stay readable on the themed background.
        val nightPairs = (nightWanted?.let { replacementPairs(it, STOCK_NIGHT, STOCK_NIGHT_EDITOR) } ?: emptyList()) +
            (if (nightWanted != null && !isDarkCanvas(nightWanted)) NIGHT_TEXT_TO_DAY else emptyList())
        val dayPairs = (dayWanted?.let { replacementPairs(it, STOCK_DAY, STOCK_DAY_EDITOR) } ?: emptyList()) +
            (if (dayWanted != null && isDarkCanvas(dayWanted)) DAY_TEXT_TO_NIGHT else emptyList())
        val emitNight = nightPairs.isNotEmpty()
        val emitDay = dayPairs.isNotEmpty()
        val nightLabel = if (nightWanted == null) "Stock (untouched)" else "$night (${nightPairs.size} pairs)"
        val dayLabel = if (dayWanted == null) "Stock (untouched)" else "$day (${dayPairs.size} pairs)"

        // ---- seam 1: the loadSkinJNI bridge ----
        val method = SkinLoadFingerprint.method
        // The fingerprint intentionally carries no instruction filter (the delegate inside was renamed
        // between builds), so assert the delegate exists at all before installing a hook that would
        // otherwise never fire.
        val delegates = method.implementation?.instructions.orEmpty().count { instruction ->
            instruction is ReferenceInstruction &&
                (instruction.reference as? MethodReference)?.let { ref ->
                    ref.definingClass == "Lcom/waze/resources/ResourcesNativeManager;"
                } == true
        }
        if (delegates == 0) {
            throw PatchException(
                "themePatch: loadSkinJNI no longer delegates to ResourcesNativeManager - refusing to install a hook that never fires",
            )
        }

        val returnIndex = method.instructions.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
        if (returnIndex < 0) {
            throw PatchException(
                "themePatch: loadSkinJNI no longer ends in return-object - refusing to hook a method that has moved",
            )
        }

        // The method is `.locals 1` with one String parameter: exactly three registers exist
        // (v0, p0, p1). At the injection point p0 carries the loaded bytes and p1 the asset name,
        // so the transform reuses all three: p1 frees up after the name guards, and p0 becomes
        // scratch once the original bytes are folded into a String (it is set to the new bytes
        // again before the method's own `return-object p0`).
        val skinHookSmali = buildString {
            appendLine("if-nez p0, :theme_done")
            if (emitNight) {
                val off = if (emitDay) ":theme_day" else ":theme_done"
                appendLine("const-string v0, \".night.lua\"")
                appendLine("invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z")
                appendLine("move-result v0")
                appendLine("if-eqz v0, $off")
                appendLine("const-string v0, \"skin_values\"")
                appendLine("invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z")
                appendLine("move-result v0")
                appendLine("if-eqz v0, $off")
                appendLine("const-string p1, \"UTF-8\"")
                appendLine("new-instance v0, Ljava/lang/String;")
                appendLine("invoke-direct {v0, p0, p1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V")
                for ((stock, wantedHex) in nightPairs) {
                    appendLine("const-string p1, \"$stock\"")
                    appendLine("const-string p0, \"$wantedHex\"")
                    appendLine("invoke-virtual {v0, p1, p0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;")
                    appendLine("move-result-object v0")
                }
                appendLine("const-string p1, \"UTF-8\"")
                appendLine("invoke-virtual {v0, p1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B")
                appendLine("move-result-object p0")
                appendLine("goto :theme_done")
            }
            if (emitDay) {
                if (emitNight) appendLine(":theme_day")
                appendLine("const-string v0, \".day.lua\"")
                appendLine("invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z")
                appendLine("move-result v0")
                appendLine("if-eqz v0, :theme_done")
                appendLine("const-string v0, \"skin_values\"")
                appendLine("invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z")
                appendLine("move-result v0")
                appendLine("if-eqz v0, :theme_done")
                appendLine("const-string p1, \"UTF-8\"")
                appendLine("new-instance v0, Ljava/lang/String;")
                appendLine("invoke-direct {v0, p0, p1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V")
                for ((stock, wantedHex) in dayPairs) {
                    appendLine("const-string p1, \"$stock\"")
                    appendLine("const-string p0, \"$wantedHex\"")
                    appendLine("invoke-virtual {v0, p1, p0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;")
                    appendLine("move-result-object v0")
                }
                appendLine("const-string p1, \"UTF-8\"")
                appendLine("invoke-virtual {v0, p1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B")
                appendLine("move-result-object p0")
            }
            appendLine(":theme_done")
            appendLine("nop")
        }
        method.addInstructionsWithLabels(returnIndex, skinHookSmali.trimEnd())
        println(
            "themePatch: loadSkinJNI hook installed - night $nightLabel, day $dayLabel",
        )

        // ---- seam 2: the resource extractor (com/waze/resources/h, re-lettered to g on 5.25.90.900) ----
        // On first run Waze unpacks assets/res/skins into its data directory and the rendered map
        // reads those copies. The copy loop reads through a 1 MiB buffer (whole file per read),
        // so a helper method on the same class rewrites the buffer right before the loop writes
        // it to disk. The helper gets its own registers because the loop's live registers
        // (v2 = entry list, v3 = directory enumeration, v1 = exception-handler string) cannot be
        // repurposed without failing dex verification, and every other register is in use too.
        val copier = resolveAnchor(
            "theme extraction copy loop", ExtractCopyFingerprint, ExtractCopyV2Fingerprint,
        )
        val copierClassName = copier.definingClass
            ?: throw PatchException("themePatch: the matched extractor has no defining class")
        val helperName = "themePaletteHook"
        val helperSmali = buildString {
            if (emitNight) {
                val off = if (emitDay) ":h_day" else ":h_skip"
                appendLine("const-string v0, \".night.lua\"")
                appendLine("invoke-virtual {p2, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z")
                appendLine("move-result v0")
                appendLine("if-eqz v0, $off")
                appendLine("const-string v0, \"skin_values\"")
                appendLine("invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z")
                appendLine("move-result v0")
                appendLine("if-eqz v0, $off")
                appendLine("const/4 v0, 0x0")
                appendLine("new-instance v1, Ljava/lang/String;")
                appendLine("invoke-direct {v1, p0, v0, p1}, Ljava/lang/String;-><init>([BII)V")
                for ((stock, wantedHex) in nightPairs) {
                    appendLine("const-string v2, \"$stock\"")
                    appendLine("const-string v3, \"$wantedHex\"")
                    appendLine("invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;")
                    appendLine("move-result-object v1")
                }
                appendLine("invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B")
                appendLine("move-result-object v1")
                appendLine("array-length v0, v1")
                appendLine("const/4 v2, 0x0")
                appendLine("invoke-static {v1, v2, p0, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V")
                appendLine("return v0")
            }
            if (emitDay) {
                if (emitNight) appendLine(":h_day")
                appendLine("const-string v0, \".day.lua\"")
                appendLine("invoke-virtual {p2, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z")
                appendLine("move-result v0")
                appendLine("if-eqz v0, :h_skip")
                appendLine("const-string v0, \"skin_values\"")
                appendLine("invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z")
                appendLine("move-result v0")
                appendLine("if-eqz v0, :h_skip")
                appendLine("const/4 v0, 0x0")
                appendLine("new-instance v1, Ljava/lang/String;")
                appendLine("invoke-direct {v1, p0, v0, p1}, Ljava/lang/String;-><init>([BII)V")
                for ((stock, wantedHex) in dayPairs) {
                    appendLine("const-string v2, \"$stock\"")
                    appendLine("const-string v3, \"$wantedHex\"")
                    appendLine("invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;")
                    appendLine("move-result-object v1")
                }
                appendLine("invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B")
                appendLine("move-result-object v1")
                appendLine("array-length v0, v1")
                appendLine("const/4 v2, 0x0")
                appendLine("invoke-static {v1, v2, p0, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V")
                appendLine("return v0")
            }
            appendLine(":h_skip")
            appendLine("move v0, p1")
            appendLine("return v0")
        }

        // The helper is a new `private static int themePaletteHook(byte[] buf, int len, String name)`
        // on the resolved extractor class: it rewrites the palette inside `buf[0..len)` and returns
        // the (possibly unchanged) length.
        val hClass = mutableClassDefBy(copierClassName)
        val helper = MutableMethod(
            ImmutableMethod(
                copierClassName,
                helperName,
                listOf(
                    ImmutableMethodParameter("[B", null, null),
                    ImmutableMethodParameter("I", null, null),
                    ImmutableMethodParameter("Ljava/lang/String;", null, null),
                ),
                "I",
                AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
                emptySet(),
                emptySet(),
                // 8 registers: locals v0-v4 for the transform, params at v5-v7 (p0-p2).
                ImmutableMethodImplementation(8, emptyList(), emptyList(), emptyList()),
            ),
        )
        helper.addInstructions(0, helperSmali.trimEnd())
        hClass.methods.add(helper)

        val copierInsns = copier.instructions
        fun invokeTarget(instruction: Instruction): String? =
            (instruction as? ReferenceInstruction)?.reference?.toString()

        var copyWriteIndex = -1
        for (i in 3 until copierInsns.size) {
            val write = copierInsns[i]
            val read = copierInsns[i - 3]
            if (write.opcode == Opcode.INVOKE_VIRTUAL &&
                invokeTarget(write) == "Ljava/io/FileOutputStream;->write([BII)V" &&
                read.opcode == Opcode.INVOKE_VIRTUAL &&
                invokeTarget(read) == "Ljava/io/InputStream;->read([B)I"
            ) {
                copyWriteIndex = i
                break
            }
        }
        if (copyWriteIndex < 0) {
            throw PatchException(
                "themePatch: the resource-extraction copy loop was not found in the extractor - refusing to install a hook that would never fire",
            )
        }

        // At the write site: v0 = the shared 1 MiB buffer, v9 = bytes read, v7 = the current
        // ZipEntry, v10 = the FileOutputStream. The call only borrows v11 (dead in this loop,
        // re-written before every read elsewhere) and updates v9 with the helper's return.
        // v11 ends as the verifier's "Zero" so the loop-back joins never see a type conflict.
        val callSmali = buildString {
            appendLine("invoke-virtual {v7}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;")
            appendLine("move-result-object v11")
            appendLine("invoke-static {v0, v9, v11}, $copierClassName->$helperName([BILjava/lang/String;)I")
            appendLine("move-result v9")
            appendLine("const/4 v11, 0x0")
        }
        copier.addInstructions(copyWriteIndex, callSmali.trimEnd())
        println(
            "themePatch: resource-extractor hook installed - night $nightLabel, day $dayLabel",
        )
    }
}
