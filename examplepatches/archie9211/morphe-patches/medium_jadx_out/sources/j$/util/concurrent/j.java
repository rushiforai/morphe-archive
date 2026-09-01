package j$.util.concurrent;

import com.drew.metadata.exif.makernotes.FujifilmMakernoteDirectory;
import j$.util.Spliterator;
import java.util.Comparator;
import java.util.function.Consumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class j extends p implements Spliterator {
    public final /* synthetic */ int i;
    public long j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ j(l[] lVarArr, int i, int i2, int i3, long j, int i4) {
        super(lVarArr, i, i2, i3);
        this.i = i4;
        this.j = j;
    }

    @Override // j$.util.Spliterator
    public final int characteristics() {
        switch (this.i) {
            case 0:
                return FujifilmMakernoteDirectory.TAG_SEQUENCE_NUMBER;
            default:
                return FujifilmMakernoteDirectory.TAG_AUTO_BRACKETING;
        }
    }

    @Override // j$.util.Spliterator
    public final long estimateSize() {
        switch (this.i) {
        }
        return this.j;
    }

    @Override // j$.util.Spliterator
    public final void forEachRemaining(Consumer consumer) {
        switch (this.i) {
            case 0:
                consumer.getClass();
                while (true) {
                    l lVarA = a();
                    if (lVarA != null) {
                        consumer.n(lVarA.b);
                    }
                    break;
                }
                break;
            default:
                consumer.getClass();
                while (true) {
                    l lVarA2 = a();
                    if (lVarA2 != null) {
                        consumer.n(lVarA2.c);
                    }
                    break;
                }
                break;
        }
    }

    @Override // j$.util.Spliterator
    public final Comparator getComparator() {
        switch (this.i) {
            case 0:
                throw new IllegalStateException();
            default:
                throw new IllegalStateException();
        }
    }

    @Override // j$.util.Spliterator
    public final /* synthetic */ long getExactSizeIfKnown() {
        switch (this.i) {
        }
        return j$.time.a.q(this);
    }

    @Override // j$.util.Spliterator
    public final /* synthetic */ boolean hasCharacteristics(int i) {
        switch (this.i) {
        }
        return j$.time.a.s(this, i);
    }

    @Override // j$.util.Spliterator
    public final boolean tryAdvance(Consumer consumer) {
        switch (this.i) {
            case 0:
                consumer.getClass();
                l lVarA = a();
                if (lVarA != null) {
                    consumer.n(lVarA.b);
                }
                break;
            default:
                consumer.getClass();
                l lVarA2 = a();
                if (lVarA2 != null) {
                    consumer.n(lVarA2.c);
                }
                break;
        }
        return true;
    }

    @Override // j$.util.Spliterator
    public final Spliterator trySplit() {
        switch (this.i) {
            case 0:
                int i = this.f;
                int i2 = this.g;
                int i3 = (i + i2) >>> 1;
                if (i3 <= i) {
                    return null;
                }
                l[] lVarArr = this.a;
                this.g = i3;
                long j = this.j >>> 1;
                this.j = j;
                return new j(lVarArr, this.h, i3, i2, j, 0);
            default:
                int i4 = this.f;
                int i5 = this.g;
                int i6 = (i4 + i5) >>> 1;
                if (i6 <= i4) {
                    return null;
                }
                l[] lVarArr2 = this.a;
                this.g = i6;
                long j2 = this.j >>> 1;
                this.j = j2;
                return new j(lVarArr2, this.h, i6, i5, j2, 1);
        }
    }
}
