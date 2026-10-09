package e.e.a;

import android.app.Activity;
import android.content.*;
import android.graphics.*;
import android.graphics.drawable.*;
import android.net.Uri;
import android.os.*;
import android.view.*;
import android.widget.*;
import java.io.*;
import java.net.*;
import java.util.*;
import java.util.concurrent.*;
import org.json.*;
import e.e.a.FollowFeedData.Item;
import e.e.a.FollowFeedData.Actor;

/** A themed activity timeline with pinned author and content filters. */
public final class FollowFeed {
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final ExecutorService WORKER=Executors.newSingleThreadExecutor();
    private static final WeakHashMap<Activity,State> STATES=new WeakHashMap<>();
    private static final class State {
        final ArrayList<Item> items=new ArrayList<>();
        final HashSet<String> ids=new HashSet<>(),cursors=new HashSet<>();
        final LinkedHashMap<String,Actor> actors=new LinkedHashMap<>();
        final ArrayList<Object> visible=new ArrayList<>();
        final ArrayList<Button> chips=new ArrayList<>();
        ListView list; TextView status; ProgressBar progress; Button more;
        LinearLayout authors; Rows rows; NetworkTask task;
        String cursor,actorKey,authorStamp; int filter=0; boolean end,busy,failed,stopped;
        long now;
    }
    private FollowFeed(){}
    private static int dp(Context c,int v){return Math.round(v*c.getResources().getDisplayMetrics().density);}
    private static String text(Context c,String ja,String en,String zh){
        String lang=android.preference.PreferenceManager.getDefaultSharedPreferences(c).getString("app_lang","0");
        if("-1".equals(lang))lang=Locale.getDefault().getLanguage();
        return "1".equals(lang)||"en".equals(lang)?en:"2".equals(lang)||"zh".equals(lang)?zh:ja;
    }
    private static int color(Context c,int attr,int fallback){
        android.util.TypedValue v=new android.util.TypedValue();
        if(!c.getTheme().resolveAttribute(attr,v,true))return fallback;
        return v.resourceId==0?v.data:c.getResources().getColor(v.resourceId);
    }
    private static int surface(Context c){
        return color(c,c.getResources().getIdentifier("nicoidSurface","attr",c.getPackageName()),ThemeChoice.isNight(c)?0xff303238:0xfff1f3f4);
    }
    private static TextView label(Activity a,int size,boolean bold){
        TextView v=new TextView(a);v.setTextSize(size);v.setTextColor(ThemeChoice.textColor(v));
        if(bold)v.setTypeface(Typeface.create("sans-serif-medium",Typeface.NORMAL));
        return v;
    }
    private static GradientDrawable shape(Context c,int fill,int radius,boolean border){
        GradientDrawable bg=new GradientDrawable();bg.setColor(fill);bg.setCornerRadius(dp(c,radius));
        if(border)bg.setStroke(dp(c,1),(ThemeChoice.textColor(new TextView(c))&0x00ffffff)|0x22000000);
        return bg;
    }
    private static Button chip(Activity a,String title){
        Button b=new Button(a);b.setText(title);b.setTextSize(14);b.setAllCaps(false);
        b.setMinHeight(0);b.setMinimumHeight(0);b.setMinWidth(0);b.setMinimumWidth(0);
        b.setPadding(dp(a,16),dp(a,6),dp(a,16),dp(a,6));b.setBackground(shape(a,surface(a),24,false));
        b.setTextColor(ThemeChoice.textColor(b));return b;
    }
    private static String filterName(Context c,int i){
        String[][] names={{"コンテンツ投稿","Content uploads","內容投稿"},{"動画投稿","Video uploads","影片投稿"},{"ショート投稿","Short uploads","短影片投稿"},{"すべて","All","全部"}};
        return text(c,names[i][0],names[i][1],names[i][2]);
    }
    public static void load(Activity a){
        try{
            a.getClass().getField("H").setBoolean(a,false);
            a.getClass().getField("I").setBoolean(a,true);
            State s=STATES.get(a);
            if(s==null){
                s=new State();s.list=(ListView)PlaybackSession.get(a,"A");if(s.list==null)return;
                Object bar=PlaybackSession.get(a,"O");
                if(bar!=null)PlaybackSession.call(bar,"b",new Class<?>[]{CharSequence.class},(Object)null);
                a.setTitle(text(a,"ニコレポ","Nico Reports","Nico 動態"));
                if(bar!=null)PlaybackSession.call(bar,"c",new Class<?>[]{CharSequence.class},text(a,"ニコレポ","Nico Reports","Nico 動態"));
                View footer=(View)PlaybackSession.get(a,"Q");if(footer!=null)s.list.removeFooterView(footer);
                if(s.list.getParent() instanceof ViewGroup)((ViewGroup)s.list.getParent()).removeView(s.list);
                LinearLayout root=new LinearLayout(a);root.setOrientation(LinearLayout.VERTICAL);ThemeChoice.background(root);
                State state=s;
                TextView heading=label(a,20,true);heading.setText(text(a,"ニコレポ","Nico Reports","Nico 動態"));heading.setPadding(dp(a,16),dp(a,12),dp(a,16),dp(a,4));root.addView(heading);
                LinearLayout authorRow=new LinearLayout(a);authorRow.setGravity(Gravity.CENTER_VERTICAL);authorRow.setPadding(dp(a,8),dp(a,8),dp(a,8),dp(a,4));
                HorizontalScrollView scroll=new HorizontalScrollView(a);scroll.setHorizontalScrollBarEnabled(false);
                s.authors=new LinearLayout(a);s.authors.setGravity(Gravity.CENTER_VERTICAL);scroll.addView(s.authors);
                authorRow.addView(scroll,new LinearLayout.LayoutParams(0,-2,1));
                Button follow=chip(a,text(a,"フォロー一覧","Following","追蹤列表"));
                follow.setOnClickListener(v->a.startActivity(new Intent(Intent.ACTION_VIEW).setClassName(a,"com.sauzask.nicoid.NicoidFavUserActivity")));
                authorRow.addView(follow,new LinearLayout.LayoutParams(-2,dp(a,48)));root.addView(authorRow);

                LinearLayout chips=new LinearLayout(a);chips.setPadding(dp(a,12),dp(a,8),dp(a,12),dp(a,8));
                for(int i=0;i<4;i++){
                    final int index=i;Button b=chip(a,filterName(a,i));s.chips.add(b);
                    b.setTextSize(11);b.setPadding(dp(a,3),0,dp(a,3),0);b.setMaxLines(2);
                    LinearLayout.LayoutParams p=new LinearLayout.LayoutParams(0,dp(a,48),1);p.setMargins(0,0,i==3?0:dp(a,4),0);chips.addView(b,p);
                    b.setOnClickListener(v->{if(state.filter!=index){state.filter=index;request(a,state,true);state.list.setSelection(0);}});
                }
                root.addView(chips,new LinearLayout.LayoutParams(-1,-2));
                LinearLayout loading=new LinearLayout(a);loading.setGravity(Gravity.CENTER_VERTICAL);loading.setPadding(dp(a,16),0,dp(a,16),0);
                s.status=label(a,12,false);s.status.setAlpha(.7f);loading.addView(s.status,new LinearLayout.LayoutParams(0,-2,1));
                s.progress=new ProgressBar(a);s.progress.getIndeterminateDrawable().mutate().setColorFilter(ThemeChoice.accent(a),PorterDuff.Mode.SRC_IN);
                loading.addView(s.progress,new LinearLayout.LayoutParams(dp(a,20),dp(a,20)));root.addView(loading,new LinearLayout.LayoutParams(-1,dp(a,28)));
                LinearLayout tail=new LinearLayout(a);tail.setGravity(Gravity.CENTER);tail.setPadding(dp(a,12),dp(a,12),dp(a,12),dp(a,24));
                s.more=chip(a,text(a,"過去の新着を読み込む","Load older activity","載入較早的動態"));
                s.more.setOnClickListener(v->request(a,state,state.failed&&state.items.isEmpty()));tail.addView(s.more);
                s.list.addFooterView(tail,null,false);s.rows=new Rows(a,s);s.list.setAdapter(s.rows);
                s.list.setDivider(null);s.list.setCacheColorHint(Color.TRANSPARENT);ThemeChoice.background(s.list);
                // Card controls own their clicks; category and empty rows are not selectable.
                s.list.setOnItemClickListener((parent,view,position,id)->{
                    if(position<state.visible.size()&&state.visible.get(position) instanceof Item)open(a,(Item)state.visible.get(position),false);
                });
                s.list.setOnScrollListener(new AbsListView.OnScrollListener(){
                    public void onScrollStateChanged(AbsListView l,int mode){}
                    public void onScroll(AbsListView l,int first,int count,int total){
                        if(!state.failed&&!state.visible.isEmpty()&&count>0&&first+count>=total-1)request(a,state,false);
                    }
                });
                root.addView(s.list,new LinearLayout.LayoutParams(-1,0,1));
                a.getClass().getField("y").set(a,root);STATES.put(a,s);
                renderAuthors(a,s);rebuild(a,s);
                a.getApplication().registerActivityLifecycleCallbacks(new android.app.Application.ActivityLifecycleCallbacks(){
                    public void onActivityCreated(Activity x,Bundle b){}
                    public void onActivityStarted(Activity x){}
                    public void onActivityResumed(Activity x){if(x==a){state.stopped=false;ShortImages.resume(a);updateFooter(a,state);if(!state.busy){rebuild(a,state);if(state.items.isEmpty()&&!state.failed)request(a,state,true);}}}
                    public void onActivityPaused(Activity x){}
                    public void onActivityStopped(Activity x){if(x==a){state.stopped=true;if(state.task!=null)state.task.cancel();state.busy=false;updateFooter(a,state);ShortImages.cancel(a);}}
                    public void onActivitySaveInstanceState(Activity x,Bundle b){}
                    public void onActivityDestroyed(Activity x){if(x==a){if(state.task!=null)state.task.cancel();STATES.remove(a);a.getApplication().unregisterActivityLifecycleCallbacks(this);}}
                });
            }
            request(a,s,true);
        }catch(Exception error){android.util.Log.w("nicoid-feed","Feed view failed",error);}
    }
    public static boolean menu(Activity a,Menu menu){
        menu.clear();menu.add(text(a,"更新","Refresh","重新整理")).setOnMenuItemClickListener(item->{load(a);return true;});return true;
    }
    private static String cookie(Activity a)throws Exception{
        Class<?> v=Class.forName("e.e.a.v0");Object store=PlaybackSession.get(a,"E");if(store==null)store=v.getField("b").get(null);
        return store==null?"":(String)v.getMethod("a",Class.forName("org.apache.http.client.CookieStore")).invoke(null,store);
    }
    private static JSONObject fetch(String path,String auth,NetworkTask task)throws Exception{
        HttpURLConnection c=(HttpURLConnection)new URL("https://api.feed.nicovideo.jp/v1/"+path).openConnection();
        if(!task.bind(c))throw new InterruptedIOException();
        try{
            c.setConnectTimeout(10000);c.setReadTimeout(10000);c.setInstanceFollowRedirects(false);
            c.setRequestProperty("X-Frontend-Id","6");c.setRequestProperty("X-Frontend-Version","0");c.setRequestProperty("Cookie",auth);
            int code=c.getResponseCode();if(code==401||code==403)throw new LoginRequired();if(code!=200)throw new IOException("Feed HTTP "+code);
            StringBuilder body=new StringBuilder();
            try(Reader reader=new InputStreamReader(c.getInputStream(),"UTF-8")){
                char[] buf=new char[4096];int n;
                while((n=reader.read(buf))!=-1){if(task.cancelled())throw new InterruptedIOException();body.append(buf,0,n);if(body.length()>4*1024*1024)throw new IOException("Feed response too large");}
            }
            JSONObject response=new JSONObject(body.toString());
            if(!"ok".equals(response.optString("code")))throw new IOException("Feed did not return ok");return response;
        }finally{task.release(c);c.disconnect();}
    }
    private static final class LoginRequired extends IOException{}
    private static void request(Activity a,State s,boolean refresh){
        if(a.isFinishing()||a.isDestroyed()||s.stopped||(!refresh&&(s.busy||s.end)))return;
        if(s.task!=null)s.task.cancel();s.failed=false;
        if(refresh){s.cursor=null;s.end=false;s.items.clear();s.ids.clear();s.cursors.clear();s.now=System.currentTimeMillis();rebuild(a,s);}
        String credentials;try{credentials=cookie(a);}catch(Exception error){credentials="";}
        if(credentials.isEmpty()){s.busy=false;s.failed=true;s.status.setText(text(a,"ログインが必要です","Sign in to view following activity","請登入以查看追蹤動態"));rebuild(a,s);updateFooter(a,s);return;}
        final String auth=credentials,cursor=s.cursor;final int filter=s.filter;NetworkTask task=new NetworkTask();s.task=task;s.busy=true;rebuild(a,s);updateFooter(a,s);
        s.status.setText(text(a,"読み込み中…","Loading…","載入中…"));
        task.start(WORKER,()->{
            try{
                String[] types={"publish","video","short_video","all"};
                String path="activities/followings/"+types[filter]+"?context=my_timeline&limit=50";
                if(cursor!=null)path+="&cursor="+URLEncoder.encode(cursor,"UTF-8");
                JSONObject response=fetch(path,auth,task);ArrayList<Item> items=FollowFeedData.parse(response);
                String next=FollowFeedData.string(response,"nextCursor");
                JSONArray raw=response.optJSONArray("activities");boolean empty=raw==null||raw.length()==0;
                ArrayList<Actor> actors=null;
                if(refresh&&!task.cancelled())try{actors=FollowFeedData.actors(fetch("actors?limit=50",auth,task));}catch(Exception ignored){}
                final ArrayList<Actor> authors=actors;
                MAIN.post(()->{
                    if(task.cancelled()||s.task!=task||a.isDestroyed()||s.stopped)return;
                    for(Item item:items)if(s.ids.add(item.key))s.items.add(item);
                    Collections.sort(s.items,(left,right)->Long.compare(right.time,left.time));
                    if(authors!=null){s.actors.clear();for(Actor actor:authors)s.actors.put(actor.key(),actor);}
                    for(Item item:s.items)if(!item.author.name.isEmpty()&&!s.actors.containsKey(item.author.key()))s.actors.put(item.author.key(),item.author);
                    s.cursor=next.isEmpty()?null:next;s.end=empty||s.cursor==null||!s.cursors.add(next);s.busy=false;
                    renderAuthors(a,s);rebuild(a,s);updateFooter(a,s);
                    s.status.setText(s.actorKey==null?"":text(a,"投稿者で絞り込み中","Filtered by creator","依投稿者篩選"));
                });
            }catch(Exception error){
                if(task.cancelled())return;
                MAIN.post(()->{if(task.cancelled()||s.task!=task||a.isDestroyed()||s.stopped)return;s.busy=false;s.failed=true;
                    s.status.setText(error instanceof LoginRequired?text(a,"ログインし直してください","Please sign in again","請重新登入"):
                        text(a,"取得できませんでした。更新して再試行してください","Could not load. Refresh to retry","無法取得，請重新整理以重試"));
                    rebuild(a,s);updateFooter(a,s);});
                android.util.Log.w("nicoid-feed","Feed request failed",error);
            }
        });
    }
    private static void updateFooter(Activity a,State s){
        s.progress.setVisibility(s.busy?View.VISIBLE:View.GONE);
        s.more.setVisibility(s.end&&!s.failed?View.GONE:View.VISIBLE);s.more.setEnabled(!s.busy&&!s.stopped);
        s.more.setText(s.failed?text(a,"再試行","Retry","重試"):text(a,"過去の新着を読み込む","Load older activity","載入較早的動態"));
    }
    private static String period(Context c,int bucket){
        String[][] labels={{"今日","Today","今天"},{"昨日","Yesterday","昨天"},{"1週間","Past week","一週內"},{"1か月","Past month","一個月內"},{"1か月以上前","Older than a month","一個月以前"},{"日付不明","Date unavailable","日期不明"}};
        return text(c,labels[bucket][0],labels[bucket][1],labels[bucket][2]);
    }
    private static void rebuild(Activity a,State s){
        s.visible.clear();int last=-1;
        for(Item item:s.items)if(item.matches(3,s.actorKey)){
            int bucket=FollowFeedData.bucket(item.time,s.now);if(bucket!=last){s.visible.add(Integer.valueOf(bucket));last=bucket;}s.visible.add(item);
        }
        for(int i=0;i<s.chips.size();i++){
            Button b=s.chips.get(i);boolean selected=i==s.filter;b.setSelected(selected);
            b.setBackground(shape(a,selected?ThemeChoice.accent(a):surface(a),24,false));
            int ink=ThemeChoice.accent(a);double light=(Color.red(ink)*299+Color.green(ink)*587+Color.blue(ink)*114)/1000.;
            b.setTextColor(selected?(light>155?0xff101114:Color.WHITE):ThemeChoice.textColor(b));
        }
        if(!s.busy&&!s.failed)s.status.setText(s.actorKey==null?"":text(a,"投稿者で絞り込み中","Filtered by creator","依投稿者篩選"));
        s.rows.notifyDataSetChanged();
    }
    private static void renderAuthors(Activity a,State s){
        StringBuilder stamp=new StringBuilder(String.valueOf(s.actorKey));int count=0;
        for(Actor actor:s.actors.values()){if(count++>=50)break;stamp.append('|').append(actor.key()).append('|').append(actor.name).append('|').append(actor.icon);}
        String value=stamp.toString();if(value.equals(s.authorStamp))return;s.authorStamp=value;
        s.authors.removeAllViews();
        Button all=chip(a,text(a,"すべて","All","全部"));all.setSelected(s.actorKey==null);
        all.setOnClickListener(v->{s.actorKey=null;renderAuthors(a,s);rebuild(a,s);s.list.setSelection(0);});
        s.authors.addView(all,new LinearLayout.LayoutParams(-2,dp(a,40)));
        int shown=0;
        for(Actor actor:s.actors.values()){
            if(shown++>=50)break;
            LinearLayout entry=new LinearLayout(a);entry.setOrientation(LinearLayout.VERTICAL);entry.setGravity(Gravity.CENTER);
            entry.setPadding(dp(a,4),dp(a,4),dp(a,4),dp(a,4));
            if(actor.key().equals(s.actorKey))entry.setBackground(shape(a,surface(a),12,true));
            FrameLayout picture=imageBox(a,true);entry.addView(picture,new LinearLayout.LayoutParams(dp(a,48),dp(a,48)));
            TextView name=label(a,11,false);name.setText(actor.name);name.setSingleLine(true);name.setEllipsize(android.text.TextUtils.TruncateAt.END);name.setGravity(Gravity.CENTER);
            entry.addView(name,new LinearLayout.LayoutParams(-1,-2));bindImage(picture,actor.icon);
            entry.setContentDescription(actor.name);entry.setOnClickListener(v->{s.actorKey=actor.key();renderAuthors(a,s);rebuild(a,s);s.list.setSelection(0);});
            s.authors.addView(entry,new LinearLayout.LayoutParams(dp(a,72),-2));
        }
    }
    private static FrameLayout imageBox(Activity a,boolean round){
        FrameLayout box=round?new FrameLayout(a):new Thumbnail(a);box.setBackground(shape(a,surface(a),round?100:0,false));
        ImageView image=new ImageView(a);image.setScaleType(ImageView.ScaleType.CENTER_CROP);box.addView(image,new FrameLayout.LayoutParams(-1,-1));
        TextView fallback=label(a,round?18:28,false);fallback.setText(round?"●":"▶");fallback.setTextColor(ThemeChoice.accent(a));fallback.setGravity(Gravity.CENTER);box.addView(fallback,new FrameLayout.LayoutParams(-1,-1));
        box.setTag(new View[]{image,fallback});
        if(round)box.setClipToOutline(true);return box;
    }
    private static final class Thumbnail extends FrameLayout {
        Thumbnail(Context c){super(c);}
        protected void onMeasure(int widthSpec,int heightSpec){
            int width=MeasureSpec.getSize(widthSpec);
            super.onMeasure(widthSpec,MeasureSpec.makeMeasureSpec(Math.max(1,width*9/16),MeasureSpec.EXACTLY));
        }
    }
    private static void bindImage(FrameLayout box,String url){
        View[] views=(View[])box.getTag();ImageView image=(ImageView)views[0];TextView fallback=(TextView)views[1];
        if(url.equals(image.getTag())&&image.getDrawable()!=null)return;
        image.setImageDrawable(null);image.setTag(url);fallback.setVisibility(View.VISIBLE);ShortImages.load(url,image,fallback);
    }
    private static String badge(Activity a,Item item){
        if(!item.label.isEmpty())return android.text.Html.fromHtml(item.label).toString();
        return item.shortVideo?text(a,"ショート投稿","Short upload","短影片投稿"):
            item.upload?text(a,"動画投稿","Video upload","影片投稿"):text(a,"動画","Video","影片");
    }
    private static String event(Activity a,Item item){
        if(!item.message.isEmpty())return android.text.Html.fromHtml(item.message).toString();
        if(!item.subMessage.isEmpty())return android.text.Html.fromHtml(item.subMessage).toString();
        return item.upload?(item.shortVideo?text(a,"ショート動画を投稿しました","Uploaded a short video","投稿了短影片"):
            text(a,"動画を投稿しました","Uploaded a video","投稿了影片")):text(a,"動画のアクティビティ","Video activity","影片動態");
    }
    private static void open(Activity a,Item item,boolean info){
        a.startActivity(new Intent(Intent.ACTION_VIEW,Uri.parse("https://www.nicovideo.jp/watch/"+item.id))
            .setClassName(a,info?"com.sauzask.nicoid.NicoidVideoInfoActivity":"com.sauzask.nicoid.NicoidVideoActivity"));
    }
    private static final class Holder{
        TextView period,name,date,event,title,badge,duration;FrameLayout avatar,thumbnail;LinearLayout card;Button menu;
    }
    private static final class Rows extends BaseAdapter{
        final Activity a;final State s;Rows(Activity a,State s){this.a=a;this.s=s;}
        public int getCount(){return Math.max(1,s.visible.size());}
        public Object getItem(int i){return s.visible.isEmpty()?null:s.visible.get(i);}
        public long getItemId(int i){return i;}
        public int getViewTypeCount(){return 3;}
        public int getItemViewType(int i){return s.visible.isEmpty()?2:s.visible.get(i) instanceof Integer?0:1;}
        public boolean areAllItemsEnabled(){return false;}public boolean isEnabled(int i){return getItemViewType(i)==1;}
        public View getView(int index,View recycled,ViewGroup parent){
            Object value=getItem(index);
            if(value==null){
                TextView empty=recycled instanceof TextView?(TextView)recycled:label(a,15,false);empty.setGravity(Gravity.CENTER);
                empty.setPadding(dp(a,24),dp(a,48),dp(a,24),dp(a,48));
                empty.setText(s.busy?"":s.failed?text(a,"新着を取得できませんでした","Could not load activity","無法載入動態"):
                    text(a,"この条件に一致する新着はありません","No activity matches these filters","沒有符合此條件的動態"));
                return empty;
            }
            if(value instanceof Integer){
                TextView heading=recycled instanceof TextView?(TextView)recycled:label(a,16,true);
                heading.setPadding(dp(a,16),dp(a,24),dp(a,16),dp(a,12));heading.setText(period(a,(Integer)value));return heading;
            }
            Item item=(Item)value;LinearLayout row;Holder h;
            if(recycled==null){
                row=new LinearLayout(a);row.setOrientation(LinearLayout.VERTICAL);row.setPadding(dp(a,16),dp(a,12),dp(a,16),dp(a,12));h=new Holder();
                LinearLayout actor=new LinearLayout(a);actor.setGravity(Gravity.CENTER_VERTICAL);
                h.avatar=imageBox(a,true);actor.addView(h.avatar,new LinearLayout.LayoutParams(dp(a,40),dp(a,40)));
                LinearLayout words=new LinearLayout(a);words.setOrientation(LinearLayout.VERTICAL);words.setPadding(dp(a,12),0,0,0);
                LinearLayout top=new LinearLayout(a);top.setGravity(Gravity.CENTER_VERTICAL);
                h.name=label(a,14,true);h.name.setSingleLine(true);h.name.setEllipsize(android.text.TextUtils.TruncateAt.END);
                top.addView(h.name,new LinearLayout.LayoutParams(0,-2,1));h.date=label(a,12,false);h.date.setAlpha(.65f);top.addView(h.date);
                words.addView(top);h.event=label(a,12,false);h.event.setAlpha(.7f);words.addView(h.event);actor.addView(words,new LinearLayout.LayoutParams(0,-2,1));row.addView(actor);
                h.card=new LinearLayout(a);h.card.setOrientation(LinearLayout.VERTICAL);h.card.setBackground(shape(a,surface(a),12,true));h.card.setClipToOutline(true);
                LinearLayout.LayoutParams cardParams=new LinearLayout.LayoutParams(-1,-2);cardParams.setMargins(dp(a,52),dp(a,8),0,0);row.addView(h.card,cardParams);
                h.thumbnail=imageBox(a,false);h.card.addView(h.thumbnail,new LinearLayout.LayoutParams(-1,-2));
                h.badge=label(a,11,true);h.badge.setTextColor(Color.WHITE);h.badge.setPadding(dp(a,5),dp(a,2),dp(a,5),dp(a,2));h.badge.setBackground(shape(a,0xbb111111,3,false));
                FrameLayout.LayoutParams badge=new FrameLayout.LayoutParams(-2,-2,Gravity.TOP|Gravity.START);badge.setMargins(dp(a,8),dp(a,8),0,0);h.thumbnail.addView(h.badge,badge);
                h.duration=label(a,11,true);h.duration.setTextColor(Color.WHITE);h.duration.setPadding(dp(a,5),dp(a,2),dp(a,5),dp(a,2));h.duration.setBackground(shape(a,0xbb111111,3,false));
                FrameLayout.LayoutParams duration=new FrameLayout.LayoutParams(-2,-2,Gravity.BOTTOM|Gravity.END);duration.setMargins(0,0,dp(a,8),dp(a,8));h.thumbnail.addView(h.duration,duration);
                LinearLayout bottom=new LinearLayout(a);bottom.setGravity(Gravity.CENTER_VERTICAL);bottom.setPadding(dp(a,10),dp(a,8),0,dp(a,8));
                h.title=label(a,14,false);h.title.setMaxLines(3);h.title.setEllipsize(android.text.TextUtils.TruncateAt.END);bottom.addView(h.title,new LinearLayout.LayoutParams(0,-2,1));
                h.menu=chip(a,"⋮");h.menu.setTextSize(24);h.menu.setPadding(0,0,0,0);h.menu.setContentDescription(text(a,"動画メニュー","Video menu","影片選單"));bottom.addView(h.menu,new LinearLayout.LayoutParams(dp(a,48),dp(a,48)));h.card.addView(bottom);
                row.setTag(h);
            }else{row=(LinearLayout)recycled;h=(Holder)row.getTag();}
            h.name.setText(item.actor.isEmpty()?text(a,"投稿者","Creator","投稿者"):item.actor);h.date.setText(FollowFeedData.date(item));h.event.setText(event(a,item));
            h.title.setText(item.title);h.badge.setText(badge(a,item));h.duration.setText(FollowFeedData.duration(item.duration));h.duration.setVisibility(item.duration>0?View.VISIBLE:View.GONE);
            bindImage(h.avatar,item.author.icon);bindImage(h.thumbnail,item.thumbnail);
            h.card.setContentDescription(item.title);h.card.setOnClickListener(v->open(a,item,false));h.thumbnail.setOnClickListener(v->open(a,item,false));h.title.setOnClickListener(v->open(a,item,false));
            h.menu.setOnClickListener(v->{
                PopupMenu menu=new PopupMenu(a,v);
                menu.getMenu().add(text(a,"再生","Play","播放")).setOnMenuItemClickListener(m->{open(a,item,false);return true;});
                menu.getMenu().add(text(a,"動画情報","Video details","影片資訊")).setOnMenuItemClickListener(m->{open(a,item,true);return true;});
                menu.getMenu().add(text(a,"共有","Share","分享")).setOnMenuItemClickListener(m->{
                    a.startActivity(Intent.createChooser(new Intent(Intent.ACTION_SEND).setType("text/plain").putExtra(Intent.EXTRA_TEXT,"https://www.nicovideo.jp/watch/"+item.id),text(a,"共有","Share","分享")));return true;
                });menu.show();
            });
            return row;
        }
    }
}
