package com.drew.metadata.mp4;

import com.drew.lang.Rational;
import com.drew.metadata.TagDescriptor;
import java.util.ArrayList;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class Mp4Descriptor extends TagDescriptor<Mp4Directory> {
    public Mp4Descriptor(Mp4Directory mp4Directory) {
        super(mp4Directory);
    }

    private String getCompatibleBrandsDescription() {
        String[] stringArray = ((Mp4Directory) this._directory).getStringArray(3);
        if (stringArray == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        for (String str : stringArray) {
            String strLookup = Mp4Dictionary.lookup(1, str);
            if (strLookup != null) {
                str = strLookup;
            }
            arrayList.add(str);
        }
        return Arrays.toString(arrayList.toArray());
    }

    private String getDurationDescription() {
        Rational rational = ((Mp4Directory) this._directory).getRational(260);
        if (rational == null) {
            return null;
        }
        double dDoubleValue = rational.doubleValue();
        int iPow = (int) (dDoubleValue / Math.pow(60.0d, 2.0d));
        Integer numValueOf = Integer.valueOf(iPow);
        int iPow2 = (int) ((dDoubleValue / Math.pow(60.0d, 1.0d)) - ((double) (iPow * 60)));
        return String.format("%1$02d:%2$02d:%3$02d", numValueOf, Integer.valueOf(iPow2), Integer.valueOf((int) Math.ceil((dDoubleValue / Math.pow(60.0d, 0.0d)) - ((double) (iPow2 * 60)))));
    }

    private String getMajorBrandDescription() {
        byte[] byteArray = ((Mp4Directory) this._directory).getByteArray(1);
        if (byteArray == null) {
            return null;
        }
        return Mp4Dictionary.lookup(1, new String(byteArray));
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        return i != 1 ? i != 3 ? i != 260 ? ((Mp4Directory) this._directory).getString(i) : getDurationDescription() : getCompatibleBrandsDescription() : getMajorBrandDescription();
    }
}
