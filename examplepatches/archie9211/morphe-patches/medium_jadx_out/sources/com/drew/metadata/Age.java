package com.drew.metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class Age {
    private final int _days;
    private final int _hours;
    private final int _minutes;
    private final int _months;
    private final int _seconds;
    private final int _years;

    public Age(int i, int i2, int i3, int i4, int i5, int i6) {
        this._years = i;
        this._months = i2;
        this._days = i3;
        this._hours = i4;
        this._minutes = i5;
        this._seconds = i6;
    }

    private static void appendAgePart(StringBuilder sb, int i, String str) {
        if (i == 0) {
            return;
        }
        if (sb.length() != 0) {
            sb.append(' ');
        }
        sb.append(i);
        sb.append(' ');
        sb.append(str);
        if (i != 1) {
            sb.append('s');
        }
    }

    public static Age fromPanasonicString(String str) {
        if (str.length() == 19 && !str.startsWith("9999:99:99")) {
            try {
                return new Age(Integer.parseInt(str.substring(0, 4)), Integer.parseInt(str.substring(5, 7)), Integer.parseInt(str.substring(8, 10)), Integer.parseInt(str.substring(11, 13)), Integer.parseInt(str.substring(14, 16)), Integer.parseInt(str.substring(17, 19)));
            } catch (NumberFormatException unused) {
            }
        }
        return null;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        Age age = (Age) obj;
        return this._days == age._days && this._hours == age._hours && this._minutes == age._minutes && this._months == age._months && this._seconds == age._seconds && this._years == age._years;
    }

    public final int getDays() {
        return this._days;
    }

    public final int getHours() {
        return this._hours;
    }

    public final int getMinutes() {
        return this._minutes;
    }

    public final int getMonths() {
        return this._months;
    }

    public final int getSeconds() {
        return this._seconds;
    }

    public final int getYears() {
        return this._years;
    }

    public final int hashCode() {
        return (((((((((this._years * 31) + this._months) * 31) + this._days) * 31) + this._hours) * 31) + this._minutes) * 31) + this._seconds;
    }

    public final String toFriendlyString() {
        StringBuilder sb = new StringBuilder();
        appendAgePart(sb, this._years, "year");
        appendAgePart(sb, this._months, "month");
        appendAgePart(sb, this._days, "day");
        appendAgePart(sb, this._hours, "hour");
        appendAgePart(sb, this._minutes, "minute");
        appendAgePart(sb, this._seconds, "second");
        return sb.toString();
    }

    public final String toString() {
        return String.format("%04d:%02d:%02d %02d:%02d:%02d", Integer.valueOf(this._years), Integer.valueOf(this._months), Integer.valueOf(this._days), Integer.valueOf(this._hours), Integer.valueOf(this._minutes), Integer.valueOf(this._seconds));
    }
}
