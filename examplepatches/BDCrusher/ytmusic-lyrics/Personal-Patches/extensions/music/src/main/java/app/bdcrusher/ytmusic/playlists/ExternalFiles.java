/* Copyright 2026 BDCrusher. GPL-3.0. Read-only access to a user-selected SAF tree. */
package app.bdcrusher.ytmusic.playlists;

import android.content.*;
import android.database.Cursor;
import android.media.MediaMetadataRetriever;
import android.net.Uri;
import android.provider.DocumentsContract;
import android.util.AtomicFile;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.*;
import org.json.*;
import app.morphe.extension.shared.Utils;
import app.bdcrusher.ytmusic.common.FeatureDiagnostics;

/** External handoff is never completion. Only an indexed, readable recording is available offline. */
public final class ExternalFiles {
    public record Item(String id,String uri,String title,String artist,String album,int duration,long bytes,String artwork) {}
    private static final ExecutorService IO=Executors.newSingleThreadExecutor();
    private static volatile Map<String,Item> items=Map.of(),uris=Map.of();
    private static volatile String status="Choose a folder to use YTDLnis files offline";
    private static volatile long epoch;private static long lastScan;private static boolean scanning;
    private ExternalFiles(){}
    static android.content.SharedPreferences preferences(Context c){return c.getSharedPreferences("bdcrusher_playlist_downloads",Context.MODE_PRIVATE);}
    public static String status(){return status;}
    public static String folder(Context c){return preferences(c).getString("externalTree","");}
    public static boolean granted(Context c){String tree=folder(c);if(tree.isEmpty())return false;for(UriPermission p:c.getContentResolver().getPersistedUriPermissions())if(p.isReadPermission()&&tree.equals(p.getUri().toString()))return true;return false;}
    public static Item get(String id){return items.get(id);}
    public static Item source(String uri){return uris.get(uri);}
    public static boolean owns(Context c,String uri){if(!granted(c))return false;return uris.containsKey(uri);}
    public static void choose(Context c){Intent i=new Intent(c,ExternalFolderActivity.class);if(!(c instanceof android.app.Activity))i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);c.startActivity(i);}
    static void selected(Context c,Uri tree){String old=folder(c);epoch++;preferences(c).edit().putString("externalTree",tree.toString()).apply();if(!old.isEmpty()&&!old.equals(tree.toString()))try{c.getContentResolver().releasePersistableUriPermission(Uri.parse(old),Intent.FLAG_GRANT_READ_URI_PERMISSION);}catch(Exception ignored){}items=Map.of();uris=Map.of();lastScan=0;status="Checking the selected folder";PlaylistSettingsPage.folderChanged();PlaylistRuntime.refreshFiles(true);}
    public static void forget(Context c){epoch++;String old=folder(c);if(!old.isEmpty())try{c.getContentResolver().releasePersistableUriPermission(Uri.parse(old),Intent.FLAG_GRANT_READ_URI_PERMISSION);}catch(Exception ignored){}preferences(c).edit().remove("externalTree").apply();items=Map.of();uris=Map.of();lastScan=0;status="Folder disconnected; external files were kept";PlaylistSettingsPage.folderChanged();PlaylistRuntime.filesChanged();}
    static synchronized void refresh(Context context,Set<String> recordings,boolean force){
        if(scanning||!force&&android.os.SystemClock.elapsedRealtime()-lastScan<15000)return;
        Context c=context.getApplicationContext();if(!granted(c)){items=Map.of();uris=Map.of();status=folder(c).isEmpty()?"Choose a folder to use external files offline":"Folder permission needs renewal";PlaylistSettingsPage.folderChanged();PlaylistRuntime.filesChanged();return;}
        long expected=epoch;String selectedTree=folder(c);scanning=true;lastScan=android.os.SystemClock.elapsedRealtime();Set<String> known=Set.copyOf(recordings);
        IO.execute(()->{
            Map<String,Item> next=new HashMap<>();Set<String> ambiguous=new HashSet<>();int visited=0,unmatched=0;String failure="";
            try{Uri tree=Uri.parse(selectedTree);ArrayDeque<String[]> todo=new ArrayDeque<>();todo.add(new String[]{DocumentsContract.getTreeDocumentId(tree),"0"});
                while(!todo.isEmpty()&&visited<20000){String[] task=todo.removeFirst();int depth=Integer.parseInt(task[1]);Uri children=DocumentsContract.buildChildDocumentsUriUsingTree(tree,task[0]);
                    try(Cursor cursor=c.getContentResolver().query(children,new String[]{DocumentsContract.Document.COLUMN_DOCUMENT_ID,DocumentsContract.Document.COLUMN_DISPLAY_NAME,DocumentsContract.Document.COLUMN_MIME_TYPE,DocumentsContract.Document.COLUMN_SIZE},null,null,null)){
                        if(cursor==null)continue;
                        while(cursor.moveToNext()&&visited++<20000){String doc=cursor.getString(0),name=cursor.getString(1),mime=cursor.getString(2);long bytes=cursor.isNull(3)?0:cursor.getLong(3);
                            if(DocumentsContract.Document.MIME_TYPE_DIR.equals(mime)){if(depth<8)todo.add(new String[]{doc,String.valueOf(depth+1)});continue;}
                            String id=recording(name,known);if(id==null){unmatched++;continue;}
                            Uri uri=DocumentsContract.buildDocumentUriUsingTree(tree,doc);Item item=inspect(c,id,uri,bytes);if(item==null)continue;
                            if(next.containsKey(id)){ambiguous.add(id);continue;}next.put(id,item);
                        }
                    }
                }
                for(String id:ambiguous)next.remove(id);
                if(!todo.isEmpty())failure="Folder scan limit reached; choose a smaller folder";
            }catch(Exception problem){failure="Folder could not be read; choose it again";FeatureDiagnostics.record("Playlist-files","Folder scan failed: "+problem.getClass().getSimpleName());}
            if(expected!=epoch||!selectedTree.equals(folder(c))){synchronized(ExternalFiles.class){scanning=false;}PlaylistRuntime.refreshFiles(true);return;}
            if(!granted(c)){next.clear();failure="Folder permission needs renewal";}
            items=Map.copyOf(next);Map<String,Item> byUri=new HashMap<>();for(Item item:next.values())byUri.put(item.uri,item);uris=Map.copyOf(byUri);status=failure.isEmpty()?next.size()+" matched audio files"+(ambiguous.isEmpty()?"":"; "+ambiguous.size()+" ambiguous IDs kept unmatched")+(unmatched==0?"":"; other files ignored"):failure;
            synchronized(ExternalFiles.class){scanning=false;}FeatureDiagnostics.record("Playlist-files","Matched="+next.size()+"; ambiguous="+ambiguous.size()+"; partial="+!failure.isEmpty());PlaylistSettingsPage.folderChanged();PlaylistRuntime.filesChanged();
        });
    }
    static String recording(String name,Set<String> known){
        return ExternalRecordingName.match(name,known);
    }
    private static Item inspect(Context c,String id,Uri uri,long bytes){
        try(MediaMetadataRetriever media=new MediaMetadataRetriever()){
            media.setDataSource(c,uri);if(!"yes".equalsIgnoreCase(media.extractMetadata(MediaMetadataRetriever.METADATA_KEY_HAS_AUDIO)))return null;
            String title=text(media.extractMetadata(MediaMetadataRetriever.METADATA_KEY_TITLE)),artist=text(media.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ARTIST)),album=text(media.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUM));int duration=0;try{duration=(int)(Long.parseLong(text(media.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION)))/1000);}catch(NumberFormatException ignored){}
            String art=saveArtwork(c,id,media.getEmbeddedPicture());return new Item(id,uri.toString(),title,artist,album,duration,bytes,art);
        }catch(Exception unsupported){return null;}
    }
    private static String text(String s){return s==null?"":s;}
    private static String saveArtwork(Context c,String id,byte[] bytes)throws Exception{
        File directory=new File(c.getFilesDir(),"bdcrusher-playlist-artwork");File file=new File(directory,id+".jpg");if(file.isFile())return file.getAbsolutePath();if(bytes==null||bytes.length>4*1024*1024)return "";
        android.graphics.BitmapFactory.Options options=new android.graphics.BitmapFactory.Options();options.inJustDecodeBounds=true;android.graphics.BitmapFactory.decodeByteArray(bytes,0,bytes.length,options);if(options.outWidth<=0||options.outHeight<=0)return "";options.inSampleSize=1;while(Math.max(options.outWidth,options.outHeight)/options.inSampleSize>512)options.inSampleSize*=2;options.inJustDecodeBounds=false;android.graphics.Bitmap image=android.graphics.BitmapFactory.decodeByteArray(bytes,0,bytes.length,options);if(image==null)return "";
        if(!directory.isDirectory()&&!directory.mkdirs()){image.recycle();return "";}AtomicFile atomic=new AtomicFile(file);FileOutputStream out=null;try{out=atomic.startWrite();if(!image.compress(android.graphics.Bitmap.CompressFormat.JPEG,85,out))throw new IOException("artwork");atomic.finishWrite(out);return file.getAbsolutePath();}catch(Exception fail){if(out!=null)atomic.failWrite(out);return "";}finally{image.recycle();}
    }
}
