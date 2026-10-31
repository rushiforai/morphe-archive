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
public class Resources_ru extends ListResourceBundle implements d {

    /* renamed from: a, reason: collision with root package name */
    public static final Object[][] f80698a = (Object[][]) Array.newInstance((Class<?>) Object.class, 0, 0);

    /* renamed from: org.ocpsoft.prettytime.i18n.Resources_ru$1, reason: invalid class name */
    class AnonymousClass1 implements c {
        @Override // wa0.c
        public final String b(ya0.a aVar, String str) {
            return str;
        }

        @Override // wa0.c
        public final String c(ya0.a aVar) {
            if (aVar.d()) {
                return "сейчас";
            }
            if (aVar.e()) {
                return "только что";
            }
            return null;
        }
    }

    public static class TimeFormatAided implements c {

        /* renamed from: a, reason: collision with root package name */
        public final String[] f80699a;

        public TimeFormatAided(String... strArr) {
            if (strArr.length != 3) {
                throw new IllegalArgumentException("Wrong plural forms number for russian language!");
            }
            this.f80699a = strArr;
        }

        /* JADX WARN: Removed duplicated region for block: B:16:0x003b  */
        @Override // wa0.c
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final String b(ya0.a aVar, String str) {
            char c11;
            boolean zE = aVar.e();
            boolean zD = aVar.d();
            long jB = aVar.b();
            long j11 = jB % 10;
            if (j11 == 1 && jB % 100 != 11) {
                c11 = 0;
            } else if (j11 < 2 || j11 > 4) {
                c11 = 2;
            } else {
                long j12 = jB % 100;
                if (j12 < 10 || j12 >= 20) {
                    c11 = 1;
                }
            }
            StringBuilder sb2 = new StringBuilder();
            if (zD) {
                sb2.append("через ");
            }
            sb2.append(str);
            sb2.append(' ');
            sb2.append(this.f80699a[c11]);
            if (zE) {
                sb2.append(" назад");
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
            return new TimeFormatAided("век", "века", "веков");
        }
        if (cVar instanceof Day) {
            return new TimeFormatAided("день", "дня", "дней");
        }
        if (cVar instanceof Decade) {
            return new TimeFormatAided("десятилетие", "десятилетия", "десятилетий");
        }
        if (cVar instanceof Hour) {
            return new TimeFormatAided("час", "часа", "часов");
        }
        if (cVar instanceof Millennium) {
            return new TimeFormatAided("тысячелетие", "тысячелетия", "тысячелетий");
        }
        if (cVar instanceof Millisecond) {
            return new TimeFormatAided("миллисекунду", "миллисекунды", "миллисекунд");
        }
        if (cVar instanceof Minute) {
            return new TimeFormatAided("минуту", "минуты", "минут");
        }
        if (cVar instanceof Month) {
            return new TimeFormatAided("месяц", "месяца", "месяцев");
        }
        if (cVar instanceof Second) {
            return new TimeFormatAided("секунду", "секунды", "секунд");
        }
        if (cVar instanceof Week) {
            return new TimeFormatAided("неделю", "недели", "недель");
        }
        if (cVar instanceof Year) {
            return new TimeFormatAided("год", "года", "лет");
        }
        return null;
    }

    @Override // java.util.ListResourceBundle
    public final Object[][] getContents() {
        return f80698a;
    }
}
