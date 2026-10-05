package dev.twitchpatches.extension.reload;

import android.view.View;
import java.lang.ref.WeakReference;

final class ViewReloadHost implements NativeReloadHost {
    private final WeakReference<View> root;
    private final WeakReference<NativeReloadOwner> owner;

    ViewReloadHost(View root, NativeReloadOwner owner) {
        this.root = new WeakReference<>(root);
        this.owner = new WeakReference<>(owner);
    }

    private NativeReloadHost current() {
        View view = root.get();
        NativeReloadOwner controls = owner.get();
        if (view == null || !view.isAttachedToWindow() || controls == null) return null;
        Object player = controls.reloadControlsOwner();
        return player instanceof NativeReloadHost ? (NativeReloadHost) player : null;
    }

    @Override public Object reloadIdentity() {
        NativeReloadHost host = current();
        return host == null ? null : host.reloadIdentity();
    }

    @Override public boolean reloadNativeStream() {
        NativeReloadHost host = current();
        return host != null && host.reloadNativeStream();
    }
}
