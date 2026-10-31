package pp;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerialName;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@SerialName("LinkClickEvent")
@Serializable
/* loaded from: classes4.dex */
public final class x extends a0 {

    @NotNull
    public static final q Companion = new q();

    /* renamed from: e, reason: collision with root package name */
    public static final KSerializer[] f82790e = {null, w.Companion.serializer(), null};

    /* renamed from: b, reason: collision with root package name */
    public final u f82791b;

    /* renamed from: c, reason: collision with root package name */
    public final w f82792c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f82793d;

    public x(u linkOpen, w wVar, boolean z11) {
        Intrinsics.g(linkOpen, "linkOpen");
        this.f82791b = linkOpen;
        this.f82792c = wVar;
        this.f82793d = z11;
    }

    public final u a() {
        return this.f82791b;
    }

    public final w b() {
        return this.f82792c;
    }

    public final boolean c() {
        return this.f82793d;
    }

    public /* synthetic */ x(int i5, u uVar, w wVar, boolean z11) {
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, p.f82765a.getDescriptor());
        }
        this.f82791b = uVar;
        this.f82792c = wVar;
        if ((i5 & 4) == 0) {
            this.f82793d = false;
        } else {
            this.f82793d = z11;
        }
    }

    public /* synthetic */ x(u uVar, w wVar) {
        this(uVar, wVar, false);
    }
}
