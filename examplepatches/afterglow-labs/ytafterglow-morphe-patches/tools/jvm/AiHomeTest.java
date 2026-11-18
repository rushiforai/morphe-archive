package app.afterglow.extension.destinations;

import android.app.Activity;
import android.view.View;
import app.afterglow.extension.Afterglow;
import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

public final class AiHomeTest {
    private static int checks;
    private static void check(boolean condition, String label) { checks++; if (!condition) throw new AssertionError(label); }
    private static void rejects(Runnable work, String label) { boolean caught=false; try { work.run(); } catch (IllegalArgumentException expected) { caught=true; } check(caught,label); }
    private static byte[] bytes(String value) { return value.getBytes(StandardCharsets.UTF_8); }
    private static byte[] concat(byte[]... arrays) { ByteArrayOutputStream out=new ByteArrayOutputStream(); for(byte[] array:arrays)out.write(array,0,array.length); return out.toByteArray(); }
    private static byte[] varint(long value) { ByteArrayOutputStream out=new ByteArrayOutputStream(); do { int next=(int)(value&127);value>>>=7;out.write(next|(value==0?0:128)); }while(value!=0);return out.toByteArray(); }
    private static byte[] field(int id,byte[] data) { return concat(varint(((long)id<<3)|2),varint(data.length),data); }
    private static byte[] browse(String id,String query) { return field(AiHomeCommand.BROWSE,concat(field(2,bytes(id)),query==null?new byte[0]:field(5,bytes(query)))); }
    private static final class Chip implements AiHomeRouter.NativeChip {
        int style; byte[] command; Chip(int style,byte[] command){this.style=style;this.command=command;}
        public int afterglow_aiStyle(){return style;} public byte[] afterglow_aiCommand(){return command;}
    }
    private static final class Host implements AiHomeRouter.NativeHost {
        View view=new View(); String id="FEwhat_to_watch"; List<Object> chips=new ArrayList<>(); byte[] sent; int count; boolean accept=true,fail;
        Host(Activity activity){view.root=activity.window.decor;}
        public View afterglow_aiRoot(){return view;} public String afterglow_aiBrowseId(){return id;}
        public List<?> afterglow_aiChips(){if(fail)throw new IllegalStateException();return chips;}
        public boolean afterglow_aiDispatch(byte[] command){sent=command;count++;return accept;}
    }
    public static void main(String[] args) {
        byte[] base=browse("FEcustom_feed","old");
        check(AiHomeCommand.nativeEntry(base),"browse is native entry");
        check(AiHomeCommand.supportsPrompt(base),"browse accepts native query");
        byte[] metadata=concat(new byte[]{80,7},new byte[]{89,1,2,3,4,5,6,7,8},new byte[]{101,9,8,7,6});
        byte[] inner=concat(field(2,bytes("FEcustom_feed")),field(3,bytes("native params")),field(5,bytes("old")),metadata);
        byte[] original=concat(metadata,field(AiHomeCommand.BROWSE,inner),field(999,bytes("context")));
        byte[] changed=AiHomeCommand.withPrompt(original,"  native\n\t feed  ☕ ");
        byte[] expected=concat(metadata,field(AiHomeCommand.BROWSE,concat(field(2,bytes("FEcustom_feed")),field(3,bytes("native params")),field(5,bytes("native feed ☕")),metadata)),field(999,bytes("context")));
        check(Arrays.equals(changed,expected),"only query bytes changed; metadata and parameters preserved");
        check(Arrays.equals(AiHomeCommand.withPrompt(browse("FEcustom_feed",null),"hello"),browse("FEcustom_feed","hello")),"append query when absent");
        check(Arrays.equals(AiHomeCommand.normalHome(),browse("FEwhat_to_watch",null)),"normal Home uses native BrowseEndpoint");
        byte[] reload=field(AiHomeCommand.RELOAD,new byte[]{8,1});
        check(AiHomeCommand.nativeEntry(reload)&&!AiHomeCommand.supportsPrompt(reload),"reload only opens native entry");
        rejects(()->AiHomeCommand.withPrompt(reload,"hello"),"reload cannot become ordinary search");
        byte[] search=field(AiHomeCommand.SEARCH,field(1,bytes("query")));
        check(!AiHomeCommand.nativeEntry(search)&&!AiHomeCommand.supportsPrompt(search),"search excluded");
        check(!AiHomeCommand.nativeEntry(concat(base,search)),"mixed search excluded");
        check(!AiHomeCommand.nativeEntry(concat(base,base)),"duplicate browse excluded");
        check(!AiHomeCommand.nativeEntry(concat(base,reload)),"ambiguous browse/reload excluded");
        check(!AiHomeCommand.supportsPrompt(field(AiHomeCommand.BROWSE,field(5,bytes("text")))),"browse id required");
        check(!AiHomeCommand.supportsPrompt(field(AiHomeCommand.BROWSE,concat(field(2,bytes("A")),field(2,bytes("B"))))),"duplicate browse id excluded");
        check(!AiHomeCommand.supportsPrompt(field(AiHomeCommand.BROWSE,concat(field(2,bytes("A")),field(5,bytes("a")),field(5,bytes("b"))))),"duplicate query excluded");
        check(!AiHomeCommand.supportsPrompt(field(AiHomeCommand.BROWSE,concat(field(2,bytes("A")),new byte[]{40,1}))),"query wire type preserved");
        check(!AiHomeCommand.supportsPrompt(field(AiHomeCommand.BROWSE,field(2,new byte[513]))),"browse id bound");
        rejects(()->AiHomeCommand.withPrompt(base,"  \n\t "),"empty prompt rejected");
        rejects(()->AiHomeCommand.withPrompt(base,"x".repeat(4001)),"prompt length bound");
        check(AiHomeCommand.supportsPrompt(AiHomeCommand.withPrompt(base,"x".repeat(4000))),"maximum prompt accepted");
        byte[][] bad={null,new byte[0],new byte[65537],{0},{3},{8,(byte)128},{10,100,1},{17,1},{29,1},{(byte)255,(byte)255,(byte)255,(byte)255,(byte)255,(byte)255,(byte)255,(byte)255,(byte)255,2}};
        for(byte[] item:bad)check(!AiHomeCommand.nativeEntry(item)&&!AiHomeCommand.supportsPrompt(item),"malformed native command rejected");
        Random random=new Random(7261);
        for(int i=0;i<1000;i++){byte[] input=new byte[random.nextInt(200)];random.nextBytes(input);AiHomeCommand.nativeEntry(input);AiHomeCommand.supportsPrompt(input);}
        check(true,"bounded malformed corpus completes without escape");

        Afterglow.activity=new Activity(); Host host=new Host(Afterglow.activity);
        Chip chip=new Chip(26,base);host.chips.add(chip);AiHomeRouter.captureCustomFeed(host);
        check(AiHomeRouter.capability().runPrompt,"live native custom-feed capability");
        check(AiHomeRouter.runPrompt("fresh")&&Arrays.equals(host.sent,browse("FEcustom_feed","fresh")),"live prompt dispatch");
        chip.command=browse("FEnew_context","old2");
        check(AiHomeRouter.runPrompt("updated")&&Arrays.equals(host.sent,browse("FEnew_context","updated")),"same controller reused with current command");
        chip.style=28;check(!AiHomeRouter.capability().nativeEntry&&!AiHomeRouter.runPrompt("no"),"Ask chip excluded");chip.style=26;
        host.chips.add(new Chip(26,base));check(!AiHomeRouter.capability().nativeEntry,"multiple custom chips rejected");host.chips.remove(1);
        host.chips.clear();check(!AiHomeRouter.openNativeEntry(),"cleared current model cannot dispatch stale command");host.chips.add(chip);
        chip.command=reload;check(AiHomeRouter.capability().nativeEntry&&!AiHomeRouter.capability().runPrompt,"reload UI capability");
        check(!AiHomeRouter.runPrompt("no")&&AiHomeRouter.openNativeEntry()&&Arrays.equals(host.sent,reload),"reload entry remains exact");chip.command=base;
        int count=host.count;host.view.attached=false;check(!AiHomeRouter.runPrompt("no")&&host.count==count,"detached host rejected");host.view.attached=true;
        host.view.shown=false;check(!AiHomeRouter.openNativeEntry(),"hidden chip root rejected");host.view.shown=true;
        host.id="FEsubscriptions";check(!AiHomeRouter.capability().nativeEntry,"reused controller changed browse identity");host.id="FEwhat_to_watch";
        Activity old=Afterglow.activity;Afterglow.activity=new Activity();check(!AiHomeRouter.openNativeEntry(),"old activity root rejected");Afterglow.activity=old;
        old.finishing=true;check(!AiHomeRouter.openNativeEntry(),"finishing activity rejected");old.finishing=false;
        old.destroyed=true;check(!AiHomeRouter.openNativeEntry(),"destroyed activity rejected");old.destroyed=false;
        host.accept=false;check(!AiHomeRouter.runPrompt("native rejects"),"native dispatch rejection propagated");host.accept=true;
        for(int i=0;i<128;i++)host.chips.add(new Object());check(!AiHomeRouter.capability().nativeEntry,"native model scan bounded");host.chips.subList(1,host.chips.size()).clear();
        check(AiHomeRouter.openNormalHome()&&Arrays.equals(host.sent,AiHomeCommand.normalHome()),"normal Home dispatch fallback");
        View home=new View();home.root=old.window.decor;AiHomeRouter.captureHome(home);count=host.count;
        check(AiHomeRouter.openNormalHome()&&home.clicked&&host.count==count,"actual Home tab listener preferred");
        home.attached=false;host.fail=true;check(!AiHomeRouter.capability().nativeEntry,"model read exception fails closed");host.fail=false;
        check(!AiHomeRouter.openNativeEntry(),"fault clears stale host");AiHomeRouter.captureCustomFeed(host);
        Host wrong=new Host(old);wrong.id="FEsubscriptions";AiHomeRouter.captureCustomFeed(wrong);
        check(AiHomeRouter.openNativeEntry(),"non-Home capture does not replace valid Home owner");
        AiHomeRouter.clear();check(!AiHomeRouter.openNativeEntry(),"explicit clear removes native capability");
        System.out.println("PASS "+checks+" AI Home command and native ownership checks; 1000 malformed fixtures");
    }
}
