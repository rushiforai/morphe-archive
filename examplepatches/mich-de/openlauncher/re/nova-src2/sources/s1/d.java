package s1;

import java.util.Collection;
import kotlin.jvm.internal.markers.KMappedMarker;

/* loaded from: classes.dex */
public interface d extends b, Collection, KMappedMarker {
    d C(int i5);

    d C0(t1.b bVar);

    @Override // java.util.List
    d add(int i5, Object obj);

    @Override // java.util.List, java.util.Collection
    d add(Object obj);

    @Override // java.util.List, java.util.Collection
    d addAll(Collection collection);

    t1.f builder();

    @Override // java.util.List
    d set(int i5, Object obj);
}
