package defpackage;

import j$.lang.Iterable$CC;
import j$.util.Collection;
import j$.util.List;
import j$.util.Spliterator;
import j$.util.stream.Stream;
import java.lang.reflect.Array;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Iterator;
import java.util.RandomAccess;
import java.util.Spliterator;
import java.util.function.Consumer;
import java.util.function.IntFunction;
import java.util.function.Predicate;
import java.util.function.UnaryOperator;
import java.util.stream.Stream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class wgc extends AbstractList implements RandomAccess, List {
    public int a;
    public Object b;

    public static /* synthetic */ void d(int i) {
        String str = (i == 2 || i == 3 || i == 5 || i == 6 || i == 7) ? "@NotNull method %s.%s must not return null" : "Argument for @NotNull parameter '%s' of %s.%s must not be null";
        Object[] objArr = new Object[(i == 2 || i == 3 || i == 5 || i == 6 || i == 7) ? 2 : 3];
        switch (i) {
            case 2:
            case 3:
            case 5:
            case 6:
            case 7:
                objArr[0] = "kotlin/reflect/jvm/internal/impl/utils/SmartList";
                break;
            case 4:
                objArr[0] = "a";
                break;
            default:
                objArr[0] = "elements";
                break;
        }
        if (i == 2 || i == 3) {
            objArr[1] = "iterator";
        } else if (i == 5 || i == 6 || i == 7) {
            objArr[1] = "toArray";
        } else {
            objArr[1] = "kotlin/reflect/jvm/internal/impl/utils/SmartList";
        }
        switch (i) {
            case 2:
            case 3:
            case 5:
            case 6:
            case 7:
                break;
            case 4:
                objArr[2] = "toArray";
                break;
            default:
                objArr[2] = "<init>";
                break;
        }
        String str2 = String.format(str, objArr);
        if (i != 2 && i != 3 && i != 5 && i != 6 && i != 7) {
            throw new IllegalArgumentException(str2);
        }
        throw new IllegalStateException(str2);
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i, Object obj) {
        int i2;
        if (i < 0 || i > (i2 = this.a)) {
            ik4.e(this.a, ev6.C("Index: ", i, ", Size: "));
            return;
        }
        if (i2 == 0) {
            this.b = obj;
        } else if (i2 == 1 && i == 0) {
            this.b = new Object[]{obj, this.b};
        } else {
            Object[] objArr = new Object[i2 + 1];
            Object obj2 = this.b;
            if (i2 == 1) {
                objArr[0] = obj2;
            } else {
                Object[] objArr2 = (Object[]) obj2;
                System.arraycopy(objArr2, 0, objArr, 0, i);
                System.arraycopy(objArr2, i, objArr, i + 1, this.a - i);
            }
            objArr[i] = obj;
            this.b = objArr;
        }
        this.a++;
        ((AbstractList) this).modCount++;
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final void clear() {
        this.b = null;
        this.a = 0;
        ((AbstractList) this).modCount++;
    }

    @Override // java.lang.Iterable, j$.util.Collection
    public /* synthetic */ void forEach(Consumer consumer) {
        Iterable$CC.$default$forEach(this, consumer);
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i) {
        int i2;
        if (i < 0 || i >= (i2 = this.a)) {
            ik4.e(this.a, ev6.C("Index: ", i, ", Size: "));
            return null;
        }
        Object obj = this.b;
        return i2 == 1 ? obj : ((Object[]) obj)[i];
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.List
    public final Iterator iterator() {
        int i = this.a;
        if (i == 0) {
            return ugc.b;
        }
        if (i == 1) {
            return new vgc(this);
        }
        Iterator it2 = super.iterator();
        if (it2 != null) {
            return it2;
        }
        d(3);
        throw null;
    }

    @Override // java.util.Collection
    public /* synthetic */ Stream parallelStream() {
        return Stream.Wrapper.convert(parallelStream());
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object remove(int i) {
        int i2;
        if (i < 0 || i >= (i2 = this.a)) {
            ik4.e(this.a, ev6.C("Index: ", i, ", Size: "));
            return null;
        }
        Object obj = this.b;
        if (i2 == 1) {
            this.b = null;
        } else {
            Object[] objArr = (Object[]) obj;
            Object obj2 = objArr[i];
            if (i2 == 2) {
                this.b = objArr[1 - i];
            } else {
                int i3 = (i2 - i) - 1;
                if (i3 > 0) {
                    System.arraycopy(objArr, i + 1, objArr, i, i3);
                }
                i2 = this.a;
                objArr[i2 - 1] = null;
            }
            obj = obj2;
        }
        this.a = i2 - 1;
        ((AbstractList) this).modCount++;
        return obj;
    }

    @Override // java.util.Collection, j$.util.Collection
    public /* synthetic */ boolean removeIf(Predicate predicate) {
        return Collection.CC.$default$removeIf(this, predicate);
    }

    @Override // java.util.List, j$.util.List
    public /* synthetic */ void replaceAll(UnaryOperator unaryOperator) {
        List.CC.$default$replaceAll(this, unaryOperator);
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i, Object obj) {
        int i2;
        if (i < 0 || i >= (i2 = this.a)) {
            ik4.e(this.a, ev6.C("Index: ", i, ", Size: "));
            return null;
        }
        Object obj2 = this.b;
        if (i2 == 1) {
            this.b = obj;
            return obj2;
        }
        Object[] objArr = (Object[]) obj2;
        Object obj3 = objArr[i];
        objArr[i] = obj;
        return obj3;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.a;
    }

    @Override // java.util.List, j$.util.List
    public final void sort(Comparator comparator) {
        int i = this.a;
        if (i >= 2) {
            Arrays.sort((Object[]) this.b, 0, i, comparator);
        }
    }

    @Override // java.util.Collection, java.lang.Iterable, java.util.List
    public /* synthetic */ Spliterator spliterator() {
        return Spliterator.Wrapper.convert(spliterator());
    }

    @Override // java.util.Collection
    public /* synthetic */ java.util.stream.Stream stream() {
        return Stream.Wrapper.convert(stream());
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final Object[] toArray(Object[] objArr) {
        if (objArr == null) {
            d(4);
            throw null;
        }
        int length = objArr.length;
        int i = this.a;
        if (i == 1) {
            if (length == 0) {
                Object[] objArr2 = (Object[]) Array.newInstance(objArr.getClass().getComponentType(), 1);
                objArr2[0] = this.b;
                return objArr2;
            }
            objArr[0] = this.b;
        } else {
            if (length < i) {
                Object[] objArrCopyOf = Arrays.copyOf((Object[]) this.b, i, objArr.getClass());
                if (objArrCopyOf != null) {
                    return objArrCopyOf;
                }
                d(6);
                throw null;
            }
            if (i != 0) {
                System.arraycopy(this.b, 0, objArr, 0, i);
            }
        }
        int i2 = this.a;
        if (length > i2) {
            objArr[i2] = null;
        }
        return objArr;
    }

    @Override // java.util.Collection, j$.util.Collection
    public /* synthetic */ j$.util.stream.Stream parallelStream() {
        return Collection.CC.$default$parallelStream(this);
    }

    @Override // java.util.Collection, java.lang.Iterable, java.util.List, j$.util.List, j$.util.Collection
    public /* synthetic */ j$.util.Spliterator spliterator() {
        return List.CC.$default$spliterator(this);
    }

    @Override // java.util.Collection, j$.util.Collection
    public /* synthetic */ j$.util.stream.Stream stream() {
        return Collection.CC.$default$stream(this);
    }

    @Override // java.util.Collection, j$.util.Collection
    public /* synthetic */ Object[] toArray(IntFunction intFunction) {
        return toArray((Object[]) intFunction.apply(0));
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        int i = this.a;
        if (i == 0) {
            this.b = obj;
        } else {
            Object obj2 = this.b;
            if (i == 1) {
                this.b = new Object[]{obj2, obj};
            } else {
                Object[] objArr = (Object[]) obj2;
                int length = objArr.length;
                if (i >= length) {
                    int i2 = ((length * 3) / 2) + 1;
                    int i3 = i + 1;
                    if (i2 < i3) {
                        i2 = i3;
                    }
                    Object[] objArr2 = new Object[i2];
                    this.b = objArr2;
                    System.arraycopy(objArr, 0, objArr2, 0, length);
                    objArr = objArr2;
                }
                i = this.a;
                objArr[i] = obj;
            }
        }
        this.a = i + 1;
        ((AbstractList) this).modCount++;
        return true;
    }
}
