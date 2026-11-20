/** Negative control for the test-only offline build policy; no data is sent. */
class OfflineNetworkProbe {
    public static void main(String[] args) throws Exception {
        try {
            System.getSecurityManager().checkConnect("192.0.2.1", 443);
            throw new AssertionError("Offline policy did not deny a socket connection");
        } catch (SecurityException expected) {
            System.out.println("Offline policy verified: Java socket connection denied.");
        }
    }
}
