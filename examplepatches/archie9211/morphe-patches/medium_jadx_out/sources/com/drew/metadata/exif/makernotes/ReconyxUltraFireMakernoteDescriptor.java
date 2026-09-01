package com.drew.metadata.exif.makernotes;

import com.drew.metadata.StringValue;
import com.drew.metadata.TagDescriptor;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ReconyxUltraFireMakernoteDescriptor extends TagDescriptor<ReconyxUltraFireMakernoteDirectory> {
    public ReconyxUltraFireMakernoteDescriptor(ReconyxUltraFireMakernoteDirectory reconyxUltraFireMakernoteDirectory) {
        super(reconyxUltraFireMakernoteDirectory);
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        switch (i) {
            case 0:
                return ((ReconyxUltraFireMakernoteDirectory) this._directory).getString(i);
            case 10:
                return String.format("0x%08X", ((ReconyxUltraFireMakernoteDirectory) this._directory).getInteger(i));
            case 14:
                return String.format("%d", ((ReconyxUltraFireMakernoteDirectory) this._directory).getInteger(i));
            case 18:
                return String.format("0x%08X", ((ReconyxUltraFireMakernoteDirectory) this._directory).getInteger(i));
            case 22:
                return String.format("%d", ((ReconyxUltraFireMakernoteDirectory) this._directory).getInteger(i));
            case 24:
            case 31:
            case 38:
            case 45:
            case 52:
                return ((ReconyxUltraFireMakernoteDirectory) this._directory).getString(i);
            case 53:
                int[] intArray = ((ReconyxUltraFireMakernoteDirectory) this._directory).getIntArray(i);
                if (intArray == null) {
                    return null;
                }
                return String.format("%d/%d", Integer.valueOf(intArray[0]), Integer.valueOf(intArray[1]));
            case 55:
                return String.format("%d", ((ReconyxUltraFireMakernoteDirectory) this._directory).getInteger(i));
            case 59:
                String string = ((ReconyxUltraFireMakernoteDirectory) this._directory).getString(i);
                try {
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy:MM:dd HH:mm:ss");
                    return simpleDateFormat.format(simpleDateFormat.parse(string));
                } catch (ParseException unused) {
                    return null;
                }
            case 67:
                return getIndexedDescription(i, 0, "New", "Waxing Crescent", "First Quarter", "Waxing Gibbous", "Full", "Waning Gibbous", "Last Quarter", "Waning Crescent");
            case 68:
            case 70:
                return String.format("%d", ((ReconyxUltraFireMakernoteDirectory) this._directory).getInteger(i));
            case 72:
                return getIndexedDescription(i, 0, "Off", "On");
            case 73:
                Double doubleObject = ((ReconyxUltraFireMakernoteDirectory) this._directory).getDoubleObject(i);
                DecimalFormat decimalFormat = new DecimalFormat("0.000");
                if (doubleObject == null) {
                    return null;
                }
                return decimalFormat.format(doubleObject);
            case 75:
                StringValue stringValue = ((ReconyxUltraFireMakernoteDirectory) this._directory).getStringValue(i);
                if (stringValue == null) {
                    return null;
                }
                return stringValue.toString();
            case 80:
                return ((ReconyxUltraFireMakernoteDirectory) this._directory).getString(i);
            default:
                return super.getDescription(i);
        }
    }
}
