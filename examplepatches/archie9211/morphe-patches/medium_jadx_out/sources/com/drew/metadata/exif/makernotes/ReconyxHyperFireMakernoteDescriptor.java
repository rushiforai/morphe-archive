package com.drew.metadata.exif.makernotes;

import com.drew.metadata.StringValue;
import com.drew.metadata.TagDescriptor;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ReconyxHyperFireMakernoteDescriptor extends TagDescriptor<ReconyxHyperFireMakernoteDirectory> {
    public ReconyxHyperFireMakernoteDescriptor(ReconyxHyperFireMakernoteDirectory reconyxHyperFireMakernoteDirectory) {
        super(reconyxHyperFireMakernoteDirectory);
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        switch (i) {
            case 0:
                return String.format("%d", ((ReconyxHyperFireMakernoteDirectory) this._directory).getInteger(i));
            case 2:
                return ((ReconyxHyperFireMakernoteDirectory) this._directory).getString(i);
            case 12:
                return ((ReconyxHyperFireMakernoteDirectory) this._directory).getString(i);
            case 14:
                int[] intArray = ((ReconyxHyperFireMakernoteDirectory) this._directory).getIntArray(i);
                if (intArray == null) {
                    return null;
                }
                return String.format("%d/%d", Integer.valueOf(intArray[0]), Integer.valueOf(intArray[1]));
            case 18:
                return String.format("%d", ((ReconyxHyperFireMakernoteDirectory) this._directory).getInteger(i));
            case 22:
                String string = ((ReconyxHyperFireMakernoteDirectory) this._directory).getString(i);
                try {
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy:MM:dd HH:mm:ss");
                    return simpleDateFormat.format(simpleDateFormat.parse(string));
                } catch (ParseException unused) {
                    return null;
                }
            case 36:
                return getIndexedDescription(i, 0, "New", "Waxing Crescent", "First Quarter", "Waxing Gibbous", "Full", "Waning Gibbous", "Last Quarter", "Waning Crescent");
            case 38:
            case 40:
                return String.format("%d", ((ReconyxHyperFireMakernoteDirectory) this._directory).getInteger(i));
            case 42:
                StringValue stringValue = ((ReconyxHyperFireMakernoteDirectory) this._directory).getStringValue(i);
                if (stringValue == null) {
                    return null;
                }
                return stringValue.toString();
            case 72:
            case 74:
            case 76:
            case 78:
                return String.format("%d", ((ReconyxHyperFireMakernoteDirectory) this._directory).getInteger(i));
            case 80:
                return getIndexedDescription(i, 0, "Off", "On");
            case 82:
                return String.format("%d", ((ReconyxHyperFireMakernoteDirectory) this._directory).getInteger(i));
            case 84:
                Double doubleObject = ((ReconyxHyperFireMakernoteDirectory) this._directory).getDoubleObject(i);
                DecimalFormat decimalFormat = new DecimalFormat("0.000");
                if (doubleObject == null) {
                    return null;
                }
                return decimalFormat.format(doubleObject);
            case 86:
                return ((ReconyxHyperFireMakernoteDirectory) this._directory).getString(i);
            default:
                return super.getDescription(i);
        }
    }
}
