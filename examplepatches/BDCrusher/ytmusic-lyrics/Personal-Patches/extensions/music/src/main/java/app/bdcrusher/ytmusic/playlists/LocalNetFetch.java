/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.playlists;

import com.google.android.libraries.youtube.media.interfaces.*;
import com.google.android.apps.youtube.proto.streaming.BandwidthSamplingConfigOuterClass.BandwidthSamplingConfig;
import java.io.*;
import java.nio.ByteBuffer;
import java.util.*;
import java.util.concurrent.*;

/** Local bytes delivered through Music's own media-library callbacks. No HTTP server or second player. */
public final class LocalNetFetch extends NetFetch {
    private static final ExecutorService IO=Executors.newFixedThreadPool(4);
    private final NetFetch delegate;
    private LocalNetFetch(NetFetch delegate){this.delegate=delegate;}
    public static NetFetch wrap(NetFetch source){return source==null||source instanceof LocalNetFetch?source:new LocalNetFetch(source);}
    public static NetFetchTask local(HttpRequest request,NetFetchCallbacks callbacks){
        String uri=request.getUri();if(uri==null||!uri.startsWith(LocalPlayback.ORIGIN))return null;
        String id=uri.substring(LocalPlayback.ORIGIN.length()).split("[?&#]",2)[0];
        if(!id.matches("[A-Za-z0-9_-]{11}"))return null;
        Task task=new Task(request,callbacks,id);IO.execute(task);return task;
    }
    @Override public NetFetchTask startFetchTask(HttpRequest request,NetFetchCallbacks callbacks){NetFetchTask local=local(request,callbacks);return local==null?delegate.startFetchTask(request,callbacks):local;}
    @Override public void onDefaultNetworkAvailable(){delegate.onDefaultNetworkAvailable();}
    @Override public void onDefaultNetworkChange(int type){delegate.onDefaultNetworkChange(type);}
    @Override public void onDefaultNetworkUnavailable(){delegate.onDefaultNetworkUnavailable();}
    @Override public void onProxySettingsChange(String host,int port){delegate.onProxySettingsChange(host,port);}
    private static final class Task extends NetFetchTask implements Runnable {
        final HttpRequest request;final NetFetchCallbacks callbacks;final String id;volatile boolean cancelled;volatile FileInputStream input;
        Task(HttpRequest r,NetFetchCallbacks c,String id){request=r;callbacks=c;this.id=id;}
        @Override public void cancel(){cancelled=true;FileInputStream open=input;if(open!=null)try{open.close();}catch(IOException ignored){}}
        @Override public void onPauseBandwidthSamplingHint(BandwidthSamplingConfig config){}
        @Override public void onStartBandwidthSamplingHint(BandwidthSamplingConfig config){}
        public void run(){
            QoeError error=null;
            try{
                if(request.getMethod()!=HttpMethod.GET&&request.getMethod()!=HttpMethod.HEAD){callbacks.onHttpResponse(new HttpResponse(405,new ArrayList<>()));return;}
                LocalAudio.Source audio=LocalAudio.source(id);if(audio==null||LocalPlayback.response(id)==null)throw new IOException("Saved audio unavailable");long total=audio.length();String rangeHeader=null;
                ArrayList<HttpHeader> headers=request.getHeaders();if(headers!=null)for(HttpHeader h:headers)if("Range".equalsIgnoreCase(h.getKey())){
                    if(rangeHeader!=null)throw new IOException("Multiple ranges");rangeHeader=h.getValue();
                }
                String query=android.net.Uri.parse(request.getUri()).getQueryParameter("range");AudioRange range=AudioRange.parse(rangeHeader,query,total);long start=range.start(),end=range.end();boolean ranged=range.partial();
                if(!range.satisfiable()){callbacks.onHttpResponse(new HttpResponse(416,new ArrayList<>(List.of(new HttpHeader("Content-Range","bytes */"+total)))));return;}
                ArrayList<HttpHeader> response=new ArrayList<>();response.add(new HttpHeader("Content-Length",Long.toString(end-start+1)));response.add(new HttpHeader("Content-Type",audio.mime()));response.add(new HttpHeader("Accept-Ranges","bytes"));if(ranged)response.add(new HttpHeader("Content-Range","bytes "+start+"-"+end+"/"+total));
                if(cancelled)return;callbacks.onHttpResponse(new HttpResponse(ranged?206:200,response));
                if(request.getMethod()==HttpMethod.HEAD)return;
                try(FileInputStream file=audio.open()){input=file;file.getChannel().position(start);long remaining=end-start+1;byte[] buffer=new byte[64*1024];while(!cancelled&&remaining>0){int read=file.read(buffer,0,(int)Math.min(buffer.length,remaining));if(read<0)throw new EOFException();ByteBuffer nativeBuffer=ByteBuffer.allocateDirect(read);nativeBuffer.put(buffer,0,read).flip();callbacks.onBodyData(nativeBuffer);remaining-=read;}}
            }catch(Exception failure){if(!cancelled){error=new QoeError("BD_LOCAL_READ",new ArrayList<>());app.bdcrusher.ytmusic.common.FeatureDiagnostics.record("Offline-bytes","Native audio read failed: "+failure.getClass().getSimpleName());}}
            finally{input=null;callbacks.onDone(error,cancelled);}
        }
    }
}
