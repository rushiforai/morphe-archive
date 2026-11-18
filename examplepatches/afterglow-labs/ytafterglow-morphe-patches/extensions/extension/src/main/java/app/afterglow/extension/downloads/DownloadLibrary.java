package app.afterglow.extension.downloads;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.media.MediaMetadataRetriever;
import android.net.Uri;
import android.os.Environment;
import android.provider.MediaStore;
import android.provider.OpenableColumns;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Durable Vault files and metadata. All mutations and imports run on one dedicated IO worker. */
public final class DownloadLibrary {
    private final Context context;
    private final DownloadManager manager;
    private final ExecutorService io=Executors.newSingleThreadExecutor(r->new Thread(r,"Afterglow-Vault"));
    private volatile DownloadStorage storage;
    private volatile List<LibraryItem> items=Collections.emptyList();
    private volatile String recovery="";
    private volatile boolean writable;
    DownloadLibrary(Context context,DownloadManager manager) { this.context=context;this.manager=manager; }
    void initialize(DownloadStorage store) throws Exception {
        io.submit(()->{
            storage=store;
            try { items=immutable(store.loadLibrary());writable=true;recovery=store.recoveryMessage;reconcileNow(); }
            catch(Exception e) { recovery="The Vault index could not be read. Existing files have been kept.";writable=false; }
        }).get();
    }
    public List<LibraryItem> snapshot() { return items; }
    public LibraryItem item(String id) { for(LibraryItem item:items) if(item.id.equals(id)) return item;return null; }
    public String recoveryMessage() { return recovery; }
    public boolean isWritable() { return writable; }
    public Uri uriForItem(String id) {
        LibraryItem item=item(id);
        if(item==null || item.isMissing()) return null;
        return new Uri.Builder().scheme("content").authority(context.getPackageName()+".afterglow.downloads").appendPath(item.id).build();
    }
    File fileForItem(String id) throws IOException {
        LibraryItem i=item(id);if(i==null || storage==null) throw new IOException("This Vault item is unavailable.");
        File f=DownloadStorage.child(storage.media,i.relativePath);
        if(!f.isFile()) throw new IOException("This Vault file is missing.");return f;
    }
    private static List<LibraryItem> immutable(List<LibraryItem> list) { return Collections.unmodifiableList(new ArrayList<>(list)); }
    private void checkWritable() throws IOException { if(!writable || storage==null) throw new IOException("The Vault is not ready. Existing files have been kept."); }
    private void commit(List<LibraryItem> next) throws IOException { checkWritable();storage.saveLibrary(next);items=immutable(next);manager.changed(); }
    private interface Operation<T> { T run() throws Exception; }
    private <T> void perform(Operation<T> task,DownloadManager.Callback<T> callback) {
        io.execute(()->{try { checkWritable();manager.callback(callback,task.run(),null); }catch(Exception e) { manager.callback(callback,null,"The Vault operation could not finish. Check free storage and try again."); }});
    }
    public void rename(String id,String title,DownloadManager.Callback<LibraryItem> callback) {
        mutate(id,(i)->copy(i,DownloadPolicy.text(title,1024).trim(),i.collectionName,i.favorite,i.lastPlayedAt,i.fileSize,i.repairState),callback);
    }
    public void setFavorite(String id,boolean favorite,DownloadManager.Callback<LibraryItem> callback) {
        mutate(id,(i)->copy(i,i.title,i.collectionName,favorite,i.lastPlayedAt,i.fileSize,i.repairState),callback);
    }
    public void setCollection(String id,String collection,DownloadManager.Callback<LibraryItem> callback) {
        mutate(id,(i)->copy(i,i.title,DownloadPolicy.text(collection,256).trim(),i.favorite,i.lastPlayedAt,i.fileSize,i.repairState),callback);
    }
    public void markPlayed(String id) {
        mutate(id,(i)->copy(i,i.title,i.collectionName,i.favorite,System.currentTimeMillis(),i.fileSize,i.repairState),null);
    }
    private interface Change { LibraryItem apply(LibraryItem item); }
    private void mutate(String id,Change change,DownloadManager.Callback<LibraryItem> callback) {
        perform(()->{
            LibraryItem old=item(id);if(old==null) throw new IOException("Item missing.");LibraryItem updated=change.apply(old);
            if(updated.title.isEmpty()) throw new IOException("A title is required.");
            List<LibraryItem> next=new ArrayList<>(items);next.set(next.indexOf(old),updated);commit(next);return updated;
        },callback);
    }
    public void delete(String id,boolean deleteFile,DownloadManager.Callback<LibraryItem> callback) {
        perform(()->{
            LibraryItem old=item(id);if(old==null) throw new IOException("Item missing.");
            File original=DownloadStorage.child(storage.media,old.relativePath), trash=DownloadStorage.child(storage.work,old.id+".trash");
            boolean moved=deleteFile && original.isFile();
            if(moved) DownloadStorage.move(original,trash);
            List<LibraryItem> next=new ArrayList<>(items);next.remove(old);
            try { commit(next); }catch(Exception e) { if(moved) DownloadStorage.move(trash,original);throw e; }
            if(moved) java.nio.file.Files.deleteIfExists(trash.toPath());return old;
        },callback);
    }
    public void delete(String id,DownloadManager.Callback<LibraryItem> callback) { delete(id,true,callback); }
    public void reconcile(DownloadManager.Callback<List<LibraryItem>> callback) {
        io.execute(()->{
            try {
                if(storage==null)throw new IOException("The Vault is loading.");
                if(!writable) {
                    // Explicit Repair preserves damaged index generations before orphan reconstruction.
                    String stamp=Long.toString(System.currentTimeMillis());
                    for(String suffix:new String[]{"",".pending",".previous"}) {
                        File damaged=DownloadStorage.child(storage.root,"library.agv"+suffix);
                        if(damaged.isFile())DownloadStorage.move(damaged,DownloadStorage.child(storage.root,"library.agv"+suffix+".corrupt-"+stamp));
                    }
                    items=Collections.emptyList();writable=true;
                }
                reconcileNow();manager.callback(callback,items,null);
            }catch(Exception e){manager.callback(callback,null,"The Vault could not finish its repair. Existing media has been kept.");}
        });
    }
    /** Fill missing YouTube metadata only. User titles and collections are never replaced. */
    public void refreshMetadata(DownloadManager.Callback<List<LibraryItem>> callback) {
        io.execute(()->{
            try {
                checkWritable();long deadline=System.currentTimeMillis()+120000;int refreshed=0;
                List<LibraryItem> pending=new ArrayList<>(items);
                for(LibraryItem old:pending) {
                    if(System.currentTimeMillis()>deadline)break;
                    boolean missingTitle=old.title.isEmpty() || old.title.equals(old.videoId) || old.title.equals(old.relativePath);
                    if(old.videoId.isEmpty() || !missingTitle && !old.channelName.isEmpty() && !old.thumbnailUrl.isEmpty())continue;
                    final DownloadCatalog[] answer=new DownloadCatalog[1];java.util.concurrent.CountDownLatch done=new java.util.concurrent.CountDownLatch(1);
                    manager.inspect(old.videoId,(catalog,error)->{answer[0]=catalog;done.countDown();});
                    if(!done.await(30,java.util.concurrent.TimeUnit.SECONDS))continue;
                    DownloadCatalog catalog=answer[0];if(catalog==null)continue;
                    LibraryItem updated=new LibraryItem(old.id,old.videoId,missingTitle?DownloadPolicy.text(catalog.title,1024):old.title,
                        old.channelName.isEmpty()?DownloadPolicy.text(catalog.channelName,512):old.channelName,old.collectionName,
                        old.thumbnailUrl.isEmpty()?DownloadPolicy.safeThumbnail(catalog.thumbnailUrl):old.thumbnailUrl,old.relativePath,old.mimeType,old.formatSummary,old.sourceQuality,old.sourceType,old.originalFilename,old.createdAt,old.fileSize,
                        old.durationMs>0?old.durationMs:Math.max(0,catalog.durationMs),old.lastPlayedAt,old.height,old.favorite,old.kind,old.repairState);
                    List<LibraryItem> next=new ArrayList<>(items);int index=next.indexOf(old);if(index<0)continue;next.set(index,updated);commit(next);refreshed++;
                }
                // Metadata refresh is routine maintenance, not index recovery.
                manager.changed();manager.callback(callback,items,null);
            }catch(Exception e){manager.callback(callback,null,"Metadata could not be refreshed. Existing details have been kept.");}
        });
    }
    private void reconcileNow() throws IOException {
        checkWritable();List<LibraryItem> next=new ArrayList<>();Set<String> known=new HashSet<>();int recovered=0,missing=0;
        for(LibraryItem item:items) {
            File f=DownloadStorage.child(storage.media,item.relativePath);known.add(item.relativePath);
            File interrupted=DownloadStorage.child(storage.work,item.id+".trash");
            if(!f.exists() && interrupted.isFile())DownloadStorage.move(interrupted,f);
            LibraryItem.RepairState state=f.isFile()?(item.repairState==LibraryItem.RepairState.RECOVERED_ORPHAN?item.repairState:LibraryItem.RepairState.HEALTHY):LibraryItem.RepairState.MISSING;
            if(state==LibraryItem.RepairState.MISSING) missing++;
            next.add(copy(item,item.title,item.collectionName,item.favorite,item.lastPlayedAt,f.isFile()?f.length():item.fileSize,state));
        }
        File[] files=storage.media.listFiles();
        if(files!=null) for(File f:files) {
            if(next.size()>=DownloadPolicy.MAX_ITEMS) break;
            if(known.contains(f.getName()) || !f.isFile() || f.getName().endsWith(".pending")) continue;
            try {
                DownloadStorage.child(storage.media,f.getName());String ext=extension(f.getName());
                String id=UUID.randomUUID().toString();
                // A completed queue output uses the job UUID as filename/id, allowing crash recovery.
                String stem=f.getName().substring(0,f.getName().lastIndexOf('.'));
                try { DownloadStorage.validId(stem);id=stem; }catch(IOException ignored) {}
                final String recoveredId=id;
                if(next.stream().anyMatch(i->i.id.equals(recoveredId))) continue;
                next.add(new LibraryItem(id,"",f.getName(),"","","",f.getName(),DownloadPolicy.mime(ext),ext.toUpperCase(Locale.ROOT),"","recovered",f.getName(),f.lastModified(),f.length(),0,0,0,false,kindForMime(DownloadPolicy.mime(ext)),LibraryItem.RepairState.RECOVERED_ORPHAN));recovered++;
            }catch(Exception ignored) { /* Foreign files are preserved without indexing unsafe paths. */ }
        }
        commit(next);
        if(recovered>0 || missing>0) recovery="Vault checked: "+recovered+" recovered, "+missing+" missing.";
        else if(recovery.startsWith("Vault checked:")) recovery="";
    }
    public void importMedia(Uri source,String title,String collection,DownloadManager.Callback<LibraryItem> callback) {
        perform(()->{
            if(source==null || !("content".equals(source.getScheme()) || "file".equals(source.getScheme()))) throw new IOException("Choose a media file.");
            String name="",mime=context.getContentResolver().getType(source);
            try(Cursor cursor=context.getContentResolver().query(source,new String[]{OpenableColumns.DISPLAY_NAME},null,null,null)) {
                if(cursor!=null && cursor.moveToFirst()) name=cursor.getString(0);
            } catch(Exception ignored) {}
            if(name==null || name.isEmpty()) name=source.getLastPathSegment();
            String ext;
            try { ext=extension(name); }catch(Exception e) { ext=extensionForMime(mime); }
            String id=UUID.randomUUID().toString();File temp=DownloadStorage.child(storage.work,id+".import");
            try {
                try(InputStream in=context.getContentResolver().openInputStream(source);FileOutputStream out=new FileOutputStream(temp)) {
                    if(in==null) throw new IOException("File unavailable.");copyStream(in,out,storage.root);out.getFD().sync();
                }
                String importMime=DownloadPolicy.importMime(ext,mime);
                DownloadRequest.Kind kind=kindForMime(importMime);
                long duration=0;int height=0;
                if(kind==DownloadRequest.Kind.VIDEO || kind==DownloadRequest.Kind.AUDIO) {
                    MediaMetadataRetriever meta=new MediaMetadataRetriever();
                    try {meta.setDataSource(temp.getPath());duration=number(meta.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION));height=(int)number(meta.extractMetadata(MediaMetadataRetriever.METADATA_KEY_VIDEO_HEIGHT));}
                    catch(Exception ignored) {}finally {meta.release();}
                }
                String chosen=DownloadPolicy.text(title,1024).trim();if(chosen.isEmpty()) chosen=DownloadPolicy.text(name,1024);
                LibraryItem item=new LibraryItem(id,"",chosen,"",DownloadPolicy.text(collection,256).trim(),"",id+"."+ext,importMime,ext.toUpperCase(Locale.ROOT),height>0?height+"p":"","imported",DownloadPolicy.text(name,1024),System.currentTimeMillis(),temp.length(),duration,0,height,false,kind,LibraryItem.RepairState.HEALTHY);
                return install(temp,item);
            }finally {java.nio.file.Files.deleteIfExists(temp.toPath());}
        },callback);
    }
    LibraryItem accept(File source,QueueRecord job,String container) throws Exception {
        return io.submit(()->{
            checkWritable();LibraryItem existing=item(job.id);if(existing!=null && !existing.isMissing()) return existing;
            DownloadRequest r=job.request;String ext=DownloadPolicy.extension(container);
            String mime=DownloadPolicy.mime(ext);if(r.kind==DownloadRequest.Kind.AUDIO && ext.equals("webm")) mime="audio/webm";
            LibraryItem item=new LibraryItem(job.id,r.videoId,r.title,r.channelName,r.collectionName,r.thumbnailUrl,job.id+"."+ext,mime,r.formatSummary,r.qualityLabel,"youtube","",System.currentTimeMillis(),source.length(),r.durationMs,0,r.height,false,r.kind,LibraryItem.RepairState.HEALTHY);
            return install(source,item,r.replacesItemId);
        }).get();
    }
    private LibraryItem install(File source,LibraryItem item) throws IOException {
        return install(source,item,"");
    }
    private LibraryItem install(File source,LibraryItem item,String replaceId) throws IOException {
        if(source.length()<=0) throw new IOException("The downloaded file is empty.");
        if(items.size()>=DownloadPolicy.MAX_ITEMS) throw new IOException("The Vault is full.");
        File target=DownloadStorage.child(storage.media,item.relativePath);
        DownloadStorage.move(source,target);
        LibraryItem previous=replaceId.isEmpty()?null:item(replaceId);File oldFile=null,oldTrash=null;
        if(previous!=null && !previous.id.equals(item.id)) {
            oldFile=DownloadStorage.child(storage.media,previous.relativePath);oldTrash=DownloadStorage.child(storage.work,previous.id+".trash");
            if(oldFile.isFile())DownloadStorage.move(oldFile,oldTrash);
            item=copy(item,item.title,previous.collectionName,previous.favorite,previous.lastPlayedAt,item.fileSize,item.repairState);
        }
        List<LibraryItem> next=new ArrayList<>(items);String newId=item.id;next.removeIf(i->i.id.equals(newId) || previous!=null && i.id.equals(previous.id));next.add(item);
        // If the index write fails, retain the completed media. Reconcile can recover it.
        try{commit(next);}catch(IOException e){if(oldTrash!=null && oldTrash.isFile())DownloadStorage.move(oldTrash,oldFile);throw e;}
        if(oldTrash!=null)java.nio.file.Files.deleteIfExists(oldTrash.toPath());return item;
    }
    public void exportToMediaStore(String id,DownloadManager.Callback<Uri> callback) { perform(()->exportNow(id),callback); }
    Uri exportBlocking(String id) throws Exception { return io.submit(()->exportNow(id)).get(); }
    private Uri exportNow(String id) throws IOException {
        LibraryItem item=item(id);if(item==null) throw new IOException("Item missing.");File source=fileForItem(id);
        Uri collection;String path;
        switch(item.kind) {
            case VIDEO:collection=MediaStore.Video.Media.getContentUri(MediaStore.VOLUME_EXTERNAL_PRIMARY);path=Environment.DIRECTORY_MOVIES;break;
            case AUDIO:collection=MediaStore.Audio.Media.getContentUri(MediaStore.VOLUME_EXTERNAL_PRIMARY);path=Environment.DIRECTORY_MUSIC;break;
            case THUMBNAIL:collection=MediaStore.Images.Media.getContentUri(MediaStore.VOLUME_EXTERNAL_PRIMARY);path=Environment.DIRECTORY_PICTURES;break;
            default:collection=MediaStore.Downloads.getContentUri(MediaStore.VOLUME_EXTERNAL_PRIMARY);path=Environment.DIRECTORY_DOWNLOADS;
        }
        ContentValues values=new ContentValues();values.put(MediaStore.MediaColumns.DISPLAY_NAME,exportName(item));values.put(MediaStore.MediaColumns.MIME_TYPE,item.mimeType);
        values.put(MediaStore.MediaColumns.RELATIVE_PATH,path+"/Afterglow");values.put(MediaStore.MediaColumns.IS_PENDING,1);
        Uri uri=context.getContentResolver().insert(collection,values);if(uri==null) throw new IOException("Export destination unavailable.");
        try {
            try(InputStream in=new FileInputStream(source);OutputStream out=context.getContentResolver().openOutputStream(uri,"w")) {if(out==null)throw new IOException("Export destination unavailable.");copyStream(in,out,null);}
            values.clear();values.put(MediaStore.MediaColumns.IS_PENDING,0);
            if(context.getContentResolver().update(uri,values,null,null)!=1) throw new IOException("Export could not finish.");return uri;
        }catch(Exception e) {context.getContentResolver().delete(uri,null,null);throw new IOException("The file could not be exported.");}
    }
    static String exportName(LibraryItem item) {
        return DownloadPolicy.exportName(item.title,item.relativePath.substring(item.relativePath.lastIndexOf('.')+1));
    }
    static void copyStream(InputStream in,OutputStream out,File storage) throws IOException {
        byte[] buffer=new byte[256*1024];long bytes=0;int n;
        while((n=in.read(buffer))!=-1) {
            bytes+=n;if(bytes>DownloadPolicy.MAX_FILE_BYTES) throw new IOException("This file exceeds the Vault size limit.");
            if(storage!=null && storage.getUsableSpace()<DownloadPolicy.DISK_RESERVE+n) throw new IOException("Not enough free storage.");
            out.write(buffer,0,n);
        }
        if(bytes==0) throw new IOException("This file is empty.");
    }
    private static long number(String value) {try{return Math.max(0,Long.parseLong(value));}catch(Exception e){return 0;}}
    static String extension(String name) {if(name==null || name.lastIndexOf('.')<0) throw new IllegalArgumentException("Unknown media format.");return DownloadPolicy.extension(name.substring(name.lastIndexOf('.')+1));}
    private static String extensionForMime(String mime) {
        if(mime==null) throw new IllegalArgumentException("Unknown media format.");
        switch(mime) {case "video/mp4":return "mp4";case "audio/mp4":return "m4a";case "audio/mpeg":return "mp3";case "video/webm":case "audio/webm":return "webm";case "image/jpeg":return "jpg";case "image/png":return "png";case "image/webp":return "webp";case "audio/ogg":return "ogg";case "audio/wav":return "wav";case "audio/flac":return "flac";case "text/vtt":return "vtt";case "application/x-subrip":return "srt";default:throw new IllegalArgumentException("Unsupported media format.");}
    }
    private static DownloadRequest.Kind kindForMime(String mime) {return mime.startsWith("audio/")?DownloadRequest.Kind.AUDIO:mime.startsWith("image/")?DownloadRequest.Kind.THUMBNAIL:mime.startsWith("text/")||mime.equals("application/x-subrip")?DownloadRequest.Kind.CAPTIONS:DownloadRequest.Kind.VIDEO;}
    private static LibraryItem copy(LibraryItem i,String title,String collection,boolean favorite,long played,long size,LibraryItem.RepairState repair) {
        return new LibraryItem(i.id,i.videoId,title,i.channelName,collection,i.thumbnailUrl,i.relativePath,i.mimeType,i.formatSummary,i.sourceQuality,i.sourceType,i.originalFilename,i.createdAt,size,i.durationMs,played,i.height,favorite,i.kind,repair);
    }
}
