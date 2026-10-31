package y1;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import x7.u;
import z.o0;
import z.z0;

/* loaded from: classes.dex */
public final class f implements e {

    /* renamed from: a, reason: collision with root package name */
    public final Function1 f96567a;

    /* renamed from: b, reason: collision with root package name */
    public final o0 f96568b;

    /* renamed from: c, reason: collision with root package name */
    public o0 f96569c;

    public f(Map map, Function1 function1) {
        o0 o0Var;
        this.f96567a = function1;
        if (map == null || map.isEmpty()) {
            o0Var = null;
        } else {
            o0Var = new o0(map.size());
            for (Map.Entry entry : map.entrySet()) {
                o0Var.m(entry.getKey(), entry.getValue());
            }
        }
        this.f96568b = o0Var;
    }

    @Override // y1.e
    public final u a(String str, Function0 function0) {
        int length = str.length();
        for (int i5 = 0; i5 < length; i5++) {
            if (!kotlin.text.a.b(str.charAt(i5))) {
                o0 o0Var = this.f96569c;
                if (o0Var == null) {
                    long[] jArr = z0.f97875a;
                    o0Var = new o0();
                    this.f96569c = o0Var;
                }
                Object objD = o0Var.d(str);
                if (objD == null) {
                    objD = new ArrayList();
                    o0Var.m(str, objD);
                }
                ((List) objD).add(function0);
                return new u(o0Var, str, function0);
            }
        }
        throw new IllegalArgumentException("Registered key is empty or blank");
    }

    @Override // y1.e
    public final boolean c(Object obj) {
        return ((Boolean) this.f96567a.invoke(obj)).booleanValue();
    }

    /* JADX WARN: Removed duplicated region for block: B:36:0x008e  */
    @Override // y1.e
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Map d() {
        char c11;
        long j11;
        long j12;
        long j13;
        long[] jArr;
        int i5;
        long[] jArr2;
        int i11;
        char c12;
        long j14;
        o0 o0Var = this.f96568b;
        if (o0Var == null && this.f96569c == null) {
            return b70.h.f17594a;
        }
        int i12 = 0;
        int i13 = o0Var != null ? o0Var.f97870e : 0;
        o0 o0Var2 = this.f96569c;
        HashMap map = new HashMap(i13 + (o0Var2 != null ? o0Var2.f97870e : 0));
        char c13 = 7;
        long j15 = -9187201950435737472L;
        int i14 = 8;
        if (o0Var != null) {
            Object[] objArr = o0Var.f97867b;
            Object[] objArr2 = o0Var.f97868c;
            long[] jArr3 = o0Var.f97866a;
            int length = jArr3.length - 2;
            if (length >= 0) {
                int i15 = 0;
                j12 = 128;
                while (true) {
                    long j16 = jArr3[i15];
                    j13 = 255;
                    if ((((~j16) << c13) & j16 & j15) != j15) {
                        int i16 = 8 - ((~(i15 - length)) >>> 31);
                        int i17 = 0;
                        while (i17 < i16) {
                            if ((j16 & 255) < 128) {
                                int i18 = (i15 << 3) + i17;
                                c12 = c13;
                                j14 = j15;
                                map.put((String) objArr[i18], (List) objArr2[i18]);
                            } else {
                                c12 = c13;
                                j14 = j15;
                            }
                            j16 >>= 8;
                            i17++;
                            c13 = c12;
                            j15 = j14;
                        }
                        c11 = c13;
                        j11 = j15;
                        if (i16 != 8) {
                            break;
                        }
                    } else {
                        c11 = c13;
                        j11 = j15;
                    }
                    if (i15 == length) {
                        break;
                    }
                    i15++;
                    c13 = c11;
                    j15 = j11;
                }
            } else {
                c11 = 7;
                j11 = -9187201950435737472L;
                j12 = 128;
                j13 = 255;
            }
        }
        o0 o0Var3 = this.f96569c;
        if (o0Var3 != null) {
            Object[] objArr3 = o0Var3.f97867b;
            Object[] objArr4 = o0Var3.f97868c;
            long[] jArr4 = o0Var3.f97866a;
            int length2 = jArr4.length - 2;
            if (length2 >= 0) {
                int i19 = 0;
                while (true) {
                    long j17 = jArr4[i19];
                    if ((((~j17) << c11) & j17 & j11) != j11) {
                        int i21 = 8 - ((~(i19 - length2)) >>> 31);
                        int i22 = i12;
                        while (i22 < i21) {
                            if ((j17 & j13) < j12) {
                                int i23 = (i19 << 3) + i22;
                                Object obj = objArr3[i23];
                                List list = (List) objArr4[i23];
                                String str = (String) obj;
                                i11 = i14;
                                if (list.size() == 1) {
                                    Object objInvoke = ((Function0) list.get(i12)).invoke();
                                    if (objInvoke != null) {
                                        if (!c(objInvoke)) {
                                            throw new IllegalStateException(j.a(objInvoke).toString());
                                        }
                                        map.put(str, ul.b.h(objInvoke));
                                    }
                                    jArr2 = jArr4;
                                } else {
                                    int size = list.size();
                                    ArrayList arrayList = new ArrayList(size);
                                    while (i12 < size) {
                                        long[] jArr5 = jArr4;
                                        Object objInvoke2 = ((Function0) list.get(i12)).invoke();
                                        if (objInvoke2 != null && !c(objInvoke2)) {
                                            throw new IllegalStateException(j.a(objInvoke2).toString());
                                        }
                                        arrayList.add(objInvoke2);
                                        i12++;
                                        jArr4 = jArr5;
                                    }
                                    jArr2 = jArr4;
                                    map.put(str, arrayList);
                                }
                            } else {
                                jArr2 = jArr4;
                                i11 = i14;
                            }
                            j17 >>= i11;
                            i22++;
                            i14 = i11;
                            jArr4 = jArr2;
                            i12 = 0;
                        }
                        jArr = jArr4;
                        i5 = i14;
                        if (i21 != i5) {
                            break;
                        }
                    } else {
                        jArr = jArr4;
                        i5 = i14;
                    }
                    if (i19 == length2) {
                        break;
                    }
                    i19++;
                    i14 = i5;
                    jArr4 = jArr;
                    i12 = 0;
                }
            }
        }
        return map;
    }

    @Override // y1.e
    public final Object e(String str) {
        o0 o0Var = this.f96568b;
        List list = o0Var != null ? (List) o0Var.k(str) : null;
        List list2 = list;
        if (list2 == null || list2.isEmpty()) {
            return null;
        }
        if (list.size() > 1 && o0Var != null) {
            List listSubList = list.subList(1, list.size());
            int i5 = o0Var.i(str);
            if (i5 < 0) {
                i5 = ~i5;
            }
            Object[] objArr = o0Var.f97868c;
            Object obj = objArr[i5];
            o0Var.f97867b[i5] = str;
            objArr[i5] = listSubList;
        }
        return list.get(0);
    }
}
