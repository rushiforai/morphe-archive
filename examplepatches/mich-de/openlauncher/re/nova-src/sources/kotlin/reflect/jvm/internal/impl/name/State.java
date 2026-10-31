package kotlin.reflect.jvm.internal.impl.name;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes5.dex */
final class State {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ State[] $VALUES;
    public static final State BEGINNING = new State("BEGINNING", 0);
    public static final State MIDDLE = new State("MIDDLE", 1);
    public static final State AFTER_DOT = new State("AFTER_DOT", 2);

    private static final /* synthetic */ State[] $values() {
        return new State[]{BEGINNING, MIDDLE, AFTER_DOT};
    }

    static {
        State[] stateArr$values = $values();
        $VALUES = stateArr$values;
        $ENTRIES = EnumEntriesKt.a(stateArr$values);
    }

    private State(String str, int i5) {
    }

    public static State valueOf(String str) {
        return (State) Enum.valueOf(State.class, str);
    }

    public static State[] values() {
        return (State[]) $VALUES.clone();
    }
}
