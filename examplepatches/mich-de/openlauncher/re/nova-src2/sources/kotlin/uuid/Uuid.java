package kotlin.uuid;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import java.io.Serializable;
import kotlin.Metadata;
import kotlin.SinceKotlin;
import kotlin.jvm.internal.SourceDebugExtension;
import r70.j;

@SinceKotlin
@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00060\u0001j\u0002`\u0002:\u0001\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/uuid/Uuid;", "Ljava/io/Serializable;", "Lkotlin/io/Serializable;", k.O, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
@ExperimentalUuidApi
/* loaded from: classes.dex */
public final class Uuid implements Serializable {

    /* renamed from: c, reason: collision with root package name */
    public static final Companion f72055c = new Companion(0);

    /* renamed from: d, reason: collision with root package name */
    public static final Uuid f72056d = new Uuid(0, 0);

    /* renamed from: a, reason: collision with root package name */
    public final long f72057a;

    /* renamed from: b, reason: collision with root package name */
    public final long f72058b;

    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0004\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u0014\u0010\u0005\u001a\u00020\u00048\u0006X\u0086T¢\u0006\u0006\n\u0004\b\u0005\u0010\u0006R\u0014\u0010\u0007\u001a\u00020\u00048\u0006X\u0086T¢\u0006\u0006\n\u0004\b\u0007\u0010\u0006¨\u0006\b"}, d2 = {"Lkotlin/uuid/Uuid$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "SIZE_BYTES", "I", "SIZE_BITS", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final class Companion {
        public /* synthetic */ Companion(int i5) {
            this();
        }

        private Companion() {
        }
    }

    public Uuid(long j11, long j12) {
        this.f72057a = j11;
        this.f72058b = j12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Uuid)) {
            return false;
        }
        Uuid uuid = (Uuid) obj;
        return this.f72057a == uuid.f72057a && this.f72058b == uuid.f72058b;
    }

    public final int hashCode() {
        long j11 = this.f72057a ^ this.f72058b;
        return ((int) j11) ^ ((int) (j11 >> 32));
    }

    public final String toString() {
        byte[] bArr = new byte[36];
        long j11 = this.f72058b;
        b.b(j11, bArr, 24, 6);
        bArr[23] = 45;
        b.b(j11 >>> 48, bArr, 19, 2);
        bArr[18] = 45;
        long j12 = this.f72057a;
        b.b(j12, bArr, 14, 2);
        bArr[13] = 45;
        b.b(j12 >>> 16, bArr, 9, 2);
        bArr[8] = 45;
        b.b(j12 >>> 32, bArr, 0, 4);
        return j.x0(bArr);
    }
}
