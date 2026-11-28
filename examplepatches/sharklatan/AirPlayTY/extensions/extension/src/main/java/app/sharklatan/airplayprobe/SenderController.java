package app.sharklatan.airplayprobe;

import android.app.Activity;
import android.app.AlertDialog;
import android.net.nsd.NsdManager;
import android.net.nsd.NsdServiceInfo;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.graphics.Color;
import android.view.View;
import android.view.WindowManager;
import android.widget.*;
import com.connectsdk.service.airplay.auth.AirPlayAuth;
import com.dd.plist.NSDictionary;
import com.dd.plist.PropertyListParser;
import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.*;

/** Independent sender probe. No Google APIs, YouTube hooks, or screen capture. */
public class SenderController extends android.content.ContextWrapper {
    protected final Activity host;
    protected android.app.Dialog sheet;
    public SenderController(Activity host){super(host);this.host=host;}
    protected android.view.Window getWindow(){return sheet.getWindow();}
    protected android.content.SharedPreferences getPreferences(int mode){return host.getSharedPreferences("app.sharklatan.youtube.airplay.AirPlayActivity",mode);}
    protected boolean isDestroyed(){return host.isDestroyed();}
    protected void finish(){sheet.dismiss();}
    protected void createUi(){throw new UnsupportedOperationException("Use YouTube's picker layouts");}

    private final Handler main = new Handler(Looper.getMainLooper());
    protected final ExecutorService worker = Executors.newSingleThreadExecutor();
    private final ExecutorService requests = Executors.newCachedThreadPool();
    private final String sessionId = UUID.randomUUID().toString();
    private final String mediaToken = UUID.randomUUID().toString();
    private NsdManager nsd;
    private NsdManager.DiscoveryListener discovery;
    private WifiManager.MulticastLock multicast;
    private final ArrayDeque<NsdServiceInfo> pending = new ArrayDeque<>();
    private final Set<String> known = new HashSet<>();
    private boolean resolving;
    private volatile boolean alive;
    protected ServerSocket mediaServer;
    private File clip;
    protected LinearLayout deviceList;
    protected TextView status, events;
    protected EditText hostInput, portInput, pinInput;
    private AirPlayAuth auth;
    private Socket authenticated;
    private String authTarget;
    private String selectedHost = "";
    private int selectedPort = 7000;
    private HapClient hap;
    private boolean hapReady, pairing, busy, pendingPlay;
    private boolean queueVideo;
    private final Map<String,Long> receiverFeatures = new HashMap<>();
    private final List<Button> actions = new ArrayList<>();

    public void onCreate(Bundle state) {
        getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
        createUi();
        alive = true;
        main.postDelayed(maintenance,2000);
        worker.execute(() -> {
            try {
                mediaServer = new ServerSocket(0);
                requests.execute(this::serve);
                log("Vídeo preparado. Servidor local listo.");
                main.post(this::discover);
            } catch (Exception e) { fail(e); }
        });
    }
    private TextView text(String value,int size) {
        TextView v = new TextView(this); v.setText(value); v.setTextSize(size); v.setTextColor(Color.WHITE); v.setPadding(0,8,0,8); return v;
    }
    private EditText field(LinearLayout parent,String hint,String value) {
        EditText e = new EditText(this); e.setHint(hint); e.setText(value); e.setSingleLine(true);
        e.setTextColor(Color.WHITE); e.setHintTextColor(0xffa8bbd0); parent.addView(e); return e;
    }
    protected void button(LinearLayout parent,String title,Runnable action) {
        Button b = new Button(this); b.setText(title); b.setAllCaps(false);
        b.setOnClickListener(v -> action.run()); parent.addView(b); actions.add(b);
    }
    protected void log(String message) {
        android.util.Log.i("AirPlayProbe",message);
        main.post(() -> {
            if(compactUi()) {
                if(message.contains("playbackState · playing")){status.setText("Reproduciendo en la TV");onRemotePlaying();}
                else if(message.contains("playbackState · paused")){status.setText("En pausa");onRemotePaused();}
                else if(message.startsWith("ERROR:"))status.setText("No se pudo enviar el vídeo: "+message.substring(6).trim());
                else if(message.startsWith("Buscando"))status.setText("Buscando televisiones…");
                else if(message.startsWith("AirPlay detectado"))status.setText("Selecciona tu televisión");
                else if(message.startsWith("Conectando"))status.setText("Conectando…");
                else if(message.contains("Autorización guardada")||message.startsWith("TV reconocida"))status.setText("Conectado. Preparando vídeo…");
                else if(message.startsWith("Sesión de vídeo cerrada"))status.setText("Desconectado");
            }else{status.setText(message);events.append(message+"\n");}
        });
        try (FileWriter out = new FileWriter(new File(getFilesDir(),"probe.log"),true)) { out.write(new Date()+" "+message+"\n"); }
        catch (IOException ignored) {}
    }
    private void fail(Exception e) { log("ERROR: " + e.getClass().getSimpleName()+": "+e.getMessage()); }
    protected interface Task { void run() throws Exception; }
    protected void runTask(String label,Task task) {
        if(busy || pairing) { log("Completa o cancela la conexión en curso."); return; }
        // Copy editable fields on the main thread before networking.
        selectedHost = hostInput.getText().toString().trim();
        try { selectedPort = Integer.parseInt(portInput.getText().toString().trim()); }
        catch (Exception e) { log("Puerto no válido."); return; }
        busy=true; for(Button b:actions)b.setEnabled(false);
        log(label); worker.execute(() -> { try { task.run(); } catch (Exception e) { fail(e); }
            finally { main.post(() -> {busy=false;for(Button b:actions)b.setEnabled(true);}); }
        });
    }
    protected void discover() {
        if (discovery != null) { log("La búsqueda AirPlay ya está activa."); return; }
        nsd = (NsdManager)getSystemService(NSD_SERVICE);
        multicast = ((WifiManager)getApplicationContext().getSystemService(WIFI_SERVICE)).createMulticastLock("AirPlayProbe");
        multicast.setReferenceCounted(false); multicast.acquire();
        discovery = new NsdManager.DiscoveryListener() {
            public void onDiscoveryStarted(String t) { log("Buscando receptores AirPlay en esta red…"); }
            public void onServiceFound(NsdServiceInfo s) {
                main.post(() -> { if (known.add(s.getServiceName())) { pending.add(s); resolveNext(); } });
            }
            public void onServiceLost(NsdServiceInfo s) { log("Receptor dejó de anunciarse: "+s.getServiceName()); }
            public void onDiscoveryStopped(String t) {}
            public void onStartDiscoveryFailed(String t,int code) { log("No se pudo iniciar descubrimiento: "+code); }
            public void onStopDiscoveryFailed(String t,int code) {}
        };
        nsd.discoverServices("_airplay._tcp.",NsdManager.PROTOCOL_DNS_SD,discovery);
    }
    private void resolveNext() {
        if (resolving || pending.isEmpty()) return;
        resolving = true; NsdServiceInfo service = pending.remove();
        nsd.resolveService(service,new NsdManager.ResolveListener() {
            public void onResolveFailed(NsdServiceInfo s,int error) {
                main.post(() -> { resolving=false; log("No se pudo resolver "+s.getServiceName()+": "+error); resolveNext(); });
            }
            public void onServiceResolved(NsdServiceInfo s) {
                main.post(() -> {
                    resolving=false;
                    String address = s.getHost().getHostAddress();
                    byte[] features=s.getAttributes().get("features");
                    if(features!=null)try {
                        String[] parts=new String(features,StandardCharsets.UTF_8).split(",");
                        long flags=Long.decode(parts[0].trim());
                        if(parts.length>1)flags|=Long.decode(parts[1].trim())<<32;
                        receiverFeatures.put(address+":"+s.getPort(),flags);
                    }catch(Exception ignored) {}
                    log("AirPlay detectado: "+s.getServiceName()+" · "+address+":"+s.getPort());
                    button(deviceList,s.getServiceName()+" · "+address,() -> {
                        hostInput.setText(address); portInput.setText(Integer.toString(s.getPort()));
                        runTask("Conectando: "+s.getServiceName(),() -> connectAndPlay(true));
                    });
                    resolveNext();
                });
            }
        });
    }
    private void selectTarget() throws IOException {
        if (selectedHost.isEmpty() || selectedPort<1 || selectedPort>65535) throw new IOException("Selecciona primero la TV AirPlay.");
        getPreferences(MODE_PRIVATE).edit().putString("last-host",selectedHost).putString("last-port",Integer.toString(selectedPort)).apply();
    }
    private AirPlayAuth authentication() throws Exception {
        String key = selectedHost+":"+selectedPort;
        String token = getPreferences(MODE_PRIVATE).getString(key,null);
        if (token == null) {
            token = AirPlayAuth.generateNewAuthToken();
            getPreferences(MODE_PRIVATE).edit().putString(key,token).apply();
        }
        authTarget=key;
        return new AirPlayAuth(new InetSocketAddress(selectedHost,selectedPort),token);
    }
    private String target() { return selectedHost+":"+selectedPort; }
    protected void closeAuth() throws Exception {
        onDisconnected();
        if(hap!=null)hap.close();hap=null;hapReady=false;
        if(authenticated!=null)authenticated.close();authenticated=null;auth=null;
    }
    protected void connectAndPlay(boolean send) throws Exception {
        selectTarget();pendingPlay=send;
        if((hapReady&&(hap==null||!hap.alive()))||!target().equals(authTarget))closeAuth();
        authTarget=target();
        if(hapReady || authenticated!=null) {if(send)play();return;}
        long advertised=receiverFeatures.containsKey(target())?receiverFeatures.get(target()):0;
        queueVideo=(advertised & (1L<<49))!=0 && (advertised & 1)==0;
        String saved=getPreferences(MODE_PRIVATE).getString("hap:"+target(),null);
        if(saved!=null) {
            try {
                hap=newSessionClient();watchSession(hap);hap.credentials(saved);hap.verifyConnection();hapReady=true;
            }catch(Exception e){log("Autorización guardada no verificable: "+e.getMessage());closeAuth();}
            if(hapReady) {
                log("TV reconocida. Conexión AirPlay autorizada.");
                if(send)play();return;
            }
        }
        long flags=receiverFeatures.containsKey(target())?receiverFeatures.get(target()):0;
        if(flags==0)try {
            HapClient probe=new HapClient(selectedHost,selectedPort,this::log);
            try {
                NSDictionary info=(NSDictionary)PropertyListParser.parse(probe.request("GET","/info",null,"application/octet-stream").body);
                Object f=info.objectForKey("features");if(f!=null)flags=Long.parseLong(f.toString());
            }finally{probe.close();}
        }catch(Exception e){log("Capacidades /info no disponibles: "+e.getMessage());}
        boolean modern=(flags & ((1L<<43)|(1L<<48)))!=0;
        queueVideo=(flags & (1L<<49))!=0 && (flags & 1)==0;
        if(modern) {
            log("Receptor anuncia emparejamiento AirPlay moderno (HAP).");
            hap=newSessionClient();watchSession(hap);hap.start();
        }else {
            if(send)try{play();return;}catch(AuthorizationRequired e){}
            auth=authentication();
            if(getPreferences(MODE_PRIVATE).getBoolean("legacy-paired:"+target(),false)) {
                try {authenticated=auth.authenticate();}
                catch(Exception e){log("Se necesita renovar la autorización antigua: "+e.getMessage());if(authenticated!=null)authenticated.close();authenticated=null;}
                if(authenticated!=null){if(send)play();return;}
            }
            log("Solicitando autorización AirPlay antigua.");auth.startPairing();
        }
        pairing=true;main.post(this::showPin);
    }
    private void showPin() {
        EditText code=new EditText(this);code.setHint("Código de la televisión");
        code.setInputType(android.text.InputType.TYPE_CLASS_PHONE);
        AlertDialog dialog=new AlertDialog.Builder(this).setTitle("Conectar con la TV")
            .setMessage("Introduce el código de la televisión. El vídeo se enviará automáticamente.")
            .setView(code).setPositiveButton("Conectar",null).setNegativeButton("Cancelar",(d,w) -> cancelPairing()).create();
        dialog.setCanceledOnTouchOutside(false);dialog.setOnCancelListener(d -> cancelPairing());
        dialog.setOnShowListener(d -> dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v -> {
            String value=code.getText().toString().replaceAll("[\\s-]", "");
            if(!value.matches("[0-9]{4,8}")){code.setError("Escribe el código de 4 a 8 cifras.");return;}
            dialog.getButton(AlertDialog.BUTTON_POSITIVE).setEnabled(false);
            dialog.getButton(AlertDialog.BUTTON_NEGATIVE).setEnabled(false);dialog.setCancelable(false);
            worker.execute(() -> {
                try {
                    if(hap!=null) {
                        hap.finish(value);
                        getPreferences(MODE_PRIVATE).edit().putString("hap:"+target(),hap.credentials()).apply();
                        hap.verifyConnection();hapReady=true;
                    }else{auth.doPairing(value);authenticated=auth.authenticate();
                        getPreferences(MODE_PRIVATE).edit().putBoolean("legacy-paired:"+target(),true).apply();}
                }catch(Exception e){fail(e);try{closeAuth();}catch(Exception ignored){}
                    log("No se completó la autorización de la TV.");
                }
                if(hapReady || authenticated!=null) {
                    log("TV emparejada. Autorización guardada.");
                    if(pendingPlay)try{play();}catch(Exception e){fail(e);log("Falló el envío del vídeo. El emparejamiento se conserva; no hace falta otro código.");}
                }
                main.post(() -> {pairing=false;dialog.dismiss();});
            });
        }));
        dialog.show();code.requestFocus();dialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_VISIBLE);
    }
    private void cancelPairing() {
        pairing=false;pendingPlay=false;
        worker.execute(() -> {try{closeAuth();}catch(Exception ignored){}log("Conexión cancelada.");});
    }
    private static class AuthorizationRequired extends IOException {}
    private void play() throws Exception {
        selectTarget();
        String localAddress;
        try (Socket probe = new Socket()) {
            probe.connect(new InetSocketAddress(selectedHost,selectedPort),5000);
            localAddress=probe.getLocalAddress().getHostAddress();
        }
        prepareMedia();
        String url=mediaUrl(localAddress);
        if(hapReady && queueVideo) {
            hap.playQueue(url,positionOverride>=0?positionOverride:mediaPositionSeconds(),nativePlaybackRunning()?1.0:0.0);
            log("TV aceptó la cola de vídeo AirPlay V2. Esperando descarga y estado de reproducción.");
            return;
        }
        NSDictionary body = new NSDictionary(); body.put("Content-Location",url); body.put("Start-Position",mediaPositionSeconds());
        if(hapReady) {
            hap.setupVideo();
            body.put("Start-Position-Seconds",mediaPositionSeconds());body.put("uuid",sessionId);
            body.put("streamType",1);body.put("mediaType","file");body.put("rate",1.0);body.put("volume",1.0);
            body.put("clientBundleID","app.sharklatan.airplayprobe");body.put("clientProcName","AirPlay Probe");
        }
        ByteArrayOutputStream bytes = new ByteArrayOutputStream(); PropertyListParser.saveAsBinary(body,bytes);
        command("POST","/play",bytes.toByteArray());
        if(hapReady)command("POST","/rate?value=1.000000",null);
        log("TV aceptó /play. Falta confirmar imagen y sonido; HTTP 200 no demuestra reproducción.");
        main.postDelayed(() -> runTask("Comprobando estado…",this::playbackInfo),4000);
    }
    private void playbackInfo() throws Exception {
        if(hapReady && queueVideo) {log("Último estado de la TV: "+hap.events.playbackState);return;}
        Response response = command("GET","/playback-info",null);
        String text = new String(response.body,StandardCharsets.UTF_8);
        if (text.length()>1600) text=text.substring(0,1600);
        log("Estado de la TV: "+text);
    }
    private static class Response { int status; byte[] body; }
    private Response command(String method,String path,byte[] body) throws Exception {
        selectTarget();
        if(hapReady && queueVideo) {
            if(path.startsWith("/rate?")){hap.rate(path.contains("=0.")?0.0:1.0);Response result=new Response();result.status=200;result.body=new byte[0];return result;}
            if(path.equals("/stop")){closeAuth();log("Sesión de vídeo cerrada. Identidad de emparejamiento conservada.");Response result=new Response();result.status=200;result.body=new byte[0];return result;}
        }
        if(hapReady) {
            HapClient.Reply result=hap.request(method,path,body,"application/x-apple-binary-plist");
            Response response=new Response();response.status=result.status;response.body=result.body;return response;
        }
        boolean paired=authenticated!=null && !authenticated.isClosed() && (selectedHost+":"+selectedPort).equals(authTarget);
        Socket socket = paired ? authenticated : new Socket();
        try {
            if (!paired) socket.connect(new InetSocketAddress(selectedHost,selectedPort),5000);
            socket.setSoTimeout(12000);
            OutputStream output=socket.getOutputStream();
            String header=method+" "+path+" HTTP/1.1\r\nHost: "+selectedHost+":"+selectedPort+"\r\nUser-Agent: AirPlay/320.20\r\nX-Apple-Session-ID: "+sessionId+"\r\nContent-Type: application/x-apple-binary-plist\r\nContent-Length: "+(body==null?0:body.length)+"\r\nConnection: "+(paired?"keep-alive":"close")+"\r\n\r\n";
            output.write(header.getBytes(StandardCharsets.US_ASCII)); if(body!=null)output.write(body); output.flush();
            InputStream input=socket.getInputStream(); String first=line(input);
            if (first==null) throw new IOException("La TV cerró la conexión sin respuesta.");
            Response response=new Response(); response.status=Integer.parseInt(first.split(" ")[1]);
            int size=0; String h;
            while((h=line(input))!=null && !h.isEmpty()) if(h.toLowerCase(Locale.ROOT).startsWith("content-length:"))size=Integer.parseInt(h.substring(h.indexOf(':')+1).trim());
            if(size>1024*1024)throw new IOException("Respuesta demasiado grande.");
            ByteArrayOutputStream received=new ByteArrayOutputStream(); copy(input,received,size); response.body=received.toByteArray();
            log(method+" "+path+" → HTTP "+response.status);
            if(response.status==401 || response.status==403)throw new AuthorizationRequired();
            if(response.status<200 || response.status>=300)throw new IOException("La TV devolvió HTTP "+response.status+". Compatibilidad del protocolo pendiente.");
            return response;
        } finally { if(!paired)socket.close(); }
    }
    private static String line(InputStream input) throws IOException {
        ByteArrayOutputStream bytes=new ByteArrayOutputStream(); int b;
        while((b=input.read())!=-1) { if(b=='\n')break; if(b!='\r')bytes.write(b); if(bytes.size()>16384)throw new IOException("Cabecera demasiado larga."); }
        return b==-1 && bytes.size()==0 ? null : bytes.toString("UTF-8");
    }
    private static void copy(InputStream in,OutputStream out,long count) throws IOException {
        byte[] buffer=new byte[32768];
        while(count>0) { int n=in.read(buffer,0,(int)Math.min(buffer.length,count)); if(n<0)break; out.write(buffer,0,n);count-=n; }
    }
    private void serve() {
        while(alive)try { Socket peer=mediaServer.accept();requests.execute(() -> serveVideo(peer)); }
        catch(IOException e) { if(alive)fail(e); }
    }
    protected String screenTitle(){return "AirPlay · Prueba";}
    protected boolean compactUi(){return false;}
    protected void closePicker(){finish();}
    protected double mediaPositionSeconds(){return 0.0;}
    protected void onRemotePlaying(){}
    protected void onRemotePaused(){}
    protected void onDisconnected(){}
    protected final boolean remoteConnected(){return hapReady?(hap!=null&&hap.alive()):authenticated!=null&&!authenticated.isClosed();}
    /** One scheduled task, using the same worker as commands; never races encrypted counters. */
    private volatile long sessionEpoch;
    protected final long remoteEpoch(){return sessionEpoch;}
    private HapClient newSessionClient(){
        final long epoch=++sessionEpoch;
        return new HapClient(selectedHost,selectedPort,new HapClient.Reporter(){
            public void log(String message){if(epoch==sessionEpoch)SenderController.this.log(message);}
            public void playback(double position,double duration,double rate,boolean ready,boolean waiting){
                main.post(()->{if(epoch==sessionEpoch&&remoteConnected())onRemoteProgress(epoch,position,duration,rate,ready,waiting);});
            }
        });
    }
    protected void onRemoteProgress(long epoch,double position,double duration,double rate,boolean ready,boolean waiting){}
    protected final void tryRemoteSeek(double position){long revision=seekRevision.incrementAndGet();worker.execute(()->{try{if(revision==seekRevision.get()&&hapReady&&hap!=null){hap.rate(0);hap.seek(position);hap.pollInfo();}}catch(Exception e){log("Búsqueda directa: "+e.getMessage());}});}
    private void watchSession(final HapClient session){
        session.onSessionLost=()->{
            if(!alive)return;
            worker.execute(()->{
                if(hap!=session||!hapReady)return;
                try{closeAuth();}catch(Exception ignored){}
                log("Sesión de vídeo cerrada. Reproducción local restaurada; selecciona la TV para reconectar.");
            });
        };
    }
    private HapClient maintenanceSession;
    private int maintenanceRejections;
    private final Runnable maintenance=new Runnable(){public void run(){
        if(!alive)return;
        worker.execute(()->{
            HapClient current=hap;
            if(current!=maintenanceSession){maintenanceSession=current;maintenanceRejections=0;}
            try{
                if(hapReady&&current!=null){
                    if(!current.alive())throw new IOException("El receptor cerró la sesión AirPlay.");
                    current.feedback();current.pollInfo();
                    maintenanceRejections=0;
                    log("Mantenimiento AirPlay confirmado.");
                }
            }catch(Exception e){
                // A failed old session must not invalidate a new session created after it.
                boolean close=true;
                if(e instanceof HapClient.HttpError){
                    log("El receptor rechazó el mantenimiento: "+e.getMessage());
                    close=++maintenanceRejections>=3;
                }
                if(close&&current!=null&&hap==current){
                    try{closeAuth();}catch(Exception ignored){}
                    log("Sesión de vídeo cerrada. Vuelve a seleccionar la TV para reconectar.");
                }
            }finally{if(alive)main.postDelayed(this,2000);}
        });
    }};
    protected volatile double positionOverride=-1;
    private final java.util.concurrent.atomic.AtomicLong seekRevision=new java.util.concurrent.atomic.AtomicLong();
    protected final void remoteSeek(double position){
        long revision=seekRevision.incrementAndGet();
        worker.execute(()->{try{
            if(revision!=seekRevision.get())return;
            if(hapReady&&queueVideo){
                log("Reposicionando por reapertura en "+Math.round(position)+" s.");
                positionOverride=Math.max(0,position);
                try{if(hap!=null)hap.close();hap=null;hapReady=false;connectAndPlay(true);}
                finally{positionOverride=-1;}
            }else if(remoteConnected())command("POST","/scrub?position="+Math.max(0,position),null);
        }catch(Exception e){fail(e);}});
    }
    protected boolean nativePlaybackRunning(){return true;}
    protected final void remoteRate(boolean playing){worker.execute(()->{try{if(remoteConnected())command("POST","/rate?value="+(playing?"1.000000":"0.000000"),null);}catch(Exception e){fail(e);}});}
    protected void onRemoteVolume(long revision,double ratio){}
    private final java.util.concurrent.atomic.AtomicLong volumeCommandRevision=new java.util.concurrent.atomic.AtomicLong();
    protected final void remoteVolume(double ratio,long userRevision){
        final long commandRevision=volumeCommandRevision.incrementAndGet();
        worker.execute(()->{try{
            if(!hapReady||commandRevision!=volumeCommandRevision.get())return;
            if(!Double.isNaN(ratio))log("Volumen solicitado a TV: "+Math.round(ratio*100)+"% (orden "+commandRevision+").");
            double actual=Double.isNaN(ratio)?hap.volume():hap.volume(ratio);
            main.post(()->{if(commandRevision==volumeCommandRevision.get())onRemoteVolume(userRevision,actual);});
        }catch(Exception e){log("Control de volumen remoto: "+e.getMessage());}});
    }
    protected final void remoteInfo(){worker.execute(()->{try{if(hapReady)hap.pollInfo();}catch(Exception e){log("Consulta TV: "+e.getMessage());}});}
    protected final void remoteChangeMedia(){worker.execute(()->{try{if(remoteConnected()){remoteSeek(mediaPositionSeconds());}}catch(Exception e){fail(e);}});}
    protected void addMediaOptions(LinearLayout root){}
    protected String mediaDescription(){return "Vídeo local de 30 segundos · 720p · H.264 + AAC\nConexión automática · AirPlay antiguo y moderno en pruebas.";}
    protected String sendLabel(){return "Enviar vídeo de prueba";}
    protected String mediaUrl(String localAddress){return "http://"+localAddress+":"+mediaServer.getLocalPort()+"/"+mediaToken+"/test.mp4";}
    protected void prepareMedia() throws Exception {
        clip=new File(getFilesDir(),"test.mp4");
        try(InputStream in=getAssets().open("test.mp4");OutputStream out=new FileOutputStream(clip)){copy(in,out,Long.MAX_VALUE);}
    }
    protected void serveVideo(Socket peer) {
        try(Socket socket=peer) {
            socket.setSoTimeout(15000); InputStream in=socket.getInputStream(); String first=line(in);
            if(first==null)return; String[] request=first.split(" "); if(request.length<2)return;
            long start=0,end=clip.length()-1;boolean range=false;String h;
            while((h=line(in))!=null&&!h.isEmpty()) {
                if(h.toLowerCase(Locale.ROOT).startsWith("range: bytes=")) {
                    range=true;String[] limits=h.substring(13).trim().split("-",-1);
                    start=Long.parseLong(limits[0]); if(limits.length>1&&!limits[1].isEmpty())end=Math.min(end,Long.parseLong(limits[1]));
                }
            }
            OutputStream out=socket.getOutputStream();
            if(!request[1].equals("/"+mediaToken+"/test.mp4")) { out.write("HTTP/1.1 404 Not Found\r\nContent-Length: 0\r\n\r\n".getBytes(StandardCharsets.US_ASCII));return; }
            if(start<0||start>end||start>=clip.length()) { out.write(("HTTP/1.1 416 Range Not Satisfiable\r\nContent-Range: bytes */"+clip.length()+"\r\nContent-Length: 0\r\n\r\n").getBytes(StandardCharsets.US_ASCII));return; }
            String head="HTTP/1.1 "+(range?"206 Partial Content":"200 OK")+"\r\nContent-Type: video/mp4\r\nAccept-Ranges: bytes\r\nContent-Length: "+(end-start+1)+"\r\n"+(range?"Content-Range: bytes "+start+"-"+end+"/"+clip.length()+"\r\n":"")+"Connection: close\r\n\r\n";
            out.write(head.getBytes(StandardCharsets.US_ASCII));out.flush();
            log("TV solicitó vídeo: "+request[0]+" · bytes "+start+"–"+end+" · "+socket.getInetAddress().getHostAddress());
            if(!request[0].equals("HEAD"))try(FileInputStream file=new FileInputStream(clip)) { file.getChannel().position(start);copy(file,out,end-start+1);out.flush(); }
        } catch(Exception e) { log("Petición de vídeo terminada: "+e.getMessage()); }
    }
    public void onDestroy() {
        alive=false;
        try { if(discovery!=null)nsd.stopServiceDiscovery(discovery); } catch(Exception ignored) {}
        try { if(multicast!=null&&multicast.isHeld())multicast.release(); } catch(Exception ignored) {}
        try { if(mediaServer!=null)mediaServer.close();if(authenticated!=null)authenticated.close();if(hap!=null)hap.close(); } catch(Exception ignored) {}
        worker.shutdownNow();requests.shutdownNow();
    }
}
