package nova.branch.engage.sesame_lite.api_integration;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.ULong;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0007\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0002¨\u0006\u0004"}, d2 = {"Lnova/branch/engage/sesame_lite/api_integration/ExternalLink;", b.f42142b, k.O, "$serializer", "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes.dex */
public final class ExternalLink {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion();

    /* renamed from: a, reason: collision with root package name */
    public final String f78377a;

    /* renamed from: b, reason: collision with root package name */
    public final String f78378b;

    /* renamed from: c, reason: collision with root package name */
    public final String f78379c;

    /* renamed from: d, reason: collision with root package name */
    public final String f78380d;

    /* renamed from: e, reason: collision with root package name */
    public final String f78381e;

    /* renamed from: f, reason: collision with root package name */
    public final Long f78382f;

    /* renamed from: g, reason: collision with root package name */
    public Long f78383g;

    /* renamed from: h, reason: collision with root package name */
    public final long f78384h;

    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001J\u0013\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00030\u0002¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\u0006"}, d2 = {"Lnova/branch/engage/sesame_lite/api_integration/ExternalLink$Companion;", b.f42142b, "Lkotlinx/serialization/KSerializer;", "Lnova/branch/engage/sesame_lite/api_integration/ExternalLink;", "serializer", "()Lkotlinx/serialization/KSerializer;", "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        @NotNull
        public final KSerializer<ExternalLink> serializer() {
            return ExternalLink$$serializer.INSTANCE;
        }
    }

    public ExternalLink(String key, String displayLabel, String str, String str2, String intentUri, Long l9, Long l11, int i5) {
        str = (i5 & 4) != 0 ? null : str;
        l9 = (i5 & 32) != 0 ? null : l9;
        l11 = (i5 & 64) != 0 ? null : l11;
        Intrinsics.g(key, "key");
        Intrinsics.g(displayLabel, "displayLabel");
        Intrinsics.g(intentUri, "intentUri");
        this.f78377a = key;
        this.f78378b = displayLabel;
        this.f78379c = str;
        this.f78380d = str2;
        this.f78381e = intentUri;
        this.f78382f = l9;
        this.f78383g = l11;
        this.f78384h = 0L;
    }

    public /* synthetic */ ExternalLink(int i5, String str, String str2, String str3, String str4, String str5, Long l9, Long l11, ULong uLong) {
        if (19 != (i5 & 19)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 19, ExternalLink$$serializer.INSTANCE.getDescriptor());
        }
        this.f78377a = str;
        this.f78378b = str2;
        if ((i5 & 4) == 0) {
            this.f78379c = null;
        } else {
            this.f78379c = str3;
        }
        if ((i5 & 8) == 0) {
            this.f78380d = null;
        } else {
            this.f78380d = str4;
        }
        this.f78381e = str5;
        if ((i5 & 32) == 0) {
            this.f78382f = null;
        } else {
            this.f78382f = l9;
        }
        if ((i5 & 64) == 0) {
            this.f78383g = null;
        } else {
            this.f78383g = l11;
        }
        this.f78384h = (i5 & 128) == 0 ? 0L : uLong.f71700a;
    }
}
