package app.morphe.extension.chmate;
import java.util.*;
public class XPostTimeTest{static int checks;static void eq(String a,String b){if(!Objects.equals(a,b))throw new AssertionError(a+" != "+b);checks++;}
public static void main(String[] args){for(String device:new String[]{"UTC","America/Los_Angeles","Asia/Tokyo"}){TimeZone.setDefault(TimeZone.getTimeZone(device));
eq(XPostTime.japan("2026-10-30T18:00:00.000Z"),"2026/10/31 03:00:00 JST");
eq(XPostTime.japan("2026-10-30T18:00:00Z"),"2026/10/31 03:00:00 JST");
eq(XPostTime.japan("Fri Oct 30 18:00:00 +0000 2026"),"2026/10/31 03:00:00 JST");
eq(XPostTime.japan("2026-10-31T03:00:00+09:00"),"2026/10/31 03:00:00 JST");}
eq(XPostTime.japan(null),"");eq(XPostTime.japan(""),"");eq(XPostTime.japan("bad date"),"bad date");eq(XPostTime.japan("2026-02-30T00:00:00Z"),"2026-02-30T00:00:00Z");
System.out.println("PASS "+checks+" JST timestamp checks");}}
