package ip;

import com.nimbusds.jose.shaded.gson.JsonSyntaxException;
import cp.z;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.TimeZone;

/* loaded from: classes4.dex */
public final class a extends z {

    /* renamed from: c, reason: collision with root package name */
    public static final fp.a f67948c = new fp.a(4);

    /* renamed from: d, reason: collision with root package name */
    public static final fp.a f67949d = new fp.a(5);

    /* renamed from: e, reason: collision with root package name */
    public static final fp.a f67950e = new fp.a(6);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f67951a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f67952b;

    public a(int i5) {
        this.f67951a = i5;
        switch (i5) {
            case 1:
                this.f67952b = new SimpleDateFormat("hh:mm:ss a");
                break;
            default:
                this.f67952b = new SimpleDateFormat("MMM d, yyyy");
                break;
        }
    }

    @Override // cp.z
    public final Object b(kp.a aVar) {
        TimeZone timeZone;
        Date date;
        Time time;
        switch (this.f67951a) {
            case 0:
                if (aVar.f0() == 9) {
                    aVar.V();
                    return null;
                }
                String strD0 = aVar.d0();
                synchronized (this) {
                    timeZone = ((SimpleDateFormat) this.f67952b).getTimeZone();
                    try {
                        try {
                            date = new Date(((SimpleDateFormat) this.f67952b).parse(strD0).getTime());
                        } catch (ParseException e3) {
                            throw new JsonSyntaxException("Failed parsing '" + strD0 + "' as SQL Date; at path " + aVar.l(true), e3);
                        }
                    } finally {
                    }
                }
                return date;
            case 1:
                if (aVar.f0() == 9) {
                    aVar.V();
                    return null;
                }
                String strD02 = aVar.d0();
                synchronized (this) {
                    timeZone = ((SimpleDateFormat) this.f67952b).getTimeZone();
                    try {
                        try {
                            time = new Time(((SimpleDateFormat) this.f67952b).parse(strD02).getTime());
                        } catch (ParseException e11) {
                            throw new JsonSyntaxException("Failed parsing '" + strD02 + "' as SQL Time; at path " + aVar.l(true), e11);
                        }
                    } finally {
                    }
                }
                return time;
            default:
                java.util.Date date2 = (java.util.Date) ((z) this.f67952b).b(aVar);
                if (date2 != null) {
                    return new Timestamp(date2.getTime());
                }
                return null;
        }
    }

    @Override // cp.z
    public final void c(kp.b bVar, Object obj) throws IOException {
        String str;
        String str2;
        switch (this.f67951a) {
            case 0:
                Date date = (Date) obj;
                if (date == null) {
                    bVar.p();
                    return;
                }
                synchronized (this) {
                    str = ((SimpleDateFormat) this.f67952b).format((java.util.Date) date);
                }
                bVar.S(str);
                return;
            case 1:
                Time time = (Time) obj;
                if (time == null) {
                    bVar.p();
                    return;
                }
                synchronized (this) {
                    str2 = ((SimpleDateFormat) this.f67952b).format((java.util.Date) time);
                }
                bVar.S(str2);
                return;
            default:
                ((z) this.f67952b).c(bVar, (Timestamp) obj);
                return;
        }
    }

    public a(z zVar) {
        this.f67951a = 2;
        this.f67952b = zVar;
    }
}
