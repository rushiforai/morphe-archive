package iw;

import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes4.dex */
public final class f {

    @NotNull
    public static final e Companion = new e();

    /* renamed from: d, reason: collision with root package name */
    public static final KSerializer[] f68127d = {m.Companion.serializer(), null, null};

    /* renamed from: a, reason: collision with root package name */
    public final m f68128a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f68129b;

    /* renamed from: c, reason: collision with root package name */
    public final i f68130c;

    public /* synthetic */ f(int i5, m mVar, boolean z11, i iVar) {
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, d.f68126a.getDescriptor());
        }
        this.f68128a = mVar;
        this.f68129b = z11;
        if ((i5 & 4) == 0) {
            this.f68130c = null;
        } else {
            this.f68130c = iVar;
        }
    }

    public f(m mVar, boolean z11, i iVar) {
        this.f68128a = mVar;
        this.f68129b = z11;
        this.f68130c = iVar;
    }
}
