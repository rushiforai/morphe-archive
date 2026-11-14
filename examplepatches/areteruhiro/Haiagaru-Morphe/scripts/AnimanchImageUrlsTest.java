package app.morphe.extension.chmate;
import java.util.*;
public final class AnimanchImageUrlsTest {
    static int checks;
    static void ok(boolean b){if(!b)throw new AssertionError("check "+checks);checks++;}
    public static void main(String[] args){
        String normal="https://bbs.animanch.com/img/7557374/98",arc="https://bbs.animanch.com/arc/img/7557374/135";
        ok(AnimanchImageUrls.sources("<a href=\""+arc+"\">画像</a> "+normal).equals(Arrays.asList(arc,normal)));
        ok(AnimanchImageUrls.candidates(arc).equals(Arrays.asList(arc.replace("/arc/","/"),arc)));
        ok(AnimanchImageUrls.candidates(normal).equals(Collections.singletonList(normal)));
        ok(AnimanchImageUrls.sources(normal+"evil "+normal+"?x=1 https://evil.test/img/1/1").isEmpty());
        String[] base={"existing","existing"};
        ok(Arrays.equals(AnimanchImageUrls.append(base,arc+" "+arc,u->"local"),new String[]{"existing","existing","local"}));
        ok(AnimanchImageUrls.append(base,arc,u->null)==base);
        StringBuilder many=new StringBuilder();for(int n=1;n<=300;n++)many.append("https://bbs.animanch.com/arc/img/1/").append(n).append(' ');
        ok(AnimanchImageUrls.sources(many.toString()).size()==256);
        ok(AnimanchImageUrls.append(base,many.toString(),u->u).length==256);
        System.out.println("PASS AnimanchImageUrls: "+checks);
    }
}
