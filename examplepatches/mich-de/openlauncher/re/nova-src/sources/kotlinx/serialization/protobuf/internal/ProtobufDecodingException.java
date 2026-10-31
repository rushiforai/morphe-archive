package kotlinx.serialization.protobuf.internal;

import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.SerializationException;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0003\n\u0002\b\u0003\b\u0000\u0018\u00002\u00020\u0001B\u001b\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007¨\u0006\b"}, d2 = {"Lkotlinx/serialization/protobuf/internal/ProtobufDecodingException;", "Lkotlinx/serialization/SerializationException;", PglCryptUtils.KEY_MESSAGE, b.f42142b, "e", b.f42142b, "<init>", "(Ljava/lang/String;Ljava/lang/Throwable;)V", "kotlinx-serialization-protobuf"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class ProtobufDecodingException extends SerializationException {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ProtobufDecodingException(@NotNull String message, @Nullable Throwable th2) {
        super(message, th2);
        Intrinsics.g(message, "message");
    }

    public /* synthetic */ ProtobufDecodingException(String str, Throwable th2, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, (i5 & 2) != 0 ? null : th2);
    }
}
