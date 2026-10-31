package app.local.extension.curve;

import java.lang.reflect.*;
import java.math.BigDecimal;
import java.time.*;
import java.util.*;
import java.util.concurrent.*;
import org.json.*;

/** Version-pinned bridge to Curve's authenticated services. Never runs on the UI thread. */
final class BatchCurve {
    static void checkInterrupted() throws InterruptedException {
        if(Thread.currentThread().isInterrupted()) throw new InterruptedException("Batch request cancelled.");
    }
    private static Exception requestFailure(Throwable cause) {
        if(cause instanceof InterruptedException || cause instanceof CancellationException) {
            Thread.currentThread().interrupt();
            if(cause instanceof InterruptedException) return (InterruptedException)cause;
            InterruptedException cancelled=new InterruptedException("Batch request cancelled.");
            cancelled.initCause(cause); return cancelled;
        }
        return new Exception("Curve request failed.",cause);
    }
    static Object call(Object receiver, String name, Object... args) throws Exception {
        checkInterrupted();
        for (Method m : receiver.getClass().getMethods()) {
            if (!m.getName().equals(name) || m.getParameterCount() != args.length) continue;
            boolean fits = true;
            for (int i=0;i<args.length;i++) if (args[i]!=null && !box(m.getParameterTypes()[i]).isInstance(args[i])) fits=false;
            if (fits) { try { return m.invoke(receiver,args); } catch (InvocationTargetException e) { throw requestFailure(e.getCause()); } }
        }
        throw new NoSuchMethodException(name);
    }
    private static Class<?> box(Class<?> c) { return c==boolean.class?Boolean.class:c==int.class?Integer.class:c; }
    static Object field(Object o,String name) throws Exception { return o.getClass().getField(name).get(o); }
    static Object singleton(String name) throws Exception { return Class.forName(name).getField("INSTANCE").get(null); }
    static Object resolve(String name) throws Exception {
        Object koin=Class.forName("rmf").getField("d").get(null);
        if(koin==null) throw new Exception("Open Curve and sign in first.");
        Object scope=field(field(koin,"c"),"d");
        Object factory=Class.forName("vra").getField("a").get(null);
        Object type=call(factory,"getOrCreateKotlinClass",Class.forName(name));
        return call(scope,"b",type,null,null);
    }
    static Object suspend(Object receiver,String name,Object... args) throws Exception {
        checkInterrupted();
        Class<?> cont=Class.forName("kotlin.coroutines.Continuation");
        BlockingQueue<Object> answer=new ArrayBlockingQueue<>(1);
        Object empty=Class.forName("kotlin.coroutines.g").getField("a").get(null);
        Object callback=Proxy.newProxyInstance(cont.getClassLoader(),new Class<?>[]{cont},(o,m,a)-> {
            if(m.getName().equals("getContext")) return empty;
            if(m.getName().equals("resumeWith")) { answer.offer(a[0]); return null; }
            if(m.getName().equals("toString")) return "Batch GBIT continuation";
            if(m.getName().equals("hashCode")) return System.identityHashCode(o);
            if(m.getName().equals("equals")) return o==a[0];
            throw new UnsupportedOperationException(m.getName());
        });
        Object[] full=Arrays.copyOf(args,args.length+1); full[args.length]=callback;
        Object result=call(receiver,name,full);
        if(result!=null && result.getClass().getName().equals("zo2")) {
            try { result=answer.poll(90,TimeUnit.SECONDS); }
            catch(InterruptedException cancelled) { Thread.currentThread().interrupt(); throw cancelled; }
            if(result==null) throw new TimeoutException("Request outcome needs review.");
        }
        if(result!=null && result.getClass().getName().equals("wza")) throw requestFailure((Throwable)field(result,"a"));
        return result;
    }
    static String account() throws Exception {
        if(!Boolean.TRUE.equals(call(resolve("com.curve.data.authentication.domain.usecase.IsUserLoggedInUseCase"),"invoke"))) throw new Exception("Sign in to Curve first.");
        String id=(String)suspend(resolve("com.curve.data.graphql.GraphQLAccountIdProvider"),"getAccountId");
        if(id==null || id.isEmpty()) throw new Exception("Sign in to Curve first.");
        return id;
    }
    static void account(String expected) throws Exception { if(!expected.equals(account())) throw new Exception("Account changed. Batch stopped."); }
    static List<?> history() throws Exception {
        String since=LocalDate.now(ZoneOffset.UTC).minusDays(121).toString();
        Object result=suspend(resolve("com.curve.transactions.api.service.TransactionsService"),"getTransactions",null,null,since,LocalDate.now(ZoneOffset.UTC).plusDays(1).toString(),false,false);
        if(!result.getClass().getName().endsWith("$Success")) throw new Exception("Could not refresh transactions. Try again.");
        return (List<?>)call(call(result,"getBody"),"getTransactions");
    }
    static JSONArray purchases(List<?> history) throws Exception {
        JSONArray rows=new JSONArray(); Set<String> ids=new HashSet<>();
        Object parser=resolve("com.curve.domain.entity.common.DateTimeParser");
        for(Object tx:history) {
            String id=(String)call(tx,"getId");
            Object label=call(tx,"getLabel");
            // Curve marks declines with label 10; successful purchases can also have declineReason text.
            if(!"debit".equals(call(tx,"getDirection")) || call(tx,"getGbitDate")!=null || call(tx,"getGbitOriginalCardId")!=null || Boolean.TRUE.equals(call(tx,"getP2p")) || label instanceof Number && ((Number)label).intValue()==10 || !ids.add(id)) continue;
            ZonedDateTime parsed=(ZonedDateTime)call(parser,"parseFullDateTimeOrNull",call(tx,"getTransactionTime"));
            if(parsed==null) continue;
            Instant time=parsed.toInstant();
            if(time.isBefore(Instant.now().minus(Duration.ofDays(120)))) continue;
            Object amount=call(tx,"getAmountValue"),exponent=call(tx,"getAmountExponent");
            if(amount==null || exponent==null || ((Number)amount).longValue()<=0) continue;
            rows.put(new JSONObject().put("id",id).put("title",call(tx,"getTitle")).put("date",time.toString()).put("source",call(tx,"getCardId"))
                .put("display",money(((Number)amount).longValue(),((Number)exponent).intValue(),(String)call(tx,"getCurrencyISO"))).put("state","pending"));
        }
        List<JSONObject> sorted=new ArrayList<>(); for(int i=0;i<rows.length();i++) sorted.add(rows.getJSONObject(i));
        sorted.sort((a,b)->b.optString("date").compareTo(a.optString("date"))); return new JSONArray(sorted);
    }
    static Object options(String account,String id) throws Exception {
        account(account);
        Object query=Class.forName("com.curve.graphql.apolloGateway.TransactionSwitchingOptionsQuery").getConstructor(String.class,String.class).newInstance(account,id);
        Object service=Enum.valueOf((Class)Class.forName("com.curve.graphql.GraphQLServiceType"),"ApolloGateway");
        Object result=suspend(resolve("com.curve.data.graphql.GraphQLClientWrapper"),"awaitQuery",query,service,singleton("com.curve.data.graphql.FetchPolicy$NetworkOnly"));
        Object errors=field(result,"d");
        if(field(result,"e")!=null) throw new java.io.IOException("Could not reach Curve. Check your connection.");
        if(errors instanceof List && !((List<?>)errors).isEmpty() || field(result,"c")==null) throw new Exception("Curve could not confirm eligibility. Check your plan allowance and try again.");
        Object customer=call(field(result,"c"),"getCustomer");
        if(customer==null) throw new Exception("Curve could not confirm eligibility.");
        Object options=call(customer,"getTransactionSwitchingOptions");
        if(options==null) throw new Exception("Go Back in Time is unavailable for this purchase.");
        return options;
    }
    static JSONObject quote(Object option) throws Exception {
        Object amount=call(option,"getAmount"); if(amount==null) throw new Exception("Charge amount unavailable.");
        JSONObject quote=new JSONObject().put("charge",amount(call(amount,"getAmount")));
        JSONArray fees=new JSONArray(); Object raw=call(option,"getFees");
        if(raw instanceof List) for(Object fee:(List<?>)raw) fees.put(new JSONObject().put("type",call(fee,"getFeeType")).put("amount",amount(call(call(fee,"getAmount"),"getAmount"))));
        quote.put("fees",fees); return quote;
    }
    private static JSONObject amount(Object value) throws Exception { return new JSONObject().put("minor",call(value,"getMinorUnits")).put("exponent",call(value,"getExponent")).put("currency",call(value,"getCurrency")); }
    static String money(long minor,int exponent,String currency) { return BigDecimal.valueOf(minor,exponent).toPlainString()+" "+currency; }
    static String display(JSONObject a) { return money(a.optLong("minor"),a.optInt("exponent"),a.optString("currency")); }
    static Object option(Object options,String card) throws Exception {
        for(Object o:(List<?>)call(options,"getOptions")) if(card.equals(call(o,"getCardID")) && Boolean.TRUE.equals(call(o,"getAvailable"))) return o;
        throw new Exception("Selected card is unavailable for this purchase.");
    }
    static final Map<String,Integer> artworks=new ConcurrentHashMap<>();
    static final Map<String,String> cardImageUrls=new ConcurrentHashMap<>();
    static Map<String,String> cards() throws Exception {
        Map<String,String> result=new LinkedHashMap<>(); Object db=resolve("com.curve.localstorage.CurveDatabase");
        for(Object c:(List<?>)suspend(call(db,"cardDao"),"fetchCards")) if(!Boolean.TRUE.equals(call(c,"getRemoved"))) {
            Object item=call(c,"getCardItem");
            if(item==null || call(item,"getLastFour")==null) continue;
            String id=(String)call(c,"getId"),url=(String)call(c,"getImageUrl");
            if(url!=null && !url.isEmpty()) cardImageUrls.put(id,url); else cardImageUrls.remove(id);
            int art=((Number)call(resolve("com.curve.transactions.gbit.usecase.GetCardImageUseCase"),"invoke",call(item,"getFirstSix"))).intValue();
            if(art>0) artworks.put(id,art); else artworks.remove(id);
            String name=(String)call(c,"getNickName"); if(name==null || name.isEmpty()) name=(String)call(c,"getNameOnCard");
            result.put((String)call(c,"getId"),(name==null?"Payment card":name)+" · "+call(call(c,"getCardItem"),"getLastFour"));
        }
        return result;
    }
    static void bindCardImage(android.widget.ImageView view,String cardId) throws Exception {
        Class<?> source=Class.forName("com.curve.transactions.BindingTools$ImageUrlWithDefault");
        int fallback=artworks.getOrDefault(cardId,0);
        if(fallback<=0) fallback=view.getResources().getIdentifier("ic_card","drawable",view.getContext().getPackageName());
        if(fallback<=0) throw new IllegalStateException("Missing Curve card placeholder");
        Object image=source.getConstructor(String.class,int.class).newInstance(cardImageUrls.get(cardId),fallback);
        Class.forName("com.curve.transactions.CurveDesignDataBinding").getMethod("setAsyncImageUriWithDefault",android.widget.ImageView.class,source).invoke(null,view,image);
    }
    static void move(String account,String card,String id,java.util.function.BooleanSupplier canSubmit) throws Exception {
        final Object useCase;
        try { account(account); useCase=resolve("com.curve.gbit.usecase.GbitSwitchTransactionUseCase"); }
        catch(Exception notSubmitted) { throw new BatchRunner.Rejected("The request was not submitted. Sign in and review your selection."); }
        if(!canSubmit.getAsBoolean()) throw new BatchRunner.Rejected("The batch stopped before this purchase was submitted. Review your selection.");
        Object result=suspend(useCase,"invoke",card,id);
        if(result.getClass().getName().endsWith("$GbitUnavailableError")) throw new BatchRunner.Rejected("Curve rejected this purchase as unavailable. Review your selection.");
        if(!result.getClass().getName().endsWith("$Success")) throw new Exception("Curve did not confirm the move. Review its outcome before continuing.");
    }
}
