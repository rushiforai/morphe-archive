package app.ytmusicproxy.extension;

import android.util.Base64;
import android.util.Log;

import org.chromium.net.Proxy;
import org.chromium.net.ProxyOptions;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.AbstractMap;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Executor;

final class CronetProxyOptionsFactory {
    private static final String TAG = "YTMProxyPatch";
    private static final Executor DIRECT_EXECUTOR = new Executor() {
        @Override
        public void execute(Runnable command) {
            command.run();
        }
    };

    private CronetProxyOptionsFactory() {
    }

    static ProxyOptions create(ProxyInstaller.Snapshot snapshot) {
        ArrayList<Proxy> proxies = new ArrayList<Proxy>();
        proxies.add(new Proxy(
                Proxy.HTTP,
                snapshot.getHost(),
                snapshot.getPort(),
                DIRECT_EXECUTOR,
                new ProxyTunnelCallback(snapshot)
        ));
        return new ProxyOptions(proxies);
    }

    private static final class ProxyTunnelCallback extends Proxy.Callback {
        private final ProxyInstaller.Snapshot snapshot;

        private ProxyTunnelCallback(ProxyInstaller.Snapshot snapshot) {
            this.snapshot = snapshot;
        }

        @Override
        public void onBeforeTunnelRequest(Request request) {
            try {
                request.proceed(proxyHeaders());
            } finally {
                request.close();
            }
        }

        @Override
        public boolean onTunnelHeadersReceived(List<?> headers, int statusCode) {
            boolean accepted = statusCode >= 200 && statusCode < 300;
            if (!accepted) {
                Log.w(TAG, "Cronet proxy tunnel rejected with status=" + statusCode);
            }
            return accepted;
        }

        private List<AbstractMap.SimpleImmutableEntry<String, String>> proxyHeaders() {
            if (!snapshot.hasAuthentication()) {
                return Collections.emptyList();
            }

            String credentials = snapshot.getUsername() + ":" + snapshot.getPassword();
            String encoded = Base64.encodeToString(credentials.getBytes(StandardCharsets.UTF_8), Base64.NO_WRAP);
            return Collections.singletonList(
                    new AbstractMap.SimpleImmutableEntry<String, String>("Proxy-Authorization", "Basic " + encoded)
            );
        }
    }
}
