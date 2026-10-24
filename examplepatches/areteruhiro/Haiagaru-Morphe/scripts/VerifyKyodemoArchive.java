package app.morphe.extension.chmate;

import java.nio.file.*;
import java.nio.charset.Charset;

public final class VerifyKyodemoArchive {
    static int checks;
    static void check(boolean value, String label) {
        if (!value) throw new AssertionError(label);
        System.out.println("PASS " + label); checks++;
    }
    public static void main(String[] args) throws Exception {
        String url=KyodemoArchive.query("12球団 +&", "2026-10-01", "2026-10-22", 1);
        check(url.contains("k=12%8B%85%92%63+%2B%26"), "Japanese Shift_JIS query and reserved characters");
        check(KyodemoArchive.parameter(url,"k").equals("12球団 +&"), "restore Shift_JIS query without mojibake");
        check(KyodemoArchive.query("", "", "", 2).contains("/51?"), "second page uses row offset 51");
        check(KyodemoArchive.page(KyodemoArchive.query("", "", "", 3))==3, "restore third page offset");
        check(KyodemoArchive.accepts(url), "accept board-scoped HTTPS URL");
        check(!KyodemoArchive.accepts("https://www.kyodemo.net.evil.test"+KyodemoArchive.PATH), "reject lookalike host");
        check(!KyodemoArchive.accepts("https://www.kyodemo.net/sdemo/b/android/"), "reject other board restore");
        check(!KyodemoArchive.accepts("https://www.kyodemo.net:1234"+KyodemoArchive.PATH), "reject custom port");
        try { KyodemoArchive.query("😀", "", "",1); throw new AssertionError("lossy query"); }
        catch(IllegalArgumentException expected){check(true,"reject unencodable query rather than silently replacing characters");}
        String row="<article class='panel-block'><a href='/sdemo/r/e_e_liveedge/1792624518/'><h2 class='cltitle'>1:<span>12球団</span>テスト</h2><small class='left_i'>10/22 08:15</small></a></article>";
        String next="<a href='/sdemo/b/e_e_liveedge/51?k=test' class='pagination-next btn-next'>次</a>";
        KyodemoArchive.Page parsed=KyodemoArchive.parse("<nav id='blist'>"+row+"</nav>"+next,1);
        check(parsed.rows.size()==1,"parse article rows and nested highlighted title");
        check(parsed.rows.get(0).url.equals("https://bbs.eddibb.cc/test/read.cgi/liveedge/1792624518/"),"open canonical ChMate thread URL");
        check(parsed.rows.get(0).titleHtml.startsWith("<span>"),"remove result ordinal only");
        check(parsed.hasNext,"next page follows explicit pagination link");
        check(KyodemoArchive.parse("<nav id='blist'>"+row.replace("10/22 08:15", "<span>10/22 08:15</span><i class='edit'></i><span>10/22 09:00</span>")+"</nav>",1).rows.get(0).dateHtml.equals("10/22 08:15 / 10/22 09:00"),"creation and update dates separated");
        check(!KyodemoArchive.parse("<nav id='blist'>"+row+"</nav>"+next,2).hasNext,"reject wrong-page next link");
        check(KyodemoArchive.parse("<nav id='blist'></nav>",1).rows.isEmpty(),"legitimate empty result");
        try {KyodemoArchive.parse("<h1>502 Bad Gateway</h1>",1);throw new AssertionError("error parsed as zero");}
        catch(java.io.IOException expected){check(true,"error page not classified as zero results");}
        if(args.length>0){
            String live=new String(Files.readAllBytes(Path.of(args[0])),Charset.forName("Windows-31J"));
            KyodemoArchive.Page page=KyodemoArchive.parse(live,1);
            check(page.rows.size()==50,"live search returns 50 actual thread rows");
            check(page.rows.stream().anyMatch(item -> item.url.endsWith("/1792624518/")),"provided thread present in live results");
            check(page.rows.get(0).titleHtml.contains("12球団"),"live Japanese title preserved");
            check(page.hasNext,"live next-page detection");
        }
        System.out.println("COMPLETE checks="+checks);
    }
}
