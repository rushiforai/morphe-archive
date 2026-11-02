/* Copyright 2026 BDCrusher. GPL-3.0. Native playlist models, no view overlays. */
package app.bdcrusher.ytmusic.playlists;

import app.bdcrusher.ytmusic.lyrics.ProtoWire;
import java.nio.charset.StandardCharsets;
import java.util.*;

/** Retains all original endpoints; an owned marker permits local playback only when a file exists. */
public final class PlaylistPageModel {
    public static final int PLAY=510000002;
    private static final int STATUS=510000003;
    private PlaylistPageModel(){}
    public static byte[] rewrite(byte[] bytes,String playlist){return rewrite(bytes,playlist,"");}
    static byte[] rewrite(byte[] bytes,String playlist,String token){
        if(!PlaylistRuntime.tracked(playlist))return bytes;
        try{byte[][] first={null};byte[] result=rows(bytes,playlist,PlaylistRuntime.pageOffset(playlist,token),new int[]{0},0,first);return playCommands(result,playlist,0,new int[]{0},first[0]);}
        catch(IllegalArgumentException unsupported){return bytes;}
    }
    private static byte[] marker(String playlist,String video,int index){return ProtoWire.message(
        ProtoWire.blob(1,playlist.getBytes(StandardCharsets.US_ASCII)),ProtoWire.blob(2,video.getBytes(StandardCharsets.US_ASCII)),ProtoWire.number(3,index));}
    private static byte[] playCommands(byte[] bytes,String playlist,int depth,int[] budget,byte[] first){
        if(depth>24||++budget[0]>40000)return bytes;ProtoWire message;
        try{message=new ProtoWire(bytes);}catch(IllegalArgumentException opaque){return bytes;}
        ProtoWire.Field watch=message.one(48687626);
        if(watch!=null&&watch.wire==2){ProtoWire endpoint=new ProtoWire(watch.data);ProtoWire.Field id=endpoint.one(2);
            if(id!=null&&id.wire==2&&playlist.equals(new String(id.data,StandardCharsets.US_ASCII))){
                // Reuse the saved row's exact native WatchEndpoint while offline. Do not
                // invent endpoint fields or replace the original playlist/queue identity.
                if(first!=null&&PlaylistBrowse.offline()){message.remove(48687626);message.put(ProtoWire.blob(48687757,first));}
                message.put(ProtoWire.blob(PLAY,marker(playlist,"",0)));return message.bytes();}}
        boolean changed=false;
        for(int i=0;i<message.fields.size();i++){ProtoWire.Field f=message.fields.get(i);if(f.wire!=2||f.number==PLAY)continue;
            byte[] next=playCommands(f.data,playlist,depth+1,budget,first);if(next!=f.data){message.fields.set(i,ProtoWire.blob(f.number,next));changed=true;}}
        return changed?message.bytes():bytes;
    }
    private static byte[] rows(byte[] bytes,String playlist,int base,int[] index,int depth,byte[][] first){
        if(depth>10)return bytes;ProtoWire message=new ProtoWire(bytes);boolean changed=false;
        // Only verified browse/tab/section/shelf wrappers are traversed. Never rewrite menu URLs or media URLs.
        Set<Integer> wrappers=Set.of(9,10,58173949,1,58174010,4,49399797,175617300,3);
        for(int i=0;i<message.fields.size();i++){ProtoWire.Field f=message.fields.get(i);if(f.wire!=2)continue;
            byte[] next=f.data;
            if(f.number==161429595){int position=base<0?-1:base+index[0];next=row(f.data,playlist,position);if(first[0]==null&&position>=0&&PlaylistBrowse.offline())try{ProtoWire command=new ProtoWire(new ProtoWire(f.data).child(5));byte[] endpoint=command.child(48687757);String id=new String(new ProtoWire(endpoint).child(1),StandardCharsets.US_ASCII);if(NativeMediaCache.ready(playlist,id,position))first[0]=endpoint;}catch(IllegalArgumentException unsupported){}index[0]++;}
            else if(wrappers.contains(f.number))try{next=rows(f.data,playlist,base,index,depth+1,first);}catch(IllegalArgumentException opaque){}
            if(next!=f.data){message.fields.set(i,ProtoWire.blob(f.number,next));changed=true;}}
        return changed?message.bytes():bytes;
    }
    public static byte[] rowStatus(byte[] bytes){
        try{ProtoWire row=new ProtoWire(bytes),command=new ProtoWire(row.child(5)),watch=new ProtoWire(command.child(48687757));String playlist=new String(watch.child(2),StandardCharsets.US_ASCII);if(!PlaylistRuntime.tracked(playlist))return bytes;return row(bytes,playlist,-1);}catch(IllegalArgumentException unsupported){return bytes;}
    }
    private static byte[] row(byte[] bytes,String playlist,int index){
        ProtoWire row=new ProtoWire(bytes);ProtoWire.Field tap=row.one(5);if(tap==null||tap.wire!=2)return bytes;
        ProtoWire command=new ProtoWire(tap.data);ProtoWire.Field watch=command.one(48687757);if(watch==null||watch.wire!=2)return bytes;
        ProtoWire endpoint=new ProtoWire(watch.data);String video=new String(endpoint.child(1),StandardCharsets.US_ASCII);
        if(!video.matches("[A-Za-z0-9_-]{11}"))return bytes;
        if(index>=0){command.put(ProtoWire.blob(PLAY,marker(playlist,video,index)));row.put(ProtoWire.blob(5,command.bytes()));}
        boolean ownStatus=row.one(STATUS)!=null;
        String state=PlaylistRuntime.state(video),label=switch(state){case "complete"->"✓ Downloaded";case "downloading"->"↓ Downloading";case "queued"->"◷ Queued";case "failed","missing"->"Download failed";case "external"->"Sent to downloader";default->"";};
        if(!label.isEmpty()){
            ProtoWire.Field subtitle=row.one(4);if(subtitle!=null&&subtitle.wire==2){ProtoWire formatted=new ProtoWire(subtitle.data);
                if(ownStatus&&!formatted.fields.isEmpty()){ProtoWire.Field last=formatted.fields.get(formatted.fields.size()-1);if(last.number==1&&last.wire==2)formatted.fields.remove(formatted.fields.size()-1);}
                // Append a genuine text run. The original artist/duration and native styling are retained.
                formatted.fields.add(ProtoWire.blob(1,ProtoWire.message(ProtoWire.blob(1,(" · "+label).getBytes(StandardCharsets.UTF_8)))));row.put(ProtoWire.blob(4,formatted.bytes()));row.put(ProtoWire.number(STATUS,1));}
        }
        return row.bytes();
    }
}
