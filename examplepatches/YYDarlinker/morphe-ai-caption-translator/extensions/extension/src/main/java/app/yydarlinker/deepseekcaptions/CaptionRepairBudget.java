package app.yydarlinker.deepseekcaptions;
/** Total automatic failure budget is shared; quality retries are a smaller subset, never extra. */
final class CaptionRepairBudget {
    static final int SESSION_QUALITY_REPAIRS=4;
    static boolean allow(int priorTaskRepairs,int sessionRepairs,int totalFailures){
        return priorTaskRepairs==0 && sessionRepairs<SESSION_QUALITY_REPAIRS && totalFailures<AnchoredRetryPolicy.MAX_FAILURES;
    }
}
