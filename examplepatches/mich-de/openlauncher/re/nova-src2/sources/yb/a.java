package yb;

import java.io.File;
import java.util.Comparator;
import u20.h;

/* loaded from: classes2.dex */
public final class a implements Comparator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f97226a;

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        switch (this.f97226a) {
            case 0:
                long jLastModified = ((File) obj2).lastModified() - ((File) obj).lastModified();
                if (jLastModified == 0) {
                    return 0;
                }
                return jLastModified < 0 ? -1 : 1;
            default:
                return ((h) obj).f90478c.toString().compareTo(((h) obj2).f90478c.toString());
        }
    }
}
