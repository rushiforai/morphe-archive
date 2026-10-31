package kotlinx.serialization.protobuf.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;

@Metadata(d1 = {"\u0000\u0016\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\u0018\u0002\n\u0002\b\u0002\u001a\u001c\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00012\n\u0010\u0003\u001a\u00060\u0004j\u0002`\u0005H\u0002\u001a\u001c\u0010\u0006\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00012\n\u0010\u0003\u001a\u00060\u0004j\u0002`\u0005H\u0002¨\u0006\u0007"}, d2 = {"makeDelimited", "Lkotlinx/serialization/protobuf/internal/ProtobufReader;", "decoder", "parentTag", b.f42142b, "Lkotlinx/serialization/protobuf/internal/ProtoDesc;", "makeDelimitedForced", "kotlinx-serialization-protobuf"}, k = 2, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class ProtobufDecodingKt {
    /* JADX INFO: Access modifiers changed from: private */
    public static final ProtobufReader makeDelimited(ProtobufReader protobufReader, long j11) {
        return new ProtobufReader(j11 == ProtobufTaggedBaseKt.MISSING_TAG ? protobufReader.objectTaglessInput() : protobufReader.objectInput());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final ProtobufReader makeDelimitedForced(ProtobufReader protobufReader, long j11) {
        return new ProtobufReader(j11 == ProtobufTaggedBaseKt.MISSING_TAG ? protobufReader.objectTaglessInput() : protobufReader.objectInput());
    }
}
