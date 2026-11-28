package app.sharklatan.airplayprobe;

import java.io.*;
import java.net.*;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicLong;
import javax.crypto.*;
import javax.crypto.spec.*;
import com.nimbusds.srp6.SRP6CryptoParams;
import com.connectsdk.service.airplay.auth.crypt.Curve25519;
import net.i2p.crypto.eddsa.*;
import net.i2p.crypto.eddsa.spec.*;
import com.dd.plist.*;

/** HAP pairing and encrypted control transport. Wire sequence follows pyatv's
 * AirPlay HAP implementation; cryptographic responses are verified locally. */
final class HapClient implements Closeable {
    interface Reporter { void log(String value); default void playback(double position,double duration,double rate,boolean ready,boolean waiting){} }
    static final class HttpError extends IOException {
        final int status;
        HttpError(String path,int status) { super(path+" → HTTP "+status); this.status=status; }
    }
    static final class Reply { int status; byte[] body; }
    final String host; final int port; final Reporter reporter;
    Socket socket; InputStream input; OutputStream output;
    byte[] salt, serverPublic, seed, clientId, receiverId, receiverKey;
    byte[] writeKey, readKey; long writeCounter,readCounter;
    byte[] sharedSecret;
    final String sessionId=UUID.randomUUID().toString();
    int cseq;
    DatagramSocket timing;
    HapClient events;
    HapClient controlOwner;
    final Map<String,CompletableFuture<NSDictionary>> commandReplies=new ConcurrentHashMap<>();
    final AtomicLong commandSequence=new AtomicLong();
    private volatile boolean closed;
    volatile boolean sessionLost;
    Runnable onSessionLost;
    boolean alive(){return !closed&&!sessionLost&&socket!=null&&!socket.isClosed();}
    void feedback()throws Exception{request("POST","/feedback",null,"application/x-apple-binary-plist","RTSP/1.0");}
    boolean videoSetup;
    String videoStream;
    volatile String playbackState="Sin reproducción confirmada";
    final SecureRandom random=new SecureRandom();
    HapClient(String host,int port,Reporter reporter) { this.host=host;this.port=port;this.reporter=reporter; }
    void connect() throws IOException {
        if(socket!=null&&!socket.isClosed())return;
        socket=new Socket();socket.connect(new InetSocketAddress(host,port),5000);socket.setSoTimeout(12000);
        input=socket.getInputStream();output=socket.getOutputStream();
    }
    Reply request(String method,String path,byte[] body,String type) throws Exception {
        return request(method,path,body,type,"HTTP/1.1");
    }
    Reply request(String method,String path,byte[] body,String type,String protocol) throws Exception {
        connect(); if(body==null)body=new byte[0];
        String streamHeader=path.equals("/command")&&videoStream!=null?"X-Apple-StreamID: "+videoStream+"\r\n":"";
        byte[] head=(method+" "+path+" "+protocol+"\r\nHost: "+host+":"+port+"\r\nUser-Agent: AirPlay/550.10\r\nX-Apple-HKP: 3\r\nX-Apple-Session-ID: "+sessionId+"\r\nX-Apple-ProtocolVersion: 1\r\nX-Apple-Stream-ID: 1\r\n"+streamHeader+"CSeq: "+(cseq++)+"\r\nDACP-ID: 0A0B0C0D0E0F1234\r\nClient-Instance: 0A0B0C0D0E0F1234\r\nActive-Remote: 123456789\r\nConnection: keep-alive\r\nContent-Type: "+type+"\r\nContent-Length: "+body.length+"\r\n\r\n").getBytes(StandardCharsets.US_ASCII);
        byte[] raw=join(head,body);
        if(writeKey==null)output.write(raw);
        else for(int offset=0;offset<raw.length;offset+=1024) {
            byte[] frame=Arrays.copyOfRange(raw,offset,Math.min(raw.length,offset+1024));
            byte[] len={(byte)frame.length,(byte)(frame.length>>8)};
            output.write(len);output.write(cipher(true,writeKey,nonce(writeCounter++),len,frame));
        }
        output.flush();
        InputStream source=readKey==null?input:new FrameInput();
        String first=line(source);if(first==null)throw new EOFException("La TV cerró la conexión.");
        Reply reply=new Reply();reply.status=Integer.parseInt(first.split(" ")[1]);
        int length=0;String header;
        while((header=line(source))!=null&&!header.isEmpty()) {
            if(header.toLowerCase(Locale.ROOT).startsWith("content-length:"))length=Integer.parseInt(header.substring(15).trim());
            if(header.toLowerCase(Locale.ROOT).startsWith("transfer-encoding:"))throw new IOException("Transferencia HTTP no compatible: "+header);
        }
        if(length<0||length>1048576)throw new IOException("Tamaño HTTP no válido.");
        reply.body=read(source,length);reporter.log(method+" "+path+" → HTTP "+reply.status);
        if(reply.status<200||reply.status>=300)throw new HttpError(path,reply.status);
        return reply;
    }
    void start() throws Exception {
        seed=new byte[32];random.nextBytes(seed);clientId=bytes(UUID.randomUUID().toString());
        request("POST","/pair-pin-start",null,"application/octet-stream");
        Map<Integer,byte[]> m=exchange("/pair-setup",2,tlv(0,new byte[]{0},6,new byte[]{1}));
        salt=required(m,2);serverPublic=required(m,3);
    }
    void finish(String pin) throws Exception {
        if(salt==null)throw new IOException("Selecciona la TV para solicitar un código nuevo.");
        byte[][] srp=srp(salt,serverPublic,pin,new BigInteger(256,random));
        byte[] pub=srp[0],proof=srp[1],key=srp[2];
        Map<Integer,byte[]> m=exchange("/pair-setup",4,tlv(6,new byte[]{3},3,pub,4,proof));
        if(!MessageDigest.isEqual(required(m,4),hash(pub,proof,key)))throw new IOException("La prueba criptográfica SRP de la TV no coincide.");
        byte[] publicKey=publicKey();
        byte[] signature=sign(join(hkdf(key,"Pair-Setup-Controller-Sign-Salt","Pair-Setup-Controller-Sign-Info"),clientId,publicKey));
        byte[] encryption=hkdf(key,"Pair-Setup-Encrypt-Salt","Pair-Setup-Encrypt-Info");
        m=exchange("/pair-setup",6,tlv(6,new byte[]{5},5,cipher(true,encryption,namedNonce("PS-Msg05"),null,tlv(1,clientId,3,publicKey,10,signature))));
        m=parse(cipher(false,encryption,namedNonce("PS-Msg06"),null,required(m,5)));
        byte[] id=required(m,1),pk=required(m,3);
        verify(pk,join(hkdf(key,"Pair-Setup-Accessory-Sign-Salt","Pair-Setup-Accessory-Sign-Info"),id,pk),required(m,10));
        receiverId=id;receiverKey=pk;
    }
    static byte[][] srp(byte[] salt,byte[] serverPublic,String pin,BigInteger a) throws Exception {
        BigInteger n=SRP6CryptoParams.N_3072,g=BigInteger.valueOf(5),b=integer(serverPublic);
        if(b.mod(n).signum()==0)throw new IOException("Clave SRP del receptor no válida.");
        BigInteger pub=g.modPow(a,n);
        BigInteger k=integer(hash(pad(n),pad(g)));
        BigInteger x=integer(hash(salt,hash(bytes("Pair-Setup:"+pin))));
        BigInteger u=integer(hash(pad(pub),pad(b)));
        if(u.signum()==0)throw new IOException("Parámetro SRP no válido.");
        BigInteger secret=b.subtract(k.multiply(g.modPow(x,n))).mod(n).modPow(a.add(u.multiply(x)),n);
        byte[] key=hash(unsigned(secret));
        byte[] xor=hash(unsigned(n)),hg=hash(unsigned(g));for(int i=0;i<xor.length;i++)xor[i]^=hg[i];
        byte[] proof=hash(unsigned(integer(xor)),hash(bytes("Pair-Setup")),salt,unsigned(pub),unsigned(b),key);
        return new byte[][]{unsigned(pub),proof,key};
    }
    void verifyConnection() throws Exception {
        byte[] secret=new byte[32],pub=new byte[32];random.nextBytes(secret);Curve25519.keygen(pub,null,secret);
        Map<Integer,byte[]> m=exchange("/pair-verify",2,tlv(6,new byte[]{1},3,pub));
        byte[] peer=required(m,3);if(peer.length!=32)throw new IOException("Clave efímera no válida.");
        byte[] shared=new byte[32];Curve25519.curve(shared,secret,peer);
        if(MessageDigest.isEqual(shared,new byte[32]))throw new IOException("Secreto efímero no válido.");
        byte[] key=hkdf(shared,"Pair-Verify-Encrypt-Salt","Pair-Verify-Encrypt-Info");
        m=parse(cipher(false,key,namedNonce("PV-Msg02"),null,required(m,5)));
        if(!MessageDigest.isEqual(receiverId,required(m,1)))throw new IOException("La identidad de la TV cambió.");
        verify(receiverKey,join(peer,receiverId,pub),required(m,10));
        exchange("/pair-verify",4,tlv(6,new byte[]{3},5,cipher(true,key,namedNonce("PV-Msg03"),null,tlv(1,clientId,10,sign(join(pub,clientId,peer))))));
        writeKey=hkdf(shared,"Control-Salt","Control-Write-Encryption-Key");readKey=hkdf(shared,"Control-Salt","Control-Read-Encryption-Key");
        sharedSecret=shared;
        writeCounter=readCounter=0;
    }
    String credentials() { return hex(seed)+":"+hex(clientId)+":"+hex(receiverId)+":"+hex(receiverKey); }
    void credentials(String value) throws IOException {
        String[] p=value.split(":");if(p.length!=4)throw new IOException("Credenciales incompletas.");
        seed=unhex(p[0]);clientId=unhex(p[1]);receiverId=unhex(p[2]);receiverKey=unhex(p[3]);
        if(seed.length!=32||receiverKey.length!=32)throw new IOException("Credenciales no válidas.");
    }
    Map<Integer,byte[]> exchange(String path,int state,byte[] data) throws Exception {
        Map<Integer,byte[]> m=parse(request("POST",path,data,"application/octet-stream").body);
        if(m.containsKey(7))throw new IOException("AirPlay "+path+" etapa "+state+": error de emparejamiento "+(m.get(7)[0]&255)+". No se reenviará el código automáticamente.");
        byte[] s=required(m,6);if(s.length!=1||s[0]!=state)throw new IOException("Estado HAP inesperado en "+path+" (esperado "+state+").");return m;
    }
    private byte[] publicKey() { return new EdDSAPrivateKey(new EdDSAPrivateKeySpec(seed,EdDSANamedCurveTable.getByName("Ed25519"))).getAbyte(); }
    private byte[] sign(byte[] data) throws Exception {
        EdDSAEngine e=new EdDSAEngine();e.initSign(new EdDSAPrivateKey(new EdDSAPrivateKeySpec(seed,EdDSANamedCurveTable.getByName("Ed25519"))));return e.signOneShot(data);
    }
    private static void verify(byte[] key,byte[] data,byte[] signature) throws Exception {
        EdDSAEngine e=new EdDSAEngine();e.initVerify(new EdDSAPublicKey(new EdDSAPublicKeySpec(key,EdDSANamedCurveTable.getByName("Ed25519"))));
        if(!e.verifyOneShot(data,signature))throw new IOException("Firma de la TV no válida.");
    }
    static byte[] hkdf(byte[] key,String salt,String info) throws Exception {
        Mac mac=Mac.getInstance("HmacSHA512");mac.init(new SecretKeySpec(bytes(salt),"HmacSHA512"));byte[] prk=mac.doFinal(key);
        mac.init(new SecretKeySpec(prk,"HmacSHA512"));return Arrays.copyOf(mac.doFinal(join(bytes(info),new byte[]{1})),32);
    }
    static byte[] cipher(boolean encrypt,byte[] key,byte[] nonce,byte[] aad,byte[] value) throws Exception {
        Cipher c;
        try { c=Cipher.getInstance("ChaCha20/Poly1305/NoPadding"); } catch(GeneralSecurityException e) { c=Cipher.getInstance("ChaCha20-Poly1305"); }
        c.init(encrypt?Cipher.ENCRYPT_MODE:Cipher.DECRYPT_MODE,new SecretKeySpec(key,"ChaCha20"),new IvParameterSpec(nonce));
        if(aad!=null)c.updateAAD(aad);return c.doFinal(value);
    }
    static byte[] tlv(Object... pairs) throws IOException {
        ByteArrayOutputStream out=new ByteArrayOutputStream();
        for(int i=0;i<pairs.length;i+=2) { int type=(Integer)pairs[i];byte[] data=(byte[])pairs[i+1];
            for(int offset=0;offset<data.length;offset+=255) {int count=Math.min(255,data.length-offset);out.write(type);out.write(count);out.write(data,offset,count);}
        }return out.toByteArray();
    }
    static Map<Integer,byte[]> parse(byte[] data) throws IOException {
        Map<Integer,byte[]> m=new HashMap<>();
        for(int i=0;i<data.length;) {if(i+2>data.length)throw new IOException("TLV truncado.");int type=data[i++]&255,len=data[i++]&255;
            if(i+len>data.length)throw new IOException("TLV truncado.");byte[] old=m.get(type);m.put(type,join(old==null?new byte[0]:old,Arrays.copyOfRange(data,i,i+len)));i+=len;
        }return m;
    }
    static byte[] required(Map<Integer,byte[]> m,int key) throws IOException {byte[] v=m.get(key);if(v==null||v.length==0)throw new IOException("Respuesta HAP incompleta: campo "+key);return v;}
    static byte[] bytes(String value) {return value.getBytes(StandardCharsets.UTF_8);}
    static byte[] join(byte[]... values) {ByteArrayOutputStream o=new ByteArrayOutputStream();for(byte[] v:values)o.write(v,0,v.length);return o.toByteArray();}
    static byte[] hash(byte[]... values) throws Exception {MessageDigest md=MessageDigest.getInstance("SHA-512");for(byte[] v:values)md.update(v);return md.digest();}
    static BigInteger integer(byte[] value) {return new BigInteger(1,value);}
    static byte[] unsigned(BigInteger value) {byte[] b=value.toByteArray();return b[0]==0?Arrays.copyOfRange(b,1,b.length):b;}
    static byte[] pad(BigInteger value) {byte[] b=unsigned(value),p=new byte[384];System.arraycopy(b,0,p,p.length-b.length,b.length);return p;}
    static byte[] namedNonce(String value) {return join(new byte[4],bytes(value));}
    static byte[] nonce(long value) {byte[] n=new byte[12];for(int i=0;i<8;i++)n[4+i]=(byte)(value>>>(8*i));return n;}
    static byte[] read(InputStream in,int length) throws IOException {byte[] b=new byte[length];int p=0;while(p<length){int n=in.read(b,p,length-p);if(n<0)throw new EOFException("Respuesta truncada.");p+=n;}return b;}
    static String line(InputStream in) throws IOException {ByteArrayOutputStream o=new ByteArrayOutputStream();int b;while((b=in.read())!=-1&&b!=10){if(b!=13)o.write(b);if(o.size()>16384)throw new IOException("Cabecera excesiva.");}return b==-1&&o.size()==0?null:o.toString("UTF-8");}
    static String hex(byte[] v) {StringBuilder b=new StringBuilder();for(byte x:v)b.append(String.format(Locale.ROOT,"%02x",x&255));return b.toString();}
    static byte[] unhex(String v) throws IOException {try{byte[] b=new byte[v.length()/2];if(v.length()%2!=0)throw new Exception();for(int i=0;i<b.length;i++)b[i]=(byte)Integer.parseInt(v.substring(2*i,2*i+2),16);return b;}catch(Exception e){throw new IOException("Credenciales dañadas.");}}
    final class FrameInput extends InputStream {
        byte[] buffer=new byte[0];int pos;
        public int read() throws IOException {
            if(pos==buffer.length)try {byte[] len=HapClient.read(input,2);int count=(len[0]&255)|((len[1]&255)<<8);if(count>1024||count==0)throw new IOException("Trama HAP no válida.");buffer=cipher(false,readKey,nonce(readCounter++),len,HapClient.read(input,count+16));pos=0;}catch(Exception e){throw new IOException("Canal HAP: "+e.getMessage(),e);}
            return buffer[pos++]&255;
        }
    }
    static byte[] plist(NSDictionary dictionary) throws Exception {
        ByteArrayOutputStream out=new ByteArrayOutputStream();PropertyListParser.saveAsBinary(dictionary,out);return out.toByteArray();
    }
    void setupVideo() throws Exception {
        if(videoSetup)return;
        timing=new DatagramSocket(0);
        Thread clock=new Thread(() -> {
            while(!timing.isClosed())try {
                DatagramPacket packet=new DatagramPacket(new byte[128],128);timing.receive(packet);
                if(packet.getLength()<32)continue;
                byte[] data=packet.getData(),reply=new byte[32];reply[0]=data[0];reply[1]=(byte)0xd3;reply[3]=7;
                System.arraycopy(data,24,reply,8,8);
                long now=System.currentTimeMillis(),seconds=now/1000+2208988800L,fraction=((now%1000)<<32)/1000;
                for(int offset:new int[]{16,24})for(int i=0;i<4;i++) {reply[offset+i]=(byte)(seconds>>>(24-8*i));reply[offset+4+i]=(byte)(fraction>>>(24-8*i));}
                timing.send(new DatagramPacket(reply,reply.length,packet.getSocketAddress()));
            }catch(IOException e){if(!timing.isClosed())reporter.log("Reloj AirPlay: "+e.getMessage());}
        },"AirPlay-timing");clock.setDaemon(true);clock.start();
        NSDictionary body=new NSDictionary();
        body.put("deviceID","02:00:00:12:34:56");body.put("macAddress","02:00:00:12:34:56");
        body.put("sessionUUID",sessionId.toUpperCase(Locale.ROOT));body.put("timingPort",timing.getLocalPort());body.put("timingProtocol","NTP");
        body.put("isMultiSelectAirPlay",true);body.put("groupContainsGroupLeader",false);
        body.put("name","AirPlay Probe");body.put("model","Android");body.put("osName","Android");body.put("osVersion","10");
        body.put("sourceVersion","690.7.1");body.put("senderSupportsRelay",false);body.put("statsCollectionEnabled",false);
        String uri="rtsp://"+socket.getLocalAddress().getHostAddress()+"/1";
        Reply setup=request("SETUP",uri,plist(body),"application/x-apple-binary-plist","RTSP/1.0");
        NSDictionary response=(NSDictionary)PropertyListParser.parse(setup.body);
        NSObject eventPort=response.objectForKey("eventPort");
        if(eventPort!=null && Integer.parseInt(eventPort.toString())>0) {
            events=new HapClient(host,Integer.parseInt(eventPort.toString()),reporter);events.connect();
            events.controlOwner=this;
            events.socket.setSoTimeout(0);
            events.writeKey=hkdf(sharedSecret,"Events-Salt","Events-Read-Encryption-Key");
            events.readKey=hkdf(sharedSecret,"Events-Salt","Events-Write-Encryption-Key");
            Thread eventThread=new Thread(() -> events.receiveEvents(),"AirPlay-events");eventThread.setDaemon(true);eventThread.start();
        }
        request("RECORD",uri,null,"application/x-apple-binary-plist","RTSP/1.0");videoSetup=true;
    }
    void setupQueue() throws Exception {
        if(videoStream!=null)return;
        setupVideo();
        request("POST","/feedback",null,"application/x-apple-binary-plist","RTSP/1.0");
        NSDictionary stream=new NSDictionary();stream.put("type",130);stream.put("controlType",1);
        stream.put("channelID",new String(receiverId,StandardCharsets.UTF_8)+"-RCS-2");
        stream.put("clientUUID",sessionId.toUpperCase(Locale.ROOT));
        stream.put("clientTypeUUID","A6B27562-B43A-4F2D-B75F-82391E250194");
        NSArray streams=new NSArray(1);streams.setValue(0,stream);NSDictionary body=new NSDictionary();body.put("streams",streams);
        String uri="rtsp://"+socket.getLocalAddress().getHostAddress()+"/1";
        NSDictionary reply=(NSDictionary)PropertyListParser.parse(request("SETUP",uri,plist(body),"application/x-apple-binary-plist","RTSP/1.0").body);
        videoStream=((NSDictionary)((NSArray)reply.objectForKey("streams")).objectAtIndex(0)).objectForKey("streamID").toString();
        reporter.log("Canal de vídeo AirPlay V2 preparado.");
    }
    void videoCommand(NSDictionary command) throws Exception {
        NSDictionary params=new NSDictionary();params.put("data",plist(command));
        NSDictionary wrapper=new NSDictionary();wrapper.put("params",params);
        Reply reply=request("POST","/command",plist(wrapper),"application/x-apple-binary-plist","RTSP/1.0");
        reporter.log("Respuesta "+command.objectForKey("type")+": "+reply.body.length+" bytes.");
        if(reply.body.length>0)try{
            NSDictionary result=(NSDictionary)PropertyListParser.parse(reply.body);
            reporter.log("Campos respuesta: "+Arrays.toString(result.allKeys()));
        }catch(Exception ignored){}

    }
    void playQueue(String url) throws Exception {
        playQueue(url,0.0);
    }
    void playQueue(String url,double seconds) throws Exception {
        playQueue(url,seconds,1.0);
    }
    void playQueue(String url,double seconds,double startRate)throws Exception{
        setupQueue();NSDictionary item=new NSDictionary();item.put("uuid",UUID.randomUUID().toString().toUpperCase(Locale.ROOT));
        item.put("Content-Location",url);item.put("mediaType",url.contains(".m3u8")?"streaming":"file");item.put("playbackRestrictions",0);item.put("referenceRestrictions",3);
        item.put("supportsIntegratedTimeline",false);item.put("allowedCommonMediaClientDataKeys",0);item.put("snapTimeToPausePlayback",false);
        item.put("clientBundleID","app.sharklatan.airplayprobe");
        NSDictionary position=new NSDictionary();position.put("flags",1);position.put("value",(long)(Math.max(0,seconds)*1000000000L));position.put("epoch",0);position.put("timescale",1000000000);
        item.put("Start-Position",position);
        NSDictionary command=new NSDictionary();command.put("type","insertPlayQueueItem");command.put("item",item);videoCommand(command);
        command=new NSDictionary();command.put("type","setProperty");command.put("property","actionAtItemEnd");command.put("value",1);videoCommand(command);
        rate(startRate);
    }
    void rate(double rate) throws Exception {NSDictionary command=new NSDictionary();command.put("type","setRate");command.put("rate",rate);videoCommand(command);}
    boolean seek(double seconds) throws Exception {
        /* value in nanoseconds with timescale 1e9 is the format this receiver accepted before:
         * the position moved. Do not change it without a device test. */
        NSDictionary time=new NSDictionary();time.put("flags",1);time.put("value",(long)(Math.max(0,seconds)*1000000000L));time.put("epoch",0);time.put("timescale",1000000000);
        long id=commandSequence.incrementAndGet();String key=Long.toString(id);
        CompletableFuture<NSDictionary> reply=new CompletableFuture<>();commandReplies.put(key,reply);
        try {
            NSDictionary command=new NSDictionary();command.put("type","seek");command.put("kind","request");command.put("time",time);command.put("messageID",id);videoCommand(command);
            // Event acknowledgements must never hold the transport worker that sends pause/play.
            Thread monitor=new Thread(()->{
                try{NSDictionary confirmed=reply.get(6,TimeUnit.SECONDS);
                    reporter.log(confirmed.objectForKey("error")==null?"TV confirmó búsqueda a "+seconds+" s.":"TV rechazó la búsqueda.");
                }catch(Exception missing){reporter.log("Búsqueda sin confirmación a "+seconds+" s; posición pendiente de verificar.");}
                finally{commandReplies.remove(key);}
            },"airplay-seek-ack");monitor.setDaemon(true);monitor.start();
            return false;
        }catch(Exception failure){commandReplies.remove(key);throw failure;}
    }
    double volume()throws Exception{
        Reply reply=request("GET_PARAMETER","rtsp://"+socket.getLocalAddress().getHostAddress()+"/1",bytes("volume\r\n"),"text/parameters","RTSP/1.0");
        String value=new String(reply.body,StandardCharsets.US_ASCII).trim();
        if(!value.startsWith("volume:"))throw new IOException("La TV no informó su volumen.");
        double db=Double.parseDouble(value.substring(7).trim());
        reporter.log("Volumen informado por TV: "+db+" dB.");return db<=-144?0:Math.max(0,Math.min(1,(db+30)/30));
    }
    double volume(double ratio)throws Exception{
        double db=ratio<=0?-144:-30+30*Math.max(0,Math.min(1,ratio));
        request("SET_PARAMETER","rtsp://"+socket.getLocalAddress().getHostAddress()+"/1",bytes("volume: "+db+"\r\n"),"text/parameters","RTSP/1.0");
        return volume();
    }
    void pollInfo()throws Exception{
        NSDictionary command=new NSDictionary();command.put("type","playbackInfo");command.put("kind","request");command.put("messageID",commandSequence.incrementAndGet());videoCommand(command);
    }
    private static double seconds(NSObject value){
        if(!(value instanceof NSDictionary))return -1;
        NSDictionary t=(NSDictionary)value;
        if(!(t.objectForKey("value") instanceof NSNumber)||!(t.objectForKey("timescale") instanceof NSNumber))return -1;
        double scale=((NSNumber)t.objectForKey("timescale")).doubleValue();
        return scale>0?((NSNumber)t.objectForKey("value")).doubleValue()/scale:-1;
    }
    void receiveEvents() {
        InputStream source=new FrameInput();
        try {while(!socket.isClosed()) {
            String first=line(source);if(first==null)return;
            int count=0;String seq="",h;
            while((h=line(source))!=null&&!h.isEmpty()) {
                if(h.toLowerCase(Locale.ROOT).startsWith("content-length:"))count=Integer.parseInt(h.substring(15).trim());
                if(h.toLowerCase(Locale.ROOT).startsWith("cseq:"))seq=h.substring(5).trim();
            }
            if(count<0||count>1048576)throw new IOException("Evento excesivo.");byte[] event=read(source,count);
            NSDictionary received=null;
            if(first.contains(" /command ")&&event.length>0)try {
                NSDictionary outer=(NSDictionary)PropertyListParser.parse(event);
                NSDictionary params=(NSDictionary)outer.objectForKey("params");
                NSDictionary command=(NSDictionary)PropertyListParser.parse(((NSData)params.objectForKey("data")).bytes());
                received=command;
                NSDictionary info=command.objectForKey("info") instanceof NSDictionary?(NSDictionary)command.objectForKey("info"):null;
                if(info!=null){
                    double pos=seconds(info.objectForKey("position")),duration=seconds(info.objectForKey("duration"));
                    double rate=info.objectForKey("rate") instanceof NSNumber?((NSNumber)info.objectForKey("rate")).doubleValue():0;
                    boolean ready=info.objectForKey("readyToPlay") instanceof NSNumber&&((NSNumber)info.objectForKey("readyToPlay")).boolValue();
                    boolean waiting="loading".equals(String.valueOf(info.objectForKey("playbackState")));
                    reporter.log("Posición TV: "+pos+" s; rate="+rate+" ready="+ready);
                    reporter.playback(pos,duration,rate,ready,waiting);
                }
                if(command.objectForKey("time")!=null)reporter.log("Tiempo del evento TV: "+seconds(command.objectForKey("time"))+" s.");
                String kind=String.valueOf(command.objectForKey("type")),name=String.valueOf(command.objectForKey("name"));
                playbackState=kind+" · "+name;reporter.log("TV informa: "+playbackState);
            }catch(Exception e){reporter.log("Evento de vídeo recibido, formato pendiente.");}
            String protocol=first.substring(first.lastIndexOf(' ')+1);
            byte[] response=bytes(protocol+" 200 OK\r\nContent-Length: 0\r\nAudio-Latency: 0\r\n"+(seq.isEmpty()?"":"CSeq: "+seq+"\r\n")+"\r\n");
            byte[] length={(byte)response.length,(byte)(response.length>>8)};
            output.write(length);output.write(cipher(true,writeKey,nonce(writeCounter++),length,response));output.flush();
            if(received!=null&&controlOwner!=null&&received.objectForKey("messageID")!=null&&
                ("seek".equals(String.valueOf(received.objectForKey("type")))||"error".equals(String.valueOf(received.objectForKey("type"))))){
                CompletableFuture<NSDictionary> waiting=controlOwner.commandReplies.get(received.objectForKey("messageID").toString());
                if(waiting!=null)waiting.complete(received);
            }
        }}catch(Exception e){if(!closed)reporter.log("Canal de eventos: "+e.getMessage());}
        finally{if(!closed){
            sessionLost=true;HapClient owner=controlOwner!=null?controlOwner:this;owner.sessionLost=true;
            reporter.log("La TV cerró el canal de eventos AirPlay.");
            Runnable listener=owner.onSessionLost;if(listener!=null)listener.run();
        }}
    }
    public void close() throws IOException {closed=true;sessionLost=true;if(timing!=null)timing.close();if(events!=null)events.close();if(socket!=null)socket.close();}
}
