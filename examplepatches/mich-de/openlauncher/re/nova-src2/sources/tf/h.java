package tf;

import android.util.SparseArray;
import android.util.SparseBooleanArray;
import gf.y0;
import java.util.Map;

/* loaded from: classes3.dex */
public final class h extends u {
    public static final /* synthetic */ int P = 0;
    public final boolean A;
    public final boolean B;
    public final boolean C;
    public final boolean D;
    public final boolean E;
    public final boolean F;
    public final boolean G;
    public final boolean H;
    public final boolean I;
    public final boolean J;
    public final boolean K;
    public final boolean L;
    public final boolean M;
    public final SparseArray N;
    public final SparseBooleanArray O;

    static {
        new h(new g());
    }

    public h(g gVar) {
        super(gVar);
        this.A = gVar.A;
        this.B = gVar.B;
        this.C = gVar.C;
        this.D = gVar.D;
        this.E = gVar.E;
        this.F = gVar.F;
        this.G = gVar.G;
        this.H = gVar.H;
        this.I = gVar.I;
        this.J = gVar.J;
        this.K = gVar.K;
        this.L = gVar.L;
        this.M = gVar.M;
        this.N = gVar.N;
        this.O = gVar.O;
    }

    @Override // tf.u
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && h.class == obj.getClass()) {
            h hVar = (h) obj;
            if (super.equals(hVar) && this.A == hVar.A && this.B == hVar.B && this.C == hVar.C && this.D == hVar.D && this.E == hVar.E && this.F == hVar.F && this.G == hVar.G && this.H == hVar.H && this.I == hVar.I && this.J == hVar.J && this.K == hVar.K && this.L == hVar.L && this.M == hVar.M) {
                SparseBooleanArray sparseBooleanArray = hVar.O;
                SparseBooleanArray sparseBooleanArray2 = this.O;
                int size = sparseBooleanArray2.size();
                if (sparseBooleanArray.size() == size) {
                    int i5 = 0;
                    while (true) {
                        if (i5 >= size) {
                            SparseArray sparseArray = hVar.N;
                            SparseArray sparseArray2 = this.N;
                            int size2 = sparseArray2.size();
                            if (sparseArray.size() == size2) {
                                for (int i11 = 0; i11 < size2; i11++) {
                                    int iIndexOfKey = sparseArray.indexOfKey(sparseArray2.keyAt(i11));
                                    if (iIndexOfKey >= 0) {
                                        Map map = (Map) sparseArray2.valueAt(i11);
                                        Map map2 = (Map) sparseArray.valueAt(iIndexOfKey);
                                        if (map2.size() == map.size()) {
                                            for (Map.Entry entry : map.entrySet()) {
                                                y0 y0Var = (y0) entry.getKey();
                                                if (!map2.containsKey(y0Var) || !wf.v.a(entry.getValue(), map2.get(y0Var))) {
                                                }
                                            }
                                        }
                                    }
                                }
                                return true;
                            }
                        } else {
                            if (sparseBooleanArray.indexOfKey(sparseBooleanArray2.keyAt(i5)) < 0) {
                                break;
                            }
                            i5++;
                        }
                    }
                }
            }
        }
        return false;
    }

    @Override // tf.u
    public final int hashCode() {
        return ((((((((((((((((((((((((((super.hashCode() + 31) * 31) + (this.A ? 1 : 0)) * 31) + (this.B ? 1 : 0)) * 31) + (this.C ? 1 : 0)) * 31) + (this.D ? 1 : 0)) * 31) + (this.E ? 1 : 0)) * 31) + (this.F ? 1 : 0)) * 31) + (this.G ? 1 : 0)) * 31) + (this.H ? 1 : 0)) * 31) + (this.I ? 1 : 0)) * 31) + (this.J ? 1 : 0)) * 31) + (this.K ? 1 : 0)) * 31) + (this.L ? 1 : 0)) * 31) + (this.M ? 1 : 0);
    }
}
