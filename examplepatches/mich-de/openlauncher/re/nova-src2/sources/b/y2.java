package b;

import ads_mobile_sdk.in2;
import ads_mobile_sdk.rb1;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.RandomAccess;

/* loaded from: classes.dex */
public abstract class y2 implements Cloneable {
    /* JADX WARN: Multi-variable type inference failed */
    public static void a(Iterable iterable, e9 e9Var) {
        rb1.a(iterable);
        if (iterable instanceof oc) {
            e9Var.addAll((Collection) iterable);
            return;
        }
        if (iterable instanceof Collection) {
            int size = ((Collection) iterable).size();
            if (e9Var instanceof ArrayList) {
                ((ArrayList) e9Var).ensureCapacity(e9Var.size() + size);
            } else if (e9Var instanceof in2) {
                in2 in2Var = (in2) e9Var;
                int i5 = in2Var.f4889c + size;
                Object[] objArr = in2Var.f4888b;
                if (i5 > objArr.length) {
                    if (objArr.length == 0) {
                        in2Var.f4888b = new Object[Math.max(i5, 10)];
                    } else {
                        int length = objArr.length;
                        while (length < i5) {
                            length = k9.a(length);
                        }
                        in2Var.f4888b = Arrays.copyOf(in2Var.f4888b, length);
                    }
                }
            }
        }
        int size2 = e9Var.size();
        if (!(iterable instanceof List) || !(iterable instanceof RandomAccess)) {
            for (Object obj : iterable) {
                if (obj == null) {
                    a(size2, e9Var);
                    throw null;
                }
                e9Var.add(obj);
            }
            return;
        }
        List list = (List) iterable;
        int size3 = list.size();
        for (int i11 = 0; i11 < size3; i11++) {
            Object obj2 = list.get(i11);
            if (obj2 == null) {
                a(size2, e9Var);
                throw null;
            }
            e9Var.add(obj2);
        }
    }

    public static void a(int i5, e9 e9Var) {
        String strI = c0.i(e9Var.size() - i5, "Element at index ", " is null.");
        for (int size = e9Var.size() - 1; size >= i5; size--) {
            e9Var.remove(size);
        }
        throw new NullPointerException(strI);
    }
}
