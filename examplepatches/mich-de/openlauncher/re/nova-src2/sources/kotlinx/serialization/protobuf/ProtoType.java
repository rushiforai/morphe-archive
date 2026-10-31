package kotlinx.serialization.protobuf;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.util.TTConst;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.ExperimentalSerializationApi;
import kotlinx.serialization.SerialInfo;
import org.jetbrains.annotations.NotNull;

@Target({})
@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u001b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0087\u0002\u0018\u00002\u00020\u0001B\b\u0012\u0006\u0010\u0002\u001a\u00020\u0003R\u000f\u0010\u0002\u001a\u00020\u0003¢\u0006\u0006\u001a\u0004\b\u0002\u0010\u0004¨\u0006\u0005"}, d2 = {"Lkotlinx/serialization/protobuf/ProtoType;", b.f42142b, TTConst.TRACK_TYPE, "Lkotlinx/serialization/protobuf/ProtoIntegerType;", "()Lkotlinx/serialization/protobuf/ProtoIntegerType;", "kotlinx-serialization-protobuf"}, k = 1, mv = {2, 1, 0}, xi = 48)
@ExperimentalSerializationApi
@SerialInfo
@kotlin.annotation.Target
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: classes.dex */
public @interface ProtoType {

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes5.dex */
    public /* synthetic */ class Impl implements ProtoType {
        private final /* synthetic */ ProtoIntegerType type;

        public Impl(@NotNull ProtoIntegerType type) {
            Intrinsics.g(type, "type");
            this.type = type;
        }

        @Override // kotlinx.serialization.protobuf.ProtoType
        public final /* synthetic */ ProtoIntegerType type() {
            return this.type;
        }
    }

    ProtoIntegerType type();
}
