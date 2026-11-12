package app.morphe.extension.chmate;

import java.io.IOException;
import java.nio.file.*;
import java.util.*;
import org.json.*;

/** Read-only live smoke test: each supplied menu -> actual board -> complete thread. */
public final class VerifyBakusaiMenuThreads {
    private static Path root;
    private static int request;
    private static final class Response {
        final String url, html;
        Response(String url, String html) { this.url=url; this.html=html; }
    }
    private static Response fetch(String url, String label) throws Exception {
        Path file=root.resolve(label+".html");
        Process p=new ProcessBuilder("curl.exe", "--silent", "--show-error", "--location",
                "--proto", "=https", "--proto-redir", "=https", "--max-redirs", "4",
                "--max-time", "40", "-A", "Haiagaru", "-b", root.resolve("session.txt").toString(),
                "-c", root.resolve("session.txt").toString(), "-o", file.toString(),
                "-w", "%{http_code}\n%{url_effective}", url)
                .redirectError(root.resolve(label+".error").toFile()).start();
        String[] status=new String(p.getInputStream().readAllBytes(), java.nio.charset.StandardCharsets.UTF_8).split("\n",2);
        int exit=p.waitFor();
        Thread.sleep(2200);
        if(exit!=0 || !status[0].trim().equals("200") || status.length!=2) throw new IOException("HTTP "+status[0].trim());
        return new Response(status[1].trim(), Files.readString(file));
    }
    public static void main(String[] args) throws Exception {
        if(args.length!=2) throw new IllegalArgumentException("manifest.json output-directory");
        root=Path.of(args[1]); Files.createDirectories(root);
        JSONArray manifest=new JSONArray(Files.readString(Path.of(args[0]))), results=new JSONArray();
        int success=0;
        for(int n=0;n<manifest.length();n++) {
            JSONObject item=manifest.getJSONObject(n), result=new JSONObject(item.toString());
            result.put("testedAt", java.time.Instant.now().toString());
            try {
                Response list=fetch(item.getString("boardUrl"), "board-"+n);
                var board=SiteBoardProtocol.address(list.url);
                var topics=SiteBoardProtocol.topics(board,list.html);
                result.put("finalBoardUrl",list.url).put("topics",topics.size());
                var topic=topics.stream().filter(t->t.count>1 && t.count<=50).findFirst()
                        .orElseGet(()->topics.stream().min(Comparator.comparingInt(t->t.count)).orElseThrow());
                String url=board.threadUrl(topic.id);
                result.put("threadUrl",url).put("title",topic.title).put("listedCount",topic.count);
                Response first=fetch(url,"thread-"+n);
                final int index=n; request=1;
                var page=BakusaiPagination.thread(board,topic.id,first.html,next->{
                    try { return fetch(next,"thread-"+index+"-page-"+(++request)).html; }
                    catch(Exception e) { throw new IOException(e); }
                });
                int missing=(int)page.entries.stream().filter(e->e.name.equals("未取得")).count();
                boolean opening=page.entries.stream().anyMatch(e->e.original.equals("0") && !e.body.isBlank());
                boolean replies=page.entries.stream().anyMatch(e->!e.original.equals("0") && !e.body.isBlank() && !e.name.equals("未取得"));
                boolean ok=opening && replies && missing==0;
                result.put("pages",request).put("rows",page.entries.size()).put("missing",missing)
                        .put("opening",opening).put("replies",replies).put("ok",ok);
                if(ok)success++;
            } catch(Exception error) { result.put("ok",false).put("error",String.valueOf(error.getMessage())); }
            results.put(result); Files.writeString(root.resolve("results.json"),results.toString(2));
            System.out.println((n+1)+"/"+manifest.length()+" "+item.getString("boardName")+" "+result.getBoolean("ok")+(result.has("error")?" "+result.getString("error"):""));
        }
        System.out.println("Complete thread bodies: "+success+"/"+manifest.length());
    }
}
