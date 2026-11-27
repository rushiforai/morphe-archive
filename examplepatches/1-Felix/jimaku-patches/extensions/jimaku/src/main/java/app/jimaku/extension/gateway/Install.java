package app.jimaku.extension.gateway;

/** This phone's install at the gateway: its id, and the secret its own requests carry. */
public final class Install {
    public final String install;
    public final String secret;

    public Install(String install, String secret) {
        this.install = install;
        this.secret = secret;
    }
}
