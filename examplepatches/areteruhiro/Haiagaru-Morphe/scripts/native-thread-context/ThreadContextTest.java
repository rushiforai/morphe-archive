package app.morphe.extension.chmate;
import java.util.Objects;
public final class ThreadContextTest {
    static int checks;
    static void eq(Object actual,Object expected){if(!Objects.equals(actual,expected))throw new AssertionError(actual+" != "+expected);checks++;}
    private static class Board {
        final String url;Board(String url){this.url=url;}
        public String d(int no){return url+no;}
        public String e(int no){return url+no;}
        public String c(int no){return url+no;}
    }
    private static class Flow {
        Object value;Flow(Object value){this.value=value;}
        public Object c(){return value;}
        public Object d(){return value;}
    }
    private static class Model {
        final Flow d,r;Model(Board board){d=new Flow(board);r=new Flow(board);}
    }
    private static class BaseFragment {private final Board W;BaseFragment(Board board){W=board;}}
    private static class Fragment extends BaseFragment {
        private final Model model;Fragment(Board board){super(board);model=new Model(board);}
    }
    public static void main(String[] args)throws Exception {
        for(String version:new String[]{"0.8.10.191 dev","0.8.10.226 dev","0.8.10.242 dev"}){
            eq(NativeThreadContext.board(null,version),null);eq(NativeThreadContext.url(null,version,1),null);
            for(String url:new String[]{"https://egg.5ch.io/test/read.cgi/android/1793113633/","http://bbs.eddibb.cc/test/read.cgi/liveedge/1793443391/","https://mercury.bbspink.com/test/read.cgi/erobbs/1234567890/"}){
                Board board=new Board(url);Fragment fragment=new Fragment(board);
                eq(NativeThreadContext.board(fragment,version),board);
                eq(NativeThreadContext.url(board,version,1),url+1);
                eq(NativeThreadContext.url(board,version,83),url+83);
                Board other=new Board(url+"other/");Fragment second=new Fragment(other);
                eq(NativeThreadContext.board(second,version),other);
                eq(NativeThreadContext.board(fragment,version),board);
                if(!version.contains("191")){
                    fragment.model.d.value=other;fragment.model.r.value=other;
                    eq(NativeThreadContext.board(fragment,version),other);
                }
            }
        }
        eq(NativeThreadContext.flow(null,"r","d"),null);
        System.out.println("PASS native thread context "+checks+" checks: inherited fields, hidden flows, exact tab, changed board, three URL families");
    }
}
