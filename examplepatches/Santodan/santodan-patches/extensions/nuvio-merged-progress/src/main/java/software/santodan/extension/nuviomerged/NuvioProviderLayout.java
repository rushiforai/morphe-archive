package software.santodan.extension.nuviomerged;

/** Flow return types are erased in DEX; these accessors have different value types. */
public final class NuvioProviderLayout {
    public final String providerInterface;
    public final String allProgressMethod;

    private NuvioProviderLayout(String providerInterface, String allProgressMethod) {
        this.providerInterface = providerInterface;
        this.allProgressMethod = allProgressMethod;
    }

    public static NuvioProviderLayout forRepository(String repositoryClass) {
        switch (repositoryClass) {
            case "ja.md": return new NuvioProviderLayout("ca.a0", "q");
            // q() is remoteProgressLoaded (Boolean) in beta4; r() carries progress lists.
            case "v9.yc": return new NuvioProviderLayout("o9.z", "r");
            default: throw new IllegalStateException("Unsupported Nuvio repository: " + repositoryClass);
        }
    }
}
