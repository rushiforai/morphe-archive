package f30;

import h30.g;
import java.lang.reflect.Field;
import java.util.ArrayList;

/* loaded from: classes4.dex */
public final class d {

    /* renamed from: d, reason: collision with root package name */
    public static final String[] f54299d = {"TEXT", "INTEGER", "INTEGER", "INTEGER", "INTEGER", "REAL", "REAL", "NONE"};

    /* renamed from: a, reason: collision with root package name */
    public final String f54300a;

    /* renamed from: b, reason: collision with root package name */
    public final c[] f54301b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f54302c;

    public d() {
        int i5;
        int i11;
        ArrayList arrayList = new ArrayList();
        Class superclass = g.class;
        while (true) {
            if (superclass == null) {
                int size = arrayList.size();
                c[] cVarArr = new c[size];
                arrayList.toArray(cVarArr);
                b bVar = (b) g.class.getAnnotation(b.class);
                this.f54300a = bVar == null ? null : bVar.value();
                this.f54301b = cVarArr;
                String[] strArr = new String[size];
                boolean z11 = false;
                for (int i12 = 0; i12 != size; i12++) {
                    c cVar = cVarArr[i12];
                    strArr[i12] = cVar.f54293a;
                    if (cVar.f54297e) {
                        z11 = true;
                    }
                }
                this.f54302c = z11;
                return;
            }
            Field[] declaredFields = superclass.getDeclaredFields();
            for (int i13 = 0; i13 != declaredFields.length; i13++) {
                Field field = declaredFields[i13];
                a aVar = (a) field.getAnnotation(a.class);
                if (aVar != null) {
                    Class<?> type = field.getType();
                    if (type == String.class) {
                        i11 = 0;
                    } else if (type == Boolean.TYPE) {
                        i11 = 1;
                    } else {
                        if (type == Short.TYPE) {
                            i5 = 2;
                        } else if (type == Integer.TYPE) {
                            i5 = 3;
                        } else if (type == Long.TYPE) {
                            i5 = 4;
                        } else if (type == Float.TYPE) {
                            i5 = 5;
                        } else if (type == Double.TYPE) {
                            i5 = 6;
                        } else {
                            if (type != byte[].class) {
                                throw new IllegalArgumentException("Unsupported field type for column: ".concat(type.getName()));
                            }
                            i5 = 7;
                        }
                        i11 = i5;
                    }
                    arrayList.size();
                    arrayList.add(new c(aVar.value(), i11, aVar.indexed(), aVar.unique(), aVar.fullText(), aVar.defaultValue(), field));
                }
            }
            superclass = superclass.getSuperclass();
        }
    }
}
