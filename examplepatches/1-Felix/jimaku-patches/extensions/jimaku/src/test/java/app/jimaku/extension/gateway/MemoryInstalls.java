package app.jimaku.extension.gateway;

/** An install store in memory, as the phone's preferences keep it. */
final class MemoryInstalls implements InstallStore {
    volatile Install install;

    MemoryInstalls() {
    }

    MemoryInstalls(String id, String secret) {
        install = new Install(id, secret);
    }

    @Override
    public Install load() {
        return install;
    }

    @Override
    public void save(Install install) {
        this.install = install;
    }
}
