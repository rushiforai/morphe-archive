/* Copyright 2026 BDCrusher. GPL-3.0. Schemas inspected in original 9.42.52 and native responses. */
package app.bdcrusher.ytmusic.playlists;
import app.bdcrusher.ytmusic.lyrics.ProtoWire;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

/** Only playlist shelves are entries. Section-list continuation usually loads recommendations. */
public final class PlaylistPage {
    public record Entry(String videoId,String title,String reason) {}
    public final List<Entry> entries;
    public final String continuation;
    private PlaylistPage(List<Entry> entries,String continuation){this.entries=entries;this.continuation=continuation;}
    private static byte[] child(byte[] b,int n){return new ProtoWire(b).child(n);}
    private static byte[] optional(byte[] b,int n){ProtoWire.Field f=new ProtoWire(b).one(n);return f==null?null:f.wire==2?f.data:null;}
    private static String text(byte[] b){return b==null?"":new String(b,StandardCharsets.UTF_8);}
    public static PlaylistPage parse(byte[] response,String expectedId,boolean continued){
        byte[] shelf=null;
        if(continued){byte[] contents=child(response,10);shelf=optional(contents,175617300);}
        else{
            byte[] contents=child(response,9),sections=optional(contents,49399797);
            if(sections==null){
                byte[] tabs=child(contents,58173949);
                for(ProtoWire.Field f:new ProtoWire(tabs).fields)if(f.number==1&&f.wire==2){
                    byte[] tab=child(f.data,58174010),body=optional(tab,4);
                    if(body!=null){sections=optional(body,49399797);if(sections!=null)break;}
                }
            }
            if(sections!=null)for(ProtoWire.Field f:new ProtoWire(sections).fields)if(f.number==1&&f.wire==2){
                byte[] candidate=optional(f.data,175617300);if(candidate!=null){
                    if(shelf!=null)throw new IllegalArgumentException("Ambiguous playlist shelves");shelf=candidate;
                }
            }
        }
        if(shelf==null)throw new IllegalArgumentException("Unrecognized playlist page; enumeration is incomplete");
        String identity=text(optional(shelf,1));
        if(!identity.isEmpty()&&!identity.equals(expectedId))throw new IllegalArgumentException("Playlist identity changed");
        List<Entry> entries=new ArrayList<>();
        for(ProtoWire.Field f:new ProtoWire(shelf).fields)if(f.number==3&&f.wire==2){
            byte[] row=optional(f.data,161429595);
            if(row==null)throw new IllegalArgumentException("Unrecognized playlist row; enumeration is incomplete");
            String title=formatted(optional(row,3)),id="",reason="";
            byte[] tap=optional(row,5),watch=tap==null?null:optional(tap,48687757);
            if(watch!=null)id=text(optional(watch,1));
            if(!id.matches("[A-Za-z0-9_-]{11}")){id="";reason="Unavailable or inaccessible track";}
            entries.add(new Entry(id,title,reason));
            if(entries.size()>2000)throw new IllegalArgumentException("Playlist page is too large");
        }
        String token="";byte[] continuation=optional(shelf,10);
        if(continuation!=null){
            byte[] next=optional(continuation,52047593);
            if(next==null)throw new IllegalArgumentException("Unsupported playlist continuation");
            token=text(child(next,1));if(token.isEmpty()||token.length()>65536)throw new IllegalArgumentException("Invalid playlist continuation");
        }
        return new PlaylistPage(List.copyOf(entries),token);
    }
    private static String formatted(byte[] b){
        if(b==null)return "";StringBuilder out=new StringBuilder();
        for(ProtoWire.Field f:new ProtoWire(b).fields)if(f.number==1&&f.wire==2){
            byte[] t=optional(f.data,1);if(t!=null)out.append(text(t));
        }
        if(out.length()>4096)throw new IllegalArgumentException("Playlist title too long");return out.toString();
    }
}
