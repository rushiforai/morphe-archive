package nl.johninnl.wuplaycar;

/** Match installed trusted hosts resolved from the actual Binder caller UID. */
public final class HostPackages {
    private static final String[] HOSTS={"app.seb3thehacker.gearslip","app.seb3thehacker.gearslip.dev","app.johninnl.drivedeck","app.johninnl.drivedeck.dev"};
    public static String[] packageNames(){return HOSTS.clone();}
    public static boolean isDriveDeck(String name){return "app.johninnl.drivedeck".equals(name)||"app.johninnl.drivedeck.dev".equals(name);}
    public static boolean allowed(String[] packages){if(packages!=null)for(String name:packages)for(String host:HOSTS)if(host.equals(name))return true;return false;}
    private HostPackages(){}
}
