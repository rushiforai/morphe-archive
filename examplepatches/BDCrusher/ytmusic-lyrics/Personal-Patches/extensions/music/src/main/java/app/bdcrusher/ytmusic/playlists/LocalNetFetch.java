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
        String uri=request.getUri();if(uri==null)return null;boolean video=uri.startsWith(LocalPlayback.VIDEO_ORIGIN);if(!video&&!uri.startsWith(LocalPlayback.ORIGIN))return null;
        String id=uri.substring((video?LocalPlayback.VIDEO_ORIGIN:LocalPlayback.ORIGIN).length()).split("[?&#]",2)[0];
        if(!id.matches("[A-Za-z0-9_-]{11}"))return null;
        Task task=new Task(request,callbacks,id,video);IO.execute(task);return task;
    }
    @Override public NetFetchTask startFetchTask(HttpRequest request,NetFetchCallbacks callbacks){NetFetchTask local=local(request,callbacks);return local==null?delegate.startFetchTask(request,callbacks):local;}
    @Override public void onDefaultNetworkAvailable(){delegate.onDefaultNetworkAvailable();}
    @Override public void onDefaultNetworkChange(int type){delegate.onDefaultNetworkChange(type);}
    @Override public void onDefaultNetworkUnavailable(){delegate.onDefaultNetworkUnavailable();}
    @Override public void onProxySettingsChange(String host,int port){delegate.onProxySettingsChange(host,port);}
    private static final class Task extends NetFetchTask implements Runnable {
        final HttpRequest request;final NetFetchCallbacks callbacks;final String id;final boolean video;volatile boolean cancelled;volatile InputStream input;volatile java.net.HttpURLConnection connection;
        Task(HttpRequest r,NetFetchCallbacks c,String id,boolean video){request=r;callbacks=c;this.id=id;this.video=video;}
        @Override public void cancel(){cancelled=true;InputStream open=input;if(open!=null)try{open.close();}catch(IOException ignored){}java.net.HttpURLConnection c=connection;if(c!=null)c.disconnect();}
        @Override public void onPauseBandwidthSamplingHint(BandwidthSamplingConfig config){}
        @Override public void onStartBandwidthSamplingHint(BandwidthSamplingConfig config){}
        public void run(){
            QoeError error=null;
            try{
                if(request.getMethod()!=HttpMethod.GET&&request.getMethod()!=HttpMethod.HEAD){callbacks.onHttpResponse(new HttpResponse(405,new ArrayList<>()));return;}
                LocalAudio.Source audio=LocalAudio.source(id,video);if(audio!=null&&LocalPlayback.response(id)==null)audio=null;var fallback=LocalPlayback.network(id,video);
                long total=audio==null?fallback==null?-1:fallback.getContentLength():audio.length();
                if(total<=0)throw new IOException("Saved media unavailable");String rangeHeader=null;
                ArrayList<HttpHeader> headers=request.getHeaders();if(headers!=null)for(HttpHeader h:headers)if("Range".equalsIgnoreCase(h.getKey())){
                    if(rangeHeader!=null)throw new IOException("Multiple ranges");rangeHeader=h.getValue();
                }
                String query=android.net.Uri.parse(request.getUri()).getQueryParameter("range");AudioRange range=AudioRange.parse(rangeHeader,query,total);long start=range.start(),end=range.end();boolean ranged=range.partial();
                if(!range.satisfiable()){callbacks.onHttpResponse(new HttpResponse(416,new ArrayList<>(List.of(new HttpHeader("Content-Range","bytes */"+total)))));return;}
                ArrayList<HttpHeader> response=new ArrayList<>();response.add(new HttpHeader("Content-Length",Long.toString(end-start+1)));response.add(new HttpHeader("Content-Type",audio==null?fallback.getMimeType():audio.mime()));response.add(new HttpHeader("Accept-Ranges","bytes"));if(ranged)response.add(new HttpHeader("Content-Range","bytes "+start+"-"+end+"/"+total));
                if(cancelled)return;callbacks.onHttpResponse(new HttpResponse(ranged?206:200,response));
                if(request.getMethod()==HttpMethod.HEAD)return;
                long position=start;
                try{
                    if(audio==null)throw new FileNotFoundException("Saved media missing");
                    try(FileInputStream file=audio.open()){
                        input=file;file.getChannel().position(start);byte[] buffer=new byte[64*1024];
                        while(!cancelled&&position<=end){int read=file.read(buffer,0,(int)Math.min(buffer.length,end-position+1));if(read<0)throw new EOFException();deliver(buffer,read);position+=read;}
                    }
                }catch(IOException localFailure){
                    LocalPlayback.unreadable(id);if(cancelled)return;
                    if(fallback==null||PlaylistBrowse.offline())throw localFailure;
                    connection=app.morphe.extension.shared.requests.Requester.openConnection(fallback.getUrl());
                    connection.setConnectTimeout(15000);connection.setReadTimeout(30000);
                    connection.setRequestProperty("Range","bytes="+position+"-"+end);
                    try{
                        if(connection.getResponseCode()!=206)throw new IOException("Stream fallback did not honor the remaining range");
                        String returnedRange=connection.getHeaderField("Content-Range");
                        if(!("bytes "+position+"-"+end+"/"+total).equals(returnedRange))throw new IOException("Stream fallback range mismatch");
                        try(InputStream remote=connection.getInputStream()){
                            input=remote;byte[] buffer=new byte[64*1024];
                            while(!cancelled&&position<=end){int read=remote.read(buffer,0,(int)Math.min(buffer.length,end-position+1));if(read<0)throw new EOFException();deliver(buffer,read);position+=read;}
                        }
                    }finally{connection.disconnect();connection=null;}
                }
            }catch(Exception failure){if(!cancelled){error=new QoeError("BD_LOCAL_READ",new ArrayList<>());app.bdcrusher.ytmusic.common.FeatureDiagnostics.record("Offline-bytes","Native media read failed: "+failure.getClass().getSimpleName());}}
            finally{input=null;callbacks.onDone(error,cancelled);}
        }
        private void deliver(byte[] bytes,int count){ByteBuffer nativeBuffer=ByteBuffer.allocateDirect(count);nativeBuffer.put(bytes,0,count).flip();callbacks.onBodyData(nativeBuffer);
        }
    }
}
