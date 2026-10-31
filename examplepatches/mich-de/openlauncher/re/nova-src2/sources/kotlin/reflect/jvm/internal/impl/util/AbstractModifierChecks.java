package kotlin.reflect.jvm.internal.impl.util;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.descriptors.FunctionDescriptor;
import kotlin.reflect.jvm.internal.impl.util.CheckResult;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
public abstract class AbstractModifierChecks {
    @NotNull
    public final CheckResult check(@NotNull FunctionDescriptor functionDescriptor) {
        Intrinsics.g(functionDescriptor, "functionDescriptor");
        for (Checks checks : getChecks$descriptors()) {
            if (checks.isApplicable(functionDescriptor)) {
                return checks.checkAll(functionDescriptor);
            }
        }
        return CheckResult.IllegalFunctionName.INSTANCE;
    }

    @NotNull
    public abstract List<Checks> getChecks$descriptors();
}
