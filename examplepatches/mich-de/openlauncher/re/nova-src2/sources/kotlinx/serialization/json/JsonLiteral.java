package kotlinx.serialization.json;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.json.internal.StringOpsKt;
import kotlinx.serialization.json.internal.SuppressAnimalSniffer;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u000e\n\u0002\b\u0006\n\u0002\u0010\b\n\u0000\b\u0000\u0018\u00002\u00020\u0001B%\b\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\b\u0010\tJ\b\u0010\u0011\u001a\u00020\u000eH\u0016J\u0013\u0010\u0012\u001a\u00020\u00052\b\u0010\u0013\u001a\u0004\u0018\u00010\u0003H\u0096\u0002J\b\u0010\u0014\u001a\u00020\u0015H\u0017R\u0014\u0010\u0004\u001a\u00020\u0005X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0004\u0010\nR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u0007X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0014\u0010\r\u001a\u00020\u000eX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010¨\u0006\u0016"}, d2 = {"Lkotlinx/serialization/json/JsonLiteral;", "Lkotlinx/serialization/json/JsonPrimitive;", "body", b.f42142b, "isString", b.f42142b, "coerceToInlineType", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "<init>", "(Ljava/lang/Object;ZLkotlinx/serialization/descriptors/SerialDescriptor;)V", "()Z", "getCoerceToInlineType$kotlinx_serialization_json", "()Lkotlinx/serialization/descriptors/SerialDescriptor;", "content", b.f42142b, "getContent", "()Ljava/lang/String;", "toString", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "kotlinx-serialization-json"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class JsonLiteral extends JsonPrimitive {

    @Nullable
    private final SerialDescriptor coerceToInlineType;

    @NotNull
    private final String content;
    private final boolean isString;

    public /* synthetic */ JsonLiteral(Object obj, boolean z11, SerialDescriptor serialDescriptor, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(obj, z11, (i5 & 4) != 0 ? null : serialDescriptor);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (other == null || JsonLiteral.class != other.getClass()) {
            return false;
        }
        JsonLiteral jsonLiteral = (JsonLiteral) other;
        return getIsString() == jsonLiteral.getIsString() && Intrinsics.b(getContent(), jsonLiteral.getContent());
    }

    @Nullable
    /* renamed from: getCoerceToInlineType$kotlinx_serialization_json, reason: from getter */
    public final SerialDescriptor getCoerceToInlineType() {
        return this.coerceToInlineType;
    }

    @Override // kotlinx.serialization.json.JsonPrimitive
    @NotNull
    public String getContent() {
        return this.content;
    }

    @SuppressAnimalSniffer
    public int hashCode() {
        return getContent().hashCode() + (Boolean.hashCode(getIsString()) * 31);
    }

    @Override // kotlinx.serialization.json.JsonPrimitive
    /* renamed from: isString, reason: from getter */
    public boolean getIsString() {
        return this.isString;
    }

    @Override // kotlinx.serialization.json.JsonPrimitive
    @NotNull
    public String toString() {
        if (!getIsString()) {
            return getContent();
        }
        StringBuilder sb2 = new StringBuilder();
        StringOpsKt.printQuoted(sb2, getContent());
        return sb2.toString();
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public JsonLiteral(@NotNull Object body, boolean z11, @Nullable SerialDescriptor serialDescriptor) {
        super(null);
        Intrinsics.g(body, "body");
        this.isString = z11;
        this.coerceToInlineType = serialDescriptor;
        this.content = body.toString();
        if (serialDescriptor != null && !serialDescriptor.getIsInline()) {
            throw new IllegalArgumentException("Failed requirement.");
        }
    }
}
