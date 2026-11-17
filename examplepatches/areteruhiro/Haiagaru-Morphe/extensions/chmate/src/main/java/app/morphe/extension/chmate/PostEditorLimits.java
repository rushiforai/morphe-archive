package app.morphe.extension.chmate;

import android.app.Activity;import android.content.*;import android.graphics.Color;import android.os.*;import android.text.*;import android.text.style.ForegroundColorSpan;import android.view.*;import android.widget.*;
import java.lang.ref.WeakReference;import java.lang.reflect.*;import java.util.*;import java.util.concurrent.*;

/** Display-only limits. Never truncates text, changes input filters or submits a draft. */
public final class PostEditorLimits {
    static final String KEY="postEditorLimitDisplay";
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final WeakHashMap<View,WeakReference<Binding>> BINDINGS=new WeakHashMap<>();
    private static final ExecutorService IO=Executors.newFixedThreadPool(2);
    private static final Map<String,Cached> CACHE=Collections.synchronizedMap(new LinkedHashMap<String,Cached>(64,.75f,true){protected boolean removeEldestEntry(Map.Entry<String,Cached> e){return size()>64;}});
    private static final class Cached {final PostLimitSource.Values values;final long until;Cached(PostLimitSource.Values v){values=v;until=SystemClock.elapsedRealtime()+(v.known()?10*60*1000:60*1000);}}
    private static final class Excess extends ForegroundColorSpan implements NoCopySpan {Excess(int color){super(color);}}
    private static Object field(Object value,String name)throws Exception{return NativeFields.find(value.getClass(),name).get(value);}
    private static PostLimitRules.Measure nativeMeasure(Context context,String version)throws Exception{
        boolean old=version.contains("191"),middle=version.contains("226");
        Class<?> type=context.getClassLoader().loadClass(old?"o.getAdapterVersion":middle?"o.ConscryptPlatformDisabledHostnameVerifier":"o.onUserEarnedReward");
        Method factory=type.getDeclaredMethod(old?"e":middle?"c":"d",int.class,boolean.class);factory.setAccessible(true);Object counter=factory.invoke(null,1000000,false);
        Method count=null;for(Method candidate:counter.getClass().getMethods())if(candidate.getReturnType()==int.class&&Arrays.equals(candidate.getParameterTypes(),new Class<?>[]{CharSequence.class})){count=candidate;break;}
        if(count==null)throw new NoSuchMethodException("native post-length counter");count.setAccessible(true);Method read=count;
        return text->((Number)read.invoke(counter,text)).intValue();
    }
    static void bind(View root,EditText body,EditText title,Object model,String version,String board,boolean thread){
        if(root==null||body==null||board==null)return;
        WeakReference<Binding> previous=BINDINGS.get(root);if(previous!=null&&previous.get()!=null)return;
        try{Binding binding=new Binding(root,body,thread?title:null,model,version,board,thread);BINDINGS.put(root,new WeakReference<>(binding));binding.mount();}
        catch(Exception unavailable){android.util.Log.w("Haiagaru","Posting-limit display unavailable",unavailable);}
    }
    static void refresh(Activity activity){
        for(WeakReference<Binding> ref:new ArrayList<>(BINDINGS.values())){Binding binding=ref.get();if(binding!=null&&binding.body.getContext()==activity)binding.schedule();}
    }
    private static final class Binding implements TextWatcher,View.OnAttachStateChangeListener,SharedPreferences.OnSharedPreferenceChangeListener {
        final View root;final EditText body,title;final WeakReference<Object> model;final String version,board,key;final boolean thread;final SharedPreferences prefs;final TextView row;
        final PostLimitRules.Measure titleMeasure,bodyMeasure;final Runnable update=this::render;final Runnable retry=this::retryNative;
        PostLimitSource.Values remote;boolean active,writing,loading;int attempts,request;
        Binding(View root,EditText body,EditText title,Object model,String version,String board,boolean thread)throws Exception{
            this.root=root;this.body=body;this.title=title;this.model=new WeakReference<>(model);this.version=version;this.board=board;this.thread=thread;key=board+"\n"+thread;
            prefs=FeatureSwitches.prefs(root.getContext());PostLimitRules.Measure b=null,t=null;
            try{b=nativeMeasure(root.getContext(),version);t=nativeMeasure(root.getContext(),version);}catch(Exception unsupported){android.util.Log.w("Haiagaru","Native posting-length counter unavailable",unsupported);}
            bodyMeasure=b;titleMeasure=t;row=new TextView(root.getContext());row.setTextSize(12);row.setTextColor(body.getCurrentTextColor());row.setTag("haiagaru.post-limits");
            int pad=Math.round(4*root.getResources().getDisplayMetrics().density);row.setPadding(pad,pad,pad,pad);
            row.setOnLongClickListener(v->{if(prefs.getBoolean(KEY,true)){request(true);Toast.makeText(root.getContext(),"板の投稿上限を再取得しています",Toast.LENGTH_SHORT).show();}return true;});
        }
        void mount(){
            View anchor=body;
            while(anchor.getParent() instanceof ViewGroup){ViewGroup parent=(ViewGroup)anchor.getParent();
                if(parent instanceof LinearLayout&&((LinearLayout)parent).getOrientation()==LinearLayout.VERTICAL){parent.addView(row,parent.indexOfChild(anchor)+1,new LinearLayout.LayoutParams(-1,-2));break;}anchor=parent;}
            root.addOnAttachStateChangeListener(this);if(root.isAttachedToWindow())start();
        }
        void start(){if(active)return;active=true;body.addTextChangedListener(this);if(title!=null)title.addTextChangedListener(this);prefs.registerOnSharedPreferenceChangeListener(this);render();request(false);root.postDelayed(retry,500);}
        void stop(){active=false;request++;loading=false;body.removeTextChangedListener(this);if(title!=null)title.removeTextChangedListener(this);prefs.unregisterOnSharedPreferenceChangeListener(this);root.removeCallbacks(update);root.removeCallbacks(retry);clear(body);if(title!=null)clear(title);}
        void schedule(){root.removeCallbacks(update);root.postDelayed(update,40);}
        public void beforeTextChanged(CharSequence s,int start,int count,int after){}
        public void onTextChanged(CharSequence s,int start,int before,int count){}
        public void afterTextChanged(Editable text){if(!writing)schedule();}
        public void onViewAttachedToWindow(View v){start();}
        public void onViewDetachedFromWindow(View v){stop();}
        public void onSharedPreferenceChanged(SharedPreferences p,String key){if(KEY.equals(key)){MAIN.post(()->{if(active){render();if(prefs.getBoolean(KEY,true))request(false);}});}}
        int red(){int color=body.getCurrentTextColor();return Color.red(color)+Color.green(color)+Color.blue(color)>450?Color.rgb(255,125,125):Color.rgb(183,28,28);}
        void clear(EditText input){Editable text=input.getText();for(Excess span:text.getSpans(0,text.length(),Excess.class))text.removeSpan(span);}
        void highlight(EditText input,PostLimitRules.Result result){clear(input);if(result.excessStart>=0&&result.excessStart<input.length())input.getText().setSpan(new Excess(red()),result.excessStart,input.length(),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);}
        PostLimitSource.Values nativeValues(){
            try{
                Object m=model.get();if(m==null)return new PostLimitSource.Values(0,0,0,false);
                boolean old=version.contains("191"),middle=version.contains("226");Object settings=field(m,old?"y":middle?"M":"K");if(settings==null)return new PostLimitSource.Values(0,0,0,false);
                Method get=settings.getClass().getDeclaredMethod(old?"c":middle?"e":"d",String.class,int.class);get.setAccessible(true);Map<String,String> values=new HashMap<>();
                for(String name:new String[]{"BBS_SUBJECT_COUNT","BBS_MESSAGE_COUNT","BBS_LINE_NUMBER","BBS_MAX_LINES"})values.put(name,String.valueOf(get.invoke(settings,name,0)));
                return new PostLimitSource.Values(PostLimitRules.positive(values.get("BBS_SUBJECT_COUNT")),PostLimitRules.positive(values.get("BBS_MESSAGE_COUNT")),PostLimitRules.lines(values,java.net.URI.create(board).getHost()),false);
            }catch(Exception notReady){return new PostLimitSource.Values(0,0,0,false);}
        }
        void retryNative(){if(!active)return;render();if(++attempts<12)root.postDelayed(retry,500);}
        PostLimitRules.Limit limit(int value,boolean characters,PostLimitRules.Measure measure){return new PostLimitRules.Limit(value,characters?"文字":"バイト",characters?PostLimitRules.UTF16:measure);}
        void append(SpannableStringBuilder out,String text,boolean excessive){if(out.length()>0)out.append('\n');int start=out.length();out.append(text);if(excessive)out.setSpan(new ForegroundColorSpan(red()),start,out.length(),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);}
        void render(){
            if(!active||writing)return;writing=true;
            try{
                boolean enabled=prefs.getBoolean(KEY,true);row.setVisibility(enabled?View.VISIBLE:View.GONE);
                if(!enabled){clear(body);if(title!=null)clear(title);return;}
                PostLimitSource.Values nativeData=nativeValues();int titleMax=remote!=null&&remote.title>0?remote.title:nativeData.title,bodyMax=remote!=null&&remote.body>0?remote.body:nativeData.body;
                int lines=remote!=null&&remote.lines>0?remote.lines:nativeData.lines;
                PostLimitRules.Limit bodyLimit=limit(bodyMax,remote!=null&&remote.characters&&remote.body>0,bodyMeasure);
                PostLimitRules.Result bodyResult=PostLimitRules.inspect(body.getText(),bodyLimit,lines);SpannableStringBuilder text=new SpannableStringBuilder();
                if(title!=null){PostLimitRules.Limit titleLimit=limit(titleMax,remote!=null&&remote.characters&&remote.title>0,titleMeasure);PostLimitRules.Result result=PostLimitRules.inspect(title.getText(),titleLimit,0);highlight(title,result);append(text,PostLimitRules.summary("スレタイ",result,titleLimit),result.excessStart>=0);}
                highlight(body,bodyResult);append(text,PostLimitRules.summary("本文",bodyResult,bodyLimit),bodyLimit.maximum>0&&bodyResult.used>bodyLimit.maximum);
                append(text,PostLimitRules.lineSummary(bodyResult,lines),lines>0&&bodyResult.lines>lines);if(!text.toString().contentEquals(row.getText()))row.setText(text);
            }catch(Exception unavailable){clear(body);if(title!=null)clear(title);row.setText("投稿上限を確認できませんでした");android.util.Log.w("Haiagaru","Posting-limit calculation unavailable",unavailable);}
            finally{writing=false;}
        }
        void request(boolean force){
            if(!active||loading||!prefs.getBoolean(KEY,true))return;
            Cached cached=CACHE.get(key);if(!force&&cached!=null&&cached.until>SystemClock.elapsedRealtime()){remote=cached.values;render();return;}
            loading=true;int token=++request;WeakReference<Binding> ref=new WeakReference<>(this);Context app=root.getContext().getApplicationContext();String address=board;boolean creating=thread;
            IO.execute(()->{PostLimitSource.Values result;try{result=PostLimitSource.fetch(app,address,creating);}catch(Exception unavailable){result=new PostLimitSource.Values(0,0,0,false);}CACHE.put(address+"\n"+creating,new Cached(result));PostLimitSource.Values values=result;
                MAIN.post(()->{Binding current=ref.get();if(current==null||!current.active||current.request!=token)return;current.loading=false;current.remote=values;current.render();});});
        }
    }
    private PostEditorLimits(){}
}
