package ja0;

import java.util.AbstractList;

/* loaded from: classes.dex */
public abstract class l extends AbstractList {
    public abstract Object c(int i5);

    @Override // java.util.AbstractList, java.util.List
    public Object get(int i5) {
        if (i5 < 0 || i5 >= size()) {
            throw new IndexOutOfBoundsException();
        }
        return c(i5);
    }
}
