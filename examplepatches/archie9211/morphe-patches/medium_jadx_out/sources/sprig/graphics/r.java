package sprig.graphics;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.media.MediaCodec;
import android.media.MediaCrypto;
import android.media.MediaFormat;
import android.media.MediaMuxer;
import android.opengl.EGL14;
import android.opengl.EGLConfig;
import android.opengl.EGLContext;
import android.opengl.EGLDisplay;
import android.opengl.EGLExt;
import android.opengl.EGLSurface;
import android.opengl.GLUtils;
import android.opengl.Matrix;
import android.util.Size;
import android.view.Surface;
import com.medium.android.data.catalog.KnyB.uvlZTF;
import com.userleap.EventName;
import com.userleap.SprigEvent;
import defpackage.ajb;
import defpackage.b09;
import defpackage.bjb;
import defpackage.bu1;
import defpackage.c1e;
import defpackage.cu1;
import defpackage.ev6;
import defpackage.g76;
import defpackage.ho2;
import defpackage.ka1;
import defpackage.kyd;
import defpackage.oh4;
import defpackage.pwd;
import defpackage.ygf;
import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import org.json.JSONException;
import sprig.b.b;
import sprig.j.e;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000¬\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\u0014\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\t\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0005\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J2\u0010\r\u001a\b\u0012\u0004\u0012\u00020\n0\t2\u0006\u0010\u0005\u001a\u00020\u00042\f\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006ø\u0001\u0000ø\u0001\u0001ø\u0001\u0002¢\u0006\u0004\b\u000b\u0010\fJ%\u0010\u000e\u001a\u00020\n2\u0006\u0010\u0005\u001a\u00020\u00042\f\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006H\u0002¢\u0006\u0004\b\u000e\u0010\u000fJ\u001f\u0010\u0011\u001a\u0004\u0018\u00010\u00102\f\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006H\u0002¢\u0006\u0004\b\u0011\u0010\u0012J\u0017\u0010\u0011\u001a\u00020\u00142\u0006\u0010\u0013\u001a\u00020\u0010H\u0002¢\u0006\u0004\b\u0011\u0010\u0015J\u0017\u0010\u000e\u001a\u00020\u00162\u0006\u0010\u0013\u001a\u00020\u0010H\u0002¢\u0006\u0004\b\u000e\u0010\u0017J\u0017\u0010\u000e\u001a\u00020\n2\u0006\u0010\u0019\u001a\u00020\u0018H\u0002¢\u0006\u0004\b\u000e\u0010\u001aJ\u001d\u0010\u000e\u001a\u00020\n2\f\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006H\u0002¢\u0006\u0004\b\u000e\u0010\u001bJ\u0017\u0010\u000e\u001a\u00020\n2\u0006\u0010\u001c\u001a\u00020\u0016H\u0002¢\u0006\u0004\b\u000e\u0010\u001dJ\u0019\u0010\u000e\u001a\u0004\u0018\u00010\u00182\u0006\u0010\u001f\u001a\u00020\u001eH\u0002¢\u0006\u0004\b\u000e\u0010 J\u000f\u0010\u000e\u001a\u00020!H\u0002¢\u0006\u0004\b\u000e\u0010\"J\u000f\u0010#\u001a\u00020\nH\u0002¢\u0006\u0004\b#\u0010\u0003J\u000f\u0010\u0011\u001a\u00020\nH\u0002¢\u0006\u0004\b\u0011\u0010\u0003J\u0013\u0010\u000e\u001a\u00020$*\u00020\u0007H\u0002¢\u0006\u0004\b\u000e\u0010%J\u001f\u0010\u000e\u001a\u00020\u00162\u0006\u0010&\u001a\u00020\u00162\u0006\u0010'\u001a\u00020\u0016H\u0002¢\u0006\u0004\b\u000e\u0010(R\u0018\u0010\u0019\u001a\u0004\u0018\u00010\u00188\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u000e\u0010)R\u0018\u0010,\u001a\u0004\u0018\u00010*8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u0011\u0010+R\u0016\u0010.\u001a\u00020\u00048\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b#\u0010-R\u0016\u00101\u001a\u00020\u00168\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b/\u00100R\u0016\u00105\u001a\u0002028\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b3\u00104R\u0016\u00107\u001a\u00020\u00168\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b6\u00100R\u0014\u00109\u001a\u0002028\u0002X\u0082D¢\u0006\u0006\n\u0004\b8\u00104R\u0014\u0010=\u001a\u00020:8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b;\u0010<R\u0016\u0010\u0013\u001a\u00020\u00108\u0002@\u0002X\u0082.¢\u0006\u0006\n\u0004\b>\u0010?R\u0014\u0010C\u001a\u00020@8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bA\u0010BR\u0018\u0010G\u001a\u0004\u0018\u00010D8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bE\u0010FR\u0018\u0010K\u001a\u0004\u0018\u00010H8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bI\u0010JR\u0018\u0010O\u001a\u0004\u0018\u00010L8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bM\u0010NR\u0018\u0010S\u001a\u0004\u0018\u00010P8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bQ\u0010RR\u0016\u0010W\u001a\u00020T8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bU\u0010VR\u0014\u0010Y\u001a\u00020\u00168\u0002X\u0082D¢\u0006\u0006\n\u0004\bX\u00100R\u001c\u0010^\u001a\n [*\u0004\u0018\u00010Z0Z8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\\\u0010]\u0082\u0002\u000f\n\u0002\b!\n\u0005\b¡\u001e0\u0001\n\u0002\b\u0019¨\u0006_"}, d2 = {"Lsprig/h/r;", "", "<init>", "()V", "", "outVideoFilePath", "", "Ljava/io/File;", "images", "Lbjb;", "Lc1e;", "encode-gIAlu-s", "(Ljava/lang/String;Ljava/util/List;)Ljava/lang/Object;", "encode", "a", "(Ljava/lang/String;Ljava/util/List;)V", "Landroid/util/Size;", "b", "(Ljava/util/List;)Landroid/util/Size;", "size", "Landroid/media/MediaFormat;", "(Landroid/util/Size;)Landroid/media/MediaFormat;", "", "(Landroid/util/Size;)I", "Landroid/media/MediaCodec;", "encoder", "(Landroid/media/MediaCodec;)V", "(Ljava/util/List;)V", "imageCount", "(I)V", "", "endOfStream", "(Z)Landroid/media/MediaCodec;", "", "()[F", "c", "Landroid/graphics/Bitmap;", "(Ljava/io/File;)Landroid/graphics/Bitmap;", "width", "height", "(II)I", "Landroid/media/MediaCodec;", "Landroid/media/MediaMuxer;", "Landroid/media/MediaMuxer;", "muxer", "Ljava/lang/String;", "mime", "d", "I", "trackIndex", "", "e", "J", "presentationTimeUs", "f", "frameRate", "g", "timeoutUs", "Landroid/media/MediaCodec$BufferInfo;", "h", "Landroid/media/MediaCodec$BufferInfo;", "bufferInfo", "i", "Landroid/util/Size;", "Landroid/graphics/BitmapFactory$Options;", "j", "Landroid/graphics/BitmapFactory$Options;", "bitmapOptions", "Landroid/opengl/EGLDisplay;", "k", "Landroid/opengl/EGLDisplay;", "eglDisplay", "Landroid/opengl/EGLContext;", "l", "Landroid/opengl/EGLContext;", "eglContext", "Landroid/opengl/EGLSurface;", "m", "Landroid/opengl/EGLSurface;", "eglSurface", "Landroid/view/Surface;", "n", "Landroid/view/Surface;", "surface", "Lsprig/j/e;", "o", "Lsprig/j/e;", "logger", "p", "maxImageDimension", "Ljava/lang/Runtime;", "kotlin.jvm.PlatformType", "q", "Ljava/lang/Runtime;", "runtime", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final class r {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    public MediaCodec encoder;

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    public MediaMuxer muxer;

    /* JADX INFO: renamed from: e, reason: from kotlin metadata */
    public long presentationTimeUs;

    /* JADX INFO: renamed from: i, reason: from kotlin metadata */
    public Size size;

    /* JADX INFO: renamed from: j, reason: from kotlin metadata */
    public final BitmapFactory.Options bitmapOptions;

    /* JADX INFO: renamed from: k, reason: from kotlin metadata */
    public EGLDisplay eglDisplay;

    /* JADX INFO: renamed from: l, reason: from kotlin metadata */
    public EGLContext eglContext;

    /* JADX INFO: renamed from: m, reason: from kotlin metadata */
    public EGLSurface eglSurface;

    /* JADX INFO: renamed from: n, reason: from kotlin metadata */
    public Surface surface;

    /* JADX INFO: renamed from: o, reason: from kotlin metadata */
    public e logger;

    /* JADX INFO: renamed from: p, reason: from kotlin metadata */
    public final int maxImageDimension;

    /* JADX INFO: renamed from: q, reason: from kotlin metadata */
    public final Runtime runtime;

    /* JADX INFO: renamed from: c, reason: from kotlin metadata */
    public String mime = "video/avc";

    /* JADX INFO: renamed from: d, reason: from kotlin metadata */
    public int trackIndex = -1;

    /* JADX INFO: renamed from: f, reason: from kotlin metadata */
    public int frameRate = 2;

    /* JADX INFO: renamed from: g, reason: from kotlin metadata */
    public final long timeoutUs = 10000;

    /* JADX INFO: renamed from: h, reason: from kotlin metadata */
    public final MediaCodec.BufferInfo bufferInfo = new MediaCodec.BufferInfo();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\f\n\u0002\b\u0004\n\u0002\u0010\b\n\u0002\b\u0003\u0010\u0007\u001a\u00020\u0004\"\u0004\b\u0000\u0010\u00002\u000e\u0010\u0002\u001a\n \u0001*\u0004\u0018\u00018\u00008\u00002\u000e\u0010\u0003\u001a\n \u0001*\u0004\u0018\u00018\u00008\u0000H\n¢\u0006\u0004\b\u0005\u0010\u0006"}, d2 = {"T", "kotlin.jvm.PlatformType", "a", "b", "", "compare", "(Ljava/lang/Object;Ljava/lang/Object;)I", "<anonymous>"}, k = 3, mv = {1, 8, 0})
    public static final class a<T> implements Comparator {
        /* JADX WARN: Multi-variable type inference failed */
        @Override // java.util.Comparator
        public final int compare(T t, T t2) {
            return pwd.D(Long.valueOf(Long.parseLong(oh4.I0((File) t))), Long.valueOf(Long.parseLong(oh4.I0((File) t2))));
        }
    }

    public r() {
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inPreferredConfig = Bitmap.Config.RGB_565;
        options.inMutable = false;
        this.bitmapOptions = options;
        this.logger = new e();
        this.maxImageDimension = 4096;
        this.runtime = Runtime.getRuntime();
    }

    public final void a(String outVideoFilePath, List images) throws IOException {
        e.logDebug$default(this.logger, "Initializing encoder", "Output: " + outVideoFilePath + ", Images: " + images.size(), null, null, null, null, 60, null);
        MediaCodec mediaCodecCreateEncoderByType = MediaCodec.createEncoderByType(this.mime);
        Size sizeB = b(images);
        if (sizeB == null) {
            e eVar = this.logger;
            ArrayList arrayList = new ArrayList(cu1.k0(images, 10));
            Iterator it2 = images.iterator();
            while (it2.hasNext()) {
                File file = (File) it2.next();
                arrayList.add(file.getName() + " (exists: " + file.exists() + ", size: " + file.length() + ")");
            }
            e.logWarning$default(eVar, "No supported size found", null, "No supported size found for images: " + arrayList, null, null, null, 58, null);
            return;
        }
        this.size = sizeB;
        e eVar2 = this.logger;
        int width = sizeB.getWidth();
        Size size = this.size;
        if (size == null) {
            g76.g0("size");
            throw null;
        }
        e.logDebug$default(eVar2, "Video size determined", ev6.v("Width: ", width, size.getHeight(), ", Height: "), null, null, null, null, 60, null);
        Size size2 = this.size;
        if (size2 == null) {
            g76.g0("size");
            throw null;
        }
        if (size2.getWidth() != 0) {
            Size size3 = this.size;
            if (size3 == null) {
                g76.g0("size");
                throw null;
            }
            if (size3.getHeight() != 0) {
                Size size4 = this.size;
                if (size4 == null) {
                    g76.g0("size");
                    throw null;
                }
                MediaFormat mediaFormatB = b(size4);
                e.logDebug$default(this.logger, "Configuring encoder", "Format: " + mediaFormatB, null, null, null, null, 60, null);
                mediaCodecCreateEncoderByType.configure(mediaFormatB, (Surface) null, (MediaCrypto) null, 1);
                a(mediaCodecCreateEncoderByType);
                mediaCodecCreateEncoderByType.start();
                e eVar3 = this.logger;
                Size size5 = this.size;
                if (size5 == null) {
                    g76.g0("size");
                    throw null;
                }
                int width2 = size5.getWidth();
                Size size6 = this.size;
                if (size6 == null) {
                    g76.g0("size");
                    throw null;
                }
                e.logDebug$default(eVar3, "Encoder started successfully", ev6.v("Size: ", width2, size6.getHeight(), "x"), null, null, null, null, 60, null);
                this.muxer = new MediaMuxer(outVideoFilePath, 0);
                this.encoder = mediaCodecCreateEncoderByType;
                return;
            }
        }
        e eVar4 = this.logger;
        Size size7 = this.size;
        if (size7 == null) {
            g76.g0("size");
            throw null;
        }
        int width3 = size7.getWidth();
        Size size8 = this.size;
        if (size8 != null) {
            e.logWarning$default(eVar4, "Failed to init encoder", null, ev6.v("Size is 0. Width: ", width3, size8.getHeight(), ", Height: "), null, null, null, 58, null);
        } else {
            g76.g0("size");
            throw null;
        }
    }

    public final Size b(List images) {
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inJustDecodeBounds = true;
        e.logDebug$default(this.logger, "Calculating video size", ev6.w("Processing ", images.size(), " images"), null, null, null, null, 60, null);
        Iterator it2 = images.iterator();
        boolean z = false;
        int iMax = 0;
        int iMax2 = 0;
        while (it2.hasNext()) {
            File file = (File) it2.next();
            try {
            } catch (Exception e) {
                e = e;
            }
            if (!file.exists()) {
                e.logWarning$default(this.logger, "Image file does not exist", "Path: " + file.getPath(), null, null, null, null, 60, null);
            } else if (file.length() == 0) {
                e.logWarning$default(this.logger, "Image file is empty", "Path: " + file.getPath(), null, null, null, null, 60, null);
            } else {
                BitmapFactory.decodeFile(file.getPath(), options);
                e.logDebug$default(this.logger, "Image dimensions", "File: " + file.getName() + ", Width: " + options.outWidth + ", Height: " + options.outHeight, null, null, null, null, 60, null);
                int i = options.outWidth;
                if (i <= 0 || options.outHeight <= 0) {
                    e.logWarning$default(this.logger, "Invalid image dimensions", "File: " + file.getName() + ", Width: " + options.outWidth + ", Height: " + options.outHeight, null, null, null, null, 60, null);
                } else {
                    iMax = Math.max(iMax, i);
                    iMax2 = Math.max(iMax2, options.outHeight);
                    try {
                        e.logDebug$default(this.logger, "Updated max dimensions", "MaxWidth: " + iMax + ", MaxHeight: " + iMax2, null, null, null, null, 60, null);
                        z = true;
                    } catch (Exception e2) {
                        e = e2;
                        z = true;
                        e eVar = this.logger;
                        StringBuilder sbI = ho2.I(file.length(), "Failed to get dimensions for image: ", file.getPath(), ", size: ");
                        sbI.append(" bytes, error: ");
                        sbI.append(e);
                        e.logWarning$default(eVar, "Failed to get dimensions for image", null, sbI.toString(), null, null, null, 58, null);
                    }
                }
            }
        }
        if (z) {
            int i2 = this.maxImageDimension;
            if (iMax > i2) {
                e.logWarning$default(this.logger, "Width exceeds limit", ev6.v("Original: ", iMax, i2, ", Limited: "), null, null, null, null, 60, null);
                iMax = this.maxImageDimension;
                i2 = iMax;
            }
            if (iMax2 > i2) {
                e.logWarning$default(this.logger, "Height exceeds limit", ev6.v("Original: ", iMax2, i2, ", Limited: "), null, null, null, null, 60, null);
                iMax2 = this.maxImageDimension;
            }
            e.logDebug$default(this.logger, "Final video size", ev6.v("Width: ", iMax, iMax2, ", Height: "), null, null, null, null, 60, null);
            return new Size(iMax, iMax2);
        }
        e eVar2 = this.logger;
        ArrayList arrayList = new ArrayList(cu1.k0(images, 10));
        Iterator it3 = images.iterator();
        while (it3.hasNext()) {
            File file2 = (File) it3.next();
            arrayList.add(file2.getName() + " (" + file2.length() + " bytes, exists: " + file2.exists() + ")");
        }
        e.logWarning$default(eVar2, "Failed to calculate video size", null, "No valid images found in: " + arrayList, null, null, null, 58, null);
        return null;
    }

    public final void c() {
        MediaCodec mediaCodec = this.encoder;
        if (mediaCodec != null) {
            mediaCodec.stop();
            mediaCodec.release();
        }
        this.encoder = null;
        b();
        MediaMuxer mediaMuxer = this.muxer;
        if (mediaMuxer != null) {
            mediaMuxer.stop();
            mediaMuxer.release();
        }
        this.muxer = null;
        this.trackIndex = -1;
        this.presentationTimeUs = 0L;
    }

    /* JADX INFO: renamed from: encode-gIAlu-s, reason: not valid java name */
    public final Object m174encodegIAlus(String outVideoFilePath, List<? extends File> images) throws JSONException {
        Object ajbVar;
        outVideoFilePath.getClass();
        images.getClass();
        try {
            a(outVideoFilePath, images);
            a(images);
            b.INSTANCE.onEvent(new SprigEvent(EventName.REPLAY_RENDERING_COMPLETED, null));
            ajbVar = c1e.a;
        } catch (Throwable th) {
            ajbVar = new ajb(th);
        }
        Throwable thB = bjb.b(ajbVar);
        if (thB != null) {
            e.logError$default(this.logger, "Error encoding video", null, "Error encoding video: " + thB + ", outVideoFilePath: " + outVideoFilePath + ", images count: " + images.size(), kyd.h0(thB), null, null, 50, null);
        }
        c();
        return ajbVar;
    }

    public final int a(Size size) {
        int height = size.getHeight() * size.getWidth();
        if (height > 2073600) {
            return 2000000;
        }
        return height > 921600 ? 1500000 : 1000000;
    }

    public final void a(MediaCodec encoder) {
        this.surface = encoder.createInputSurface();
        EGLDisplay eGLDisplayEglGetDisplay = EGL14.eglGetDisplay(0);
        this.eglDisplay = eGLDisplayEglGetDisplay;
        if (!g76.L(eGLDisplayEglGetDisplay, EGL14.EGL_NO_DISPLAY)) {
            int[] iArr = new int[2];
            if (EGL14.eglInitialize(this.eglDisplay, iArr, 0, iArr, 1)) {
                EGLConfig[] eGLConfigArr = new EGLConfig[1];
                EGL14.eglChooseConfig(this.eglDisplay, new int[]{12324, 8, 12323, 8, 12322, 8, 12321, 8, 12352, 4, 12344}, 0, eGLConfigArr, 0, 1, new int[1], 0);
                int iEglGetError = EGL14.eglGetError();
                if (iEglGetError == 12288) {
                    this.eglContext = EGL14.eglCreateContext(this.eglDisplay, eGLConfigArr[0], EGL14.EGL_NO_CONTEXT, new int[]{12440, 2, 12344}, 0);
                    int iEglGetError2 = EGL14.eglGetError();
                    if (iEglGetError2 == 12288) {
                        this.eglSurface = EGL14.eglCreateWindowSurface(this.eglDisplay, eGLConfigArr[0], this.surface, new int[]{12344}, 0);
                        int iEglGetError3 = EGL14.eglGetError();
                        if (iEglGetError3 == 12288) {
                            EGLDisplay eGLDisplay = this.eglDisplay;
                            EGLSurface eGLSurface = this.eglSurface;
                            if (EGL14.eglMakeCurrent(eGLDisplay, eGLSurface, eGLSurface, this.eglContext)) {
                                return;
                            }
                            e.logWarning$default(this.logger, "Failed to make EGL current", null, GLUtils.getEGLErrorString(EGL14.eglGetError()), null, null, null, 58, null);
                            ygf.i(ka1.r("Failed to make EGL current: ", GLUtils.getEGLErrorString(EGL14.eglGetError())));
                            return;
                        }
                        e.logWarning$default(this.logger, "Failed to create EGL surface", null, GLUtils.getEGLErrorString(iEglGetError3), null, null, null, 58, null);
                        ygf.i(GLUtils.getEGLErrorString(iEglGetError3));
                        return;
                    }
                    e.logWarning$default(this.logger, "Failed to create EGL context", null, GLUtils.getEGLErrorString(iEglGetError2), null, null, null, 58, null);
                    ygf.i(GLUtils.getEGLErrorString(iEglGetError2));
                    return;
                }
                e.logWarning$default(this.logger, "Failed to choose config while initializing EGL", null, GLUtils.getEGLErrorString(iEglGetError), null, null, null, 58, null);
                ygf.i(GLUtils.getEGLErrorString(iEglGetError));
                return;
            }
            e.logWarning$default(this.logger, "Error initializing EGL", null, GLUtils.getEGLErrorString(EGL14.eglGetError()), null, null, null, 58, null);
            ygf.i(ka1.r("Error initializing EGL: ", GLUtils.getEGLErrorString(EGL14.eglGetError())));
            return;
        }
        String eGLErrorString = GLUtils.getEGLErrorString(EGL14.eglGetError());
        e.logWarning$default(this.logger, "Error getting EGL display", null, eGLErrorString, null, null, null, 58, null);
        ygf.i(ka1.r("Error getting EGL display: ", eGLErrorString));
    }

    public final void a(List images) throws InterruptedException {
        o oVar = new o();
        List listF1 = bu1.f1(images, new a());
        int size = listF1.size();
        int i = 0;
        int i2 = 0;
        while (i < size) {
            a(false);
            a(i2);
            File file = (File) listF1.get(i);
            i++;
            File file2 = (File) bu1.A0(i, listF1);
            if (file2 == null) {
                file2 = file;
            }
            Bitmap bitmapA = a(file);
            try {
                Size size2 = this.size;
                if (size2 != null) {
                    oVar.draw(size2, bitmapA, a());
                    EGLExt.eglPresentationTimeANDROID(this.eglDisplay, this.eglSurface, this.presentationTimeUs * 1000);
                    long j = Long.parseLong(oh4.I0(file2)) - Long.parseLong(oh4.I0(file));
                    long j2 = this.presentationTimeUs;
                    if (j == 0) {
                        this.presentationTimeUs = j2 + 1000000;
                    } else {
                        Long.signum(j);
                        this.presentationTimeUs = (j * 1000) + j2;
                    }
                    EGL14.eglSwapBuffers(this.eglDisplay, this.eglSurface);
                    i2++;
                    if (i2 % 5 == 0) {
                        System.gc();
                        Thread.sleep(10L);
                    }
                } else {
                    g76.g0("size");
                    throw null;
                }
            } finally {
                if (!bitmapA.isRecycled()) {
                    bitmapA.recycle();
                }
            }
        }
        a(true);
    }

    public final void a(int imageCount) throws InterruptedException {
        long jFreeMemory = this.runtime.totalMemory() - this.runtime.freeMemory();
        long jMaxMemory = this.runtime.maxMemory();
        int i = (int) ((100 * jFreeMemory) / jMaxMemory);
        if (i > 80) {
            e.logWarning$default(this.logger, "High memory usage detected", ev6.v("Memory usage: ", i, imageCount, "% at image "), null, null, null, null, 60, null);
            System.gc();
            Thread.sleep(15L);
        }
        if (imageCount % 10 == 0) {
            e eVar = this.logger;
            StringBuilder sbD = b09.D("Used: ", uvlZTF.fOINgr, (jFreeMemory / 1024) / 1024);
            sbD.append((jMaxMemory / 1024) / 1024);
            sbD.append("MB, Usage: ");
            sbD.append(i);
            sbD.append("%");
            e.logDebug$default(eVar, "Memory usage stats", sbD.toString(), null, null, null, null, 60, null);
        }
    }

    public final MediaCodec a(boolean endOfStream) {
        MediaCodec mediaCodec = this.encoder;
        if (mediaCodec == null) {
            return null;
        }
        MediaMuxer mediaMuxer = this.muxer;
        if (mediaMuxer != null) {
            if (endOfStream) {
                mediaCodec.signalEndOfInputStream();
            }
            while (true) {
                int iDequeueOutputBuffer = mediaCodec.dequeueOutputBuffer(this.bufferInfo, this.timeoutUs);
                if (iDequeueOutputBuffer >= 0) {
                    ByteBuffer outputBuffer = mediaCodec.getOutputBuffer(iDequeueOutputBuffer);
                    if (outputBuffer == null) {
                        break;
                    }
                    MediaCodec.BufferInfo bufferInfo = this.bufferInfo;
                    bufferInfo.presentationTimeUs = this.presentationTimeUs;
                    mediaMuxer.writeSampleData(this.trackIndex, outputBuffer, bufferInfo);
                    mediaCodec.releaseOutputBuffer(iDequeueOutputBuffer, false);
                    if ((this.bufferInfo.flags & 4) != 0) {
                        break;
                    }
                } else if (iDequeueOutputBuffer == -1) {
                    if (!endOfStream) {
                        break;
                    }
                } else if (iDequeueOutputBuffer == -2) {
                    MediaCodec mediaCodec2 = this.encoder;
                    mediaCodec2.getClass();
                    this.trackIndex = mediaMuxer.addTrack(mediaCodec2.getOutputFormat());
                    mediaMuxer.start();
                }
            }
        }
        return mediaCodec;
    }

    public final float[] a() {
        float[] fArr = new float[16];
        Matrix.setIdentityM(fArr, 0);
        Matrix.scaleM(fArr, 0, 1.0f, -1.0f, 1.0f);
        return fArr;
    }

    public final Bitmap a(File file) {
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inJustDecodeBounds = true;
        BitmapFactory.decodeFile(file.getPath(), options);
        int iA = a(options.outWidth, options.outHeight);
        BitmapFactory.Options options2 = new BitmapFactory.Options();
        options2.inSampleSize = iA;
        options2.inPreferredConfig = Bitmap.Config.RGB_565;
        options2.inMutable = false;
        Bitmap bitmapDecodeFile = BitmapFactory.decodeFile(file.getPath(), options2);
        e eVar = this.logger;
        if (bitmapDecodeFile != null) {
            int i = options.outWidth;
            int i2 = options.outHeight;
            int width = bitmapDecodeFile.getWidth();
            int height = bitmapDecodeFile.getHeight();
            int allocationByteCount = bitmapDecodeFile.getAllocationByteCount();
            StringBuilder sbB = ev6.B(i, i2, "Original: ", "x", ", Loaded: ");
            sbB.append(width);
            sbB.append("x");
            sbB.append(height);
            sbB.append(", Sample size: ");
            sbB.append(iA);
            sbB.append(", Memory: ");
            sbB.append(allocationByteCount);
            sbB.append(" bytes");
            e.logDebug$default(eVar, "Loaded bitmap", sbB.toString(), null, null, null, null, 60, null);
            return bitmapDecodeFile;
        }
        e.logWarning$default(eVar, "Failed to decode image", null, ka1.r("Failed to decode image: ", file.getPath()), null, null, null, 58, null);
        ygf.i(ka1.r("Failed to decode image: ", file.getPath()));
        return null;
    }

    public final int a(int width, int height) {
        int i = this.maxImageDimension;
        int i2 = 1;
        if (width <= i && height <= i) {
            return 1;
        }
        int iMin = Math.min(width, i);
        int iMin2 = Math.min(height, this.maxImageDimension);
        while (true) {
            int i3 = i2 * 2;
            if (width / i3 < iMin || height / i3 < iMin2) {
                break;
            }
            i2 = i3;
        }
        return i2;
    }

    public final MediaFormat b(Size size) {
        MediaFormat mediaFormatCreateVideoFormat = MediaFormat.createVideoFormat(this.mime, size.getWidth(), size.getHeight());
        mediaFormatCreateVideoFormat.setInteger("color-format", 2130708361);
        mediaFormatCreateVideoFormat.setInteger("bitrate", a(size));
        mediaFormatCreateVideoFormat.setInteger("frame-rate", this.frameRate);
        mediaFormatCreateVideoFormat.setInteger("i-frame-interval", 0);
        return mediaFormatCreateVideoFormat;
    }

    public final void b() {
        EGLDisplay eGLDisplay = this.eglDisplay;
        if (eGLDisplay == null || eGLDisplay.equals(EGL14.EGL_NO_DISPLAY)) {
            eGLDisplay = null;
        }
        if (eGLDisplay != null) {
            EGLSurface eGLSurface = this.eglSurface;
            if (eGLSurface != null) {
                EGL14.eglDestroySurface(eGLDisplay, eGLSurface);
            }
            EGLContext eGLContext = this.eglContext;
            if (eGLContext != null) {
                EGL14.eglDestroyContext(eGLDisplay, eGLContext);
            }
            EGL14.eglReleaseThread();
            EGL14.eglTerminate(eGLDisplay);
        }
        Surface surface = this.surface;
        if (surface != null) {
            surface.release();
        }
        this.surface = null;
        this.eglDisplay = EGL14.EGL_NO_DISPLAY;
        this.eglContext = EGL14.EGL_NO_CONTEXT;
        this.eglSurface = EGL14.EGL_NO_SURFACE;
    }
}
