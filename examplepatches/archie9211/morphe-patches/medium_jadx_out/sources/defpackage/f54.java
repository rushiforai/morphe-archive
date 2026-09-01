package defpackage;

import android.media.MediaMetadataRetriever;
import android.os.Build;
import android.util.Log;
import androidx.compose.runtime.tooling.Dp.CspinKvYN;
import androidx.fragment.app.strictmode.YLGt.ZVsviyDAr;
import com.drew.metadata.exif.ExifDirectoryBase;
import com.drew.metadata.exif.ExifIFD0Directory;
import com.drew.metadata.exif.ExifReader;
import com.drew.metadata.exif.makernotes.OlympusImageProcessingMakernoteDirectory;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.webp.WebpDirectory;
import com.google.android.material.internal.It.KLTXZbnQvj;
import com.medium.android.common.ui.Ezz.Plbho;
import com.medium.android.data.notification.YMl.DtuT;
import com.squareup.wire.sjIw.ezwlgQm;
import j$.util.DesugarCollections;
import j$.util.DesugarTimeZone;
import java.io.EOFException;
import java.io.FileDescriptor;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;
import java.util.zip.CRC32;
import scalapb.options.hI.AEVqIoD;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class f54 {
    public static final byte[] A;
    public static final String[] B;
    public static final int[] C;
    public static final byte[] D;
    public static final c54 E;
    public static final c54[][] F;
    public static final c54[] G;
    public static final HashMap[] H;
    public static final HashMap[] I;
    public static final Set J;
    public static final HashMap K;
    public static final Charset L;
    public static final byte[] M;
    public static final byte[] N;
    public static final boolean l = Log.isLoggable("ExifInterface", 3);
    public static final int[] m;
    public static final int[] n;
    public static final byte[] o;
    public static final byte[] p;
    public static final byte[] q;
    public static final byte[] r;
    public static final byte[] s;
    public static final byte[] t;
    public static final byte[] u;
    public static final byte[] v;
    public static final byte[] w;
    public static final byte[] x;
    public static final byte[] y;
    public static final byte[] z;
    public final FileDescriptor a;
    public int b;
    public final HashMap[] c;
    public final HashSet d;
    public ByteOrder e;
    public boolean f;
    public int g;
    public int h;
    public int i;
    public int j;
    public b54 k;

    static {
        Arrays.asList(1, 6, 3, 8);
        Arrays.asList(2, 7, 4, 5);
        m = new int[]{8, 8, 8};
        n = new int[]{8};
        o = new byte[]{-1, -40, -1};
        p = new byte[]{102, 116, 121, 112};
        q = new byte[]{109, 105, 102, 49};
        r = new byte[]{104, 101, 105, 99};
        s = new byte[]{97, 118, 105, 102};
        t = new byte[]{97, 118, 105, 115};
        u = new byte[]{79, 76, 89, 77, 80, 0};
        v = new byte[]{79, 76, 89, 77, 80, 85, 83, 0, 73, 73};
        w = new byte[]{-119, 80, 78, 71, 13, 10, 26, 10};
        x = "XML:com.adobe.xmp\u0000\u0000\u0000\u0000\u0000".getBytes(StandardCharsets.UTF_8);
        y = new byte[]{82, 73, 70, 70};
        z = new byte[]{87, 69, 66, 80};
        A = new byte[]{69, 88, 73, 70};
        WebpDirectory.CHUNK_VP8X.getBytes(Charset.defaultCharset());
        WebpDirectory.CHUNK_VP8L.getBytes(Charset.defaultCharset());
        WebpDirectory.CHUNK_VP8.getBytes(Charset.defaultCharset());
        "ANIM".getBytes(Charset.defaultCharset());
        "ANMF".getBytes(Charset.defaultCharset());
        B = new String[]{"", "BYTE", "STRING", "USHORT", "ULONG", "URATIONAL", "SBYTE", "UNDEFINED", "SSHORT", "SLONG", "SRATIONAL", "SINGLE", "DOUBLE", "IFD"};
        C = new int[]{0, 1, 1, 2, 4, 8, 1, 1, 2, 4, 8, 4, 8, 1};
        D = new byte[]{65, 83, 67, 73, 73, 0, 0, 0};
        c54[] c54VarArr = {new c54("NewSubfileType", ExifDirectoryBase.TAG_NEW_SUBFILE_TYPE, 4), new c54("SubfileType", 255, 4), new c54(256, 3, 4, "ImageWidth"), new c54(257, 3, 4, "ImageLength"), new c54("BitsPerSample", 258, 3), new c54("Compression", 259, 3), new c54("PhotometricInterpretation", 262, 3), new c54("ImageDescription", 270, 2), new c54("Make", 271, 2), new c54("Model", 272, 2), new c54(273, 3, 4, "StripOffsets"), new c54("Orientation", 274, 3), new c54("SamplesPerPixel", 277, 3), new c54(278, 3, 4, "RowsPerStrip"), new c54(279, 3, 4, "StripByteCounts"), new c54("XResolution", 282, 5), new c54("YResolution", 283, 5), new c54("PlanarConfiguration", 284, 3), new c54("ResolutionUnit", 296, 3), new c54("TransferFunction", 301, 3), new c54("Software", 305, 2), new c54("DateTime", 306, 2), new c54("Artist", ExifDirectoryBase.TAG_ARTIST, 2), new c54("WhitePoint", ExifDirectoryBase.TAG_WHITE_POINT, 5), new c54("PrimaryChromaticities", ExifDirectoryBase.TAG_PRIMARY_CHROMATICITIES, 5), new c54("SubIFDPointer", ExifDirectoryBase.TAG_SUB_IFD_OFFSET, 4), new c54("JPEGInterchangeFormat", 513, 4), new c54("JPEGInterchangeFormatLength", 514, 4), new c54("YCbCrCoefficients", 529, 5), new c54("YCbCrSubSampling", 530, 3), new c54("YCbCrPositioning", 531, 3), new c54("ReferenceBlackWhite", 532, 5), new c54("Copyright", ExifDirectoryBase.TAG_COPYRIGHT, 2), new c54("ExifIFDPointer", ExifIFD0Directory.TAG_EXIF_SUB_IFD_OFFSET, 4), new c54("GPSInfoIFDPointer", ExifIFD0Directory.TAG_GPS_INFO_OFFSET, 4), new c54("SensorTopBorder", 4, 4), new c54("SensorLeftBorder", 5, 4), new c54("SensorBottomBorder", 6, 4), new c54("SensorRightBorder", 7, 4), new c54("ISO", 23, 3), new c54("JpgFromRaw", 46, 7), new c54("Xmp", 700, 1)};
        c54[] c54VarArr2 = {new c54("ExposureTime", ExifDirectoryBase.TAG_EXPOSURE_TIME, 5), new c54("FNumber", ExifDirectoryBase.TAG_FNUMBER, 5), new c54("ExposureProgram", ExifDirectoryBase.TAG_EXPOSURE_PROGRAM, 3), new c54("SpectralSensitivity", ExifDirectoryBase.TAG_SPECTRAL_SENSITIVITY, 2), new c54("PhotographicSensitivity", ExifDirectoryBase.TAG_ISO_EQUIVALENT, 3), new c54("OECF", ExifDirectoryBase.TAG_OPTO_ELECTRIC_CONVERSION_FUNCTION, 7), new c54("SensitivityType", ExifDirectoryBase.TAG_SENSITIVITY_TYPE, 3), new c54("StandardOutputSensitivity", ExifDirectoryBase.TAG_STANDARD_OUTPUT_SENSITIVITY, 4), new c54("RecommendedExposureIndex", ExifDirectoryBase.TAG_RECOMMENDED_EXPOSURE_INDEX, 4), new c54("ISOSpeed", ExifDirectoryBase.TAG_ISO_SPEED, 4), new c54("ISOSpeedLatitudeyyy", ExifDirectoryBase.TAG_ISO_SPEED_LATITUDE_YYY, 4), new c54("ISOSpeedLatitudezzz", ExifDirectoryBase.TAG_ISO_SPEED_LATITUDE_ZZZ, 4), new c54("ExifVersion", ExifDirectoryBase.TAG_EXIF_VERSION, 2), new c54("DateTimeOriginal", ExifDirectoryBase.TAG_DATETIME_ORIGINAL, 2), new c54("DateTimeDigitized", ExifDirectoryBase.TAG_DATETIME_DIGITIZED, 2), new c54("OffsetTime", ExifDirectoryBase.TAG_TIME_ZONE, 2), new c54("OffsetTimeOriginal", ExifDirectoryBase.TAG_TIME_ZONE_ORIGINAL, 2), new c54("OffsetTimeDigitized", ExifDirectoryBase.TAG_TIME_ZONE_DIGITIZED, 2), new c54("ComponentsConfiguration", ExifDirectoryBase.TAG_COMPONENTS_CONFIGURATION, 7), new c54("CompressedBitsPerPixel", ExifDirectoryBase.TAG_COMPRESSED_AVERAGE_BITS_PER_PIXEL, 5), new c54("ShutterSpeedValue", ExifDirectoryBase.TAG_SHUTTER_SPEED, 10), new c54("ApertureValue", ExifDirectoryBase.TAG_APERTURE, 5), new c54("BrightnessValue", ExifDirectoryBase.TAG_BRIGHTNESS_VALUE, 10), new c54("ExposureBiasValue", ExifDirectoryBase.TAG_EXPOSURE_BIAS, 10), new c54("MaxApertureValue", ExifDirectoryBase.TAG_MAX_APERTURE, 5), new c54("SubjectDistance", ExifDirectoryBase.TAG_SUBJECT_DISTANCE, 5), new c54("MeteringMode", ExifDirectoryBase.TAG_METERING_MODE, 3), new c54("LightSource", 37384, 3), new c54("Flash", ExifDirectoryBase.TAG_FLASH, 3), new c54("FocalLength", ExifDirectoryBase.TAG_FOCAL_LENGTH, 5), new c54("SubjectArea", ExifDirectoryBase.TAG_SUBJECT_LOCATION_TIFF_EP, 3), new c54("MakerNote", ExifDirectoryBase.TAG_MAKERNOTE, 7), new c54("UserComment", ExifDirectoryBase.TAG_USER_COMMENT, 7), new c54("SubSecTime", ExifDirectoryBase.TAG_SUBSECOND_TIME, 2), new c54(DtuT.xXuzwKaH, ExifDirectoryBase.TAG_SUBSECOND_TIME_ORIGINAL, 2), new c54("SubSecTimeDigitized", ExifDirectoryBase.TAG_SUBSECOND_TIME_DIGITIZED, 2), new c54("FlashpixVersion", ExifDirectoryBase.TAG_FLASHPIX_VERSION, 7), new c54("ColorSpace", 40961, 3), new c54(40962, 3, 4, "PixelXDimension"), new c54(40963, 3, 4, "PixelYDimension"), new c54("RelatedSoundFile", 40964, 2), new c54("InteroperabilityIFDPointer", 40965, 4), new c54("FlashEnergy", ExifDirectoryBase.TAG_FLASH_ENERGY, 5), new c54("SpatialFrequencyResponse", ExifDirectoryBase.TAG_SPATIAL_FREQ_RESPONSE, 7), new c54("FocalPlaneXResolution", ExifDirectoryBase.TAG_FOCAL_PLANE_X_RESOLUTION, 5), new c54("FocalPlaneYResolution", ExifDirectoryBase.TAG_FOCAL_PLANE_Y_RESOLUTION, 5), new c54("FocalPlaneResolutionUnit", ExifDirectoryBase.TAG_FOCAL_PLANE_RESOLUTION_UNIT, 3), new c54("SubjectLocation", ExifDirectoryBase.TAG_SUBJECT_LOCATION, 3), new c54("ExposureIndex", ExifDirectoryBase.TAG_EXPOSURE_INDEX, 5), new c54("SensingMethod", ExifDirectoryBase.TAG_SENSING_METHOD, 3), new c54("FileSource", ExifDirectoryBase.TAG_FILE_SOURCE, 7), new c54("SceneType", ExifDirectoryBase.TAG_SCENE_TYPE, 7), new c54("CFAPattern", ExifDirectoryBase.TAG_CFA_PATTERN, 7), new c54("CustomRendered", ExifDirectoryBase.TAG_CUSTOM_RENDERED, 3), new c54("ExposureMode", ExifDirectoryBase.TAG_EXPOSURE_MODE, 3), new c54("WhiteBalance", ExifDirectoryBase.TAG_WHITE_BALANCE_MODE, 3), new c54("DigitalZoomRatio", ExifDirectoryBase.TAG_DIGITAL_ZOOM_RATIO, 5), new c54("FocalLengthIn35mmFilm", ExifDirectoryBase.TAG_35MM_FILM_EQUIV_FOCAL_LENGTH, 3), new c54("SceneCaptureType", ExifDirectoryBase.TAG_SCENE_CAPTURE_TYPE, 3), new c54("GainControl", ExifDirectoryBase.TAG_GAIN_CONTROL, 3), new c54("Contrast", ExifDirectoryBase.TAG_CONTRAST, 3), new c54("Saturation", ExifDirectoryBase.TAG_SATURATION, 3), new c54(ezwlgQm.RzZqSvXvCgOv, ExifDirectoryBase.TAG_SHARPNESS, 3), new c54("DeviceSettingDescription", ExifDirectoryBase.TAG_DEVICE_SETTING_DESCRIPTION, 7), new c54("SubjectDistanceRange", ExifDirectoryBase.TAG_SUBJECT_DISTANCE_RANGE, 3), new c54("ImageUniqueID", ExifDirectoryBase.TAG_IMAGE_UNIQUE_ID, 2), new c54("CameraOwnerName", ExifDirectoryBase.TAG_CAMERA_OWNER_NAME, 2), new c54("BodySerialNumber", ExifDirectoryBase.TAG_BODY_SERIAL_NUMBER, 2), new c54("LensSpecification", ExifDirectoryBase.TAG_LENS_SPECIFICATION, 5), new c54("LensMake", ExifDirectoryBase.TAG_LENS_MAKE, 2), new c54("LensModel", ExifDirectoryBase.TAG_LENS_MODEL, 2), new c54("Gamma", ExifDirectoryBase.TAG_GAMMA, 5), new c54("DNGVersion", 50706, 1), new c54(50720, 3, 4, "DefaultCropSize")};
        c54[] c54VarArr3 = {new c54("GPSVersionID", 0, 1), new c54("GPSLatitudeRef", 1, 2), new c54(2, 5, 10, "GPSLatitude"), new c54("GPSLongitudeRef", 3, 2), new c54(4, 5, 10, "GPSLongitude"), new c54("GPSAltitudeRef", 5, 1), new c54("GPSAltitude", 6, 5), new c54("GPSTimeStamp", 7, 5), new c54("GPSSatellites", 8, 2), new c54(AEVqIoD.xajumKRtt, 9, 2), new c54("GPSMeasureMode", 10, 2), new c54("GPSDOP", 11, 5), new c54("GPSSpeedRef", 12, 2), new c54("GPSSpeed", 13, 5), new c54("GPSTrackRef", 14, 2), new c54("GPSTrack", 15, 5), new c54("GPSImgDirectionRef", 16, 2), new c54("GPSImgDirection", 17, 5), new c54("GPSMapDatum", 18, 2), new c54("GPSDestLatitudeRef", 19, 2), new c54("GPSDestLatitude", 20, 5), new c54("GPSDestLongitudeRef", 21, 2), new c54("GPSDestLongitude", 22, 5), new c54("GPSDestBearingRef", 23, 2), new c54("GPSDestBearing", 24, 5), new c54("GPSDestDistanceRef", 25, 2), new c54("GPSDestDistance", 26, 5), new c54("GPSProcessingMethod", 27, 7), new c54("GPSAreaInformation", 28, 7), new c54(ZVsviyDAr.XJHdEWJQ, 29, 2), new c54("GPSDifferential", 30, 3), new c54("GPSHPositioningError", 31, 5)};
        c54[] c54VarArr4 = {new c54("InteroperabilityIndex", 1, 2)};
        c54[] c54VarArr5 = {new c54("NewSubfileType", ExifDirectoryBase.TAG_NEW_SUBFILE_TYPE, 4), new c54("SubfileType", 255, 4), new c54(256, 3, 4, "ThumbnailImageWidth"), new c54(257, 3, 4, "ThumbnailImageLength"), new c54("BitsPerSample", 258, 3), new c54("Compression", 259, 3), new c54("PhotometricInterpretation", 262, 3), new c54("ImageDescription", 270, 2), new c54("Make", 271, 2), new c54("Model", 272, 2), new c54(273, 3, 4, "StripOffsets"), new c54("ThumbnailOrientation", 274, 3), new c54("SamplesPerPixel", 277, 3), new c54(278, 3, 4, "RowsPerStrip"), new c54(279, 3, 4, "StripByteCounts"), new c54("XResolution", 282, 5), new c54("YResolution", 283, 5), new c54("PlanarConfiguration", 284, 3), new c54("ResolutionUnit", 296, 3), new c54("TransferFunction", 301, 3), new c54("Software", 305, 2), new c54(CspinKvYN.WNLoIDb, 306, 2), new c54("Artist", ExifDirectoryBase.TAG_ARTIST, 2), new c54("WhitePoint", ExifDirectoryBase.TAG_WHITE_POINT, 5), new c54("PrimaryChromaticities", ExifDirectoryBase.TAG_PRIMARY_CHROMATICITIES, 5), new c54("SubIFDPointer", ExifDirectoryBase.TAG_SUB_IFD_OFFSET, 4), new c54("JPEGInterchangeFormat", 513, 4), new c54("JPEGInterchangeFormatLength", 514, 4), new c54("YCbCrCoefficients", 529, 5), new c54("YCbCrSubSampling", 530, 3), new c54("YCbCrPositioning", 531, 3), new c54("ReferenceBlackWhite", 532, 5), new c54("Copyright", ExifDirectoryBase.TAG_COPYRIGHT, 2), new c54("ExifIFDPointer", ExifIFD0Directory.TAG_EXIF_SUB_IFD_OFFSET, 4), new c54("GPSInfoIFDPointer", ExifIFD0Directory.TAG_GPS_INFO_OFFSET, 4), new c54("DNGVersion", 50706, 1), new c54(50720, 3, 4, "DefaultCropSize")};
        E = new c54("StripOffsets", 273, 3);
        F = new c54[][]{c54VarArr, c54VarArr2, c54VarArr3, c54VarArr4, c54VarArr5, c54VarArr, new c54[]{new c54("ThumbnailImage", 256, 7), new c54("CameraSettingsIFDPointer", 8224, 4), new c54("ImageProcessingIFDPointer", OlympusMakernoteDirectory.TAG_IMAGE_PROCESSING, 4)}, new c54[]{new c54("PreviewImageStart", 257, 4), new c54("PreviewImageLength", 258, 4)}, new c54[]{new c54("AspectFrame", OlympusImageProcessingMakernoteDirectory.TagAspectFrame, 3)}, new c54[]{new c54("ColorSpace", 55, 3)}};
        G = new c54[]{new c54("SubIFDPointer", ExifDirectoryBase.TAG_SUB_IFD_OFFSET, 4), new c54("ExifIFDPointer", ExifIFD0Directory.TAG_EXIF_SUB_IFD_OFFSET, 4), new c54("GPSInfoIFDPointer", ExifIFD0Directory.TAG_GPS_INFO_OFFSET, 4), new c54("InteroperabilityIFDPointer", 40965, 4), new c54("CameraSettingsIFDPointer", 8224, 1), new c54("ImageProcessingIFDPointer", OlympusMakernoteDirectory.TAG_IMAGE_PROCESSING, 1)};
        H = new HashMap[10];
        I = new HashMap[10];
        J = DesugarCollections.unmodifiableSet(new HashSet(Arrays.asList("FNumber", "DigitalZoomRatio", "ExposureTime", "SubjectDistance")));
        K = new HashMap();
        Charset charsetForName = Charset.forName("US-ASCII");
        L = charsetForName;
        M = ExifReader.JPEG_SEGMENT_PREAMBLE.getBytes(charsetForName);
        N = "http://ns.adobe.com/xap/1.0/\u0000".getBytes(charsetForName);
        Locale locale = Locale.US;
        new SimpleDateFormat("yyyy:MM:dd HH:mm:ss", locale).setTimeZone(DesugarTimeZone.getTimeZone("UTC"));
        new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", locale).setTimeZone(DesugarTimeZone.getTimeZone("UTC"));
        int i = 0;
        while (true) {
            c54[][] c54VarArr6 = F;
            if (i >= c54VarArr6.length) {
                HashMap map = K;
                c54[] c54VarArr7 = G;
                map.put(Integer.valueOf(c54VarArr7[0].a), 5);
                map.put(Integer.valueOf(c54VarArr7[1].a), 1);
                map.put(Integer.valueOf(c54VarArr7[2].a), 2);
                map.put(Integer.valueOf(c54VarArr7[3].a), 3);
                map.put(Integer.valueOf(c54VarArr7[4].a), 7);
                map.put(Integer.valueOf(c54VarArr7[5].a), 8);
                Pattern.compile(".*[1-9].*");
                Pattern.compile("^(\\d{2}):(\\d{2}):(\\d{2})$");
                Pattern.compile("^(\\d{4}):(\\d{2}):(\\d{2})\\s(\\d{2}):(\\d{2}):(\\d{2})$");
                Pattern.compile("^(\\d{4})-(\\d{2})-(\\d{2})\\s(\\d{2}):(\\d{2}):(\\d{2})$");
                return;
            }
            H[i] = new HashMap();
            I[i] = new HashMap();
            for (c54 c54Var : c54VarArr6[i]) {
                H[i].put(Integer.valueOf(c54Var.a), c54Var);
                I[i].put(c54Var.b, c54Var);
            }
            i++;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:45:0x00ad A[Catch: all -> 0x002e, TRY_ENTER, TRY_LEAVE, TryCatch #2 {all -> 0x002e, blocks: (B:3:0x001f, B:5:0x0022, B:12:0x0037, B:18:0x0054, B:25:0x0067, B:31:0x007a, B:28:0x006f, B:29:0x0073, B:30:0x0077, B:32:0x0084, B:34:0x008d, B:36:0x0093, B:38:0x0099, B:40:0x009f, B:45:0x00ad), top: B:55:0x001f }] */
    /* JADX WARN: Removed duplicated region for block: B:58:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public f54(defpackage.g54 r9) {
        /*
            r8 = this;
            r8.<init>()
            c54[][] r0 = defpackage.f54.F
            int r1 = r0.length
            java.util.HashMap[] r1 = new java.util.HashMap[r1]
            r8.c = r1
            java.util.HashSet r1 = new java.util.HashSet
            int r2 = r0.length
            r1.<init>(r2)
            r8.d = r1
            java.nio.ByteOrder r1 = java.nio.ByteOrder.BIG_ENDIAN
            r8.e = r1
            java.lang.String r1 = "ExifInterface"
            boolean r2 = defpackage.f54.l
            r3 = 0
            r8.a = r3
            r3 = 0
            r4 = r3
        L1f:
            int r5 = r0.length     // Catch: java.lang.Throwable -> L2e java.lang.UnsupportedOperationException -> L31 java.io.IOException -> L34
            if (r4 >= r5) goto L37
            java.util.HashMap[] r5 = r8.c     // Catch: java.lang.Throwable -> L2e java.lang.UnsupportedOperationException -> L31 java.io.IOException -> L34
            java.util.HashMap r6 = new java.util.HashMap     // Catch: java.lang.Throwable -> L2e java.lang.UnsupportedOperationException -> L31 java.io.IOException -> L34
            r6.<init>()     // Catch: java.lang.Throwable -> L2e java.lang.UnsupportedOperationException -> L31 java.io.IOException -> L34
            r5[r4] = r6     // Catch: java.lang.Throwable -> L2e java.lang.UnsupportedOperationException -> L31 java.io.IOException -> L34
            int r4 = r4 + 1
            goto L1f
        L2e:
            r9 = move-exception
            goto Lb3
        L31:
            r9 = move-exception
            goto Lab
        L34:
            r9 = move-exception
            goto Lab
        L37:
            java.io.BufferedInputStream r0 = new java.io.BufferedInputStream     // Catch: java.lang.Throwable -> L2e java.lang.UnsupportedOperationException -> L31 java.io.IOException -> L34
            r4 = 5000(0x1388, float:7.006E-42)
            r0.<init>(r9, r4)     // Catch: java.lang.Throwable -> L2e java.lang.UnsupportedOperationException -> L31 java.io.IOException -> L34
            int r9 = r8.f(r0)     // Catch: java.lang.Throwable -> L2e java.lang.UnsupportedOperationException -> L31 java.io.IOException -> L34
            r8.b = r9     // Catch: java.lang.Throwable -> L2e java.lang.UnsupportedOperationException -> L31 java.io.IOException -> L34
            r4 = 14
            r5 = 13
            r6 = 9
            r7 = 4
            if (r9 == r7) goto L84
            if (r9 == r6) goto L84
            if (r9 == r5) goto L84
            if (r9 != r4) goto L54
            goto L84
        L54:
            e54 r9 = new e54     // Catch: java.lang.Throwable -> L2e java.lang.UnsupportedOperationException -> L31 java.io.IOException -> L34
            r9.<init>(r0)     // Catch: java.lang.Throwable -> L2e java.lang.UnsupportedOperationException -> L31 java.io.IOException -> L34
            int r0 = r8.b     // Catch: java.lang.Throwable -> L2e java.lang.UnsupportedOperationException -> L31 java.io.IOException -> L34
            r3 = 12
            if (r0 == r3) goto L77
            r3 = 15
            if (r0 != r3) goto L64
            goto L77
        L64:
            r3 = 7
            if (r0 != r3) goto L6b
            r8.g(r9)     // Catch: java.lang.Throwable -> L2e java.lang.UnsupportedOperationException -> L31 java.io.IOException -> L34
            goto L7a
        L6b:
            r3 = 10
            if (r0 != r3) goto L73
            r8.k(r9)     // Catch: java.lang.Throwable -> L2e java.lang.UnsupportedOperationException -> L31 java.io.IOException -> L34
            goto L7a
        L73:
            r8.j(r9)     // Catch: java.lang.Throwable -> L2e java.lang.UnsupportedOperationException -> L31 java.io.IOException -> L34
            goto L7a
        L77:
            r8.d(r9, r0)     // Catch: java.lang.Throwable -> L2e java.lang.UnsupportedOperationException -> L31 java.io.IOException -> L34
        L7a:
            int r0 = r8.g     // Catch: java.lang.Throwable -> L2e java.lang.UnsupportedOperationException -> L31 java.io.IOException -> L34
            long r3 = (long) r0     // Catch: java.lang.Throwable -> L2e java.lang.UnsupportedOperationException -> L31 java.io.IOException -> L34
            r9.m(r3)     // Catch: java.lang.Throwable -> L2e java.lang.UnsupportedOperationException -> L31 java.io.IOException -> L34
            r8.u(r9)     // Catch: java.lang.Throwable -> L2e java.lang.UnsupportedOperationException -> L31 java.io.IOException -> L34
            goto La2
        L84:
            a54 r9 = new a54     // Catch: java.lang.Throwable -> L2e java.lang.UnsupportedOperationException -> L31 java.io.IOException -> L34
            r9.<init>(r0)     // Catch: java.lang.Throwable -> L2e java.lang.UnsupportedOperationException -> L31 java.io.IOException -> L34
            int r0 = r8.b     // Catch: java.lang.Throwable -> L2e java.lang.UnsupportedOperationException -> L31 java.io.IOException -> L34
            if (r0 != r7) goto L91
            r8.e(r9, r3, r3)     // Catch: java.lang.Throwable -> L2e java.lang.UnsupportedOperationException -> L31 java.io.IOException -> L34
            goto La2
        L91:
            if (r0 != r5) goto L97
            r8.h(r9)     // Catch: java.lang.Throwable -> L2e java.lang.UnsupportedOperationException -> L31 java.io.IOException -> L34
            goto La2
        L97:
            if (r0 != r6) goto L9d
            r8.i(r9)     // Catch: java.lang.Throwable -> L2e java.lang.UnsupportedOperationException -> L31 java.io.IOException -> L34
            goto La2
        L9d:
            if (r0 != r4) goto La2
            r8.l(r9)     // Catch: java.lang.Throwable -> L2e java.lang.UnsupportedOperationException -> L31 java.io.IOException -> L34
        La2:
            r8.a()
            if (r2 == 0) goto Lc2
        La7:
            r8.p()
            goto Lc2
        Lab:
            if (r2 == 0) goto Lbc
            java.lang.String r0 = "Invalid image: ExifInterface got an unsupported image format file (ExifInterface supports JPEG and some RAW image formats only) or a corrupted JPEG file to ExifInterface."
            android.util.Log.w(r1, r0, r9)     // Catch: java.lang.Throwable -> L2e
            goto Lbc
        Lb3:
            r8.a()
            if (r2 == 0) goto Lbb
            r8.p()
        Lbb:
            throw r9
        Lbc:
            r8.a()
            if (r2 == 0) goto Lc2
            goto La7
        Lc2:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.f54.<init>(g54):void");
    }

    public static ByteOrder q(a54 a54Var) throws IOException {
        short s2 = a54Var.readShort();
        boolean z2 = l;
        if (s2 == 18761) {
            if (z2) {
                Log.d("ExifInterface", "readExifSegment: Byte Align II");
            }
            return ByteOrder.LITTLE_ENDIAN;
        }
        if (s2 != 19789) {
            ik4.l("Invalid byte order: ", Integer.toHexString(s2));
            return null;
        }
        if (z2) {
            Log.d("ExifInterface", "readExifSegment: Byte Align MM");
        }
        return ByteOrder.BIG_ENDIAN;
    }

    public final void a() {
        String strB = b("DateTimeOriginal");
        HashMap[] mapArr = this.c;
        if (strB != null && b("DateTime") == null) {
            HashMap map = mapArr[0];
            byte[] bytes = strB.concat("\u0000").getBytes(L);
            map.put("DateTime", new b54(bytes, 2, bytes.length));
        }
        if (b("ImageWidth") == null) {
            mapArr[0].put("ImageWidth", b54.a(0L, this.e));
        }
        if (b("ImageLength") == null) {
            mapArr[0].put("ImageLength", b54.a(0L, this.e));
        }
        if (b("Orientation") == null) {
            mapArr[0].put("Orientation", b54.a(0L, this.e));
        }
        if (b("LightSource") == null) {
            mapArr[1].put("LightSource", b54.a(0L, this.e));
        }
    }

    public final String b(String str) {
        b54 b54VarC = c(str);
        if (b54VarC != null) {
            int i = b54VarC.a;
            if (str.equals("GPSTimeStamp")) {
                if (i != 5 && i != 10) {
                    Log.w("ExifInterface", "GPS Timestamp format is not rational. format=" + i);
                    return null;
                }
                d54[] d54VarArr = (d54[]) b54VarC.g(this.e);
                if (d54VarArr == null || d54VarArr.length != 3) {
                    Log.w("ExifInterface", "Invalid GPS Timestamp array. array=" + Arrays.toString(d54VarArr));
                    return null;
                }
                d54 d54Var = d54VarArr[0];
                Integer numValueOf = Integer.valueOf((int) (d54Var.a / d54Var.b));
                d54 d54Var2 = d54VarArr[1];
                Integer numValueOf2 = Integer.valueOf((int) (d54Var2.a / d54Var2.b));
                d54 d54Var3 = d54VarArr[2];
                return String.format("%02d:%02d:%02d", numValueOf, numValueOf2, Integer.valueOf((int) (d54Var3.a / d54Var3.b)));
            }
            boolean zContains = J.contains(str);
            ByteOrder byteOrder = this.e;
            if (!zContains) {
                return b54VarC.f(byteOrder);
            }
            try {
                return Double.toString(b54VarC.d(byteOrder));
            } catch (NumberFormatException unused) {
            }
        }
        return null;
    }

    public final b54 c(String str) {
        b54 b54Var;
        int i;
        b54 b54Var2;
        if ("ISOSpeedRatings".equals(str)) {
            if (l) {
                Log.d("ExifInterface", "getExifAttribute: Replacing TAG_ISO_SPEED_RATINGS with TAG_PHOTOGRAPHIC_SENSITIVITY.");
            }
            str = "PhotographicSensitivity";
        }
        if ("Xmp".equals(str) && (i = this.b) != 4 && ((i == 9 || i == 15 || i == 12 || i == 13) && (b54Var2 = this.k) != null)) {
            return b54Var2;
        }
        for (int i2 = 0; i2 < F.length; i2++) {
            b54 b54Var3 = (b54) this.c[i2].get(str);
            if (b54Var3 != null) {
                return b54Var3;
            }
        }
        if (!"Xmp".equals(str) || (b54Var = this.k) == null) {
            return null;
        }
        return b54Var;
    }

    public final void d(e54 e54Var, int i) {
        String strExtractMetadata;
        String strExtractMetadata2;
        String strExtractMetadata3;
        int i2 = Build.VERSION.SDK_INT;
        if (i2 < 28) {
            ik4.k("Reading EXIF from HEIC files is supported from SDK 28 and above");
            return;
        }
        if (i == 15 && i2 < 31) {
            ik4.k("Reading EXIF from AVIF files is supported from SDK 31 and above");
            return;
        }
        MediaMetadataRetriever mediaMetadataRetriever = new MediaMetadataRetriever();
        try {
            try {
                mediaMetadataRetriever.setDataSource(new z44(e54Var));
                String strExtractMetadata4 = mediaMetadataRetriever.extractMetadata(33);
                String strExtractMetadata5 = mediaMetadataRetriever.extractMetadata(34);
                String strExtractMetadata6 = mediaMetadataRetriever.extractMetadata(26);
                String strExtractMetadata7 = mediaMetadataRetriever.extractMetadata(17);
                if ("yes".equals(strExtractMetadata6)) {
                    strExtractMetadata = mediaMetadataRetriever.extractMetadata(29);
                    strExtractMetadata3 = mediaMetadataRetriever.extractMetadata(30);
                    strExtractMetadata2 = mediaMetadataRetriever.extractMetadata(31);
                } else if ("yes".equals(strExtractMetadata7)) {
                    strExtractMetadata = mediaMetadataRetriever.extractMetadata(18);
                    strExtractMetadata3 = mediaMetadataRetriever.extractMetadata(19);
                    strExtractMetadata2 = mediaMetadataRetriever.extractMetadata(24);
                } else {
                    strExtractMetadata = null;
                    strExtractMetadata2 = null;
                    strExtractMetadata3 = null;
                }
                HashMap[] mapArr = this.c;
                if (strExtractMetadata != null) {
                    mapArr[0].put("ImageWidth", b54.c(Integer.parseInt(strExtractMetadata), this.e));
                }
                if (strExtractMetadata3 != null) {
                    mapArr[0].put("ImageLength", b54.c(Integer.parseInt(strExtractMetadata3), this.e));
                }
                if (strExtractMetadata2 != null) {
                    int i3 = Integer.parseInt(strExtractMetadata2);
                    mapArr[0].put("Orientation", b54.c(i3 != 90 ? i3 != 180 ? i3 != 270 ? 1 : 8 : 3 : 6, this.e));
                }
                if (strExtractMetadata4 != null && strExtractMetadata5 != null) {
                    int i4 = Integer.parseInt(strExtractMetadata4);
                    int i5 = Integer.parseInt(strExtractMetadata5);
                    if (i5 <= 6) {
                        throw new IOException("Invalid exif length");
                    }
                    e54Var.m(i4);
                    byte[] bArr = new byte[6];
                    e54Var.readFully(bArr);
                    int i6 = i4 + 6;
                    int i7 = i5 - 6;
                    if (!Arrays.equals(bArr, M)) {
                        throw new IOException("Invalid identifier");
                    }
                    byte[] bArr2 = new byte[i7];
                    e54Var.readFully(bArr2);
                    this.g = i6;
                    r(0, bArr2);
                }
                String strExtractMetadata8 = mediaMetadataRetriever.extractMetadata(41);
                String strExtractMetadata9 = mediaMetadataRetriever.extractMetadata(42);
                if (strExtractMetadata8 != null && strExtractMetadata9 != null) {
                    int i8 = Integer.parseInt(strExtractMetadata8);
                    int i9 = Integer.parseInt(strExtractMetadata9);
                    long j = i8;
                    e54Var.m(j);
                    byte[] bArr3 = new byte[i9];
                    e54Var.readFully(bArr3);
                    this.k = new b54(j, bArr3, 1, i9);
                }
                if (l) {
                    Log.d("ExifInterface", "Heif meta: " + strExtractMetadata + "x" + strExtractMetadata3 + ", rotation " + strExtractMetadata2);
                }
                try {
                    mediaMetadataRetriever.release();
                } catch (IOException unused) {
                }
            } finally {
            }
        } catch (RuntimeException e) {
            throw new UnsupportedOperationException("Failed to read EXIF from HEIF file. Given stream is either malformed or unsupported.", e);
        }
    }

    /* JADX WARN: Failed to find 'out' block for switch in B:30:0x00a2. Please report as an issue. */
    /* JADX WARN: Failed to find 'out' block for switch in B:31:0x00a5. Please report as an issue. */
    /* JADX WARN: Failed to find 'out' block for switch in B:32:0x00a8. Please report as an issue. */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00b0 A[FALL_THROUGH] */
    /* JADX WARN: Removed duplicated region for block: B:56:0x015f A[LOOP:0: B:10:0x0034->B:56:0x015f, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:74:0x0166 A[SYNTHETIC] */
    /*  JADX ERROR: UnsupportedOperationException in pass: RegionMakerVisitor
        java.lang.UnsupportedOperationException
        	at java.base/java.util.Collections$UnmodifiableCollection.add(Collections.java:1095)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker$1.leaveRegion(SwitchRegionMaker.java:390)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:70)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverse(DepthRegionTraversal.java:23)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.insertBreaksForCase(SwitchRegionMaker.java:370)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.insertBreaks(SwitchRegionMaker.java:85)
        	at jadx.core.dex.visitors.regions.PostProcessRegions.leaveRegion(PostProcessRegions.java:33)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:70)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at java.base/java.util.Collections$UnmodifiableCollection.forEach(Collections.java:1120)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at java.base/java.util.Collections$UnmodifiableCollection.forEach(Collections.java:1120)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at java.base/java.util.Collections$UnmodifiableCollection.forEach(Collections.java:1120)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at java.base/java.util.Collections$UnmodifiableCollection.forEach(Collections.java:1120)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at java.base/java.util.Collections$UnmodifiableCollection.forEach(Collections.java:1120)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at java.base/java.util.Collections$UnmodifiableCollection.forEach(Collections.java:1120)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at java.base/java.util.Collections$UnmodifiableCollection.forEach(Collections.java:1120)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at java.base/java.util.Collections$UnmodifiableCollection.forEach(Collections.java:1120)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at java.base/java.util.Collections$UnmodifiableCollection.forEach(Collections.java:1120)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at java.base/java.util.Collections$UnmodifiableCollection.forEach(Collections.java:1120)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverse(DepthRegionTraversal.java:19)
        	at jadx.core.dex.visitors.regions.PostProcessRegions.process(PostProcessRegions.java:23)
        	at jadx.core.dex.visitors.regions.RegionMakerVisitor.visit(RegionMakerVisitor.java:31)
        */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void e(defpackage.a54 r23, int r24, int r25) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 448
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.f54.e(a54, int, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:146:0x01a5  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x00d9 A[PHI: r7 r20
      0x00d9: PHI (r7v3 a54) = (r7v4 a54), (r7v7 a54), (r7v7 a54) binds: [B:73:0x00f4, B:65:0x00df, B:62:0x00d7] A[DONT_GENERATE, DONT_INLINE]
      0x00d9: PHI (r20v2 int) = (r20v4 int), (r20v7 int), (r20v8 int) binds: [B:73:0x00f4, B:65:0x00df, B:62:0x00d7] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:72:0x00ed A[Catch: all -> 0x0066, TRY_LEAVE, TryCatch #2 {all -> 0x0066, blocks: (B:14:0x0039, B:19:0x005b, B:30:0x0078, B:33:0x007e, B:34:0x0086, B:37:0x008e, B:42:0x009a, B:45:0x00a4, B:48:0x00ae, B:50:0x00b6, B:70:0x00e9, B:72:0x00ed), top: B:155:0x0039 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final int f(java.io.BufferedInputStream r20) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 441
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.f54.f(java.io.BufferedInputStream):int");
    }

    public final void g(e54 e54Var) throws Throwable {
        int i;
        int i2;
        j(e54Var);
        HashMap[] mapArr = this.c;
        b54 b54Var = (b54) mapArr[1].get("MakerNote");
        if (b54Var != null) {
            e54 e54Var2 = new e54(b54Var.d);
            e54Var2.c = this.e;
            byte[] bArr = u;
            byte[] bArr2 = new byte[bArr.length];
            e54Var2.readFully(bArr2);
            e54Var2.m(0L);
            byte[] bArr3 = v;
            byte[] bArr4 = new byte[bArr3.length];
            e54Var2.readFully(bArr4);
            if (Arrays.equals(bArr2, bArr)) {
                e54Var2.m(8L);
            } else if (Arrays.equals(bArr4, bArr3)) {
                e54Var2.m(12L);
            }
            s(e54Var2, 6);
            b54 b54Var2 = (b54) mapArr[7].get("PreviewImageStart");
            b54 b54Var3 = (b54) mapArr[7].get("PreviewImageLength");
            if (b54Var2 != null && b54Var3 != null) {
                mapArr[5].put("JPEGInterchangeFormat", b54Var2);
                mapArr[5].put("JPEGInterchangeFormatLength", b54Var3);
            }
            b54 b54Var4 = (b54) mapArr[8].get("AspectFrame");
            if (b54Var4 != null) {
                int[] iArr = (int[]) b54Var4.g(this.e);
                if (iArr == null || iArr.length != 4) {
                    Log.w("ExifInterface", "Invalid aspect frame values. frame=" + Arrays.toString(iArr));
                    return;
                }
                int i3 = iArr[2];
                int i4 = iArr[0];
                if (i3 <= i4 || (i = iArr[3]) <= (i2 = iArr[1])) {
                    return;
                }
                int i5 = (i3 - i4) + 1;
                int i6 = (i - i2) + 1;
                if (i5 < i6) {
                    int i7 = i5 + i6;
                    i6 = i7 - i6;
                    i5 = i7 - i6;
                }
                b54 b54VarC = b54.c(i5, this.e);
                b54 b54VarC2 = b54.c(i6, this.e);
                mapArr[0].put("ImageWidth", b54VarC);
                mapArr[0].put("ImageLength", b54VarC2);
            }
        }
    }

    public final void h(a54 a54Var) throws Throwable {
        if (l) {
            Log.d("ExifInterface", "getPngAttributes starting with: " + a54Var);
        }
        a54Var.c = ByteOrder.BIG_ENDIAN;
        int i = a54Var.b;
        a54Var.f(w.length);
        boolean z2 = false;
        boolean z3 = false;
        while (true) {
            if (z2 && z3) {
                return;
            }
            try {
                int i2 = a54Var.readInt();
                int i3 = a54Var.readInt();
                int i4 = a54Var.b;
                int i5 = i4 + i2 + 4;
                int i6 = i4 - i;
                if (i6 == 16 && i3 != 1229472850) {
                    throw new IOException("Encountered invalid PNG file--IHDR chunk should appear as the first chunk");
                }
                if (i3 == 1229278788) {
                    return;
                }
                if (i3 == 1700284774 && !z2) {
                    this.g = i6;
                    byte[] bArr = new byte[i2];
                    a54Var.readFully(bArr);
                    int i7 = a54Var.readInt();
                    CRC32 crc32 = new CRC32();
                    crc32.update(i3 >>> 24);
                    crc32.update(i3 >>> 16);
                    crc32.update(i3 >>> 8);
                    crc32.update(i3);
                    crc32.update(bArr);
                    if (((int) crc32.getValue()) != i7) {
                        throw new IOException("Encountered invalid CRC value for PNG-EXIF chunk.\n recorded CRC value: " + i7 + ", calculated CRC value: " + crc32.getValue());
                    }
                    r(0, bArr);
                    x();
                    u(new a54(bArr));
                    z2 = true;
                } else if (i3 == 1767135348 && !z3) {
                    byte[] bArr2 = x;
                    if (i2 >= bArr2.length) {
                        int length = bArr2.length;
                        byte[] bArr3 = new byte[length];
                        a54Var.readFully(bArr3);
                        if (Arrays.equals(bArr3, bArr2)) {
                            int i8 = a54Var.b - i;
                            int i9 = i2 - length;
                            byte[] bArr4 = new byte[i9];
                            a54Var.readFully(bArr4);
                            this.k = new b54(i8, bArr4, 1, i9);
                            z3 = true;
                        }
                    }
                }
                a54Var.f(i5 - a54Var.b);
            } catch (EOFException e) {
                throw new IOException("Encountered corrupt PNG file.", e);
            }
        }
    }

    public final void i(a54 a54Var) throws Throwable {
        boolean z2 = l;
        if (z2) {
            Log.d("ExifInterface", "getRafAttributes starting with: " + a54Var);
        }
        a54Var.f(84);
        byte[] bArr = new byte[4];
        byte[] bArr2 = new byte[4];
        byte[] bArr3 = new byte[4];
        a54Var.readFully(bArr);
        a54Var.readFully(bArr2);
        a54Var.readFully(bArr3);
        int i = ByteBuffer.wrap(bArr).getInt();
        int i2 = ByteBuffer.wrap(bArr2).getInt();
        int i3 = ByteBuffer.wrap(bArr3).getInt();
        byte[] bArr4 = new byte[i2];
        a54Var.f(i - a54Var.b);
        a54Var.readFully(bArr4);
        e(new a54(bArr4), i, 5);
        a54Var.f(i3 - a54Var.b);
        a54Var.c = ByteOrder.BIG_ENDIAN;
        int i4 = a54Var.readInt();
        if (z2) {
            Log.d("ExifInterface", "numberOfDirectoryEntry: " + i4);
        }
        for (int i5 = 0; i5 < i4; i5++) {
            int unsignedShort = a54Var.readUnsignedShort();
            int unsignedShort2 = a54Var.readUnsignedShort();
            if (unsignedShort == E.a) {
                short s2 = a54Var.readShort();
                short s3 = a54Var.readShort();
                b54 b54VarC = b54.c(s2, this.e);
                b54 b54VarC2 = b54.c(s3, this.e);
                HashMap[] mapArr = this.c;
                mapArr[0].put("ImageLength", b54VarC);
                mapArr[0].put("ImageWidth", b54VarC2);
                if (z2) {
                    Log.d("ExifInterface", "Updated to length: " + ((int) s2) + ", width: " + ((int) s3));
                    return;
                }
                return;
            }
            a54Var.f(unsignedShort2);
        }
    }

    public final void j(e54 e54Var) throws Throwable {
        o(e54Var);
        s(e54Var, 0);
        w(e54Var, 0);
        w(e54Var, 5);
        w(e54Var, 4);
        x();
        if (this.b == 8) {
            HashMap[] mapArr = this.c;
            b54 b54Var = (b54) mapArr[1].get("MakerNote");
            if (b54Var != null) {
                e54 e54Var2 = new e54(b54Var.d);
                e54Var2.c = this.e;
                e54Var2.f(6);
                s(e54Var2, 9);
                b54 b54Var2 = (b54) mapArr[9].get("ColorSpace");
                if (b54Var2 != null) {
                    mapArr[1].put("ColorSpace", b54Var2);
                }
            }
        }
    }

    public final void k(e54 e54Var) throws Throwable {
        if (l) {
            Log.d("ExifInterface", "getRw2Attributes starting with: " + e54Var);
        }
        j(e54Var);
        HashMap[] mapArr = this.c;
        b54 b54Var = (b54) mapArr[0].get("JpgFromRaw");
        if (b54Var != null) {
            e(new a54(b54Var.d), (int) b54Var.c, 5);
        }
        b54 b54Var2 = (b54) mapArr[0].get("ISO");
        b54 b54Var3 = (b54) mapArr[1].get("PhotographicSensitivity");
        if (b54Var2 == null || b54Var3 != null) {
            return;
        }
        mapArr[1].put("PhotographicSensitivity", b54Var2);
    }

    public final void l(a54 a54Var) throws Throwable {
        if (l) {
            Log.d("ExifInterface", "getWebpAttributes starting with: " + a54Var);
        }
        a54Var.c = ByteOrder.LITTLE_ENDIAN;
        a54Var.f(y.length);
        int i = a54Var.readInt() + 8;
        byte[] bArr = z;
        a54Var.f(bArr.length);
        int length = bArr.length + 8;
        while (true) {
            try {
                byte[] bArr2 = new byte[4];
                a54Var.readFully(bArr2);
                int i2 = a54Var.readInt();
                int i3 = length + 8;
                if (Arrays.equals(A, bArr2)) {
                    byte[] bArrCopyOfRange = new byte[i2];
                    a54Var.readFully(bArrCopyOfRange);
                    byte[] bArr3 = M;
                    if (wgf.P(bArrCopyOfRange, bArr3)) {
                        bArrCopyOfRange = Arrays.copyOfRange(bArrCopyOfRange, bArr3.length, i2);
                    }
                    this.g = i3;
                    r(0, bArrCopyOfRange);
                    u(new a54(bArrCopyOfRange));
                    return;
                }
                if (i2 % 2 == 1) {
                    i2++;
                }
                length = i3 + i2;
                if (length == i) {
                    return;
                }
                if (length > i) {
                    throw new IOException("Encountered WebP file with invalid chunk size");
                }
                a54Var.f(i2);
            } catch (EOFException e) {
                throw new IOException("Encountered corrupt WebP file.", e);
            }
        }
    }

    public final void m(a54 a54Var, HashMap map) throws Throwable {
        b54 b54Var = (b54) map.get("JPEGInterchangeFormat");
        b54 b54Var2 = (b54) map.get("JPEGInterchangeFormatLength");
        if (b54Var == null || b54Var2 == null) {
            return;
        }
        int iE = b54Var.e(this.e);
        int iE2 = b54Var2.e(this.e);
        if (this.b == 7) {
            iE += this.h;
        }
        if (iE > 0 && iE2 > 0 && this.a == null) {
            a54Var.f(iE);
            a54Var.readFully(new byte[iE2]);
        }
        if (l) {
            Log.d("ExifInterface", "Setting thumbnail attributes with offset: " + iE + ", length: " + iE2);
        }
    }

    public final void o(e54 e54Var) throws IOException {
        ByteOrder byteOrderQ = q(e54Var);
        this.e = byteOrderQ;
        e54Var.c = byteOrderQ;
        int unsignedShort = e54Var.readUnsignedShort();
        int i = this.b;
        if (i != 7 && i != 10 && unsignedShort != 42) {
            ik4.l("Invalid start code: ", Integer.toHexString(unsignedShort));
            return;
        }
        int i2 = e54Var.readInt();
        if (i2 < 8) {
            ik4.g(b09.w(i2, "Invalid first Ifd offset: "));
            return;
        }
        int i3 = i2 - 8;
        if (i3 > 0) {
            e54Var.f(i3);
        }
    }

    public final void p() {
        int i = 0;
        while (true) {
            HashMap[] mapArr = this.c;
            if (i >= mapArr.length) {
                return;
            }
            StringBuilder sbC = ev6.C("The size of tag group[", i, "]: ");
            sbC.append(mapArr[i].size());
            Log.d("ExifInterface", sbC.toString());
            for (Map.Entry entry : mapArr[i].entrySet()) {
                b54 b54Var = (b54) entry.getValue();
                Log.d("ExifInterface", "tagName: " + ((String) entry.getKey()) + Plbho.BdCGCDNWzCwjgj + b54Var.toString() + ", tagValue: '" + b54Var.f(this.e) + "'");
            }
            i++;
        }
    }

    public final void r(int i, byte[] bArr) throws IOException {
        e54 e54Var = new e54(bArr);
        o(e54Var);
        s(e54Var, i);
    }

    public final void t(String str, int i, String str2) {
        HashMap[] mapArr = this.c;
        if (mapArr[i].isEmpty() || mapArr[i].get(str) == null) {
            return;
        }
        HashMap map = mapArr[i];
        map.put(str2, (b54) map.get(str));
        mapArr[i].remove(str);
    }

    public final void u(a54 a54Var) throws Throwable {
        b54 b54Var;
        int iE;
        HashMap map = this.c[4];
        b54 b54Var2 = (b54) map.get("Compression");
        if (b54Var2 == null) {
            m(a54Var, map);
            return;
        }
        int iE2 = b54Var2.e(this.e);
        if (iE2 != 1) {
            if (iE2 == 6) {
                m(a54Var, map);
                return;
            } else if (iE2 != 7) {
                return;
            }
        }
        b54 b54Var3 = (b54) map.get("BitsPerSample");
        if (b54Var3 != null) {
            int[] iArr = (int[]) b54Var3.g(this.e);
            int[] iArr2 = m;
            if (Arrays.equals(iArr2, iArr) || (this.b == 3 && (b54Var = (b54) map.get("PhotometricInterpretation")) != null && (((iE = b54Var.e(this.e)) == 1 && Arrays.equals(iArr, n)) || (iE == 6 && Arrays.equals(iArr, iArr2))))) {
                b54 b54Var4 = (b54) map.get("StripOffsets");
                b54 b54Var5 = (b54) map.get("StripByteCounts");
                if (b54Var4 == null || b54Var5 == null) {
                    return;
                }
                long[] jArrI = wgf.i(b54Var4.g(this.e));
                long[] jArrI2 = wgf.i(b54Var5.g(this.e));
                if (jArrI == null || jArrI.length == 0) {
                    Log.w("ExifInterface", "stripOffsets should not be null or have zero length.");
                    return;
                }
                if (jArrI2 == null || jArrI2.length == 0) {
                    Log.w("ExifInterface", "stripByteCounts should not be null or have zero length.");
                    return;
                }
                if (jArrI.length != jArrI2.length) {
                    Log.w("ExifInterface", "stripOffsets and stripByteCounts should have same length.");
                    return;
                }
                long j = 0;
                for (long j2 : jArrI2) {
                    j += j2;
                }
                byte[] bArr = new byte[(int) j];
                this.f = true;
                int i = 0;
                int i2 = 0;
                for (int i3 = 0; i3 < jArrI.length; i3++) {
                    int i4 = (int) jArrI[i3];
                    int i5 = (int) jArrI2[i3];
                    if (i3 < jArrI.length - 1 && i4 + i5 != jArrI[i3 + 1]) {
                        this.f = false;
                    }
                    int i6 = i4 - i;
                    if (i6 < 0) {
                        Log.d("ExifInterface", "Invalid strip offset value");
                        return;
                    }
                    try {
                        a54Var.f(i6);
                        int i7 = i + i6;
                        byte[] bArr2 = new byte[i5];
                        try {
                            a54Var.readFully(bArr2);
                            i = i7 + i5;
                            System.arraycopy(bArr2, 0, bArr, i2, i5);
                            i2 += i5;
                        } catch (EOFException unused) {
                            Log.d("ExifInterface", "Failed to read " + i5 + " bytes.");
                            return;
                        }
                    } catch (EOFException unused2) {
                        Log.d("ExifInterface", "Failed to skip " + i6 + " bytes.");
                        return;
                    }
                }
                if (this.f) {
                    long j3 = jArrI[0];
                    return;
                }
                return;
            }
        }
        if (l) {
            Log.d("ExifInterface", "Unsupported data type value");
        }
    }

    public final void v(int i, int i2) throws Throwable {
        HashMap[] mapArr = this.c;
        boolean zIsEmpty = mapArr[i].isEmpty();
        boolean z2 = l;
        if (zIsEmpty || mapArr[i2].isEmpty()) {
            if (z2) {
                Log.d("ExifInterface", "Cannot perform swap since only one image data exists");
                return;
            }
            return;
        }
        b54 b54Var = (b54) mapArr[i].get("ImageLength");
        b54 b54Var2 = (b54) mapArr[i].get("ImageWidth");
        b54 b54Var3 = (b54) mapArr[i2].get("ImageLength");
        b54 b54Var4 = (b54) mapArr[i2].get("ImageWidth");
        if (b54Var == null || b54Var2 == null) {
            if (z2) {
                Log.d("ExifInterface", "First image does not contain valid size information");
                return;
            }
            return;
        }
        if (b54Var3 == null || b54Var4 == null) {
            if (z2) {
                Log.d("ExifInterface", "Second image does not contain valid size information");
                return;
            }
            return;
        }
        int iE = b54Var.e(this.e);
        int iE2 = b54Var2.e(this.e);
        int iE3 = b54Var3.e(this.e);
        int iE4 = b54Var4.e(this.e);
        if (iE >= iE3 || iE2 >= iE4) {
            return;
        }
        HashMap map = mapArr[i];
        mapArr[i] = mapArr[i2];
        mapArr[i2] = map;
    }

    public final void w(e54 e54Var, int i) throws Throwable {
        b54 b54VarC;
        b54 b54VarC2;
        HashMap[] mapArr = this.c;
        b54 b54Var = (b54) mapArr[i].get("DefaultCropSize");
        b54 b54Var2 = (b54) mapArr[i].get("SensorTopBorder");
        b54 b54Var3 = (b54) mapArr[i].get("SensorLeftBorder");
        b54 b54Var4 = (b54) mapArr[i].get("SensorBottomBorder");
        b54 b54Var5 = (b54) mapArr[i].get("SensorRightBorder");
        if (b54Var != null) {
            int i2 = b54Var.a;
            ByteOrder byteOrder = this.e;
            if (i2 == 5) {
                d54[] d54VarArr = (d54[]) b54Var.g(byteOrder);
                if (d54VarArr == null || d54VarArr.length != 2) {
                    Log.w("ExifInterface", "Invalid crop size values. cropSize=" + Arrays.toString(d54VarArr));
                    return;
                }
                b54VarC = b54.b(d54VarArr[0], this.e);
                b54VarC2 = b54.b(d54VarArr[1], this.e);
            } else {
                int[] iArr = (int[]) b54Var.g(byteOrder);
                if (iArr == null || iArr.length != 2) {
                    Log.w("ExifInterface", "Invalid crop size values. cropSize=" + Arrays.toString(iArr));
                    return;
                }
                b54VarC = b54.c(iArr[0], this.e);
                b54VarC2 = b54.c(iArr[1], this.e);
            }
            mapArr[i].put("ImageWidth", b54VarC);
            mapArr[i].put("ImageLength", b54VarC2);
            return;
        }
        if (b54Var2 != null && b54Var3 != null && b54Var4 != null && b54Var5 != null) {
            int iE = b54Var2.e(this.e);
            int iE2 = b54Var4.e(this.e);
            int iE3 = b54Var5.e(this.e);
            int iE4 = b54Var3.e(this.e);
            if (iE2 <= iE || iE3 <= iE4) {
                return;
            }
            b54 b54VarC3 = b54.c(iE2 - iE, this.e);
            b54 b54VarC4 = b54.c(iE3 - iE4, this.e);
            mapArr[i].put("ImageLength", b54VarC3);
            mapArr[i].put("ImageWidth", b54VarC4);
            return;
        }
        b54 b54Var6 = (b54) mapArr[i].get("ImageLength");
        b54 b54Var7 = (b54) mapArr[i].get("ImageWidth");
        if (b54Var6 == null || b54Var7 == null) {
            b54 b54Var8 = (b54) mapArr[i].get("JPEGInterchangeFormat");
            b54 b54Var9 = (b54) mapArr[i].get("JPEGInterchangeFormatLength");
            if (b54Var8 == null || b54Var9 == null) {
                return;
            }
            int iE5 = b54Var8.e(this.e);
            int iE6 = b54Var8.e(this.e);
            e54Var.m(iE5);
            byte[] bArr = new byte[iE6];
            e54Var.readFully(bArr);
            e(new a54(bArr), iE5, i);
        }
    }

    public final void x() throws Throwable {
        v(0, 5);
        v(0, 4);
        v(5, 4);
        HashMap[] mapArr = this.c;
        b54 b54Var = (b54) mapArr[1].get("PixelXDimension");
        b54 b54Var2 = (b54) mapArr[1].get("PixelYDimension");
        if (b54Var != null && b54Var2 != null) {
            mapArr[0].put("ImageWidth", b54Var);
            mapArr[0].put("ImageLength", b54Var2);
        }
        if (mapArr[4].isEmpty() && n(mapArr[5])) {
            mapArr[4] = mapArr[5];
            mapArr[5] = new HashMap();
        }
        if (!n(mapArr[4])) {
            Log.d("ExifInterface", "No image meets the size requirements of a thumbnail image.");
        }
        t("ThumbnailOrientation", 0, "Orientation");
        t("ThumbnailImageLength", 0, "ImageLength");
        t("ThumbnailImageWidth", 0, "ImageWidth");
        t("ThumbnailOrientation", 5, "Orientation");
        t("ThumbnailImageLength", 5, "ImageLength");
        t("ThumbnailImageWidth", 5, "ImageWidth");
        t("Orientation", 4, "ThumbnailOrientation");
        t("ImageLength", 4, "ThumbnailImageLength");
        t("ImageWidth", 4, "ThumbnailImageWidth");
    }

    public final boolean n(HashMap map) {
        b54 b54Var = (b54) map.get("ImageLength");
        b54 b54Var2 = (b54) map.get(KLTXZbnQvj.hGwfjW);
        if (b54Var == null || b54Var2 == null) {
            return false;
        }
        return b54Var.e(this.e) <= 512 && b54Var2.e(this.e) <= 512;
    }

    /* JADX WARN: Removed duplicated region for block: B:111:0x0255  */
    /* JADX WARN: Removed duplicated region for block: B:123:0x02b1  */
    /* JADX WARN: Removed duplicated region for block: B:124:0x02b3  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x00bb  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x016a  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x0171  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void s(defpackage.e54 r36, int r37) throws java.io.IOException {
        /*
            Method dump skipped, instruction units count: 965
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.f54.s(e54, int):void");
    }
}
