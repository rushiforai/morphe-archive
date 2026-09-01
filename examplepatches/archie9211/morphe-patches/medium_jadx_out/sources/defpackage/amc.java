package defpackage;

import com.google.gson.JsonSyntaxException;
import java.io.IOException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class amc extends jud {
    public static final a b = new a();
    public final SimpleDateFormat a;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public class a implements kud {
        @Override // defpackage.kud
        public final jud a(ch5 ch5Var, kxd kxdVar) {
            if (kxdVar.c() == Time.class) {
                return new amc(0);
            }
            return null;
        }
    }

    private amc() {
        this.a = new SimpleDateFormat("hh:mm:ss a");
    }

    @Override // defpackage.jud
    public final Object b(gd6 gd6Var) throws IOException {
        Time time;
        if (gd6Var.p0() == jd6.NULL) {
            gd6Var.a0();
            return null;
        }
        String strQ = gd6Var.q();
        synchronized (this) {
            TimeZone timeZone = this.a.getTimeZone();
            try {
                try {
                    time = new Time(this.a.parse(strQ).getTime());
                } catch (ParseException e) {
                    throw new JsonSyntaxException("Failed parsing '" + strQ + "' as SQL Time; at path " + gd6Var.R(), e);
                }
            } finally {
                this.a.setTimeZone(timeZone);
            }
        }
        return time;
    }

    @Override // defpackage.jud
    public final void c(yd6 yd6Var, Object obj) throws IOException {
        String str;
        Time time = (Time) obj;
        if (time == null) {
            yd6Var.Q();
            return;
        }
        synchronized (this) {
            str = this.a.format((Date) time);
        }
        yd6Var.A0(str);
    }

    public /* synthetic */ amc(int i) {
        this();
    }
}
