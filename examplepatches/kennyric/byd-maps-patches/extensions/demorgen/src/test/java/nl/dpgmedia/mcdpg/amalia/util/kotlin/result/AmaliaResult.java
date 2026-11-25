package nl.dpgmedia.mcdpg.amalia.util.kotlin.result;

/** Test double with the production constructor and getter signatures. */
public final class AmaliaResult {
    public static final class Success {
        private final Object value;

        public Success(Object value) {
            this.value = value;
        }

        public Object getValue() {
            return value;
        }
    }
}
