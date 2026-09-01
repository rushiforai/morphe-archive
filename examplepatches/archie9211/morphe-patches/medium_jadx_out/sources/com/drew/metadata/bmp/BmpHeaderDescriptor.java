package com.drew.metadata.bmp;

import com.drew.metadata.TagDescriptor;
import com.drew.metadata.bmp.BmpHeaderDirectory;
import defpackage.ev6;
import java.text.DecimalFormat;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class BmpHeaderDescriptor extends TagDescriptor<BmpHeaderDirectory> {
    public BmpHeaderDescriptor(BmpHeaderDirectory bmpHeaderDirectory) {
        super(bmpHeaderDirectory);
    }

    public static String formatFixed1616(Integer num) {
        if (num == null) {
            return null;
        }
        return formatFixed1616(((long) num.intValue()) & 4294967295L);
    }

    public static String formatHex(long j, int i) {
        return String.format(ev6.w("0x%0", i, "X"), Long.valueOf(j));
    }

    public final String getBitmapTypeDescription() {
        BmpHeaderDirectory.BitmapType bitmapType = ((BmpHeaderDirectory) this._directory).getBitmapType();
        if (bitmapType == null) {
            return null;
        }
        return bitmapType.toString();
    }

    public final String getColorEncodingDescription() {
        BmpHeaderDirectory.ColorEncoding colorEncoding = ((BmpHeaderDirectory) this._directory).getColorEncoding();
        if (colorEncoding == null) {
            return null;
        }
        return colorEncoding.toString();
    }

    public final String getColorSpaceTypeDescription() {
        BmpHeaderDirectory.ColorSpaceType colorSpaceType = ((BmpHeaderDirectory) this._directory).getColorSpaceType();
        if (colorSpaceType == null) {
            return null;
        }
        return colorSpaceType.toString();
    }

    public final String getCompressionDescription() {
        BmpHeaderDirectory bmpHeaderDirectory = (BmpHeaderDirectory) this._directory;
        bmpHeaderDirectory.getClass();
        BmpHeaderDirectory.Compression compressionTypeOf = BmpHeaderDirectory.Compression.typeOf(bmpHeaderDirectory);
        if (compressionTypeOf != null) {
            return compressionTypeOf.toString();
        }
        Integer integer = ((BmpHeaderDirectory) this._directory).getInteger(5);
        if (integer == null) {
            return null;
        }
        return "Illegal value 0x" + Integer.toHexString(integer.intValue());
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        if (i == -2) {
            return getBitmapTypeDescription();
        }
        if (i == 5) {
            return getCompressionDescription();
        }
        switch (i) {
            case 10:
                return getRenderingDescription();
            case 11:
                return getColorEncodingDescription();
            case 12:
            case 13:
            case 14:
            case 15:
                return formatHex(((BmpHeaderDirectory) this._directory).getLongObject(i), 8);
            case 16:
                return getColorSpaceTypeDescription();
            case 17:
            case 18:
            case 19:
                return formatFixed1616(((BmpHeaderDirectory) this._directory).getLongObject(i));
            case 20:
                return getRenderingIntentDescription();
            default:
                return super.getDescription(i);
        }
    }

    public final String getRenderingDescription() {
        BmpHeaderDirectory.RenderingHalftoningAlgorithm rendering = ((BmpHeaderDirectory) this._directory).getRendering();
        if (rendering == null) {
            return null;
        }
        return rendering.toString();
    }

    public final String getRenderingIntentDescription() {
        BmpHeaderDirectory.RenderingIntent renderingIntent = ((BmpHeaderDirectory) this._directory).getRenderingIntent();
        if (renderingIntent == null) {
            return null;
        }
        return renderingIntent.toString();
    }

    public static String formatFixed1616(int i) {
        return formatFixed1616(((long) i) & 4294967295L);
    }

    public static String formatFixed1616(Long l) {
        if (l == null) {
            return null;
        }
        return formatFixed1616(l.longValue());
    }

    public static String formatFixed1616(long j) {
        return new DecimalFormat("0.###").format(Double.valueOf(j / 65536.0d));
    }

    public static String formatHex(int i, int i2) {
        return formatHex(((long) i) & 4294967295L, i2);
    }

    public static String formatHex(Long l, int i) {
        if (l == null) {
            return null;
        }
        return formatHex(l.longValue(), i);
    }

    public static String formatHex(Integer num, int i) {
        if (num == null) {
            return null;
        }
        return formatHex(((long) num.intValue()) & 4294967295L, i);
    }
}
