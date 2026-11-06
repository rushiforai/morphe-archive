/** Model the verified public token-provider fields without substituting the production REST implementation. */
public final class d04 {
    public final Provider a = new Provider(false);
    public final Provider b = new Provider(true);
    public static int refreshes;
    public static final class Provider {
        private final boolean refresh;
        Provider(boolean refresh) { this.refresh = refresh; }
        public Object invoke() {
            if (refresh) { refreshes++; return true; }
            return "test-token";
        }
    }
}
