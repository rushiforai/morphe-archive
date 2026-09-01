package com.drew.metadata.photoshop;

import com.datadog.android.core.yjCm.PqkdNGCEoxOKZk;
import com.drew.metadata.TagDescriptor;
import defpackage.ka1;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class PsdHeaderDescriptor extends TagDescriptor<PsdHeaderDirectory> {
    public PsdHeaderDescriptor(PsdHeaderDirectory psdHeaderDirectory) {
        super(psdHeaderDirectory);
    }

    public final String getBitsPerChannelDescription() {
        Integer integer = ((PsdHeaderDirectory) this._directory).getInteger(4);
        if (integer == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        sb.append(integer);
        sb.append(" bit");
        return ka1.v(sb, integer.intValue() == 1 ? "" : "s", " per channel");
    }

    public final String getChannelCountDescription() {
        Integer integer = ((PsdHeaderDirectory) this._directory).getInteger(1);
        if (integer == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        sb.append(integer);
        sb.append(" channel");
        sb.append(integer.intValue() == 1 ? "" : "s");
        return sb.toString();
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        return i != 1 ? i != 2 ? i != 3 ? i != 4 ? i != 5 ? super.getDescription(i) : getColorModeDescription() : getBitsPerChannelDescription() : getImageWidthDescription() : getImageHeightDescription() : getChannelCountDescription();
    }

    public final String getImageHeightDescription() {
        Integer integer = ((PsdHeaderDirectory) this._directory).getInteger(2);
        if (integer == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        sb.append(integer);
        sb.append(" pixel");
        sb.append(integer.intValue() == 1 ? "" : "s");
        return sb.toString();
    }

    public final String getImageWidthDescription() {
        try {
            Integer integer = ((PsdHeaderDirectory) this._directory).getInteger(3);
            if (integer == null) {
                return null;
            }
            StringBuilder sb = new StringBuilder();
            sb.append(integer);
            sb.append(" pixel");
            sb.append(integer.intValue() == 1 ? "" : "s");
            return sb.toString();
        } catch (Exception unused) {
            return null;
        }
    }

    public final String getColorModeDescription() {
        return getIndexedDescription(5, 0, "Bitmap", "Grayscale", "Indexed", "RGB", "CMYK", null, null, PqkdNGCEoxOKZk.QZjsi, "Duotone", "Lab");
    }
}
