package app.ayufa.patches.simeji.cursorpad

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.ayufa.patches.simeji.shared.Constants.COMPATIBILITY_SIMEJI
import app.ayufa.patches.simeji.shared.CURSOR_PAD_CATALOG_CLASS
import app.ayufa.patches.simeji.shared.CURSOR_PAD_CLASS
import app.ayufa.patches.simeji.shared.CURSOR_PAD_PROVIDER_CLASS

/**
 * Entry point of the control panel's button row: whenever the panel
 * attaches, this rebuilds the row through either the default layout
 * (initDefultBar) or the user's custom layout (initCustomBar), so a
 * hook here covers both. The hook sits at the very start, where p0
 * still holds the launcher itself; the extension posts the actual
 * work, so it runs after the row has been built. Verified against
 * Simeji 22.5.
 */
internal object BaseLauncherAttachLauncherFingerprint : Fingerprint(
    definingClass = "Lcom/adamrocker/android/input/simeji/framework/imp/BaseLauncher;",
    name = "attachLauncher",
    returnType = "V",
    parameters = listOf("Lcom/adamrocker/android/input/simeji/framework/IPlusManager;")
)

/**
 * Resolves one slot of the custom control-panel layout to its
 * provider: indices 1-4 map to the fixed launcher list and the rest
 * are delegated to CustomTopBarHelper. The cursor pad takes the new
 * index 19 (indices 6, 11 and 14 are retired stock slots that the
 * app itself filters out of saved configurations). The hook sits at
 * the very start and only intercepts index 19; v0 is a genuine
 * local register of this method (5 registers, 3 of them parameters,
 * verified against the 22.5 dex) and holds no meaningful value at
 * entry. The extension returns a proxy implementing the app's
 * IPlus/ILauchable interfaces, or null on failure, which the stock
 * caller treats as an empty slot. Verified against Simeji 22.5.
 */
internal object BaseLauncherGetIconByIndexFingerprint : Fingerprint(
    definingClass = "Lcom/adamrocker/android/input/simeji/framework/imp/BaseLauncher;",
    name = "getIconByIndex",
    returnType = "Lcom/adamrocker/android/input/simeji/framework/ILauchable;",
    parameters = listOf(
        "Lcom/adamrocker/android/input/simeji/framework/IPlusManager;",
        "I"
    )
)

/**
 * The toolbar customization catalogue: the stock method returns
 * the static item list, and every consumer (the settings screen's
 * adapter, the lookup resolving a saved configuration back to
 * items, the default configuration) goes through it. The hook
 * replaces the return value with the extension's extended copy,
 * which appends the cursor-move item (id "19") built with the
 * resource ids added by the resource patch below. v0 is the
 * method's only local register (2 registers, p0 is the companion)
 * and the original body is a single field read into it, so
 * overwriting it before returning is safe. Verified against
 * Simeji 22.5.
 */
internal object ToolbarItemCompanionGetToolbarDatasFingerprint : Fingerprint(
    definingClass = "Ljp/baidu/simeji/home/vip/toolbar/ToolbarItem\$Companion;",
    name = "getToobarDatas",
    returnType = "Ljava/util/List;",
    parameters = listOf()
)

/**
 * Resources for the cursor pad's entry in the toolbar settings:
 * the item's title string and icon drawable, both named
 * "toolbar_cursor_move". The extension looks their ids up by name
 * at runtime, because the ids only exist once the patched app is
 * built. The icon is the cursor key glyph of Simeji for iPhone
 * (an I-beam flanked by two chevrons, "<I>") and must be a PNG:
 * the toolbar settings screens wrap item icons in the app's
 * TintedBitmapDrawable, which loads them with
 * BitmapFactory.decodeResource and draws nothing for non-bitmap
 * resources such as vector drawables (verified against 22.5).
 * The PNG is rasterised below from the same segment geometry the
 * extension's bar icon draws.
 */
@Suppress("unused")
val cursorPadResourcePatch = resourcePatch(
    name = "カーソル移動パッド用リソース",
    description = "「コントロールパネルにカーソル移動を追加」がツールバー" +
        "設定に項目を表示するために必要な文字列とアイコンを、アプリに" +
        "追加します。このパッチ単体では何も変わりません。",
    default = true
) {
    compatibleWith(COMPATIBILITY_SIMEJI)

    execute {
        document("res/values/strings.xml").use { doc ->
            val stringElements = doc.getElementsByTagName("string")
            var exists = false
            for (i in 0 until stringElements.length) {
                val element = stringElements.item(i) as org.w3c.dom.Element
                if (element.getAttribute("name") == "toolbar_cursor_move") {
                    exists = true
                    break
                }
            }
            if (!exists) {
                val element = doc.createElement("string")
                element.setAttribute("name", "toolbar_cursor_move")
                element.appendChild(doc.createTextNode("カーソル移動"))
                doc.documentElement.appendChild(element)
            }
        }

        get("res/drawable/toolbar_cursor_move.png")
            .writeBytes(cursorGlyphPng())
    }
}

/** Segments of the "<I>" glyph in a 24-unit box: I-beam, chevrons. */
private val GLYPH_SEGMENTS = arrayOf(
    floatArrayOf(12f, 4.7f, 12f, 19.3f),
    floatArrayOf(9.9f, 4.7f, 14.1f, 4.7f),
    floatArrayOf(9.9f, 19.3f, 14.1f, 19.3f),
    floatArrayOf(7.5f, 7.6f, 4.0f, 12f),
    floatArrayOf(4.0f, 12f, 7.5f, 16.4f),
    floatArrayOf(16.5f, 7.6f, 20.0f, 12f),
    floatArrayOf(20.0f, 12f, 16.5f, 16.4f)
)

private fun distanceToSegment(
    px: Float,
    py: Float,
    segment: FloatArray
): Float {
    val dx = segment[2] - segment[0]
    val dy = segment[3] - segment[1]
    val lengthSquared = dx * dx + dy * dy
    val t = if (lengthSquared == 0f) {
        0f
    } else {
        (((px - segment[0]) * dx + (py - segment[1]) * dy) / lengthSquared)
            .coerceIn(0f, 1f)
    }
    val cx = segment[0] + t * dx
    val cy = segment[1] + t * dy
    return kotlin.math.hypot(px - cx, py - cy)
}

/**
 * Rasterises the glyph as a black-on-transparent PNG (the settings
 * screens tint it through their own colour filter), encoded by
 * hand so the patch needs no image library: coverage is sampled
 * 4x4 per pixel against the segment distances, scanlines are
 * zlib-compressed with the platform Deflater, and the three PNG
 * chunks are assembled directly.
 */
private fun cursorGlyphPng(size: Int = 192): ByteArray {
    val halfWidth = 0.52f
    val samples = 4
    val scale = size / 24f
    val raw = ByteArray(size * (1 + size * 4))
    var p = 0
    for (y in 0 until size) {
        raw[p++] = 0
        for (x in 0 until size) {
            var covered = 0
            for (sy in 0 until samples) {
                for (sx in 0 until samples) {
                    val ux = (x + (sx + 0.5f) / samples) / scale
                    val uy = (y + (sy + 0.5f) / samples) / scale
                    var min = Float.MAX_VALUE
                    for (segment in GLYPH_SEGMENTS) {
                        val distance = distanceToSegment(ux, uy, segment)
                        if (distance < min) {
                            min = distance
                        }
                    }
                    if (min <= halfWidth) {
                        covered++
                    }
                }
            }
            raw[p++] = 0
            raw[p++] = 0
            raw[p++] = 0
            raw[p++] = (255 * covered / (samples * samples)).toByte()
        }
    }

    val deflater = java.util.zip.Deflater()
    deflater.setInput(raw)
    deflater.finish()
    val compressedBuffer = ByteArray(raw.size + 1024)
    val compressedLength = deflater.deflate(compressedBuffer)
    deflater.end()
    val compressed = compressedBuffer.copyOf(compressedLength)

    val ihdr = java.io.ByteArrayOutputStream()
    val ihdrWriter = java.io.DataOutputStream(ihdr)
    ihdrWriter.writeInt(size)
    ihdrWriter.writeInt(size)
    ihdrWriter.writeByte(8)
    ihdrWriter.writeByte(6)
    ihdrWriter.writeByte(0)
    ihdrWriter.writeByte(0)
    ihdrWriter.writeByte(0)
    ihdrWriter.flush()

    val out = java.io.ByteArrayOutputStream()
    out.write(byteArrayOf(-119, 80, 78, 71, 13, 10, 26, 10))
    writePngChunk(out, "IHDR", ihdr.toByteArray())
    writePngChunk(out, "IDAT", compressed)
    writePngChunk(out, "IEND", ByteArray(0))
    return out.toByteArray()
}

private fun writePngChunk(
    out: java.io.ByteArrayOutputStream,
    type: String,
    data: ByteArray
) {
    val typeBytes = type.toByteArray(Charsets.US_ASCII)
    val writer = java.io.DataOutputStream(out)
    writer.writeInt(data.size)
    writer.write(typeBytes)
    writer.write(data)
    val crc = java.util.zip.CRC32()
    crc.update(typeBytes)
    crc.update(data)
    writer.writeInt(crc.value.toInt())
    writer.flush()
}

@Suppress("unused")
val cursorPadPatch = bytecodePatch(
    name = "コントロールパネルにカーソル移動を追加",
    description = "コントロールパネルのツールバーカスタマイズに「カーソル" +
        "移動」の項目を追加します（iPhone版 Simeji のカーソルキーと同じ" +
        "機能です）。ツールバー設定で配置すると、他の項目と同じように" +
        "並び替えられます。置いた項目を押したまま左右にスライドすると、" +
        "スライドした分だけテキストのカーソルが左右に動きます。日本語の" +
        "変換中に使うと、方向キーと同じく文節の移動になります。",
    default = true
) {
    compatibleWith(COMPATIBILITY_SIMEJI)

    extendWith("extensions/simeji.mpe")

    dependsOn(cursorPadResourcePatch)

    execute {
        BaseLauncherAttachLauncherFingerprint.method.addInstructions(
            0,
            "invoke-static { p0 }, " +
                "$CURSOR_PAD_CLASS->attach(Landroid/view/View;)V"
        )

        BaseLauncherGetIconByIndexFingerprint.method.addInstructions(
            0,
            """
                const/16 v0, 0x13
                if-ne p2, v0, :ayufa_cursor_pad_skip
                invoke-static { p1 }, $CURSOR_PAD_PROVIDER_CLASS->create(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v0
                check-cast v0, Lcom/adamrocker/android/input/simeji/framework/ILauchable;
                return-object v0
                :ayufa_cursor_pad_skip
            """
        )

        ToolbarItemCompanionGetToolbarDatasFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, $CURSOR_PAD_CATALOG_CLASS->extended()Ljava/util/List;
                move-result-object v0
                return-object v0
            """
        )
    }
}
