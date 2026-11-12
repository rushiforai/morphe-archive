package app.morphe.extension.chmate;
import java.nio.file.*;
import java.io.IOException;
public final class BakusaiOmittedRepliesTest {
    public static void main(String[] args)throws Exception {
        var board=SiteBoardProtocol.address("https://bakusai.com/thr_res/acode=4/ctgid=104/bid=268/tid=5829751/");
        String html=Files.readString(Path.of("build/external-board-dates/prefectures/thread-18.html"));
        var page=BakusaiPagination.thread(board,board.thread,html,url->{throw new AssertionError("single-page source must not generate pages");});
        if(page.entries.size()!=9)throw new AssertionError("OP + eight numbered slots");
        int real=0;
        for(int n=0;n<page.entries.size();n++){
            var row=page.entries.get(n);if(!row.original.equals(""+n))throw new AssertionError("numbering");
            if(n==6){if(!row.name.equals("未取得")||!row.body.contains("含まれていない"))throw new AssertionError("honest missing-source notice");}
            else {if(row.name.equals("未取得"))throw new AssertionError("real reply replaced");real++;}
        }
        if(real!=8||!page.entries.get(0).body.contains("一部のレスが未取得"))throw new AssertionError("partial disclosure");
        String truncated=html.replace("id=\"res8\"","id=\"not-a-response\"");
        try {BakusaiPagination.thread(board,board.thread,truncated,url->{throw new IOException("not expected");});throw new AssertionError("truncated tail must not become a source omission");}
        catch(IOException expected){}
        System.out.println("PASS 13 real source-omission/numbering/truncated-tail checks; no missing content invented");
    }
}
