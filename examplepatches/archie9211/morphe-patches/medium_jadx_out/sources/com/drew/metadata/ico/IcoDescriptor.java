package com.drew.metadata.ico;

import com.drew.metadata.TagDescriptor;
import defpackage.ho2;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class IcoDescriptor extends TagDescriptor<IcoDirectory> {
    public IcoDescriptor(IcoDirectory icoDirectory) {
        super(icoDirectory);
    }

    public final String getColourPaletteSizeDescription() {
        Integer integer = ((IcoDirectory) this._directory).getInteger(4);
        if (integer == null) {
            return null;
        }
        if (integer.intValue() == 0) {
            return "No palette";
        }
        StringBuilder sb = new StringBuilder();
        sb.append(integer);
        sb.append(" colour");
        sb.append(integer.intValue() == 1 ? "" : "s");
        return sb.toString();
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        return i != 1 ? i != 2 ? i != 3 ? i != 4 ? super.getDescription(i) : getColourPaletteSizeDescription() : getImageHeightDescription() : getImageWidthDescription() : getImageTypeDescription();
    }

    public final String getImageHeightDescription() {
        Integer integer = ((IcoDirectory) this._directory).getInteger(3);
        if (integer == null) {
            return null;
        }
        return ho2.H(new StringBuilder(), integer.intValue() == 0 ? 256 : integer.intValue(), " pixels");
    }

    public final String getImageTypeDescription() {
        return getIndexedDescription(1, 1, "Icon", "Cursor");
    }

    public final String getImageWidthDescription() {
        Integer integer = ((IcoDirectory) this._directory).getInteger(2);
        if (integer == null) {
            return null;
        }
        return ho2.H(new StringBuilder(), integer.intValue() == 0 ? 256 : integer.intValue(), " pixels");
    }
}
