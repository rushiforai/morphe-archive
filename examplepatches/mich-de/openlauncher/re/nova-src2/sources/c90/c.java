package c90;

import b.a3;
import java.text.DateFormat;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes5.dex */
public abstract class c {

    /* renamed from: a, reason: collision with root package name */
    public static final a3 f19885a = new a3(2);

    /* renamed from: b, reason: collision with root package name */
    public static final String[] f19886b;

    /* renamed from: c, reason: collision with root package name */
    public static final DateFormat[] f19887c;

    static {
        String[] strArr = {"EEE, dd MMM yyyy HH:mm:ss zzz", "EEEE, dd-MMM-yy HH:mm:ss zzz", "EEE MMM d HH:mm:ss yyyy", "EEE, dd-MMM-yyyy HH:mm:ss z", "EEE, dd-MMM-yyyy HH-mm-ss z", "EEE, dd MMM yy HH:mm:ss z", "EEE dd-MMM-yyyy HH:mm:ss z", "EEE dd MMM yyyy HH:mm:ss z", "EEE dd-MMM-yyyy HH-mm-ss z", "EEE dd-MMM-yy HH:mm:ss z", "EEE dd MMM yy HH:mm:ss z", "EEE,dd-MMM-yy HH:mm:ss z", "EEE,dd-MMM-yyyy HH:mm:ss z", "EEE, dd-MM-yyyy HH:mm:ss z", "EEE MMM d yyyy HH:mm:ss z"};
        f19886b = strArr;
        f19887c = new DateFormat[strArr.length];
    }

    public static final Date a(String str) {
        Intrinsics.g(str, "<this>");
        if (str.length() == 0) {
            return null;
        }
        ParsePosition parsePosition = new ParsePosition(0);
        Date date = ((DateFormat) f19885a.get()).parse(str, parsePosition);
        if (parsePosition.getIndex() == str.length()) {
            return date;
        }
        String[] strArr = f19886b;
        synchronized (strArr) {
            try {
                int length = strArr.length;
                for (int i5 = 0; i5 < length; i5++) {
                    DateFormat[] dateFormatArr = f19887c;
                    DateFormat simpleDateFormat = dateFormatArr[i5];
                    if (simpleDateFormat == null) {
                        simpleDateFormat = new SimpleDateFormat(f19886b[i5], Locale.US);
                        simpleDateFormat.setTimeZone(y80.c.f96857e);
                        dateFormatArr[i5] = simpleDateFormat;
                    }
                    parsePosition.setIndex(0);
                    Date date2 = simpleDateFormat.parse(str, parsePosition);
                    if (parsePosition.getIndex() != 0) {
                        return date2;
                    }
                }
                Unit unit = Unit.f71706a;
                return null;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
