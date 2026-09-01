package com.drew.metadata.pcx;

import com.drew.metadata.TagDescriptor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class PcxDescriptor extends TagDescriptor<PcxDirectory> {
    public PcxDescriptor(PcxDirectory pcxDirectory) {
        super(pcxDirectory);
    }

    public final String getColorPlanesDescription() {
        return getIndexedDescription(10, 3, "24-bit color", "16 colors");
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        return i != 1 ? i != 10 ? i != 12 ? super.getDescription(i) : getPaletteTypeDescription() : getColorPlanesDescription() : getVersionDescription();
    }

    public final String getPaletteTypeDescription() {
        return getIndexedDescription(12, 1, "Color or B&W", "Grayscale");
    }

    public final String getVersionDescription() {
        return getIndexedDescription(1, 0, "2.5 with fixed EGA palette information", null, "2.8 with modifiable EGA palette information", "2.8 without palette information (default palette)", "PC Paintbrush for Windows", "3.0 or better");
    }
}
