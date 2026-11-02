/* Copyright 2026 BDCrusher. GPL-3.0. Native model verified against supplied playlist response. */
package app.bdcrusher.ytmusic.playlists;
import app.bdcrusher.ytmusic.lyrics.ProtoWire;
import java.nio.charset.StandardCharsets;
import java.util.*;
import android.net.Uri;
import android.util.Base64;

/** Adds a genuine secondary circle-button VM immediately after the original native Download VM. */
public final class PlaylistHeaderModel {
    public static final int MARKER=510000001;
    private static final int[] MODEL={172660663,1,168777401,5,373186255};
    private PlaylistHeaderModel(){}
    public static boolean validId(String id){return id!=null&&(id.startsWith("PL")&&id.matches("[A-Za-z0-9_-]{10,150}")||id.equals("LM")||id.equals("SE"));}
    public static byte[] rewrite(byte[] wrapped){
        if(wrapped==null||wrapped.length>512*1024)return wrapped;
        try{byte[] direct=ProtoWire.at(wrapped,MODEL,0,PlaylistHeaderModel::update);if(!Arrays.equals(direct,wrapped))return direct;}catch(IllegalArgumentException alternateWrapper){}
        try{return walk(wrapped,0,new int[]{0});}catch(IllegalArgumentException unsupported){return wrapped;}
    }
    /** Header wrappers differ for owned/shared playlists. Match the exact native VM, not one wrapper path. */
    private static byte[] walk(byte[] bytes,int depth,int[] budget){
        if(depth>12||++budget[0]>5000)return bytes;ProtoWire message;try{message=new ProtoWire(bytes);}catch(IllegalArgumentException opaque){return bytes;}boolean changed=false;
        for(int i=0;i<message.fields.size();i++){ProtoWire.Field f=message.fields.get(i);if(f.wire!=2)continue;byte[] next=f.number==373186255?update(f.data):walk(f.data,depth+1,budget);if(!Arrays.equals(next,f.data)){message.fields.set(i,ProtoWire.blob(f.number,next));changed=true;}}
        return changed?message.bytes():bytes;
    }
    private static byte[] update(byte[] raw){
        ProtoWire model=new ProtoWire(raw);String entity=new String(model.child(7),StandardCharsets.UTF_8);
        byte[] decoded=Base64.decode(Uri.decode(entity),Base64.URL_SAFE);
        String id=new String(new ProtoWire(decoded).child(2),StandardCharsets.UTF_8);if(!validId(id))return raw;
        byte[] data=model.child(14);ProtoWire header=new ProtoWire(data);String title=new String(header.child(1),StandardCharsets.UTF_8);
        if(title.isEmpty()||title.length()>1024)return raw;
        int at=-1;byte[] command=null;
        for(int i=0;i<header.fields.size();i++){
            ProtoWire.Field field=header.fields.get(i);if(field.number!=7||field.wire!=2)continue;
            ProtoWire action=new ProtoWire(field.data);
            try{ProtoWire button=new ProtoWire(action.child(1));byte[] tap=button.child(6);if(new ProtoWire(new ProtoWire(tap).child(169495254)).one(MARKER)!=null)return raw;}catch(IllegalArgumentException other){}
            ProtoWire.Field download=action.one(3);
            if(download!=null&&download.wire==2){if(at>=0)return raw;at=i;command=new ProtoWire(download.data).child(9);}
        }
        if(at<0||command==null||command.length>65536)return raw;
        ProtoWire nativeCommand=new ProtoWire(command);byte[] marker=ProtoWire.message(ProtoWire.blob(1,id.getBytes(StandardCharsets.US_ASCII)),ProtoWire.blob(2,title.getBytes(StandardCharsets.UTF_8)));nativeCommand.put(ProtoWire.blob(MARKER,marker));
        ProtoWire.Field endpoint=nativeCommand.one(133724106);if(endpoint!=null&&endpoint.wire==2){ProtoWire offline=new ProtoWire(endpoint.data);offline.put(ProtoWire.blob(MARKER,marker));nativeCommand.put(ProtoWire.blob(133724106,offline.bytes()));}
        ProtoWire originalAction=new ProtoWire(header.fields.get(at).data),originalDownload=new ProtoWire(originalAction.child(3));originalDownload.put(ProtoWire.blob(9,nativeCommand.bytes()));originalAction.put(ProtoWire.blob(3,originalDownload.bytes()));header.fields.set(at,ProtoWire.blob(7,originalAction.bytes()));
        byte[] button=ProtoWire.message(
            ProtoWire.blob(1,"yt_outline_bdcrusher_download_playlist_vd_theme_24".getBytes(StandardCharsets.US_ASCII)),
            ProtoWire.blob(6,ProtoWire.message(ProtoWire.blob(169495254,nativeCommand.bytes()))),
            ProtoWire.blob(7,"Download playlist".getBytes(StandardCharsets.UTF_8)),ProtoWire.number(8,2));
        header.fields.add(at+1,ProtoWire.blob(7,ProtoWire.message(ProtoWire.blob(1,button))));
        model.put(ProtoWire.blob(14,header.bytes()));return model.bytes();
    }
}
