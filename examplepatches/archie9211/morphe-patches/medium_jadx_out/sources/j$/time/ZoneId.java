package j$.time;

import j$.time.temporal.TemporalAccessor;
import j$.util.Objects;
import java.io.DataOutput;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public abstract class ZoneId implements Serializable {
    public static final Map a;
    private static final long serialVersionUID = 8352817235686L;

    static {
        Map.Entry[] entryArr = {a.Q("ACT", "Australia/Darwin"), a.Q("AET", "Australia/Sydney"), a.Q("AGT", "America/Argentina/Buenos_Aires"), a.Q("ART", "Africa/Cairo"), a.Q("AST", "America/Anchorage"), a.Q("BET", "America/Sao_Paulo"), a.Q("BST", "Asia/Dhaka"), a.Q("CAT", "Africa/Harare"), a.Q("CNT", "America/St_Johns"), a.Q("CST", "America/Chicago"), a.Q("CTT", "Asia/Shanghai"), a.Q("EAT", "Africa/Addis_Ababa"), a.Q("ECT", "Europe/Paris"), a.Q("IET", "America/Indiana/Indianapolis"), a.Q("IST", "Asia/Kolkata"), a.Q("JST", "Asia/Tokyo"), a.Q("MIT", "Pacific/Apia"), a.Q("NET", "Asia/Yerevan"), a.Q("NST", "Pacific/Auckland"), a.Q("PLT", "Asia/Karachi"), a.Q("PNT", "America/Phoenix"), a.Q("PRT", "America/Puerto_Rico"), a.Q("PST", "America/Los_Angeles"), a.Q("SST", "Pacific/Guadalcanal"), a.Q("VST", "Asia/Ho_Chi_Minh"), a.Q("EST", "-05:00"), a.Q("MST", "-07:00"), a.Q("HST", "-10:00")};
        HashMap map = new HashMap(28);
        for (int i = 0; i < 28; i++) {
            Map.Entry entry = entryArr[i];
            Object objRequireNonNull = Objects.requireNonNull(entry.getKey());
            if (map.put(objRequireNonNull, Objects.requireNonNull(entry.getValue())) != null) {
                throw new IllegalArgumentException("duplicate key: " + objRequireNonNull);
            }
        }
        a = Collections.unmodifiableMap(map);
    }

    public ZoneId() {
        if (getClass() != ZoneOffset.class && getClass() != s.class) {
            throw new AssertionError("Invalid subclass");
        }
    }

    public static ZoneId A(TemporalAccessor temporalAccessor) {
        ZoneId zoneId = (ZoneId) temporalAccessor.m(j$.time.temporal.o.e);
        if (zoneId != null) {
            return zoneId;
        }
        h.g("Unable to obtain ZoneId from TemporalAccessor: ", temporalAccessor, " of type ", temporalAccessor.getClass().getName());
        return null;
    }

    public static ZoneId C(String str, boolean z) {
        Objects.requireNonNull(str, "zoneId");
        return (str.length() <= 1 || str.startsWith("+") || str.startsWith("-")) ? ZoneOffset.H(str) : (str.startsWith("UTC") || str.startsWith("GMT")) ? E(str, 3, z) : str.startsWith("UT") ? E(str, 2, z) : s.G(str, z);
    }

    public static ZoneId D(String str, ZoneOffset zoneOffset) {
        Objects.requireNonNull(str, "prefix");
        Objects.requireNonNull(zoneOffset, "offset");
        if (str.isEmpty()) {
            return zoneOffset;
        }
        if (!str.equals("GMT") && !str.equals("UTC") && !str.equals("UT")) {
            h.c("prefix should be GMT, UTC or UT, is: ".concat(str));
            return null;
        }
        if (zoneOffset.getTotalSeconds() != 0) {
            str = str.concat(zoneOffset.c);
        }
        return new s(str, zoneOffset.B());
    }

    public static ZoneId E(String str, int i, boolean z) {
        String strSubstring = str.substring(0, i);
        if (str.length() == i) {
            return D(strSubstring, ZoneOffset.UTC);
        }
        if (str.charAt(i) != '+' && str.charAt(i) != '-') {
            return s.G(str, z);
        }
        try {
            ZoneOffset zoneOffsetH = ZoneOffset.H(str.substring(i));
            return zoneOffsetH == ZoneOffset.UTC ? D(strSubstring, zoneOffsetH) : D(strSubstring, zoneOffsetH);
        } catch (c e) {
            throw new c("Invalid ID for offset-based ZoneId: ".concat(str), e);
        }
    }

    public static ZoneId of(String str) {
        return C(str, true);
    }

    private void readObject(ObjectInputStream objectInputStream) throws InvalidObjectException {
        throw new InvalidObjectException("Deserialization via serialization delegate");
    }

    private Object writeReplace() {
        return new p((byte) 7, this);
    }

    public abstract j$.time.zone.f B();

    public abstract void F(DataOutput dataOutput);

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof ZoneId) {
            return getId().equals(((ZoneId) obj).getId());
        }
        return false;
    }

    public abstract String getId();

    public int hashCode() {
        return getId().hashCode();
    }

    public String toString() {
        return getId();
    }
}
