package androidx.datastore.preferences.protobuf;

import com.google.android.gms.internal.consent_sdk.n5;
import com.google.android.gms.internal.play_billing.l2;
import java.util.Iterator;
import java.util.NoSuchElementException;

/* loaded from: classes2.dex */
public final class e implements Iterator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f14308a = 0;

    /* renamed from: b, reason: collision with root package name */
    public int f14309b = 0;

    /* renamed from: c, reason: collision with root package name */
    public final int f14310c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f14311d;

    public e(n5 n5Var) {
        this.f14311d = n5Var;
        this.f14310c = n5Var.e();
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        switch (this.f14308a) {
            case 0:
                if (this.f14309b < this.f14310c) {
                }
                break;
            case 1:
                if (this.f14309b < this.f14310c) {
                }
                break;
            case 2:
                if (this.f14309b < this.f14310c) {
                }
                break;
            case 3:
                if (this.f14309b < this.f14310c) {
                }
                break;
            case 4:
                if (this.f14309b < this.f14310c) {
                }
                break;
            case 5:
                if (this.f14309b < this.f14310c) {
                }
                break;
            default:
                if (this.f14309b < this.f14310c) {
                }
                break;
        }
        return false;
    }

    @Override // java.util.Iterator
    public final Object next() {
        switch (this.f14308a) {
            case 0:
                return Byte.valueOf(nextByte());
            case 1:
                int i5 = this.f14309b;
                if (i5 >= this.f14310c) {
                    throw new NoSuchElementException();
                }
                this.f14309b = i5 + 1;
                return Byte.valueOf(((n5) this.f14311d).d(i5));
            case 2:
                int i11 = this.f14309b;
                if (i11 >= this.f14310c) {
                    throw new NoSuchElementException();
                }
                this.f14309b = i11 + 1;
                return Byte.valueOf(((com.google.android.gms.internal.measurement.v0) this.f14311d).c(i11));
            case 3:
                int i12 = this.f14309b;
                if (i12 >= this.f14310c) {
                    throw new NoSuchElementException();
                }
                this.f14309b = i12 + 1;
                return Byte.valueOf(((l2) this.f14311d).d(i12));
            case 4:
                return Byte.valueOf(nextByte());
            case 5:
                return Byte.valueOf(nextByte());
            default:
                int i13 = this.f14309b;
                if (i13 >= this.f14310c) {
                    throw new NoSuchElementException();
                }
                this.f14309b = i13 + 1;
                return Byte.valueOf(((mh.k0) this.f14311d).d(i13));
        }
    }

    public byte nextByte() {
        switch (this.f14308a) {
            case 0:
                int i5 = this.f14309b;
                if (i5 >= this.f14310c) {
                    throw new NoSuchElementException();
                }
                this.f14309b = i5 + 1;
                return ((h) this.f14311d).h(i5);
            case 4:
                int i11 = this.f14309b;
                if (i11 >= this.f14310c) {
                    throw new NoSuchElementException();
                }
                this.f14309b = i11 + 1;
                return ((com.google.crypto.tink.shaded.protobuf.i) this.f14311d).g(i11);
            default:
                int i12 = this.f14309b;
                if (i12 >= this.f14310c) {
                    throw new NoSuchElementException();
                }
                this.f14309b = i12 + 1;
                return ((com.google.protobuf.l) this.f14311d).g(i12);
        }
    }

    @Override // java.util.Iterator
    public final void remove() {
        switch (this.f14308a) {
            case 0:
                throw new UnsupportedOperationException();
            case 1:
                throw new UnsupportedOperationException();
            case 2:
                throw new UnsupportedOperationException();
            case 3:
                throw new UnsupportedOperationException();
            case 4:
                throw new UnsupportedOperationException();
            case 5:
                throw new UnsupportedOperationException();
            default:
                throw new UnsupportedOperationException();
        }
    }

    public e(com.google.android.gms.internal.measurement.v0 v0Var) {
        this.f14311d = v0Var;
        this.f14310c = v0Var.d();
    }

    public e(l2 l2Var) {
        this.f14311d = l2Var;
        this.f14310c = l2Var.f();
    }

    public e(mh.k0 k0Var) {
        this.f14311d = k0Var;
        this.f14310c = k0Var.f();
    }

    public e(h hVar) {
        this.f14311d = hVar;
        this.f14310c = hVar.size();
    }

    public e(com.google.crypto.tink.shaded.protobuf.i iVar) {
        this.f14311d = iVar;
        this.f14310c = iVar.size();
    }

    public e(com.google.protobuf.l lVar) {
        this.f14311d = lVar;
        this.f14310c = lVar.size();
    }
}
