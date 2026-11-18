import app.template.extension.extension.*;
import java.nio.charset.StandardCharsets;
public final class RequestRowTest {
 static RequestRecord item(boolean cached,long sample,String value,RequestRecord.Outcome outcome){RequestRecord.Details details=new RequestRecord.Details("192.0.2.1",161,1,1,1000,1,"ctx","encoded","ok",sample);return new RequestRecord("t",0,"1.3.6.1.2.1.1.1.0",0,100000000L,cached,value==null?null:value.getBytes(StandardCharsets.UTF_8),details,outcome);}
 public static void main(String[] args){
  String live=RequestRow.format(item(false,-1,"octets:QnJvdGhlcg==",RequestRecord.Outcome.SUCCESS),0,100000000L,false);
  if(!live.contains("System description\n")||!live.contains("Brother")||!live.contains("0.000 s · 100 ms")||live.contains("1.3.6.1"))throw new AssertionError(live);
  String hit=RequestRow.format(item(true,75000000L,"integer:42",RequestRecord.Outcome.SUCCESS),100000000L,75000000L,true);
  if(!hit.contains("42")||!hit.contains("0.100 s · ~75 ms")||hit.contains("Cache")||hit.contains("100 ms"))throw new AssertionError(hit);
  String noSample=RequestRow.format(item(true,-1,"missing:",RequestRecord.Outcome.SUCCESS),-1,-1,true);if(!noSample.contains("No such object")||!noSample.contains("time unavailable"))throw new AssertionError(noSample);
  RequestRecord decoded=new RequestRecord("l",0,"1.3.6.1.2.1.43.15.1.1.2.1.1",0,1000000L,true,"integer:6".getBytes(StandardCharsets.UTF_8));
  String row=RequestRow.format(decoded,0,1000000L,false);if(!row.contains("6")||!row.contains("PostScript"))throw new AssertionError("show both original and interpreted values: "+row);
  RequestRecord unknownValue=new RequestRecord("u",0,"1.3.6.1.2.1.43.15.1.1.2.1.1",0,1,true,"integer:987".getBytes(StandardCharsets.UTF_8));
  if(!RequestRow.format(unknownValue,0,1L,false).contains("987")||RequestRow.format(unknownValue,0,1L,false).contains("PostScript"))throw new AssertionError("unknown values must retain raw numbers");
  String longValue = new String(new char[160]).replace('\0','x') + "-end";
  String encoded = "octets:" + java.util.Base64.getEncoder().encodeToString(longValue.getBytes(StandardCharsets.UTF_8));
  if(!RequestRow.format(item(false,-1,encoded,RequestRecord.Outcome.SUCCESS),0,100000000L,false).endsWith(longValue))
   throw new AssertionError("saved request signatures must keep the full response for expansion and copy");
  String[] indexes={"1.3.6.1.2.1.43.8.2.1.21.1.19","1.3.6.1.2.1.43.8.2.1.13.1.19","1.3.6.1.4.1.2435.2.3.9.4.2.1.5.1.2.71.12.1.2.19","1.3.6.1.2.1.43.13.4.1.9.1.19","1.3.6.1.2.1.43.15.1.1.2.1.19","1.3.6.1.4.1.2435.2.3.9.4.2.1.5.1.2.70.1.1.2.19"};
  for(String oid:indexes){
   RequestRecord missing=new RequestRecord("m",0,oid,0,1,false,"missing:".getBytes(StandardCharsets.UTF_8));
   if(!RequestRow.format(missing,0,1,false).endsWith("#19\nNo such object"))
    throw new AssertionError("show table slot even for missing entries");
  }
  String failure=RequestRow.format(item(false,-1,null,RequestRecord.Outcome.TIMEOUT),0,100000000L,false);if(!failure.contains("Timed out"))throw new AssertionError(failure);
 }
}
