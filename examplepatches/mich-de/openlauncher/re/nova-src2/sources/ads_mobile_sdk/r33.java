package ads_mobile_sdk;

import androidx.compose.ui.node.LayoutNode;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;

/* loaded from: classes2.dex */
public final class r33 implements b.bb {

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ int f8918c = 0;

    /* renamed from: a, reason: collision with root package name */
    public final List f8919a;

    /* renamed from: b, reason: collision with root package name */
    public final List f8920b;

    static {
        hb1.a(Collections.EMPTY_SET);
    }

    public r33(List list, List list2) {
        this.f8919a = list;
        this.f8920b = list2;
    }

    @Override // b.m5
    public final Object get() {
        List list = this.f8919a;
        int size = list.size();
        List list2 = this.f8920b;
        ArrayList arrayList = new ArrayList(list2.size());
        int size2 = list2.size();
        for (int i5 = 0; i5 < size2; i5++) {
            Collection collection = (Collection) ((b.m5) list2.get(i5)).get();
            size += collection.size();
            arrayList.add(collection);
        }
        HashSet hashSet = new HashSet(size < 3 ? size + 1 : size < 1073741824 ? (int) ((size / 0.75f) + 1.0f) : LayoutNode.NotPlacedPlaceOrder);
        int size3 = list.size();
        for (int i11 = 0; i11 < size3; i11++) {
            Object obj = ((b.m5) list.get(i11)).get();
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
