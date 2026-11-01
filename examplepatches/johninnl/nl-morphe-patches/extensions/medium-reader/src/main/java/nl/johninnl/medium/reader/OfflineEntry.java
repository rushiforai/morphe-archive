package nl.johninnl.medium.reader;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.TextView;

/** Offline access does not depend on the native home-feed request succeeding. */
public final class OfflineEntry {
    private OfflineEntry() {}
    public static void attach(Activity activity) {
        new Handler(Looper.getMainLooper()).post(() -> {
            if (activity.isFinishing() || activity.isDestroyed()) return;
            TextView button = new TextView(activity); button.setText("Offline articles"); button.setTextSize(16);
            button.setTextColor(0xffffffff); button.setBackgroundColor(0xff1a8917); button.setGravity(Gravity.CENTER);
            int pad = (int)(16 * activity.getResources().getDisplayMetrics().density); button.setPadding(pad, pad/2, pad, pad/2);
            button.setVisibility(View.GONE);
            FrameLayout.LayoutParams layout = new FrameLayout.LayoutParams(-2, -2, Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL);
            layout.bottomMargin = pad * 2;
            button.setOnClickListener(v -> activity.startActivity(new Intent(activity, OfflineArticlesActivity.class)));
            ConnectivityManager manager = (ConnectivityManager)activity.getSystemService(Context.CONNECTIVITY_SERVICE);
            Handler main = new Handler(Looper.getMainLooper());
            Runnable update = () -> {
                if (!button.isAttachedToWindow()) return;
                Network network = manager == null ? null : manager.getActiveNetwork();
                NetworkCapabilities caps = network == null ? null : manager.getNetworkCapabilities(network);
                boolean online = caps != null && caps.hasCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET) && caps.hasCapability(NetworkCapabilities.NET_CAPABILITY_VALIDATED);
                button.setVisibility(online ? View.GONE : View.VISIBLE);
            };
            ConnectivityManager.NetworkCallback callback = new ConnectivityManager.NetworkCallback() {
                public void onAvailable(Network n) { main.post(update); }
                public void onLost(Network n) { main.post(update); }
                public void onCapabilitiesChanged(Network n, NetworkCapabilities c) { main.post(update); }
            };
            button.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
                boolean registered;
                public void onViewAttachedToWindow(View v) {
                    if (manager != null) try { manager.registerDefaultNetworkCallback(callback); registered = true; } catch (RuntimeException ignored) { }
                    main.post(update);
                }
                public void onViewDetachedFromWindow(View v) {
                    if (registered) try { manager.unregisterNetworkCallback(callback); } catch (RuntimeException ignored) { }
                    registered = false;
                }
            });
            activity.addContentView(button, layout);
        });
    }
}
