package com.drew.metadata.exif;

import com.drew.metadata.Directory;
import j$.util.DesugarTimeZone;
import java.util.Date;
import java.util.HashMap;
import java.util.TimeZone;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ExifSubIFDDirectory extends ExifDirectoryBase {
    public static final int TAG_INTEROP_OFFSET = 40965;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        ExifDirectoryBase.addExifTagNames(map);
    }

    public ExifSubIFDDirectory() {
        setDescriptor(new ExifSubIFDDescriptor(this));
    }

    private TimeZone getTimeZone(int i) {
        String string = getString(i);
        if (string == null || !string.matches("[\\+\\-]\\d\\d:\\d\\d")) {
            return null;
        }
        return DesugarTimeZone.getTimeZone("GMT".concat(string));
    }

    public final Date getDateDigitized(TimeZone timeZone) {
        TimeZone timeZone2 = getTimeZone(ExifDirectoryBase.TAG_TIME_ZONE_DIGITIZED);
        String string = getString(ExifDirectoryBase.TAG_SUBSECOND_TIME_DIGITIZED);
        if (timeZone2 != null) {
            timeZone = timeZone2;
        }
        return getDate(ExifDirectoryBase.TAG_DATETIME_DIGITIZED, string, timeZone);
    }

    public final Date getDateModified(TimeZone timeZone) {
        Directory parent = getParent();
        if (!(parent instanceof ExifIFD0Directory)) {
            return null;
        }
        TimeZone timeZone2 = getTimeZone(ExifDirectoryBase.TAG_TIME_ZONE);
        String string = getString(ExifDirectoryBase.TAG_SUBSECOND_TIME);
        if (timeZone2 != null) {
            timeZone = timeZone2;
        }
        return parent.getDate(306, string, timeZone);
    }

    public final Date getDateOriginal(TimeZone timeZone) {
        TimeZone timeZone2 = getTimeZone(ExifDirectoryBase.TAG_TIME_ZONE_ORIGINAL);
        String string = getString(ExifDirectoryBase.TAG_SUBSECOND_TIME_ORIGINAL);
        if (timeZone2 != null) {
            timeZone = timeZone2;
        }
        return getDate(ExifDirectoryBase.TAG_DATETIME_ORIGINAL, string, timeZone);
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Exif SubIFD";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }

    public final Date getDateDigitized() {
        return getDateDigitized(null);
    }

    public final Date getDateOriginal() {
        return getDateOriginal(null);
    }

    public final Date getDateModified() {
        return getDateModified(null);
    }
}
