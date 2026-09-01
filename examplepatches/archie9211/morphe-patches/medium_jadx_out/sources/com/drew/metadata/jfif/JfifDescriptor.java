package com.drew.metadata.jfif;

import com.drew.metadata.TagDescriptor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class JfifDescriptor extends TagDescriptor<JfifDirectory> {
    public JfifDescriptor(JfifDirectory jfifDirectory) {
        super(jfifDirectory);
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        return i != 5 ? i != 10 ? i != 7 ? i != 8 ? super.getDescription(i) : getImageResXDescription() : getImageResUnitsDescription() : getImageResYDescription() : getImageVersionDescription();
    }

    public final String getImageResUnitsDescription() {
        Integer integer = ((JfifDirectory) this._directory).getInteger(7);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 0 ? iIntValue != 1 ? iIntValue != 2 ? "unit" : "centimetre" : "inch" : "none";
    }

    public final String getImageResXDescription() {
        Integer integer = ((JfifDirectory) this._directory).getInteger(8);
        if (integer == null) {
            return null;
        }
        return String.format("%d dot%s", integer, integer.intValue() == 1 ? "" : "s");
    }

    public final String getImageResYDescription() {
        Integer integer = ((JfifDirectory) this._directory).getInteger(10);
        if (integer == null) {
            return null;
        }
        return String.format("%d dot%s", integer, integer.intValue() == 1 ? "" : "s");
    }

    public final String getImageVersionDescription() {
        Integer integer = ((JfifDirectory) this._directory).getInteger(5);
        if (integer == null) {
            return null;
        }
        return String.format("%d.%d", Integer.valueOf((integer.intValue() & 65280) >> 8), Integer.valueOf(integer.intValue() & 255));
    }
}
