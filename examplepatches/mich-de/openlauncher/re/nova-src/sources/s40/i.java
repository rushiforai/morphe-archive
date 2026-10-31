package s40;

import androidx.compose.ui.node.LayoutNode;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;

/* loaded from: classes4.dex */
public final class i implements d {

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ int f86662c = 0;

    /* renamed from: a, reason: collision with root package name */
    public final List f86663a;

    /* renamed from: b, reason: collision with root package name */
    public final List f86664b;

    static {
        e.a(Collections.EMPTY_SET);
    }

    public i(List list, List list2) {
        this.f86663a = list;
        this.f86664b = list2;
    }

    @Override // w60.a
    public final Object get() {
        List list = this.f86663a;
        int size = list.size();
        List list2 = this.f86664b;
        ArrayList arrayList = new ArrayList(list2.size());
        int size2 = list2.size();
        for (int i5 = 0; i5 < size2; i5++) {
            Collection collection = (Collection) ((h) list2.get(i5)).get();
            size += collection.size();
            arrayList.add(collection);
        }
        HashSet hashSet = new HashSet(size < 3 ? size + 1 : size < 1073741824 ? (int) ((size / 0.75f) + 1.0f) : LayoutNode.NotPlacedPlaceOrder);
        int size3 = list.size();
        for (int i11 = 0; i11 < size3; i11++) {
            Object obj = ((h) list.get(i11)).get();
            obj.getClass();
            hashSet.add(obj);
        }
        int size4 = arrayList.size();
        for (int i12 = 0; i12 < size4; i12++) {
            for (Object obj2 : (Collection) arrayList.get(i12)) {
                obj2.getClass();
                hashSet.add(obj2);
            }
        }
        return Collections.unmodifiableSet(hashSet);
    }
}
