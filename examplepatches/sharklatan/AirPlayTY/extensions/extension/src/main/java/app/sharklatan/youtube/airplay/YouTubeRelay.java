package app.sharklatan.youtube.airplay;

import java.io.*;
import java.net.*;
import java.nio.*;
import java.nio.charset.StandardCharsets;
import java.util.*;

/** Relays existing signed media URLs; never forwards account credentials to a TV.
 * Separate AVC/AAC tracks are exposed as HLS fMP4 using their real SIDX indexes. */
final class YouTubeRelay {
    interface Reporter{void log(String value);}
    final ClassLoader loader;final Reporter log;
    final String token=UUID.randomUUID().toString();
    Track video,audio;String combined,userAgent="Mozilla/5.0";
    volatile boolean audioOnly;
    String videoId="";
    YouTubeRelay(ClassLoader loader,Reporter log){this.loader=loader;this.log=log;}
    static boolean ready(ClassLoader loader,String id){try{
        Class<?> requests=loader.loadClass("app.morphe.extension.shared.spoof.requests.StreamingDataRequest");
        Object request=requests.getMethod("getRequestForVideoId",String.class).invoke(null,id);
        if(request==null)return false; java.lang.reflect.Field pending=requests.getDeclaredField("future");pending.setAccessible(true);return ((java.util.concurrent.Future<?>)pending.get(request)).isDone();
    }catch(Exception e){return false;}}
    void prepare() throws Exception {
        Class<?> info=loader.loadClass("app.morphe.extension.youtube.patches.VideoInformation");
        String id=(String)info.getMethod("getVideoId").invoke(null);
        if(id==null||id.isEmpty())throw new IOException("Abre primero un vídeo de YouTube.");
        Class<?> requests=loader.loadClass("app.morphe.extension.shared.spoof.requests.StreamingDataRequest");
        Class<?> proto=loader.loadClass("app.morphe.extension.shared.innertube.PlayerResponseOuterClass$PlayerResponse");
        /* Right after a video opens YouTube has not fetched its stream data yet, so getStream()
         * returns null and the old code aborted immediately: that is why AirPlay sometimes failed
         * and sometimes worked. Poll instead of failing, but only for a few seconds so the button
         * still answers quickly when the data is simply not there. */
        Object request=null,data=null;
        boolean diagnosed=false,retried=false;
        long deadline=System.currentTimeMillis()+8000;
        while(true){
            String current=(String)info.getMethod("getVideoId").invoke(null);
            if(current==null||current.isEmpty()||!current.equals(id)){
                if(current==null||current.isEmpty())throw new IOException("Abre primero un vídeo de YouTube.");
                id=current; /* The user moved to another video while we were waiting. */
            }
            request=requests.getMethod("getRequestForVideoId",String.class).invoke(null,id);
            if(!diagnosed){log.log("Relay: solicitud="+(request!=null)+" video="+id);diagnosed=true;}
            if(request!=null)try{
                Object stream=requests.getMethod("getStream").invoke(request); byte[] response=stream==null?null:(byte[])stream.getClass().getMethod("streamingData").invoke(stream);
                if(response==null){
                    if(retried)throw new IOException("YouTube no devolvió datos de transmisión para este vídeo.");
                    retried=true;log.log("Relay: se renueva una solicitud terminada sin datos, conservando el cliente configurado.");
                    requests.getMethod("fetchRequest",String.class,Map.class).invoke(null,id,Collections.emptyMap());
                    continue;
                }
                log.log("Relay: respuesta disponible, bytes="+response.length);
                if(response.length>0){
                    Object parsed=proto.getMethod("parseFrom",byte[].class).invoke(null,(Object)response);
                    data=proto.getMethod("getStreamingData").invoke(parsed);
                }
            }catch(Exception partial){android.util.Log.e("YouTubeAirPlay","Relay preparation failed",partial);throw new IOException("No se pudieron leer los datos de reproducción: "+partial.toString(),partial);}
            if(data!=null)break;
            if(System.currentTimeMillis()>=deadline)
                throw new IOException("YouTube aún está preparando este vídeo ("+id+"). Vuelve a tocar AirPlay en un segundo.");
            Thread.sleep(250);
        }
        videoId=id;
        List<?> formats=(List<?>)data.getClass().getMethod("getFormatsList").invoke(data);
        String best=null;int bestScore=-1;
        for(Object f:formats){String u=(String)f.getClass().getMethod("getUrl").invoke(f);int itag=itag(u),score=itag==22?2:itag==18?1:-1;
            if(score>bestScore){best=u;bestScore=score;}}
        try {
            Class<?> spoof=loader.loadClass("app.morphe.extension.shared.spoof.SpoofVideoStreamsPatch");
            Object client=spoof.getMethod("getPreferredClient").invoke(null);userAgent=(String)client.getClass().getField("userAgent").get(client);
        }catch(Exception ignored){}
        List<?> adaptive=(List<?>)data.getClass().getMethod("getAdaptiveFormatsList").invoke(data);
        String v=null,a=null;int score=-1;
        for(Object f:adaptive){String u=(String)f.getClass().getMethod("getUrl").invoke(f);int itag=itag(u);
            int rank=itag==136?3:itag==135?2:itag==134?1:-1;
            if(rank>score){v=u;score=rank;}if(itag==140)a=u;}
        if(v==null||a==null){if(best!=null){validate(best);combined=best;probe(best);log.log("Transmisión combinada disponible; solo audio requiere una pista AAC separada.");return;}
            throw new IOException("No se encontró una pareja AVC/AAC compatible con AirPlay. No se cambiará la calidad de YouTube.");}
        video=index(v);audio=index(a);log.log("Vídeo AVC y audio AAC preparados para AirPlay.");
    }
    static int itag(String url){try{for(String p:new URI(url).getRawQuery().split("&"))if(p.startsWith("itag="))return Integer.parseInt(p.substring(5));}catch(Exception ignored){}return -1;}
    static void validate(String value) throws Exception {
        URI uri=new URI(value);String host=uri.getHost();
        if(!"https".equals(uri.getScheme())||host==null||!host.endsWith(".googlevideo.com"))throw new IOException("La transmisión no procede del servidor de vídeo esperado.");
    }
    HttpURLConnection open(String url,String range) throws Exception {
        validate(url);HttpURLConnection c=(HttpURLConnection)new URL(url).openConnection();
        c.setConnectTimeout(10000);c.setReadTimeout(15000);c.setRequestProperty("User-Agent",userAgent);
        c.setRequestProperty("Accept-Encoding","identity");if(range!=null)c.setRequestProperty("Range",range);
        int status=c.getResponseCode();
        if(status!=200&&status!=206){c.disconnect();throw new IOException("El servidor de YouTube rechazó los datos: HTTP "+status);}
        return c;
    }
    void probe(String url) throws Exception {HttpURLConnection c=open(url,"bytes=0-0");try(InputStream in=c.getInputStream()){if(in.read()<0)throw new EOFException();}finally{c.disconnect();}}
    static final class Segment{long offset,length;double duration;Segment(long o,long l,double d){offset=o;length=l;duration=d;}}
    static final class Track{String url;long initLength;List<Segment> segments=new ArrayList<>();}
    Track index(String url) throws Exception {
        HttpURLConnection c=open(url,"bytes=0-262143");byte[] head;
        try(InputStream in=c.getInputStream()){ByteArrayOutputStream out=new ByteArrayOutputStream();copy(in,out,262144);head=out.toByteArray();}finally{c.disconnect();}
        Track track=parseIndex(head);track.url=url;return track;
    }
    static Track parseIndex(byte[] bytes) throws IOException {
        ByteBuffer b=ByteBuffer.wrap(bytes).order(ByteOrder.BIG_ENDIAN);
        try{while(b.remaining()>=8){int start=b.position();long size=b.getInt()&0xffffffffL;int type=b.getInt();
            if(size<8||size>Integer.MAX_VALUE)break;
            if(type==0x73696478){int version=(b.getInt()>>>24);b.getInt();long scale=b.getInt()&0xffffffffL;if(scale==0)throw new IOException("Escala SIDX no válida.");
                long earliest=version==0?(b.getInt()&0xffffffffL):b.getLong();long offset=version==0?(b.getInt()&0xffffffffL):b.getLong();
                b.getShort();int count=b.getShort()&65535;Track t=new Track();t.initLength=start;
                long position=start+size+offset;
                for(int i=0;i<count;i++){long reference=b.getInt()&0xffffffffL;if((reference&0x80000000L)!=0)throw new IOException("SIDX jerárquico no compatible.");long duration=b.getInt()&0xffffffffL;b.getInt();t.segments.add(new Segment(position,reference,duration/(double)scale));position+=reference;}
                if(t.initLength<8||t.segments.isEmpty())throw new IOException("Índice de vídeo vacío.");return t;
            }
            if(start+size>bytes.length)break;b.position((int)(start+size));
        }}catch(BufferUnderflowException e){throw new IOException("Índice SIDX incompleto.",e);}
        throw new IOException("Esta transmisión no contiene un índice fMP4 compatible en su cabecera.");
    }
    String url(String address,int port){if(audioOnly&&audio==null)throw new IllegalStateException("Este vídeo no ofrece una pista de audio separada compatible.");return "http://"+address+":"+port+"/"+token+(audioOnly?"/audio.m3u8":combined==null?"/master.m3u8":"/video.mp4");}
    String playlist(Track track,String prefix){double max=1;for(Segment s:track.segments)max=Math.max(max,s.duration);
        StringBuilder p=new StringBuilder("#EXTM3U\n#EXT-X-VERSION:7\n#EXT-X-TARGETDURATION:"+(int)Math.ceil(max)+"\n#EXT-X-PLAYLIST-TYPE:VOD\n#EXT-X-MEDIA-SEQUENCE:0\n#EXT-X-MAP:URI=\""+prefix+"/init.mp4\"\n");
        for(int i=0;i<track.segments.size();i++)p.append(String.format(Locale.ROOT,"#EXTINF:%.6f,\n%s/%d.m4s\n",track.segments.get(i).duration,prefix,i));
        return p.append("#EXT-X-ENDLIST\n").toString();
    }
    void serve(Socket peer){try(Socket s=peer){s.setSoTimeout(15000);InputStream in=s.getInputStream();String first=line(in);if(first==null)return;String[] request=first.split(" ");String range=null,h;
        while((h=line(in))!=null&&!h.isEmpty())if(h.toLowerCase(Locale.ROOT).startsWith("range:"))range=h.substring(6).trim();
        String path=request[1];String base="/"+token+"/";OutputStream out=s.getOutputStream();
        int query=path.indexOf('?');if(query>=0)path=path.substring(0,query);
        if(!path.startsWith(base)){respond(out,404,"text/plain",new byte[0],false);return;}path=path.substring(base.length());boolean head="HEAD".equals(request[0]);
        if(path.equals("master.m3u8")){respond(out,200,"application/vnd.apple.mpegurl",("#EXTM3U\n#EXT-X-VERSION:7\n#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID=\"audio\",NAME=\"Audio\",DEFAULT=YES,AUTOSELECT=YES,URI=\"audio.m3u8\"\n#EXT-X-STREAM-INF:BANDWIDTH=4000000,CODECS=\"avc1.4d401f,mp4a.40.2\",AUDIO=\"audio\"\nvideo.m3u8\n").getBytes(StandardCharsets.UTF_8),head);return;}
        if(path.equals("video.m3u8")||path.equals("audio.m3u8")){boolean v=path.startsWith("video");respond(out,200,"application/vnd.apple.mpegurl",playlist(v?video:audio,v?"v":"a").getBytes(StandardCharsets.UTF_8),head);return;}
        String upstream;String type="video/mp4";
        if(path.equals("video.mp4")&&combined!=null)upstream=combined;
        else {String[] part=path.split("/");if(part.length!=2||!(part[0].equals("v")||part[0].equals("a")))throw new IOException("Recurso desconocido.");Track t=part[0].equals("v")?video:audio;upstream=t.url;
            long start=0,length=t.initLength;if(!part[1].equals("init.mp4")){int n=Integer.parseInt(part[1].replace(".m4s",""));Segment segment=t.segments.get(n);start=segment.offset;length=segment.length;
                /* The only readable proof of where the receiver really is: the segment it asks for. */
                log.log("TV pide segmento "+part[0]+" "+n+" · t="+String.format(Locale.ROOT,"%.1f",timeOf(t,n))+" s.");}
            range="bytes="+start+"-"+(start+length-1);type=part[0].equals("v")?"video/mp4":"audio/mp4";
        }
        HttpURLConnection c=open(upstream,range);try{boolean fragment=!path.equals("video.mp4");int status=fragment?200:c.getResponseCode();String contentRange=c.getHeaderField("Content-Range");long length=c.getContentLengthLong();
            if(fragment&&c.getResponseCode()!=206)throw new IOException("YouTube ignoró el rango solicitado.");
            String headers="HTTP/1.1 "+status+" OK\r\nContent-Type: "+type+"\r\nAccept-Ranges: bytes\r\n"+(length>=0?"Content-Length: "+length+"\r\n":"")+(!fragment&&contentRange!=null?"Content-Range: "+contentRange+"\r\n":"")+"Connection: close\r\n\r\n";
            out.write(headers.getBytes(StandardCharsets.US_ASCII));if(!head)try(InputStream media=c.getInputStream()){copy(media,out,length<0?Long.MAX_VALUE:length);}out.flush();
        }finally{c.disconnect();}
    }catch(Exception e){log.log("Envío de datos: "+e.getClass().getSimpleName()+" · "+e.getMessage());}}
    static void respond(OutputStream out,int code,String type,byte[] data,boolean head)throws IOException{out.write(("HTTP/1.1 "+code+" OK\r\nContent-Type: "+type+"\r\nContent-Length: "+data.length+"\r\nConnection: close\r\n\r\n").getBytes(StandardCharsets.US_ASCII));if(!head)out.write(data);out.flush();}
    static String line(InputStream in)throws IOException{ByteArrayOutputStream o=new ByteArrayOutputStream();int b;while((b=in.read())!=-1&&b!=10){if(b!=13)o.write(b);if(o.size()>16384)throw new IOException("Cabecera excesiva.");}return b==-1&&o.size()==0?null:o.toString("UTF-8");}
    static void copy(InputStream in,OutputStream out,long count)throws IOException{byte[] b=new byte[32768];while(count>0){int n=in.read(b,0,(int)Math.min(count,b.length));if(n<0)break;out.write(b,0,n);count-=n;}}
    /** Start time of a segment, so the receiver's real position can be read from its requests. */
    static double timeOf(Track track,int index){double time=0;for(int i=0;i<index&&i<track.segments.size();i++)time+=track.segments.get(i).duration;return time;}
}
