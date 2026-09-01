package com.drew.metadata.png;

import com.drew.imaging.png.PngColorType;
import com.drew.lang.KeyValuePair;
import com.drew.lang.SequentialByteArrayReader;
import com.drew.metadata.TagDescriptor;
import java.io.IOException;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class PngDescriptor extends TagDescriptor<PngDirectory> {
    public PngDescriptor(PngDirectory pngDirectory) {
        super(pngDirectory);
    }

    public final String getBackgroundColorDescription() {
        byte[] byteArray = ((PngDirectory) this._directory).getByteArray(15);
        if (byteArray == null) {
            return null;
        }
        SequentialByteArrayReader sequentialByteArrayReader = new SequentialByteArrayReader(byteArray, 0);
        try {
            int length = byteArray.length;
            if (length == 1) {
                return String.format("Palette Index %d", Short.valueOf(sequentialByteArrayReader.getUInt8()));
            }
            if (length == 2) {
                return String.format("Greyscale Level %d", Integer.valueOf(sequentialByteArrayReader.getUInt16()));
            }
            if (length != 6) {
                return null;
            }
            return String.format("R %d, G %d, B %d", Integer.valueOf(sequentialByteArrayReader.getUInt16()), Integer.valueOf(sequentialByteArrayReader.getUInt16()), Integer.valueOf(sequentialByteArrayReader.getUInt16()));
        } catch (IOException unused) {
            return null;
        }
    }

    public final String getColorTypeDescription() {
        Integer integer = ((PngDirectory) this._directory).getInteger(4);
        if (integer == null) {
            return null;
        }
        return PngColorType.fromNumericValue(integer.intValue()).getDescription();
    }

    public final String getCompressionTypeDescription() {
        return getIndexedDescription(5, 0, "Deflate");
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        return i != 4 ? i != 5 ? i != 6 ? i != 7 ? i != 9 ? i != 10 ? i != 13 ? i != 15 ? i != 18 ? super.getDescription(i) : getUnitSpecifierDescription() : getBackgroundColorDescription() : getTextualDataDescription() : getIsSrgbColorSpaceDescription() : getPaletteHasTransparencyDescription() : getInterlaceMethodDescription() : getFilterMethodDescription() : getCompressionTypeDescription() : getColorTypeDescription();
    }

    public final String getFilterMethodDescription() {
        return getIndexedDescription(6, 0, "Adaptive");
    }

    public final String getInterlaceMethodDescription() {
        return getIndexedDescription(7, 0, "No Interlace", "Adam7 Interlace");
    }

    public final String getIsSrgbColorSpaceDescription() {
        return getIndexedDescription(10, 0, "Perceptual", "Relative Colorimetric", "Saturation", "Absolute Colorimetric");
    }

    public final String getPaletteHasTransparencyDescription() {
        return getIndexedDescription(9, 0, null, "Yes");
    }

    public final String getTextualDataDescription() {
        Object object = ((PngDirectory) this._directory).getObject(13);
        if (object == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        for (KeyValuePair keyValuePair : (List) object) {
            if (sb.length() != 0) {
                sb.append('\n');
            }
            sb.append(keyValuePair.getKey() + ": " + keyValuePair.getValue());
        }
        return sb.toString();
    }

    public final String getUnitSpecifierDescription() {
        return getIndexedDescription(18, 0, "Unspecified", "Metres");
    }
}
