package nl.johninnl.deezer.auth;

/** One guarded preparation transaction; failure reset precedes cleanup and retirement. */
public final class ConsentPreparation {
    private ConsentPreparation() {}
    public interface Work<T> { T run() throws Exception; }
    public interface Failure {
        void cancel() throws Exception;
        void cleanup() throws Exception;
        void retire() throws Exception;
    }

    public static <T> T run(Work<T> work, Failure failure) {
        try {
            T result = work.run();
            if (result != null) return result;
        } catch (Exception preparationFailed) {
            // Do not forward transaction/Intent exception messages into native diagnostics.
        }
        fail(failure);
        return null;
    }

    public static void fail(Failure failure) {
        try {
            try { failure.cancel(); } catch (Exception resetFailed) { /* Still clean up. */ }
        } finally {
            try {
                try { failure.cleanup(); } catch (Exception cleanupFailed) { /* Still retire. */ }
            } finally {
                try { failure.retire(); } catch (Exception retirementFailed) { /* Never replay reset. */ }
            }
        }
    }
}
