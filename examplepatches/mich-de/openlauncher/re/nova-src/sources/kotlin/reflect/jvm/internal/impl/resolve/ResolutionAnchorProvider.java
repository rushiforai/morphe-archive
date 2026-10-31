package kotlin.reflect.jvm.internal.impl.resolve;

import kotlin.reflect.jvm.internal.impl.descriptors.ModuleDescriptor;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes5.dex */
public interface ResolutionAnchorProvider {
    @Nullable
    ModuleDescriptor getResolutionAnchor(@NotNull ModuleDescriptor moduleDescriptor);
}
