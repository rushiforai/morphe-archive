package app.morphe.extension.chmate;
import java.util.Arrays;
public final class UpdateConnectionHeadersTest {
    static int checks;
    static void check(boolean ok) { if (!ok) throw new AssertionError(); checks++; }
    public static void main(String[] args) {
        check(UpdateConnectionHeaders.apply(null)==null);
        String[] malformed={"Connection"};check(UpdateConnectionHeaders.apply(malformed)==malformed);
        check(Arrays.equals(UpdateConnectionHeaders.apply(new String[0]),new String[]{"Connection","close"}));
        String[] original={"Range","bytes=128-","Cookie","fixture-cookie","Connection","Keep-Alive","connection","upgrade","User-Agent","fixture-agent","If-None-Match","fixture-tag"};
        String[] copy=original.clone();String[] changed=UpdateConnectionHeaders.apply(original);
        check(Arrays.equals(original,copy));
        check(Arrays.equals(changed,new String[]{"Range","bytes=128-","Cookie","fixture-cookie","User-Agent","fixture-agent","If-None-Match","fixture-tag","Connection","close"}));
        check(Arrays.equals(changed,UpdateConnectionHeaders.apply(changed)));
        check(UpdateConnectPolicy.isThreadResource("GET","https://example.org/board/subject.txt"));
        check(UpdateConnectPolicy.isThreadResource("GET","https://example.org/board/dat/1234567890.dat"));
        check(!UpdateConnectPolicy.isThreadResource("POST","https://example.org/board/subject.txt"));
        for(String url:new String[]{"https://example.org/test/bbs.cgi","https://example.org/a.gif","https://example.org/a.mp4","https://example.org/a.jpeg","file:///board/subject.txt"})
            check(!UpdateConnectPolicy.isThreadResource("GET",url));
        System.out.println("PASS "+checks+" request scope, immutable headers and unchanged unrelated headers");
    }
}
