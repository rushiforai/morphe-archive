package de.robv.android.xposed;

import de.robv.android.xposed.callbacks.XC_LoadPackage;
import de.robv.android.xposed.callbacks.XC_LoadPackage.LoadPackageParam;

/**
 * Compile-only stub mirroring the legacy Xposed API shipped by LSPosed 1.9.x.
 * The module entry class must implement this interface; LSPosed instantiates
 * it with a public no-arg constructor and registers it automatically.
 */
public interface IXposedHookLoadPackage extends IXposedMod {

    /**
     * Called very early when an app is loaded, before Application#onCreate.
     */
    void handleLoadPackage(LoadPackageParam lpparam) throws Throwable;
}
