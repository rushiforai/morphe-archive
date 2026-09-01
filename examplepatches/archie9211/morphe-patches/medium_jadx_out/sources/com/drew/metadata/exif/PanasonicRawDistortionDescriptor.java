package com.drew.metadata.exif;

import com.drew.lang.Rational;
import com.drew.metadata.TagDescriptor;
import defpackage.ho2;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class PanasonicRawDistortionDescriptor extends TagDescriptor<PanasonicRawDistortionDirectory> {
    public PanasonicRawDistortionDescriptor(PanasonicRawDistortionDirectory panasonicRawDistortionDirectory) {
        super(panasonicRawDistortionDirectory);
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        return i != 2 ? i != 11 ? i != 4 ? i != 5 ? i != 7 ? i != 8 ? i != 9 ? super.getDescription(i) : getDistortionParam09Description() : getDistortionParam08Description() : getDistortionCorrectionDescription() : getDistortionScaleDescription() : getDistortionParam04Description() : getDistortionParam11Description() : getDistortionParam02Description();
    }

    public final String getDistortionCorrectionDescription() {
        Integer integer = ((PanasonicRawDistortionDirectory) this._directory).getInteger(7);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue() & 15;
        return iIntValue != 0 ? iIntValue != 1 ? ho2.G("Unknown (", integer, ")") : "On" : "Off";
    }

    public final String getDistortionParam02Description() {
        if (((PanasonicRawDistortionDirectory) this._directory).getInteger(2) == null) {
            return null;
        }
        return new Rational(r5.intValue(), 32678L).toString();
    }

    public final String getDistortionParam04Description() {
        if (((PanasonicRawDistortionDirectory) this._directory).getInteger(4) == null) {
            return null;
        }
        return new Rational(r5.intValue(), 32678L).toString();
    }

    public final String getDistortionParam08Description() {
        if (((PanasonicRawDistortionDirectory) this._directory).getInteger(8) == null) {
            return null;
        }
        return new Rational(r5.intValue(), 32678L).toString();
    }

    public final String getDistortionParam09Description() {
        if (((PanasonicRawDistortionDirectory) this._directory).getInteger(9) == null) {
            return null;
        }
        return new Rational(r5.intValue(), 32678L).toString();
    }

    public final String getDistortionParam11Description() {
        if (((PanasonicRawDistortionDirectory) this._directory).getInteger(11) == null) {
            return null;
        }
        return new Rational(r5.intValue(), 32678L).toString();
    }

    public final String getDistortionScaleDescription() {
        Integer integer = ((PanasonicRawDistortionDirectory) this._directory).getInteger(5);
        if (integer == null) {
            return null;
        }
        return Integer.toString(1 / ((integer.intValue() / 32768) + 1));
    }
}
