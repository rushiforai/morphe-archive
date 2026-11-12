package app.morphe.extension.chmate;
import java.io.IOException;import java.util.*;
public final class SiteThreadIdsTest {
 static int checks;static void ok(boolean value,String label){if(!value)throw new AssertionError(label);checks++;}
 public static void main(String[] args)throws Exception{
  for(String id:List.of("1","13601530","380363","7589284","2355864","9239999999")){
   long nativeId=SiteThreadIds.nativeId(id);ok(nativeId>=9240000000L,"native ID has no timestamp semantics");ok(SiteThreadIds.source(""+nativeId).equals(id),"upstream source ID roundtrip");ok(SiteThreadIds.nativeInput(""+nativeId)==nativeId,"already-native ID not reencoded");ok(SiteThreadIds.source(String.format(Locale.ROOT,"%012d",Long.parseLong(id))).equals(id),"old padded source URL works");
  }
  for(String invalid:List.of("0","-1","../123","9240000000","18480000000","9999999999999"))try{SiteThreadIds.source(invalid);throw new AssertionError("invalid accepted "+invalid);}catch(IOException expected){checks++;}
  try{SiteThreadIds.nativeId("10000000000");throw new AssertionError("out-of-range source must not become another thread");}catch(IOException expected){checks++;}
  String subject=new String(SiteNativeData.subject(List.of(new SiteBoardProtocol.Topic("7589284","test",5))),"windows-31j");ok(subject.startsWith("9247589284.dat<>"),"list declares non-timestamp identity");
  System.out.println("PASS "+checks+" native non-timestamp/date/source-ID compatibility checks");
 }
}
