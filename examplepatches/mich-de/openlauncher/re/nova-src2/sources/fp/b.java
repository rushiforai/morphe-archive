package fp;

import b.c0;
import b.u4;
import com.nimbusds.jose.shaded.gson.JsonSyntaxException;
import cp.z;
import java.io.IOException;
import java.lang.reflect.Array;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.Locale;
import java.util.Objects;
import java.util.TimeZone;

/* loaded from: classes4.dex */
public final class b extends z {

    /* renamed from: d, reason: collision with root package name */
    public static final a f55490d = new a(0);

    /* renamed from: e, reason: collision with root package name */
    public static final a f55491e = new a(1);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f55492a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f55493b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f55494c;

    public /* synthetic */ b(int i5, Object obj, Object obj2) {
        this.f55492a = i5;
        this.f55494c = obj;
        this.f55493b = obj2;
    }

    @Override // cp.z
    public final Object b(kp.a aVar) throws ArrayIndexOutOfBoundsException, IllegalArgumentException, NegativeArraySizeException {
        Date dateB;
        switch (this.f55492a) {
            case 0:
                Class cls = (Class) this.f55493b;
                if (aVar.f0() == 9) {
                    aVar.V();
                    return null;
                }
                ArrayList arrayList = new ArrayList();
                aVar.a();
                while (aVar.p()) {
                    arrayList.add(((z) ((f) this.f55494c).f55502c).b(aVar));
                }
                aVar.e();
                int size = arrayList.size();
                if (!cls.isPrimitive()) {
                    return arrayList.toArray((Object[]) Array.newInstance((Class<?>) cls, size));
                }
                Object objNewInstance = Array.newInstance((Class<?>) cls, size);
                for (int i5 = 0; i5 < size; i5++) {
                    Array.set(objNewInstance, i5, arrayList.get(i5));
                }
                return objNewInstance;
            case 1:
                if (aVar.f0() == 9) {
                    aVar.V();
                    return null;
                }
                String strD0 = aVar.d0();
                synchronized (((ArrayList) this.f55494c)) {
                    try {
                        Iterator it = ((ArrayList) this.f55494c).iterator();
                        while (true) {
                            if (it.hasNext()) {
                                DateFormat dateFormat = (DateFormat) it.next();
                                TimeZone timeZone = dateFormat.getTimeZone();
                                try {
                                    try {
                                        dateB = dateFormat.parse(strD0);
                                    } finally {
                                        dateFormat.setTimeZone(timeZone);
                                    }
                                } catch (ParseException unused) {
                                    dateFormat.setTimeZone(timeZone);
                                }
                            } else {
                                try {
                                    dateB = gp.a.b(strD0, new ParsePosition(0));
                                } catch (ParseException e3) {
                                    StringBuilder sbK = u4.k("Failed parsing '", strD0, "' as Date; at path ");
                                    sbK.append(aVar.l(true));
                                    throw new JsonSyntaxException(sbK.toString(), e3);
                                }
                            }
                        }
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
                return ((e) this.f55493b).a(dateB);
            case 2:
                if (aVar.f0() == 9) {
                    aVar.V();
                    return null;
                }
                Collection collection = (Collection) ((ep.p) this.f55493b).a();
                aVar.a();
                while (aVar.p()) {
                    collection.add(((z) ((f) this.f55494c).f55502c).b(aVar));
                }
                aVar.e();
                return collection;
            default:
                Class cls2 = (Class) this.f55493b;
                Object objB = ((z) ((q) this.f55494c).f55538c).b(aVar);
                if (objB == null || cls2.isInstance(objB)) {
                    return objB;
                }
                throw new JsonSyntaxException("Expected a " + cls2.getName() + " but was " + objB.getClass().getName() + "; at path " + aVar.l(true));
        }
    }

    @Override // cp.z
    public final void c(kp.b bVar, Object obj) throws IOException, ArrayIndexOutOfBoundsException, IllegalArgumentException {
        String str;
        switch (this.f55492a) {
            case 0:
                if (obj == null) {
                    bVar.p();
                    return;
                }
                bVar.b();
                int length = Array.getLength(obj);
                for (int i5 = 0; i5 < length; i5++) {
                    ((f) this.f55494c).c(bVar, Array.get(obj, i5));
                }
                bVar.e();
                return;
            case 1:
                Date date = (Date) obj;
                if (date == null) {
                    bVar.p();
                    return;
                }
                DateFormat dateFormat = (DateFormat) ((ArrayList) this.f55494c).get(0);
                synchronized (((ArrayList) this.f55494c)) {
                    str = dateFormat.format(date);
                }
                bVar.S(str);
                return;
            case 2:
                Collection collection = (Collection) obj;
                if (collection == null) {
                    bVar.p();
                    return;
                }
                bVar.b();
                Iterator it = collection.iterator();
                while (it.hasNext()) {
                    ((f) this.f55494c).c(bVar, it.next());
                }
                bVar.e();
                return;
            default:
                ((z) ((q) this.f55494c).f55538c).c(bVar, obj);
                return;
        }
    }

    public String toString() {
        switch (this.f55492a) {
            case 1:
                DateFormat dateFormat = (DateFormat) ((ArrayList) this.f55494c).get(0);
                if (dateFormat instanceof SimpleDateFormat) {
                    return "DefaultDateTypeAdapter(" + ((SimpleDateFormat) dateFormat).toPattern() + ')';
                }
                return "DefaultDateTypeAdapter(" + dateFormat.getClass().getSimpleName() + ')';
            default:
                return super.toString();
        }
    }

    public b(cp.m mVar, z zVar, Class cls) {
        this.f55492a = 0;
        this.f55494c = new f(mVar, zVar, cls);
        this.f55493b = cls;
    }

    public b(e eVar, int i5, int i11) {
        String str;
        String str2;
        this.f55492a = 1;
        ArrayList arrayList = new ArrayList();
        this.f55494c = arrayList;
        Objects.requireNonNull(eVar);
        this.f55493b = eVar;
        Locale locale = Locale.US;
        arrayList.add(DateFormat.getDateTimeInstance(i5, i11, locale));
        if (!Locale.getDefault().equals(locale)) {
            arrayList.add(DateFormat.getDateTimeInstance(i5, i11));
        }
        if (ep.j.f52875a >= 9) {
            StringBuilder sb2 = new StringBuilder();
            if (i5 == 0) {
                str = "EEEE, MMMM d, yyyy";
            } else if (i5 == 1) {
                str = "MMMM d, yyyy";
            } else if (i5 == 2) {
                str = "MMM d, yyyy";
            } else if (i5 == 3) {
                str = "M/d/yy";
            } else {
                throw new IllegalArgumentException(c0.h(i5, "Unknown DateFormat style: "));
            }
            sb2.append(str);
            sb2.append(" ");
            if (i11 == 0 || i11 == 1) {
                str2 = "h:mm:ss a z";
            } else if (i11 == 2) {
                str2 = "h:mm:ss a";
            } else if (i11 == 3) {
                str2 = "h:mm a";
            } else {
                throw new IllegalArgumentException(c0.h(i11, "Unknown DateFormat style: "));
            }
            sb2.append(str2);
            arrayList.add(new SimpleDateFormat(sb2.toString(), locale));
        }
    }
}
