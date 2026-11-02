/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.playlists;

import app.bdcrusher.ytmusic.lyrics.ProtoWire;
import java.nio.charset.StandardCharsets;
import java.net.URLDecoder;
import java.util.Base64;

/** Exact native offline-upsell identity. Never search arbitrary bytes or use Now Playing. */
public final class DownloadCommand {
    public static final int OFFLINE_UPSELL=133724106;
    public static final int DOWNLOAD_ACTION=443434441;
    public record Target(String id,boolean playlist){}
    private DownloadCommand(){}
    public static Target target(byte[] command){
        if(command==null||command.length>65536)return null;
        try{return command(new ProtoWire(command),0);}catch(Exception malformed){return null;}
    }
    /** Client-generated download actions keep their identity in endpoint.tag, not the payload. */
    public static boolean contextual(byte[] command){
        if(command==null||command.length>65536)return false;
        try{
            ProtoWire value=new ProtoWire(command);
            for(int depth=0;depth<=4;depth++){
                ProtoWire.Field action=value.one(DOWNLOAD_ACTION),wrapper=value.one(169495254);
                if(action!=null){if(action.wire!=2||wrapper!=null||value.one(OFFLINE_UPSELL)!=null)return false;new ProtoWire(action.data);return true;}
                if(wrapper==null||wrapper.wire!=2||value.one(OFFLINE_UPSELL)!=null)return false;
                value=new ProtoWire(wrapper.data);
            }
        }catch(IllegalArgumentException malformed){}
        return false;
    }
    private static Target command(ProtoWire message,int depth)throws Exception{
        if(depth>4)return null;
        ProtoWire.Field endpoint=message.one(OFFLINE_UPSELL);
        if(endpoint!=null&&message.one(169495254)!=null)return null;
        if(endpoint==null){ProtoWire.Field wrapper=message.one(169495254);return wrapper!=null&&wrapper.wire==2?command(new ProtoWire(wrapper.data),depth+1):null;}
        if(endpoint.wire!=2)return null;
        byte[] text=new ProtoWire(endpoint.data).child(1);if(text.length==0||text.length>8192)return null;
        String encoded=URLDecoder.decode(new String(text,StandardCharsets.US_ASCII).replace("+","%2B"),"UTF-8");
        byte[] decoded;try{decoded=Base64.getUrlDecoder().decode(encoded);}catch(IllegalArgumentException standard){decoded=Base64.getDecoder().decode(encoded);}
        ProtoWire params=new ProtoWire(decoded),context=new ProtoWire(params.child(5));
        // Both originals' native download params: offline context9, request1, identity10.
        if(!number(context,1,9)||!number(context,3,1))return null;
        ProtoWire identity=new ProtoWire(context.child(10));
        ProtoWire.Field song=identity.one(1),playlist=identity.one(2),outer=params.one(4);
        if((song==null)==(playlist==null))return null;
        ProtoWire.Field field=song!=null?song:playlist;if(field.wire!=2)return null;
        String id=new String(field.data,StandardCharsets.US_ASCII);
        if(song!=null){
            if(!id.matches("[A-Za-z0-9_-]{11}"))return null;
            if(outer!=null&&(outer.wire!=2||!id.equals(new String(outer.data,StandardCharsets.US_ASCII))))return null;
        }else if(!PlaylistHeaderModel.validId(id)||outer!=null)return null;
        return new Target(id,playlist!=null);
    }
    private static boolean number(ProtoWire message,int tag,long value){ProtoWire.Field f=message.one(tag);return f!=null&&f.wire==0&&f.value==value;}
}
