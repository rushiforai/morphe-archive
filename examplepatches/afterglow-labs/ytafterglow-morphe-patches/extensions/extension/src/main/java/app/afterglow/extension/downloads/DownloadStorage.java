package app.afterglow.extension.downloads;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/** Small allowlisted, checksummed stores with previous-generation recovery; no object serialization. */
final class DownloadStorage {
    private static final int MAGIC=0x41475631, VERSION=1, MAX_STORE=16*1024*1024;
    final File root, media, work;
    String recoveryMessage="";
    DownloadStorage(File root) throws IOException {
        this.root=root.getCanonicalFile(); media=new File(this.root,"media"); work=new File(this.root,"work");
        directory(this.root); directory(media); directory(work);
    }
    static void directory(File f) throws IOException {
        if(!f.isDirectory() && !f.mkdirs()) throw new IOException("The Vault directory could not be created.");
        if(!f.getAbsoluteFile().equals(f.getCanonicalFile())) throw new IOException("The Vault directory is not safe.");
    }
    static File child(File directory,String name) throws IOException {
        if(name==null || !name.matches("[A-Za-z0-9][A-Za-z0-9._-]{0,180}") || name.contains("..")) throw new IOException("Unsafe Vault filename.");
        File file=new File(directory,name);
        if(!file.getCanonicalFile().equals(file.getAbsoluteFile()) || !file.getCanonicalFile().getParentFile().equals(directory.getCanonicalFile())) throw new IOException("Unsafe Vault path.");
        return file;
    }
    interface Encoder { void write(DataOutputStream out) throws IOException; }
    interface Decoder<T> { T read(DataInputStream in) throws IOException; }
    synchronized <T> T load(String name,Decoder<T> decoder,T empty) throws IOException {
        File primary=child(root,name), pending=child(root,name+".pending"), previous=child(root,name+".previous");
        boolean existed=false;
        for(File candidate:new File[]{primary,pending,previous}) {
            if(!candidate.exists()) continue;
            existed=true;
            try {
                T result=decode(candidate,decoder);
                if(!candidate.equals(primary)) {
                    Files.copy(candidate.toPath(),primary.toPath(),StandardCopyOption.REPLACE_EXISTING);
                    recoveryMessage="The Vault recovered its previous saved state.";
                }
                return result;
            } catch(IOException ignored) { /* Try a separately validated generation. */ }
        }
        if(existed) {
            // Keep the damaged generations for recovery; callers must not overwrite them.
            throw new IOException("The Vault index could not be recovered. Existing media has been kept.");
        }
        return empty;
    }
    private <T> T decode(File file,Decoder<T> decoder) throws IOException {
        if(file.length()<44 || file.length()>MAX_STORE) throw new IOException("Invalid store size.");
        byte[] all=Files.readAllBytes(file.toPath());
        int n=all.length-32;
        byte[] payload=java.util.Arrays.copyOf(all,n);
        if(!MessageDigest.isEqual(digest(payload),java.util.Arrays.copyOfRange(all,n,all.length))) throw new IOException("Invalid store checksum.");
        try(DataInputStream in=new DataInputStream(new ByteArrayInputStream(payload))) {
            if(in.readInt()!=MAGIC || in.readInt()!=VERSION) throw new IOException("Unsupported store version.");
            T result=decoder.read(in);
            if(in.available()!=0) throw new IOException("Unexpected store fields.");
            return result;
        } catch(IllegalArgumentException e) { throw new IOException("Invalid store fields."); }
    }
    synchronized void save(String name,Encoder encoder) throws IOException {
        ByteArrayOutputStream bytes=new ByteArrayOutputStream();
        try(DataOutputStream out=new DataOutputStream(bytes)) { out.writeInt(MAGIC);out.writeInt(VERSION);encoder.write(out); }
        byte[] payload=bytes.toByteArray();
        if(payload.length>MAX_STORE-32) throw new IOException("The Vault index has reached its size limit.");
        File primary=child(root,name), pending=child(root,name+".pending"), previous=child(root,name+".previous");
        try(FileOutputStream out=new FileOutputStream(pending)) { out.write(payload);out.write(digest(payload));out.getFD().sync(); }
        if(primary.exists()) Files.copy(primary.toPath(),previous.toPath(),StandardCopyOption.REPLACE_EXISTING);
        move(pending,primary);
    }
    static void move(File source,File target) throws IOException {
        try { Files.move(source.toPath(),target.toPath(),StandardCopyOption.ATOMIC_MOVE,StandardCopyOption.REPLACE_EXISTING); }
        catch(java.nio.file.AtomicMoveNotSupportedException e) { Files.move(source.toPath(),target.toPath(),StandardCopyOption.REPLACE_EXISTING); }
    }
    static byte[] digest(byte[] data) throws IOException {
        try { return MessageDigest.getInstance("SHA-256").digest(data); } catch(Exception e) { throw new IOException("Checksum unavailable."); }
    }
    static String hash(String text) throws IOException {
        StringBuilder out=new StringBuilder();
        for(byte b:digest(text.getBytes(StandardCharsets.UTF_8))) out.append(String.format(java.util.Locale.ROOT,"%02x",b&255));
        return out.toString();
    }
    static void string(DataOutputStream out,String value,int max) throws IOException {
        if(value==null || value.length()>max) throw new IOException("Invalid metadata length.");
        byte[] bytes=value.getBytes(StandardCharsets.UTF_8); out.writeInt(bytes.length);out.write(bytes);
    }
    static String string(DataInputStream in,int max) throws IOException {
        int n=in.readInt(); if(n<0 || n>max*4 || n>in.available()) throw new IOException("Invalid metadata length.");
        byte[] bytes=new byte[n];in.readFully(bytes);
        String value=new String(bytes,StandardCharsets.UTF_8); if(value.length()>max) throw new IOException("Invalid metadata length.");
        return value;
    }
    private static int count(DataInputStream in,int max) throws IOException { int n=in.readInt();if(n<0 || n>max) throw new IOException("Invalid item count.");return n; }
    private static <E extends Enum<E>> E enumeration(DataInputStream in,Class<E> type) throws IOException {
        try { return Enum.valueOf(type,string(in,48)); } catch(IllegalArgumentException e) { throw new IOException("Invalid state."); }
    }
    static void request(DataOutputStream o,DownloadRequest raw) throws IOException {
        DownloadRequest r=DownloadPolicy.sanitize(raw);
        string(o,r.videoId,64);string(o,r.title,1024);string(o,r.channelName,512);string(o,r.thumbnailUrl,2048);
        string(o,r.kind.name(),48);o.writeInt(r.videoItag);o.writeInt(r.audioItag);o.writeInt(r.height);
        string(o,r.audioTrackId,256);string(o,r.audioLanguageCode,256);o.writeBoolean(r.audioDrc);
        string(o,r.captionTrackId,256);string(o,r.captionLanguageCode,256);string(o,r.container,16);
        string(o,r.formatSummary,512);string(o,r.qualityLabel,128);string(o,r.collectionName,256);
        o.writeLong(r.durationMs);string(o,r.postAction.name(),48);string(o,r.replacesItemId,64);
    }
    static DownloadRequest request(DataInputStream in) throws IOException {
        DownloadRequest r=new DownloadRequest();
        r.videoId=string(in,64);r.title=string(in,1024);r.channelName=string(in,512);r.thumbnailUrl=string(in,2048);
        r.kind=enumeration(in,DownloadRequest.Kind.class);r.videoItag=in.readInt();r.audioItag=in.readInt();r.height=in.readInt();
        r.audioTrackId=string(in,256);r.audioLanguageCode=string(in,256);r.audioDrc=in.readBoolean();
        r.captionTrackId=string(in,256);r.captionLanguageCode=string(in,256);r.container=string(in,16);
        r.formatSummary=string(in,512);r.qualityLabel=string(in,128);r.collectionName=string(in,256);
        r.durationMs=in.readLong();r.postAction=enumeration(in,DownloadRequest.PostAction.class);r.replacesItemId=string(in,64);
        return DownloadPolicy.sanitize(r);
    }
    List<QueueRecord> loadQueue() throws IOException {
        return load("queue.agv",in->{
            int n=count(in,DownloadPolicy.MAX_JOBS);List<QueueRecord> result=new ArrayList<>();Set<String> ids=new HashSet<>();
            for(int j=0;j<n;j++) {
                QueueRecord r=new QueueRecord();r.id=string(in,64);validId(r.id);if(!ids.add(r.id)) throw new IOException("Duplicate job.");
                r.request=request(in);r.state=enumeration(in,DownloadJob.State.class);r.phase=enumeration(in,DownloadJob.Phase.class);
                r.bytes=in.readLong();r.total=in.readLong();r.created=in.readLong();r.updated=in.readLong();r.ordinal=in.readLong();
                r.error=string(in,512);r.output=string(in,64);if(!r.output.isEmpty()) validId(r.output);r.retries=in.readInt();
                if(r.bytes<0 || r.total < -1 || r.total>DownloadPolicy.MAX_FILE_BYTES*3 || r.ordinal<0 || r.retries<0) throw new IOException("Invalid job counters.");
                r.recover();result.add(r);
            }
            return result;
        },new ArrayList<>());
    }
    void saveQueue(List<QueueRecord> jobs) throws IOException {
        if(jobs.size()>DownloadPolicy.MAX_JOBS) throw new IOException("The download queue is full.");
        Set<String> ids=new HashSet<>();for(QueueRecord r:jobs){validId(r.id);if(!ids.add(r.id))throw new IOException("Duplicate job.");}
        save("queue.agv",o->{o.writeInt(jobs.size());for(QueueRecord r:jobs) {
            string(o,r.id,64);request(o,r.request);string(o,r.state.name(),48);string(o,r.phase.name(),48);
            o.writeLong(r.bytes);o.writeLong(r.total);o.writeLong(r.created);o.writeLong(r.updated);o.writeLong(r.ordinal);
            string(o,r.error,512);string(o,r.output,64);o.writeInt(r.retries);
        }});
    }
    List<LibraryItem> loadLibrary() throws IOException {
        return load("library.agv",in->{
            int n=count(in,DownloadPolicy.MAX_ITEMS);List<LibraryItem> result=new ArrayList<>();Set<String> ids=new HashSet<>(),paths=new HashSet<>();
            for(int j=0;j<n;j++) {
                String id=string(in,64);validId(id);String video=string(in,64),title=string(in,1024),channel=string(in,512),collection=string(in,256),thumb=string(in,2048),path=string(in,181);
                child(media,path);if(!ids.add(id)||!paths.add(path)) throw new IOException("Duplicate Vault item.");
                result.add(new LibraryItem(id,video,title,channel,collection,DownloadPolicy.safeThumbnail(thumb),path,
                    string(in,128),string(in,512),string(in,128),string(in,48),string(in,1024),
                    in.readLong(),in.readLong(),in.readLong(),in.readLong(),in.readInt(),in.readBoolean(),
                    enumeration(in,DownloadRequest.Kind.class),enumeration(in,LibraryItem.RepairState.class)));
            }
            return result;
        },new ArrayList<>());
    }
    void saveLibrary(List<LibraryItem> items) throws IOException {
        if(items.size()>DownloadPolicy.MAX_ITEMS) throw new IOException("The Vault index is full.");
        Set<String> ids=new HashSet<>(),paths=new HashSet<>();for(LibraryItem i:items){validId(i.id);child(media,i.relativePath);if(!ids.add(i.id)||!paths.add(i.relativePath))throw new IOException("Duplicate Vault item.");}
        save("library.agv",o->{o.writeInt(items.size());for(LibraryItem r:items) {
            string(o,r.id,64);string(o,r.videoId,64);string(o,r.title,1024);string(o,r.channelName,512);string(o,r.collectionName,256);string(o,r.thumbnailUrl,2048);
            string(o,r.relativePath,181);string(o,r.mimeType,128);string(o,r.formatSummary,512);string(o,r.sourceQuality,128);string(o,r.sourceType,48);string(o,r.originalFilename,1024);
            o.writeLong(r.createdAt);o.writeLong(r.fileSize);o.writeLong(r.durationMs);o.writeLong(r.lastPlayedAt);o.writeInt(r.height);o.writeBoolean(r.favorite);
            string(o,r.kind.name(),48);string(o,r.repairState.name(),48);
        }});
    }
    static void validId(String id) throws IOException { if(id==null || !id.matches("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")) throw new IOException("Invalid item identifier."); }
}
