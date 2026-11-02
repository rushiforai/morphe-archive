/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.playlists;

import android.net.Uri;
import android.os.ParcelFileDescriptor;
import java.io.*;
import java.nio.channels.FileChannel;
import app.morphe.extension.shared.Utils;

/** Read-only seekable bytes from owned audio or an indexed, still-granted SAF document. */
public final class LocalAudio {
    private LocalAudio(){}
    public record Source(File file,String uri,long length,String mime){
        public FileInputStream open()throws IOException{
            if(file!=null)return new FileInputStream(file);
            if(!ExternalFiles.owns(Utils.getContext(),uri))throw new IOException("Folder grant or indexed file changed");
            ParcelFileDescriptor descriptor=Utils.getContext().getContentResolver().openFileDescriptor(Uri.parse(uri),"r");
            if(descriptor==null)throw new IOException("Audio document unavailable");
            ParcelFileDescriptor.AutoCloseInputStream input=new ParcelFileDescriptor.AutoCloseInputStream(descriptor);
            try{FileChannel channel=input.getChannel();if(channel.size()!=length)throw new IOException("Audio document changed");channel.position(0);return input;}
            catch(IOException failure){input.close();throw failure;}
        }
    }
    static Source source(String id){
        File own=PlaylistRuntime.audio(id);if(own!=null)return new Source(own,"",own.length(),own.getName().endsWith(".webm")?"audio/webm":"audio/mp4");
        ExternalFiles.Item item=ExternalFiles.get(id);if(item==null||item.nativeResponse()==null||!ExternalFiles.granted(Utils.getContext()))return null;
        try{var response=app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayerResponse.parseFrom(item.nativeResponse());String mime=response.getStreamingData().getAdaptiveFormats(0).getMimeType().split(";",2)[0];return new Source(null,item.uri(),item.bytes(),mime);}catch(Exception invalid){return null;}
    }
}
