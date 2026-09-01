package com.drew.metadata.exif.makernotes;

import androidx.compose.runtime.tooling.Dp.CspinKvYN;
import com.drew.metadata.TagDescriptor;
import defpackage.b09;
import defpackage.ho2;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class SonyTag9050bDescriptor extends TagDescriptor<SonyTag9050bDirectory> {
    public SonyTag9050bDescriptor(SonyTag9050bDirectory sonyTag9050bDirectory) {
        super(sonyTag9050bDirectory);
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        return i != 57 ? i != 70 ? i != 136 ? super.getDescription(i) : getInternalSerialNumberDescription() : getSonyExposureTimeDescription() : getFlashStatusDescription();
    }

    public final String getInternalSerialNumberDescription() {
        int[] intArray = ((SonyTag9050bDirectory) this._directory).getIntArray(136);
        if (intArray == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        for (int i : intArray) {
            sb.append(String.format("%02x", Integer.valueOf(i)));
        }
        return sb.toString();
    }

    public final String getSonyExposureTimeDescription() {
        Float floatObject = ((SonyTag9050bDirectory) this._directory).getFloatObject(70);
        if (floatObject == null) {
            return null;
        }
        return floatObject.floatValue() == 0.0f ? "0" : b09.w((int) (((double) (1.0f / floatObject.floatValue())) + 0.5d), "1/");
    }

    public final String getFlashStatusDescription() {
        Integer integer = ((SonyTag9050bDirectory) this._directory).getInteger(57);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        if (iIntValue == 0) {
            return "No flash present";
        }
        if (iIntValue == 2) {
            return "Flash inhibited";
        }
        if (iIntValue == 128) {
            return "External flash present";
        }
        if (iIntValue == 129) {
            return "External flash fired";
        }
        switch (iIntValue) {
            case 64:
                return CspinKvYN.Exg;
            case 65:
                return "Built-in flash fired";
            case 66:
                return "Built-in flash inhibited";
            default:
                return ho2.G("Unknown (", integer, ")");
        }
    }
}
