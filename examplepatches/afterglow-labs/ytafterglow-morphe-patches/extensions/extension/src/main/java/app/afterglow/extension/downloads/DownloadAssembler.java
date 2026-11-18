package app.afterglow.extension.downloads;

import android.media.MediaCodec;
import android.media.MediaExtractor;
import android.media.MediaFormat;
import android.media.MediaMuxer;

import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;

/** Android container assembly copies encoded samples without changing their quality. */
final class DownloadAssembler {
    static final class Input {
        final File file;final DownloadResolver.Role role;
        Input(File file,DownloadResolver.Role role) {this.file=file;this.role=role;}
    }
    private static final class Source {
        final MediaExtractor extractor;final int muxTrack;
        Source(MediaExtractor extractor,int muxTrack) {this.extractor=extractor;this.muxTrack=muxTrack;}
    }
    static void assemble(List<Input> inputs,File output,String container,DownloadRequest.Kind kind,
                         DownloadResolver.Cancellation cancellation) throws IOException {
        cancellation.throwIfCancelled();
        if(kind==DownloadRequest.Kind.CAPTIONS || kind==DownloadRequest.Kind.THUMBNAIL) {
            if(inputs.size()!=1) throw new IOException("This download requires one source file.");
            validateDirect(inputs.get(0).file,container,kind);
            DownloadStorage.move(inputs.get(0).file,output);return;
        }
        int format;
        if(container.equals("mp4") || container.equals("m4a")) format=MediaMuxer.OutputFormat.MUXER_OUTPUT_MPEG_4;
        else if(container.equals("webm")) format=MediaMuxer.OutputFormat.MUXER_OUTPUT_WEBM;
        else throw new IOException("Choose MP4, M4A, or WebM for this download.");
        if(output.exists() && !output.delete()) throw new IOException("The previous assembly file could not be replaced.");
        MediaMuxer muxer=null;List<Source> sources=new ArrayList<>();boolean started=false,success=false;
        try {
            muxer=new MediaMuxer(output.getPath(),format);boolean hasVideo=false,hasAudio=false;
            for(Input input:inputs) {
                MediaExtractor probe=new MediaExtractor();
                try {
                    probe.setDataSource(input.file.getPath());
                    for(int index=0;index<probe.getTrackCount();index++) {
                        MediaFormat track=probe.getTrackFormat(index);String mime=track.getString(MediaFormat.KEY_MIME);
                        boolean video=mime!=null && mime.startsWith("video/"), audio=mime!=null && mime.startsWith("audio/");
                        if(!video && !audio || video && (kind==DownloadRequest.Kind.AUDIO || input.role==DownloadResolver.Role.AUDIO || hasVideo) || audio && (input.role==DownloadResolver.Role.VIDEO || hasAudio)) continue;
                        if(!supported(mime,format)) throw new IOException("The selected codecs cannot be saved in this container.");
                        MediaExtractor extractor=new MediaExtractor();
                        try {extractor.setDataSource(input.file.getPath());extractor.selectTrack(index);int muxTrack=muxer.addTrack(track);sources.add(new Source(extractor,muxTrack));}
                        catch(Exception e) {extractor.release();throw e;}
                        if(video) {
                            hasVideo=true;
                            if(track.containsKey(MediaFormat.KEY_ROTATION)) muxer.setOrientationHint(track.getInteger(MediaFormat.KEY_ROTATION));
                        }
                        if(audio) hasAudio=true;
                    }
                }finally {probe.release();}
            }
            if(kind==DownloadRequest.Kind.VIDEO && !hasVideo || kind==DownloadRequest.Kind.AUDIO && !hasAudio) throw new IOException("The selected media track is unavailable.");
            if(inputs.stream().anyMatch(i->i.role==DownloadResolver.Role.AUDIO) && !hasAudio) throw new IOException("The selected audio track is unavailable.");
            muxer.start();started=true;ByteBuffer buffer=ByteBuffer.allocateDirect(1024*1024);MediaCodec.BufferInfo info=new MediaCodec.BufferInfo();long samples=0;
            while(true) {
                cancellation.throwIfCancelled();Source next=null;long time=Long.MAX_VALUE;
                for(Source source:sources) {long t=source.extractor.getSampleTime();if(t>=0 && t<time){time=t;next=source;}}
                if(next==null) break;
                long size=next.extractor.getSampleSize();if(size<0 || size>32L*1024*1024) throw new IOException("This media sample is too large.");
                if(size>buffer.capacity()) buffer=ByteBuffer.allocateDirect((int)size);
                buffer.clear();int read=next.extractor.readSampleData(buffer,0);if(read<0) throw new IOException("The media sample could not be read.");
                int flags=next.extractor.getSampleFlags();
                if((flags&MediaExtractor.SAMPLE_FLAG_ENCRYPTED)!=0) throw new IOException("Encrypted media cannot be downloaded.");
                // Keep original timestamps: supported MP4 B-frames can reorder presentation times.
                info.set(0,read,time,(flags&MediaExtractor.SAMPLE_FLAG_SYNC)!=0?MediaCodec.BUFFER_FLAG_KEY_FRAME:0);
                muxer.writeSampleData(next.muxTrack,buffer,info);samples++;next.extractor.advance();
                if((samples&255)==0 && output.getParentFile().getUsableSpace()<DownloadPolicy.DISK_RESERVE) throw new IOException("Not enough storage to finish this download.");
            }
            if(samples==0) throw new IOException("The downloaded media contains no samples.");
            muxer.stop();started=false;cancellation.throwIfCancelled();success=true;
        }catch(IOException e) {throw e;}catch(Exception e) {throw new IOException("Android could not assemble this format. Try another MP4 or WebM option.");}
        finally {
            for(Source source:sources) source.extractor.release();
            if(muxer!=null) {try {if(started)muxer.stop();}catch(Exception ignored){}try{muxer.release();}catch(Exception ignored){}}
            if(!success) output.delete();
        }
    }
    private static boolean supported(String mime,int format) {
        if(format==MediaMuxer.OutputFormat.MUXER_OUTPUT_WEBM) return mime.equals("video/x-vnd.on2.vp8") || mime.equals("video/x-vnd.on2.vp9") || mime.equals("audio/vorbis") || mime.equals("audio/opus");
        return mime.equals("video/avc") || mime.equals("video/hevc") || mime.equals("video/mp4v-es") || mime.equals("video/av01") && android.os.Build.VERSION.SDK_INT>=34 || mime.equals("audio/mp4a-latm");
    }
    private static void validateDirect(File file,String container,DownloadRequest.Kind kind) throws IOException {
        if(!file.isFile() || file.length()==0)throw new IOException("The downloaded file is empty.");
        if(kind==DownloadRequest.Kind.THUMBNAIL) {
            android.graphics.BitmapFactory.Options options=new android.graphics.BitmapFactory.Options();options.inJustDecodeBounds=true;
            android.graphics.BitmapFactory.decodeFile(file.getPath(),options);
            if(options.outWidth<=0 || options.outHeight<=0)throw new IOException("The downloaded thumbnail is not an image.");
        }else {
            if(file.length()>32L*1024*1024)throw new IOException("This caption file is too large.");
            byte[] prefix=new byte[(int)Math.min(file.length(),4096)];
            try(java.io.FileInputStream in=new java.io.FileInputStream(file)){int read=in.read(prefix);if(read<0)throw new IOException("Empty captions.");}
            String text=new String(prefix,java.nio.charset.StandardCharsets.UTF_8).replace("\ufeff","").trim();
            if(container.equals("vtt") && !text.startsWith("WEBVTT") || container.equals("srt") && !text.contains(" --> ") || text.toLowerCase(java.util.Locale.ROOT).startsWith("<!doctype html") || text.toLowerCase(java.util.Locale.ROOT).startsWith("<html"))throw new IOException("YouTube did not return a valid caption file.");
        }
    }
}
