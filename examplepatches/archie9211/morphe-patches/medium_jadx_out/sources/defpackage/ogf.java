package defpackage;

import com.drew.metadata.mov.metadata.QuickTimeMetadataDirectory;
import j$.lang.Iterable$CC;
import j$.util.Collection;
import j$.util.Spliterator;
import j$.util.Spliterators;
import j$.util.stream.Stream;
import java.io.Serializable;
import java.util.AbstractCollection;
import java.util.Arrays;
import java.util.function.Consumer;
import java.util.function.IntFunction;
import java.util.function.Predicate;
import java.util.stream.Stream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class ogf extends AbstractCollection implements Serializable, Collection {
    public static final Object[] b = new Object[0];
    public static final Object[] c = new Object[0];
    public static final Object[] d = new Object[0];
    public static final Object[] e = new Object[0];
    public final /* synthetic */ int a;

    public /* synthetic */ ogf(int i) {
        this.a = i;
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final boolean add(Object obj) {
        switch (this.a) {
            case 0:
                throw new UnsupportedOperationException();
            case 1:
                throw new UnsupportedOperationException();
            case 2:
                throw new UnsupportedOperationException();
            default:
                throw new UnsupportedOperationException();
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final boolean addAll(java.util.Collection collection) {
        switch (this.a) {
            case 0:
                throw new UnsupportedOperationException();
            case 1:
                throw new UnsupportedOperationException();
            case 2:
                throw new UnsupportedOperationException();
            default:
                throw new UnsupportedOperationException();
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final void clear() {
        switch (this.a) {
            case 0:
                throw new UnsupportedOperationException();
            case 1:
                throw new UnsupportedOperationException();
            case 2:
                throw new UnsupportedOperationException();
            default:
                throw new UnsupportedOperationException();
        }
    }

    public abstract int d(Object[] objArr);

    public abstract int e();

    public abstract int f();

    @Override // java.lang.Iterable, j$.util.Collection
    public /* synthetic */ void forEach(Consumer consumer) {
        int i = this.a;
        Iterable$CC.$default$forEach(this, consumer);
    }

    public abstract Object[] m();

    public abstract int p();

    @Override // java.util.Collection
    public /* synthetic */ Stream parallelStream() {
        int i = this.a;
        return Stream.Wrapper.convert(parallelStream());
    }

    public int q(Object[] objArr) {
        ugf ugfVarV = v();
        int i = 0;
        while (ugfVarV.hasNext()) {
            objArr[i] = ugfVarV.next();
            i++;
        }
        return i;
    }

    public int r() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final boolean remove(Object obj) {
        switch (this.a) {
            case 0:
                throw new UnsupportedOperationException();
            case 1:
                throw new UnsupportedOperationException();
            case 2:
                throw new UnsupportedOperationException();
            default:
                throw new UnsupportedOperationException();
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final boolean removeAll(java.util.Collection collection) {
        switch (this.a) {
            case 0:
                throw new UnsupportedOperationException();
            case 1:
                throw new UnsupportedOperationException();
            case 2:
                throw new UnsupportedOperationException();
            default:
                throw new UnsupportedOperationException();
        }
    }

    @Override // java.util.Collection, j$.util.Collection
    public /* synthetic */ boolean removeIf(Predicate predicate) {
        int i = this.a;
        return Collection.CC.$default$removeIf(this, predicate);
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final boolean retainAll(java.util.Collection collection) {
        switch (this.a) {
            case 0:
                throw new UnsupportedOperationException();
            case 1:
                throw new UnsupportedOperationException();
            case 2:
                throw new UnsupportedOperationException();
            default:
                throw new UnsupportedOperationException();
        }
    }

    public Object[] s() {
        return null;
    }

    @Override // java.util.Collection, java.lang.Iterable, j$.util.Collection
    public final Spliterator spliterator() {
        switch (this.a) {
        }
        return Spliterators.spliterator(this, QuickTimeMetadataDirectory.TAG_SOFTWARE);
    }

    @Override // java.util.Collection
    public /* synthetic */ java.util.stream.Stream stream() {
        int i = this.a;
        return Stream.Wrapper.convert(stream());
    }

    public int t() {
        switch (this.a) {
            case 1:
                throw new UnsupportedOperationException();
            default:
                throw new UnsupportedOperationException();
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final Object[] toArray(Object[] objArr) {
        switch (this.a) {
            case 0:
                objArr.getClass();
                int size = size();
                int length = objArr.length;
                if (length < size) {
                    Object[] objArrM = m();
                    if (objArrM == null) {
                        if (length != 0) {
                            objArr = Arrays.copyOf(objArr, 0);
                        }
                        objArr = Arrays.copyOf(objArr, size);
                    }
                } else if (length > size) {
                    objArr[size] = null;
                }
                d(objArr);
                break;
            case 1:
                objArr.getClass();
                int size2 = size();
                int length2 = objArr.length;
                if (length2 < size2) {
                    Object[] objArrS = s();
                    if (objArrS == null) {
                        if (length2 != 0) {
                            objArr = Arrays.copyOf(objArr, 0);
                        }
                        objArr = Arrays.copyOf(objArr, size2);
                    }
                } else if (length2 > size2) {
                    objArr[size2] = null;
                }
                x(objArr);
                break;
            case 2:
                objArr.getClass();
                int size3 = size();
                if (objArr.length < size3) {
                    Object[] objArrW = w();
                    if (objArrW == null) {
                        if (objArr.length != 0) {
                            objArr = Arrays.copyOf(objArr, 0);
                        }
                        objArr = Arrays.copyOf(objArr, size3);
                    }
                } else if (objArr.length > size3) {
                    objArr[size3] = null;
                }
                q(objArr);
                break;
            default:
                objArr.getClass();
                int size4 = size();
                int length3 = objArr.length;
                if (length3 < size4) {
                    Object[] objArrW2 = w();
                    if (objArrW2 == null) {
                        if (length3 != 0) {
                            objArr = Arrays.copyOf(objArr, 0);
                        }
                        objArr = Arrays.copyOf(objArr, size4);
                    }
                } else if (length3 > size4) {
                    objArr[size4] = null;
                }
                q(objArr);
                break;
        }
        return objArr;
    }

    public int u() {
        throw new UnsupportedOperationException();
    }

    public abstract ugf v();

    public Object[] w() {
        return null;
    }

    public abstract int x(Object[] objArr);

    @Override // java.util.Collection, j$.util.Collection
    public /* synthetic */ j$.util.stream.Stream parallelStream() {
        int i = this.a;
        return Collection.CC.$default$parallelStream(this);
    }

    @Override // java.util.Collection, j$.util.Collection
    public /* synthetic */ j$.util.stream.Stream stream() {
        int i = this.a;
        return Collection.CC.$default$stream(this);
    }

    @Override // java.util.Collection, java.lang.Iterable
    public /* synthetic */ java.util.Spliterator spliterator() {
        int i = this.a;
        return Spliterator.Wrapper.convert(spliterator());
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final Object[] toArray() {
        switch (this.a) {
            case 0:
                return toArray(b);
            case 1:
                return toArray(c);
            case 2:
                return toArray(d);
            default:
                return toArray(e);
        }
    }

    @Override // java.util.Collection, j$.util.Collection
    public /* synthetic */ Object[] toArray(IntFunction intFunction) {
        int i = this.a;
        return toArray((Object[]) intFunction.apply(0));
    }
}
