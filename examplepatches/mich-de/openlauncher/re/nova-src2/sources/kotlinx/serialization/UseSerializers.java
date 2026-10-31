package kotlinx.serialization;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import kotlin.Metadata;

@Target({})
@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u001b\n\u0000\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0087\u0002\u0018\u00002\u00020\u0001B,\u0012*\u0010\u0002\u001a\u0016\u0012\u0012\b\u0001\u0012\u000e\u0012\n\b\u0001\u0012\u0006\u0012\u0002\b\u00030\u00050\u00040\u0003\"\u000e\u0012\n\b\u0001\u0012\u0006\u0012\u0002\b\u00030\u00050\u0004R#\u0010\u0002\u001a\u0016\u0012\u0012\b\u0001\u0012\u000e\u0012\n\b\u0001\u0012\u0006\u0012\u0002\b\u00030\u00050\u00040\u0003¢\u0006\u0006\u001a\u0004\b\u0002\u0010\u0006¨\u0006\u0007"}, d2 = {"Lkotlinx/serialization/UseSerializers;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "serializerClasses", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lkotlin/reflect/KClass;", "Lkotlinx/serialization/KSerializer;", "()[Ljava/lang/Class;", "kotlinx-serialization-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
@kotlin.annotation.Target
@Retention(RetentionPolicy.CLASS)
@kotlin.annotation.Retention
/* loaded from: classes5.dex */
public @interface UseSerializers {
    Class<? extends KSerializer<?>>[] serializerClasses();
}
