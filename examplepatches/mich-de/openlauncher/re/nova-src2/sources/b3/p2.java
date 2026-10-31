package b3;

/* loaded from: classes.dex */
public interface p2 extends n {
    void applySemantics(j3.b0 b0Var);

    default boolean getShouldClearDescendantSemantics() {
        return false;
    }

    default boolean getShouldMergeDescendantSemantics() {
        return false;
    }

    default boolean isImportantForBounds() {
        return true;
    }
}
