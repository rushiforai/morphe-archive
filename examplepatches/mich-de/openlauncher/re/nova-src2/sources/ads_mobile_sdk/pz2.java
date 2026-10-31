package ads_mobile_sdk;

import androidx.compose.ui.node.LayoutNode;
import b.t8;
import java.nio.charset.StandardCharsets;
import java.util.ArrayDeque;
import java.util.Iterator;

/* loaded from: classes2.dex */
public final class pz2 extends sq {

    /* renamed from: i, reason: collision with root package name */
    public static final int[] f8427i = {1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765, 10946, 17711, 28657, 46368, 75025, 121393, 196418, 317811, 514229, 832040, 1346269, 2178309, 3524578, 5702887, 9227465, 14930352, 24157817, 39088169, 63245986, 102334155, 165580141, 267914296, 433494437, 701408733, 1134903170, 1836311903, LayoutNode.NotPlacedPlaceOrder};

    /* renamed from: d, reason: collision with root package name */
    public final int f8428d;

    /* renamed from: e, reason: collision with root package name */
    public final sq f8429e;

    /* renamed from: f, reason: collision with root package name */
    public final sq f8430f;

    /* renamed from: g, reason: collision with root package name */
    public final int f8431g;

    /* renamed from: h, reason: collision with root package name */
    public final int f8432h;

    public pz2(sq sqVar, sq sqVar2) {
        this.f8429e = sqVar;
        this.f8430f = sqVar2;
        int size = sqVar.size();
        this.f8431g = size;
        this.f8428d = sqVar2.size() + size;
        this.f8432h = Math.max(sqVar.a(), sqVar2.a()) + 1;
    }

    public static sq a(sq sqVar, sq sqVar2) {
        if (sqVar2.size() == 0) {
            return sqVar;
        }
        if (sqVar.size() == 0) {
            return sqVar2;
        }
        int size = sqVar2.size() + sqVar.size();
        qq qqVar = sq.f9634b;
        if (size < 128) {
            int size2 = sqVar.size();
            int size3 = sqVar2.size();
            int i5 = size2 + size3;
            byte[] bArr = new byte[i5];
            sq.a(0, size2, sqVar.size());
            sq.a(0, size2, i5);
            if (size2 > 0) {
                sqVar.a(0, 0, size2, bArr);
            }
            sq.a(0, size3, sqVar2.size());
            sq.a(size2, i5, i5);
            if (size3 > 0) {
                sqVar2.a(0, size2, size3, bArr);
            }
            if (i5 == 0) {
                return qqVar;
            }
            try {
                return new qq(bArr);
            } catch (yi1 e3) {
                throw new AssertionError("Expected no InvalidProtocolBufferException as data UTF8 validity is not checked.", e3);
            }
        }
        if (sqVar instanceof pz2) {
            pz2 pz2Var = (pz2) sqVar;
            sq sqVar3 = pz2Var.f8429e;
            sq sqVar4 = pz2Var.f8430f;
            if (sqVar2.size() + sqVar4.size() < 128) {
                int size4 = sqVar4.size();
                int size5 = sqVar2.size();
                int i11 = size4 + size5;
                byte[] bArr2 = new byte[i11];
                sq.a(0, size4, sqVar4.size());
                sq.a(0, size4, i11);
                if (size4 > 0) {
                    sqVar4.a(0, 0, size4, bArr2);
                }
                sq.a(0, size5, sqVar2.size());
                sq.a(size4, i11, i11);
                if (size5 > 0) {
                    sqVar2.a(0, size4, size5, bArr2);
                }
                if (i11 != 0) {
                    try {
                        qqVar = new qq(bArr2);
                    } catch (yi1 e11) {
                        throw new AssertionError("Expected no InvalidProtocolBufferException as data UTF8 validity is not checked.", e11);
                    }
                }
                return new pz2(sqVar3, qqVar);
            }
            if (sqVar3.a() > sqVar4.a() && pz2Var.f8432h > sqVar2.a()) {
                return new pz2(sqVar3, new pz2(sqVar4, sqVar2));
            }
        }
        if (size >= c(Math.max(sqVar.a(), sqVar2.a()) + 1)) {
            return new pz2(sqVar, sqVar2);
        }
        c7 c7Var = new c7(17, (byte) 0);
        c7Var.a(sqVar);
        c7Var.a(sqVar2);
        ArrayDeque arrayDeque = (ArrayDeque) c7Var.f1694a;
        sq pz2Var2 = (sq) arrayDeque.pop();
        while (!arrayDeque.isEmpty()) {
            pz2Var2 = new pz2((sq) arrayDeque.pop(), pz2Var2);
        }
        return pz2Var2;
    }

    public static int c(int i5) {
        return i5 >= 47 ? LayoutNode.NotPlacedPlaceOrder : f8427i[i5];
    }

    @Override // ads_mobile_sdk.sq
    public final boolean b(sq sqVar) {
        oz2 oz2Var = new oz2(this);
        t8 t8VarB = oz2Var.next();
        oz2 oz2Var2 = new oz2(sqVar);
        t8 t8VarB2 = oz2Var2.next();
        int i5 = 0;
        int i11 = 0;
        int i12 = 0;
        while (true) {
            int size = t8VarB.size() - i5;
            int size2 = t8VarB2.size() - i11;
            int iMin = Math.min(size, size2);
            if (!(i5 == 0 ? t8VarB.a(t8VarB2, i11, iMin) : t8VarB2.a(t8VarB, i5, iMin))) {
                return false;
            }
            i12 += iMin;
            int i13 = this.f8428d;
            if (i12 >= i13) {
                if (i12 == i13) {
                    return true;
                }
                throw new IllegalStateException();
            }
            if (iMin == size) {
                i5 = 0;
                t8VarB = oz2Var.next();
            } else {
                i5 += iMin;
                t8VarB = t8VarB;
            }
            if (iMin == size2) {
                t8VarB2 = oz2Var2.next();
                i11 = 0;
            } else {
                i11 += iMin;
            }
        }
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        return new mz2(this);
    }

    @Override // ads_mobile_sdk.sq
    public final int size() {
        return this.f8428d;
    }

    @Override // ads_mobile_sdk.sq
    public final byte b(int i5) {
        int i11 = this.f8431g;
        if (i5 < i11) {
            return this.f8429e.b(i5);
        }
        return this.f8430f.b(i5 - i11);
    }

    @Override // ads_mobile_sdk.sq
    public final boolean b() {
        return this.f8428d >= c(this.f8432h);
    }

    @Override // ads_mobile_sdk.sq
    public final int b(int i5, int i11, int i12) {
        int i13 = i11 + i12;
        sq sqVar = this.f8429e;
        int i14 = this.f8431g;
        if (i13 <= i14) {
            return sqVar.b(i5, i11, i12);
        }
        sq sqVar2 = this.f8430f;
        if (i11 >= i14) {
            return sqVar2.b(i5, i11 - i14, i12);
        }
        int i15 = i14 - i11;
        return sqVar2.b(sqVar.b(i5, i11, i15), 0, i12 - i15);
    }

    @Override // ads_mobile_sdk.sq
    public final sq b(int i5, int i11) {
        int i12 = this.f8428d;
        int iA = sq.a(i5, i11, i12);
        if (iA == 0) {
            return sq.f9634b;
        }
        if (iA == i12) {
            return this;
        }
        sq sqVar = this.f8429e;
        int i13 = this.f8431g;
        if (i11 <= i13) {
            return sqVar.a(i5, i11);
        }
        sq sqVar2 = this.f8430f;
        if (i5 >= i13) {
            return sqVar2.a(i5 - i13, i11 - i13);
        }
        return new pz2(sqVar.a(i5, sqVar.size()), sqVar2.a(0, i11 - i13));
    }

    @Override // ads_mobile_sdk.sq
    public final void a(int i5, int i11, int i12, byte[] bArr) {
        int i13 = i5 + i12;
        sq sqVar = this.f8429e;
        int i14 = this.f8431g;
        if (i13 <= i14) {
            sqVar.a(i5, i11, i12, bArr);
            return;
        }
        sq sqVar2 = this.f8430f;
        if (i5 >= i14) {
            sqVar2.a(i5 - i14, i11, i12, bArr);
            return;
        }
        int i15 = i14 - i5;
        sqVar.a(i5, i11, i15, bArr);
        sqVar2.a(0, i11 + i15, i12 - i15, bArr);
    }

    @Override // ads_mobile_sdk.sq
    public final int a() {
        return this.f8432h;
    }

    @Override // ads_mobile_sdk.sq
    public final sq a(int i5, int i11) {
        return b(i5, i11);
    }

    @Override // ads_mobile_sdk.sq
    public final void a(yu yuVar) {
        this.f8429e.a(yuVar);
        this.f8430f.a(yuVar);
    }

    @Override // ads_mobile_sdk.sq
    /* renamed from: a, reason: collision with other method in class */
    public final String mo3a() {
        return new String(c(), StandardCharsets.ISO_8859_1);
    }
}
