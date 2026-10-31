package kotlin.reflect.jvm.internal.impl.utils;

import a2.c;
import b.u4;
import java.lang.reflect.Array;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.RandomAccess;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
public class SmartList<E> extends AbstractList<E> implements RandomAccess {
    private Object myElem;
    private int mySize;

    public static class EmptyIterator<T> implements Iterator<T> {
        private static final EmptyIterator INSTANCE = new EmptyIterator();

        private EmptyIterator() {
        }

        public static <T> EmptyIterator<T> getInstance() {
            return INSTANCE;
        }

        @Override // java.util.Iterator
        public boolean hasNext() {
            return false;
        }

        @Override // java.util.Iterator
        public T next() {
            throw new NoSuchElementException();
        }

        @Override // java.util.Iterator
        public void remove() {
            throw new IllegalStateException();
        }
    }

    public class SingletonIterator extends SingletonIteratorBase<E> {
        private final int myInitialModCount;

        public SingletonIterator() {
            super();
            this.myInitialModCount = ((AbstractList) SmartList.this).modCount;
        }

        @Override // kotlin.reflect.jvm.internal.impl.utils.SmartList.SingletonIteratorBase
        public void checkCoModification() {
            if (((AbstractList) SmartList.this).modCount == this.myInitialModCount) {
                return;
            }
            throw new ConcurrentModificationException("ModCount: " + ((AbstractList) SmartList.this).modCount + "; expected: " + this.myInitialModCount);
        }

        @Override // kotlin.reflect.jvm.internal.impl.utils.SmartList.SingletonIteratorBase
        public E getElement() {
            return (E) SmartList.this.myElem;
        }

        @Override // java.util.Iterator
        public void remove() {
            checkCoModification();
            SmartList.this.clear();
        }
    }

    public static abstract class SingletonIteratorBase<T> implements Iterator<T> {
        private boolean myVisited;

        private SingletonIteratorBase() {
        }

        public abstract void checkCoModification();

        public abstract T getElement();

        @Override // java.util.Iterator
        public final boolean hasNext() {
            return !this.myVisited;
        }

        @Override // java.util.Iterator
        public final T next() {
            if (this.myVisited) {
                throw new NoSuchElementException();
            }
            this.myVisited = true;
            checkCoModification();
            return getElement();
        }
    }

    private static /* synthetic */ void $$$reportNull$$$0(int i5) {
        String str = (i5 == 2 || i5 == 3 || i5 == 5 || i5 == 6 || i5 == 7) ? "@NotNull method %s.%s must not return null" : "Argument for @NotNull parameter '%s' of %s.%s must not be null";
        Object[] objArr = new Object[(i5 == 2 || i5 == 3 || i5 == 5 || i5 == 6 || i5 == 7) ? 2 : 3];
        switch (i5) {
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
        if (i5 == 2 || i5 == 3) {
            objArr[1] = "iterator";
        } else if (i5 == 5 || i5 == 6 || i5 == 7) {
            objArr[1] = "toArray";
        } else {
            objArr[1] = "kotlin/reflect/jvm/internal/impl/utils/SmartList";
        }
        switch (i5) {
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
        if (i5 != 2 && i5 != 3 && i5 != 5 && i5 != 6 && i5 != 7) {
            throw new IllegalArgumentException(str2);
        }
        throw new IllegalStateException(str2);
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public boolean add(E e3) {
        int i5 = this.mySize;
        if (i5 == 0) {
            this.myElem = e3;
        } else if (i5 == 1) {
            this.myElem = new Object[]{this.myElem, e3};
        } else {
            Object[] objArr = (Object[]) this.myElem;
            int length = objArr.length;
            if (i5 >= length) {
                int iA = c.A(length, 3, 2, 1);
                int i11 = i5 + 1;
                if (iA < i11) {
                    iA = i11;
                }
                Object[] objArr2 = new Object[iA];
                this.myElem = objArr2;
                System.arraycopy(objArr, 0, objArr2, 0, length);
                objArr = objArr2;
            }
            objArr[this.mySize] = e3;
        }
        this.mySize++;
        ((AbstractList) this).modCount++;
        return true;
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public void clear() {
        this.myElem = null;
        this.mySize = 0;
        ((AbstractList) this).modCount++;
    }

    @Override // java.util.AbstractList, java.util.List
    public E get(int i5) {
        int i11;
        if (i5 >= 0 && i5 < (i11 = this.mySize)) {
            return i11 == 1 ? (E) this.myElem : (E) ((Object[]) this.myElem)[i5];
        }
        StringBuilder sbJ = u4.j(i5, "Index: ", ", Size: ");
        sbJ.append(this.mySize);
        throw new IndexOutOfBoundsException(sbJ.toString());
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.List
    @NotNull
    public Iterator<E> iterator() {
        int i5 = this.mySize;
        if (i5 == 0) {
            EmptyIterator emptyIterator = EmptyIterator.getInstance();
            if (emptyIterator == null) {
                $$$reportNull$$$0(2);
            }
            return emptyIterator;
        }
        if (i5 == 1) {
            return new SingletonIterator();
        }
        Iterator<E> it = super.iterator();
        if (it == null) {
            $$$reportNull$$$0(3);
        }
        return it;
    }

    @Override // java.util.AbstractList, java.util.List
    public E remove(int i5) {
        int i11;
        E e3;
        if (i5 < 0 || i5 >= (i11 = this.mySize)) {
            StringBuilder sbJ = u4.j(i5, "Index: ", ", Size: ");
            sbJ.append(this.mySize);
            throw new IndexOutOfBoundsException(sbJ.toString());
        }
        if (i11 == 1) {
            e3 = (E) this.myElem;
            this.myElem = null;
        } else {
            Object[] objArr = (Object[]) this.myElem;
            Object obj = objArr[i5];
            if (i11 == 2) {
                this.myElem = objArr[1 - i5];
            } else {
                int i12 = (i11 - i5) - 1;
                if (i12 > 0) {
                    System.arraycopy(objArr, i5 + 1, objArr, i5, i12);
                }
                objArr[this.mySize - 1] = null;
            }
            e3 = (E) obj;
        }
        this.mySize--;
        ((AbstractList) this).modCount++;
        return e3;
    }

    @Override // java.util.AbstractList, java.util.List
    public E set(int i5, E e3) {
        int i11;
        if (i5 < 0 || i5 >= (i11 = this.mySize)) {
            StringBuilder sbJ = u4.j(i5, "Index: ", ", Size: ");
            sbJ.append(this.mySize);
            throw new IndexOutOfBoundsException(sbJ.toString());
        }
        if (i11 == 1) {
            E e11 = (E) this.myElem;
            this.myElem = e3;
            return e11;
        }
        Object[] objArr = (Object[]) this.myElem;
        E e12 = (E) objArr[i5];
        objArr[i5] = e3;
        return e12;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public int size() {
        return this.mySize;
    }

    @Override // java.util.List
    public void sort(Comparator<? super E> comparator) {
        int i5 = this.mySize;
        if (i5 >= 2) {
            Arrays.sort((Object[]) this.myElem, 0, i5, comparator);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    @NotNull
    public <T> T[] toArray(@NotNull T[] tArr) {
        if (tArr == 0) {
            $$$reportNull$$$0(4);
        }
        int length = tArr.length;
        int i5 = this.mySize;
        if (i5 == 1) {
            if (length == 0) {
                T[] tArr2 = (T[]) ((Object[]) Array.newInstance(tArr.getClass().getComponentType(), 1));
                tArr2[0] = this.myElem;
                return tArr2;
            }
            tArr[0] = this.myElem;
        } else {
            if (length < i5) {
                T[] tArr3 = (T[]) Arrays.copyOf((Object[]) this.myElem, i5, tArr.getClass());
                if (tArr3 == null) {
                    $$$reportNull$$$0(6);
                }
                return tArr3;
            }
            if (i5 != 0) {
                System.arraycopy(this.myElem, 0, tArr, 0, i5);
            }
        }
        int i11 = this.mySize;
        if (length > i11) {
            tArr[i11] = 0;
        }
        return tArr;
    }

    @Override // java.util.AbstractList, java.util.List
    public void add(int i5, E e3) {
        int i11;
        if (i5 >= 0 && i5 <= (i11 = this.mySize)) {
            if (i11 == 0) {
                this.myElem = e3;
            } else if (i11 == 1 && i5 == 0) {
                this.myElem = new Object[]{e3, this.myElem};
            } else {
                Object[] objArr = new Object[i11 + 1];
                if (i11 == 1) {
                    objArr[0] = this.myElem;
                } else {
                    Object[] objArr2 = (Object[]) this.myElem;
                    System.arraycopy(objArr2, 0, objArr, 0, i5);
                    System.arraycopy(objArr2, i5, objArr, i5 + 1, this.mySize - i5);
                }
                objArr[i5] = e3;
                this.myElem = objArr;
            }
            this.mySize++;
            ((AbstractList) this).modCount++;
            return;
        }
        StringBuilder sbJ = u4.j(i5, "Index: ", ", Size: ");
        sbJ.append(this.mySize);
        throw new IndexOutOfBoundsException(sbJ.toString());
    }
}
