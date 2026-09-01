package defpackage;

import android.graphics.Matrix;
import android.graphics.Path;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j4c {
    public float a;
    public float b;
    public float c;
    public float d;
    public float e;
    public final ArrayList f = new ArrayList();
    public final ArrayList g = new ArrayList();

    public j4c() {
        d(0.0f, 270.0f, 0.0f);
    }

    public final void a(float f) {
        float f2 = this.d;
        if (f2 == f) {
            return;
        }
        float f3 = ((f - f2) + 360.0f) % 360.0f;
        if (f3 > 180.0f) {
            return;
        }
        float f4 = this.b;
        float f5 = this.c;
        f4c f4cVar = new f4c(f4, f5, f4, f5);
        f4cVar.f = this.d;
        f4cVar.g = f3;
        this.g.add(new d4c(f4cVar));
        this.d = f;
    }

    public final void b(Matrix matrix, Path path) {
        ArrayList arrayList = this.f;
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            ((h4c) arrayList.get(i)).a(matrix, path);
        }
    }

    public final void c(float f, float f2) {
        g4c g4cVar = new g4c();
        g4cVar.b = f;
        g4cVar.c = f2;
        this.f.add(g4cVar);
        e4c e4cVar = new e4c(g4cVar, this.b, this.c);
        float fB = e4cVar.b() + 270.0f;
        float fB2 = e4cVar.b() + 270.0f;
        a(fB);
        this.g.add(e4cVar);
        this.d = fB2;
        this.b = f;
        this.c = f2;
    }

    public final void d(float f, float f2, float f3) {
        this.a = f;
        this.b = 0.0f;
        this.c = f;
        this.d = f2;
        this.e = (f2 + f3) % 360.0f;
        this.f.clear();
        this.g.clear();
    }
}
