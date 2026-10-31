package m90;

import java.util.RandomAccess;
import kotlin.collections.AbstractList;

/* loaded from: classes.dex */
public final class x extends AbstractList implements RandomAccess {

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ int f76171d = 0;

    /* renamed from: b, reason: collision with root package name */
    public final j[] f76172b;

    /* renamed from: c, reason: collision with root package name */
    public final int[] f76173c;

    public x(j[] jVarArr, int[] iArr) {
        this.f76172b = jVarArr;
        this.f76173c = iArr;
    }

    @Override // kotlin.collections.AbstractCollection
    public final int c() {
        return this.f76172b.length;
    }

    @Override // kotlin.collections.AbstractCollection, java.util.Collection, java.util.List
    public final /* bridge */ boolean contains(Object obj) {
        if (obj instanceof j) {
            return super.contains((j) obj);
        }
        return false;
    }

    @Override // kotlin.collections.AbstractList, java.util.List
    public final Object get(int i5) {
        return this.f76172b[i5];
    }

    @Override // kotlin.collections.AbstractList, java.util.List
    public final /* bridge */ int indexOf(Object obj) {
        if (obj instanceof j) {
            return super.indexOf((j) obj);
        }
        return -1;
    }

    @Override // kotlin.collections.AbstractList, java.util.List
    public final /* bridge */ int lastIndexOf(Object obj) {
        if (obj instanceof j) {
            return super.lastIndexOf((j) obj);
        }
        return -1;
    }
}
