package org.ocpsoft.prettytime.i18n;

import java.lang.reflect.Array;
import java.util.ListResourceBundle;
import org.ocpsoft.prettytime.units.Century;
import org.ocpsoft.prettytime.units.Day;
import org.ocpsoft.prettytime.units.Decade;
import org.ocpsoft.prettytime.units.Hour;
import org.ocpsoft.prettytime.units.JustNow;
import org.ocpsoft.prettytime.units.Millennium;
import org.ocpsoft.prettytime.units.Millisecond;
import org.ocpsoft.prettytime.units.Minute;
import org.ocpsoft.prettytime.units.Month;
import org.ocpsoft.prettytime.units.Second;
import org.ocpsoft.prettytime.units.Week;
import org.ocpsoft.prettytime.units.Year;
import wa0.c;
import ya0.d;

/* loaded from: classes5.dex */
public class Resources_pl extends ListResourceBundle implements d {

    /* renamed from: a, reason: collision with root package name */
    public static final Object[][] f80694a = (Object[][]) Array.newInstance((Class<?>) Object.class, 0, 0);

    /* renamed from: org.ocpsoft.prettytime.i18n.Resources_pl$1, reason: invalid class name */
    class AnonymousClass1 implements c {
        @Override // wa0.c
        public final String b(ya0.a aVar, String str) {
            return str;
        }

        @Override // wa0.c
        public final String c(ya0.a aVar) {
            if (aVar.d()) {
                return "za chwilę";
            }
            if (aVar.e()) {
                return "przed chwilą";
            }
            return null;
        }
    }

    public static class TimeFormatAided implements c {

        /* renamed from: a, reason: collision with root package name */
        public final String[] f80695a;

        public TimeFormatAided(String... strArr) {
            if (strArr.length != 3) {
                throw new IllegalArgumentException("Wrong plural forms number for Polish language!");
            }
            this.f80695a = strArr;
        }

        /* JADX WARN: Removed duplicated region for block: B:14:0x0033  */
        @Override // wa0.c
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final String b(ya0.a aVar, String str) {
            char c11;
            boolean zE = aVar.e();
            boolean zD = aVar.d();
            long jB = aVar.b();
            if (jB == 1) {
                c11 = 0;
            } else {
                long j11 = jB % 10;
                if (j11 < 2 || j11 > 4) {
                    c11 = 2;
                } else {
                    long j12 = jB % 100;
                    if (j12 < 10 || j12 >= 20) {
                        c11 = 1;
                    }
                }
            }
            StringBuilder sb2 = new StringBuilder();
            if (zD) {
                sb2.append("za ");
            }
            sb2.append(str);
            sb2.append(' ');
            sb2.append(this.f80695a[c11]);
            if (zE) {
                sb2.append(" temu");
            }
            return sb2.toString();
        }

        @Override // wa0.c
        public final String c(ya0.a aVar) {
            return String.valueOf(aVar.b());
        }
    }

    @Override // ya0.d
    public final c a(ya0.c cVar) {
        if (cVar instanceof JustNow) {
            return new AnonymousClass1();
        }
        if (cVar instanceof Century) {
            return new TimeFormatAided("wiek", "wieki", "wieków");
        }
        if (cVar instanceof Day) {
            return new TimeFormatAided("dzień", "dni", "dni");
        }
        if (cVar instanceof Decade) {
            return new TimeFormatAided("dekadę", "dekady", "dekad");
        }
        if (cVar instanceof Hour) {
            return new TimeFormatAided("godzinę", "godziny", "godzin");
        }
        if (cVar instanceof Millennium) {
            return new TimeFormatAided("milenium", "milenia", "mileniów");
        }
        if (cVar instanceof Millisecond) {
            return new TimeFormatAided("milisekundę", "milisekundy", "milisekund");
        }
        if (cVar instanceof Minute) {
            return new TimeFormatAided("minutę", "minuty", "minut");
        }
        if (cVar instanceof Month) {
            return new TimeFormatAided("miesiąc", "miesiące", "miesięcy");
        }
        if (cVar instanceof Second) {
            return new TimeFormatAided("sekundę", "sekundy", "sekund");
        }
        if (cVar instanceof Week) {
            return new TimeFormatAided("tydzień", "tygodnie", "tygodni");
        }
        if (cVar instanceof Year) {
            return new TimeFormatAided("rok", "lata", "lat");
        }
        return null;
    }

    @Override // java.util.ListResourceBundle
    public final Object[][] getContents() {
        return f80694a;
    }
}
