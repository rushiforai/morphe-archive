package iw;

import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.ArrayListSerializer;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes4.dex */
public final class i {

    @NotNull
    public static final h Companion = new h();

    /* renamed from: d, reason: collision with root package name */
    public static final KSerializer[] f68132d = {null, new ArrayListSerializer(StringSerializer.INSTANCE), o.Companion.serializer()};

    /* renamed from: a, reason: collision with root package name */
    public final boolean f68133a;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f68134b;

    /* renamed from: c, reason: collision with root package name */
    public final o f68135c;

    public /* synthetic */ i(int i5, boolean z11, ArrayList arrayList, o oVar) {
        if (4 != (i5 & 4)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 4, g.f68131a.getDescriptor());
        }
        this.f68133a = (i5 & 1) == 0 ? false : z11;
        if ((i5 & 2) == 0) {
            this.f68134b = new ArrayList();
        } else {
            this.f68134b = arrayList;
        }
        this.f68135c = oVar;
    }

    public i(boolean z11, o nameType) {
        ArrayList arrayList = new ArrayList();
        Intrinsics.g(nameType, "nameType");
        this.f68133a = z11;
        this.f68134b = arrayList;
        this.f68135c = nameType;
    }
}
