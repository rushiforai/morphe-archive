package nl.johninnl.navigation.alerts;

import android.content.Context;
import android.os.Looper;
import android.provider.Settings;
import android.system.ErrnoException;
import android.system.Os;
import android.system.OsConstants;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileDescriptor;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.channels.FileLock;
import java.nio.channels.OverlappingFileLockException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

/** Private, no-backup uncertainty record. Hold one instance for the provider actor's lifetime.
 * A rename may have committed even if save throws: callers must keep the uncertainty fence.
 */
public final class AtomicPlaybackStore implements PlaybackStore, Closeable {
    public static final int MAX_BYTES=4096;
    private static final int MAGIC=0x4e574731, VERSION=1, HASH_BYTES=32;
    private final File file;
    private final RandomAccessFile lockFile;
    private final FileLock lock;
    private boolean closed;

    public AtomicPlaybackStore(Context context) throws IOException { this(privateFile(context)); }
    /** Test-only custom location; production callers must use provider-private storage. */
    public AtomicPlaybackStore(File file) throws IOException {
        worker();
        File parent=file.getAbsoluteFile().getParentFile();
        if(parent==null || (!parent.isDirectory() && !parent.mkdirs()))throw new IOException("LEDGER_DIRECTORY");
        this.file=file.getAbsoluteFile();
        RandomAccessFile stream=new RandomAccessFile(new File(parent,file.getName()+".lock"),"rw");
        FileLock acquired=null;
        try {
            Os.fchmod(stream.getFD(),0600);
            acquired=stream.getChannel().tryLock();
            if(acquired==null)throw new IOException("LEDGER_IN_USE");
        }catch(ErrnoException | OverlappingFileLockException error) {
            stream.close();throw new IOException("LEDGER_LOCK");
        }catch(IOException error) { stream.close();throw error; }
        lockFile=stream;lock=acquired;
    }

    public static String bootIdentity(Context context) throws IOException {
        try {
            int count=Settings.Global.getInt(context.getContentResolver(),Settings.Global.BOOT_COUNT);
            if(count<0)throw new IOException("BOOT_IDENTITY_UNAVAILABLE");
            return "boot-count:"+count;
        }catch(Settings.SettingNotFoundException | SecurityException error) { throw new IOException("BOOT_IDENTITY_UNAVAILABLE"); }
    }

    @Override public synchronized PlaybackGrant load() throws IOException {
        ready();
        if(!file.exists())return null;
        if(file.length()>MAX_BYTES)throw new IOException("LEDGER_SIZE");
        try(FileInputStream input=new FileInputStream(file);ByteArrayOutputStream bytes=new ByteArrayOutputStream()) {
            byte[] buffer=new byte[512];int count;
            while((count=input.read(buffer))!=-1) {
                if(bytes.size()+count>MAX_BYTES)throw new IOException("LEDGER_SIZE");
                bytes.write(buffer,0,count);
            }
            return decode(bytes.toByteArray());
        }
    }

    @Override public synchronized void save(PlaybackGrant grant) throws IOException {
        ready();byte[] bytes=encode(grant);File temporary=new File(file.getParentFile(),file.getName()+".new");
        try {
            FileDescriptor descriptor=Os.open(temporary.getPath(),OsConstants.O_WRONLY|OsConstants.O_CREAT|OsConstants.O_TRUNC|OsConstants.O_NOFOLLOW,0600);
            try(FileOutputStream output=new FileOutputStream(descriptor)) {
                Os.fchmod(output.getFD(),0600);output.write(bytes);output.flush();output.getFD().sync();
            }finally { if(descriptor.valid())Os.close(descriptor); } // Android's public stream wrapper does not own this FD.
            Os.rename(temporary.getPath(),file.getPath());
            FileDescriptor directory=Os.open(file.getParent(),OsConstants.O_RDONLY,0);
            try {
                if(!OsConstants.S_ISDIR(Os.fstat(directory).st_mode))throw new IOException("LEDGER_DIRECTORY");
                Os.fsync(directory);
            } finally { Os.close(directory); }
        }catch(ErrnoException error) { throw new IOException("LEDGER_COMMIT"); }
    }

    @Override public synchronized void close() throws IOException {
        worker();if(closed)return;closed=true;
        try { lock.release(); } finally { lockFile.close(); }
    }

    static byte[] encode(PlaybackGrant grant) throws IOException {
        if(grant!=null && (!grant.granted || !(grant.outcome==PlaybackGrant.Outcome.GRANTED
                || grant.outcome==PlaybackGrant.Outcome.STARTED || grant.outcome==PlaybackGrant.Outcome.UNCERTAIN)))
            throw new IOException("LEDGER_RECORD");
        ByteArrayOutputStream body=new ByteArrayOutputStream();DataOutputStream out=new DataOutputStream(body);
        out.writeInt(MAGIC);out.writeInt(VERSION);out.writeBoolean(grant!=null);
        if(grant!=null) {
            text(out,grant.bootIdentity);text(out,grant.providerSession);text(out,grant.consumerNonce);text(out,grant.ownerToken);
            text(out,grant.eventKey);text(out,grant.attemptId);text(out,grant.attemptNonce);
            out.writeInt(grant.ownerUid);out.writeLong(grant.ownerEpoch);out.writeLong(grant.revision);
            text(out,grant.mode.name());text(out,grant.outcome.name());out.writeBoolean(grant.started);
        }
        byte[] value=body.toByteArray(),hash=hash(value);
        if(value.length+HASH_BYTES>MAX_BYTES)throw new IOException("LEDGER_SIZE");
        body.write(hash);return body.toByteArray();
    }

    static PlaybackGrant decode(byte[] bytes) throws IOException {
        if(bytes==null || bytes.length<9+HASH_BYTES || bytes.length>MAX_BYTES)throw new IOException("LEDGER_SIZE");
        byte[] body=Arrays.copyOf(bytes,bytes.length-HASH_BYTES);
        if(!MessageDigest.isEqual(hash(body),Arrays.copyOfRange(bytes,body.length,bytes.length)))throw new IOException("LEDGER_CHECKSUM");
        DataInputStream in=new DataInputStream(new ByteArrayInputStream(body));
        if(in.readInt()!=MAGIC || in.readInt()!=VERSION)throw new IOException("LEDGER_VERSION");
        PlaybackGrant grant=null;
        if(in.readBoolean()) {
            String boot=text(in),session=text(in),consumer=text(in),token=text(in),key=text(in),attempt=text(in),nonce=text(in);
            int uid=in.readInt();long epoch=in.readLong(),revision=in.readLong();String mode=text(in),outcome=text(in);boolean started=in.readBoolean();
            try {
                grant=new PlaybackGrant(boot,session,consumer,token,key,attempt,nonce,uid,epoch,revision,
                        WarningAudioOwner.Mode.valueOf(mode),PlaybackGrant.Outcome.valueOf(outcome),true,started);
                if(!(grant.outcome==PlaybackGrant.Outcome.GRANTED || grant.outcome==PlaybackGrant.Outcome.STARTED || grant.outcome==PlaybackGrant.Outcome.UNCERTAIN))
                    throw new IOException("LEDGER_RECORD");
            }catch(IllegalArgumentException error) { throw new IOException("LEDGER_RECORD"); }
        }
        if(in.available()!=0)throw new IOException("LEDGER_TRAILING_DATA");return grant;
    }

    private static void text(DataOutputStream out,String value) throws IOException {
        byte[] bytes=value.getBytes(StandardCharsets.UTF_8);
        if(bytes.length>128)throw new IOException("LEDGER_STRING_SIZE");out.writeShort(bytes.length);out.write(bytes);
    }
    private static String text(DataInputStream in) throws IOException {
        int count=in.readUnsignedShort();if(count>128)throw new IOException("LEDGER_STRING_SIZE");
        byte[] bytes=new byte[count];in.readFully(bytes);return new String(bytes,StandardCharsets.UTF_8);
    }
    private static byte[] hash(byte[] bytes) throws IOException {
        try { return MessageDigest.getInstance("SHA-256").digest(bytes); }
        catch(NoSuchAlgorithmException error) { throw new IOException("LEDGER_HASH"); }
    }
    private static File privateFile(Context context) throws IOException {
        worker();File parent=context.getNoBackupFilesDir();if(parent==null)throw new IOException("LEDGER_DIRECTORY");
        return new File(parent,"morphe-warning-output.bin");
    }
    private static void worker() throws IOException {
        if(Looper.myLooper()==Looper.getMainLooper())throw new IOException("OWNER_WORKER_REQUIRED");
    }
    private void ready() throws IOException { worker();if(closed || !lock.isValid())throw new IOException("LEDGER_CLOSED"); }
}
