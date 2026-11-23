package app.zonghome.patches

import java.io.ByteArrayOutputStream

internal object CharcoalPalette {
    val background = 0xff141414.toInt()
    val surface = 0xff242424.toInt()
    val raised = 0xff303030.toInt()
    val text = 0xffe8e8e8.toInt()
    val muted = 0xffb7b7b7.toInt()
    val accent = 0xffacd58e.toInt()
    val onAccent = 0xff161616.toInt()
    val tinted = 0xff282828.toInt()
    val colors = mapOf(
        "colorViewBackgroundGrey" to background, "background_material_light" to background,
        "background_genz_item" to background, "colorGameBg" to background, "colorOutageBg" to background,
        "background_floating_material_light" to surface, "cardview_light_background" to surface,
        "card_bg" to surface, "button_material_light" to raised,
        "colorRewardsCongratsBg" to surface,
        "lightestGrey" to surface, "colorTransparentAdvanceLoan" to 0x99242424.toInt(),
        "colorBlack" to text, "black" to text, "bright_foreground_material_light" to text,
        "primary_text_default_material_light" to text, "primary_text_material_light" to text,
        "colorGrey" to muted, "homeCardSubText" to muted, "colorRegHintTxt" to muted,
        "secondary_text_default_material_light" to muted, "secondary_text_material_light" to muted,
        "ColorBottomIcon" to 0xb3b7b7b7.toInt(), "ColorBlack50Opacity" to 0x80e8e8e8.toInt(),
        "colorBlackOpacity50" to 0x80e8e8e8.toInt(),
        "colorPrimary" to accent, "colorPrimaryLight" to accent, "colorAccent" to accent,
        "colorAccentDark" to accent, "homeCardsPink" to accent,
        "colorPrimaryDark" to background, "colorAccentLight" to tinted,
        "border_light" to 0xff444444.toInt()
    )
}

/** Guarded raw-table edits. Leaves resource IDs, keys, layouts and native code intact. */
internal class CharcoalResources {
    private data class Value(val type: Int, val data: Int)
    var colorChanges = 0; private set
    var themeChanges = 0; private set
    private val whites = mutableSetOf(0x0106000b)

    private fun u16(b: ByteArray, p: Int) = (b[p].toInt() and 255) or ((b[p + 1].toInt() and 255) shl 8)
    private fun i32(b: ByteArray, p: Int) = u16(b, p) or (u16(b, p + 2) shl 16)
    private fun put16(b: ByteArray, p: Int, n: Int) { b[p] = n.toByte(); b[p + 1] = (n ushr 8).toByte() }
    private fun put32(b: ByteArray, p: Int, n: Int) { put16(b, p, n); put16(b, p + 2, n ushr 16) }
    private fun size(b: ByteArray, p: Int): Int {
        require(p >= 0 && p + 8 <= b.size) { "Truncated resource chunk" }
        val n = i32(b, p + 4)
        require(n >= u16(b, p + 2) && n >= 8 && p.toLong() + n <= b.size) { "Invalid resource chunk size" }
        return n
    }
    private fun pool(b: ByteArray): List<String> {
        require(u16(b, 0) == 1 && size(b, 0) == b.size) { "Expected string pool" }
        val count = i32(b, 8); val start = i32(b, 20); val header = u16(b, 2)
        require(count >= 0 && header.toLong() + count.toLong() * 4 <= b.size)
        val utf8 = i32(b, 16) and 0x100 != 0
        return List(count) { index ->
            var p = start + i32(b, header + 4 * index)
            fun length8(): Int {
                val first = b[p++].toInt() and 255
                return if (first and 0x80 == 0) first else ((first and 0x7f) shl 8) or (b[p++].toInt() and 255)
            }
            val bytes: Int
            if (utf8) { length8(); bytes = length8() }
            else {
                val first = u16(b, p); p += 2
                val chars = if (first and 0x8000 == 0) first else {
                    val second = u16(b, p); p += 2; ((first and 0x7fff) shl 16) or second
                }
                bytes = Math.multiplyExact(chars, 2)
            }
            require(p >= 0 && bytes >= 0 && p.toLong() + bytes <= b.size)
            String(b, p, bytes, if (utf8) Charsets.UTF_8 else Charsets.UTF_16LE)
        }
    }
    private fun children(b: ByteArray): List<Pair<Int, ByteArray>> {
        val result = mutableListOf<Pair<Int, ByteArray>>()
        var p = u16(b, 2)
        while (p < b.size) { val n = size(b, p); result += p to b.copyOfRange(p, p + n); p += n }
        require(p == b.size)
        return result
    }
    private fun pack(header: ByteArray, parts: List<ByteArray>): ByteArray {
        val out = ByteArrayOutputStream(); out.write(header); parts.forEach(out::write)
        return out.toByteArray().also { put32(it, 4, it.size) }
    }

    /** Read id entries without changing the palette or resource table. */
    fun viewIds(input:ByteArray,wanted:Set<String>):Map<String,Int> {
        require(u16(input,0)==2 && size(input,0)==input.size)
        val result=mutableMapOf<String,Int>()
        for((_,pkg) in children(input)) {
            if(u16(pkg,0)!=0x200)continue
            val keyAt=i32(pkg,276);val typeAt=i32(pkg,268)
            val keys=pool(pkg.copyOfRange(keyAt,keyAt+size(pkg,keyAt)))
            val types=pool(pkg.copyOfRange(typeAt,typeAt+size(pkg,typeAt)))
            val packageId=i32(pkg,8)
            val offset=if(u16(pkg,2)>=288)i32(pkg,284)else 0
            for((_,type) in children(pkg)) {
                if(u16(type,0)!=0x201)continue
                val typeId=type[8].toInt() and 255
                if(types.getOrNull(typeId-1)!="id")continue
                val start=i32(type,16)
                for(slot in slots(type)) {
                    val entry=start+slot.offset;val key=i32(type,entry+4)
                    val name=keys.getOrNull(key)?:continue
                    if(name in wanted)result[name]=(packageId shl 24) or ((typeId+offset) shl 16) or slot.index
                }
            }
        }
        require(result.keys.containsAll(wanted)) { "Unknown initial-hide ids: ${wanted-result.keys}" }
        return result
    }

    /** Set initial visibility before inflation, adding sorted attributes when absent. */
    fun initialVisibility(input:ByteArray,hidden:Map<Int,Int>,collapse:Pair<Int,Set<Int>>?=null):ByteArray {
        require(u16(input,0)==3 && size(input,0)==input.size)
        val chunks=children(input).map { it.second }
        val strings=pool(chunks.single { u16(it,0)==1 })
        val map=chunks.single { u16(it,0)==0x180 }
        val resources=(8 until map.size step 4).map { i32(map,it) }
        val visibilityName=resources.indexOf(0x010100dc)
        val namespace=strings.indexOf("http://schemas.android.com/apk/res/android")
        require(visibilityName>=0 && namespace>=0) { "Layout lacks a reusable Android visibility name" }
        fun resourceId(attr:ByteArray)=resources.getOrNull(i32(attr,4))?:0
        val observed=mutableMapOf<Int,Int>();var matched=0
        val rewritten=chunks.map { original ->
            if(u16(original,0)!=0x102)return@map original
            val first=16+u16(original,24);val stride=u16(original,26);val count=u16(original,28)
            require(stride>=20 && first.toLong()+stride.toLong()*count<=original.size)
            val attrs=(0 until count).map { i -> original.copyOfRange(first+i*stride,first+(i+1)*stride) }.toMutableList()
            val id=attrs.firstOrNull { resourceId(it)==0x010100d0 }?.let { i32(it,16) }?:return@map original
            val existing=attrs.indexOfFirst { resourceId(it)==0x010100dc }
            observed[id]=if(existing>=0)i32(attrs[existing],16)else 0
            val value=hidden[id]?:return@map original
            require(value==4 || value==8)
            observed[id]=value;matched++
            val visibility=if(existing>=0)attrs[existing]else ByteArray(stride).also {
                put32(it,0,namespace);put32(it,4,visibilityName);put16(it,12,8)
            }
            put32(visibility,8,-1);visibility[15]=16;put32(visibility,16,value)
            if(existing>=0) {
                val out=original.copyOf();visibility.copyInto(out,first+existing*stride);out
            } else {
                val insertion=attrs.indexOfFirst { resourceId(it)>0x010100dc }.let { if(it<0)attrs.size else it }
                attrs.add(insertion,visibility)
                val header=original.copyOfRange(0,first)
                put16(header,28,count+1)
                for(at in listOf(30,32,34)) {
                    val old=u16(header,at);if(old>insertion)put16(header,at,old+1)
                }
                val out=ByteArrayOutputStream();out.write(header);attrs.forEach(out::write)
                out.write(original,first+count*stride,original.size-first-count*stride)
                out.toByteArray().also { put32(it,4,it.size) }
            }
        }
        require(matched>0) { "No targeted views in initial-hide layout" }
        val output=pack(input.copyOfRange(0,u16(input,2)),rewritten)
        return if(collapse!=null && collapse.second.all { observed[it]==8 })
            initialVisibility(output,mapOf(collapse.first to 8)) else output
    }
    fun table(input: ByteArray): ByteArray {
        require(u16(input, 0) == 2 && size(input, 0) == input.size) { "Expected Android resource table" }
        val parts = children(input).map { (_, chunk) -> if (u16(chunk, 0) == 0x200) pkg(chunk) else chunk }
        require(colorChanges > 0 && themeChanges > 0) { "No .112 palette/AppTheme entries found; refusing partial theme" }
        return pack(input.copyOfRange(0, u16(input, 2)), parts)
    }
    private fun pkg(input: ByteArray): ByteArray {
        val headerSize = u16(input, 2)
        require(headerSize >= 284)
        val keyOffset = i32(input, 276)
        val keyPool = pool(input.copyOfRange(keyOffset, keyOffset + size(input, keyOffset)))
        val header = input.copyOfRange(0, headerSize)
        val originalTypePool = i32(input, 268)
        var outputOffset = headerSize
        val packageId = i32(input, 8)
        val typeIdOffset = if (headerSize >= 288) i32(input, 284) else 0
        val parts = children(input).map { (oldOffset, child) ->
            if (oldOffset == originalTypePool) put32(header, 268, outputOffset)
            if (oldOffset == keyOffset) put32(header, 276, outputOffset)
            val rewritten = if (u16(child, 0) == 0x201) type(child, keyPool, packageId, typeIdOffset) else child
            outputOffset += rewritten.size
            rewritten
        }
        return pack(header, parts)
    }
    private data class Slot(val at: Int, val offset: Int, val index: Int, val short: Boolean)
    private fun slots(input: ByteArray): List<Slot> {
        val count = i32(input, 12); val header = u16(input, 2); val flags = input[9].toInt() and 255
        require(count >= 0)
        require(flags and 3 != 3) { "Unsupported combined sparse/offset16 table" }
        val width = if (flags and 2 != 0) 2 else 4
        require(header.toLong() + count.toLong() * width <= i32(input, 16))
        return (0 until count).mapNotNull { i ->
            val at = header + i * width
            when {
                flags and 1 != 0 -> Slot(at + 2, u16(input, at + 2) * 4, u16(input, at), true)
                flags and 2 != 0 -> u16(input, at).takeUnless { it == 0xffff }?.let { Slot(at, it * 4, i, true) }
                else -> i32(input, at).takeUnless { it == -1 }?.let { Slot(at, it, i, false) }
            }
        }
    }
    private fun type(input: ByteArray, keys: List<String>, packageId: Int, idOffset: Int): ByteArray {
        var result = input.copyOf()
        val slots = slots(input); val start = i32(input, 16)
        var themeEntry: Int? = null
        for (slot in slots.distinctBy { it.offset }) {
            val entry = start + slot.offset
            require(entry >= start && entry + 8 <= input.size)
            val flags = u16(input, entry + 2)
            require(flags and 8 == 0) { "Compact resource entries require a dedicated parser" }
            val key = i32(input, entry + 4)
            require(key in keys.indices)
            val name = keys[key]
            val id = (packageId shl 24) or (((input[8].toInt() and 255) + idOffset) shl 16) or slot.index
            if (name == "colorWhite" || name == "white") whites += id
            if (name == "AppTheme" && flags and 1 != 0) themeEntry = entry
            val color = CharcoalPalette.colors[name] ?: continue
            if (flags and 1 != 0) continue
            val value = entry + u16(input, entry)
            require(value + 8 <= input.size)
            val type = input[value + 3].toInt() and 255
            if (type == 1 || type in 28..31) {
                result[value + 3] = 28; put32(result, value + 4, color)
                colorChanges++
            }
        }
        themeEntry?.let { result = theme(result, it, slots) }
        return result
    }
    private fun theme(input: ByteArray, entry: Int, slots: List<Slot>): ByteArray {
        val count = i32(input, entry + 12); val mapsStart = entry + u16(input, entry)
        require(count >= 0 && mapsStart.toLong() + 12L * count <= input.size)
        val maps = linkedMapOf<Int, Value>()
        repeat(count) { i ->
            val p = mapsStart + i * 12
            maps[i32(input, p)] = Value(input[p + 7].toInt() and 255, i32(input, p + 8))
        }
        fun color(id: Int, value: Int) {
            // Material navigation loads textColorSecondary by TypedValue.resourceId.
            // Keep real .112 resource references for shared palette entries.
            val resource = when(value) {
                CharcoalPalette.text -> 0x7f060056 // colorBlack, recolored above
                CharcoalPalette.muted -> 0x7f06005b // colorGrey
                CharcoalPalette.accent -> 0x7f060065 // colorPrimary
                CharcoalPalette.background -> 0x7f06006d // colorViewBackgroundGrey
                else -> null
            }
            maps[id] = if(resource != null) Value(1,resource) else Value(28,value)
        }
        fun bool(id: Int, value: Boolean) { maps[id] = Value(18, if (value) -1 else 0) }
        val p = CharcoalPalette
        color(0x01010030, p.text); color(0x01010031, p.background)
        color(0x01010036, p.text); color(0x01010038, p.muted)
        color(0x01010054, p.background); color(0x01010451, p.background); color(0x01010452, p.background)
        color(0x010104e2, p.surface); color(0x01010503, p.background)
        bool(0x010104e0, false); bool(0x0101056c, false); bool(0x0101058c, false); bool(0x01010590, false)
        bool(0x01010222, true) // windowDisablePreview: only the centered in-app splash should draw.
        color(0x0101062c, p.background); color(0x01010630, p.background)
        maps[0x0101062d] = Value(1, 0x0106000d) // Transparent launch-window icon; retain the centered 96dp in-app logo.
        maps[0x0101062e] = Value(16, 0) // No custom animated-icon duration.
        // App-owned Material attributes, verified against .112 public.xml.
        for (id in listOf(0x7f04010b, 0x7f04010f, 0x7f04012b, 0x7f040134)) color(id, p.accent)
        color(0x7f040111, p.muted); color(0x7f040114, p.text); color(0x7f040122, p.text)
        color(0x7f040119, p.onAccent); color(0x7f04011e, p.onAccent)
        color(0x7f040132, p.tinted); color(0x7f040139, p.surface)
        val oldEnd = mapsStart + count * 12
        val body = ByteArray(maps.size * 12)
        maps.entries.sortedBy { it.key }.forEachIndexed { i, item ->
            val at = i * 12; put32(body, at, item.key); put16(body, at + 4, 8)
            body[at + 7] = item.value.type.toByte(); put32(body, at + 8, item.value.data)
        }
        val result = input.copyOfRange(0, mapsStart) + body + input.copyOfRange(oldEnd, input.size)
        val delta = body.size - count * 12
        put32(result, entry + 12, maps.size); put32(result, 4, result.size)
        for (slot in slots) {
            val absolute = i32(input, 16) + slot.offset
            require(absolute <= entry || absolute >= oldEnd) { "Overlapping style entries" }
            if (absolute >= oldEnd) {
                val offset = slot.offset + delta
                if (slot.short) { require(offset % 4 == 0 && offset / 4 < 0xffff); put16(result, slot.at, offset / 4) }
                else put32(result, slot.at, offset)
            }
        }
        themeChanges++
        return result
    }

    /** Changes existing typed XML values in place. No strings, nodes or resource IDs are added. */
    fun xml(input: ByteArray, path: String, staticSplash: Boolean = false): ByteArray {
        if (input.size < 8 || u16(input, 0) != 3) return input
        val result = input.copyOf(); var names = emptyList<String>(); var attributeIds = emptyList<Int>(); var rewardPathIndex = -1; var at = u16(input, 2); var depth = 0
        val rewardVector=path.substringAfterLast("/")=="ic_reward_box.xml"
        val dialogLayout=Regex("res/layout[^/]*/(alert_success_failure.*|view_success_failure_alert|popup_reward_6gb|daily_rewards_congrats|profile_rewards_congrats|view_daily_rewards_game_end)\\.xml").matches(path)
        val dialogShape=path.substringAfterLast("/") in setOf("confirmation_background.xml","confirmation_image_bg.xml","card_background_bottom.xml","sidenav_divider.xml")
        val bgFile = dialogShape || Regex("(?i)(^|[/_])(bg|background)([/_.]|$)").containsMatchIn(path)
        while (at < input.size) {
            val length = size(input, at)
            if (u16(input, at) == 1) names = pool(input.copyOfRange(at, at + length))
            if (u16(input, at) == 0x180) attributeIds = (at+8 until at+length step 4).map { i32(input,it) }
            if (u16(input, at) == 0x102) {
                val elementName=names.getOrNull(i32(input,at+20))
                if(rewardVector && elementName=="path")rewardPathIndex++
                val rootLayout = depth == 0 && path.startsWith("res/layout")
                val stride = u16(input, at + 26); val count = u16(input, at + 28)
                val first = at + 16 + u16(input, at + 24)
                require(stride >= 20 && first.toLong() + stride.toLong() * count <= at + length)
                repeat(count) { i ->
                    val p = first + i * stride; val nameIndex = i32(input, p + 4)
                    require(nameIndex in names.indices)
                    val name = when(attributeIds.getOrNull(nameIndex)) {
                        0x7f0400af -> "cardBackgroundColor"
                        0x010100d4 -> "background"
                        0x010100f4 -> "layout_width"
                        0x010100f5 -> "layout_height"
                        0x01010098 -> "textColor"
                        0x0101009a -> "textColorHint"
                        0x01010119 -> "src"
                        0x01010121 -> "tint"
                        0x01010404 -> "fillColor"
                        0x010104cc -> "fillAlpha"
                        0x0101046b -> "backgroundTint"
                        0x010101a5 -> "color"
                        0x0101019d -> "startColor"
                        0x0101019e -> "endColor"
                        0x0101020b -> "centerColor"
                        else -> names[nameIndex]
                    }; val type = input[p + 15].toInt() and 255; val data = i32(input, p + 16)
                    var replacement: Int? = null; var replacementType = 28
                    val background = name in setOf("background", "backgroundTint", "cardBackgroundColor", "startColor", "endColor", "centerColor") || (bgFile && name in setOf("fillColor", "color"))
                    val foreground = name in setOf("textColor", "textColorHint", "tint", "strokeColor") || (!bgFile && name in setOf("fillColor", "color"))
                    val surface = if (rootLayout && name == "background") CharcoalPalette.background else CharcoalPalette.surface
                    if (type == 1 && background && data in whites) replacement = surface
                    if (type in 28..31) {
                        val r = data ushr 16 and 255; val g = data ushr 8 and 255; val b = data and 255
                        val alpha = data ushr 24
                        val neutral = maxOf(r, g, b) - minOf(r, g, b) < 18
                        if (neutral && alpha > 0) {
                            if (background && minOf(r, g, b) >= 215) replacement = (alpha shl 24) or (surface and 0xffffff)
                            if (foreground && maxOf(r, g, b) < 210) replacement =
                                (alpha shl 24) or ((if (maxOf(r, g, b) < 100) CharcoalPalette.text else CharcoalPalette.muted) and 0xffffff)
                        }
                    }
                    if ((dialogLayout || dialogShape) && background && ((type == 1 && data in whites) || (type in 28..31 && data ushr 24 != 0)))
                        replacement = CharcoalPalette.surface
                    if(path.substringAfterLast("/")=="frag_searchview.xml" && name=="cardBackgroundColor")
                        replacement=CharcoalPalette.surface
                    // Resource-grid cells share this drawable. Start dark at inflation as well
                    // as enforcing the rounded table surface before adapter-bound frames draw.
                    if(path.substringAfterLast("/")=="edit_text_history.xml" && name=="color")
                        replacement=if(elementName=="stroke") 0xff444444.toInt() else CharcoalPalette.surface
                    // .112 reward illustration: paths 0..10 are the panel and radial backdrop.
                    // Leave paths 11..154 (gift, ribbons, phone and confetti) intact.
                    if(rewardVector && rewardPathIndex in 0..10 && name=="fillColor") {
                        replacement=if(rewardPathIndex<=1) CharcoalPalette.surface else CharcoalPalette.raised
                    }
                    if(rewardVector && rewardPathIndex==0 && name=="fillAlpha") {
                        replacement=java.lang.Float.floatToRawIntBits(1f);replacementType=4
                    }
                    if (staticSplash && name == "src") { replacement = 0x7f080267; replacementType = 1 }
                    if(staticSplash && elementName?.endsWith("GifImageView")==true && name in setOf("layout_width","layout_height")) {
                        replacement=(96 shl 8) or 1;replacementType=5 // 96dp, integer complex dimension.
                    }
                    replacement?.let { put32(result, p + 8, -1); result[p + 15] = replacementType.toByte(); put32(result, p + 16, it) }
                }
                depth++
            }
            if (u16(input, at) == 0x103) { depth--; require(depth >= 0) }
            at += length
        }
        require(at == input.size && depth == 0)
        if(rewardVector)require(rewardPathIndex==154) { "Unexpected reward-vector path layout" }
        return result
    }
}
