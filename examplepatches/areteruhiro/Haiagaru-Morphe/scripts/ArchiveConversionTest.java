package app.morphe.extension.chmate;

import java.lang.reflect.*;import java.nio.file.*;import java.nio.charset.*;

/** Runs the real importer conversion, with host-only Html entity and Log substitutes. */
public final class ArchiveConversionTest {
    static int checks;static void ok(boolean value){checks++;if(!value)throw new AssertionError();}
    static Method method(Class<?> owner,String name,Class<?>...types)throws Exception{Method m=owner.getDeclaredMethod(name,types);m.setAccessible(true);return m;}
    public static void main(String[] args)throws Exception{
        Class<?> info=Class.forName(ArchivedThreadImporter.class.getName()+"$ThreadInfo"),route=Class.forName(ArchivedThreadImporter.class.getName()+"$RouteFormat");
        Object target=method(info,"parse",String.class).invoke(null,"https://egg.5ch.io/test/read.cgi/android/1781461086/");
        String source="<h1 id=\"threadtitle\">題名𝕏</h1><div id=\"1\" class=\"post\"><span class=\"postusername\"><b>名前</b></span><span class=\"date\">2026/06/15</span><span class=\"uid\">ID:test</span></details><section class=\"post-content\">𝕏 😀 ☺️ 🧑‍💻<br>二行目</section></div>";
        Method convert=method(ArchivedThreadImporter.class,"convertRouteResponse",route,info,byte[].class);
        for(String format:new String[]{"KAKO","AUTO"})for(String html:new String[]{source,source.replace("<span class=\"postusername\">","<div class=\"post-header\"><span class=\"postusername\">").replace("</details>","</div>").replace("<section class=", "<div class=").replace("</section>","</div>")}){
            byte[] result=(byte[])convert.invoke(null,Enum.valueOf((Class)route,format),target,html.getBytes(StandardCharsets.UTF_8));String dat=new String(result,"MS932");
            ok(dat.contains("&#120143; &#128512;"));ok(dat.contains("&#65039;")&&dat.contains("&#8205;"));ok(dat.contains("<br>二行目"));ok(dat.endsWith("<>題名&#120143;\n"));
        }
        if(args.length>0){byte[] result=(byte[])convert.invoke(null,Enum.valueOf((Class)route,"KAKO"),target,Files.readAllBytes(Path.of(args[0])));String dat=new String(result,"MS932");ok(dat.contains("&#120143;の設定画面"));ok(dat.contains("ID:G5XCUTt1H"));ok(dat.contains("(JP 0H8a-nw5Y)"));}
        StringBuilder large=new StringBuilder("<h1 id=\"threadtitle\">大きな過去ログ</h1>");
        for(int n=1;n<=1000;n++)large.append("<div id=\"").append(n).append("\" class=\"post\"><div class=\"post-header\"><span class=\"postusername\">名前</span><span class=\"date\">2026/06/15</span></div><div class=\"post-content\">本文𝕏 😀</div></div>");
        long started=System.nanoTime();byte[] many=(byte[])convert.invoke(null,Enum.valueOf((Class)route,"KAKO"),target,large.toString().getBytes(StandardCharsets.UTF_8));
        ok(new String(many,"MS932").lines().count()==1000);ok(System.nanoTime()-started<10_000_000_000L);
        System.out.println("PASS "+checks+" actual archive converter legacy/current/UTF-8/real-post checks");
    }
}
