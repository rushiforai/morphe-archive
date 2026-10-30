// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.DataInputStream;
import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigInteger;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.SocketTimeoutException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.channels.FileChannel;
import java.nio.channels.FileLock;
import java.nio.charset.StandardCharsets;
import java.security.GeneralSecurityException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.Signature;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.RSAPublicKeySpec;
import java.security.spec.RSAPrivateCrtKeySpec;
import java.util.Arrays;
import java.util.Base64;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.function.BooleanSupplier;

/** A single-purpose, bounded classic ADB transport to this head unit only.
 * Protocol and RSA public-key layout follow the Android Open Source Project.
 * The unique private key stays in the application's no-backup directory.
 */
public final class VehicleLocalAdb implements Closeable {
    private static final int VERSION = 0x01000000;
    private static final int MAX_PACKET = 4096, MAX_OUTPUT = 16384;
    private static final long HANDSHAKE_MS = 15000, COMMAND_MS = 25000;
    private static final ScheduledThreadPoolExecutor TIMEOUTS=newTimeouts();
    private static final int CNXN = command("CNXN"), AUTH = command("AUTH");
    private static final int OPEN = command("OPEN"), OKAY = command("OKAY");
    private static final int WRTE = command("WRTE"), CLSE = command("CLSE");
    private static final byte[] SHA1_DIGEST_INFO = {
        0x30,0x21,0x30,0x09,0x06,0x05,0x2b,0x0e,0x03,0x02,0x1a,0x05,0x00,0x04,0x14
    };
    private final Socket socket;
    private final DataInputStream input;
    private final java.io.OutputStream output;
    private final BooleanSupplier stillAllowed;
    private volatile boolean closed;
    private int nextLocalId = 1;
    private int completedLocalId,completedRemoteId;
    private volatile long deadline;
    private final Object timeoutLock=new Object();
    private long timeoutVersion;
    private ScheduledFuture<?> timeoutTask;

    public static final class ApprovalRequiredException extends IOException {
        public ApprovalRequiredException() { super("ADB approval required"); }
        ApprovalRequiredException(IOException cause) { super("ADB approval required",cause); }
    }

    /** Must be called off the main thread, and only after the owner's opt-in. */
    public static VehicleLocalAdb open(File noBackupDirectory, boolean allowPublicKey,
                                      BooleanSupplier stillAllowed) throws IOException {
        requireAllowed(stillAllowed);
        KeyPair key = loadOrCreateKey(noBackupDirectory, stillAllowed);
        Socket socket = new Socket();
        try {
            requireAllowed(stillAllowed);
            socket.connect(new InetSocketAddress(InetAddress.getByAddress(new byte[]{127,0,0,1}),5555),3000);
            socket.setSoTimeout(5000);
            socket.setTcpNoDelay(true);
            return openConnected(socket, key, allowPublicKey, stillAllowed);
        } catch (IOException | RuntimeException e) {
            try { socket.close(); } catch (IOException ignored) {}
            throw e;
        }
    }

    // The socket/key seam is package-private and used by deterministic protocol tests.
    static VehicleLocalAdb openConnected(Socket socket, KeyPair key, boolean allowPublicKey,
                                         BooleanSupplier stillAllowed) throws IOException {
        VehicleLocalAdb client = new VehicleLocalAdb(socket, stillAllowed);
        try { client.handshake(key,allowPublicKey); return client; }
        catch (IOException | RuntimeException e) { client.close(); throw e; }
    }

    private VehicleLocalAdb(Socket socket, BooleanSupplier allowed) throws IOException {
        this.socket=socket; this.stillAllowed=allowed;
        input=new DataInputStream(socket.getInputStream()); output=socket.getOutputStream();
    }

    private void handshake(KeyPair key, boolean allowPublicKey) throws IOException {
        armDeadline(HANDSHAKE_MS);
        boolean signed=false, offered=false;
        try {
        send(CNXN,VERSION,MAX_PACKET,"host::\0".getBytes(StandardCharsets.UTF_8));
        for(int rounds=0;rounds<5;rounds++) {
            Packet packet=read();
            if(packet.command==CNXN) {
                // Modern adbd sends a length-delimited std::string without a NUL.
                // Older banners may retain a trailing NUL; both are valid here.
                if(packet.arg0<VERSION || packet.arg1<MAX_PACKET || packet.payload.length==0)
                    throw new IOException("Invalid local ADB connection response");
                return;
            }
            if(packet.command!=AUTH || packet.arg0!=1 || packet.arg1!=0 || packet.payload.length!=20)
                throw new IOException("Invalid local ADB authentication response");
            if(!signed) { send(AUTH,2,0,signToken(key.getPrivate(),packet.payload)); signed=true; }
            else if(allowPublicKey && !offered) { send(AUTH,3,0,publicKeyPayload((RSAPublicKey)key.getPublic())); offered=true; }
            else throw new ApprovalRequiredException();
        }
        throw new IOException("Local ADB authentication did not finish");
        } catch(IOException e) {
            requireAllowed(stillAllowed);
            if(offered && !(e instanceof ApprovalRequiredException))throw new ApprovalRequiredException(e);
            throw e;
        } finally { disarmDeadline(); }
    }

    /** Executes only manager-generated commands; never expose this as a user shell. */
    public synchronized String execute(String fixedValidatedCommand) throws IOException {
        validateCommand(fixedValidatedCommand);
        armDeadline(COMMAND_MS);
        try {
            check();
            if(nextLocalId<=0) throw new IOException("Local ADB stream limit reached");
            int local=nextLocalId++,remote=0,lateCloses=0;
            boolean opened=false;
            send(OPEN,local,0,("shell:"+fixedValidatedCommand+'\0').getBytes(StandardCharsets.UTF_8));
            ByteArrayOutputStream reply=new ByteArrayOutputStream();
            for(int packets=0;packets<1024;packets++) {
                Packet packet=read();
                // adbd can finish WRTE+EOF before receiving our WRTE acknowledgement.
                // Its response to that acknowledgement is another CLSE for the completed
                // stream. Ignore only that exact empty close, without acknowledging again.
                if(packet.command==CLSE && packet.payload.length==0 && completedLocalId!=0 &&
                   packet.arg1==completedLocalId && packet.arg0==completedRemoteId){
                    if(++lateCloses>8)throw new IOException("Local ADB stale close limit exceeded");
                    continue;
                }
                if(packet.arg1!=local || packet.arg0<=0 || (remote!=0 && packet.arg0!=remote))
                    throw new IOException("Mismatched local ADB stream");
                if(packet.command==OKAY) {
                    if(opened || packet.payload.length!=0) throw new IOException("Invalid local ADB stream acknowledgement");
                    opened=true; remote=packet.arg0;
                } else if(packet.command==WRTE) {
                    if(!opened) throw new IOException("Local ADB stream was not acknowledged");
                    if(reply.size()+packet.payload.length>MAX_OUTPUT) throw new IOException("Local ADB output exceeded limit");
                    reply.write(packet.payload,0,packet.payload.length);
                    send(OKAY,local,remote,new byte[0]);
                } else if(packet.command==CLSE) {
                    if(packet.payload.length!=0) throw new IOException("Invalid local ADB stream close");
                    send(CLSE,local,packet.arg0,new byte[0]);
                    if(!opened) throw new IOException("Local ADB command was rejected");
                    completedLocalId=local;completedRemoteId=remote;
                    return new String(reply.toByteArray(),StandardCharsets.UTF_8);
                } else throw new IOException("Unexpected local ADB stream packet");
            }
            throw new IOException("Local ADB packet limit exceeded");
        } catch(IOException | RuntimeException e) { close(); throw e; }
        finally { disarmDeadline(); }
    }

    private static void validateCommand(String command) throws IOException {
        if(command==null || command.length()==0 || command.getBytes(StandardCharsets.UTF_8).length>3500 ||
           command.indexOf('\0')>=0 || command.indexOf('\n')>=0 || command.indexOf('\r')>=0)
            throw new IOException("Invalid vehicle reader command");
    }

    private Packet read() throws IOException {
        check();
        try {
            byte[] header=new byte[24];readFully(header);
            ByteBuffer parsed=ByteBuffer.wrap(header).order(ByteOrder.LITTLE_ENDIAN);
            int cmd=parsed.getInt(),arg0=parsed.getInt(),arg1=parsed.getInt();
            int length=parsed.getInt(),checksum=parsed.getInt(),magic=parsed.getInt();
            check();
            if(magic!=(cmd^0xffffffff) || length<0 || length>MAX_PACKET)
                throw new IOException("Invalid local ADB packet header");
            byte[] payload=new byte[length];readFully(payload);check();
            int actual=0; for(byte b:payload) actual+=(b&255);
            if(actual!=checksum) throw new IOException("Invalid local ADB packet checksum");
            return new Packet(cmd,arg0,arg1,payload);
        } catch(SocketTimeoutException e) { throw new IOException("Local ADB timed out",e); }
        catch(EOFException e) { throw new IOException("Local ADB connection ended",e); }
    }

    private void readFully(byte[] bytes) throws IOException {
        for(int offset=0;offset<bytes.length;){
            check();
            socket.setSoTimeout((int)Math.max(1,Math.min(5000,deadline-now())));
            int count=input.read(bytes,offset,bytes.length-offset);
            if(count<0)throw new EOFException();
            offset+=count;
        }
    }

    private void send(int cmd,int arg0,int arg1,byte[] payload) throws IOException {
        check(); if(payload.length>MAX_PACKET) throw new IOException("Local ADB packet too large");
        int checksum=0;for(byte b:payload)checksum+=(b&255);
        ByteBuffer header=ByteBuffer.allocate(24).order(ByteOrder.LITTLE_ENDIAN);
        header.putInt(cmd).putInt(arg0).putInt(arg1).putInt(payload.length).putInt(checksum).putInt(cmd^0xffffffff);
        output.write(header.array()); output.write(payload); output.flush(); check();
    }

    private void check() throws IOException {
        requireAllowed(stillAllowed);
        if(closed)throw new IOException("Local ADB client is closed");
        if(deadline!=0 && now()>deadline)throw new IOException("Local ADB operation timed out");
    }
    private static void requireAllowed(BooleanSupplier allowed) throws IOException {
        if(allowed==null || !allowed.getAsBoolean())throw new IOException("BYD vehicle data is disabled");
    }
    private static long now(){return TimeUnit.NANOSECONDS.toMillis(System.nanoTime());}
    private static ScheduledThreadPoolExecutor newTimeouts(){
        ScheduledThreadPoolExecutor executor=new ScheduledThreadPoolExecutor(1,r->{
            Thread thread=new Thread(r,"maps-vehicle-adb-timeout");thread.setDaemon(true);return thread;
        });
        executor.setRemoveOnCancelPolicy(true);return executor;
    }
    private void armDeadline(long durationMs){
        synchronized(timeoutLock){
            long version=++timeoutVersion;
            if(timeoutTask!=null)timeoutTask.cancel(false);
            deadline=now()+durationMs;
            timeoutTask=TIMEOUTS.schedule(()->{
                synchronized(timeoutLock){if(version==timeoutVersion&&!closed)close();}
            },durationMs,TimeUnit.MILLISECONDS);
        }
    }
    private void disarmDeadline(){
        synchronized(timeoutLock){
            ++timeoutVersion;deadline=0;
            if(timeoutTask!=null){timeoutTask.cancel(false);timeoutTask=null;}
        }
    }
    private static int command(String value){return value.charAt(0)|(value.charAt(1)<<8)|(value.charAt(2)<<16)|(value.charAt(3)<<24);}
    private static final class Packet {
        final int command,arg0,arg1;final byte[] payload;
        Packet(int c,int a,int b,byte[] p){command=c;arg0=a;arg1=b;payload=p;}
    }
    @Override public void close() {
        closed=true;
        disarmDeadline();
        try{socket.close();}catch(IOException ignored){}
    }

    static byte[] signToken(PrivateKey key,byte[] token) throws IOException {
        if(token.length!=20)throw new IOException("Invalid ADB challenge length");
        try{
            Signature signature=Signature.getInstance("NONEwithRSA");
            signature.initSign(key); signature.update(SHA1_DIGEST_INFO); signature.update(token);
            byte[] result=signature.sign();
            if(result.length!=256)throw new IOException("Invalid ADB signature size");
            return result;
        }catch(GeneralSecurityException e){throw new IOException("Unable to sign local ADB challenge",e);}
    }

    static byte[] publicKeyPayload(RSAPublicKey key) throws IOException {
        validatePublicKey(key);
        BigInteger n=key.getModulus(),word=BigInteger.ONE.shiftLeft(32);
        BigInteger rr=BigInteger.ONE.shiftLeft(4096).mod(n);
        ByteBuffer data=ByteBuffer.allocate(524).order(ByteOrder.LITTLE_ENDIAN);
        data.putInt(64).putInt(n.mod(word).modInverse(word).negate().intValue());
        putLittleEndianWords(data,n);putLittleEndianWords(data,rr);
        data.putInt(65537);
        return (Base64.getEncoder().encodeToString(data.array())+" MapsVehicle@localhost\0").getBytes(StandardCharsets.US_ASCII);
    }
    private static void putLittleEndianWords(ByteBuffer out,BigInteger value){
        for(int i=0;i<64;i++){out.putInt(value.intValue());value=value.shiftRight(32);}
    }
    private static void validatePublicKey(RSAPublicKey key) throws IOException {
        if(key.getModulus().signum()<=0 || key.getModulus().bitLength()!=2048 || !key.getModulus().testBit(0) || !key.getPublicExponent().equals(BigInteger.valueOf(65537)))
            throw new IOException("Invalid local ADB RSA key");
    }

    /** Some Android providers return RSAPrivateKey without the optional CRT interface. */
    static RSAPublicKey publicForPrivate(KeyFactory factory,PrivateKey key,byte[] encoded) throws GeneralSecurityException,IOException {
        RSAPublicKeySpec publicSpec=null;
        try {
            RSAPrivateCrtKeySpec crt=factory.getKeySpec(key,RSAPrivateCrtKeySpec.class);
            publicSpec=new RSAPublicKeySpec(crt.getModulus(),crt.getPublicExponent());
        }catch(GeneralSecurityException|RuntimeException unsupported){/* Provider may not expose CRT fields. */}
        // Validate the stored envelope even if a provider accepts a valid prefix plus junk.
        RSAPublicKeySpec encodedSpec=publicFromPkcs8(encoded);
        if(publicSpec==null)publicSpec=encodedSpec;
        else if(!encodedSpec.getModulus().equals(publicSpec.getModulus())||!encodedSpec.getPublicExponent().equals(publicSpec.getPublicExponent()))
            throw new IOException("Local ADB private/public key mismatch");
        BigInteger modulus=publicSpec.getModulus(),exponent=publicSpec.getPublicExponent();
        if(modulus==null||exponent==null||modulus.signum()<=0||modulus.bitLength()!=2048||!modulus.testBit(0)||!BigInteger.valueOf(65537).equals(exponent))
            throw new IOException("Invalid local ADB RSA key");
        if(key instanceof RSAPrivateKey&&!modulus.equals(((RSAPrivateKey)key).getModulus()))
            throw new IOException("Local ADB private/public key mismatch");
        java.security.PublicKey publicKey=factory.generatePublic(publicSpec);
        if(!(publicKey instanceof RSAPublicKey))throw new IOException("Unsupported local ADB public key");
        RSAPublicKey result=(RSAPublicKey)publicKey;validatePublicKey(result);return result;
    }

    /** RFC5208 PrivateKeyInfo / RFC8017 two-prime RSAPrivateKey, public n/e only.
     * Strict bounded DER; private integer bytes are checked/skipped without copying them.
     * Existing keys are never rewritten or replaced if parsing/provider conversion fails.
     */
    static RSAPublicKeySpec publicFromPkcs8(byte[] encoded)throws IOException{
        if(encoded==null||encoded.length<256||encoded.length>4096)throw new IOException("Invalid local ADB PKCS8 key");
        Der outer=new Der(encoded,0,encoded.length),info=outer.value(0x30);outer.end();info.zero();
        Der algorithm=info.value(0x30),oid=algorithm.value(0x06);
        byte[] rsaOid={0x2a,(byte)0x86,0x48,(byte)0x86,(byte)0xf7,0x0d,0x01,0x01,0x01};
        if(oid.remaining()!=rsaOid.length)throw new IOException("Invalid local ADB RSA algorithm");
        for(byte expected:rsaOid)if(oid.next()!=(expected&255))throw new IOException("Invalid local ADB RSA algorithm");
        oid.end();if(algorithm.remaining()!=0)algorithm.value(0x05).end();algorithm.end();
        Der octets=info.value(0x04);info.end();Der rsa=octets.value(0x30);octets.end();rsa.zero();
        BigInteger modulus=rsa.positivePublic(),exponent=rsa.positivePublic();
        for(int i=0;i<6;i++)rsa.positive(); // d, p, q, dP, dQ, qInv, without materializing private integers.
        rsa.end();return new RSAPublicKeySpec(modulus,exponent);
    }
    private static final class Der {
        private final byte[] bytes;private int at;private final int limit;
        Der(byte[] bytes,int at,int limit){this.bytes=bytes;this.at=at;this.limit=limit;}
        int remaining(){return limit-at;}
        int next()throws IOException{if(at>=limit)throw invalid();return bytes[at++]&255;}
        Der value(int tag)throws IOException{
            if(next()!=tag)throw invalid();int length=next();
            if((length&128)!=0){
                int count=length&127;if(count<1||count>2)throw invalid();length=0;
                for(int i=0;i<count;i++){int b=next();if(i==0&&b==0)throw invalid();length=(length<<8)|b;}
                if(length<128)throw invalid();
            }
            if(length>remaining())throw invalid();Der result=new Der(bytes,at,at+length);at+=length;return result;
        }
        void end()throws IOException{if(at!=limit)throw invalid();}
        void zero()throws IOException{Der value=value(0x02);if(value.remaining()!=1||value.next()!=0)throw invalid();value.end();}
        Der positive()throws IOException{
            Der value=value(0x02);int length=value.remaining();if(length==0)throw invalid();
            int first=value.bytes[value.at]&255;
            if((first&128)!=0||(length==1&&first==0)||(length>1&&first==0&&(value.bytes[value.at+1]&128)==0))throw invalid();
            return value;
        }
        BigInteger positivePublic()throws IOException{Der value=positive();if(value.remaining()>513)throw invalid();return new BigInteger(Arrays.copyOfRange(bytes,value.at,value.limit));}
        private static IOException invalid(){return new IOException("Invalid local ADB PKCS8 key");}
    }

    static synchronized KeyPair loadOrCreateKey(File noBackup,BooleanSupplier allowed) throws IOException {
        requireAllowed(allowed);
        if(noBackup==null || !noBackup.isDirectory())throw new IOException("Local ADB private storage is unavailable");
        File directory=new File(noBackup,"maps-vehicle-adb");
        if(!directory.isDirectory() && !directory.mkdir())throw new IOException("Cannot create local ADB private storage");
        privateMode(directory,true);
        File lockFile=new File(directory,"key.lock");
        if(!lockFile.exists() && !lockFile.createNewFile())throw new IOException("Cannot create local ADB key lock");
        privateMode(lockFile,false);
        try(FileOutputStream lockOutput=new FileOutputStream(lockFile,true);
            FileChannel lockChannel=lockOutput.getChannel();FileLock ignored=lockChannel.lock()) {
            requireAllowed(allowed);
            File stored=new File(directory,"private.pk8");
            try{
                KeyFactory factory=KeyFactory.getInstance("RSA");
                if(stored.exists()){
                    privateMode(stored,false);
                    long length=stored.length();
                    if(!stored.isFile() || length<256 || length>4096)throw new IOException("Invalid local ADB private key file");
                    byte[] encoded=new byte[(int)length];
                    try(DataInputStream in=new DataInputStream(new FileInputStream(stored))){
                        in.readFully(encoded);if(in.read()!=-1)throw new IOException("Local ADB private key file changed");
                    }
                    try{
                        PrivateKey key=factory.generatePrivate(new PKCS8EncodedKeySpec(encoded));
                        RSAPublicKey pub=publicForPrivate(factory,key,encoded);
                        validatePublicKey(pub);requireAllowed(allowed);return new KeyPair(pub,key);
                    }finally{Arrays.fill(encoded,(byte)0);}
                }
                KeyPairGenerator generator=KeyPairGenerator.getInstance("RSA");generator.initialize(2048);
                KeyPair pair=generator.generateKeyPair();validatePublicKey((RSAPublicKey)pair.getPublic());
                requireAllowed(allowed);
                File temporary=File.createTempFile("private-",".tmp",directory);
                byte[] encoded=pair.getPrivate().getEncoded();
                try{
                    privateMode(temporary,false);
                    try(FileOutputStream out=new FileOutputStream(temporary)){out.write(encoded);out.getFD().sync();}
                    requireAllowed(allowed);
                    if(!temporary.renameTo(stored))throw new IOException("Cannot save local ADB private key");
                    privateMode(stored,false);return pair;
                }finally{Arrays.fill(encoded,(byte)0);if(temporary.exists())temporary.delete();}
            }catch(GeneralSecurityException | ClassCastException e){throw new IOException("Unable to load local ADB identity",e);}
        }
    }
    private static void privateMode(File file,boolean directory) throws IOException {
        if(!file.setReadable(false,false) || !file.setWritable(false,false) || !file.setExecutable(false,false) ||
           !file.setReadable(true,true) || !file.setWritable(true,true) ||
           (directory&&!file.setExecutable(true,true)))
            throw new IOException("Cannot protect local ADB private storage");
    }
}
