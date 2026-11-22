package local.lunaredge.cast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.Closeable;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.security.GeneralSecurityException;
import java.security.cert.X509Certificate;
import java.util.UUID;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

/** Sesión de emisión al Default Media Receiver de dispositivos Cast. */
public final class CastSession implements Closeable {
    private static final String CONNECTION = "urn:x-cast:com.google.cast.tp.connection";
    private static final String HEARTBEAT = "urn:x-cast:com.google.cast.tp.heartbeat";
    private static final String RECEIVER = "urn:x-cast:com.google.cast.receiver";
    private static final String MEDIA = "urn:x-cast:com.google.cast.media";
    private static final String APP_ID = "CC1AD845";
    public interface Listener {
        void changed(String state, double position, double duration);
        void failed(String message);
        default void volumeChanged(double level) { }
    }

    private final Listener listener;
    private final String sender = "sender-lunar-" + UUID.randomUUID();
    private String url;
    private String relayAddress;
    private java.net.InetAddress relayReceiver;
    private volatile CastRelay relay;
    private final String title;
    private final double initialPosition;
    private final AtomicInteger request = new AtomicInteger();
    private final ScheduledExecutorService workers = Executors.newScheduledThreadPool(2);
    private volatile boolean closed;
    private volatile boolean loaded;
    private final long startedAt = System.currentTimeMillis();
    private volatile String lastState = "sin estado";
    private volatile String endCause = "ninguno";
    private volatile long lastMessage = System.currentTimeMillis();
    private volatile String transport;
    private volatile int mediaSession;
    private volatile double position;
    private volatile double duration;
    private String receiverSession;
    private boolean launchSent;
    private SSLSocket socket;
    private DataOutputStream output;
    private SessionLease background;

    public CastSession(String url, String title, double initialPosition, Listener listener) {
        this.url = url;
        this.title = title;
        this.initialPosition = initialPosition;
        this.listener = listener;
    }

    public boolean isActive() { return !closed; }
    public synchronized void attachBackground(SessionLease lease) {
        background = lease;
        if (closed) lease.close();
    }

    // Se configura en el hilo principal, pero el servidor solo se abre en el trabajador de conexión.
    public void useLocalRelay(String address, java.net.InetAddress receiver) {
        relayAddress = address;
        relayReceiver = receiver;
    }

    public String relayReport() {
        CastRelay current = relay;
        return "Sesión Cast: activa " + !closed + "; segundos " + (System.currentTimeMillis() - startedAt) / 1000 +
                "; reproducción confirmada " + loaded + "; estado " + lastState + "; cierre " + endCause + "\n" +
                (current == null ? "Puente CORS: no iniciado" : current.report());
    }

    public void connect(Socket connection, String host, int port) {
        workers.execute(() -> {
            try {
                if (relayAddress != null) synchronized (this) {
                    if (closed) throw new IOException("Sesión cerrada");
                    relay = new CastRelay(java.net.InetAddress.getByName(relayAddress), relayReceiver);
                    url = relay.url(url);
                }
                SSLContext context = SSLContext.getInstance("TLS");
                // Cast utiliza certificados autofirmados. Esta confianza se limita al socket LAN elegido.
                context.init(null, new TrustManager[]{new X509TrustManager() {
                    public void checkClientTrusted(X509Certificate[] chain, String auth) { }
                    public void checkServerTrusted(X509Certificate[] chain, String auth) { }
                    public X509Certificate[] getAcceptedIssuers() { return new X509Certificate[0]; }
                }}, null);
                socket = (SSLSocket) context.getSocketFactory().createSocket(connection, host, port, true);
                socket.setSoTimeout(40000);
                socket.startHandshake();
                output = new DataOutputStream(socket.getOutputStream());
                send("receiver-0", CONNECTION, object("type", "CONNECT", "origin", new JSONObject(), "userAgent", "LunarEdge"));
                send("receiver-0", RECEIVER, object("type", "GET_STATUS", "requestId", next()));
                workers.scheduleAtFixedRate(() -> {
                    try {
                        if (System.currentTimeMillis() - lastMessage > 40000) throw new IOException("La TV no responde");
                        send("receiver-0", HEARTBEAT, object("type", "PING"));
                        if (transport != null) send(transport, MEDIA, object("type", "GET_STATUS", "requestId", next()));
                    } catch (Exception error) { fail("Se ha perdido la conexión con la TV", "heartbeat_" + error.getClass().getSimpleName()); }
                }, 5, 5, TimeUnit.SECONDS);
                workers.schedule(() -> { if (!loaded) fail("La TV no ha podido abrir el vídeo. Comprueba la red y el formato.", "inicio_35s"); }, 35, TimeUnit.SECONDS);
                DataInputStream input = new DataInputStream(socket.getInputStream());
                while (!closed) handle(CastWire.read(input));
            } catch (Exception error) {
                try { connection.close(); } catch (IOException ignored) { }
                if (!closed) fail("No se pudo conectar con Google Cast: " + error.getClass().getSimpleName(), "conexion_" + error.getClass().getSimpleName());
            }
        });
    }

    private void handle(CastWire.Message envelope) throws IOException, JSONException {
        lastMessage = System.currentTimeMillis();
        if (envelope.payload.isEmpty()) return;
        JSONObject data = new JSONObject(envelope.payload);
        String type = data.optString("type");
        if (HEARTBEAT.equals(envelope.namespace) && "PING".equals(type)) {
            send(envelope.source, HEARTBEAT, object("type", "PONG"));
        } else if (RECEIVER.equals(envelope.namespace) && "RECEIVER_STATUS".equals(type)) {
            JSONObject receiverStatus = data.optJSONObject("status");
            if (receiverStatus == null) return;
            JSONObject volume = receiverStatus.optJSONObject("volume");
            if (volume != null) listener.volumeChanged(volume.optDouble("level", 1));
            JSONArray apps = receiverStatus.optJSONArray("applications");
            JSONObject found = null;
            if (apps != null) for (int i = 0; i < apps.length(); i++) {
                if (APP_ID.equals(apps.getJSONObject(i).optString("appId"))) found = apps.getJSONObject(i);
            }
            if (found == null) {
                if (!launchSent) {
                    launchSent = true;
                    listener.changed("Abriendo el reproductor de la TV…", 0, 0);
                    send("receiver-0", RECEIVER, object("type", "LAUNCH", "appId", APP_ID, "requestId", next()));
                }
            } else if (transport == null) {
                transport = found.getString("transportId");
                receiverSession = found.getString("sessionId");
                send(transport, CONNECTION, object("type", "CONNECT", "origin", new JSONObject()));
                JSONObject metadata = object("metadataType", 0, "title", title);
                String mime = relay != null || url.toLowerCase().contains(".m3u8") ? "application/x-mpegURL" : "video/mp4";
                JSONObject media = object("contentId", url, "streamType", "BUFFERED", "contentType", mime, "metadata", metadata);
                send(transport, MEDIA, object("type", "LOAD", "requestId", next(), "sessionId", receiverSession,
                        "autoplay", true, "currentTime", initialPosition, "media", media));
                listener.changed("Cargando vídeo en la TV…", initialPosition, 0);
            }
        } else if (MEDIA.equals(envelope.namespace) && "MEDIA_STATUS".equals(type)) {
            JSONArray states = data.optJSONArray("status");
            if (states == null || states.length() == 0) return;
            JSONObject status = states.getJSONObject(0);
            mediaSession = status.optInt("mediaSessionId", mediaSession);
            position = status.optDouble("currentTime", position);
            JSONObject media = status.optJSONObject("media");
            if (media != null) duration = media.optDouble("duration", duration);
            String state = status.optString("playerState");
            lastState = "PLAYING".equals(state) || "PAUSED".equals(state) || "BUFFERING".equals(state) || "IDLE".equals(state) ? state : "otro";
            if ("IDLE".equals(state) && "ERROR".equals(status.optString("idleReason"))) {
                fail("La TV no puede reproducir esta fuente de vídeo.", "media_error");
            } else {
                if ("PLAYING".equals(state) || "PAUSED".equals(state)) { loaded = true; CastBackground.castReady(this); }
                listener.changed("PLAYING".equals(state) ? "Reproduciendo en la TV" :
                        "PAUSED".equals(state) ? "En pausa" : "BUFFERING".equals(state) ? "Cargando…" : "Finalizado", position, duration);
                if ("IDLE".equals(state) && ("FINISHED".equals(status.optString("idleReason")) || "CANCELLED".equals(status.optString("idleReason")))) close();
            }
        } else if ("LAUNCH_ERROR".equals(type) || "LOAD_FAILED".equals(type) || "INVALID_REQUEST".equals(type)) {
            fail("La TV ha rechazado la reproducción (" + type + ", código " + data.optString("detailedErrorCode", data.optString("reason", data.optString("errorCode", "no indicado"))) + ").", type);
        } else if (CONNECTION.equals(envelope.namespace) && "CLOSE".equals(type)) {
            fail("La TV ha cerrado la sesión de emisión.", "receiver_close");
        }
    }

    public void command(String command) {
        workers.execute(() -> {
            try {
                if (transport != null && mediaSession != 0) send(transport, MEDIA,
                        object("type", command, "mediaSessionId", mediaSession, "requestId", next()));
            } catch (Exception error) { fail("No se pudo enviar el control a la TV", "control_error"); }
        });
    }

    public void seek(double seconds) {
        workers.execute(() -> {
            try {
                if (transport != null && mediaSession != 0) send(transport, MEDIA,
                        object("type", "SEEK", "mediaSessionId", mediaSession, "requestId", next(),
                                "currentTime", Math.max(0, seconds), "resumeState", "PLAYBACK_START"));
            } catch (Exception error) { fail("No se pudo cambiar la posición del vídeo", "seek_error"); }
        });
    }

    public void volume(double level) {
        if (closed) return;
        workers.execute(() -> {
            try {
                send("receiver-0", RECEIVER, object("type", "SET_VOLUME", "requestId", next(),
                        "volume", object("level", Math.max(0, Math.min(1, level)))));
            } catch (Exception error) { fail("No se pudo cambiar el volumen de la TV", "volume_error"); }
        });
    }

    public void stop() {
        endCause = "usuario_stop";
        workers.execute(() -> {
            try {
                if (receiverSession != null) send("receiver-0", RECEIVER,
                        object("type", "STOP", "sessionId", receiverSession, "requestId", next()));
            } catch (Exception ignored) { }
            close();
        });
    }

    private int next() { return request.incrementAndGet(); }
    private synchronized void send(String destination, String namespace, JSONObject data) throws IOException {
        if (closed || output == null) throw new IOException("Sesión Cast cerrada");
        CastWire.write(output, CastWire.encode(sender, destination, namespace, data.toString()));
    }
    private void fail(String message, String cause) { if (!closed) { endCause = cause; close(); listener.failed(message); } }
    @Override public synchronized void close() {
        closed = true;
        if ("ninguno".equals(endCause)) endCause = "cierre_local";
        if (relay != null) relay.close();
        if (background != null) background.close();
        workers.shutdownNow();
        try { if (socket != null) socket.close(); } catch (IOException ignored) { }
    }
    private static JSONObject object(Object... values) throws JSONException {
        JSONObject result = new JSONObject();
        for (int i = 0; i < values.length; i += 2) result.put((String) values[i], values[i + 1]);
        return result;
    }
}
