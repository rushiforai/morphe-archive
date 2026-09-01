package com.drew.metadata.mp4.media;

import com.drew.metadata.TagDescriptor;
import defpackage.ho2;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class Mp4VideoDescriptor extends TagDescriptor<Mp4VideoDirectory> {
    public Mp4VideoDescriptor(Mp4VideoDirectory mp4VideoDirectory) {
        super(mp4VideoDirectory);
    }

    private String getColorTableDescription() {
        Integer integer = ((Mp4VideoDirectory) this._directory).getInteger(Mp4VideoDirectory.TAG_COLOR_TABLE);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        if (iIntValue != -1) {
            return iIntValue != 0 ? ho2.G("Unknown (", integer, ")") : "Color table within file";
        }
        Integer integer2 = ((Mp4VideoDirectory) this._directory).getInteger(Mp4VideoDirectory.TAG_DEPTH);
        return (integer2 != null && integer2.intValue() < 16) ? "Default" : "None";
    }

    private String getDepthDescription() {
        Integer integer = ((Mp4VideoDirectory) this._directory).getInteger(Mp4VideoDirectory.TAG_DEPTH);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        if (iIntValue == 1 || iIntValue == 2 || iIntValue == 4 || iIntValue == 8 || iIntValue == 16 || iIntValue == 24 || iIntValue == 32) {
            return integer + "-bit color";
        }
        if (iIntValue != 34 && iIntValue != 36 && iIntValue != 40) {
            return ho2.G("Unknown (", integer, ")");
        }
        return (integer.intValue() - 32) + "-bit grayscale";
    }

    private String getGraphicsModeDescription() {
        Integer integer = ((Mp4VideoDirectory) this._directory).getInteger(Mp4VideoDirectory.TAG_GRAPHICS_MODE);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        if (iIntValue == 0) {
            return "Copy";
        }
        if (iIntValue == 32) {
            return "Blend";
        }
        if (iIntValue == 36) {
            return "Transparent";
        }
        if (iIntValue == 64) {
            return "Dither copy";
        }
        switch (iIntValue) {
            case 256:
                return "Straight alpha";
            case 257:
                return "Premul white alpha";
            case 258:
                return "Premul black alpha";
            case 259:
                return "Composition (dither copy)";
            case 260:
                return "Straight alpha blend";
            default:
                return ho2.G("Unknown (", integer, ")");
        }
    }

    private String getPixelDescription(int i) {
        String string = ((Mp4VideoDirectory) this._directory).getString(i);
        if (string == null) {
            return null;
        }
        return string.concat(" pixels");
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        return (i == 204 || i == 205) ? getPixelDescription(i) : i != 209 ? i != 211 ? i != 213 ? super.getDescription(i) : getColorTableDescription() : getGraphicsModeDescription() : getDepthDescription();
    }
}
