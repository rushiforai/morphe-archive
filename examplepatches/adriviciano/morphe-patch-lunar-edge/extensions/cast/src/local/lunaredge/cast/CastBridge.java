package local.lunaredge.cast;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.res.Configuration;
import android.net.ConnectivityManager;
import android.net.LinkAddress;
import android.net.LinkProperties;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.net.nsd.NsdManager;
import android.net.nsd.NsdServiceInfo;
import android.net.wifi.WifiManager;
import android.os.Handler;
import android.os.Looper;
import android.os.Build;
import android.text.InputType;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.SeekBar;
import android.widget.TextView;
import android.widget.Toast;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.Executors;

/** Selector y controles de Google Cast integrados en el reproductor existente. */
public final class CastBridge {
    private static final String SCREEN_TITLE = "Google Cast · 0.3.0";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static CastSession current;
    private static Controls controls;
    private CastBridge() { }

    public static void show(Activity activity) {
        MAIN.post(() -> {
            if (activity.isFinishing() || activity.isDestroyed()) return;
            if (current != null && current.isActive() && controls != null) {
                controls.show(activity);
                return;
            }
            try {
                new Discovery(activity, Media.read(activity)).start();
            } catch (Exception error) {
                new AlertDialog.Builder(activity).setTitle(SCREEN_TITLE)
                        .setMessage("Abre y carga un vídeo antes de emitirlo. " + error.getClass().getSimpleName())
                        .setPositiveButton("Aceptar", null).show();
            }
        });
    }

    private static final class Media {
        String url;
        String title;
        double position;
        Object player;

        static Media read(Activity activity) throws Exception {
            Media media = new Media();
            // Los nombres reales de estos campos se verifican en el parche para esta versión.
            Field listField = activity.getClass().getDeclaredField("l");
            Field indexField = activity.getClass().getDeclaredField("D");
            Field playerField = activity.getClass().getDeclaredField("j");
            Field titleField = activity.getClass().getDeclaredField("k");
            listField.setAccessible(true);
            indexField.setAccessible(true);
            playerField.setAccessible(true);
            titleField.setAccessible(true);
            List<?> entries = (List<?>) listField.get(activity);
            int index = indexField.getInt(activity);
            if (entries == null || index < 0 || index >= entries.size()) throw new IllegalStateException("Sin vídeo cargado");
            Object entry = entries.get(index);
            media.url = (String) entry.getClass().getMethod("getSearchShareModel").invoke(entry);
            Object detail = titleField.get(activity);
            media.title = detail == null ? "Lunar Edge" : (String) detail.getClass().getMethod("getTokenAssignConditionValid").invoke(detail);
            media.player = playerField.get(activity);
            if (media.player != null) media.position = ((Number) media.player.getClass().getMethod("z").invoke(media.player)).doubleValue() / 1000.0;
            URI parsed = new URI(media.url);
            if (!("http".equalsIgnoreCase(parsed.getScheme()) || "https".equalsIgnoreCase(parsed.getScheme()))) {
                throw new IllegalStateException("Fuente no compatible");
            }
            return media;
        }

        String networkUrl(String wifiAddress) throws Exception {
            URI parsed = new URI(url);
            if ("127.0.0.1".equals(parsed.getHost()) || "localhost".equalsIgnoreCase(parsed.getHost())) {
                // Se conserva el texto original de ruta y consulta, incluidos los escapes del motor.
                String authority = parsed.getRawAuthority();
                return url.replaceFirst(java.util.regex.Pattern.quote(authority), wifiAddress + (parsed.getPort() >= 0 ? ":" + parsed.getPort() : ""));
            }
            return url;
        }
    }

    private static Network wifi(Context context) {
        ConnectivityManager manager = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
        for (Network network : manager.getAllNetworks()) {
            NetworkCapabilities capabilities = manager.getNetworkCapabilities(network);
            if (capabilities != null && capabilities.hasTransport(NetworkCapabilities.TRANSPORT_WIFI)) return network;
        }
        return null;
    }

    private static String address(Context context, Network wifi) {
        ConnectivityManager manager = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
        LinkProperties properties = manager.getLinkProperties(wifi);
        if (properties != null) for (LinkAddress address : properties.getLinkAddresses()) {
            if (address.getAddress() instanceof Inet4Address) return address.getAddress().getHostAddress();
        }
        return null;
    }

    private static final class Device {
        final String key;
        final String name;
        final InetAddress host;
        final int port;
        Device(String key, String name, InetAddress host, int port) {
            this.key = key; this.name = name; this.host = host; this.port = port;
        }
    }

    private static final class Discovery implements NsdManager.DiscoveryListener {
        final Activity activity;
        final Media media;
        final NsdManager nsd;
        final Map<String, Device> devices = new LinkedHashMap<>();
        final ArrayDeque<NsdServiceInfo> pending = new ArrayDeque<>();
        final ArrayAdapter<String> adapter;
        final TextView status;
        final Network network;
        AlertDialog dialog;
        WifiManager.MulticastLock multicast;
        boolean stopped;
        boolean resolving;
        boolean registered;
        int found;
        int resolveFailures;

        Discovery(Activity activity, Media media) {
            this.activity = activity;
            this.media = media;
            nsd = (NsdManager) activity.getSystemService(Context.NSD_SERVICE);
            network = wifi(activity);
            adapter = new ArrayAdapter<>(activity, android.R.layout.simple_list_item_1, new ArrayList<>());
            status = new TextView(activity);
        }

        void start() {
            if (network == null || address(activity, network) == null) {
                new AlertDialog.Builder(activity).setTitle("Conecta el Wi-Fi")
                        .setMessage("El móvil y la TV deben estar conectados a la misma red Wi-Fi.")
                        .setPositiveButton("Aceptar", null).show();
                return;
            }
            LinearLayout layout = column(activity);
            status.setText("Buscando Android TV y Chromecast…");
            layout.addView(status);
            ListView list = new ListView(activity);
            list.setAdapter(adapter);
            layout.addView(list, new LinearLayout.LayoutParams(-1, dp(activity, 280)));
            Button originalSelector = new Button(activity);
            originalSelector.setText("Otros televisores (DLNA)");
            originalSelector.setOnClickListener(v -> { dialog.dismiss(); showDlna(activity); });
            layout.addView(originalSelector);
            dialog = new AlertDialog.Builder(activity).setTitle(SCREEN_TITLE)
                    .setView(layout).setNegativeButton("Cancelar", null)
                    .setNeutralButton("Introducir IP", (d, which) -> manualAddress()).create();
            dialog.setOnDismissListener(ignored -> stop());
            list.setOnItemClickListener((parent, view, position, id) -> {
                if (position >= devices.size()) return;
                Device device = new ArrayList<>(devices.values()).get(position);
                dialog.dismiss();
                connect(activity, media, device, network);
            });
            dialog.show();
            try {
                WifiManager manager = (WifiManager) activity.getApplicationContext().getSystemService(Context.WIFI_SERVICE);
                multicast = manager.createMulticastLock("lunar-cast-discovery");
                multicast.setReferenceCounted(false);
                multicast.acquire();
                nsd.discoverServices("_googlecast._tcp.", NsdManager.PROTOCOL_DNS_SD, this);
                registered = true;
                MAIN.postDelayed(() -> {
                    if (!stopped && devices.isEmpty()) status.setText(found == 0 ?
                            "No se han encontrado receptores Cast. Prueba a introducir la IP de la TV." :
                            "Se han encontrado " + found + " anuncios de Cast, pero no se pudo obtener su dirección (" + resolveFailures + " fallos). Prueba con la IP de la TV.");
                }, 12000);
            } catch (Exception error) {
                status.setText("No se pudo iniciar la búsqueda de TV: " + error.getClass().getSimpleName());
                stop();
            }
        }

        void stop() {
            if (stopped) return;
            stopped = true;
            if (registered) try { nsd.stopServiceDiscovery(this); } catch (IllegalArgumentException ignored) { }
            if (multicast != null && multicast.isHeld()) multicast.release();
            pending.clear();
        }

        @Override public void onServiceFound(NsdServiceInfo service) {
            MAIN.post(() -> { if (!stopped) { found++; pending.add(service); resolveNext(); } });
        }
        private void resolveNext() {
            if (stopped || resolving || pending.isEmpty()) return;
            resolving = true;
            NsdServiceInfo next = pending.remove();
            try {
                nsd.resolveService(next, new NsdManager.ResolveListener() {
                    public void onResolveFailed(NsdServiceInfo service, int code) {
                        MAIN.post(() -> { resolveFailures++; resolving = false; resolveNext(); });
                    }
                    public void onServiceResolved(NsdServiceInfo service) {
                        MAIN.post(() -> {
                            resolving = false;
                            if (stopped) return;
                            InetAddress host = service.getHost();
                            if (Build.VERSION.SDK_INT >= 34) {
                                // Android moderno puede devolver IPv6 primero; priorizamos la dirección LAN IPv4.
                                for (InetAddress candidate : service.getHostAddresses()) {
                                    if (candidate instanceof Inet4Address && candidate.isSiteLocalAddress()) { host = candidate; break; }
                                }
                            }
                            if (host != null && (host.isSiteLocalAddress() || host.isLinkLocalAddress())) {
                                byte[] friendly = service.getAttributes().get("fn");
                                String name = friendly == null ? service.getServiceName() : new String(friendly, StandardCharsets.UTF_8);
                                devices.put(service.getServiceName(), new Device(service.getServiceName(), name, host, service.getPort()));
                                refresh();
                            }
                            resolveNext();
                        });
                    }
                });
            } catch (Exception error) { resolveFailures++; resolving = false; resolveNext(); }
        }

        private void manualAddress() {
            EditText input = new EditText(activity);
            input.setInputType(InputType.TYPE_CLASS_PHONE);
            input.setHint("Ejemplo: 192.168.1.239");
            AlertDialog prompt = new AlertDialog.Builder(activity).setTitle("Dirección IP de la TV")
                    .setMessage("Puedes verla en Ajustes → Red de la TV. Debe estar en la misma red que el móvil.")
                    .setView(input).setNegativeButton("Cancelar", null).setPositiveButton("Conectar", null).create();
            prompt.setOnShowListener(d -> prompt.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v -> {
                try {
                    String[] parts = input.getText().toString().trim().split("\\.", -1);
                    if (parts.length != 4) throw new IllegalArgumentException();
                    byte[] bytes = new byte[4];
                    for (int i = 0; i < 4; i++) {
                        if (!parts[i].matches("[0-9]{1,3}")) throw new IllegalArgumentException();
                        int value = Integer.parseInt(parts[i]);
                        if (value > 255) throw new IllegalArgumentException();
                        bytes[i] = (byte) value;
                    }
                    InetAddress host = InetAddress.getByAddress(bytes);
                    if (!host.isSiteLocalAddress()) throw new IllegalArgumentException();
                    prompt.dismiss();
                    connect(activity, media, new Device(host.getHostAddress(), "TV · " + host.getHostAddress(), host, 8009), network);
                } catch (Exception error) { input.setError("Introduce una dirección local válida, por ejemplo 192.168.1.239"); }
            }));
            prompt.show();
        }
        private void refresh() {
            adapter.clear();
            for (Device device : devices.values()) adapter.add(device.name);
            status.setText(devices.isEmpty() ? "Buscando TV…" : "Selecciona la TV para reproducir el vídeo");
        }
        @Override public void onServiceLost(NsdServiceInfo service) {
            MAIN.post(() -> { if (!stopped) { devices.remove(service.getServiceName()); refresh(); } });
        }
        @Override public void onDiscoveryStarted(String type) { }
        @Override public void onDiscoveryStopped(String type) { }
        @Override public void onStartDiscoveryFailed(String type, int code) {
            MAIN.post(() -> { status.setText("La búsqueda Cast ha fallado (" + code + "). Cierra el selector y vuelve a intentarlo."); stop(); });
        }
        @Override public void onStopDiscoveryFailed(String type, int code) { }
    }

    private static void connect(Activity activity, Media media, Device device, Network network) {
        try {
            if (current != null) current.close();
            Controls next = new Controls(activity, media, device.name);
            URI source = new URI(media.url);
            boolean localHls = ("127.0.0.1".equals(source.getHost()) || "localhost".equalsIgnoreCase(source.getHost())) &&
                    media.url.toLowerCase(Locale.ROOT).contains(".m3u8");
            String wifiAddress = address(activity, network);
            CastSession session = new CastSession(localHls ? media.url : media.networkUrl(wifiAddress), media.title, media.position, next);
            if (localHls) session.useLocalRelay(wifiAddress, device.host);
            session.attachBackground(CastBackground.beginCast(activity, session));
            current = session;
            controls = next;
            next.session = session;
            next.show(activity);
            java.util.concurrent.ExecutorService connector = Executors.newSingleThreadExecutor();
            connector.execute(() -> {
                try {
                    Socket connection = new Socket();
                    network.bindSocket(connection);
                    connection.connect(new InetSocketAddress(device.host, device.port), 8000);
                    session.connect(connection, device.host.getHostAddress(), device.port);
                } catch (Exception error) {
                    session.close();
                    next.failed("No se pudo conectar con la TV. Comprueba que ambos dispositivos están en la misma red.");
                } finally { connector.shutdown(); }
            });
        } catch (Exception error) {
            Toast.makeText(activity, "No se pudo preparar el vídeo para la TV", Toast.LENGTH_LONG).show();
        }
    }

    private static final class Controls implements CastSession.Listener {
        final WeakReference<Activity> owner;
        final Media media;
        final String name;
        CastSession session;
        AlertDialog dialog;
        TextView status;
        SeekBar seek;
        SeekBar volume;
        double volumeLevel = 0.5;
        double position;
        double duration;
        boolean dragging;
        boolean localPaused;
        String state = "Conectando con la TV…";
        Controls(Activity activity, Media media, String name) {
            owner = new WeakReference<>(activity); this.media = media; this.name = name;
        }
        void show(Activity activity) {
            if (dialog != null && dialog.isShowing()) return;
            LinearLayout layout = column(activity);
            status = new TextView(activity);
            status.setText(state);
            layout.addView(status);
            seek = new SeekBar(activity);
            seek.setMax(1000);
            seek.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
                public void onStartTrackingTouch(SeekBar bar) { dragging = true; }
                public void onProgressChanged(SeekBar bar, int progress, boolean fromUser) { }
                public void onStopTrackingTouch(SeekBar bar) {
                    dragging = false;
                    if (duration > 0 && session.isActive()) session.seek(duration * bar.getProgress() / 1000.0);
                }
            });
            layout.addView(seek);
            TextView volumeTitle = new TextView(activity);
            volumeTitle.setText("Volumen de la TV");
            layout.addView(volumeTitle);
            volume = new SeekBar(activity);
            volume.setMax(100);
            volume.setProgress((int) (volumeLevel * 100));
            volume.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
                public void onStartTrackingTouch(SeekBar bar) { }
                public void onProgressChanged(SeekBar bar, int progress, boolean fromUser) { }
                public void onStopTrackingTouch(SeekBar bar) { if (session.isActive()) session.volume(bar.getProgress() / 100.0); }
            });
            layout.addView(volume);
            LinearLayout buttons = new LinearLayout(activity);
            button(activity, buttons, "Reproducir", () -> session.command("PLAY"));
            button(activity, buttons, "Pausar", () -> session.command("PAUSE"));
            layout.addView(buttons);
            Button diagnostics = new Button(activity);
            diagnostics.setText("Diagnóstico de carga");
            diagnostics.setOnClickListener(view -> diagnose(activity));
            layout.addView(diagnostics);
            dialog = new AlertDialog.Builder(activity).setTitle(name).setView(layout)
                    .setNegativeButton("Cerrar controles", null)
                    .setPositiveButton("Dejar de emitir", (d, which) -> { if (session.isActive()) session.stop(); }).create();
            dialog.setOnDismissListener(d -> { status = null; seek = null; volume = null; dialog = null; });
            dialog.show();
        }
        private void diagnose(Activity activity) {
            TextView message = new TextView(activity);
            message.setText("Comprobando la fuente desde el móvil…");
            message.setTextIsSelectable(true);
            LinearLayout layout = column(activity);
            layout.addView(message);
            AlertDialog reportDialog = new AlertDialog.Builder(activity).setTitle("Diagnóstico Cast · 0.3.0")
                    .setView(layout).setNegativeButton("Cerrar", null).setPositiveButton("Copiar informe", null).create();
            reportDialog.setOnShowListener(ignored -> reportDialog.getButton(AlertDialog.BUTTON_POSITIVE).setEnabled(false));
            reportDialog.show();
            java.util.concurrent.ExecutorService probe = Executors.newSingleThreadExecutor();
            probe.execute(() -> {
                String report;
                try {
                    URI parsed = new URI(media.url);
                    boolean local = "127.0.0.1".equals(parsed.getHost()) || "localhost".equalsIgnoreCase(parsed.getHost());
                    String wifiAddress = address(activity, wifi(activity));
                    String sent = media.networkUrl(wifiAddress);
                    String mime = media.url.toLowerCase(Locale.ROOT).contains(".m3u8") ? "HLS" : "MP4";
                    report = "Cast 0.3.0\nFuente: " + (local ? "motor local" : "remota") +
                            "; formato enviado: " + mime + "; inicio: " + (int) media.position + " s\n" +
                            "Respuesta TV: " + (state.contains("LOAD_FAILED") ? "LOAD_FAILED" : state.contains("no puede reproducir") ? "IDLE ERROR" : "otro estado") + "\n" +
                            CastDiagnostics.probe("Fuente original", media.url);
                    if (local && wifiAddress != null) report += "\n" + CastDiagnostics.probe("Dirección LAN enviada a TV", sent);
                    report += "\n" + session.relayReport();
                    report += "\n" + CastBackground.report();
                    report += "\nPruebas HTTP original/LAN desde el móvil. El contador del puente corresponde al receptor seleccionado. No se incluyen URL ni tokens.";
                } catch (Exception error) { report = "Cast 0.3.0: " + error.getClass().getSimpleName(); }
                final String result = report;
                MAIN.post(() -> {
                    if (activity.isFinishing() || activity.isDestroyed() || !reportDialog.isShowing()) return;
                    message.setText(result);
                    Button copy = reportDialog.getButton(AlertDialog.BUTTON_POSITIVE);
                    copy.setEnabled(true);
                    copy.setOnClickListener(view -> {
                        android.content.ClipboardManager clipboard = (android.content.ClipboardManager) activity.getSystemService(Context.CLIPBOARD_SERVICE);
                        clipboard.setPrimaryClip(android.content.ClipData.newPlainText("Diagnóstico Cast", result));
                        Toast.makeText(activity, "Informe copiado", Toast.LENGTH_SHORT).show();
                    });
                });
                probe.shutdown();
            });
        }
        public void changed(String newState, double newPosition, double newDuration) {
            MAIN.post(() -> {
                state = newState; position = newPosition; duration = newDuration;
                if (status != null) status.setText(state + (duration > 0 ? String.format(Locale.ROOT, " · %d:%02d / %d:%02d", (int) position / 60, (int) position % 60, (int) duration / 60, (int) duration % 60) : ""));
                if (seek != null && !dragging && duration > 0) seek.setProgress((int) (position * 1000 / duration));
                if (!localPaused && "Reproduciendo en la TV".equals(state) && media.player != null) {
                    try { LocalPlayback.pauseForCast(media.player); localPaused = true; } catch (Exception ignored) { }
                }
            });
        }
        public void failed(String message) {
            MAIN.post(() -> {
                state = message;
                if (status != null) status.setText(message);
                Activity activity = owner.get();
                if (activity != null && !activity.isFinishing()) Toast.makeText(activity, message, Toast.LENGTH_LONG).show();
            });
        }
        public void volumeChanged(double level) {
            MAIN.post(() -> { volumeLevel = level; if (volume != null) volume.setProgress((int) (level * 100)); });
        }
    }

    private static void showDlna(Activity activity) {
        try {
            String method = activity.getResources().getConfiguration().orientation == Configuration.ORIENTATION_LANDSCAPE ? "lunarDlnaLandscape" : "lunarDlnaPortrait";
            activity.getClass().getMethod(method).invoke(activity);
        } catch (Exception error) { Toast.makeText(activity, "No se pudo abrir el selector DLNA", Toast.LENGTH_LONG).show(); }
    }
    private static LinearLayout column(Context context) {
        LinearLayout result = new LinearLayout(context);
        result.setOrientation(LinearLayout.VERTICAL);
        int padding = dp(context, 16);
        result.setPadding(padding, padding, padding, padding);
        return result;
    }
    private static int dp(Context context, int value) { return (int) (value * context.getResources().getDisplayMetrics().density + 0.5f); }
    private static void button(Activity activity, LinearLayout row, String text, Runnable action) {
        Button button = new Button(activity);
        button.setText(text);
        button.setOnClickListener(view -> { if (current != null && current.isActive()) action.run(); });
        row.addView(button, new LinearLayout.LayoutParams(0, -2, 1));
    }
}
