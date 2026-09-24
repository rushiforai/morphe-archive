package app.yydarlinker.deepseekcaptions;
/** Hard spending boundary per failed window and session; reopening explicitly starts a new session. */
final class AnchoredRetryPolicy {
    static final int MAX_FAILURES=3;
    private AnchoredRetryPolicy() {}
    static ContextualUnitCorePolicy.RetryDecision decide(ContextualUnitCorePolicy.FailureKind kind,
                                                        int failures, boolean priority) {
        if(failures>=MAX_FAILURES) return new ContextualUnitCorePolicy.RetryDecision(true,false,Long.MAX_VALUE);
        return ContextualUnitCorePolicy.retryDecision(kind,failures,priority);
    }
}
