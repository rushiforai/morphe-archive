import app.venus.extension.PcmResampler
import app.venus.extension.Waveform
import app.venus.extension.PcmFileInput
import java.io.ByteArrayInputStream
import java.io.ByteArrayOutputStream
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.util.Base64
import kotlin.math.abs
import kotlin.math.sin

private fun input(rate: Int, frames: Int, channels: Int = 1, floating: Boolean = false): ByteArray {
    val buffer = ByteBuffer.allocate(frames * channels * if (floating) 4 else 2).order(ByteOrder.LITTLE_ENDIAN)
    for (frame in 0 until frames) {
        val sample = (sin(2 * Math.PI * 440 * frame / rate) * 12000).toInt()
        repeat(channels) { if (floating) buffer.putFloat(sample / 32767f) else buffer.putShort(sample.toShort()) }
    }
    return buffer.array()
}
private fun convert(rate: Int, bytes: ByteArray, chunk: Int, channels: Int = 1, floating: Boolean = false): Pair<ByteArray, PcmResampler> {
    val converter = PcmResampler(rate, channels, floating)
    val out = ByteArrayOutputStream()
    var offset = 0
    while (offset < bytes.size) {
        val size = minOf(chunk, bytes.size - offset)
        out.write(converter.convert(ByteBuffer.wrap(bytes, offset, size).slice()))
        offset += size
    }
    out.write(converter.finish())
    return out.toByteArray() to converter
}
private fun benchmark() {
    // Synthetic JVM microbenchmark, not Android codec/startup/frame-rate evidence.
    for ((rate, channels) in listOf(48000 to 1, 44100 to 2)) {
        val pcm = input(rate, 960, channels)
        val times = LongArray(9)
        var checksum = 0L
        for (round in 0 until 14) {
            val converter = PcmResampler(rate, channels, false)
            val started = System.nanoTime()
            repeat(2000) {
                val out = converter.convert(ByteBuffer.wrap(pcm))
                checksum += out[0].toLong() + out.size
            }
            converter.finish()
            val elapsed = System.nanoTime() - started
            if (round >= 5) times[round - 5] = elapsed
        }
        java.util.Arrays.sort(times)
        println("BENCH rate=$rate channels=$channels median_ms=${times[4] / 1000000.0} checksum=$checksum")
    }
}
private fun pcmFileChecks(): Int {
    var checks=0
    fun chunk(name:String,bytes:ByteArray,little:Boolean):ByteArray {
        val out=ByteArrayOutputStream();out.write(name.toByteArray(Charsets.US_ASCII));out.write(ByteBuffer.allocate(4).order(if(little)ByteOrder.LITTLE_ENDIAN else ByteOrder.BIG_ENDIAN).putInt(bytes.size).array());out.write(bytes);if(bytes.size%2==1)out.write(0);return out.toByteArray()
    }
    fun wav(bits:Int,floating:Boolean,little:Boolean,extensible:Boolean=false):ByteArray {
        val order=if(little)ByteOrder.LITTLE_ENDIAN else ByteOrder.BIG_ENDIAN
        val format=ByteBuffer.allocate(if(extensible)40 else 16).order(order)
            .putShort((if(extensible)65534 else if(floating)3 else 1).toShort()).putShort(1).putInt(48000).putInt(48000*(bits/8)).putShort((bits/8).toShort()).putShort(bits.toShort())
        if(extensible){format.putShort(22).putShort(bits.toShort()).putInt(0).putInt(if(floating)3 else 1);format.put(byteArrayOf(0,0,16,0,-128,0,0,-86,0,56,-101,113))}
        val data=ByteBuffer.allocate(bits/8*3).order(order)
        for(value in listOf(-0.5,0.0,0.5)) {
            if(floating) {if(bits==64)data.putDouble(value) else data.putFloat(value.toFloat())}
            else when(bits){
                8->data.put((value*128+128).toInt().toByte())
                16->data.putShort((value*32768).toInt().toShort())
                24->{val raw=(value*8388608).toInt();if(little){data.put(raw.toByte());data.put((raw shr 8).toByte());data.put((raw shr 16).toByte())}else{data.put((raw shr 16).toByte());data.put((raw shr 8).toByte());data.put(raw.toByte())}}
                32->data.putInt((value*2147483648.0).toInt())
            }
        }
        val body="WAVE".toByteArray()+chunk("JUNK",byteArrayOf(1,2,3),little)+chunk("fmt ",format.array(),little)+chunk("data",data.array(),little)
        return (if(little)"RIFF" else "RIFX").toByteArray()+ByteBuffer.allocate(4).order(order).putInt(body.size).array()+body
    }
    for(bits in listOf(8,16,24,32)) for(little in listOf(true,false)) {
        val source=checkNotNull(PcmFileInput.open(ByteArrayInputStream(wav(bits,false,little))))
        check(source.rate==48000 && source.channels==1)
        val pcm=checkNotNull(source.readFrames());for(value in listOf(-0.5f,0f,0.5f))check(abs(pcm.float-value)<0.000001f)
        check(source.readFrames()==null);checks++
    }
    for(bits in listOf(32,64)) for(little in listOf(true,false)) {
        val source=checkNotNull(PcmFileInput.open(ByteArrayInputStream(wav(bits,true,little))))
        val pcm=source.readFrames()!!;for(value in listOf(-0.5f,0f,0.5f))check(pcm.float==value);checks++
    }
    for(floating in listOf(true,false)) {
        val source=checkNotNull(PcmFileInput.open(ByteArrayInputStream(wav(32,floating,true,true))));check(source.readFrames()!!.float==-0.5f);checks++
    }
    fun aiff(codec:String,bits:Int=16):ByteArray {
        val comm=ByteBuffer.allocate(if(codec=="AIFF")18 else 22).order(ByteOrder.BIG_ENDIAN)
            .putShort(1).putInt(3).putShort(bits.toShort()).putShort(16398).putInt(0xbb800000.toInt()).putInt(0) // extended-80 48 kHz
        if(codec!="AIFF")comm.put(codec.toByteArray())
        val data=ByteBuffer.allocate(8+3*(bits/8)).order(ByteOrder.BIG_ENDIAN).putInt(2).putInt(0)
        data.order(if(codec=="sowt")ByteOrder.LITTLE_ENDIAN else ByteOrder.BIG_ENDIAN)
        for(value in listOf(-0.5,0.0,0.5)){if(bits==32)data.putFloat(value.toFloat()) else if(bits==64)data.putDouble(value) else data.putShort((value*32768).toInt().toShort())}
        val ssnd=data.array().copyOfRange(0,8)+byteArrayOf(1,2)+data.array().copyOfRange(8,data.capacity())
        val body=(if(codec=="AIFF")"AIFF" else "AIFC").toByteArray()+chunk("COMM",comm.array(),false)+chunk("SSND",ssnd,false)
        return "FORM".toByteArray()+ByteBuffer.allocate(4).order(ByteOrder.BIG_ENDIAN).putInt(body.size).array()+body
    }
    for((codec,bits) in listOf("AIFF" to 16,"NONE" to 16,"twos" to 16,"sowt" to 16,"fl32" to 32,"fl64" to 64)) {
        val source=checkNotNull(PcmFileInput.open(ByteArrayInputStream(aiff(codec,bits))))
        check(source.rate==48000);val pcm=source.readFrames()!!;for(value in listOf(-0.5f,0f,0.5f))check(pcm.float==value);checks++
    }
    check(PcmFileInput.open(ByteArrayInputStream("not a pcm container".toByteArray()))==null);checks++
    // A cut-off file keeps every complete frame (here 2 of 3) instead of failing.
    val truncated=wav(16,false,true).dropLast(1).toByteArray()
    val reader=PcmFileInput.open(ByteArrayInputStream(truncated))!!;check(reader.readFrames()!!.remaining()==8);check(reader.readFrames()==null);checks++
    // Streaming writers leave RIFF/data sizes at 0 or 0xFFFFFFFF; RF64 uses a ds64 chunk. Read to EOF.
    for(kind in listOf("zero","max","rf64")){
        val unsized=wav(16,false,true)
        if(kind=="rf64"){"RF64".toByteArray().copyInto(unsized,0);ByteBuffer.wrap(unsized).order(ByteOrder.LITTLE_ENDIAN).putInt(4,-1)}
        val dataAt=unsized.size-6-4;ByteBuffer.wrap(unsized).order(ByteOrder.LITTLE_ENDIAN).putInt(dataAt,if(kind=="zero")0 else -1)
        if(kind!="rf64")ByteBuffer.wrap(unsized).order(ByteOrder.LITTLE_ENDIAN).putInt(4,if(kind=="zero")0 else -1)
        val streamed=checkNotNull(PcmFileInput.open(ByteArrayInputStream(unsized)))
        val pcm=streamed.readFrames()!!;check(pcm.remaining()==12){"unsized $kind"};for(value in listOf(-0.5f,0f,0.5f))check(abs(pcm.float-value)<0.0001f)
        check(streamed.readFrames()==null);checks++
    }
    // G.711: ITU reference points and WAV format tags 6/7.
    check(PcmFileInput.mulaw(0xff)==0&&PcmFileInput.mulaw(0x7f)==0&&PcmFileInput.mulaw(0x00)==-32124&&PcmFileInput.mulaw(0x80)==32124);checks++
    check(PcmFileInput.alaw(0xd5)==8&&PcmFileInput.alaw(0x55)==-8&&PcmFileInput.alaw(0xaa)==32256&&PcmFileInput.alaw(0x2a)==-32256);checks++
    for((tag,code,expected) in listOf(Triple(7,0x80,32124),Triple(6,0xaa,32256))){
        val g=wav(16,false,true);val o=ByteBuffer.wrap(g).order(ByteOrder.LITTLE_ENDIAN)
        val fmtAt=String(g,Charsets.ISO_8859_1).indexOf("fmt ")+8
        o.putShort(fmtAt,tag.toShort());o.putInt(fmtAt+8,48000);o.putShort(fmtAt+12,1);o.putShort(fmtAt+14,8)
        val dataAt=String(g,Charsets.ISO_8859_1).indexOf("data")+4;o.putInt(dataAt,6);g[dataAt+4]=code.toByte()
        val src=checkNotNull(PcmFileInput.open(ByteArrayInputStream(g)));check(abs(src.readFrames()!!.float-expected/32768f)<0.00001f);checks++
    }
    // ADPCM/GSM/MP3-in-WAV are not rejected: they are handed to Android's MediaExtractor (null).
    val adpcm=wav(16,false,true);ByteBuffer.wrap(adpcm).order(ByteOrder.LITTLE_ENDIAN).putShort(String(adpcm,Charsets.ISO_8859_1).indexOf("fmt ")+8,2)
    check(PcmFileInput.open(ByteArrayInputStream(adpcm))==null);checks++
    val nan=wav(32,true,true);ByteBuffer.wrap(nan).order(ByteOrder.LITTLE_ENDIAN).putFloat(nan.size-12,Float.NaN)
    check(runCatching{PcmFileInput.open(ByteArrayInputStream(nan))!!.readFrames()}.isFailure);checks++
    val invalid=wav(16,false,true);ByteBuffer.wrap(invalid).order(ByteOrder.LITTLE_ENDIAN).putInt(4,8)
    check(runCatching{PcmFileInput.open(ByteArrayInputStream(invalid))}.isFailure);checks++
    // AIFF-C G.711 is decoded locally; other compressed AIFF-C (ima4, ...) goes to Android.
    check(PcmFileInput.open(ByteArrayInputStream(aiff("ulaw")))!!.readFrames()!=null);checks++
    check(PcmFileInput.open(ByteArrayInputStream(aiff("ima4")))==null);checks++
    return checks
}
/** Direct transcription of Discord 347.12 downsampleWaveform (HBC function 56095). */
private fun discordDownsample(w: List<Double>, samples: Int): List<Double> {
    if (w.size == samples) return w
    val ratio = w.size.toDouble() / samples
    val out = ArrayList<Double>(); var start = 0
    while (out.size < samples) {
        val end = Math.round((out.size + 1) * ratio).toDouble().toInt()
        var sum = 0.0; var n = 0; var i = start
        while (i < end && i < w.size) { sum += w[i]; n++; i++ }
        out.add(sum / n); start = end
    }
    return out
}
private fun tone(amplitude: Double, frames: Int): Waveform {
    val w = Waveform(); for (i in 0 until frames) w.add(Math.round(Math.sin(2 * Math.PI * 440 * i / 48000) * amplitude * 32767).toInt()); return w
}
private fun discordWaveformChecks(): Int {
    var checks = 0
    // Discord constants: MIN_DB -100, MAX_DB 0, WAVE_MAX 255, MAX_SAMPLES 256, one level per 100 ms.
    check(Waveform.level(1.0) == 255.0 && Math.abs(Waveform.level(0.1) - 204.0) < 1e-9 && Math.abs(Waveform.level(0.01) - 153.0) < 1e-9 && Math.abs(Waveform.level(0.001) - 102.0) < 1e-9); checks++
    check(Waveform.level(0.0) == 0.0 && Waveform.level(1e-7) == 0.0 && Waveform.level(Double.NaN) == 0.0); checks++
    // Full-scale sine RMS = -3.01 dBFS -> 255 * 0.9699 = 247.3 -> byte 247 (absolute, not normalised).
    val full = tone(1.0, 48000).bytes(); check(full.size == 10 && full.all { (it.toInt() and 255) == 247 }) { full.joinToString() }; checks++
    // -40 dBFS RMS tone -> 153.
    val quiet = tone(0.01 * Math.sqrt(2.0), 48000).bytes(); check(quiet.all { Math.abs((it.toInt() and 255) - 153) <= 1 }); checks++
    // Duration -> sample count exactly like Discord: one per started 100 ms, capped at 256.
    for ((frames, expected) in listOf(1 to 1, 4800 to 1, 4801 to 2, 48000 * 3 to 30, 48000 * 25 + 2400 to 251, 48000 * 26 to 256, 48000 * 600 to 256)) {
        val w = Waveform(); repeat(frames) { w.add(1000) }; check(w.bytes().size == expected) { "$frames -> ${w.bytes().size}" }; checks++
    }
    check(Waveform().bytes().contentEquals(ByteArray(1))); checks++
    // Downsampling port is identical to Discord's for awkward ratios.
    val rnd = java.util.Random(7)
    for (len in listOf(257, 300, 511, 1000, 4097, 12000)) {
        val data = DoubleArray(len) { rnd.nextDouble() * 255 }
        val ours = Waveform.downsample(data, len, 256).toList()
        val theirs = discordDownsample(data.toList(), 256)
        check(ours.size == 256 && ours.indices.all { Math.abs(ours[it] - theirs[it]) < 1e-9 }) { "downsample $len" }; checks++
    }
    // Shape survives: loud second half is visibly higher than quiet first half.
    val w = Waveform(); repeat(48000) { w.add(if (it % 2 == 0) 300 else -300) }; repeat(48000) { w.add(if (it % 2 == 0) 20000 else -20000) }
    val b = w.bytes(); check((b[0].toInt() and 255) + 40 < (b[19].toInt() and 255)); checks++
    check(Base64.getDecoder().decode(w.base64()).contentEquals(b)); checks++
    return checks
}
private fun reconfigureChecks(): Int {
    // HE-AAC style mid-stream switch 22.05 kHz stereo -> 44.1 kHz stereo keeps the output clock continuous.
    val r = PcmResampler(22050, 2, false)
    val out = ByteArrayOutputStream()
    out.write(r.convert(ByteBuffer.wrap(input(22050, 22050, 2))))
    check(!r.matches(44100, 2, false) && r.matches(22050, 2, false))
    out.write(r.reconfigure(44100, 2, false))
    out.write(r.convert(ByteBuffer.wrap(input(44100, 44100, 2))))
    out.write(r.finish())
    check(Math.abs(r.outputFrames - 96000) <= 2) { "reconfigured duration ${r.outputFrames}" }
    check(out.size().toLong() == r.outputFrames * 2)
    val n = Base64.getDecoder().decode(r.waveform.base64()).size
    check(n == ((r.outputFrames + 4799) / 4800).toInt() && n in 20..21) { "levels $n frames ${r.outputFrames}" }
    return 1
}
fun main(args: Array<String>) {
    if (args.contains("--benchmark")) { benchmark(); return }
    var passed = pcmFileChecks()
    val mono = input(48000, 48000)
    val exact = convert(48000, mono, 960)
    check(exact.first.contentEquals(mono)) { "48k PCM16 mono must be bit-identical" }; passed++
    check(exact.second.outputFrames == 48000L); passed++
    for (rate in listOf(8000, 16000, 22050, 44100, 48000, 96000, 192000)) {
        val audio = input(rate, rate)
        val whole = convert(rate, audio, audio.size)
        val chunks = convert(rate, audio, 622)
        check(whole.first.contentEquals(chunks.first)) { "Chunk boundary changed PCM at $rate" }
        check(abs(chunks.second.outputFrames - 48000) <= 1) { "Wrong duration at $rate" }
        check(Base64.getDecoder().decode(chunks.second.waveform.base64()).size <= 64)
        passed++
    }
    val stereo = convert(48000, input(48000, 4800, 2), 960, 2).first
    check(stereo.contentEquals(input(48000, 4800))); passed++
    val floating = convert(48000, input(48000, 4800, 1, true), 960, 1, true).first
    val expected = input(48000, 4800)
    val a = ByteBuffer.wrap(floating).order(ByteOrder.LITTLE_ENDIAN)
    val b = ByteBuffer.wrap(expected).order(ByteOrder.LITTLE_ENDIAN)
    while (a.hasRemaining()) check(abs(a.short.toInt() - b.short.toInt()) <= 1)
    passed++
    val silence = Waveform()
    repeat(48000) { silence.add(0) }
    check(Base64.getDecoder().decode(silence.base64()).all { it.toInt() == 0 }); passed++
    val changing = Waveform()
    repeat(4800) { changing.add(100) }; repeat(4800) { changing.add(20000) }
    val bins = Base64.getDecoder().decode(changing.base64())
    check((bins[0].toInt() and 255) < (bins[1].toInt() and 255)); passed++
    passed += discordWaveformChecks()
    check(runCatching { PcmResampler(48000, 1, false).convert(ByteBuffer.wrap(byteArrayOf(0))) }.isFailure); passed++
    check(runCatching { PcmResampler(1000, 1, false) }.isFailure); passed++
    val extrema = ByteBuffer.allocate(8).order(ByteOrder.LITTLE_ENDIAN)
        .putShort(Short.MIN_VALUE).putShort(Short.MAX_VALUE).putShort(0).putShort(-1).array()
    val extremeOutput = convert(48000, extrema, 2)
    check(extremeOutput.first.contentEquals(extrema)); passed++
    check(extremeOutput.second.finish().isEmpty()); passed++
    check(PcmResampler(48000, 1, false).finish().isEmpty()); passed++
    val direct = ByteBuffer.allocateDirect(extrema.size + 4)
    direct.position(2); direct.put(extrema); direct.limit(2 + extrema.size); direct.position(2)
    check(PcmResampler(48000, 1, false).convert(direct).contentEquals(extrema)); passed++
    for (rate in listOf(8000, 44100, 48000, 192000)) {
        for (channels in listOf(1, 2, 8)) {
            val bytes = input(rate, 101, channels, true)
            check(convert(rate, bytes, bytes.size, channels, true).first
                .contentEquals(convert(rate, bytes, channels * 4, channels, true).first))
            passed++
        }
    }
    for (invalid in listOf(Float.NaN, Float.POSITIVE_INFINITY, Float.NEGATIVE_INFINITY)) {
        val bytes = ByteBuffer.allocate(4).order(ByteOrder.LITTLE_ENDIAN).putFloat(invalid).array()
        check(runCatching { PcmResampler(48000, 1, true).convert(ByteBuffer.wrap(bytes)) }.isFailure)
        passed++
    }
    passed += reconfigureChecks()
    println("PASS: $passed PCM/waveform checks (real signal, rate conversion, duration, silence, chunk invariance)")
}
