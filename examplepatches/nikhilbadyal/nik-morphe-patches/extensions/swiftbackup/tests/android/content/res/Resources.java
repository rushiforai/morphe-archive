package android.content.res;

/** Stub resources fixture for host regression checks without an Android runtime. */
public class Resources {
    public int getIdentifier(String name, String defType, String defPackage) {
        return 0;
    }
}
