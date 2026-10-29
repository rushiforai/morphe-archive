package android.content.res;

public class Resources {
    private static final Resources SYSTEM = new Resources();
    private final Configuration config = new Configuration();

    public static Resources getSystem() {
        return SYSTEM;
    }

    public Configuration getConfiguration() {
        return config;
    }
}
