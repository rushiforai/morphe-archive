package defpackage;

import android.content.Context;
import j$.util.DesugarCollections;
import j$.util.Objects;
import java.util.ArrayList;
import java.util.concurrent.Callable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class oz4 implements Callable {
    public final /* synthetic */ int a;
    public final /* synthetic */ String b;
    public final /* synthetic */ Context c;
    public final /* synthetic */ int d;
    public final /* synthetic */ Object e;

    public /* synthetic */ oz4(String str, Context context, Object obj, int i, int i2) {
        this.a = i2;
        this.b = str;
        this.c = context;
        this.e = obj;
        this.d = i;
    }

    @Override // java.util.concurrent.Callable
    public final Object call() {
        int i = this.a;
        int i2 = this.d;
        Object obj = this.e;
        Context context = this.c;
        String str = this.b;
        switch (i) {
            case 0:
                Object[] objArr = {(lz4) obj};
                ArrayList arrayList = new ArrayList(1);
                Object obj2 = objArr[0];
                Objects.requireNonNull(obj2);
                arrayList.add(obj2);
                return rz4.b(str, context, DesugarCollections.unmodifiableList(arrayList), i2);
            default:
                try {
                    return rz4.b(str, context, (ArrayList) obj, i2);
                } catch (Throwable unused) {
                    return new qz4(-3);
                }
        }
    }
}
