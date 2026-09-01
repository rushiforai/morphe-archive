package com.drew.metadata.jpeg;

import com.drew.metadata.TagDescriptor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class JpegDescriptor extends TagDescriptor<JpegDirectory> {
    public JpegDescriptor(JpegDirectory jpegDirectory) {
        super(jpegDirectory);
    }

    public final String getComponentDataDescription(int i) {
        JpegComponent component = ((JpegDirectory) this._directory).getComponent(i);
        if (component == null) {
            return null;
        }
        return component.getComponentName() + " component: " + component;
    }

    public final String getDataPrecisionDescription() {
        String string = ((JpegDirectory) this._directory).getString(0);
        if (string == null) {
            return null;
        }
        return string.concat(" bits");
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        if (i == -3) {
            return getImageCompressionTypeDescription();
        }
        if (i == 3) {
            return getImageWidthDescription();
        }
        if (i == 0) {
            return getDataPrecisionDescription();
        }
        if (i == 1) {
            return getImageHeightDescription();
        }
        switch (i) {
            case 6:
                return getComponentDataDescription(0);
            case 7:
                return getComponentDataDescription(1);
            case 8:
                return getComponentDataDescription(2);
            case 9:
                return getComponentDataDescription(3);
            default:
                return super.getDescription(i);
        }
    }

    public final String getImageCompressionTypeDescription() {
        return getIndexedDescription(-3, 0, "Baseline", "Extended sequential, Huffman", "Progressive, Huffman", "Lossless, Huffman", null, "Differential sequential, Huffman", "Differential progressive, Huffman", "Differential lossless, Huffman", "Reserved for JPEG extensions", "Extended sequential, arithmetic", "Progressive, arithmetic", "Lossless, arithmetic", null, "Differential sequential, arithmetic", "Differential progressive, arithmetic", "Differential lossless, arithmetic");
    }

    public final String getImageHeightDescription() {
        String string = ((JpegDirectory) this._directory).getString(1);
        if (string == null) {
            return null;
        }
        return string.concat(" pixels");
    }

    public final String getImageWidthDescription() {
        String string = ((JpegDirectory) this._directory).getString(3);
        if (string == null) {
            return null;
        }
        return string.concat(" pixels");
    }
}
