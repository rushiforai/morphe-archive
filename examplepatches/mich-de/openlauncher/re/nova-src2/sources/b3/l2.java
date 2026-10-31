package b3;

/* loaded from: classes.dex */
public interface l2 extends n {
    /* renamed from: getTouchBoundsExpansion-RZrCHBk */
    default long mo24getTouchBoundsExpansionRZrCHBk() {
        int i5 = s2.f17340b;
        return io.sentry.hints.i.d();
    }

    default boolean interceptOutOfBoundsChildEvents() {
        return false;
    }

    void onCancelPointerInput();

    /* renamed from: onPointerEvent-H0pRuoY */
    void mo26onPointerEventH0pRuoY(v2.m mVar, v2.n nVar, long j11);

    default void onViewConfigurationChange() {
        onCancelPointerInput();
    }

    default boolean sharePointerInputWithSiblings() {
        return false;
    }
}
