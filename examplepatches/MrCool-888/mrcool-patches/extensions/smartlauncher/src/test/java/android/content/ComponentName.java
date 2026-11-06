package android.content;
public final class ComponentName {
    private final String pkg, cls;
    public ComponentName(String pkg, String cls) { this.pkg = pkg; this.cls = cls; }
    public String getPackageName() { return pkg; }
    public String getClassName() { return cls; }
    @Override public boolean equals(Object o) { if (!(o instanceof ComponentName)) return false; ComponentName c=(ComponentName)o; return pkg.equals(c.pkg)&&cls.equals(c.cls); }
    @Override public int hashCode() { return pkg.hashCode()*31+cls.hashCode(); }
}
