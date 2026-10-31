package coil.memory;

import aa.d;
import android.os.Parcel;
import android.os.Parcelable;
import b.c9;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"coil/memory/MemoryCache$Key", "Landroid/os/Parcelable;", "coil-base_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class MemoryCache$Key implements Parcelable {

    @JvmField
    @Deprecated
    @NotNull
    public static final Parcelable.Creator<MemoryCache$Key> CREATOR = new d(19);

    /* renamed from: a, reason: collision with root package name */
    public final String f20152a;

    /* renamed from: b, reason: collision with root package name */
    public final Map f20153b;

    public MemoryCache$Key(String str, Map map) {
        this.f20152a = str;
        this.f20153b = map;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof MemoryCache$Key)) {
            return false;
        }
        MemoryCache$Key memoryCache$Key = (MemoryCache$Key) obj;
        return Intrinsics.b(this.f20152a, memoryCache$Key.f20152a) && Intrinsics.b(this.f20153b, memoryCache$Key.f20153b);
    }

    public final int hashCode() {
        return this.f20153b.hashCode() + (this.f20152a.hashCode() * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Key(key=");
        sb2.append(this.f20152a);
        sb2.append(", extras=");
        return c9.l(sb2, this.f20153b, ')');
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f20152a);
        Map map = this.f20153b;
        parcel.writeInt(map.size());
        for (Map.Entry entry : map.entrySet()) {
            String str = (String) entry.getKey();
            String str2 = (String) entry.getValue();
            parcel.writeString(str);
            parcel.writeString(str2);
        }
    }
}
