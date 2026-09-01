package j$.util;

import j$.time.Instant;
import java.util.Date;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final /* synthetic */ class DateRetargetClass {
    public static Instant toInstant(Date date) {
        long time = date.getTime();
        Instant instant = Instant.c;
        return Instant.A(j$.time.a.S(time, 1000L), ((int) j$.time.a.R(time, 1000L)) * 1000000);
    }
}
