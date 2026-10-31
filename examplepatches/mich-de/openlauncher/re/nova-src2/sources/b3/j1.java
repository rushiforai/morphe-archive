package b3;

import androidx.compose.ui.Modifier$Node;
import c3.g3;
import java.lang.reflect.Field;
import java.util.List;
import kotlin.jvm.internal.Reflection;
import kotlin.sequences.Sequence;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public abstract class j1 implements b2.s, c3.o2 {
    public static final int $stable = 0;

    @Nullable
    private c3.q2 _inspectorValues;

    public final c3.q2 a() throws SecurityException {
        c3.q2 q2Var = this._inspectorValues;
        if (q2Var != null) {
            return q2Var;
        }
        c3.q2 q2Var2 = new c3.q2();
        q2Var2.d(Reflection.f71864a.getOrCreateKotlinClass(getClass()).getSimpleName());
        inspectableProperties(q2Var2);
        this._inspectorValues = q2Var2;
        return q2Var2;
    }

    public abstract Modifier$Node create();

    @Override // c3.o2
    @NotNull
    public final Sequence<g3> getInspectableElements() {
        return a().b();
    }

    @Override // c3.o2
    @Nullable
    public final String getNameFallback() {
        return a().a();
    }

    @Override // c3.o2
    @Nullable
    public final Object getValueOverride() {
        return a().c();
    }

    public void inspectableProperties(c3.q2 q2Var) throws SecurityException {
        List listW0 = kotlin.collections.c.W0(getClass().getDeclaredFields(), new ai.r2(9));
        int size = listW0.size();
        for (int i5 = 0; i5 < size; i5++) {
            Field field = (Field) listW0.get(i5);
            if (!field.getDeclaringClass().isAssignableFrom(j1.class)) {
                try {
                    field.setAccessible(true);
                    q2Var.b().b(field.getName(), field.get(this));
                } catch (IllegalAccessException | SecurityException unused) {
                }
            }
        }
    }

    public abstract void update(Modifier$Node modifier$Node);
}
