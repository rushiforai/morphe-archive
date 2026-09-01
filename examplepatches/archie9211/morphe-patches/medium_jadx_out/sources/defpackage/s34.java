package defpackage;

import android.content.Context;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s34 implements g8a {
    public final /* synthetic */ int a;
    public final g8a b;

    public /* synthetic */ s34(g8a g8aVar, int i) {
        this.a = i;
        this.b = g8aVar;
    }

    @Override // defpackage.g8a
    public final Object get() {
        int i = this.a;
        g8a g8aVar = this.b;
        switch (i) {
            case 0:
                String packageName = ((Context) g8aVar.get()).getPackageName();
                if (packageName != null) {
                    return packageName;
                }
                z72.c("Cannot return null from a non-@Nullable @Provides method");
                return null;
            default:
                return new erb(Integer.valueOf(erb.d).intValue(), (Context) g8aVar.get(), "com.google.android.datatransport.events");
        }
    }
}
