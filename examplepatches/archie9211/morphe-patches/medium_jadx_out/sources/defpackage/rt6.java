package defpackage;

import java.util.Comparator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rt6 implements Comparator {
    public final /* synthetic */ int a;
    public final /* synthetic */ xp b;

    public /* synthetic */ rt6(xp xpVar, int i) {
        this.a = i;
        this.b = xpVar;
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        int i = this.a;
        xp xpVar = this.b;
        switch (i) {
        }
        return pwd.D(Integer.valueOf(xpVar.s(((zt6) obj2).getKey())), Integer.valueOf(xpVar.s(((zt6) obj).getKey())));
    }
}
