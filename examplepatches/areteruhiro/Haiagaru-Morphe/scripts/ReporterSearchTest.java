package app.morphe.extension.chmate;
import java.io.*;
import java.time.*;
import java.util.regex.Pattern;
public final class ReporterSearchTest {
    static int checks;
    static void check(boolean value){checks++;if(!value)throw new AssertionError("check "+checks);}
    static long time(String value){return OffsetDateTime.parse(value+"+09:00").toInstant().toEpochMilli();}
    public static void main(String[] args)throws Exception{
        long[] days=ReporterSearch.dateRange("2026-11-10", "2026-11-12");
        check(days[0]==time("2026-11-10T00:00:00"));
        check(days[1]==time("2026-11-13T00:00:00"));
        check(ReporterSearch.dateRange("2024-02-29","2024-02-29")[1]==time("2024-03-01T00:00:00"));
        try { ReporterSearch.dateRange("2026-11-12","2026-11-10");throw new AssertionError(); }
        catch(IllegalArgumentException expected){checks++;}
        try { ReporterSearch.dateRange("2026-02-29","2026-03-01");throw new AssertionError(); }
        catch(IllegalArgumentException expected){checks++;}
        long before=time("2026-11-12T08:59:00"),after=time("2026-11-12T09:00:00");
        check(ReporterSearch.period(1,before)[1]==after);
        check(ReporterSearch.period(1,after)[0]==after);
        check(ReporterSearch.period(0,before)[1]==after);
        check(ReporterSearch.period(0,after)[0]==after);
        check(ReporterSearch.period(0,after)[1]==time("2026-11-13T00:00:00"));
        check(ReporterSearch.period(2,before)[0]==time("2026-11-12T00:00:00"));
        check(ReporterSearch.period(2,time("2026-11-13T00:00:00"))[0]==time("2026-11-13T00:00:00"));
        String id="a./+BCdE", suffix="["+id+"★]";
        check(ReporterSearch.queryForMode(id,0).equals(id));
        check(ReporterSearch.queryForMode(id,1).equals("a./+"));
        check(ReporterSearch.queryForMode(id,2).equals("BCdE"));
        try { ReporterSearch.queryForMode("a./+",1); throw new AssertionError(); }
        catch(IllegalArgumentException expected) { checks++; }
        try { ReporterSearch.queryForMode(id,3); throw new AssertionError(); }
        catch(IllegalArgumentException expected) { checks++; }
        check(Pattern.compile(ReporterSearch.pattern(suffix,1)).matcher("title "+suffix).find());
        check(!Pattern.compile(ReporterSearch.pattern(suffix,1)).matcher("title [ax/+BCdE★]").find());
        check(Pattern.compile(ReporterSearch.pattern(suffix,2)).matcher("title [ZZZZBCdE★]").find());
        check(!Pattern.compile(ReporterSearch.pattern(suffix,2)).matcher("title [ZZZZBCdE★] extra").find());
        String header="保存日時,記者ID,スレ,スレURL,スレID,スレ作成日時\r\n";
        String csv=header+"now,"+id+",\"Test, 日本語\n\"\"引用\"\"\",https://untrusted.invalid,1794154437,\r\n";
        long created=1794154437000L;
        for(int mode=0;mode<4;mode++){
            String query=mode==0?id:mode==1?"a./+":mode==2?"BCdE":"TEST, 日本語";
            ReporterSearch.Result result=ReporterSearch.search(new StringReader(csv),mode,query,created,created+1);
            check(result.matches==1);check(result.rows.get(0).title.equals("Test, 日本語\n\"引用\""));
            check(result.rows.get(0).url.equals("https://bbs.eddibb.cc/test/read.cgi/liveedge/1794154437/"));
            check(ReporterSearch.search(new StringReader(csv),mode,query,created-1,created).matches==0);
        }
        check(ReporterSearch.search(new StringReader(csv),0,"A./+BCdE",created,created+1).matches==0);
        try{ReporterSearch.search(new StringReader(header+"\"unfinished"),3,"test",0,Long.MAX_VALUE);throw new AssertionError();}catch(IOException expected){checks++;}
        StringBuilder many=new StringBuilder(header);
        for(int i=0;i<250;i++)many.append("now,a./+BCdE,test,url,").append(1794154437+i).append(",\n");
        ReporterSearch.Result limited=ReporterSearch.search(new StringReader(many.toString()),3,"test",0,Long.MAX_VALUE);
        check(limited.matches==250);check(limited.rows.size()==200);check(limited.rows.get(0).created==(1794154437L+249)*1000);
        if(args.length>0){try(Reader real=new InputStreamReader(new FileInputStream(args[0]),java.nio.charset.StandardCharsets.UTF_8)){
            ReporterSearch.Result result=ReporterSearch.search(real,0,"Bsf/xhDM",0,Long.MAX_VALUE); check(result.matches>0);
        }}
        System.out.println("PASS "+checks+" reporter search checks");
    }
}
