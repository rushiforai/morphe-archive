package com.dhuadapter.sysprops;

/**
 * Pure, dependency-free SystemProperties spoof tables + gate-aware dispatch (no
 * android / Pine imports) so the whole decision is unit-testable on a bare JVM.
 * SystemPropertiesSpoof's hook delegates here.
 */
public final class PropSpoofTable {

    private PropSpoofTable() {}

    /**
     * Gate-aware dispatch: root props only when rootBypass, qemu/emulator props
     * only when emulatorBypass. Returns null (leave the original value) when
     * neither gate matches the key.
     */
    public static String spoof(boolean rootBypass, boolean emulatorBypass, String key) {
        if (key == null) return null;
        if (rootBypass) {
            String r = rootProp(key);
            if (r != null) return r;
        }
        if (emulatorBypass) {
            String e = emulatorProp(key);
            if (e != null) return e;
        }
        return null;
    }

    /** Category 2 (root): props whose values betray a rooted / custom / dev ROM. */
    public static String rootProp(String key) {
        if (key == null) return null;
        switch (key) {
            case "ro.build.tags":     return "release-keys";
            case "ro.build.type":     return "user";
            case "ro.debuggable":     return "0";
            case "ro.secure":         return "1";
            case "ro.build.selinux":  return "1";
            case "ro.bootmode":       return "unknown";
            case "init.svc.magisk":   return "";
            case "init.svc.su":       return "";
            default:                  return null;
        }
    }

    /**
     * Category 3 (emulator): props whose values betray an emulator, plus any
     * qemu/goldfish/ranchu/genymotion/vbox prop → empty.
     */
    public static String emulatorProp(String key) {
        if (key == null) return null;
        switch (key) {
            case "ro.kernel.qemu":          return "0";
            case "ro.kernel.qemu.gles":     return "0";
            case "ro.hardware":             return "redfin";
            case "ro.product.model":        return "Pixel 5";
            case "ro.product.manufacturer": return "Google";
            case "ro.product.brand":        return "google";
            case "ro.product.device":       return "redfin";
            default:
                if (key.contains("qemu") || key.contains("goldfish")
                        || key.contains("ranchu") || key.contains("genym")
                        || key.contains("vbox")) {
                    return "";
                }
                return null;
        }
    }
}
