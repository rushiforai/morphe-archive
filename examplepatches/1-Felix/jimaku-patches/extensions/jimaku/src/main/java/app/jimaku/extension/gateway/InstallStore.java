package app.jimaku.extension.gateway;

/** Where the install is kept between runs of the app. */
public interface InstallStore {
    /** The install kept, or null while there is none. */
    Install load();

    /** Keeps {@code install}, or forgets the one kept where it is null. */
    void save(Install install);
}
