package defpackage;

import android.graphics.Bitmap;
import android.graphics.Rect;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bc7 {
    public HashMap c;
    public HashMap d;
    public float e;
    public HashMap f;
    public ArrayList g;
    public xkc h;
    public ab7 i;
    public ArrayList j;
    public Rect k;
    public float l;
    public float m;
    public float n;
    public boolean o;
    public final tz7 a = new tz7(21);
    public final HashSet b = new HashSet();
    public int p = 0;

    public final void a(String str) {
        h87.a(str);
        this.b.add(str);
    }

    public final float b() {
        return (long) (((this.m - this.l) / this.n) * 1000.0f);
    }

    public final Map c() {
        float fC = gpe.c();
        if (fC != this.e) {
            for (Map.Entry entry : this.d.entrySet()) {
                HashMap map = this.d;
                String str = (String) entry.getKey();
                tc7 tc7Var = (tc7) entry.getValue();
                float f = this.e / fC;
                int i = (int) (tc7Var.a * f);
                int i2 = (int) (tc7Var.b * f);
                tc7 tc7Var2 = new tc7(i, i2, tc7Var.c, tc7Var.d, tc7Var.e);
                Bitmap bitmap = tc7Var.f;
                if (bitmap != null) {
                    tc7Var2.f = Bitmap.createScaledBitmap(bitmap, i, i2, true);
                }
                map.put(str, tc7Var2);
            }
        }
        this.e = fC;
        return this.d;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("LottieComposition:\n");
        Iterator it2 = this.j.iterator();
        while (it2.hasNext()) {
            sb.append(((wo6) it2.next()).a("\t"));
        }
        return sb.toString();
    }
}
