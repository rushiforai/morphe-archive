package com.drew.metadata.exif.makernotes;

import com.drew.metadata.StringValue;
import com.drew.metadata.TagDescriptor;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ReconyxHyperFire2MakernoteDescriptor extends TagDescriptor<ReconyxHyperFire2MakernoteDirectory> {
    public ReconyxHyperFire2MakernoteDescriptor(ReconyxHyperFire2MakernoteDirectory reconyxHyperFire2MakernoteDirectory) {
        super(reconyxHyperFire2MakernoteDirectory);
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        switch (i) {
            case 16:
                return String.format("%d", ((ReconyxHyperFire2MakernoteDirectory) this._directory).getInteger(i));
            case 18:
                return String.format("%d", ((ReconyxHyperFire2MakernoteDirectory) this._directory).getInteger(i));
            case 42:
                return ((ReconyxHyperFire2MakernoteDirectory) this._directory).getString(i);
            case 48:
                String string = ((ReconyxHyperFire2MakernoteDirectory) this._directory).getString(i);
                try {
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy:MM:dd HH:mm:ss");
                    return simpleDateFormat.format(simpleDateFormat.parse(string));
                } catch (ParseException unused) {
                    return null;
                }
            case 52:
                return ((ReconyxHyperFire2MakernoteDirectory) this._directory).getString(i);
            case 54:
                int[] intArray = ((ReconyxHyperFire2MakernoteDirectory) this._directory).getIntArray(i);
                if (intArray == null) {
                    return null;
                }
                return String.format("%d/%d", Integer.valueOf(intArray[0]), Integer.valueOf(intArray[1]));
            case 58:
                return String.format("%d", ((ReconyxHyperFire2MakernoteDirectory) this._directory).getInteger(i));
            case 62:
                String string2 = ((ReconyxHyperFire2MakernoteDirectory) this._directory).getString(i);
                try {
                    SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("yyyy:MM:dd HH:mm:ss");
                    return simpleDateFormat2.format(simpleDateFormat2.parse(string2));
                } catch (ParseException unused2) {
                    return null;
                }
            case 74:
                return getIndexedDescription(i, 0, "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday");
            case 76:
                return getIndexedDescription(i, 0, "New", "Waxing Crescent", "First Quarter", "Waxing Gibbous", "Full", "Waning Gibbous", "Last Quarter", "Waning Crescent");
            case 78:
            case 80:
                return String.format("%d", ((ReconyxHyperFire2MakernoteDirectory) this._directory).getInteger(i));
            case 82:
            case 84:
            case 86:
            case ReconyxHyperFire2MakernoteDirectory.TAG_SATURATION /* 88 */:
                return String.format("%d", ((ReconyxHyperFire2MakernoteDirectory) this._directory).getInteger(i));
            case ReconyxHyperFire2MakernoteDirectory.TAG_FLASH /* 90 */:
                return getIndexedDescription(i, 0, "Off", "On");
            case 92:
            case 94:
                return String.format("%d", ((ReconyxHyperFire2MakernoteDirectory) this._directory).getInteger(i));
            case 96:
                return String.format("%d", ((ReconyxHyperFire2MakernoteDirectory) this._directory).getInteger(i));
            case 98:
            case 100:
                Double doubleObject = ((ReconyxHyperFire2MakernoteDirectory) this._directory).getDoubleObject(i);
                DecimalFormat decimalFormat = new DecimalFormat("0.000");
                if (doubleObject == null) {
                    return null;
                }
                return decimalFormat.format(doubleObject);
            case 102:
                return String.format("%d", ((ReconyxHyperFire2MakernoteDirectory) this._directory).getInteger(i));
            case 104:
                return ((ReconyxHyperFire2MakernoteDirectory) this._directory).getString(i);
            case ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER /* 126 */:
                StringValue stringValue = ((ReconyxHyperFire2MakernoteDirectory) this._directory).getStringValue(i);
                if (stringValue == null) {
                    return null;
                }
                return stringValue.toString();
            default:
                return super.getDescription(i);
        }
    }
}
