package app.johninnl.modelhost.api;
import android.os.ParcelFileDescriptor;
import android.os.RemoteException;
import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import java.util.*;
import static org.junit.Assert.*;
@RunWith(RobolectricTestRunner.class)
@Config(sdk=34,manifest=Config.NONE)
public class HostSessionProtocolTest {
 private static final class Server extends IModelSession.Stub {
  long cancelled;int closes;boolean throwOnClose;
  public long submitText(String json,ITextResultCallback callback)throws RemoteException{
   try{String id=new JSONObject(json).getString("clientRequestId");callback.onResult(new JSONObject().put("schema",1).put("requestId",42).put("clientRequestId",id).put("epoch","server").put("terminal",true).put("status","ok").put("text","corrected").toString());return 42;}catch(org.json.JSONException e){throw new IllegalArgumentException(e);}
  }
  public long preparePrefix(String json,ITextResultCallback callback)throws RemoteException{return submitText(json,callback);}
  public long submitImage(String json,ParcelFileDescriptor image,ITextResultCallback callback)throws RemoteException{return submitText(json,callback);}
  public void cancel(long id){cancelled=id;}
  public void close(){closes++;if(throwOnClose)throw new IllegalStateException("SESSION_CLOSED");}
 }
 @Test public void callbackBeforeSubmitReturnIsNotLost(){Server server=new Server();List<String> replies=new ArrayList<>();HostSession session=new HostSession(server,Runnable::run,Runnable::run,s->{});RequestHandle handle=session.submitText(TextRequest.edit("proofread","original"),replies::add);assertTrue(handle.isComplete());assertEquals(42,handle.serverRequestId());assertEquals(1,replies.size());session.close();}
 @Test public void cancelBeforeAckIsSentAndLateSuccessIsIgnored(){Server server=new Server();ArrayDeque<Runnable> work=new ArrayDeque<>();List<String> replies=new ArrayList<>();HostSession session=new HostSession(server,work::add,Runnable::run,s->{});RequestHandle handle=session.submitText(TextRequest.edit("proofread","original"),replies::add);handle.cancel();while(!work.isEmpty())work.removeFirst().run();assertEquals(42,server.cancelled);assertTrue(handle.isComplete());assertTrue(replies.isEmpty());session.close();while(!work.isEmpty())work.removeFirst().run();}
 @Test public void closingAnAlreadyClosedRemoteCannotCrashTheCaller(){Server server=new Server();server.throwOnClose=true;HostSession session=new HostSession(server,Runnable::run,Runnable::run,s->{});session.close();session.close();assertEquals(1,server.closes);}
}
