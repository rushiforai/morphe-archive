import com.google.common.collect.*;
import com.google.common.util.concurrent.*;
import com.google.common.hash.Hashing;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.*;
public class RuntimeDependencySmoke {
  public static void main(String[] args) throws Exception {
    if (!ImmutableList.of(1,2,3).reverse().equals(ImmutableList.of(3,2,1))) throw new AssertionError("list");
    if (!ImmutableMap.of("key",1).get("key").equals(1)) throw new AssertionError("map");
    SettableFuture<Integer> s=SettableFuture.create();
    ListenableFuture<Integer> f=Futures.transform(s,x->x+1,MoreExecutors.directExecutor());
    s.set(41); if(f.get()!=42) throw new AssertionError("transform");
    SettableFuture<Integer> pending=SettableFuture.create();
    ListenableFuture<Integer> canceled=Futures.transform(pending,x->x+1,MoreExecutors.directExecutor());
    canceled.cancel(true); if(!pending.isCancelled())throw new AssertionError("cancel");
    ListenableFuture<Integer> c=CallbackToFutureAdapter.getFuture(completer->{completer.set(7);return "test";});
    if(c.get(2,TimeUnit.SECONDS)!=7) throw new AssertionError("adapter");
    if (!Hashing.sha256().hashString("abc",StandardCharsets.UTF_8).toString().equals("ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad")) throw new AssertionError("hash");
    System.out.println("PASS: ImmutableList, ImmutableMap, Future transform/cancel, CallbackToFutureAdapter, SHA-256");
  }
}
