package app.yydarlinker.deepseekcaptions;
import static org.junit.Assert.*;
import java.net.*;import java.io.*;import java.lang.reflect.*;import java.util.concurrent.atomic.*;
import org.junit.*;
public class N37FailureCategoriesTest {
 @Test public void cancellationDeadlineReadTimeoutAndSocketHaveExclusiveFactCategories()throws Exception{
  assertEquals(TokenCostAudit.FailureCategory.CANCELLED,RebuildApi.transportCategory(new SocketException(),"read",null,true));
  assertEquals(TokenCostAudit.FailureCategory.READ_TIMEOUT,RebuildApi.transportCategory(new SocketTimeoutException(),"read",null,false));
  assertEquals(TokenCostAudit.FailureCategory.CONNECT_TIMEOUT,RebuildApi.transportCategory(new SocketTimeoutException(),"connect",null,false));
  assertEquals(TokenCostAudit.FailureCategory.NETWORK_IO,RebuildApi.transportCategory(new SocketException(),"read",null,false));
  HttpURLConnection connection=new HttpURLConnection(new URL("http://127.0.0.1:9")){public void connect(){}public void disconnect(){}public boolean usingProxy(){return false;}};
  NetworkDeadline deadline=new NetworkDeadline(connection,System.nanoTime()+java.util.concurrent.TimeUnit.MINUTES.toNanos(1));
  try{Field f=NetworkDeadline.class.getDeclaredField("fired");f.setAccessible(true);((AtomicBoolean)f.get(deadline)).set(true);
   assertEquals(TokenCostAudit.FailureCategory.DEADLINE_EXPIRED,RebuildApi.transportCategory(new SocketTimeoutException(),"read",deadline,false));
   assertEquals(TokenCostAudit.FailureCategory.CANCELLED,RebuildApi.transportCategory(new SocketException(),"read",deadline,true));
  }finally{deadline.close();}
  assertEquals(TokenCostAudit.FailureCategory.CANCELLED,TokenCostAudit.failureCategory("network_cancelled"));
  assertEquals(TokenCostAudit.FailureCategory.DEADLINE_EXPIRED,TokenCostAudit.failureCategory("network_deadline_expired"));
 }
}
