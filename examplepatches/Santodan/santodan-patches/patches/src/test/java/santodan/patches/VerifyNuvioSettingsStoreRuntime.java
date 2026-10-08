package santodan.patches;

import software.santodan.extension.nuviomerged.NuvioSettingsStoreResolver;

/** Reproduces opening Layout before the native tracking settings page. */
public final class VerifyNuvioSettingsStoreRuntime {
    private static final class Provider {
        private int calls;
        private final Object coordinator = new Object();
        public Object get() { calls++; return coordinator; }
    }
    private static final class Component {
        private final Provider w3 = new Provider();
    }

    public static void main(String[] args) throws Exception {
        Component component = new Component();
        NuvioSettingsStoreResolver.registerComponent(component);
        if (component.w3.calls != 0) throw new AssertionError("Coordinator initialized eagerly");
        if (NuvioSettingsStoreResolver.resolve() != component.w3.coordinator)
            throw new AssertionError("Native provider was not resolved");
        if (NuvioSettingsStoreResolver.resolve() != component.w3.coordinator || component.w3.calls != 1)
            throw new AssertionError("Coordinator was not retained");
        Object existing = new Object();
        NuvioSettingsStoreResolver.registerStore(existing);
        if (NuvioSettingsStoreResolver.resolve() != existing || component.w3.calls != 1)
            throw new AssertionError("Existing native coordinator was not reused");
        System.out.println("PASS: Layout resolves the lazy settings coordinator and reuses existing instances");
    }
}
