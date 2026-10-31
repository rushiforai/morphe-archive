package i70;

import java.io.Serializable;
import kotlin.collections.AbstractList;
import kotlin.collections.c;
import kotlin.enums.EnumEntries;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class a extends AbstractList implements EnumEntries, Serializable {

    /* renamed from: b, reason: collision with root package name */
    public final Enum[] f61435b;

    public a(Enum[] entries) {
        Intrinsics.g(entries, "entries");
        this.f61435b = entries;
    }

    @Override // kotlin.collections.AbstractCollection
    public final int c() {
        return this.f61435b.length;
    }

    @Override // kotlin.collections.AbstractCollection, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        if (!(obj instanceof Enum)) {
            return false;
        }
        Enum r42 = (Enum) obj;
        return ((Enum) c.E0(r42.ordinal(), this.f61435b)) == r42;
    }

    @Override // kotlin.collections.AbstractList, java.util.List
    public final Object get(int i5) {
        Enum[] enumArr = this.f61435b;
        int length = enumArr.length;
        AbstractList.f71712a.getClass();
        AbstractList.Companion.b(i5, length);
        return enumArr[i5];
    }

    @Override // kotlin.collections.AbstractList, java.util.List
    public final int indexOf(Object obj) {
        if (!(obj instanceof Enum)) {
            return -1;
        }
        Enum r42 = (Enum) obj;
        int iOrdinal = r42.ordinal();
        if (((Enum) c.E0(iOrdinal, this.f61435b)) == r42) {
            return iOrdinal;
        }
        return -1;
    }

    @Override // kotlin.collections.AbstractList, java.util.List
    public final int lastIndexOf(Object obj) {
        if (obj instanceof Enum) {
            return indexOf((Enum) obj);
        }
        return -1;
    }
}
