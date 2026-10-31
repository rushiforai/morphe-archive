package e.e.a;

import android.content.Context;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.view.ViewGroup;
import android.widget.*;
import java.io.*;
import java.lang.ref.WeakReference;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.*;
import java.util.concurrent.*;
import org.json.*;

/** Debounced suggestions with request-owned cancellation and detachable listeners. */
public final class SearchSuggestions {
 static final Handler main=new Handler(Looper.getMainLooper());
 static final ExecutorService worker=workers();
 private static ExecutorService workers(){ThreadPoolExecutor pool=(ThreadPoolExecutor)Executors.newFixedThreadPool(2);pool.setKeepAliveTime(30,TimeUnit.SECONDS);pool.allowCoreThreadTimeOut(true);return pool;}
 static final WeakHashMap<AutoCompleteTextView,WeakReference<Candidates>> attached=new WeakHashMap<>();
 static final WeakHashMap<AutoCompleteTextView,Boolean> forced=new WeakHashMap<>();

 public static void attach(View view){
  if(view instanceof AutoCompleteTextView){
   AutoCompleteTextView input=(AutoCompleteTextView)view;
   WeakReference<Candidates> ref=attached.get(input);Candidates current=ref==null?null:ref.get();
   if(!forced.containsKey(input)&&!Followup173.suggestionsEnabled(input.getContext())){
    if(current!=null)current.dispose();input.setAdapter(null);input.dismissDropDown();
   }else if(current==null){Candidates next=new Candidates(input);attached.put(input,new WeakReference<>(next));}
  }
  if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++)attach(group.getChildAt(i));}
 }
 public static void attachTag(View view){if(view instanceof AutoCompleteTextView){forced.put((AutoCompleteTextView)view,Boolean.TRUE);attach(view);}}
 static int background(Context c){return FeedbackFixes.amoled(c)?-15198184:ThemeChoice.isNight(c)?-14408668:-328966;}
 static List<String> request(String query){return request(query,new NetworkTask());}
 static List<String> request(String query,NetworkTask task){
  try{
   if(task.cancelled())return Collections.emptyList();
   String encoded=URLEncoder.encode(query,"UTF-8").replace("+","%20");
   HttpURLConnection connection=(HttpURLConnection)new URL("https://sug.search.nicovideo.jp/suggestion/complete/"+encoded).openConnection();
   return read(connection,task);
  }catch(IOException|JSONException error){return Collections.emptyList();}
 }
 static List<String> read(HttpURLConnection connection,NetworkTask task)throws IOException,JSONException{return read(connection,task,0);}
 static List<String> read(HttpURLConnection connection,NetworkTask task,int redirects)throws IOException,JSONException{
  if(!task.bind(connection))throw new InterruptedIOException("Suggestion cancelled");
  try{
   connection.setConnectTimeout(6000);connection.setReadTimeout(6000);
   connection.setInstanceFollowRedirects(false);connection.setRequestProperty("Accept","application/json");
   int code=connection.getResponseCode();
   if(code==301||code==302||code==303||code==307||code==308){
    String location=connection.getHeaderField("Location");
    if(location==null||redirects>=5)throw new IOException("Invalid suggestion redirect");
    URL next=new URL(connection.getURL(),location);SecurityPolicy240.requireApi(next.toString());
    if(task.cancelled())throw new InterruptedIOException("Suggestion cancelled");
    task.release(connection);connection.disconnect();connection=null;
    return read((HttpURLConnection)next.openConnection(),task,redirects+1);
   }
   if(code<200||code>=300)throw new IOException("Suggestion HTTP "+code);
   long deadline=SystemClock.elapsedRealtime()+12000L;
   try(InputStream input=connection.getInputStream();ByteArrayOutputStream body=new ByteArrayOutputStream()){
    byte[] bytes=new byte[2048];
    for(int n;(n=input.read(bytes))!=-1;){
     if(task.cancelled())throw new InterruptedIOException("Suggestion cancelled");
     if(body.size()+n>65536||SystemClock.elapsedRealtime()>deadline)throw new IOException("Suggestion response limit");
     body.write(bytes,0,n);
    }
    if(task.cancelled())throw new InterruptedIOException("Suggestion cancelled");
    JSONArray candidates=new JSONObject(body.toString("UTF-8")).getJSONArray("candidates");
    ArrayList<String> result=new ArrayList<>();
    for(int i=0;i<Math.min(8,candidates.length());i++){String value=candidates.optString(i);if(!value.isEmpty())result.add(value);}
    return result;
   }
  }finally{if(connection!=null){task.release(connection);connection.disconnect();}}
 }
 static class CandidateAdapter extends BaseAdapter implements Filterable {
  final Context context;volatile List<String> values=Collections.emptyList();
  CandidateAdapter(Context context){this.context=context;}
  void set(List<String> value){values=new ArrayList<>(value);notifyDataSetChanged();}
  public int getCount(){return values.size();}public String getItem(int position){return values.get(position);}public long getItemId(int position){return position;}
  public View getView(int position,View convert,ViewGroup parent){TextView text=convert instanceof TextView?(TextView)convert:new TextView(context);text.setText(getItem(position));text.setTextSize(16);text.setTextColor(ThemeChoice.textColor(text));text.setBackgroundColor(background(context));text.setPadding(FeedbackFixes.dp(context,16),FeedbackFixes.dp(context,12),FeedbackFixes.dp(context,16),FeedbackFixes.dp(context,12));return text;}
  public Filter getFilter(){return new Filter(){protected FilterResults performFiltering(CharSequence ignored){FilterResults result=new FilterResults();result.count=values.size();return result;}protected void publishResults(CharSequence ignored,FilterResults result){notifyDataSetChanged();}};}
 }
 static class Candidates implements TextWatcher,View.OnAttachStateChangeListener {
  final AutoCompleteTextView input;final CandidateAdapter adapter;
  volatile boolean active=true;volatile int version;Runnable scheduled;NetworkTask task;
  Candidates(AutoCompleteTextView input){
   this.input=input;adapter=new CandidateAdapter(input.getContext());input.setAdapter(adapter);input.setThreshold(1);
   GradientDrawable background=new GradientDrawable();background.setColor(SearchSuggestions.background(input.getContext()));background.setCornerRadius(FeedbackFixes.dp(input.getContext(),8));input.setDropDownBackgroundDrawable(background);
   input.addTextChangedListener(this);input.addOnAttachStateChangeListener(this);
  }
  void cancel(){if(scheduled!=null){main.removeCallbacks(scheduled);scheduled=null;}if(task!=null){task.cancel();task=null;}}
  void dispose(){active=false;version++;cancel();input.removeTextChangedListener(this);input.removeOnAttachStateChangeListener(this);WeakReference<Candidates> ref=attached.get(input);if(ref!=null&&ref.get()==this)attached.remove(input);input.dismissDropDown();}
  public void afterTextChanged(Editable editable){
   final int current=++version;cancel();
   if(!active||input.isPerformingCompletion())return;
   final String query=editable.toString().trim();
   if(query.isEmpty()){input.dismissDropDown();adapter.set(Collections.emptyList());return;}
   scheduled=()->{
    scheduled=null;if(!active||current!=version)return;
    final NetworkTask request=new NetworkTask();task=request;
    request.start(worker,()->{
     List<String> result=request(query,request);
     if(request.cancelled())return;
     main.post(()->{if(task==request)task=null;if(active&&current==version&&input.hasFocus()&&query.equals(input.getText().toString().trim())){adapter.set(result);if(result.isEmpty())input.dismissDropDown();else input.showDropDown();}});
    });
   };
   main.postDelayed(scheduled,350);
  }
  public void beforeTextChanged(CharSequence text,int start,int count,int after){}public void onTextChanged(CharSequence text,int start,int before,int count){}
  public void onViewAttachedToWindow(View view){active=true;}
  public void onViewDetachedFromWindow(View view){active=false;version++;cancel();input.dismissDropDown();}
 }
}
