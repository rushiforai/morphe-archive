package rg;

import androidx.compose.ui.node.LayoutNode;
import java.util.Arrays;

/* loaded from: classes.dex */
public abstract class m {

    /* renamed from: a, reason: collision with root package name */
    public int f85892a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f85893b;

    /* renamed from: c, reason: collision with root package name */
    public Object[] f85894c;

    public m(int i5) {
        w20.e.e(i5, "initialCapacity");
        this.f85894c = new Object[i5];
        this.f85892a = 0;
    }

    public static cz.b b() {
        cz.b bVar = new cz.b();
        bVar.f48573a = true;
        bVar.f48574b = 0;
        return bVar;
    }

    public static int c(int i5, int i11) {
        if (i11 < 0) {
            throw new AssertionError("cannot store more than MAX_VALUE elements");
        }
        int iHighestOneBit = i5 + (i5 >> 1) + 1;
        if (iHighestOneBit < i11) {
            iHighestOneBit = Integer.highestOneBit(i11 - 1) << 1;
        }
        return iHighestOneBit < 0 ? LayoutNode.NotPlacedPlaceOrder : iHighestOneBit;
    }

    public void a(Object obj) {
        obj.getClass();
        d(this.f85892a + 1);
        Object[] objArr = this.f85894c;
        int i5 = this.f85892a;
        this.f85892a = i5 + 1;
        objArr[i5] = obj;
    }

    public void d(int i5) {
        Object[] objArr = this.f85894c;
        if (objArr.length < i5) {
            this.f85894c = Arrays.copyOf(objArr, c(objArr.length, i5));
            this.f85893b = false;
        } else if (this.f85893b) {
            this.f85894c = (Object[]) objArr.clone();
            this.f85893b = false;
        }
    }
}
