package c3;

import kotlin.sequences.Sequence;

/* loaded from: classes.dex */
public interface o2 {
    default Sequence getInspectableElements() {
        return q70.a.f83782a;
    }

    default String getNameFallback() {
        return null;
    }

    Object getValueOverride();
}
