package op;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.Serializable;
import org.jetbrains.annotations.NotNull;

@Serializable(with = d.class)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class c {

    @NotNull
    public static final b Companion = new b();

    /* renamed from: a, reason: collision with root package name */
    public final LinkedHashMap f80550a;

    public c(LinkedHashMap linkedHashMap) {
        Set<Map.Entry> setEntrySet = linkedHashMap.entrySet();
        ArrayList arrayList = new ArrayList(b70.c.u0(setEntrySet, 10));
        for (Map.Entry entry : setEntrySet) {
            arrayList.add(new Pair(entry.getKey(), MapsKt.u0((Map) entry.getValue())));
        }
        this.f80550a = MapsKt.u0(MapsKt.r0(arrayList));
    }

    public /* synthetic */ c() {
        this(new LinkedHashMap());
    }
}
