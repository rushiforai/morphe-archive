package defpackage;

import com.google.gson.JsonSyntaxException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicIntegerArray;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class nud extends jud {
    @Override // defpackage.jud
    public final Object b(gd6 gd6Var) throws IOException {
        ArrayList arrayList = new ArrayList();
        gd6Var.f();
        while (gd6Var.hasNext()) {
            try {
                arrayList.add(Integer.valueOf(gd6Var.nextInt()));
            } catch (NumberFormatException e) {
                throw new JsonSyntaxException(e);
            }
        }
        gd6Var.D();
        int size = arrayList.size();
        AtomicIntegerArray atomicIntegerArray = new AtomicIntegerArray(size);
        for (int i = 0; i < size; i++) {
            atomicIntegerArray.set(i, ((Integer) arrayList.get(i)).intValue());
        }
        return atomicIntegerArray;
    }

    @Override // defpackage.jud
    public final void c(yd6 yd6Var, Object obj) throws IOException {
        yd6Var.m();
        int length = ((AtomicIntegerArray) obj).length();
        for (int i = 0; i < length; i++) {
            yd6Var.o0(r5.get(i));
        }
        yd6Var.D();
    }
}
