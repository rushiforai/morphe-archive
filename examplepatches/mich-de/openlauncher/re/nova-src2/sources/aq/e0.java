package aq;

import ads_mobile_sdk.ku3;
import ads_mobile_sdk.lu3;
import ads_mobile_sdk.vu3;
import b.k9;
import com.instabridge.ai.proactive.AiInsightScoreAdapter;
import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Set;

/* loaded from: classes4.dex */
public final class e0 {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f15450a;

    /* renamed from: b, reason: collision with root package name */
    public int f15451b;

    public e0(int i5) {
        switch (i5) {
            case 1:
                int[] iArr = {1516266761, 1142957872, 446044582, 1147282962, 861635011, -1643766350, 500618996, 1941690360, 410409117};
                int i11 = iArr[7] % iArr[8];
                this.f15450a = new ArrayList();
                this.f15451b = 0;
                break;
            default:
                this.f15450a = new ArrayList();
                this.f15451b = 0;
                break;
        }
    }

    public int a(long j11) throws ku3 {
        int[] iArr = {2001100545, 2130723407, 140753313, -149863858, -2003236720, 202391198, 23353437, 1141616124, 84353895};
        int i5 = iArr[0];
        int i11 = iArr[1];
        int iC = k9.c((i11 & (~i5)) | iArr[2], (i5 & iArr[3]) | iArr[4], iArr[5], iArr[6]) ^ (iArr[7] % iArr[8]);
        long[] jArr = {269441500, 1994078854, 158128940, -158130045, -1992289935, 556430036, 8936987, 2147469841, 438792350};
        long j12 = jArr[0];
        long j13 = jArr[1];
        long j14 = jArr[2];
        long j15 = jArr[3];
        long j16 = j11 >= 0 ? (this.f15451b + iC) - j11 : (((((((~j12) & j13) | j14) + ((j12 & j15) | jArr[4])) - jArr[5]) + jArr[6]) ^ (jArr[7] % jArr[8])) + (-j11);
        if (j16 < 0 || j16 >= this.f15451b) {
            throw new ku3();
        }
        return (int) j16;
    }

    public void b(q qVar) {
        int i5 = this.f15451b;
        this.f15451b = i5 + 1;
        this.f15450a.add(i5, qVar);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:100:0x01f2 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00f6  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x01ee  */
    /* JADX WARN: Removed duplicated region for block: B:97:0x00fe A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void c(AiInsightScoreAdapter aiInsightScoreAdapter) {
        Class<AiInsightScoreAdapter> cls;
        Class<AiInsightScoreAdapter> cls2;
        Object obj;
        Type type;
        String str;
        String str2;
        Class cls3;
        int i5;
        Method[] methodArr;
        int i11;
        d cVar;
        String str3;
        d dVarB;
        boolean z11;
        String str4;
        String str5;
        d cVar2;
        d dVarB2;
        boolean z12;
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        Class<AiInsightScoreAdapter> cls4 = AiInsightScoreAdapter.class;
        Class<AiInsightScoreAdapter> superclass = cls4;
        while (superclass != Object.class) {
            Method[] declaredMethods = superclass.getDeclaredMethods();
            int length = declaredMethods.length;
            int i12 = 0;
            while (i12 < length) {
                Method method = declaredMethods[i12];
                boolean zIsAnnotationPresent = method.isAnnotationPresent(n0.class);
                Class cls5 = Void.TYPE;
                if (zIsAnnotationPresent) {
                    method.setAccessible(true);
                    Type genericReturnType = method.getGenericReturnType();
                    Type[] genericParameterTypes = method.getGenericParameterTypes();
                    Annotation[][] parameterAnnotations = method.getParameterAnnotations();
                    i5 = 0;
                    cls = cls4;
                    if (genericParameterTypes.length >= 2 && genericParameterTypes[0] == x.class && genericReturnType == cls5) {
                        int length2 = genericParameterTypes.length;
                        int i13 = 2;
                        while (i13 < length2) {
                            int i14 = length2;
                            Type type2 = genericParameterTypes[i13];
                            cls2 = superclass;
                            if ((type2 instanceof ParameterizedType) && ((ParameterizedType) type2).getRawType() == r.class) {
                                i13++;
                                length2 = i14;
                                superclass = cls2;
                            }
                        }
                        cls2 = superclass;
                        obj = "Nullable";
                        str4 = "Unexpected signature for ";
                        type = r.class;
                        str5 = "\n    ";
                        cVar2 = new b(genericParameterTypes[1], bq.e.f(parameterAnnotations[1]), aiInsightScoreAdapter, method, genericParameterTypes.length, 2, true, 0);
                        cls3 = cls5;
                        dVarB2 = e.b(arrayList, cVar2.f15432a, cVar2.f15433b);
                        if (dVarB2 == null) {
                            throw new IllegalArgumentException("Conflicting @ToJson methods:\n    " + dVarB2.f15435d + str5 + cVar2.f15435d);
                        }
                        arrayList.add(cVar2);
                        str = str5;
                        str2 = str4;
                    } else {
                        cls2 = superclass;
                    }
                    obj = "Nullable";
                    type = r.class;
                    str5 = "\n    ";
                    str4 = "Unexpected signature for ";
                    if (genericParameterTypes.length != 1 || genericReturnType == cls5) {
                        throw new IllegalArgumentException(str4 + method + ".\n@ToJson method signatures may have one of the following structures:\n    <any access modifier> void toJson(JsonWriter writer, T value) throws <any>;\n    <any access modifier> void toJson(JsonWriter writer, T value, JsonAdapter<any> delegate, <any more delegates>) throws <any>;\n    <any access modifier> R toJson(T value) throws <any>;\n");
                    }
                    Set set = bq.e.f18422a;
                    Set setF = bq.e.f(method.getAnnotations());
                    Set setF2 = bq.e.f(parameterAnnotations[0]);
                    Annotation[] annotationArr = parameterAnnotations[0];
                    int length3 = annotationArr.length;
                    int i15 = 0;
                    while (true) {
                        if (i15 >= length3) {
                            z12 = false;
                            break;
                        } else {
                            if (annotationArr[i15].annotationType().getSimpleName().equals(obj)) {
                                z12 = true;
                                break;
                            }
                            i15++;
                        }
                    }
                    cls3 = cls5;
                    cVar2 = new c(genericParameterTypes[0], setF2, aiInsightScoreAdapter, method, genericParameterTypes.length, z12, genericParameterTypes, genericReturnType, setF2, setF, 0);
                    dVarB2 = e.b(arrayList, cVar2.f15432a, cVar2.f15433b);
                    if (dVarB2 == null) {
                    }
                } else {
                    cls = cls4;
                    cls2 = superclass;
                    obj = "Nullable";
                    type = r.class;
                    str = "\n    ";
                    str2 = "Unexpected signature for ";
                    cls3 = cls5;
                    i5 = 0;
                }
                if (method.isAnnotationPresent(n.class)) {
                    method.setAccessible(true);
                    String str6 = str;
                    Type genericReturnType2 = method.getGenericReturnType();
                    Set set2 = bq.e.f18422a;
                    Set setF3 = bq.e.f(method.getAnnotations());
                    Type[] genericParameterTypes2 = method.getGenericParameterTypes();
                    Annotation[][] parameterAnnotations2 = method.getParameterAnnotations();
                    if (genericParameterTypes2.length < 1 || genericParameterTypes2[i5] != u.class || genericReturnType2 == cls3) {
                        methodArr = declaredMethods;
                        i11 = length;
                    } else {
                        int length4 = genericParameterTypes2.length;
                        int i16 = 1;
                        while (i16 < length4) {
                            methodArr = declaredMethods;
                            Type type3 = genericParameterTypes2[i16];
                            i11 = length;
                            if ((type3 instanceof ParameterizedType) && ((ParameterizedType) type3).getRawType() == type) {
                                i16++;
                                declaredMethods = methodArr;
                                length = i11;
                            }
                        }
                        methodArr = declaredMethods;
                        i11 = length;
                        str3 = str6;
                        cVar = new b(genericReturnType2, setF3, aiInsightScoreAdapter, method, genericParameterTypes2.length, 1, true, 1);
                        dVarB = e.b(arrayList2, cVar.f15432a, cVar.f15433b);
                        if (dVarB == null) {
                            throw new IllegalArgumentException("Conflicting @FromJson methods:\n    " + dVarB.f15435d + str3 + cVar.f15435d);
                        }
                        arrayList2.add(cVar);
                    }
                    str3 = str6;
                    if (genericParameterTypes2.length != 1 || genericReturnType2 == cls3) {
                        throw new IllegalArgumentException(str2 + method + ".\n@FromJson method signatures may have one of the following structures:\n    <any access modifier> R fromJson(JsonReader jsonReader) throws <any>;\n    <any access modifier> R fromJson(JsonReader jsonReader, JsonAdapter<any> delegate, <any more delegates>) throws <any>;\n    <any access modifier> R fromJson(T value) throws <any>;\n");
                    }
                    Set setF4 = bq.e.f(parameterAnnotations2[i5]);
                    Annotation[] annotationArr2 = parameterAnnotations2[i5];
                    int length5 = annotationArr2.length;
                    int i17 = i5;
                    while (true) {
                        if (i17 >= length5) {
                            z11 = i5;
                            break;
                        } else {
                            if (annotationArr2[i17].annotationType().getSimpleName().equals(obj)) {
                                z11 = 1;
                                break;
                            }
                            i17++;
                        }
                    }
                    cVar = new c(genericReturnType2, setF3, aiInsightScoreAdapter, method, genericParameterTypes2.length, z11, genericParameterTypes2, genericReturnType2, setF4, setF3, 1);
                    dVarB = e.b(arrayList2, cVar.f15432a, cVar.f15433b);
                    if (dVarB == null) {
                    }
                } else {
                    methodArr = declaredMethods;
                    i11 = length;
                }
                i12++;
                cls4 = cls;
                superclass = cls2;
                declaredMethods = methodArr;
                length = i11;
            }
            superclass = superclass.getSuperclass();
        }
        Class<AiInsightScoreAdapter> cls6 = cls4;
        if (arrayList.isEmpty() && arrayList2.isEmpty()) {
            throw new IllegalArgumentException("Expected at least one @ToJson or @FromJson method on ".concat(cls6.getName()));
        }
        b(new e(arrayList, arrayList2));
    }

    public void d(f fVar) {
        this.f15450a.add(fVar);
    }

    public void a(vu3 vu3Var) throws lu3 {
        int[] iArr = {524133589, 740889625, 408955079, 621796408, 24562149, 1207357565, 297783268, 1066077375, 937558955};
        int i5 = iArr[0];
        int i11 = iArr[1];
        int i12 = iArr[2];
        int i13 = iArr[3];
        int iC = k9.c((i11 & (~i5)) | i12, (i5 & i13) | iArr[4], iArr[5], iArr[6]) ^ (iArr[7] % iArr[8]);
        int i14 = this.f15451b;
        if (i14 >= iC) {
            throw new lu3();
        }
        ArrayList arrayList = this.f15450a;
        if (i14 == arrayList.size()) {
            arrayList.add(vu3Var);
        } else {
            arrayList.set(this.f15451b, vu3Var);
        }
        this.f15451b++;
    }

    public vu3 a() throws ku3 {
        int[] iArr = {91119157, 1459677288, 586253619, -183145911, -1567288443, 919325394, 146725508, 787086305, 459541652};
        int i5 = iArr[0];
        int i11 = iArr[1];
        int i12 = iArr[2];
        int i13 = iArr[3];
        int iC = k9.c((i11 & (~i5)) | i12, (i5 & i13) | iArr[4], iArr[5], iArr[6]) ^ (iArr[7] % iArr[8]);
        int i14 = this.f15451b;
        if (i14 <= 0) {
            throw new ku3();
        }
        ArrayList arrayList = this.f15450a;
        vu3 vu3Var = (vu3) arrayList.get(i14 + iC);
        arrayList.set(this.f15451b + iC, null);
        this.f15451b += iC;
        return vu3Var;
    }
}
