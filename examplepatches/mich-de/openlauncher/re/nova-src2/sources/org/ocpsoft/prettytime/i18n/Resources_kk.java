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
public class Resources_kk extends ListResourceBundle implements d {

    /* renamed from: a, reason: collision with root package name */
    public static final Object[][] f80685a = (Object[][]) Array.newInstance((Class<?>) Object.class, 0, 0);

    /* renamed from: org.ocpsoft.prettytime.i18n.Resources_kk$1, reason: invalid class name */
    class AnonymousClass1 implements c {
        @Override // wa0.c
        public final String b(ya0.a aVar, String str) {
            return str;
        }

        @Override // wa0.c
        public final String c(ya0.a aVar) {
            if (aVar.d()) {
                return "дәл қазір";
            }
            if (aVar.e()) {
                return "жана ғана";
            }
            return null;
        }
    }

    public static class KkTimeFormat implements c {

        /* renamed from: a, reason: collision with root package name */
        public final String[] f80686a;

        public KkTimeFormat(String... strArr) {
            if (strArr.length != 2) {
                throw new IllegalArgumentException("Future and past forms must be provided for kazakh language!");
            }
            this.f80686a = strArr;
        }

        @Override // wa0.c
        public final String b(ya0.a aVar, String str) {
            boolean zE = aVar.e();
            boolean zD = aVar.d();
            aVar.b();
            StringBuilder sb2 = new StringBuilder();
            int i5 = !zE ? 1 : 0;
            sb2.append(str);
            sb2.append(' ');
            sb2.append(this.f80686a[i5]);
            sb2.append(' ');
            if (zE) {
                sb2.append("бұрын");
            }
            if (zD) {
                sb2.append("кейін");
            }
            return sb2.toString();
        }

        @Override // wa0.c
        public final String c(ya0.a aVar) {
            long jB = aVar.b();
            StringBuilder sb2 = new StringBuilder();
            sb2.append(jB);
            return sb2.toString();
        }
    }

    @Override // ya0.d
    public final c a(ya0.c cVar) {
        if (cVar instanceof JustNow) {
            return new AnonymousClass1();
        }
        if (cVar instanceof Century) {
            return new KkTimeFormat("ғасыр", "ғасырдан");
        }
        if (cVar instanceof Day) {
            return new KkTimeFormat("күн", "күннен");
        }
        if (cVar instanceof Decade) {
            return new KkTimeFormat("онжылдық", "онжылдықтан");
        }
        if (cVar instanceof Hour) {
            return new KkTimeFormat("сағат", "сағаттан");
        }
        if (cVar instanceof Millennium) {
            return new KkTimeFormat("мыңжылдық", "мыңжылдықтан");
        }
        if (cVar instanceof Millisecond) {
            return new KkTimeFormat("миллисекунд", "миллисекундтан");
        }
        if (cVar instanceof Minute) {
            return new KkTimeFormat("минут", "минуттан");
        }
        if (cVar instanceof Month) {
            return new KkTimeFormat("ай", "айдан");
        }
        if (cVar instanceof Second) {
            return new KkTimeFormat("секунд", "секундтан");
        }
        if (cVar instanceof Week) {
            return new KkTimeFormat("апта", "аптадан");
        }
        if (cVar instanceof Year) {
            return new KkTimeFormat("жыл", "жылдан");
        }
        return null;
    }

    @Override // java.util.ListResourceBundle
    public final Object[][] getContents() {
        return f80685a;
    }
}
