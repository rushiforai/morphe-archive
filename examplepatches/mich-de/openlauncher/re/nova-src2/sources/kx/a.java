package kx;

import com.teslacoilsw.conditions.rules.ConditionModel;
import kotlinx.serialization.KSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class a {
    /* JADX WARN: Type inference failed for: r0v0, types: [java.lang.Object, kotlin.Lazy] */
    @NotNull
    public final KSerializer<ConditionModel> serializer() {
        return (KSerializer) ConditionModel.f45539a.getValue();
    }
}
