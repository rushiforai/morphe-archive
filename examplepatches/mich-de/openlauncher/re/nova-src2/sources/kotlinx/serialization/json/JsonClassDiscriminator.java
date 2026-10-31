package kotlinx.serialization.json;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.ExperimentalSerializationApi;
import kotlinx.serialization.InheritableSerialInfo;
import org.jetbrains.annotations.NotNull;

@Target({ElementType.TYPE})
@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u001b\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\b\u0087\u0002\u0018\u00002\u00020\u0001B\b\u0012\u0006\u0010\u0002\u001a\u00020\u0003R\u000f\u0010\u0002\u001a\u00020\u0003¢\u0006\u0006\u001a\u0004\b\u0002\u0010\u0004¨\u0006\u0005"}, d2 = {"Lkotlinx/serialization/json/JsonClassDiscriminator;", b.f42142b, "discriminator", b.f42142b, "()Ljava/lang/String;", "kotlinx-serialization-json"}, k = 1, mv = {2, 1, 0}, xi = 48)
@ExperimentalSerializationApi
@InheritableSerialInfo
@kotlin.annotation.Target
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: classes5.dex */
public @interface JsonClassDiscriminator {

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    public /* synthetic */ class Impl implements JsonClassDiscriminator {
        private final /* synthetic */ String discriminator;

        public Impl(@NotNull String discriminator) {
            Intrinsics.g(discriminator, "discriminator");
            this.discriminator = discriminator;
        }

        @Override // kotlinx.serialization.json.JsonClassDiscriminator
        public final /* synthetic */ String discriminator() {
            return this.discriminator;
        }
    }

    String discriminator();
}
