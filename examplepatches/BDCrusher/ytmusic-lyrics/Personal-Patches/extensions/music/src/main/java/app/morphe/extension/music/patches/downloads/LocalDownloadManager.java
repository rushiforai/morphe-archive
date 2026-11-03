/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/2528
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.extension.music.patches.downloads;

import static app.morphe.extension.shared.StringRef.str;

import android.annotation.SuppressLint;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Environment;

import androidx.annotation.Nullable;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;
import java.net.HttpURLConnection;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.atomic.AtomicLong;
import java.util.regex.Pattern;

import app.morphe.extension.music.patches.scrobbling.ScrobbleManager;
import app.morphe.extension.music.patches.spoof.SpoofVideoStreamsPatch;
import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.music.shared.VideoInformation;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Format;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayerResponse;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.ThumbnailEntry;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.VideoDetails;
import app.morphe.extension.shared.requests.Requester;
import app.morphe.extension.shared.spoof.requests.StreamingDataRequest;

/** Downloads the already resolved InnerTube audio stream without leaving YouTube Music. */
public final class LocalDownloadManager {

    private static final String DOWNLOAD_CHANNEL = "morphe_audio_downloads";
    private static final String USER_AGENT =
            "com.google.android.youtube/19.47.53 (Linux; U; Android 14) gzip";

    /** Ranges are fetched in parallel, which is what makes a download finish in seconds. */
    private static final int SEGMENT_COUNT = 4;
    private static final int BUFFER_SIZE = 64 * 1024;

    /**
     * The system silently drops notifications posted faster than a few per second, which used to
     * leave stale progress on screen after the download had finished. Updates are spaced out.
     */
    private static final long NOTIFICATION_INTERVAL_MILLISECONDS = 1000;
    private static final AtomicLong lastNotificationTime = new AtomicLong();

    private static final int CONNECT_TIMEOUT_MILLISECONDS = 15_000;
    private static final int READ_TIMEOUT_MILLISECONDS = 30_000;

    /** A range that makes no progress this many times in a row is treated as stalled. */
    private static final int MAX_STALLED_ATTEMPTS = 4;

    private static final Pattern VIDEO_ID = Pattern.compile("[A-Za-z0-9_-]{1,20}");

    private static final String THUMBNAIL_URL = "https://i.ytimg.com/vi/";

    private static final Set<String> ACTIVE_DOWNLOADS = ConcurrentHashMap.newKeySet();
    private record CachedOptions(long time, AudioOptions options) {}
    private static final java.util.Map<String,CachedOptions> OPTIONS = new java.util.LinkedHashMap<>(16,.75f,true);
    private static final java.util.Map<String,java.util.concurrent.FutureTask<AudioOptions>> RESOLVING = new ConcurrentHashMap<>();

    private LocalDownloadManager() {
    }

    /** Must be called from the main thread. Resolution and downloading happen in background. */
    public static void enqueue(String videoId) {
        if (videoId == null || !VIDEO_ID.matcher(videoId).matches()) {
            Utils.showToastShort(str("morphe_music_downloads_unknown_track"));
            return;
        }
        app.bdcrusher.ytmusic.playlists.DownloadPrompt.song(videoId);
    }

    /** A batch has already received its one quality confirmation. */
    public static void enqueueBatch(String videoId, app.bdcrusher.ytmusic.playlists.AudioQuality.Tier quality) {
        enqueueMedia(videoId,app.bdcrusher.ytmusic.playlists.MediaSelection.audio(quality));
    }

    private static final Object JOBS=new Object();
    private static final java.util.concurrent.Semaphore MEDIA_SLOTS=new java.util.concurrent.Semaphore(2,true);
    private static final java.util.Set<String> SCHEDULED=java.util.concurrent.ConcurrentHashMap.newKeySet(),CANCELLED=java.util.concurrent.ConcurrentHashMap.newKeySet();
    private static final java.util.Map<String,app.bdcrusher.ytmusic.playlists.MediaSelection> REQUESTED=new java.util.concurrent.ConcurrentHashMap<>();
    public static boolean active(String id){return ACTIVE_DOWNLOADS.contains(id);}
    public static void cancelQueued(String id){if(!active(id))CANCELLED.add(id);}
    private static app.bdcrusher.ytmusic.playlists.MediaSelection merge(app.bdcrusher.ytmusic.playlists.MediaSelection a,app.bdcrusher.ytmusic.playlists.MediaSelection b){return new app.bdcrusher.ytmusic.playlists.MediaSelection(a.kind()==app.bdcrusher.ytmusic.playlists.MediaSelection.Kind.VIDEO||b.kind()==app.bdcrusher.ytmusic.playlists.MediaSelection.Kind.VIDEO?app.bdcrusher.ytmusic.playlists.MediaSelection.Kind.VIDEO:app.bdcrusher.ytmusic.playlists.MediaSelection.Kind.AUDIO,a.audio().ceiling>=b.audio().ceiling?a.audio():b.audio(),Math.max(a.height(),b.height()));}
    private static app.bdcrusher.ytmusic.playlists.MediaSelection upgrade(String id,app.bdcrusher.ytmusic.playlists.MediaSelection completed){var requested=REQUESTED.get(id);var state=app.bdcrusher.ytmusic.playlists.DownloadCatalog.progress(id);if(requested!=null&&state!=null&&state.state().equals("complete")&&requested.kind()==app.bdcrusher.ytmusic.playlists.MediaSelection.Kind.VIDEO&&(completed.kind()!=requested.kind()||requested.height()>completed.height())){app.bdcrusher.ytmusic.playlists.DownloadCatalog.update(id,"queued",0,-1,"Video upgrade queued; audio retained",requested);return requested;}REQUESTED.remove(id);return null;}
    private static void finishJob(String id,app.bdcrusher.ytmusic.playlists.MediaSelection next){SCHEDULED.remove(id);if(next!=null)enqueueMedia(id,next);}
    public static void enqueueMedia(String videoId,app.bdcrusher.ytmusic.playlists.MediaSelection choice){
        if(choice==null||videoId==null||!videoId.matches("[A-Za-z0-9_-]{11}"))return;
        synchronized(JOBS){REQUESTED.merge(videoId,choice,LocalDownloadManager::merge);CANCELLED.remove(videoId);if(!SCHEDULED.add(videoId))return;}
        app.bdcrusher.ytmusic.playlists.DownloadCatalog.update(videoId,"queued",0,-1,"",choice);
        // Every file of a download is named after the id, so anything that is not a plain id
        // is refused rather than written under a different name than it is looked up by.
        if (!VIDEO_ID.matcher(videoId).matches()) {
            Logger.printDebug(() -> "Refusing to download an unusable id: " + videoId);
            Utils.showToastShort(str("morphe_music_downloads_unknown_track"));
            return;
        }

        // The scrobbler describes whatever the player is on, so it may only be used for that
        // track. Any other track is described by the video details of its own player response.
        final boolean isPlayingTrack = videoId.equals(VideoInformation.getVideoId());
        ScrobbleManager metadata = ScrobbleManager.getInstance();

        String title = isPlayingTrack ? metadata.getCurrentTitle() : null;
        String artist = isPlayingTrack ? metadata.getCurrentArtist() : null;
        String album = isPlayingTrack ? metadata.getCurrentAlbum() : null;
        int duration = isPlayingTrack ? metadata.getCurrentDurationSeconds() : 0;
        Bitmap artwork = isPlayingTrack ? metadata.getCurrentArtwork() : null;

        Utils.submitOnBackgroundThread(() -> {
            boolean acquired=false;try{MEDIA_SLOTS.acquire();acquired=true;if(CANCELLED.remove(videoId)){SCHEDULED.remove(videoId);REQUESTED.remove(videoId);app.bdcrusher.ytmusic.playlists.DownloadCatalog.update(videoId,"cancelled",0,-1,"Cancelled before download",choice);app.bdcrusher.ytmusic.playlists.PlaylistRuntime.finished(videoId);return null;}downloadBlocking(videoId, title, artist, album, duration, artwork, REQUESTED.getOrDefault(videoId,choice));}
            catch(InterruptedException cancelled){Thread.currentThread().interrupt();synchronized(JOBS){SCHEDULED.remove(videoId);REQUESTED.remove(videoId);}app.bdcrusher.ytmusic.playlists.DownloadCatalog.update(videoId,"failed",0,-1,"Interrupted; resume to continue",choice);app.bdcrusher.ytmusic.playlists.PlaylistRuntime.finished(videoId);}
            finally{if(acquired)MEDIA_SLOTS.release();}
            return null;
        });
    }

    private static void downloadBlocking(String videoId,String title,String artist,String album,
                                         int duration,Bitmap artwork,app.bdcrusher.ytmusic.playlists.MediaSelection selection){
        if(!ACTIVE_DOWNLOADS.add(videoId))return;
        try{
            Context context=Utils.getContext();File directory=app.bdcrusher.ytmusic.playlists.DownloadCatalog.directory();
            if(!directory.isDirectory()&&!directory.mkdirs())throw new IOException("Could not create download directory");
            AudioOptions options=mediaOptions(videoId,selection.kind()==app.bdcrusher.ytmusic.playlists.MediaSelection.Kind.VIDEO);
            Format audio=app.bdcrusher.ytmusic.playlists.AudioQuality.select(options.formats(),selection.audio());
            if(audio==null)throw new IOException("No accessible Opus stream returned");
            Format video=selection.kind()==app.bdcrusher.ytmusic.playlists.MediaSelection.Kind.VIDEO?selection.chooseVideo(options.formats(),app.bdcrusher.ytmusic.playlists.DownloadCatalog::videoSupported):null;
            VideoDetails details=options.details();if(!videoId.equals(details.getVideoId()))throw new IOException("Returned recording identity differs");
            title=firstNotBlank(title,details.getTitle(),videoId);artist=firstNotBlank(artist,stripTopic(details.getOwnerChannelName()),"");if(duration<=0)duration=details.getLengthSeconds();if(artwork==null)artwork=resolveArtwork(videoId,details);
            File saved=app.bdcrusher.ytmusic.playlists.PlaylistRuntime.audio(videoId);byte[] prior=app.bdcrusher.ytmusic.playlists.LocalPlayback.response(videoId);
            if(saved!=null&&prior!=null){boolean compatible=false;for(Format f:PlayerResponse.parseFrom(prior).getStreamingData().getAdaptiveFormatsList())if(f.getMimeType().startsWith("audio/")&&f.getItag()==audio.getItag()){audio=f;compatible=true;break;}if(!compatible){saved=null;prior=null;}}
            long audioBytes=audio.getContentLength(),videoBytes=video==null?0:video.getContentLength();long total=audioBytes>0&&(video==null||videoBytes>0)?audioBytes+videoBytes:-1;
            OfflineTrack.save(directory,videoId,title,artist,album,duration,artwork);
            beginPhase(videoId,selection,0,total);
            if(saved==null||prior==null){File temporary=new File(directory,videoId+".webm.part");downloadWithResume(videoId,title,audio.getUrl(),temporary,audioBytes,audio.getItag()+":"+audio.getMimeType());try{validateOpus(temporary);}catch(Exception invalid){RangeJournal.reset(temporary);throw invalid;}saved=new File(directory,videoId+".webm");finishMedia(temporary,saved);RangeJournal.finished(temporary);}
            OfflineTrack.save(directory,videoId,title,artist,album,duration,artwork);
            app.bdcrusher.ytmusic.playlists.LocalPlayback.saved(videoId,audio,details);
            if(video!=null){
                File destination=new File(directory,videoId+".video."+(video.getMimeType().contains("webm")?"webm":"mp4"));File existing=app.bdcrusher.ytmusic.playlists.DownloadCatalog.video(videoId);
                boolean reusable=false;if(existing!=null&&prior!=null)for(Format f:PlayerResponse.parseFrom(prior).getStreamingData().getAdaptiveFormatsList())if(f.getMimeType().startsWith("video/")&&f.getItag()==video.getItag()&&existing.length()==f.getContentLength()){reusable=true;break;}
                if(!reusable){beginPhase(videoId,selection,saved.length(),total);File temporary=new File(directory,destination.getName()+".part");downloadWithResume(videoId,title,video.getUrl(),temporary,videoBytes,video.getItag()+":"+video.getMimeType());try{validateVideo(temporary);}catch(Exception invalid){RangeJournal.reset(temporary);throw invalid;}finishMedia(temporary,destination);RangeJournal.finished(temporary);}
                app.bdcrusher.ytmusic.playlists.LocalPlayback.savedVideo(videoId,video,details,destination);if(app.bdcrusher.ytmusic.playlists.DownloadCatalog.video(videoId)==null)throw new IOException("Video saved; playback metadata needs repair");
            }
            app.bdcrusher.ytmusic.playlists.PlaylistArtwork.downloaded(videoId,new File(directory,videoId+".jpg"),details);
            final int savedDuration=duration;Utils.runOnBackgroundThread(()->app.bdcrusher.ytmusic.playlists.DownloadChapters.fetch(videoId,savedDuration));
            app.bdcrusher.ytmusic.lyrics.LyricsPrefetch.enqueue(context,videoId,title,artist,duration,result->{});
            if(app.bdcrusher.ytmusic.playlists.LocalPlayback.response(videoId)==null)throw new IOException("Media saved; playback metadata needs repair");
            String detail=selection.kind()==app.bdcrusher.ytmusic.playlists.MediaSelection.Kind.VIDEO&&video==null?"Audio only":video==null?"Audio":"Video + audio";
            app.bdcrusher.ytmusic.playlists.DownloadCatalog.complete(videoId,selection,detail);
            awaitNotificationSlot();showDownloadNotification(videoId,title,100,false,str("morphe_music_downloads_complete"));Utils.showToastShort(str("morphe_music_downloads_complete"));
        }catch(Exception failure){synchronized(OPTIONS){OPTIONS.remove(videoId);}app.bdcrusher.ytmusic.playlists.DownloadCatalog.update(videoId,"failed",0,-1,failure.getMessage(),selection);Logger.printException(()->"Local media download failed: "+videoId,failure);awaitNotificationSlot();showDownloadNotification(videoId,title,0,false,str("morphe_music_downloads_failed"));Utils.showToastShort(str("morphe_music_downloads_failed"));}
        finally{PHASES.remove(videoId);synchronized(JOBS){var next=upgrade(videoId,selection);ACTIVE_DOWNLOADS.remove(videoId);finishJob(videoId,next);}}
    }
    private record Phase(app.bdcrusher.ytmusic.playlists.MediaSelection selection,long base,long total){}
    private static final java.util.Map<String,Phase> PHASES=new java.util.concurrent.ConcurrentHashMap<>();
    private static void beginPhase(String id,app.bdcrusher.ytmusic.playlists.MediaSelection choice,long base,long total){PHASES.put(id,new Phase(choice,base,total));app.bdcrusher.ytmusic.playlists.DownloadCatalog.update(id,"downloading",base,total,"",choice);}
    private static void transferred(String id,long bytes){Phase phase=PHASES.get(id);if(phase!=null)app.bdcrusher.ytmusic.playlists.DownloadCatalog.update(id,"downloading",phase.base()+bytes,phase.total(),"",phase.selection());}
    private static void finishMedia(File temporary,File destination)throws IOException{
        java.nio.file.Files.move(temporary.toPath(),destination.toPath(),java.nio.file.StandardCopyOption.ATOMIC_MOVE,java.nio.file.StandardCopyOption.REPLACE_EXISTING);
    }
    private static void validateVideo(File file)throws IOException{
        android.media.MediaExtractor extractor=new android.media.MediaExtractor();try{extractor.setDataSource(file.getAbsolutePath());for(int n=0;n<extractor.getTrackCount();n++){String mime=extractor.getTrackFormat(n).getString(android.media.MediaFormat.KEY_MIME);if(mime!=null&&mime.startsWith("video/")){extractor.selectTrack(n);if(extractor.readSampleData(java.nio.ByteBuffer.allocate(4*1024*1024),0)>0)return;}}throw new IOException("No readable video stream");}finally{extractor.release();}
    }

    private record ResolvedStream(Format format, VideoDetails details) {
    }

    private static String firstNotBlank(@Nullable String value, String fallback, String lastResort) {
        if (value != null && !value.isBlank()) return value;
        if (!fallback.isBlank()) return fallback;
        return lastResort;
    }

    /** Music uploads are owned by an "Artist - Topic" channel, which is not the artist name. */
    private static String stripTopic(String channelName) {
        return channelName.endsWith(" - Topic")
                ? channelName.substring(0, channelName.length() - " - Topic".length())
                : channelName;
    }

    /** @return Whether a progress update may be posted without the system dropping it. */
    private static boolean canPostProgress() {
        long now = System.currentTimeMillis();
        long previous = lastNotificationTime.get();
        return now - previous >= NOTIFICATION_INTERVAL_MILLISECONDS
                && lastNotificationTime.compareAndSet(previous, now);
    }

    /**
     * Waits for the next slot, so a notification that matters is never the one being dropped.
     * The loop sleeps exactly as long as the slot is away, and repeats only if another thread
     * took the slot first. Must be called off the main thread.
     */
    private static void awaitNotificationSlot() {
        while (true) {
            long now = System.currentTimeMillis();
            long previous = lastNotificationTime.get();
            long remaining = NOTIFICATION_INTERVAL_MILLISECONDS - (now - previous);

            if (remaining <= 0) {
                if (lastNotificationTime.compareAndSet(previous, now)) return;
                continue;
            }

            try {
                //noinspection BusyWait
                Thread.sleep(remaining);
            } catch (InterruptedException ex) {
                Thread.currentThread().interrupt();
                return;
            }
        }
    }

    /**
     * Some videos come back without any video details, so the thumbnail of the id is used as a
     * fallback. It exists for every video, while the largest size does not.
     */
    @Nullable
    private static Bitmap resolveArtwork(String videoId, VideoDetails details) {
        Bitmap artwork = downloadArtwork(largestThumbnail(details));
        if (artwork != null) return artwork;

        artwork = downloadArtwork(THUMBNAIL_URL + videoId + "/maxresdefault.jpg");
        return artwork != null ? artwork : downloadArtwork(THUMBNAIL_URL + videoId + "/hqdefault.jpg");
    }

    @Nullable
    private static String largestThumbnail(VideoDetails details) {
        String url = null;
        int widest = 0;
        for (ThumbnailEntry entry : details.getThumbnail().getThumbnailsList()) {
            if (entry.getWidth() >= widest && !entry.getUrl().isBlank()) {
                widest = entry.getWidth();
                url = entry.getUrl();
            }
        }
        return url;
    }

    @Nullable
    private static Bitmap downloadArtwork(@Nullable String url) {
        if (url == null || url.isBlank()) return null;
        try (InputStream input = Requester.openConnection(url).getInputStream()) {
            return BitmapFactory.decodeStream(input);
        } catch (Exception ex) {
            Logger.printDebug(() -> "Could not fetch artwork: " + url, ex);
            return null;
        }
    }

    private static void downloadWithResume(String videoId, String title, String url,
                                           File temporary, long expectedLength,String formatKey) throws Exception {
        Utils.showToastShort(str("morphe_music_downloads_started"));
        awaitNotificationSlot();
        showDownloadNotification(videoId, title, 0, true, str("morphe_music_downloads_starting"));

        if (expectedLength <= 0) expectedLength = probeContentLength(url);
        final long totalLength = expectedLength;

        if (totalLength <= 0) {
            downloadUnknownLength(videoId,url, temporary);
        } else {
            downloadInParallel(videoId, title, url, temporary, totalLength,formatKey);
        }

        if (totalLength > 0 && temporary.length() != totalLength) {
            throw new IllegalStateException(
                    "Incomplete audio file: " + temporary.length() + "/" + totalLength);
        }
    }

    /** A completed HTTP response must also be playable Opus, not an error document or other codec. */
    private static void validateOpus(File audio) throws IOException {
        android.media.MediaExtractor extractor = new android.media.MediaExtractor();
        try {
            extractor.setDataSource(audio.getAbsolutePath());
            for (int i=0;i<extractor.getTrackCount();i++) {
                android.media.MediaFormat format=extractor.getTrackFormat(i);
                if (!"audio/opus".equals(format.getString(android.media.MediaFormat.KEY_MIME))) continue;
                extractor.selectTrack(i);
                if (extractor.readSampleData(java.nio.ByteBuffer.allocate(256*1024),0)>0) return;
            }
            throw new IOException("Downloaded file contains no readable Opus audio");
        } finally { extractor.release(); }
    }

    private static void downloadInParallel(String videoId, String title, String url,
                                           File temporary, long totalLength,String formatKey) throws Exception {
        RangeJournal journal=new RangeJournal(temporary,totalLength,formatKey);
        AtomicLong downloaded = new AtomicLong(journal.state.completed());
        transferred(videoId,downloaded.get());

        // Android's ExecutorService is not AutoCloseable, so it is shut down in the finally below.
        //noinspection resource
        ExecutorService executor = Executors.newFixedThreadPool(SEGMENT_COUNT);
        List<Future<?>> futures = new ArrayList<>();

        try {
            for (int index = 0; index < SEGMENT_COUNT; index++) {
                int segment=index;long start=journal.state.position(segment);
                long end=journal.state.end(segment);
                if (start > end) continue;

                futures.add(executor.submit(() -> {
                    downloadRange(url, temporary, start, end, journal,segment,downloaded, bytes -> {
                        transferred(videoId,bytes);
                        if (!canPostProgress()) return;
                        var shared=app.bdcrusher.ytmusic.playlists.DownloadCatalog.progress(videoId);
                        int progress=shared==null||shared.percent()<0?(int)Math.min(99,bytes*100/totalLength):shared.percent();
                        showDownloadNotification(videoId, title, progress, true,
                                str("morphe_music_downloads_progress", progress));
                    });
                    return null;
                }));
            }

            for (Future<?> future : futures) {
                future.get();
            }
        } finally {
            for (Future<?> future : futures) if (!future.isDone()) future.cancel(true);
            executor.shutdownNow();
            if (!executor.awaitTermination(CONNECT_TIMEOUT_MILLISECONDS+READ_TIMEOUT_MILLISECONDS+2000L,
                    java.util.concurrent.TimeUnit.MILLISECONDS)) throw new IOException("Audio workers did not stop safely");
        }
    }

    private static final class RangeJournal {
        final File temporary;final android.util.AtomicFile file;
        final app.bdcrusher.ytmusic.playlists.RangeResume state;final long[] checkpoint=new long[SEGMENT_COUNT];
        RangeJournal(File temporary,long total,String format)throws IOException{
            this.temporary=temporary;file=new android.util.AtomicFile(new File(temporary+".resume"));
            app.bdcrusher.ytmusic.playlists.RangeResume restored=null;
            if(temporary.isFile()&&temporary.length()==total)try(InputStream input=file.openRead()){restored=app.bdcrusher.ytmusic.playlists.RangeResume.read(input,total,SEGMENT_COUNT,format);}catch(IOException invalid){Logger.printDebug(()->"Starting this media variant with fresh ranges");}
            if(restored==null){restored=new app.bdcrusher.ytmusic.playlists.RangeResume(total,SEGMENT_COUNT,format);try(RandomAccessFile data=new RandomAccessFile(temporary,"rw")){data.setLength(0);data.setLength(total);data.getFD().sync();}}
            state=restored;for(int i=0;i<SEGMENT_COUNT;i++)checkpoint[i]=state.position(i);persist();
        }
        synchronized void advance(int segment,long position,boolean complete)throws IOException{
            // Only advertise durable bytes: flush the media before publishing the atomic journal.
            if(!complete&&position-checkpoint[segment]<1024*1024)return;
            try(RandomAccessFile data=new RandomAccessFile(temporary,"rw")){data.getFD().sync();}
            state.advance(segment,position);checkpoint[segment]=position;persist();
        }
        void persist()throws IOException{FileOutputStream out=null;try{out=file.startWrite();out.write(state.bytes());file.finishWrite(out);}catch(IOException failure){if(out!=null)file.failWrite(out);throw failure;}}
        static void finished(File temporary){new android.util.AtomicFile(new File(temporary+".resume")).delete();}
        static void reset(File temporary){try(RandomAccessFile data=new RandomAccessFile(temporary,"rw")){data.setLength(0);}catch(IOException ignored){}finished(temporary);}
    }

    private interface ProgressCallback {
        void update(long bytes);
    }

    private static void downloadRange(String url, File destination, long start, long end,
                                      RangeJournal journal,int segment,AtomicLong downloaded, ProgressCallback progress) throws Exception {
        long position = start;
        int failures = 0;

        while (position <= end) {
            if (Thread.currentThread().isInterrupted()) throw new java.io.InterruptedIOException("Audio range cancelled");
            long before = position;
            HttpURLConnection connection = openAudioConnection(url, position, end);

            try {
                if (connection.getResponseCode() != HttpURLConnection.HTTP_PARTIAL) {
                    throw new IllegalStateException(
                            "Range request returned HTTP " + connection.getResponseCode());
                }

                String contentRange=connection.getHeaderField("Content-Range");
                if(!("bytes "+position+"-"+end+"/"+destination.length()).equals(contentRange))throw new IOException("Download range response mismatch");
                try (InputStream input = connection.getInputStream();
                     RandomAccessFile output = new RandomAccessFile(destination, "rw")) {
                    output.seek(position);
                    byte[] buffer = new byte[BUFFER_SIZE];

                    while (position <= end) {
                        if (Thread.currentThread().isInterrupted()) throw new java.io.InterruptedIOException("Audio range cancelled");
                        int read = input.read(buffer, 0,
                                (int) Math.min(buffer.length, end - position + 1));
                        if (read < 0) break;

                        output.write(buffer, 0, read);
                        position += read;
                        journal.advance(segment,position,position>end);
                        progress.update(downloaded.addAndGet(read));
                    }
                }
            } catch (IOException ex) {
                Logger.printDebug(() -> "Audio range interrupted; retrying", ex);
            } finally {
                connection.disconnect();
            }

            failures = position > before ? 0 : failures + 1;
            if (failures >= MAX_STALLED_ATTEMPTS) {
                throw new IllegalStateException("Download range stalled at " + position);
            }
        }
    }

    private static long probeContentLength(String url) {
        HttpURLConnection connection = null;
        try {
            connection = openAudioConnection(url, 0, 0);
            if (connection.getResponseCode() != HttpURLConnection.HTTP_PARTIAL) return -1;

            String contentRange = connection.getHeaderField("Content-Range");
            if (contentRange == null) return -1;

            int slash = contentRange.lastIndexOf('/');
            return slash < 0 ? -1 : Long.parseLong(contentRange.substring(slash + 1));
        } catch (Exception ex) {
            Logger.printDebug(() -> "Could not probe audio length", ex);
            return -1;
        } finally {
            if (connection != null) connection.disconnect();
        }
    }

    private static HttpURLConnection openAudioConnection(String url, long start, long end) throws Exception {
        HttpURLConnection connection = Requester.openConnection(url);
        connection.setConnectTimeout(CONNECT_TIMEOUT_MILLISECONDS);
        connection.setReadTimeout(READ_TIMEOUT_MILLISECONDS);
        connection.setInstanceFollowRedirects(true);
        connection.setRequestProperty("User-Agent", USER_AGENT);
        connection.setRequestProperty("Referer", "https://music.youtube.com/");
        connection.setRequestProperty("Range", "bytes=" + start + "-" + end);
        return connection;
    }

    private static void downloadUnknownLength(String videoId,String url, File destination) throws Exception {
        HttpURLConnection connection = Requester.openConnection(url);
        connection.setConnectTimeout(CONNECT_TIMEOUT_MILLISECONDS);
        connection.setReadTimeout(READ_TIMEOUT_MILLISECONDS);
        connection.setRequestProperty("User-Agent", USER_AGENT);

        try {
            if (connection.getResponseCode() != HttpURLConnection.HTTP_OK) {
                throw new IllegalStateException("HTTP " + connection.getResponseCode());
            }

            try (InputStream input = connection.getInputStream();
                 FileOutputStream output = new FileOutputStream(destination)) {
                byte[] buffer = new byte[BUFFER_SIZE];
                int read;
                while ((read = input.read(buffer)) != -1) {
                    output.write(buffer, 0, read);transferred(videoId,destination.length());
                }
            }
        } finally {
            connection.disconnect();
        }
    }

    /**
     * Segments report progress from their own threads, and {@code notify} is a oneway binder
     * call whose order only holds per sending thread. Posting every update from the main thread
     * stops late progress from replacing the completed state on screen.
     */
    static void showDownloadNotification(String key, String title, int progress,
                                         boolean ongoing, String text) {
        Utils.runOnMainThread(() -> postDownloadNotification(key, title, progress, ongoing, text));
    }

    @SuppressLint("NotificationPermission") // The patch declares POST_NOTIFICATIONS.
    private static void postDownloadNotification(String key, String title, int progress,
                                                 boolean ongoing, String text) {
        Context context = Utils.getContext();
        NotificationManager manager =
                (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
        if (manager == null) return;

        manager.createNotificationChannel(new NotificationChannel(DOWNLOAD_CHANNEL,
                str("morphe_music_downloads_notification_channel"),
                NotificationManager.IMPORTANCE_LOW));

        Notification.Builder builder = new Notification.Builder(context, DOWNLOAD_CHANNEL);
        builder.setSmallIcon(ongoing
                        ? android.R.drawable.stat_sys_download
                        : android.R.drawable.stat_sys_download_done)
                .setContentTitle(title == null || title.isBlank() ? "YouTube Music" : title)
                .setContentText(text)
                .setOngoing(ongoing)
                .setOnlyAlertOnce(true);

        if (ongoing) builder.setProgress(100, Math.max(0, progress), progress < 0);
        manager.notify(key.hashCode(), builder.build());
    }

    @Nullable
    private static ResolvedStream resolveStream(String videoId, app.bdcrusher.ytmusic.playlists.AudioQuality.Tier quality) {
        AudioOptions options = options(videoId);
        Format format = app.bdcrusher.ytmusic.playlists.AudioQuality.select(options.formats(), quality);
        return format == null ? null : new ResolvedStream(format, options.details());
    }

    public record AudioOptions(List<Format> formats, VideoDetails details, int seconds) {}

    public static AudioOptions options(String videoId) {
        Utils.verifyOffMainThread();
        synchronized (OPTIONS) {
            CachedOptions cached = OPTIONS.get(videoId);
            if (cached != null && android.os.SystemClock.elapsedRealtime()-cached.time()<180000) return cached.options();
        }
        java.util.concurrent.FutureTask<AudioOptions> created = new java.util.concurrent.FutureTask<>(() -> freshOptions(videoId));
        java.util.concurrent.FutureTask<AudioOptions> task = RESOLVING.putIfAbsent(videoId,created);
        if (task == null) task = created;
        task.run();
        try {
            AudioOptions result = task.get(45,java.util.concurrent.TimeUnit.SECONDS);
            if (!result.formats().isEmpty()) synchronized (OPTIONS) {
                OPTIONS.put(videoId,new CachedOptions(android.os.SystemClock.elapsedRealtime(),result));
                while (OPTIONS.size()>16) OPTIONS.remove(OPTIONS.keySet().iterator().next());
            }
            return result;
        } catch (Exception failure) {
            if (failure instanceof InterruptedException) Thread.currentThread().interrupt();
            return new AudioOptions(List.of(),VideoDetails.getDefaultInstance(),0);
        } finally { if (task.isDone()) RESOLVING.remove(videoId,task); }
    }

    public static AudioOptions mediaOptions(String id,boolean video){
        AudioOptions audio=options(id);if(!video)return audio;
        try{StreamingDataRequest request=StreamingDataRequest.fetchRequestForDownload(id,SpoofVideoStreamsPatch.getAvailableClients(),Settings.SPOOF_VIDEO_STREAMS_CLIENT_TYPE.get());var stream=request.getStream();if(stream==null)return audio;PlayerResponse response=PlayerResponse.parseFrom(stream.streamingData());if(response.hasPlayabilityStatus()&&response.getPlayabilityStatus().getStatus()!=app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Status.OK)return audio;
            java.util.Map<Integer,Format> formats=new java.util.LinkedHashMap<>();for(Format f:audio.formats())formats.put(f.getItag(),f);for(Format f:response.getStreamingData().getAdaptiveFormatsList())formats.put(f.getItag(),f);
            VideoDetails details=response.getVideoDetails();if(!id.equals(details.getVideoId()))return audio;return new AudioOptions(java.util.List.copyOf(formats.values()),details,details.getLengthSeconds());
        }catch(Exception unavailable){Logger.printDebug(()->"Video formats unavailable; retained audio",unavailable);return audio;}
    }

    private static AudioOptions freshOptions(String videoId) {
        // Playback-only responses can omit videoDetails and cannot name an offline recording.
        StreamingDataRequest request = StreamingDataRequest.fetchRequestForOpusDownload(videoId,
                    SpoofVideoStreamsPatch.getAvailableClients(),
                    Settings.SPOOF_VIDEO_STREAMS_CLIENT_TYPE.get());

        StreamingDataRequest.StreamData stream = request.getStream();
        if (stream == null) {
            Logger.printDebug(() -> "No stream data resolved for " + videoId);
            return new AudioOptions(List.of(), VideoDetails.getDefaultInstance(), 0);
        }

        try {
            PlayerResponse response = PlayerResponse.parseFrom(stream.streamingData());
            if(!videoId.equals(response.getVideoDetails().getVideoId())||response.hasPlayabilityStatus()&&response.getPlayabilityStatus().getStatus()!=app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Status.OK)return new AudioOptions(List.of(),VideoDetails.getDefaultInstance(),0);
            return new AudioOptions(response.getStreamingData().getAdaptiveFormatsList(),
                    response.getVideoDetails(), response.getVideoDetails().getLengthSeconds());
        } catch (Exception ex) {
            Logger.printException(() -> "Could not parse audio formats: " + videoId, ex);
            return new AudioOptions(List.of(), VideoDetails.getDefaultInstance(), 0);
        }
    }
}
