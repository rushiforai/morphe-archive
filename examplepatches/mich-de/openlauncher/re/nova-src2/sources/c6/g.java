package c6;

import android.media.MediaMetadataRetriever;
import android.os.Build;
import android.util.Log;
import b.c0;
import com.vungle.ads.internal.protos.Sdk;
import java.io.BufferedInputStream;
import java.io.EOFException;
import java.io.FileDescriptor;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;
import java.util.TimeZone;
import java.util.regex.Pattern;
import java.util.zip.CRC32;

/* loaded from: classes2.dex */
public final class g {
    public static final String[] C;
    public static final int[] D;
    public static final byte[] E;
    public static final d F;
    public static final d[][] G;
    public static final d[] H;
    public static final HashMap[] I;
    public static final HashMap[] J;
    public static final HashSet K;
    public static final HashMap L;
    public static final Charset M;
    public static final byte[] N;
    public static final byte[] O;

    /* renamed from: a, reason: collision with root package name */
    public final FileDescriptor f19736a;

    /* renamed from: b, reason: collision with root package name */
    public int f19737b;

    /* renamed from: c, reason: collision with root package name */
    public final HashMap[] f19738c;

    /* renamed from: d, reason: collision with root package name */
    public final HashSet f19739d;

    /* renamed from: e, reason: collision with root package name */
    public ByteOrder f19740e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f19741f;

    /* renamed from: g, reason: collision with root package name */
    public int f19742g;

    /* renamed from: h, reason: collision with root package name */
    public int f19743h;

    /* renamed from: i, reason: collision with root package name */
    public int f19744i;

    /* renamed from: j, reason: collision with root package name */
    public int f19745j;

    /* renamed from: k, reason: collision with root package name */
    public static final boolean f19722k = Log.isLoggable("ExifInterface", 3);

    /* renamed from: l, reason: collision with root package name */
    public static final List f19723l = Arrays.asList(1, 6, 3, 8);

    /* renamed from: m, reason: collision with root package name */
    public static final List f19724m = Arrays.asList(2, 7, 4, 5);
    public static final int[] n = {8, 8, 8};
    public static final int[] o = {8};

    /* renamed from: p, reason: collision with root package name */
    public static final byte[] f19725p = {-1, -40, -1};

    /* renamed from: q, reason: collision with root package name */
    public static final byte[] f19726q = {102, 116, 121, 112};

    /* renamed from: r, reason: collision with root package name */
    public static final byte[] f19727r = {109, 105, 102, 49};

    /* renamed from: s, reason: collision with root package name */
    public static final byte[] f19728s = {104, 101, 105, 99};

    /* renamed from: t, reason: collision with root package name */
    public static final byte[] f19729t = {79, 76, 89, 77, 80, 0};

    /* renamed from: u, reason: collision with root package name */
    public static final byte[] f19730u = {79, 76, 89, 77, 80, 85, 83, 0, 73, 73};

    /* renamed from: v, reason: collision with root package name */
    public static final byte[] f19731v = {-119, 80, 78, 71, 13, 10, 26, 10};

    /* renamed from: w, reason: collision with root package name */
    public static final byte[] f19732w = {101, 88, 73, 102};

    /* renamed from: x, reason: collision with root package name */
    public static final byte[] f19733x = {73, 72, 68, 82};

    /* renamed from: y, reason: collision with root package name */
    public static final byte[] f19734y = {73, 69, 78, 68};

    /* renamed from: z, reason: collision with root package name */
    public static final byte[] f19735z = {82, 73, 70, 70};
    public static final byte[] A = {87, 69, 66, 80};
    public static final byte[] B = {69, 88, 73, 70};

    static {
        Charset.defaultCharset();
        Charset.defaultCharset();
        Charset.defaultCharset();
        Charset.defaultCharset();
        Charset.defaultCharset();
        C = new String[]{com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "BYTE", "STRING", "USHORT", "ULONG", "URATIONAL", "SBYTE", "UNDEFINED", "SSHORT", "SLONG", "SRATIONAL", "SINGLE", "DOUBLE", "IFD"};
        D = new int[]{0, 1, 1, 2, 4, 8, 1, 1, 2, 4, 8, 4, 8, 1};
        E = new byte[]{65, 83, 67, 73, 73, 0, 0, 0};
        d[] dVarArr = {new d("NewSubfileType", 254, 4), new d("SubfileType", 255, 4), new d("ImageWidth", 256, 3, 4), new d("ImageLength", 257, 3, 4), new d("BitsPerSample", 258, 3), new d("Compression", 259, 3), new d("PhotometricInterpretation", 262, 3), new d("ImageDescription", 270, 2), new d("Make", 271, 2), new d("Model", 272, 2), new d("StripOffsets", 273, 3, 4), new d("Orientation", 274, 3), new d("SamplesPerPixel", 277, 3), new d("RowsPerStrip", 278, 3, 4), new d("StripByteCounts", 279, 3, 4), new d("XResolution", 282, 5), new d("YResolution", 283, 5), new d("PlanarConfiguration", 284, 3), new d("ResolutionUnit", 296, 3), new d("TransferFunction", 301, 3), new d("Software", Sdk.SDKError.Reason.MRAID_BRIDGE_ERROR_VALUE, 2), new d("DateTime", 306, 2), new d("Artist", Sdk.SDKError.Reason.JSON_PARAMS_ENCODE_ERROR_VALUE, 2), new d("WhitePoint", Sdk.SDKError.Reason.AD_CLOSED_MISSING_HEARTBEAT_VALUE, 5), new d("PrimaryChromaticities", Sdk.SDKError.Reason.SILENT_MODE_MONITOR_ERROR_VALUE, 5), new d("SubIFDPointer", 330, 4), new d("JPEGInterchangeFormat", 513, 4), new d("JPEGInterchangeFormatLength", 514, 4), new d("YCbCrCoefficients", 529, 5), new d("YCbCrSubSampling", 530, 3), new d("YCbCrPositioning", 531, 3), new d("ReferenceBlackWhite", 532, 5), new d("Copyright", 33432, 2), new d("ExifIFDPointer", 34665, 4), new d("GPSInfoIFDPointer", 34853, 4), new d("SensorTopBorder", 4, 4), new d("SensorLeftBorder", 5, 4), new d("SensorBottomBorder", 6, 4), new d("SensorRightBorder", 7, 4), new d("ISO", 23, 3), new d("JpgFromRaw", 46, 7), new d("Xmp", Sdk.SDKError.Reason.DNS_OVER_HTTP_FAILED_VALUE, 1)};
        d[] dVarArr2 = {new d("ExposureTime", 33434, 5), new d("FNumber", 33437, 5), new d("ExposureProgram", 34850, 3), new d("SpectralSensitivity", 34852, 2), new d("PhotographicSensitivity", 34855, 3), new d("OECF", 34856, 7), new d("SensitivityType", 34864, 3), new d("StandardOutputSensitivity", 34865, 4), new d("RecommendedExposureIndex", 34866, 4), new d("ISOSpeed", 34867, 4), new d("ISOSpeedLatitudeyyy", 34868, 4), new d("ISOSpeedLatitudezzz", 34869, 4), new d("ExifVersion", 36864, 2), new d("DateTimeOriginal", 36867, 2), new d("DateTimeDigitized", 36868, 2), new d("OffsetTime", 36880, 2), new d("OffsetTimeOriginal", 36881, 2), new d("OffsetTimeDigitized", 36882, 2), new d("ComponentsConfiguration", 37121, 7), new d("CompressedBitsPerPixel", 37122, 5), new d("ShutterSpeedValue", 37377, 10), new d("ApertureValue", 37378, 5), new d("BrightnessValue", 37379, 10), new d("ExposureBiasValue", 37380, 10), new d("MaxApertureValue", 37381, 5), new d("SubjectDistance", 37382, 5), new d("MeteringMode", 37383, 3), new d("LightSource", 37384, 3), new d("Flash", 37385, 3), new d("FocalLength", 37386, 5), new d("SubjectArea", 37396, 3), new d("MakerNote", 37500, 7), new d("UserComment", 37510, 7), new d("SubSecTime", 37520, 2), new d("SubSecTimeOriginal", 37521, 2), new d("SubSecTimeDigitized", 37522, 2), new d("FlashpixVersion", 40960, 7), new d("ColorSpace", 40961, 3), new d("PixelXDimension", 40962, 3, 4), new d("PixelYDimension", 40963, 3, 4), new d("RelatedSoundFile", 40964, 2), new d("InteroperabilityIFDPointer", 40965, 4), new d("FlashEnergy", 41483, 5), new d("SpatialFrequencyResponse", 41484, 7), new d("FocalPlaneXResolution", 41486, 5), new d("FocalPlaneYResolution", 41487, 5), new d("FocalPlaneResolutionUnit", 41488, 3), new d("SubjectLocation", 41492, 3), new d("ExposureIndex", 41493, 5), new d("SensingMethod", 41495, 3), new d("FileSource", 41728, 7), new d("SceneType", 41729, 7), new d("CFAPattern", 41730, 7), new d("CustomRendered", 41985, 3), new d("ExposureMode", 41986, 3), new d("WhiteBalance", 41987, 3), new d("DigitalZoomRatio", 41988, 5), new d("FocalLengthIn35mmFilm", 41989, 3), new d("SceneCaptureType", 41990, 3), new d("GainControl", 41991, 3), new d("Contrast", 41992, 3), new d("Saturation", 41993, 3), new d("Sharpness", 41994, 3), new d("DeviceSettingDescription", 41995, 7), new d("SubjectDistanceRange", 41996, 3), new d("ImageUniqueID", 42016, 2), new d("CameraOwnerName", 42032, 2), new d("BodySerialNumber", 42033, 2), new d("LensSpecification", 42034, 5), new d("LensMake", 42035, 2), new d("LensModel", 42036, 2), new d("Gamma", 42240, 5), new d("DNGVersion", 50706, 1), new d("DefaultCropSize", 50720, 3, 4)};
        d[] dVarArr3 = {new d("GPSVersionID", 0, 1), new d("GPSLatitudeRef", 1, 2), new d("GPSLatitude", 2, 5, 10), new d("GPSLongitudeRef", 3, 2), new d("GPSLongitude", 4, 5, 10), new d("GPSAltitudeRef", 5, 1), new d("GPSAltitude", 6, 5), new d("GPSTimeStamp", 7, 5), new d("GPSSatellites", 8, 2), new d("GPSStatus", 9, 2), new d("GPSMeasureMode", 10, 2), new d("GPSDOP", 11, 5), new d("GPSSpeedRef", 12, 2), new d("GPSSpeed", 13, 5), new d("GPSTrackRef", 14, 2), new d("GPSTrack", 15, 5), new d("GPSImgDirectionRef", 16, 2), new d("GPSImgDirection", 17, 5), new d("GPSMapDatum", 18, 2), new d("GPSDestLatitudeRef", 19, 2), new d("GPSDestLatitude", 20, 5), new d("GPSDestLongitudeRef", 21, 2), new d("GPSDestLongitude", 22, 5), new d("GPSDestBearingRef", 23, 2), new d("GPSDestBearing", 24, 5), new d("GPSDestDistanceRef", 25, 2), new d("GPSDestDistance", 26, 5), new d("GPSProcessingMethod", 27, 7), new d("GPSAreaInformation", 28, 7), new d("GPSDateStamp", 29, 2), new d("GPSDifferential", 30, 3), new d("GPSHPositioningError", 31, 5)};
        d[] dVarArr4 = {new d("InteroperabilityIndex", 1, 2)};
        d[] dVarArr5 = {new d("NewSubfileType", 254, 4), new d("SubfileType", 255, 4), new d("ThumbnailImageWidth", 256, 3, 4), new d("ThumbnailImageLength", 257, 3, 4), new d("BitsPerSample", 258, 3), new d("Compression", 259, 3), new d("PhotometricInterpretation", 262, 3), new d("ImageDescription", 270, 2), new d("Make", 271, 2), new d("Model", 272, 2), new d("StripOffsets", 273, 3, 4), new d("ThumbnailOrientation", 274, 3), new d("SamplesPerPixel", 277, 3), new d("RowsPerStrip", 278, 3, 4), new d("StripByteCounts", 279, 3, 4), new d("XResolution", 282, 5), new d("YResolution", 283, 5), new d("PlanarConfiguration", 284, 3), new d("ResolutionUnit", 296, 3), new d("TransferFunction", 301, 3), new d("Software", Sdk.SDKError.Reason.MRAID_BRIDGE_ERROR_VALUE, 2), new d("DateTime", 306, 2), new d("Artist", Sdk.SDKError.Reason.JSON_PARAMS_ENCODE_ERROR_VALUE, 2), new d("WhitePoint", Sdk.SDKError.Reason.AD_CLOSED_MISSING_HEARTBEAT_VALUE, 5), new d("PrimaryChromaticities", Sdk.SDKError.Reason.SILENT_MODE_MONITOR_ERROR_VALUE, 5), new d("SubIFDPointer", 330, 4), new d("JPEGInterchangeFormat", 513, 4), new d("JPEGInterchangeFormatLength", 514, 4), new d("YCbCrCoefficients", 529, 5), new d("YCbCrSubSampling", 530, 3), new d("YCbCrPositioning", 531, 3), new d("ReferenceBlackWhite", 532, 5), new d("Copyright", 33432, 2), new d("ExifIFDPointer", 34665, 4), new d("GPSInfoIFDPointer", 34853, 4), new d("DNGVersion", 50706, 1), new d("DefaultCropSize", 50720, 3, 4)};
        F = new d("StripOffsets", 273, 3);
        G = new d[][]{dVarArr, dVarArr2, dVarArr3, dVarArr4, dVarArr5, dVarArr, new d[]{new d("ThumbnailImage", 256, 7), new d("CameraSettingsIFDPointer", 8224, 4), new d("ImageProcessingIFDPointer", 8256, 4)}, new d[]{new d("PreviewImageStart", 257, 4), new d("PreviewImageLength", 258, 4)}, new d[]{new d("AspectFrame", 4371, 3)}, new d[]{new d("ColorSpace", 55, 3)}};
        H = new d[]{new d("SubIFDPointer", 330, 4), new d("ExifIFDPointer", 34665, 4), new d("GPSInfoIFDPointer", 34853, 4), new d("InteroperabilityIFDPointer", 40965, 4), new d("CameraSettingsIFDPointer", 8224, 1), new d("ImageProcessingIFDPointer", 8256, 1)};
        I = new HashMap[10];
        J = new HashMap[10];
        K = new HashSet(Arrays.asList("FNumber", "DigitalZoomRatio", "ExposureTime", "SubjectDistance", "GPSTimeStamp"));
        L = new HashMap();
        Charset charsetForName = Charset.forName("US-ASCII");
        M = charsetForName;
        N = "Exif\u0000\u0000".getBytes(charsetForName);
        O = "http://ns.adobe.com/xap/1.0/\u0000".getBytes(charsetForName);
        Locale locale = Locale.US;
        new SimpleDateFormat("yyyy:MM:dd HH:mm:ss", locale).setTimeZone(TimeZone.getTimeZone("UTC"));
        new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", locale).setTimeZone(TimeZone.getTimeZone("UTC"));
        int i5 = 0;
        while (true) {
            d[][] dVarArr6 = G;
            if (i5 >= dVarArr6.length) {
                HashMap map = L;
                d[] dVarArr7 = H;
                map.put(Integer.valueOf(dVarArr7[0].f19716a), 5);
                map.put(Integer.valueOf(dVarArr7[1].f19716a), 1);
                map.put(Integer.valueOf(dVarArr7[2].f19716a), 2);
                map.put(Integer.valueOf(dVarArr7[3].f19716a), 3);
                map.put(Integer.valueOf(dVarArr7[4].f19716a), 7);
                map.put(Integer.valueOf(dVarArr7[5].f19716a), 8);
                Pattern.compile(".*[1-9].*");
                Pattern.compile("^(\\d{2}):(\\d{2}):(\\d{2})$");
                Pattern.compile("^(\\d{4}):(\\d{2}):(\\d{2})\\s(\\d{2}):(\\d{2}):(\\d{2})$");
                Pattern.compile("^(\\d{4})-(\\d{2})-(\\d{2})\\s(\\d{2}):(\\d{2}):(\\d{2})$");
                return;
            }
            I[i5] = new HashMap();
            J[i5] = new HashMap();
            for (d dVar : dVarArr6[i5]) {
                I[i5].put(Integer.valueOf(dVar.f19716a), dVar);
                J[i5].put(dVar.f19717b, dVar);
            }
            i5++;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:42:0x00a8 A[Catch: all -> 0x002e, TRY_ENTER, TRY_LEAVE, TryCatch #2 {all -> 0x002e, blocks: (B:3:0x001f, B:5:0x0022, B:12:0x0037, B:18:0x0054, B:20:0x005f, B:28:0x0075, B:23:0x0066, B:26:0x006e, B:27:0x0072, B:29:0x007f, B:31:0x0088, B:33:0x008e, B:35:0x0094, B:37:0x009a, B:42:0x00a8), top: B:52:0x001f }] */
    /* JADX WARN: Removed duplicated region for block: B:55:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public g(o8.g gVar) throws Throwable {
        d[][] dVarArr = G;
        this.f19738c = new HashMap[dVarArr.length];
        this.f19739d = new HashSet(dVarArr.length);
        this.f19740e = ByteOrder.BIG_ENDIAN;
        this.f19736a = null;
        boolean z11 = f19722k;
        for (int i5 = 0; i5 < dVarArr.length; i5++) {
            try {
                try {
                    this.f19738c[i5] = new HashMap();
                } catch (Throwable th2) {
                    a();
                    if (z11) {
                        p();
                    }
                    throw th2;
                }
            } catch (IOException e3) {
                e = e3;
                if (z11) {
                    Log.w("ExifInterface", "Invalid image: ExifInterface got an unsupported image format file(ExifInterface supports JPEG and some RAW image formats only) or a corrupted JPEG file to ExifInterface.", e);
                }
                a();
                if (!z11) {
                    return;
                }
                p();
            } catch (UnsupportedOperationException e11) {
                e = e11;
                if (z11) {
                }
                a();
                if (!z11) {
                }
                p();
            }
        }
        BufferedInputStream bufferedInputStream = new BufferedInputStream(gVar, 5000);
        int iF = f(bufferedInputStream);
        this.f19737b = iF;
        if (iF == 4 || iF == 9 || iF == 13 || iF == 14) {
            b bVar = new b(bufferedInputStream);
            int i11 = this.f19737b;
            if (i11 == 4) {
                e(bVar, 0, 0);
            } else if (i11 == 13) {
                h(bVar);
            } else if (i11 == 9) {
                i(bVar);
            } else if (i11 == 14) {
                l(bVar);
            }
        } else {
            f fVar = new f(bufferedInputStream);
            int i12 = this.f19737b;
            if (i12 == 12) {
                d(fVar);
            } else if (i12 == 7) {
                g(fVar);
            } else if (i12 == 10) {
                k(fVar);
            } else {
                j(fVar);
            }
            fVar.b(this.f19742g);
            u(fVar);
        }
        a();
        if (!z11) {
            return;
        }
        p();
    }

    public static ByteOrder q(b bVar) throws IOException {
        short s11 = bVar.readShort();
        if (s11 == 18761) {
            return ByteOrder.LITTLE_ENDIAN;
        }
        if (s11 == 19789) {
            return ByteOrder.BIG_ENDIAN;
        }
        throw new IOException("Invalid byte order: " + Integer.toHexString(s11));
    }

    public final void a() {
        String strB = b("DateTimeOriginal");
        HashMap[] mapArr = this.f19738c;
        if (strB != null && b("DateTime") == null) {
            HashMap map = mapArr[0];
            byte[] bytes = strB.concat("\u0000").getBytes(M);
            map.put("DateTime", new c(2, bytes.length, bytes));
        }
        if (b("ImageWidth") == null) {
            mapArr[0].put("ImageWidth", c.a(0L, this.f19740e));
        }
        if (b("ImageLength") == null) {
            mapArr[0].put("ImageLength", c.a(0L, this.f19740e));
        }
        if (b("Orientation") == null) {
            mapArr[0].put("Orientation", c.a(0L, this.f19740e));
        }
        if (b("LightSource") == null) {
            mapArr[1].put("LightSource", c.a(0L, this.f19740e));
        }
    }

    public final String b(String str) {
        c cVarC = c(str);
        if (cVarC != null) {
            int i5 = cVarC.f19712a;
            if (!K.contains(str)) {
                return cVarC.f(this.f19740e);
            }
            if (str.equals("GPSTimeStamp")) {
                if (i5 != 5 && i5 != 10) {
                    Log.w("ExifInterface", "GPS Timestamp format is not rational. format=" + i5);
                    return null;
                }
                e[] eVarArr = (e[]) cVarC.g(this.f19740e);
                if (eVarArr == null || eVarArr.length != 3) {
                    Log.w("ExifInterface", "Invalid GPS Timestamp array. array=" + Arrays.toString(eVarArr));
                    return null;
                }
                e eVar = eVarArr[0];
                Integer numValueOf = Integer.valueOf((int) (eVar.f19720a / eVar.f19721b));
                e eVar2 = eVarArr[1];
                Integer numValueOf2 = Integer.valueOf((int) (eVar2.f19720a / eVar2.f19721b));
                e eVar3 = eVarArr[2];
                return String.format("%02d:%02d:%02d", numValueOf, numValueOf2, Integer.valueOf((int) (eVar3.f19720a / eVar3.f19721b)));
            }
            try {
                return Double.toString(cVarC.d(this.f19740e));
            } catch (NumberFormatException unused) {
            }
        }
        return null;
    }

    public final c c(String str) {
        if ("ISOSpeedRatings".equals(str)) {
            str = "PhotographicSensitivity";
        }
        for (int i5 = 0; i5 < G.length; i5++) {
            c cVar = (c) this.f19738c[i5].get(str);
            if (cVar != null) {
                return cVar;
            }
        }
        return null;
    }

    public final void d(f fVar) throws IOException {
        String strExtractMetadata;
        String strExtractMetadata2;
        String strExtractMetadata3;
        if (Build.VERSION.SDK_INT < 28) {
            throw new UnsupportedOperationException("Reading EXIF from HEIF files is supported from SDK 28 and above");
        }
        MediaMetadataRetriever mediaMetadataRetriever = new MediaMetadataRetriever();
        try {
            try {
                i.a(mediaMetadataRetriever, new a(fVar));
                String strExtractMetadata4 = mediaMetadataRetriever.extractMetadata(33);
                String strExtractMetadata5 = mediaMetadataRetriever.extractMetadata(34);
                String strExtractMetadata6 = mediaMetadataRetriever.extractMetadata(26);
                String strExtractMetadata7 = mediaMetadataRetriever.extractMetadata(17);
                if ("yes".equals(strExtractMetadata6)) {
                    strExtractMetadata = mediaMetadataRetriever.extractMetadata(29);
                    strExtractMetadata2 = mediaMetadataRetriever.extractMetadata(30);
                    strExtractMetadata3 = mediaMetadataRetriever.extractMetadata(31);
                } else if ("yes".equals(strExtractMetadata7)) {
                    strExtractMetadata = mediaMetadataRetriever.extractMetadata(18);
                    strExtractMetadata2 = mediaMetadataRetriever.extractMetadata(19);
                    strExtractMetadata3 = mediaMetadataRetriever.extractMetadata(24);
                } else {
                    strExtractMetadata = null;
                    strExtractMetadata2 = null;
                    strExtractMetadata3 = null;
                }
                HashMap[] mapArr = this.f19738c;
                if (strExtractMetadata != null) {
                    mapArr[0].put("ImageWidth", c.c(Integer.parseInt(strExtractMetadata), this.f19740e));
                }
                if (strExtractMetadata2 != null) {
                    mapArr[0].put("ImageLength", c.c(Integer.parseInt(strExtractMetadata2), this.f19740e));
                }
                if (strExtractMetadata3 != null) {
                    int i5 = Integer.parseInt(strExtractMetadata3);
                    mapArr[0].put("Orientation", c.c(i5 != 90 ? i5 != 180 ? i5 != 270 ? 1 : 8 : 3 : 6, this.f19740e));
                }
                if (strExtractMetadata4 != null && strExtractMetadata5 != null) {
                    int i11 = Integer.parseInt(strExtractMetadata4);
                    int i12 = Integer.parseInt(strExtractMetadata5);
                    if (i12 <= 6) {
                        throw new IOException("Invalid exif length");
                    }
                    fVar.b(i11);
                    byte[] bArr = new byte[6];
                    if (fVar.read(bArr) != 6) {
                        throw new IOException("Can't read identifier");
                    }
                    int i13 = i11 + 6;
                    int i14 = i12 - 6;
                    if (!Arrays.equals(bArr, N)) {
                        throw new IOException("Invalid identifier");
                    }
                    byte[] bArr2 = new byte[i14];
                    if (fVar.read(bArr2) != i14) {
                        throw new IOException("Can't read exif");
                    }
                    this.f19742g = i13;
                    r(0, bArr2);
                }
                mediaMetadataRetriever.release();
            } catch (RuntimeException unused) {
                throw new UnsupportedOperationException("Failed to read EXIF from HEIF file. Given stream is either malformed or unsupported.");
            }
        } catch (Throwable th2) {
            mediaMetadataRetriever.release();
            throw th2;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:81:0x014e, code lost:
    
        r21.f19709b = r20.f19740e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:82:0x0152, code lost:
    
        return;
     */
    /* JADX WARN: Removed duplicated region for block: B:28:0x005d A[FALL_THROUGH] */
    /* JADX WARN: Removed duplicated region for block: B:65:0x00f0  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x013b A[LOOP:0: B:10:0x0024->B:76:0x013b, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:94:0x0142 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:97:0x00fa A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void e(b bVar, int i5, int i11) throws Throwable {
        byte[] bArr;
        int i12;
        if (f19722k) {
            Objects.toString(bVar);
        }
        bVar.f19709b = ByteOrder.BIG_ENDIAN;
        byte b11 = bVar.readByte();
        if (b11 != -1) {
            throw new IOException("Invalid marker: " + Integer.toHexString(b11 & 255));
        }
        if (bVar.readByte() != -40) {
            throw new IOException("Invalid marker: " + Integer.toHexString(b11 & 255));
        }
        int i13 = 2;
        int i14 = 2;
        while (true) {
            byte b12 = bVar.readByte();
            if (b12 != -1) {
                throw new IOException("Invalid marker:" + Integer.toHexString(b12 & 255));
            }
            byte b13 = bVar.readByte();
            if (b13 != -39 && b13 != -38) {
                int unsignedShort = bVar.readUnsignedShort();
                int i15 = unsignedShort - 2;
                int i16 = i14 + 4;
                if (i15 < 0) {
                    throw new IOException("Invalid length");
                }
                HashMap[] mapArr = this.f19738c;
                if (b13 == -31) {
                    byte[] bArr2 = new byte[i15];
                    bVar.readFully(bArr2);
                    int i17 = i16 + i15;
                    byte[] bArr3 = N;
                    if (bArr3 != null && i15 >= bArr3.length) {
                        for (int i18 = 0; i18 < bArr3.length; i18++) {
                            if (bArr2[i18] != bArr3[i18]) {
                                bArr = O;
                                if (bArr != null && i15 >= bArr.length) {
                                    i12 = 0;
                                    while (true) {
                                        if (i12 < bArr.length) {
                                            int length = i16 + bArr.length;
                                            byte[] bArrCopyOfRange = Arrays.copyOfRange(bArr2, bArr.length, i15);
                                            if (b("Xmp") == null) {
                                                mapArr[0].put("Xmp", new c(length, bArrCopyOfRange, 1, bArrCopyOfRange.length));
                                            }
                                        } else if (bArr2[i12] == bArr[i12]) {
                                            i12++;
                                        }
                                    }
                                }
                                i16 = i17;
                            }
                        }
                        byte[] bArrCopyOfRange2 = Arrays.copyOfRange(bArr2, bArr3.length, i15);
                        this.f19742g = i5 + i16 + bArr3.length;
                        r(i11, bArrCopyOfRange2);
                        u(new b(bArrCopyOfRange2));
                        i16 = i17;
                    } else {
                        bArr = O;
                        if (bArr != null) {
                            i12 = 0;
                            while (true) {
                                if (i12 < bArr.length) {
                                }
                                i12++;
                            }
                        }
                        i16 = i17;
                    }
                    if (i15 < 0) {
                    }
                } else if (b13 != -2) {
                    switch (b13) {
                        default:
                            switch (b13) {
                                default:
                                    switch (b13) {
                                        default:
                                            switch (b13) {
                                            }
                                        case -55:
                                        case -54:
                                        case -53:
                                            bVar.a(1);
                                            mapArr[i11].put(i11 != 4 ? "ImageLength" : "ThumbnailImageLength", c.a(bVar.readUnsignedShort(), this.f19740e));
                                            mapArr[i11].put(i11 != 4 ? "ImageWidth" : "ThumbnailImageWidth", c.a(bVar.readUnsignedShort(), this.f19740e));
                                            i15 = unsignedShort - 7;
                                            break;
                                    }
                                case -59:
                                case -58:
                                case -57:
                                    break;
                            }
                        case -64:
                        case -63:
                        case -62:
                        case -61:
                            break;
                    }
                    if (i15 < 0) {
                        throw new IOException("Invalid length");
                    }
                    bVar.a(i15);
                    i14 = i16 + i15;
                    i13 = 2;
                } else {
                    byte[] bArr4 = new byte[i15];
                    if (bVar.read(bArr4) != i15) {
                        throw new IOException("Invalid exif");
                    }
                    if (b("UserComment") == null) {
                        HashMap map = mapArr[1];
                        Charset charset = M;
                        byte[] bytes = new String(bArr4, charset).concat("\u0000").getBytes(charset);
                        map.put("UserComment", new c(i13, bytes.length, bytes));
                    }
                }
                i15 = 0;
                if (i15 < 0) {
                }
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:102:0x0126 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:104:0x0129  */
    /* JADX WARN: Removed duplicated region for block: B:146:0x00f2 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:66:0x00d5  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x00f0 A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int f(BufferedInputStream bufferedInputStream) throws Throwable {
        b bVar;
        b bVar2;
        b bVar3;
        b bVar4;
        boolean z11;
        b bVar5;
        b bVar6;
        boolean z12;
        boolean z13;
        boolean z14;
        b bVar7;
        long j11;
        bufferedInputStream.mark(5000);
        byte[] bArr = new byte[5000];
        bufferedInputStream.read(bArr);
        bufferedInputStream.reset();
        int i5 = 0;
        while (true) {
            byte[] bArr2 = f19725p;
            if (i5 >= bArr2.length) {
                return 4;
            }
            if (bArr[i5] != bArr2[i5]) {
                byte[] bytes = "FUJIFILMCCD-RAW".getBytes(Charset.defaultCharset());
                for (int i11 = 0; i11 < bytes.length; i11++) {
                    if (bArr[i11] != bytes[i11]) {
                        try {
                            bVar2 = new b(bArr);
                            try {
                                long j12 = bVar2.readInt();
                                byte[] bArr3 = new byte[4];
                                bVar2.read(bArr3);
                                if (Arrays.equals(bArr3, f19726q)) {
                                    if (j12 == 1) {
                                        j12 = bVar2.readLong();
                                        j11 = 16;
                                        if (j12 < 16) {
                                        }
                                    } else {
                                        j11 = 8;
                                    }
                                    long j13 = 5000;
                                    if (j12 > j13) {
                                        j12 = j13;
                                    }
                                    long j14 = j12 - j11;
                                    if (j14 >= 8) {
                                        byte[] bArr4 = new byte[4];
                                        boolean z15 = false;
                                        boolean z16 = false;
                                        for (long j15 = 0; j15 < j14 / 4 && bVar2.read(bArr4) == 4; j15++) {
                                            if (j15 != 1) {
                                                if (Arrays.equals(bArr4, f19727r)) {
                                                    z15 = true;
                                                } else if (Arrays.equals(bArr4, f19728s)) {
                                                    z16 = true;
                                                }
                                                if (z15 && z16) {
                                                    bVar2.close();
                                                    return 12;
                                                }
                                            }
                                        }
                                    }
                                }
                            } catch (Exception unused) {
                                if (bVar2 != null) {
                                    bVar2.close();
                                }
                                bVar4 = new b(bArr);
                                ByteOrder byteOrderQ = q(bVar4);
                                this.f19740e = byteOrderQ;
                                bVar4.f19709b = byteOrderQ;
                                short s11 = bVar4.readShort();
                                if (s11 != 20306) {
                                    bVar4.close();
                                }
                                if (z11) {
                                }
                            } catch (Throwable th2) {
                                th = th2;
                                bVar = bVar2;
                                if (bVar != null) {
                                    bVar.close();
                                }
                                throw th;
                            }
                        } catch (Exception unused2) {
                            bVar2 = null;
                        } catch (Throwable th3) {
                            th = th3;
                            bVar = null;
                        }
                        bVar2.close();
                        try {
                            bVar4 = new b(bArr);
                        } catch (Exception unused3) {
                            bVar4 = null;
                        } catch (Throwable th4) {
                            th = th4;
                            bVar3 = null;
                        }
                        try {
                            ByteOrder byteOrderQ2 = q(bVar4);
                            this.f19740e = byteOrderQ2;
                            bVar4.f19709b = byteOrderQ2;
                            short s112 = bVar4.readShort();
                            z11 = s112 != 20306 || s112 == 21330;
                            bVar4.close();
                        } catch (Exception unused4) {
                            if (bVar4 != null) {
                                bVar4.close();
                            }
                            z11 = false;
                            if (z11) {
                            }
                        } catch (Throwable th5) {
                            th = th5;
                            bVar3 = bVar4;
                            if (bVar3 != null) {
                                bVar3.close();
                            }
                            throw th;
                        }
                        if (z11) {
                            return 7;
                        }
                        try {
                            bVar7 = new b(bArr);
                        } catch (Exception unused5) {
                            bVar6 = null;
                        } catch (Throwable th6) {
                            th = th6;
                            bVar5 = null;
                        }
                        try {
                            ByteOrder byteOrderQ3 = q(bVar7);
                            this.f19740e = byteOrderQ3;
                            bVar7.f19709b = byteOrderQ3;
                            z12 = bVar7.readShort() == 85;
                            bVar7.close();
                        } catch (Exception unused6) {
                            bVar6 = bVar7;
                            if (bVar6 != null) {
                                bVar6.close();
                            }
                            z12 = false;
                            if (!z12) {
                            }
                        } catch (Throwable th7) {
                            th = th7;
                            bVar5 = bVar7;
                            if (bVar5 != null) {
                                bVar5.close();
                            }
                            throw th;
                        }
                        if (!z12) {
                            return 10;
                        }
                        int i12 = 0;
                        while (true) {
                            byte[] bArr5 = f19731v;
                            if (i12 >= bArr5.length) {
                                z13 = true;
                                break;
                            }
                            if (bArr[i12] != bArr5[i12]) {
                                z13 = false;
                                break;
                            }
                            i12++;
                        }
                        if (z13) {
                            return 13;
                        }
                        int i13 = 0;
                        while (true) {
                            byte[] bArr6 = f19735z;
                            if (i13 >= bArr6.length) {
                                int i14 = 0;
                                while (true) {
                                    byte[] bArr7 = A;
                                    if (i14 >= bArr7.length) {
                                        z14 = true;
                                        break;
                                    }
                                    if (bArr[bArr6.length + i14 + 4] != bArr7[i14]) {
                                        break;
                                    }
                                    i14++;
                                }
                            } else {
                                if (bArr[i13] != bArr6[i13]) {
                                    break;
                                }
                                i13++;
                            }
                        }
                        z14 = false;
                        return z14 ? 14 : 0;
                    }
                }
                return 9;
            }
            i5++;
        }
    }

    public final void g(f fVar) throws Throwable {
        int i5;
        int i11;
        j(fVar);
        HashMap[] mapArr = this.f19738c;
        c cVar = (c) mapArr[1].get("MakerNote");
        if (cVar != null) {
            f fVar2 = new f(cVar.f19715d);
            fVar2.f19709b = this.f19740e;
            byte[] bArr = f19729t;
            byte[] bArr2 = new byte[bArr.length];
            fVar2.readFully(bArr2);
            fVar2.b(0L);
            byte[] bArr3 = f19730u;
            byte[] bArr4 = new byte[bArr3.length];
            fVar2.readFully(bArr4);
            if (Arrays.equals(bArr2, bArr)) {
                fVar2.b(8L);
            } else if (Arrays.equals(bArr4, bArr3)) {
                fVar2.b(12L);
            }
            s(fVar2, 6);
            c cVar2 = (c) mapArr[7].get("PreviewImageStart");
            c cVar3 = (c) mapArr[7].get("PreviewImageLength");
            if (cVar2 != null && cVar3 != null) {
                mapArr[5].put("JPEGInterchangeFormat", cVar2);
                mapArr[5].put("JPEGInterchangeFormatLength", cVar3);
            }
            c cVar4 = (c) mapArr[8].get("AspectFrame");
            if (cVar4 != null) {
                int[] iArr = (int[]) cVar4.g(this.f19740e);
                if (iArr == null || iArr.length != 4) {
                    Log.w("ExifInterface", "Invalid aspect frame values. frame=" + Arrays.toString(iArr));
                    return;
                }
                int i12 = iArr[2];
                int i13 = iArr[0];
                if (i12 <= i13 || (i5 = iArr[3]) <= (i11 = iArr[1])) {
                    return;
                }
                int i14 = (i12 - i13) + 1;
                int i15 = (i5 - i11) + 1;
                if (i14 < i15) {
                    int i16 = i14 + i15;
                    i15 = i16 - i15;
                    i14 = i16 - i15;
                }
                c cVarC = c.c(i14, this.f19740e);
                c cVarC2 = c.c(i15, this.f19740e);
                mapArr[0].put("ImageWidth", cVarC);
                mapArr[0].put("ImageLength", cVarC2);
            }
        }
    }

    public final void h(b bVar) throws Throwable {
        if (f19722k) {
            Objects.toString(bVar);
        }
        bVar.f19709b = ByteOrder.BIG_ENDIAN;
        byte[] bArr = f19731v;
        bVar.a(bArr.length);
        int length = bArr.length;
        while (true) {
            try {
                int i5 = bVar.readInt();
                byte[] bArr2 = new byte[4];
                if (bVar.read(bArr2) != 4) {
                    throw new IOException("Encountered invalid length while parsing PNG chunktype");
                }
                int i11 = length + 8;
                if (i11 == 16 && !Arrays.equals(bArr2, f19733x)) {
                    throw new IOException("Encountered invalid PNG file--IHDR chunk should appearas the first chunk");
                }
                if (Arrays.equals(bArr2, f19734y)) {
                    return;
                }
                if (Arrays.equals(bArr2, f19732w)) {
                    byte[] bArr3 = new byte[i5];
                    if (bVar.read(bArr3) != i5) {
                        throw new IOException("Failed to read given length for given PNG chunk type: " + vh.a.m(bArr2));
                    }
                    int i12 = bVar.readInt();
                    CRC32 crc32 = new CRC32();
                    crc32.update(bArr2);
                    crc32.update(bArr3);
                    if (((int) crc32.getValue()) == i12) {
                        this.f19742g = i11;
                        r(0, bArr3);
                        x();
                        u(new b(bArr3));
                        return;
                    }
                    throw new IOException("Encountered invalid CRC value for PNG-EXIF chunk.\n recorded CRC value: " + i12 + ", calculated CRC value: " + crc32.getValue());
                }
                int i13 = i5 + 4;
                bVar.a(i13);
                length = i11 + i13;
            } catch (EOFException unused) {
                throw new IOException("Encountered corrupt PNG file.");
            }
        }
    }

    public final void i(b bVar) throws Throwable {
        if (f19722k) {
            Objects.toString(bVar);
        }
        bVar.a(84);
        byte[] bArr = new byte[4];
        byte[] bArr2 = new byte[4];
        byte[] bArr3 = new byte[4];
        bVar.read(bArr);
        bVar.read(bArr2);
        bVar.read(bArr3);
        int i5 = ByteBuffer.wrap(bArr).getInt();
        int i11 = ByteBuffer.wrap(bArr2).getInt();
        int i12 = ByteBuffer.wrap(bArr3).getInt();
        byte[] bArr4 = new byte[i11];
        bVar.a(i5 - bVar.f19710c);
        bVar.read(bArr4);
        e(new b(bArr4), i5, 5);
        bVar.a(i12 - bVar.f19710c);
        bVar.f19709b = ByteOrder.BIG_ENDIAN;
        int i13 = bVar.readInt();
        for (int i14 = 0; i14 < i13; i14++) {
            int unsignedShort = bVar.readUnsignedShort();
            int unsignedShort2 = bVar.readUnsignedShort();
            if (unsignedShort == F.f19716a) {
                short s11 = bVar.readShort();
                short s12 = bVar.readShort();
                c cVarC = c.c(s11, this.f19740e);
                c cVarC2 = c.c(s12, this.f19740e);
                HashMap[] mapArr = this.f19738c;
                mapArr[0].put("ImageLength", cVarC);
                mapArr[0].put("ImageWidth", cVarC2);
                return;
            }
            bVar.a(unsignedShort2);
        }
    }

    public final void j(f fVar) throws Throwable {
        o(fVar);
        s(fVar, 0);
        w(fVar, 0);
        w(fVar, 5);
        w(fVar, 4);
        x();
        if (this.f19737b == 8) {
            HashMap[] mapArr = this.f19738c;
            c cVar = (c) mapArr[1].get("MakerNote");
            if (cVar != null) {
                f fVar2 = new f(cVar.f19715d);
                fVar2.f19709b = this.f19740e;
                fVar2.a(6);
                s(fVar2, 9);
                c cVar2 = (c) mapArr[9].get("ColorSpace");
                if (cVar2 != null) {
                    mapArr[1].put("ColorSpace", cVar2);
                }
            }
        }
    }

    public final void k(f fVar) throws Throwable {
        if (f19722k) {
            Objects.toString(fVar);
        }
        j(fVar);
        HashMap[] mapArr = this.f19738c;
        c cVar = (c) mapArr[0].get("JpgFromRaw");
        if (cVar != null) {
            e(new b(cVar.f19715d), (int) cVar.f19714c, 5);
        }
        c cVar2 = (c) mapArr[0].get("ISO");
        c cVar3 = (c) mapArr[1].get("PhotographicSensitivity");
        if (cVar2 == null || cVar3 != null) {
            return;
        }
        mapArr[1].put("PhotographicSensitivity", cVar2);
    }

    public final void l(b bVar) throws Throwable {
        if (f19722k) {
            Objects.toString(bVar);
        }
        bVar.f19709b = ByteOrder.LITTLE_ENDIAN;
        bVar.a(f19735z.length);
        int i5 = bVar.readInt() + 8;
        byte[] bArr = A;
        bVar.a(bArr.length);
        int length = bArr.length + 8;
        while (true) {
            try {
                byte[] bArr2 = new byte[4];
                if (bVar.read(bArr2) != 4) {
                    throw new IOException("Encountered invalid length while parsing WebP chunktype");
                }
                int i11 = bVar.readInt();
                int i12 = length + 8;
                if (Arrays.equals(B, bArr2)) {
                    byte[] bArr3 = new byte[i11];
                    if (bVar.read(bArr3) == i11) {
                        this.f19742g = i12;
                        r(0, bArr3);
                        u(new b(bArr3));
                        return;
                    } else {
                        throw new IOException("Failed to read given length for given PNG chunk type: " + vh.a.m(bArr2));
                    }
                }
                if (i11 % 2 == 1) {
                    i11++;
                }
                length = i12 + i11;
                if (length == i5) {
                    return;
                }
                if (length > i5) {
                    throw new IOException("Encountered WebP file with invalid chunk size");
                }
                bVar.a(i11);
            } catch (EOFException unused) {
                throw new IOException("Encountered corrupt WebP file.");
            }
        }
    }

    public final void m(b bVar, HashMap map) throws Throwable {
        c cVar = (c) map.get("JPEGInterchangeFormat");
        c cVar2 = (c) map.get("JPEGInterchangeFormatLength");
        if (cVar == null || cVar2 == null) {
            return;
        }
        int iE = cVar.e(this.f19740e);
        int iE2 = cVar2.e(this.f19740e);
        if (this.f19737b == 7) {
            iE += this.f19743h;
        }
        if (iE <= 0 || iE2 <= 0 || this.f19736a != null) {
            return;
        }
        bVar.skip(iE);
        bVar.read(new byte[iE2]);
    }

    public final boolean n(HashMap map) {
        c cVar = (c) map.get("ImageLength");
        c cVar2 = (c) map.get("ImageWidth");
        if (cVar == null || cVar2 == null) {
            return false;
        }
        return cVar.e(this.f19740e) <= 512 && cVar2.e(this.f19740e) <= 512;
    }

    public final void o(f fVar) throws IOException {
        ByteOrder byteOrderQ = q(fVar);
        this.f19740e = byteOrderQ;
        fVar.f19709b = byteOrderQ;
        int unsignedShort = fVar.readUnsignedShort();
        int i5 = this.f19737b;
        if (i5 != 7 && i5 != 10 && unsignedShort != 42) {
            throw new IOException("Invalid start code: " + Integer.toHexString(unsignedShort));
        }
        int i11 = fVar.readInt();
        if (i11 < 8) {
            throw new IOException(c0.h(i11, "Invalid first Ifd offset: "));
        }
        int i12 = i11 - 8;
        if (i12 > 0) {
            fVar.a(i12);
        }
    }

    public final void p() throws Throwable {
        int i5 = 0;
        while (true) {
            HashMap[] mapArr = this.f19738c;
            if (i5 >= mapArr.length) {
                return;
            }
            mapArr[i5].size();
            for (Map.Entry entry : mapArr[i5].entrySet()) {
                c cVar = (c) entry.getValue();
                cVar.toString();
                cVar.f(this.f19740e);
            }
            i5++;
        }
    }

    public final void r(int i5, byte[] bArr) throws IOException {
        f fVar = new f(bArr);
        o(fVar);
        s(fVar, i5);
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0046  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x016e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void s(f fVar, int i5) throws IOException {
        HashMap[] mapArr;
        short s11;
        short s12;
        long j11;
        int i11;
        boolean z11;
        short s13;
        long j12;
        HashMap[] mapArr2;
        int i12;
        long j13;
        int unsignedShort;
        long j14;
        Integer numValueOf = Integer.valueOf(fVar.f19710c);
        HashSet hashSet = this.f19739d;
        hashSet.add(numValueOf);
        short s14 = fVar.readShort();
        if (s14 <= 0) {
            return;
        }
        short s15 = 0;
        while (true) {
            mapArr = this.f19738c;
            if (s15 >= s14) {
                break;
            }
            int unsignedShort2 = fVar.readUnsignedShort();
            int unsignedShort3 = fVar.readUnsignedShort();
            int i13 = fVar.readInt();
            long j15 = fVar.f19710c + 4;
            d dVar = (d) I[i5].get(Integer.valueOf(unsignedShort2));
            boolean z12 = f19722k;
            if (dVar != null && unsignedShort3 > 0) {
                if (unsignedShort3 >= D.length) {
                    s11 = s14;
                } else {
                    int i14 = dVar.f19718c;
                    if (i14 == 7 || unsignedShort3 == 7 || i14 == unsignedShort3 || (i11 = dVar.f19719d) == unsignedShort3) {
                        s11 = s14;
                    } else {
                        s11 = s14;
                        if (((i14 != 4 && i11 != 4) || unsignedShort3 != 3) && (((i14 != 9 && i11 != 9) || unsignedShort3 != 8) && ((i14 != 12 && i11 != 12) || unsignedShort3 != 11))) {
                            if (z12) {
                                String str = C[unsignedShort3];
                            }
                        }
                    }
                    if (unsignedShort3 == 7) {
                        unsignedShort3 = i14;
                    }
                    s12 = s15;
                    j11 = r8[unsignedShort3] * i13;
                    z11 = j11 >= 0 && j11 <= 2147483647L;
                }
                s12 = s15;
                j11 = 0;
            }
            if (z11) {
                if (j11 > 4) {
                    int i15 = fVar.readInt();
                    s13 = s12;
                    mapArr2 = mapArr;
                    if (this.f19737b != 7) {
                        j12 = j11;
                        i12 = i13;
                        j13 = j15;
                        fVar.b(i15);
                    } else {
                        if ("MakerNote".equals(dVar.f19717b)) {
                            this.f19743h = i15;
                        } else {
                            if (i5 == 6 && "ThumbnailImage".equals(dVar.f19717b)) {
                                this.f19744i = i15;
                                this.f19745j = i13;
                                c cVarC = c.c(6, this.f19740e);
                                j12 = j11;
                                c cVarA = c.a(this.f19744i, this.f19740e);
                                i12 = i13;
                                j13 = j15;
                                c cVarA2 = c.a(this.f19745j, this.f19740e);
                                mapArr2[4].put("Compression", cVarC);
                                mapArr2[4].put("JPEGInterchangeFormat", cVarA);
                                mapArr2[4].put("JPEGInterchangeFormatLength", cVarA2);
                            }
                            fVar.b(i15);
                        }
                        j12 = j11;
                        i12 = i13;
                        j13 = j15;
                        fVar.b(i15);
                    }
                } else {
                    s13 = s12;
                    j12 = j11;
                    mapArr2 = mapArr;
                    i12 = i13;
                    j13 = j15;
                }
                Integer num = (Integer) L.get(Integer.valueOf(unsignedShort2));
                if (num != null) {
                    if (unsignedShort3 != 3) {
                        if (unsignedShort3 == 4) {
                            j14 = fVar.readInt() & 4294967295L;
                        } else if (unsignedShort3 == 8) {
                            unsignedShort = fVar.readShort();
                        } else if (unsignedShort3 == 9 || unsignedShort3 == 13) {
                            unsignedShort = fVar.readInt();
                        } else {
                            j14 = -1;
                        }
                        if (z12) {
                            String str2 = dVar.f19717b;
                        }
                        if (j14 > 0 && !hashSet.contains(Integer.valueOf((int) j14))) {
                            fVar.b(j14);
                            s(fVar, num.intValue());
                        }
                        fVar.b(j13);
                    } else {
                        unsignedShort = fVar.readUnsignedShort();
                    }
                    j14 = unsignedShort;
                    if (z12) {
                    }
                    if (j14 > 0) {
                        fVar.b(j14);
                        s(fVar, num.intValue());
                    }
                    fVar.b(j13);
                } else {
                    long j16 = j13;
                    int i16 = fVar.f19710c + this.f19742g;
                    byte[] bArr = new byte[(int) j12];
                    fVar.readFully(bArr);
                    c cVar = new c(i16, bArr, unsignedShort3, i12);
                    HashMap map = mapArr2[i5];
                    String str3 = dVar.f19717b;
                    map.put(str3, cVar);
                    if ("DNGVersion".equals(str3)) {
                        this.f19737b = 3;
                    }
                    if ((("Make".equals(str3) || "Model".equals(str3)) && cVar.f(this.f19740e).contains("PENTAX")) || ("Compression".equals(str3) && cVar.e(this.f19740e) == 65535)) {
                        this.f19737b = 8;
                    }
                    if (fVar.f19710c != j16) {
                        fVar.b(j16);
                    }
                }
            } else {
                fVar.b(j15);
                s13 = s12;
            }
            s15 = (short) (s13 + 1);
            s14 = s11;
        }
        int i17 = fVar.readInt();
        long j17 = i17;
        if (j17 <= 0 || hashSet.contains(Integer.valueOf(i17))) {
            return;
        }
        fVar.b(j17);
        if (mapArr[4].isEmpty()) {
            s(fVar, 4);
        } else if (mapArr[5].isEmpty()) {
            s(fVar, 5);
        }
    }

    public final void t(int i5, String str, String str2) {
        HashMap[] mapArr = this.f19738c;
        if (mapArr[i5].isEmpty() || mapArr[i5].get(str) == null) {
            return;
        }
        HashMap map = mapArr[i5];
        map.put(str2, map.get(str));
        mapArr[i5].remove(str);
    }

    public final void u(b bVar) throws Throwable {
        c cVar;
        HashMap map = this.f19738c[4];
        c cVar2 = (c) map.get("Compression");
        if (cVar2 == null) {
            m(bVar, map);
            return;
        }
        int iE = cVar2.e(this.f19740e);
        if (iE != 1) {
            if (iE == 6) {
                m(bVar, map);
                return;
            } else if (iE != 7) {
                return;
            }
        }
        c cVar3 = (c) map.get("BitsPerSample");
        if (cVar3 != null) {
            int[] iArr = (int[]) cVar3.g(this.f19740e);
            int[] iArr2 = n;
            if (!Arrays.equals(iArr2, iArr)) {
                if (this.f19737b != 3 || (cVar = (c) map.get("PhotometricInterpretation")) == null) {
                    return;
                }
                int iE2 = cVar.e(this.f19740e);
                if ((iE2 != 1 || !Arrays.equals(iArr, o)) && (iE2 != 6 || !Arrays.equals(iArr, iArr2))) {
                    return;
                }
            }
            c cVar4 = (c) map.get("StripOffsets");
            c cVar5 = (c) map.get("StripByteCounts");
            if (cVar4 == null || cVar5 == null) {
                return;
            }
            long[] jArrN = vh.a.n(cVar4.g(this.f19740e));
            long[] jArrN2 = vh.a.n(cVar5.g(this.f19740e));
            if (jArrN == null || jArrN.length == 0) {
                Log.w("ExifInterface", "stripOffsets should not be null or have zero length.");
                return;
            }
            if (jArrN2 == null || jArrN2.length == 0) {
                Log.w("ExifInterface", "stripByteCounts should not be null or have zero length.");
                return;
            }
            if (jArrN.length != jArrN2.length) {
                Log.w("ExifInterface", "stripOffsets and stripByteCounts should have same length.");
                return;
            }
            long j11 = 0;
            for (long j12 : jArrN2) {
                j11 += j12;
            }
            byte[] bArr = new byte[(int) j11];
            this.f19741f = true;
            int i5 = 0;
            int i11 = 0;
            for (int i12 = 0; i12 < jArrN.length; i12++) {
                int i13 = (int) jArrN[i12];
                int i14 = (int) jArrN2[i12];
                if (i12 < jArrN.length - 1 && i13 + i14 != jArrN[i12 + 1]) {
                    this.f19741f = false;
                }
                int i15 = i13 - i5;
                if (i15 < 0) {
                    return;
                }
                long j13 = i15;
                if (bVar.skip(j13) != j13) {
                    return;
                }
                int i16 = i5 + i15;
                byte[] bArr2 = new byte[i14];
                if (bVar.read(bArr2) != i14) {
                    return;
                }
                i5 = i16 + i14;
                System.arraycopy(bArr2, 0, bArr, i11, i14);
                i11 += i14;
            }
            if (this.f19741f) {
                long j14 = jArrN[0];
            }
        }
    }

    public final void v(int i5, int i11) throws Throwable {
        HashMap[] mapArr = this.f19738c;
        if (mapArr[i5].isEmpty() || mapArr[i11].isEmpty()) {
            return;
        }
        c cVar = (c) mapArr[i5].get("ImageLength");
        c cVar2 = (c) mapArr[i5].get("ImageWidth");
        c cVar3 = (c) mapArr[i11].get("ImageLength");
        c cVar4 = (c) mapArr[i11].get("ImageWidth");
        if (cVar == null || cVar2 == null || cVar3 == null || cVar4 == null) {
            return;
        }
        int iE = cVar.e(this.f19740e);
        int iE2 = cVar2.e(this.f19740e);
        int iE3 = cVar3.e(this.f19740e);
        int iE4 = cVar4.e(this.f19740e);
        if (iE >= iE3 || iE2 >= iE4) {
            return;
        }
        HashMap map = mapArr[i5];
        mapArr[i5] = mapArr[i11];
        mapArr[i11] = map;
    }

    public final void w(f fVar, int i5) throws Throwable {
        c cVarC;
        c cVarC2;
        HashMap[] mapArr = this.f19738c;
        c cVar = (c) mapArr[i5].get("DefaultCropSize");
        c cVar2 = (c) mapArr[i5].get("SensorTopBorder");
        c cVar3 = (c) mapArr[i5].get("SensorLeftBorder");
        c cVar4 = (c) mapArr[i5].get("SensorBottomBorder");
        c cVar5 = (c) mapArr[i5].get("SensorRightBorder");
        if (cVar != null) {
            if (cVar.f19712a == 5) {
                e[] eVarArr = (e[]) cVar.g(this.f19740e);
                if (eVarArr == null || eVarArr.length != 2) {
                    Log.w("ExifInterface", "Invalid crop size values. cropSize=" + Arrays.toString(eVarArr));
                    return;
                }
                cVarC = c.b(eVarArr[0], this.f19740e);
                cVarC2 = c.b(eVarArr[1], this.f19740e);
            } else {
                int[] iArr = (int[]) cVar.g(this.f19740e);
                if (iArr == null || iArr.length != 2) {
                    Log.w("ExifInterface", "Invalid crop size values. cropSize=" + Arrays.toString(iArr));
                    return;
                }
                cVarC = c.c(iArr[0], this.f19740e);
                cVarC2 = c.c(iArr[1], this.f19740e);
            }
            mapArr[i5].put("ImageWidth", cVarC);
            mapArr[i5].put("ImageLength", cVarC2);
            return;
        }
        if (cVar2 != null && cVar3 != null && cVar4 != null && cVar5 != null) {
            int iE = cVar2.e(this.f19740e);
            int iE2 = cVar4.e(this.f19740e);
            int iE3 = cVar5.e(this.f19740e);
            int iE4 = cVar3.e(this.f19740e);
            if (iE2 <= iE || iE3 <= iE4) {
                return;
            }
            c cVarC3 = c.c(iE2 - iE, this.f19740e);
            c cVarC4 = c.c(iE3 - iE4, this.f19740e);
            mapArr[i5].put("ImageLength", cVarC3);
            mapArr[i5].put("ImageWidth", cVarC4);
            return;
        }
        c cVar6 = (c) mapArr[i5].get("ImageLength");
        c cVar7 = (c) mapArr[i5].get("ImageWidth");
        if (cVar6 == null || cVar7 == null) {
            c cVar8 = (c) mapArr[i5].get("JPEGInterchangeFormat");
            c cVar9 = (c) mapArr[i5].get("JPEGInterchangeFormatLength");
            if (cVar8 == null || cVar9 == null) {
                return;
            }
            int iE5 = cVar8.e(this.f19740e);
            int iE6 = cVar8.e(this.f19740e);
            fVar.b(iE5);
            byte[] bArr = new byte[iE6];
            fVar.read(bArr);
            e(new b(bArr), iE5, i5);
        }
    }

    public final void x() throws Throwable {
        v(0, 5);
        v(0, 4);
        v(5, 4);
        HashMap[] mapArr = this.f19738c;
        c cVar = (c) mapArr[1].get("PixelXDimension");
        c cVar2 = (c) mapArr[1].get("PixelYDimension");
        if (cVar != null && cVar2 != null) {
            mapArr[0].put("ImageWidth", cVar);
            mapArr[0].put("ImageLength", cVar2);
        }
        if (mapArr[4].isEmpty() && n(mapArr[5])) {
            mapArr[4] = mapArr[5];
            mapArr[5] = new HashMap();
        }
        n(mapArr[4]);
        t(0, "ThumbnailOrientation", "Orientation");
        t(0, "ThumbnailImageLength", "ImageLength");
        t(0, "ThumbnailImageWidth", "ImageWidth");
        t(5, "ThumbnailOrientation", "Orientation");
        t(5, "ThumbnailImageLength", "ImageLength");
        t(5, "ThumbnailImageWidth", "ImageWidth");
        t(4, "Orientation", "ThumbnailOrientation");
        t(4, "ImageLength", "ThumbnailImageLength");
        t(4, "ImageWidth", "ThumbnailImageWidth");
    }
}
