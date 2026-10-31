package io.branch.engage.sesame_lite.internal;

import com.amplitude.android.migration.DatabaseConstants;
import com.instabridge.mobilesdk.internal.esim.CarrierConfigurator;
import java.lang.Comparable;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Metadata;
import kotlin.comparisons.ComparisonsKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000f\n\u0002\u0010\u0000\n\u0002\b\u0004\n\u0002\u0010%\n\u0002\b\u0007\u0018\u0000*\u0004\b\u0000\u0010\u0001*\u000e\b\u0001\u0010\u0002*\b\u0012\u0004\u0012\u0002H\u00020\u00032\u00020\u0004B\r\u0012\u0006\u0010\u0005\u001a\u00028\u0001¢\u0006\u0002\u0010\u0006J\u0016\u0010\n\u001a\u00028\u00012\u0006\u0010\u000b\u001a\u00028\u0000H\u0086\u0002¢\u0006\u0002\u0010\fJ \u0010\r\u001a\u00028\u00012\u0006\u0010\u000b\u001a\u00028\u00002\b\u0010\u000e\u001a\u0004\u0018\u00018\u0001H\u0086\u0002¢\u0006\u0002\u0010\u000fR\u0010\u0010\u0005\u001a\u00028\u0001X\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u0007R\u001a\u0010\b\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\tX\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0010"}, d2 = {"Lio/branch/engage/sesame_lite/internal/MutableMaxMap;", "K", "V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, CarrierConfigurator.APN_TYPE, "(Ljava/lang/Comparable;)V", "Ljava/lang/Comparable;", "internal", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "get", DatabaseConstants.KEY_FIELD, "(Ljava/lang/Object;)Ljava/lang/Comparable;", "set", "value", "(Ljava/lang/Object;Ljava/lang/Comparable;)Ljava/lang/Comparable;", "sesame-lite_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
public final class MutableMaxMap<K, V extends Comparable<? super V>> {

    @NotNull
    private final V default;

    @NotNull
    private final Map<K, V> internal;

    public MutableMaxMap(@NotNull V v11) {
        Intrinsics.g(v11, "default");
        this.default = v11;
        this.internal = new LinkedHashMap();
    }

    @NotNull
    public final V get(K key) {
        V v11 = this.internal.get(key);
        return v11 == null ? this.default : v11;
    }

    @NotNull
    public final V set(K key, @Nullable V value) {
        V v11 = this.internal.get(key);
        if (v11 == null) {
            v11 = this.default;
        }
        if (value == null) {
            value = this.default;
        }
        V v12 = (V) ComparisonsKt.Z(v11, value);
        this.internal.put(key, v12);
        return v12;
    }
}
