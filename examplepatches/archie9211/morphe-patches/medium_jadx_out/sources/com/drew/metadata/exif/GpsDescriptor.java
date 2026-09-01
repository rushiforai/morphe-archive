package com.drew.metadata.exif;

import com.datadog.android.core.yjCm.PqkdNGCEoxOKZk;
import com.drew.lang.GeoLocation;
import com.drew.lang.Rational;
import com.drew.metadata.TagDescriptor;
import defpackage.b09;
import defpackage.ev6;
import java.text.DecimalFormat;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class GpsDescriptor extends TagDescriptor<GpsDirectory> {
    public GpsDescriptor(GpsDirectory gpsDirectory) {
        super(gpsDirectory);
    }

    private String getGeoLocationDimension(int i, int i2, String str) {
        Double dDegreesMinutesSecondsToDecimal;
        Rational[] rationalArray = ((GpsDirectory) this._directory).getRationalArray(i);
        String string = ((GpsDirectory) this._directory).getString(i2);
        if (rationalArray == null || rationalArray.length != 3 || string == null || (dDegreesMinutesSecondsToDecimal = GeoLocation.degreesMinutesSecondsToDecimal(rationalArray[0], rationalArray[1], rationalArray[2], string.equalsIgnoreCase(str))) == null) {
            return null;
        }
        return GeoLocation.decimalToDegreesMinutesSecondsString(dDegreesMinutesSecondsToDecimal.doubleValue());
    }

    private String getGpsVersionIdDescription() {
        return getVersionBytesDescription(0, 1);
    }

    public final String getDegreesMinutesSecondsDescription() {
        GeoLocation geoLocation = ((GpsDirectory) this._directory).getGeoLocation();
        if (geoLocation == null) {
            return null;
        }
        return geoLocation.toDMSString();
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        switch (i) {
            case 0:
                return getVersionBytesDescription(0, 1);
            case 1:
            case 3:
            case 8:
            case 18:
            case 19:
            case 21:
            case 29:
            default:
                return super.getDescription(i);
            case 2:
                return getGpsLatitudeDescription();
            case 4:
                return getGpsLongitudeDescription();
            case 5:
                return getGpsAltitudeRefDescription();
            case 6:
                return getGpsAltitudeDescription();
            case 7:
                return getGpsTimeStampDescription();
            case 9:
                return getGpsStatusDescription();
            case 10:
                return getGpsMeasureModeDescription();
            case 11:
                return getGpsDopDescription();
            case 12:
                return getGpsSpeedRefDescription();
            case 13:
                return getGpsSpeedDescription();
            case 14:
            case 16:
            case 23:
                return getGpsDirectionReferenceDescription(i);
            case 15:
            case 17:
            case 24:
                return getGpsDirectionDescription(i);
            case 20:
                return getGpsDestLatitudeDescription();
            case 22:
                return getGpsDestLongitudeDescription();
            case 25:
                return getGpsDestinationReferenceDescription();
            case 26:
                return getGpsDestDistanceDescription();
            case 27:
                return getEncodedTextDescription(27);
            case 28:
                return getEncodedTextDescription(28);
            case 30:
                return getGpsDifferentialDescription();
            case 31:
                return getGpsHPositioningErrorDescription();
        }
    }

    public final String getGpsAltitudeDescription() {
        Rational rational = ((GpsDirectory) this._directory).getRational(6);
        if (rational == null) {
            return null;
        }
        return new DecimalFormat("0.##").format(rational.doubleValue()) + " metres";
    }

    public final String getGpsAltitudeRefDescription() {
        return getIndexedDescription(5, 0, "Sea level", "Below sea level");
    }

    public final String getGpsAreaInformationDescription() {
        return getEncodedTextDescription(28);
    }

    public final String getGpsDestDistanceDescription() {
        Rational rational = ((GpsDirectory) this._directory).getRational(26);
        if (rational == null) {
            return null;
        }
        String gpsDestinationReferenceDescription = getGpsDestinationReferenceDescription();
        return b09.y(new DecimalFormat("0.##").format(rational.doubleValue()), " ", gpsDestinationReferenceDescription == null ? "unit" : gpsDestinationReferenceDescription.toLowerCase());
    }

    public final String getGpsDestLatitudeDescription() {
        return getGeoLocationDimension(20, 19, "S");
    }

    public final String getGpsDestLongitudeDescription() {
        return getGeoLocationDimension(22, 21, "W");
    }

    public final String getGpsDestinationReferenceDescription() {
        String string = ((GpsDirectory) this._directory).getString(25);
        if (string == null) {
            return null;
        }
        String strTrim = string.trim();
        return "K".equalsIgnoreCase(strTrim) ? "kilometers" : "M".equalsIgnoreCase(strTrim) ? "miles" : "N".equalsIgnoreCase(strTrim) ? "knots" : ev6.x("Unknown (", strTrim, ")");
    }

    public final String getGpsDifferentialDescription() {
        return getIndexedDescription(30, 0, "No Correction", "Differential Corrected");
    }

    public final String getGpsDirectionDescription(int i) {
        Rational rational = ((GpsDirectory) this._directory).getRational(i);
        String string = rational != null ? new DecimalFormat("0.##").format(rational.doubleValue()) : ((GpsDirectory) this._directory).getString(i);
        if (string == null || string.trim().length() == 0) {
            return null;
        }
        return string.trim() + " degrees";
    }

    public final String getGpsDirectionReferenceDescription(int i) {
        String string = ((GpsDirectory) this._directory).getString(i);
        if (string == null) {
            return null;
        }
        String strTrim = string.trim();
        return "T".equalsIgnoreCase(strTrim) ? "True direction" : "M".equalsIgnoreCase(strTrim) ? "Magnetic direction" : ev6.x("Unknown (", strTrim, ")");
    }

    public final String getGpsDopDescription() {
        Rational rational = ((GpsDirectory) this._directory).getRational(11);
        if (rational == null) {
            return null;
        }
        return new DecimalFormat("0.##").format(rational.doubleValue());
    }

    public final String getGpsHPositioningErrorDescription() {
        Rational rational = ((GpsDirectory) this._directory).getRational(31);
        if (rational == null) {
            return null;
        }
        return new DecimalFormat("0.##").format(rational.doubleValue()) + " metres";
    }

    public final String getGpsLatitudeDescription() {
        GeoLocation geoLocation = ((GpsDirectory) this._directory).getGeoLocation();
        if (geoLocation == null) {
            return null;
        }
        return GeoLocation.decimalToDegreesMinutesSecondsString(geoLocation.getLatitude());
    }

    public final String getGpsLongitudeDescription() {
        GeoLocation geoLocation = ((GpsDirectory) this._directory).getGeoLocation();
        if (geoLocation == null) {
            return null;
        }
        return GeoLocation.decimalToDegreesMinutesSecondsString(geoLocation.getLongitude());
    }

    public final String getGpsMeasureModeDescription() {
        String string = ((GpsDirectory) this._directory).getString(10);
        if (string == null) {
            return null;
        }
        String strTrim = string.trim();
        return "2".equalsIgnoreCase(strTrim) ? "2-dimensional measurement" : "3".equalsIgnoreCase(strTrim) ? "3-dimensional measurement" : ev6.x("Unknown (", strTrim, ")");
    }

    public final String getGpsProcessingMethodDescription() {
        return getEncodedTextDescription(27);
    }

    public final String getGpsSpeedDescription() {
        Rational rational = ((GpsDirectory) this._directory).getRational(13);
        if (rational == null) {
            return null;
        }
        String gpsSpeedRefDescription = getGpsSpeedRefDescription();
        return b09.y(new DecimalFormat("0.##").format(rational.doubleValue()), " ", gpsSpeedRefDescription == null ? "unit" : gpsSpeedRefDescription.toLowerCase());
    }

    public final String getGpsSpeedRefDescription() {
        String string = ((GpsDirectory) this._directory).getString(12);
        if (string == null) {
            return null;
        }
        String strTrim = string.trim();
        return "K".equalsIgnoreCase(strTrim) ? "km/h" : "M".equalsIgnoreCase(strTrim) ? "mph" : "N".equalsIgnoreCase(strTrim) ? "knots" : ev6.x("Unknown (", strTrim, ")");
    }

    public final String getGpsTimeStampDescription() {
        Rational[] rationalArray = ((GpsDirectory) this._directory).getRationalArray(7);
        DecimalFormat decimalFormat = new DecimalFormat("00.000");
        if (rationalArray == null) {
            return null;
        }
        return String.format("%02d:%02d:%s UTC", Integer.valueOf((int) rationalArray[0].doubleValue()), Integer.valueOf((int) rationalArray[1].doubleValue()), decimalFormat.format(rationalArray[2].doubleValue()));
    }

    public final String getGpsStatusDescription() {
        String string = ((GpsDirectory) this._directory).getString(9);
        if (string == null) {
            return null;
        }
        String strTrim = string.trim();
        return "A".equalsIgnoreCase(strTrim) ? "Active (Measurement in progress)" : PqkdNGCEoxOKZk.dhBg.equalsIgnoreCase(strTrim) ? "Void (Measurement Interoperability)" : ev6.x("Unknown (", strTrim, ")");
    }
}
