package app.morphe.extension.chmate;
import java.util.*;
public class NativeReaderRulesTest{
 public static void main(String[] args)throws Exception{
  int checks=0;Object list=new Object();
  for(int status=-1;status<=599;status++){boolean valid=status>=200&&status<300;if((NativeSubjectCache.result(list,status)==list)!=valid)throw new AssertionError("status "+status);checks++;}
  if(NativeSubjectCache.result(null,200)!=null)throw new AssertionError("null");checks++;
  for(String bad:Arrays.asList("javascript:evil","https://u:p@host/board/","not a URL")){if(PatrolErrorDetails.safeUrl(bad)!=null)throw new AssertionError(bad);checks++;}
  String source="https://bbs.eddibb.cc/liveedge/subject-metadent.txt?token=secret#fragment";
  if(!"https://bbs.eddibb.cc/liveedge/".equals(PatrolErrorDetails.safeUrl(source)))throw new AssertionError("redaction");checks++;
  PatrolErrorDetails.begin();var f=PatrolErrorDetails.class.getDeclaredField("ERRORS");f.setAccessible(true);@SuppressWarnings("unchecked") ThreadLocal<LinkedHashMap<String,String>> errors=(ThreadLocal<LinkedHashMap<String,String>>)f.get(null);
  errors.get().put("https://bbs.eddibb.cc/liveedge/","SocketTimeoutException");errors.get().put("https://example.org/board/","IOException");String log=PatrolErrorDetails.append("native summary");
  if(!log.startsWith("native summary")||!log.contains("https://example.org/board/")||!log.contains("SocketTimeoutException"))throw new AssertionError("message");checks++;
  if(!"next job".equals(PatrolErrorDetails.append("next job")))throw new AssertionError("leaked context");checks++;
  PatrolErrorDetails.begin();Thread thread=new Thread(()->{if(!"separate".equals(PatrolErrorDetails.append("separate")))throw new AssertionError("cross-thread leak");});thread.start();thread.join();PatrolErrorDetails.end();checks++;
  System.out.println("Native reader rules: "+checks+" checks passed");
 }
}
