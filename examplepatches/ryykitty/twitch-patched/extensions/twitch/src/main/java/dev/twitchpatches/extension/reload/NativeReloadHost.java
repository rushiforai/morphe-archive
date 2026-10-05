package dev.twitchpatches.extension.reload;

public interface NativeReloadHost {
    Object reloadIdentity();
    boolean reloadNativeStream();
}
