/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.lyrics;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

/** Edits the actual video_action_bar model before native Elements rendering. */
final class NativeActionModel {
    // Android Music 9.42.52 public native response; guarded by the component URI and VM shape.
    private static final int[] ACTION_PATH={172660663,1,168777401,5,389155117};
    private static final int[] BUTTON_PATH={10,461054335};
    static byte[] enable(byte[] element){return transform(element,2);}
    static byte[] orderWhilePending(byte[] element){return transform(element,1);}
    static byte[] orderUnavailable(byte[] element){return transform(element,3);}
    private static byte[] transform(byte[] element,int mode){
        // The typed VideoActionBarPresenter hook supplies scope. Client-generated
        // Elements need not repeat the server template URI in their serialized model.
        try{
            try{return ProtoWire.at(element,ACTION_PATH,0,raw->update(raw,mode));}
            catch(IllegalArgumentException fixedShape){
                List<int[]> matches=new ArrayList<>();findRows(element,new ArrayList<>(),matches,new int[]{192},0);
                if(matches.size()!=1)throw new IllegalArgumentException("expected one native Lyrics/Like row, found "+matches.size());
                return ProtoWire.at(element,matches.get(0),0,raw->update(raw,mode));
            }
        }
        catch(IllegalArgumentException ex){LyricsDiagnostics.record("Lyrics action model","Unsupported native button model: "+ex.getMessage());return element;}
    }
    /** Native LikeEndpoint target, when present; do not infer identity from labels or URLs. */
    static String recording(byte[] element){
        java.util.Set<String> ids=new java.util.HashSet<>();
        collectRecording(element,ids,new int[]{192},0);
        return ids.size()==1?ids.iterator().next():ids.size()>1?"ambiguous":null;
    }
    private static void collectRecording(byte[] bytes,java.util.Set<String> ids,int[] budget,int depth){
        if(depth>22||--budget[0]<0)return;
        ProtoWire message;try{message=new ProtoWire(bytes);}catch(IllegalArgumentException notMessage){return;}
        for(ProtoWire.Field f:message.fields)if(f.wire==2){
            if(f.number==63158558){
                try{String id=new String(path(f.data,new int[]{2,1}),StandardCharsets.US_ASCII);if(id.matches("[A-Za-z0-9_-]{11}"))ids.add(id);}
                catch(IllegalArgumentException unsupported){}
            }else if(f.data.length>4)collectRecording(f.data,ids,budget,depth+1);
        }
    }
    /** Client-generated Elements may wrap the same native button VMs differently. */
    private static void findRows(byte[] bytes,List<Integer> path,List<int[]> matches,int[] budget,int depth){
        if(depth>18||--budget[0]<0||matches.size()>1)return;
        ProtoWire message;
        try{message=new ProtoWire(bytes);}catch(IllegalArgumentException notMessage){return;}
        int buttons=0;boolean like=false,lyrics=false;
        for(ProtoWire.Field f:message.fields)if(f.number==4&&f.wire==2){
            buttons++;like|=contains(f.data,"_thumb_up_");
            try{ProtoWire.Field icon=new ProtoWire(path(f.data,BUTTON_PATH)).one(2);lyrics|=icon!=null&&icon.wire==2&&contains(icon.data,"_quote_");}
            catch(IllegalArgumentException otherAction){}
        }
        if(buttons>=2&&buttons<=32&&like&&lyrics){matches.add(path.stream().mapToInt(Integer::intValue).toArray());return;}
        for(ProtoWire.Field f:message.fields)if(f.wire==2&&f.data.length>4){
            // ProtoWire.at edits singular message fields only. Repeated wrappers are ambiguous.
            int count=0;for(ProtoWire.Field other:message.fields)if(other.number==f.number)count++;
            if(count!=1)continue;
            path.add(f.number);findRows(f.data,path,matches,budget,depth+1);path.remove(path.size()-1);
        }
    }
    private static byte[] update(byte[] input,int mode){
        ProtoWire row=new ProtoWire(input);List<ProtoWire.Field> buttons=new ArrayList<>();
        for(ProtoWire.Field f:row.fields)if(f.number==4){if(f.wire!=2)throw new IllegalArgumentException("action wire type");buttons.add(f);}
        if(buttons.size()<2||buttons.size()>32)throw new IllegalArgumentException("action count");
        int lyrics=-1,like=-1;
        for(int i=0;i<buttons.size();i++){
            byte[] raw=buttons.get(i).data;
            if(contains(raw,"_thumb_up_")){if(like>=0)throw new IllegalArgumentException("ambiguous Like action");like=i;}
            boolean lyric=false;
            try{
                byte[] vm=path(raw,BUTTON_PATH);ProtoWire model=new ProtoWire(vm);ProtoWire.Field icon=model.one(2);
                lyric=icon!=null&&icon.wire==2&&contains(icon.data,"_quote_");
            }catch(IllegalArgumentException ignored){/* Other native action types are retained verbatim. */}
            if(lyric){if(lyrics>=0)throw new IllegalArgumentException("ambiguous Lyrics action");lyrics=i;}
        }
        if(lyrics<0||like<0)throw new IllegalArgumentException("missing Lyrics/Like action");
        final boolean[] changed={false};
        byte[] patched=mode==2?ProtoWire.at(buttons.get(lyrics).data,BUTTON_PATH,0,raw->{
            ProtoWire vm=new ProtoWire(raw);ProtoWire.Field state=vm.one(14),title=vm.one(3);
            if(title==null||title.wire!=2||title.data.length>256)throw new IllegalArgumentException("Lyrics title");
            if(state!=null&&(state.wire!=0||state.value<0||state.value>3))throw new IllegalArgumentException("unrecognized Lyrics state wire="+state.wire+" value="+state.value);
            // The APK's field14 verifier accepts enum values0..3. Found external lyrics
            // use the normal absent/enabled state; unknown future states remain rejected.
            if(state!=null){vm.remove(14);vm.remove(38);changed[0]=true;}
            if(vm.one(4)==null){vm.put(ProtoWire.blob(4,ProtoWire.message(ProtoWire.blob(169495254,NativePanelWire.command()))));changed[0]=true;}
            return changed[0]?vm.bytes():raw;
        }):buttons.get(lyrics).data;
        ProtoWire.Field item=ProtoWire.blob(4,patched);buttons.remove(lyrics);if(lyrics<like)like--;
        int position=mode==3?buttons.size():like+1;
        buttons.add(position,item);
        if(!changed[0]&&lyrics==position)return input;
        int i=0;for(int n=0;n<row.fields.size();n++)if(row.fields.get(n).number==4)row.fields.set(n,buttons.get(i++));
        LyricsDiagnostics.record("Lyrics action model",mode==2?"Enabled native Lyrics model after Like/Dislike":mode==3?"Moved native Lyrics to the end after confirmed empty lookup":"Positioned native Lyrics second while discovery is pending");
        return row.bytes();
    }
    private static byte[] path(byte[] bytes,int[] path){for(int f:path)bytes=new ProtoWire(bytes).child(f);return bytes;}
    static boolean contains(byte[] bytes,String text){byte[] find=text.getBytes(StandardCharsets.US_ASCII);outer:for(int i=0;i<=bytes.length-find.length;i++){for(int j=0;j<find.length;j++)if(bytes[i+j]!=find[j])continue outer;return true;}return false;}
}
