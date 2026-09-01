package defpackage;

import j$.time.Duration;
import j$.time.Instant;
import j$.time.LocalDate;
import j$.time.LocalTime;
import j$.time.MonthDay;
import j$.time.Period;
import j$.time.Year;
import j$.time.YearMonth;
import java.io.IOException;
import java.util.Arrays;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class n96 extends jud {
    public final List a;
    public final /* synthetic */ int b;

    public n96(int i, String[] strArr) {
        this.b = i;
        this.a = Arrays.asList(strArr);
    }

    @Override // defpackage.jud
    public final Object b(gd6 gd6Var) throws IOException {
        if (gd6Var.p0() == jd6.NULL) {
            gd6Var.a0();
            return null;
        }
        gd6Var.m();
        List list = this.a;
        long[] jArr = new long[list.size()];
        while (gd6Var.p0() != jd6.END_OBJECT) {
            int iIndexOf = list.indexOf(gd6Var.X());
            if (iIndexOf >= 0) {
                jArr[iIndexOf] = gd6Var.nextLong();
            } else {
                gd6Var.v();
            }
        }
        gd6Var.I();
        switch (this.b) {
            case 0:
                long j = jArr[0];
                int i = (int) j;
                if (j == i) {
                    return Year.of(i);
                }
                throw new ArithmeticException();
            case 1:
                long j2 = jArr[0];
                int i2 = (int) j2;
                if (j2 != i2) {
                    throw new ArithmeticException();
                }
                long j3 = jArr[1];
                int i3 = (int) j3;
                if (j3 == i3) {
                    return YearMonth.of(i2, i3);
                }
                throw new ArithmeticException();
            case 2:
                return Duration.ofSeconds(jArr[0], jArr[1]);
            case 3:
                return Instant.ofEpochSecond(jArr[0], jArr[1]);
            case 4:
                long j4 = jArr[0];
                int i4 = (int) j4;
                if (j4 != i4) {
                    throw new ArithmeticException();
                }
                long j5 = jArr[1];
                int i5 = (int) j5;
                if (j5 != i5) {
                    throw new ArithmeticException();
                }
                long j6 = jArr[2];
                int i6 = (int) j6;
                if (j6 == i6) {
                    return LocalDate.of(i4, i5, i6);
                }
                throw new ArithmeticException();
            case 5:
                long j7 = jArr[0];
                int i7 = (int) j7;
                if (j7 != i7) {
                    throw new ArithmeticException();
                }
                long j8 = jArr[1];
                int i8 = (int) j8;
                if (j8 != i8) {
                    throw new ArithmeticException();
                }
                long j9 = jArr[2];
                int i9 = (int) j9;
                if (j9 != i9) {
                    throw new ArithmeticException();
                }
                long j10 = jArr[3];
                int i10 = (int) j10;
                if (j10 == i10) {
                    return LocalTime.of(i7, i8, i9, i10);
                }
                throw new ArithmeticException();
            case 6:
                long j11 = jArr[0];
                int i11 = (int) j11;
                if (j11 != i11) {
                    throw new ArithmeticException();
                }
                long j12 = jArr[1];
                int i12 = (int) j12;
                if (j12 == i12) {
                    return MonthDay.of(i11, i12);
                }
                throw new ArithmeticException();
            case 7:
                long j13 = jArr[0];
                int i13 = (int) j13;
                if (j13 != i13) {
                    throw new ArithmeticException();
                }
                long j14 = jArr[1];
                int i14 = (int) j14;
                if (j14 != i14) {
                    throw new ArithmeticException();
                }
                long j15 = jArr[2];
                int i15 = (int) j15;
                if (j15 == i15) {
                    return Period.of(i13, i14, i15);
                }
                throw new ArithmeticException();
            default:
                return new GregorianCalendar(qvd.b(jArr[0]), qvd.b(jArr[1]), qvd.b(jArr[2]), qvd.b(jArr[3]), qvd.b(jArr[4]), qvd.b(jArr[5]));
        }
    }

    @Override // defpackage.jud
    public final void c(yd6 yd6Var, Object obj) throws IOException {
        int i;
        long[] jArr;
        long[] jArr2;
        if (obj == null) {
            yd6Var.Q();
            return;
        }
        yd6Var.p();
        switch (this.b) {
            case 0:
                i = 0;
                jArr = new long[]{((Year) obj).getValue()};
                jArr2 = jArr;
                break;
            case 1:
                i = 0;
                YearMonth yearMonth = (YearMonth) obj;
                jArr2 = new long[]{yearMonth.getYear(), yearMonth.getMonthValue()};
                break;
            case 2:
                i = 0;
                jArr2 = new long[]{((Duration) obj).getSeconds(), r2.getNano()};
                break;
            case 3:
                i = 0;
                jArr2 = new long[]{((Instant) obj).getEpochSecond(), r2.getNano()};
                break;
            case 4:
                i = 0;
                LocalDate localDate = (LocalDate) obj;
                jArr = new long[]{localDate.getYear(), localDate.getMonthValue(), localDate.getDayOfMonth()};
                jArr2 = jArr;
                break;
            case 5:
                i = 0;
                LocalTime localTime = (LocalTime) obj;
                jArr2 = new long[]{localTime.getHour(), localTime.getMinute(), localTime.getSecond(), localTime.getNano()};
                break;
            case 6:
                i = 0;
                MonthDay monthDay = (MonthDay) obj;
                jArr2 = new long[]{monthDay.getMonthValue(), monthDay.getDayOfMonth()};
                break;
            case 7:
                i = 0;
                Period period = (Period) obj;
                jArr = new long[]{period.getYears(), period.getMonths(), period.getDays()};
                jArr2 = jArr;
                break;
            default:
                Calendar calendar = (Calendar) obj;
                i = 0;
                jArr2 = new long[]{calendar.get(1), calendar.get(2), calendar.get(5), calendar.get(11), calendar.get(12), calendar.get(13)};
                break;
        }
        int i2 = i;
        while (true) {
            List list = this.a;
            if (i2 >= list.size()) {
                yd6Var.I();
                return;
            } else {
                yd6Var.L((String) list.get(i2));
                yd6Var.o0(jArr2[i2]);
                i2++;
            }
        }
    }
}
