package db0;

import java.util.List;
import kotlin.collections.EmptyList;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.ArrayListSerializer;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes.dex */
public final class m0 {

    @NotNull
    public static final l0 Companion = new l0();

    /* renamed from: d, reason: collision with root package name */
    public static final KSerializer[] f49170d = {null, null, new ArrayListSerializer(c0.Companion.serializer())};

    /* renamed from: a, reason: collision with root package name */
    public final long f49171a;

    /* renamed from: b, reason: collision with root package name */
    public final long f49172b;

    /* renamed from: c, reason: collision with root package name */
    public final List f49173c;

    public m0(int i5, long j11, long j12, List list) {
        this.f49171a = (i5 & 1) == 0 ? System.currentTimeMillis() : j11;
        if ((i5 & 2) == 0) {
            this.f49172b = -1L;
        } else {
            this.f49172b = j12;
        }
        if ((i5 & 4) == 0) {
            this.f49173c = EmptyList.f71733a;
        } else {
            this.f49173c = list;
        }
    }

    public m0(int i5, List list, long j11) {
        long jCurrentTimeMillis = System.currentTimeMillis();
        j11 = (i5 & 2) != 0 ? -1L : j11;
        list = (i5 & 4) != 0 ? EmptyList.f71733a : list;
        this.f49171a = jCurrentTimeMillis;
        this.f49172b = j11;
        this.f49173c = list;
    }
}
