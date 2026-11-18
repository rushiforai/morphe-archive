import app.afterglow.extension.navigation.NativeTabPolicy;
import app.afterglow.extension.navigation.NativeTabProto;
import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.LinkedHashMap;
import java.util.Map;

public final class NativeTabsTest {
    private static int checks;
    private static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
    private static void equal(Object actual,Object expected,String message){check(actual.equals(expected),message+": "+actual);}
    private static List<String> list(String... value){return Arrays.asList(value);}
    private static byte[] concat(byte[]... arrays){ByteArrayOutputStream out=new ByteArrayOutputStream();for(byte[] array:arrays)out.write(array,0,array.length);return out.toByteArray();}
    private static byte[] identifier(String id){byte[] text=id.getBytes(StandardCharsets.UTF_8);return concat(new byte[]{10,(byte)text.length},text);}
    public static void main(String[] args) {
        String cc=NativeTabPolicy.CONTROL_CENTER;
        List<String> active=list("FEwhat_to_watch","FEshorts","FEsubscriptions","FElibrary",cc,"FEhistory","VLWL","FEpost_home","FEconnections_inbox","FEuploads","FEhype_leaderboard");
        NativeTabPolicy.Plan plan=NativeTabPolicy.plan(active,active,false,true,cc,"FElibrary");
        equal(plan.top,active.subList(0,6),"single row keeps six choices");check(plan.bonus.isEmpty()&&!plan.anchored(),"single row ignores bonus anchors");
        plan=NativeTabPolicy.plan(active,active,true,true,cc,"FElibrary");
        equal(plan.ordered,active,"all eleven stored choices retained");check(plan.bonus.size()==5&&plan.anchored(),"bonus supports existing Android capacity");
        equal(plan.left,cc,"chosen left anchor");equal(plan.right,"FElibrary","chosen right anchor");
        NativeTabPolicy.Plan missing=NativeTabPolicy.plan(active,list("FEwhat_to_watch",cc,"VLWL","FEpost_home"),true,true,cc,cc);
        equal(missing.top,list("FEwhat_to_watch",cc),"missing native choices do not promote bonus entries");
        equal(missing.bonus,list("VLWL","FEpost_home"),"bonus identity follows saved positions");
        equal(missing.right,"FEwhat_to_watch","duplicate anchor gets distinct fallback");
        NativeTabPolicy.Plan noAnchor=NativeTabPolicy.plan(active,list(cc,"VLWL"),true,true,cc,"FElibrary");
        check(!noAnchor.anchored(),"one top tab cannot allocate two anchors");
        NativeTabPolicy.Plan canonical=NativeTabPolicy.plan(list("FEvideo_picker","FEuploads","FEexplore","FEtrending"),list("FEuploads","FEhype_leaderboard"),true,false,"","");
        equal(canonical.ordered,list("FEuploads","FEhype_leaderboard"),"canonical duplicate choices coalesce");
        try{plan.ordered.add("new");throw new AssertionError("mutable public plan");}catch(UnsupportedOperationException expected){checks++;}
        NativeTabPolicy.Plan empty=NativeTabPolicy.plan(active,Collections.emptyList(),true,true,cc,"FElibrary");
        check(empty.ordered.isEmpty()&&!empty.anchored(),"lazy empty native model is harmless");
        // A watch/mini-player transition overwrites both native containers with one-row
        // heights even though the tab plan is unchanged. Detect that reset, add one row
        // once, and retain the latest native inset when returning to one row.
        NativeTabPolicy.ContainerHeight container=new NativeTabPolicy.ContainerHeight(126);
        check(!container.current(126,126),"new bonus row requests container space");
        check(container.apply(126,126)==252&&container.current(252,126),"two rows reserve 252 native pixels");
        check(container.apply(252,126)==252,"repeated layout does not accumulate bonus height");
        check(!container.current(126,126),"unchanged bonus plan detects native one-row reset");
        check(container.apply(126,126)==252&&container.current(252,126),"native reset restores bonus height");
        check(container.apply(150,126)==276,"changed native inset retains new original height");
        check(!container.current(276,0)&&container.apply(276,0)==150,"disabling bonus restores latest native height");
        check(container.current(150,0),"restored one-row layout does not request another pass");
        for(int automatic:new int[]{-1,-2,0}) {
            NativeTabPolicy.ContainerHeight wrap=new NativeTabPolicy.ContainerHeight(automatic);
            check(wrap.apply(automatic,126)==automatic&&wrap.current(automatic,126),"native automatic height is unchanged");
            check(wrap.apply(automatic,0)==automatic,"automatic height restores without fixed dimensions");
        }
        // Odd widths, varying density and both layout directions must stay inside the bar,
        // mirror exactly and never overlap another visible tab's hit rectangle.
        for(boolean anchors:new boolean[]{false,true})for(int width:new int[]{320,393,1080,1441})for(int height:new int[]{48,96,132}) {
            NativeTabPolicy.Plan frames=NativeTabPolicy.plan(active,active,true,anchors,cc,"FElibrary");
            List<NativeTabPolicy.Frame> all=new ArrayList<>();
            for(String id:frames.ordered) {
                NativeTabPolicy.Frame ltr=NativeTabPolicy.frame(frames,id,width,height,height,false);
                NativeTabPolicy.Frame rtl=NativeTabPolicy.frame(frames,id,width,height,height,true);
                check(ltr.left>=0&&ltr.right<=width&&ltr.top>=0&&ltr.bottom<=height*2&&ltr.width()>0&&ltr.height()>0,"frame bounds "+id);
                check(rtl.left==width-ltr.right&&rtl.right==width-ltr.left&&rtl.top==ltr.top&&rtl.bottom==ltr.bottom,"RTL mirror "+id);
                for(NativeTabPolicy.Frame other:all)check(ltr.right<=other.left||ltr.left>=other.right||ltr.bottom<=other.top||ltr.top>=other.bottom,"independent native hit areas "+id);
                all.add(ltr);
            }
        }
        check(NativeTabPolicy.frame(plan,"missing",1080,48,48,false).width()==0,"unknown child has no frame");
        equal(NativeTabProto.identifier(identifier("FEwhat_to_watch")),"FEwhat_to_watch","normal native item id");
        equal(NativeTabProto.identifier(identifier("FEvideo_picker")),"FEuploads","native create identity");
        equal(NativeTabProto.identifier(identifier(cc)),cc,"Afterglow identity is not the Vault controller name");
        equal(NativeTabProto.identifier(concat(identifier("FEwhat_to_watch"),new byte[]{42,3,8,(byte)149,8})),NativeTabProto.COMPAT_SEARCH,"bold Search clone cannot become Home");
        equal(NativeTabProto.identifier(concat(identifier("FEwhat_to_watch"),new byte[]{42,3,8,(byte)136,9})),NativeTabProto.COMPAT_SEARCH,"Cairo Search clone cannot become Home");
        equal(NativeTabProto.identifier(concat(identifier("FEwhat_to_watch"),new byte[]{42,3,8,(byte)138,9})),NativeTabProto.COMPAT_SETTINGS,"Settings clone cannot become Home");
        Map<String,Integer> extras=new LinkedHashMap<>();extras.put(NativeTabProto.COMPAT_SEARCH,0);extras.put(NativeTabProto.COMPAT_SETTINGS,2);extras.put("unowned unknown command",1);
        NativeTabPolicy.Plan extended=NativeTabPolicy.withExtras(plan,extras);
        check(extended.top.get(0).equals(NativeTabProto.COMPAT_SEARCH)&&extended.top.get(2).equals(NativeTabProto.COMPAT_SETTINGS),"optional commands retain insertion positions");
        check(extended.top.contains("FEwhat_to_watch")&&!extended.ordered.contains("unowned unknown command"),"real Home and saved tabs remain independently reachable");
        equal(extended.bonus,plan.bonus,"optional commands do not change saved bonus-row membership");
        equal(NativeTabProto.identifier(concat(new byte[]{16,(byte)172,2,25,0,0,0,0,0,0,0,0,37,0,0,0,0,50,3,1,2,3},identifier("VLWL"))),"VLWL","skips unrelated proto wire types");
        for(byte[] invalid:new byte[][]{null,new byte[0],new byte[]{0},new byte[]{10,127,1},new byte[]{9,1},new byte[]{13,1},new byte[]{11},new byte[]{(byte)128},new byte[]{10,(byte)255,(byte)255,(byte)255,(byte)255,127},new byte[1024*1024+1]})
            equal(NativeTabProto.identifier(invalid),"","malformed or over-limit native proto");
        byte[] overflow=new byte[12];Arrays.fill(overflow,(byte)255);equal(NativeTabProto.identifier(overflow),"","varint overflow fails closed");
        byte[] flooded=new byte[8194];for(int i=0;i<flooded.length;i+=2){flooded[i]=16;flooded[i+1]=0;}
        equal(NativeTabProto.identifier(concat(flooded,identifier(cc))),"","bounded field scanning");
        System.out.println("NativeTabsTest: "+checks+" checks passed");
    }
}
