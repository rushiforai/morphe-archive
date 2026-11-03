/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.playlists;
import app.bdcrusher.ytmusic.lyrics.ProtoWire;
import java.nio.charset.StandardCharsets;
import java.util.*;

/** Bounded identity extraction, only from a native header or menu-open model. */
public final class DownloadIdentity {
    private DownloadIdentity(){}
    public static DownloadCommand.Target header(byte[] bytes){
        Set<String> ids=new HashSet<>();walk(bytes,0,new int[]{0},ids,false);
        return ids.size()==1?new DownloadCommand.Target(ids.iterator().next(),true):null;
    }
    public static boolean menuOpen(byte[] bytes){return menu(bytes)!=null;}
    private static byte[] menu(byte[] bytes){
        if(bytes==null||bytes.length>65536)return null;
        try{ProtoWire p=new ProtoWire(bytes);for(int d=0;d<=4;d++){
            ProtoWire.Field f=p.one(98150882),wrapper=p.one(169495254);
            if(f!=null)return f.wire==2&&wrapper==null?f.data:null;
            if(wrapper==null||wrapper.wire!=2)return null;p=new ProtoWire(wrapper.data);
        }}catch(IllegalArgumentException ignored){}return null;
    }
    public static DownloadCommand.Target menuTarget(byte[] bytes){
        byte[] model=menu(bytes);if(model==null)return null;
        Set<String> lists=new HashSet<>();walk(model,0,new int[]{0},lists,false);
        Set<String> videos=new HashSet<>();walk(model,0,new int[]{0},videos,true);
        if(videos.size()>1)return null;
        // A row menu can include its surrounding playlist. Preserve the selected recording.
        if(videos.size()==1)return new DownloadCommand.Target(videos.iterator().next(),false);
        return lists.size()==1?new DownloadCommand.Target(lists.iterator().next(),true):null;
    }
    private static void walk(byte[] bytes,int depth,int[] budget,Set<String> ids,boolean video){
        if(bytes==null||bytes.length>512*1024||depth>12||++budget[0]>5000)return;
        ProtoWire message;try{message=new ProtoWire(bytes);}catch(IllegalArgumentException opaque){return;}
        for(ProtoWire.Field field:message.fields){if(field.wire!=2)continue;
            String text=new String(field.data,StandardCharsets.US_ASCII);
            if(video){
                // The native menu command carries the selected recording as an 11-byte string.
                // Reject ambiguous models rather than borrowing the playing recording.
                if(text.matches("[A-Za-z0-9_-]{11}")&&!text.toLowerCase(Locale.ROOT).matches(".*(download|list_item|button).*"))ids.add(text);
            }else{
                String id=text.startsWith("VL")?text.substring(2):text;
                if(PlaylistHeaderModel.validId(id))ids.add(id);
                // Native header entity key: URL-safe Base64 protobuf, playlist ID in field2.
                if(text.length()>=16&&text.length()<=2048&&text.matches("[A-Za-z0-9_=%-]+"))try{
                    String key=android.net.Uri.decode(text);
                    ProtoWire entityKey=new ProtoWire(Base64.getUrlDecoder().decode(key));ProtoWire.Field kind=entityKey.one(4);
                    String entity=new String(entityKey.child(2),StandardCharsets.US_ASCII);
                    if(kind!=null&&kind.wire==0&&(kind.value==24||kind.value==25)&&PlaylistHeaderModel.validId(entity))ids.add(entity);
                }catch(IllegalArgumentException ignored){}
            }
            walk(field.data,depth+1,budget,ids,video);
        }
    }
}
