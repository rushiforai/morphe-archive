import java.nio.charset.StandardCharsets;
import java.util.Map;
import app.afterglow.extension.menus.DescriptionHeaderPolicy;
import app.afterglow.extension.menus.DescriptionHeaderSource;
import app.afterglow.extension.settings.ThemeJson;

public final class DescriptionHeaderTest {
    static int checks;
    static final String A="rfscVS0vtbw", B="dQw4w9WgXcQ";
    static void check(boolean value,String label){checks++;if(!value)throw new AssertionError(label);}
    interface Throwing { void run() throws Exception; }
    static void rejects(Throwing call,String label){checks++;try{call.run();throw new AssertionError(label);}catch(AssertionError e){throw e;}catch(Exception expected){}}
    static byte[] json(Object value){return ThemeJson.write(value).getBytes(StandardCharsets.UTF_8);}
    static byte[] metadata(String id,Object title,Object description){return json(Map.of("videoDetails",Map.of("videoId",id,"title",title,"shortDescription",description)));}
    public static void main(String[] ignored)throws Exception{
        String raw="  Exact title 😀  ", description="First line\n\nhttps://example.com/a?b=1&c=2\n  spaces\tstay  \n最後\n";
        var result=DescriptionHeaderPolicy.parse(A,metadata(A,raw,description));
        check(result.videoId.equals(A)&&result.title.equals(raw)&&result.description.equals(description),"raw text, links, whitespace and Unicode unchanged");
        check(DescriptionHeaderPolicy.parse(A,metadata(A,"Title","")).description.isEmpty(),"valid empty description distinct from missing");
        String longBody="x".repeat(10000)+"\nLast paragraph after all visible truncation";
        check(DescriptionHeaderPolicy.parse(A,metadata(A,"Title",longBody)).description.equals(longBody),"full long raw body preserved");
        rejects(()->DescriptionHeaderPolicy.parse(A,metadata(B,"Other","other body")),"different-video response rejected");
        rejects(()->DescriptionHeaderPolicy.parse(A,json(Map.of("videoDetails",Map.of("videoId",A,"title","Title")))),"missing description rejected");
        rejects(()->DescriptionHeaderPolicy.parse(A,metadata(A,"Title",false)),"nontext description rejected");
        rejects(()->DescriptionHeaderPolicy.parse(A,metadata(A,false,"description")),"nontext title rejected");
        rejects(()->DescriptionHeaderPolicy.parse(A,metadata(A,"Title","x".repeat(DescriptionHeaderPolicy.MAX_TEXT+1))),"oversized description rejected instead of truncated");
        rejects(()->DescriptionHeaderPolicy.parse(A,new byte[DescriptionHeaderPolicy.MAX_RESPONSE+1]),"response budget");
        rejects(()->DescriptionHeaderPolicy.parse(A,new byte[]{(byte)0xff}),"invalid UTF8");
        rejects(()->DescriptionHeaderPolicy.parse(A,"{} trailing".getBytes(StandardCharsets.UTF_8)),"trailing invalid JSON");
        rejects(()->DescriptionHeaderPolicy.parse(A,json(Map.of("playabilityStatus",Map.of("status","ERROR")))),"unavailable player metadata");
        rejects(()->DescriptionHeaderPolicy.parse("not a video",metadata(A,"Title","body")),"invalid requested identity");
        byte[] valid=metadata(A,"Title","body");
        for(int length=0;length<valid.length;length++){
            final byte[] truncated=java.util.Arrays.copyOf(valid,length);
            rejects(()->DescriptionHeaderPolicy.parse(A,truncated),"truncated metadata "+length);
        }
        Object generation=new Object(), panel=new Object();
        check(DescriptionHeaderPolicy.current(true,true,true,false,generation,generation,panel,panel,DescriptionHeaderPolicy.PANEL,A,A),"current attached description");
        check(!DescriptionHeaderPolicy.current(false,true,true,false,generation,generation,panel,panel,DescriptionHeaderPolicy.PANEL,A,A),"disabled/uninstalled");
        check(!DescriptionHeaderPolicy.current(true,false,true,false,generation,generation,panel,panel,DescriptionHeaderPolicy.PANEL,A,A),"detached");
        check(!DescriptionHeaderPolicy.current(true,true,false,false,generation,generation,panel,panel,DescriptionHeaderPolicy.PANEL,A,A),"hidden panel");
        check(!DescriptionHeaderPolicy.current(true,true,true,true,generation,generation,panel,panel,DescriptionHeaderPolicy.PANEL,A,A),"advertisement");
        check(!DescriptionHeaderPolicy.current(true,true,true,false,generation,new Object(),panel,panel,DescriptionHeaderPolicy.PANEL,A,A),"same native controller after detach/reattach cannot copy queued response");
        check(!DescriptionHeaderPolicy.current(true,true,true,false,generation,generation,panel,new Object(),DescriptionHeaderPolicy.PANEL,A,A),"same header reused with new panel model");
        check(!DescriptionHeaderPolicy.current(true,true,true,false,generation,generation,panel,panel,"shorts-comments-panel",A,A),"other engagement panel");
        check(!DescriptionHeaderPolicy.current(true,true,true,false,generation,generation,panel,panel,DescriptionHeaderPolicy.PANEL,A,B),"video changed while loading");
        check(!DescriptionHeaderPolicy.current(true,true,true,false,null,null,panel,panel,DescriptionHeaderPolicy.PANEL,A,A),"missing request generation");
        check(!DescriptionHeaderPolicy.current(true,true,true,false,generation,generation,null,null,DescriptionHeaderPolicy.PANEL,A,A),"unbound native owner");
        DescriptionHeaderSource.rememberTitle(A,raw); DescriptionHeaderSource.rememberTitle(B,"Other title");
        check(DescriptionHeaderSource.title(A).equals(raw)&&DescriptionHeaderSource.title(B).equals("Other title"),"preloaded next title never replaces current id");
        DescriptionHeaderSource.rememberTitle(A,null);
        check(DescriptionHeaderSource.title(A)==null,"missing fresh title clears old title");
        DescriptionHeaderSource.rememberTitle(A,"x".repeat(DescriptionHeaderPolicy.MAX_TEXT+1));
        check(DescriptionHeaderSource.title(A)==null,"oversized title never truncates");
        DescriptionHeaderSource.rememberTitle(A,raw);
        for(int i=0;i<17;i++)DescriptionHeaderSource.rememberTitle(String.format("%011d",i),"Title "+i);
        check(DescriptionHeaderSource.title(A)==null,"bounded title retention");
        System.out.println("PASS "+checks+" Description raw-metadata and session checks");
    }
}
