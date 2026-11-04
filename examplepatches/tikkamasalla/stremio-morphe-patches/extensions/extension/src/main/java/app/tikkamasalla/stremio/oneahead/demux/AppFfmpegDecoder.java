package app.tikkamasalla.stremio.oneahead.demux;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

/**
 * The software FFmpeg the app ships for its own player, reached by reflection: a job gets its own
 * native context on its own thread and never touches the player's. The classes differ per app
 * version and some of their Java is obfuscated, so only the JNI names, which cannot change, are
 * used, and the native methods are called directly: the decoder object is allocated without its
 * constructor, which would start a thread and need the player's Format class.
 *
 * Whatever does not fit (missing class, other signature, library that will not load) is a refusal
 * with a reason word, decided once per process. No retry, nothing thrown.
 */
public final class AppFfmpegDecoder implements AudioDecoder {
    /** Decoder class, library class, native library. Stremio 1.6 and Stremio 1.10 and later. */
    private static final String[][] BUILDS = {
            {"androidx.media3.decoder.ffmpeg.FfmpegAudioDecoder", "androidx.media3.decoder.ffmpeg.FfmpegLibrary", "ffmpegJNI"},
            {"io.github.anilbeesetti.nextlib.media3ext.ffdecoder.FfmpegAudioDecoder",
                    "io.github.anilbeesetti.nextlib.media3ext.ffdecoder.FfmpegLibrary", "media3ext"},
    };
    private static final String OUTPUT_CLASS = "androidx.media3.decoder.SimpleDecoderOutputBuffer";
    private static final int ERROR_INVALID_DATA = -1, ERROR_OTHER = -2;
    private static final int FIRST_OUTPUT_BYTES = 64 * 1024, MAX_FRAME_BYTES = 1024 * 1024;
    private static final long NO_LAYOUT = Long.MIN_VALUE;
    private static final int[] AC3_KBPS = {32, 40, 48, 56, 64, 80, 96, 112, 128, 160, 192, 224, 256, 320, 384, 448, 512, 576, 640};

    /** FFmpeg's decoder for a MIME type, or null. Only codecs that need no codec private data. */
    static String codecName(String mime) {
        if (mime == null) return null;
        switch (mime) {
            case "audio/ac3": return "ac3";
            case "audio/eac3": return "eac3";
            case "audio/true-hd": return "truehd";
            case "audio/vnd.dts": return "dca";
            case "audio/mpeg": return "mp3";
            default: return null;
        }
    }

    /** The app's classes as found on this device. */
    private static final class App {
        Class<?> decoderClass, outputClass;
        Method hasDecoder, init, decode, channelCount, sampleRate, reset, release, allocate;
        Object unsafe;
        Field outputData;
        int padding;

        Object allocate(Class<?> c) throws ReflectiveOperationException {
            return allocate.invoke(unsafe, c);
        }
    }

    private static boolean bound;
    private static App app;

    private static synchronized App app(DemuxLog log) {
        if (!bound) {
            bound = true;
            try {
                app = bind(log);
            } catch (ReflectiveOperationException | RuntimeException | LinkageError | OutOfMemoryError e) {
                log.log("ffmpeg refused: " + reasonWord(e) + " " + e.getClass().getSimpleName());
            }
        }
        return app;
    }

    /** A loader failure, a signature that moved, or something else that does not fit. */
    private static String reasonWord(Throwable e) {
        if (e instanceof ClassNotFoundException) return "no-class";
        if (e instanceof UnsatisfiedLinkError) return "no-library";
        if (e instanceof NoSuchMethodException || e instanceof NoSuchFieldException) return "other-shape";
        return "failed";
    }

    private static App bind(DemuxLog log) throws ReflectiveOperationException {
        ClassLoader loader = AppFfmpegDecoder.class.getClassLoader();
        ClassNotFoundException missing = null;
        for (String[] build : BUILDS) {
            Class<?> decoder, library;
            try {
                decoder = Class.forName(build[0], false, loader);
                library = Class.forName(build[1], false, loader);
            } catch (ClassNotFoundException e) {
                missing = e;
                continue;
            }
            App a = new App();
            a.decoderClass = decoder;
            a.outputClass = Class.forName(OUTPUT_CLASS, false, loader);
            a.init = nativeMethod(decoder, "ffmpegInitialize", long.class, String.class, byte[].class, boolean.class, int.class, int.class);
            a.decode = nativeMethod(decoder, "ffmpegDecode", int.class, long.class, ByteBuffer.class, int.class, a.outputClass, ByteBuffer.class, int.class);
            a.channelCount = nativeMethod(decoder, "ffmpegGetChannelCount", int.class, long.class);
            a.sampleRate = nativeMethod(decoder, "ffmpegGetSampleRate", int.class, long.class);
            a.reset = nativeMethod(decoder, "ffmpegReset", long.class, long.class, byte[].class);
            a.release = nativeMethod(decoder, "ffmpegRelease", void.class, long.class);
            a.hasDecoder = nativeMethod(library, "ffmpegHasDecoder", boolean.class, String.class);
            Method padding = nativeMethod(library, "ffmpegGetInputBufferPaddingSize", int.class);
            for (Field f : a.outputClass.getDeclaredFields()) {
                if (f.getType() == ByteBuffer.class && !Modifier.isStatic(f.getModifiers())) {
                    if (a.outputData != null) throw new NoSuchFieldException("two buffers");
                    a.outputData = f;
                }
            }
            if (a.outputData == null) throw new NoSuchFieldException("no buffer");
            a.outputData.setAccessible(true);
            Class<?> unsafe = Class.forName("sun.misc.Unsafe");
            Field theUnsafe = unsafe.getDeclaredField("theUnsafe");
            theUnsafe.setAccessible(true);
            a.unsafe = theUnsafe.get(null);
            a.allocate = unsafe.getMethod("allocateInstance", Class.class);
            // Already loaded by the player means nothing happens here; same class loader, same library.
            System.loadLibrary(build[2]);
            a.padding = (Integer) padding.invoke(null);
            if (a.padding < 0 || a.padding > 4096) throw new NoSuchMethodException("padding " + a.padding);
            log.log("ffmpeg found: " + build[2]);
            return a;
        }
        throw missing;
    }

    private static Method nativeMethod(Class<?> owner, String name, Class<?> returns, Class<?>... params) throws NoSuchMethodException {
        Method m = owner.getDeclaredMethod(name, params);
        if (m.getReturnType() != returns || !Modifier.isNative(m.getModifiers())) throw new NoSuchMethodException(name);
        m.setAccessible(true);
        return m;
    }

    public static final class Factory implements AudioDecoder.Factory {
        private final DemuxLog log;
        private final Map<String, Boolean> has = new HashMap<>();

        public Factory(DemuxLog log) {
            this.log = log;
        }

        @Override
        public synchronized boolean canDecode(String mime) {
            String name = codecName(mime);
            if (name == null) return false;
            Boolean known = has.get(name);
            if (known != null) return known;
            boolean yes = false;
            App a = app(log);
            if (a != null) {
                try {
                    yes = (Boolean) a.hasDecoder.invoke(null, name);
                    if (!yes) log.log("ffmpeg refused: no-decoder " + name);
                } catch (ReflectiveOperationException | RuntimeException | LinkageError e) {
                    log.log("ffmpeg refused: failed " + e.getClass().getSimpleName());
                }
            }
            has.put(name, yes);
            return yes;
        }

        @Override
        public boolean isSoftware(String mime) {
            return canDecode(mime);
        }

        @Override
        public AudioDecoder create(TrackInfo track, Output output) throws DemuxException {
            if (!canDecode(track.mime)) throw new DemuxException(DemuxException.Kind.DECODER_MISSING, track.mime);
            return new AppFfmpegDecoder(app(log), track, output);
        }
    }

    private final App a;
    private final String name;
    private final int rawRate, rawChannels;
    private final Output output;
    private final Object owner, outputHolder;
    private ByteBuffer in, out;
    private long context;
    private long layout = NO_LAYOUT;
    private boolean converterMade;

    private AppFfmpegDecoder(App a, TrackInfo track, Output output) throws DemuxException {
        this.a = a;
        this.name = codecName(track.mime);
        this.rawRate = track.sampleRate;
        this.rawChannels = track.channels;
        this.output = output;
        try {
            owner = a.allocate(a.decoderClass);
            outputHolder = a.allocate(a.outputClass);
            in = ByteBuffer.allocateDirect(16 * 1024 + a.padding).order(ByteOrder.nativeOrder());
            out = ByteBuffer.allocateDirect(FIRST_OUTPUT_BYTES).order(ByteOrder.nativeOrder());
            open();
        } catch (ReflectiveOperationException | RuntimeException | LinkageError | OutOfMemoryError e) {
            throw new DemuxException(DemuxException.Kind.DECODER_FAILED, "ffmpeg open " + e.getClass().getSimpleName());
        }
    }

    private void open() throws ReflectiveOperationException, DemuxException {
        context = (Long) a.init.invoke(owner, name, null, false, rawRate, rawChannels);
        if (context == 0) throw new DemuxException(DemuxException.Kind.DECODER_FAILED, "ffmpeg no context " + name);
    }

    @Override
    public void queue(byte[] data, int off, int len, long ptsUs) throws DemuxException {
        int size = "dca".equals(name) ? dtsCoreBytes(data, off, len) : len;
        if (size <= 0) return;
        if (size > MAX_FRAME_BYTES) throw new DemuxException(DemuxException.Kind.DECODER_FAILED, "frame " + size + " over limit");
        if (context == 0) throw new DemuxException(DemuxException.Kind.DECODER_FAILED, "ffmpeg no context");
        try {
            // The native converter keeps the channel count of the first frame, and a frame with fewer
            // channels makes it read missing planes: a crash, measured. A new context is the only reset.
            // So FFmpeg only gets a frame whose channels can be read first; only TrueHD says it now and then.
            long said = layoutOf(name, data, off, size);
            if (said == NO_LAYOUT) {
                if (!"truehd".equals(name)) return;
            } else if (said != layout) {
                if (converterMade) reopen();
                layout = said;
            }
            int needed = size + a.padding;
            if (in.capacity() < needed) in = ByteBuffer.allocateDirect(needed * 2).order(ByteOrder.nativeOrder());
            in.clear();
            in.put(data, off, size);
            for (int i = 0; i < a.padding; i++) in.put((byte) 0); // FFmpeg's readers may look this far past the end.
            in.position(0).limit(size);
            out.position(0).limit(out.capacity());
            a.outputData.set(outputHolder, out);
            int got = (Integer) a.decode.invoke(owner, context, in, size, outputHolder, out, out.capacity());
            out = (ByteBuffer) a.outputData.get(outputHolder); // The native side may have grown it.
            if (got == ERROR_OTHER) throw new DemuxException(DemuxException.Kind.DECODER_FAILED, "ffmpeg decode " + name);
            if (got == ERROR_INVALID_DATA || got <= 0) return; // A bad frame, or none yet: no output, like MediaCodec.
            converterMade = true;
            int channels = (Integer) a.channelCount.invoke(owner, context);
            int rate = (Integer) a.sampleRate.invoke(owner, context);
            ByteBuffer pcm = out.duplicate().order(ByteOrder.nativeOrder());
            pcm.position(0).limit(got);
            output.onDecoded(pcm, PCM_16BIT, channels, rate, ptsUs);
        } catch (ReflectiveOperationException | RuntimeException | LinkageError | OutOfMemoryError e) {
            throw new DemuxException(DemuxException.Kind.DECODER_FAILED, "ffmpeg " + e.getClass().getSimpleName());
        }
    }

    private void reopen() throws ReflectiveOperationException, DemuxException {
        long old = context;
        context = 0;
        a.release.invoke(owner, old);
        converterMade = false;
        open();
    }

    /** These decoders hold no frames back, and the native API has no way to ask. */
    @Override
    public void drainToEnd() {
    }

    @Override
    public void flush() throws DemuxException {
        try {
            // TrueHD cannot be flushed, so the native side replaces its context: the old one is gone.
            long old = context;
            if (old == 0) throw new DemuxException(DemuxException.Kind.DECODER_FAILED, "ffmpeg no context");
            context = 0;
            context = (Long) a.reset.invoke(owner, old, null);
            if (context == 0) throw new DemuxException(DemuxException.Kind.DECODER_FAILED, "ffmpeg reset " + name);
            if ("truehd".equals(name)) converterMade = false;
        } catch (ReflectiveOperationException | RuntimeException | LinkageError e) {
            throw new DemuxException(DemuxException.Kind.DECODER_FAILED, "ffmpeg reset " + e.getClass().getSimpleName());
        }
    }

    @Override
    public void release() {
        long old = context;
        context = 0;
        if (old == 0) return;
        try {
            a.release.invoke(owner, old);
        } catch (ReflectiveOperationException | RuntimeException | LinkageError ignored) {
            // Nothing more can be done from here, and the job is ending anyway.
        }
    }

    /**
     * DTS-HD keeps a complete core first and its lossless or high-rate part after it. The core is the
     * same mix at about half the work on a real 5.1 MA file, and its format and channels are the ones
     * the header says, so the rest is cut off. Anything unexpected stays whole.
     */
    static int dtsCoreBytes(byte[] b, int off, int len) {
        if (!isDtsCore(b, off, len)) return len;
        int core = bits(b, off, 46, 14) + 1;
        int e = off + (core + 3 & ~3); // The extension starts on a 4-byte boundary, as FFmpeg looks for it.
        if (e + 4 > off + len || core < 11) return len;
        boolean extension = (b[e] & 0xFF) == 0x64 && (b[e + 1] & 0xFF) == 0x58 && (b[e + 2] & 0xFF) == 0x20 && (b[e + 3] & 0xFF) == 0x25;
        return extension ? core : len;
    }

    private static boolean isDtsCore(byte[] b, int off, int len) {
        return len >= 11 && (b[off] & 0xFF) == 0x7F && (b[off + 1] & 0xFF) == 0xFE && (b[off + 2] & 0xFF) == 0x80 && (b[off + 3] & 0xFF) == 0x01;
    }

    /** A number that changes when a frame's channel layout does; NO_LAYOUT when the frame does not say. */
    static long layoutOf(String codec, byte[] b, int off, int len) {
        switch (codec) {
            case "ac3":
            case "eac3":
                return ac3Layout(b, off, len);
            case "truehd": // Major sync: format_info after the signature, substream counts further on.
                if (len >= 22 && (b[off + 4] & 0xFF) == 0xF8 && (b[off + 5] & 0xFF) == 0x72 && (b[off + 6] & 0xFF) == 0x6F && (b[off + 7] & 0xFF) == 0xBA) {
                    return (bits(b, off, 64, 32) & 0xFFFFFFFFL) << 16 | bits(b, off, 160, 16);
                }
                return NO_LAYOUT;
            case "dca": // AMODE, then the extension id and flag, then LFF.
                return isDtsCore(b, off, len) ? bits(b, off, 60, 6) << 7 | bits(b, off, 80, 4) << 2 | bits(b, off, 85, 2) : NO_LAYOUT;
            case "mp3":
                return len >= 4 && (b[off] & 0xFF) == 0xFF ? (b[off + 3] & 0xC0) == 0xC0 ? 1 : 2 : NO_LAYOUT;
            default:
                return NO_LAYOUT;
        }
    }

    /** Walks every frame of a packet: a dependent E-AC-3 frame adds channels, after an AC-3 core too. */
    private static long ac3Layout(byte[] b, int off, int len) {
        long layout = NO_LAYOUT;
        int p = off, end = off + len;
        while (end - p >= 12 && (b[p] & 0xFF) == 0x0B && (b[p + 1] & 0xFF) == 0x77) {
            int bsid = (b[p + 5] & 0xFF) >> 3, step, acmod, lfe, map = 0;
            if (bsid > 16) break;
            if (bsid > 10) {
                step = (bits(b, p, 21, 11) + 1) * 2;
                acmod = bits(b, p, 36, 3);
                lfe = bits(b, p, 39, 1);
                map = bits(b, p, 16, 2) == 1 ? eac3ChannelMap(b, p, acmod) : 0;
            } else {
                int code = b[p + 4] & 0x3F, rate = (b[p + 4] & 0xFF) >> 6;
                if (rate == 3 || code >= 38) break;
                int kbps = AC3_KBPS[code >> 1];
                step = 2 * (rate == 0 ? 2 * kbps : rate == 2 ? 3 * kbps : kbps * 320 / 147 + (code & 1));
                acmod = bits(b, p, 48, 3);
                int at = 51 + ((acmod & 1) != 0 && acmod != 1 ? 2 : 0) + ((acmod & 4) != 0 ? 2 : 0) + (acmod == 2 ? 2 : 0);
                lfe = bits(b, p, at, 1);
            }
            layout = (layout == NO_LAYOUT ? 0 : layout * 31) + (acmod * 2 + lfe + 1) * 65537L + map;
            if (step <= 0 || step > end - p) break;
            p += step;
        }
        return layout;
    }

    /** A dependent frame's chanmap, which overrides what its acmod says: 0 when it has none. */
    private static int eac3ChannelMap(byte[] b, int p, int acmod) {
        int at = 50; // After bsid and dialnorm.
        at += bits(b, p, at, 1) == 1 ? 9 : 1;
        if (acmod == 0) {
            at += 5;
            at += bits(b, p, at, 1) == 1 ? 9 : 1;
        }
        return bits(b, p, at, 1) == 1 ? bits(b, p, at + 1, 16) : 0;
    }

    /** Big-endian bits from a bit offset, up to 32 of them. Callers check the length first. */
    private static int bits(byte[] b, int off, int bit, int count) {
        int v = 0;
        for (int i = bit; i < bit + count; i++) v = v << 1 | (b[off + (i >> 3)] >> (7 - (i & 7)) & 1);
        return v;
    }
}
