package app.morphe.extension.chmate;
import java.util.*;
import java.nio.charset.StandardCharsets;

public final class BoardCookieRequestTest {
    static int checks;
    static void eq(Object actual,Object expected){if(!Objects.equals(actual,expected))throw new AssertionError(actual+" != "+expected);checks++;}
    public static void main(String[] args){
        eq(BoardCookieRequest.lists(Arrays.asList("bbs","MESSAGE"),Arrays.asList("liveedge","bbs")),"liveedge");
        eq(BoardCookieRequest.lists(Arrays.asList("bbs","MESSAGE"),Arrays.asList("android","board")),"android");
        eq(BoardCookieRequest.lists(Arrays.asList("%62bs","board"),Arrays.asList("android","android")),"android");
        eq(BoardCookieRequest.lists(Arrays.asList("bbs","board"),Arrays.asList("android","liveedge")),null);
        eq(BoardCookieRequest.lists(Arrays.asList("bbs"),Arrays.asList("../other")),null);
        eq(BoardCookieRequest.lists(Arrays.asList("bbs"),Arrays.asList("%GG")),null);
        eq(BoardCookieRequest.lists(Arrays.asList("MESSAGE"),Arrays.asList("bbs=android")),null);
        eq(BoardCookieRequest.lists(Arrays.asList("bbs"),Collections.emptyList()),null);
        eq(BoardCookieRequest.lists(null,null),null);
        byte[] bytes="bbs=wrong&bbs=android&board=wrong".getBytes(StandardCharsets.ISO_8859_1);
        eq(BoardCookieRequest.bytes(bytes,10,11),"android"); // Only the bytes actually sent.
        eq(BoardCookieRequest.bytes(bytes,0,bytes.length),null);
        eq(BoardCookieRequest.bytes(bytes,-1,11),null);
        eq(BoardCookieRequest.bytes(bytes,10,Integer.MAX_VALUE),null);
        eq(BoardCookieRequest.bytes(bytes,bytes.length,1),null);
        eq(BoardCookieRequest.bytes(bytes,0,0),null);
        eq(BoardCookieRequest.board(new Object(),"https://bbs.eddibb.cc/liveedge/"),"https://bbs.eddibb.cc/liveedge/");
        eq(BoardCookieRequest.board(new Object(),"https://egg.5ch.io/test/bbs.cgi"),null);
        eq(BoardCookieRequest.board(new Object()),null);
        eq(BoardCookieRequest.board(null),null);
        System.out.println("BoardCookieRequest: "+checks+" passed");
    }
}
