package defpackage;

import com.google.gson.JsonSyntaxException;
import j$.util.Objects;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.Locale;
import java.util.TimeZone;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ly2 extends jud {
    public static final iy2 c = new iy2();
    public final ky2 a;
    public final ArrayList b;

    public ly2(ky2 ky2Var, int i, int i2) {
        String str;
        String str2;
        ArrayList arrayList = new ArrayList();
        this.b = arrayList;
        Objects.requireNonNull(ky2Var);
        this.a = ky2Var;
        Locale locale = Locale.US;
        arrayList.add(DateFormat.getDateTimeInstance(i, i2, locale));
        if (!Locale.getDefault().equals(locale)) {
            arrayList.add(DateFormat.getDateTimeInstance(i, i2));
        }
        if (ra6.a >= 9) {
            if (i == 0) {
                str = "EEEE, MMMM d, yyyy";
            } else if (i == 1) {
                str = "MMMM d, yyyy";
            } else if (i == 2) {
                str = "MMM d, yyyy";
            } else {
                if (i != 3) {
                    ay0.e(b09.w(i, "Unknown DateFormat style: "));
                    throw null;
                }
                str = "M/d/yy";
            }
            StringBuilder sb = new StringBuilder(str);
            sb.append(" ");
            if (i2 == 0 || i2 == 1) {
                str2 = "h:mm:ss a z";
            } else if (i2 == 2) {
                str2 = "h:mm:ss a";
            } else {
                if (i2 != 3) {
                    ay0.e(b09.w(i2, "Unknown DateFormat style: "));
                    throw null;
                }
                str2 = "h:mm a";
            }
            sb.append(str2);
            arrayList.add(new SimpleDateFormat(sb.toString(), locale));
        }
    }

    @Override // defpackage.jud
    public final Object b(gd6 gd6Var) throws IOException {
        Date dateB;
        if (gd6Var.p0() == jd6.NULL) {
            gd6Var.a0();
            return null;
        }
        String strQ = gd6Var.q();
        synchronized (this.b) {
            try {
                Iterator it2 = this.b.iterator();
                while (true) {
                    if (!it2.hasNext()) {
                        try {
                            dateB = xu5.b(strQ, new ParsePosition(0));
                            break;
                        } catch (ParseException e) {
                            StringBuilder sbU = lv8.u("Failed parsing '", strQ, "' as Date; at path ");
                            sbU.append(gd6Var.R());
                            throw new JsonSyntaxException(sbU.toString(), e);
                        }
                    }
                    DateFormat dateFormat = (DateFormat) it2.next();
                    TimeZone timeZone = dateFormat.getTimeZone();
                    try {
                        try {
                            dateB = dateFormat.parse(strQ);
                            break;
                        } finally {
                            dateFormat.setTimeZone(timeZone);
                        }
                    } catch (ParseException unused) {
                        dateFormat.setTimeZone(timeZone);
                    }
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return this.a.a(dateB);
    }

    @Override // defpackage.jud
    public final void c(yd6 yd6Var, Object obj) throws IOException {
        String str;
        Date date = (Date) obj;
        if (date == null) {
            yd6Var.Q();
            return;
        }
        DateFormat dateFormat = (DateFormat) this.b.get(0);
        synchronized (this.b) {
            str = dateFormat.format(date);
        }
        yd6Var.A0(str);
    }

    public final String toString() {
        DateFormat dateFormat = (DateFormat) this.b.get(0);
        if (dateFormat instanceof SimpleDateFormat) {
            return "DefaultDateTypeAdapter(" + ((SimpleDateFormat) dateFormat).toPattern() + ')';
        }
        return "DefaultDateTypeAdapter(" + dateFormat.getClass().getSimpleName() + ')';
    }
}
