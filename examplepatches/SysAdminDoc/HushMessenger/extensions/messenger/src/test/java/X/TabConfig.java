package X;

/** Stands in for the obfuscated config object some Messenger builds wrap a keyboard tab's event in. */
public final class TabConfig {
    public final Object event;
    public final int order = 3;

    public TabConfig(Object event) {
        this.event = event;
    }
}
