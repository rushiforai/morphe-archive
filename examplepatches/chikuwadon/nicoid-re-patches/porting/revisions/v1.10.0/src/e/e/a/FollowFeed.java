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
        ListView list; TextView status; ProgressBar progress; Button more;
        FeedRefresh209 refresh; Ui110.Tabs tabs; Ui110.Swipe swipe; LinearLayout authors; Rows rows; NetworkTask task;
        String cursor,actorKey,authorStamp; int filter=0; boolean end,busy,failed,stopped;
        long now;
        State session,current; State[] pages;
        Parcelable scroll; CharSequence message="";
        boolean initialized,autoLoad=true;
        boolean active(){return session==null||session.current==this;}

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
        String[][] names={{"コンテンツ","Content","內容"},{"動画","Videos","影片"},{"ショート","Shorts","短影片"},{"すべて","All","全部"}};
        return text(c,names[i][0],names[i][1],names[i][2]);
    }
    public static void load(Activity a){
        try{
            if(a.getIntent().getBooleanExtra("nicoid_my_page",false)){AccountPage.load(a);return;}
            if(CreatorPage.open(a))return;
            a.getClass().getField("H").setBoolean(a,false);
            a.getClass().getField("I").setBoolean(a,true);
            State s=STATES.get(a);
            if(s==null){
                s=new State();s.list=(ListView)PlaybackSession.get(a,"A");if(s.list==null)return;
                Object bar=PlaybackSession.get(a,"O");
                if(bar!=null)PlaybackSession.call(bar,"b",new Class<?>[]{CharSequence.class},text(a,"ニコレポ","Nico Reports","Nico 動態"));
                a.setTitle(text(a,"ニコレポ","Nico Reports","Nico 動態"));
                if(bar!=null)PlaybackSession.call(bar,"c",new Class<?>[]{CharSequence.class},(Object)null);
                View footer=(View)PlaybackSession.get(a,"Q");if(footer!=null)s.list.removeFooterView(footer);
                if(s.list.getParent() instanceof ViewGroup)((ViewGroup)s.list.getParent()).removeView(s.list);
                LinearLayout root=new LinearLayout(a);root.setOrientation(LinearLayout.VERTICAL);ThemeChoice.background(root);TabViewport110.fill(root);
                State state=s;state.session=state;state.current=state;state.pages=new State[4];state.pages[0]=state;
                LinearLayout authorRow=new LinearLayout(a);authorRow.setGravity(Gravity.CENTER_VERTICAL);authorRow.setPadding(dp(a,8),dp(a,8),dp(a,8),dp(a,4));
                HorizontalScrollView scroll=new HorizontalScrollView(a);scroll.setHorizontalScrollBarEnabled(false);
                s.authors=new LinearLayout(a);s.authors.setGravity(Gravity.CENTER_VERTICAL);scroll.addView(s.authors);
                authorRow.addView(scroll,new LinearLayout.LayoutParams(0,-2,1));
                Button follow=chip(a,text(a,"フォロー一覧 ›","Following ›","追蹤列表 ›"));Ui110.flat(follow);follow.setTextSize(13);
                follow.setOnClickListener(v->a.startActivity(new Intent(Intent.ACTION_VIEW).setClassName(a,"com.sauzask.nicoid.NicoidFavUserActivity")));
                authorRow.addView(follow,new LinearLayout.LayoutParams(-2,dp(a,48)));root.addView(authorRow);

                s.swipe=new Ui110.Swipe(a,4,index->select(a,state,index));
                s.tabs=new Ui110.Tabs(a,new String[]{filterName(a,0),filterName(a,1),filterName(a,2),filterName(a,3)},index->state.swipe.select(index));root.addView(s.tabs);
                LinearLayout loading=new LinearLayout(a);loading.setGravity(Gravity.CENTER_VERTICAL);loading.setPadding(dp(a,16),0,dp(a,16),0);
                s.status=label(a,12,false);s.status.setAlpha(.7f);loading.addView(s.status,new LinearLayout.LayoutParams(0,-2,1));
                s.progress=new ProgressBar(a);s.progress.getIndeterminateDrawable().mutate().setColorFilter(ThemeChoice.accent(a),PorterDuff.Mode.SRC_IN);
                loading.addView(s.progress,new LinearLayout.LayoutParams(dp(a,20),dp(a,20)));root.addView(loading,new LinearLayout.LayoutParams(-1,dp(a,28)));
                LinearLayout tail=new LinearLayout(a);tail.setGravity(Gravity.CENTER);tail.setPadding(dp(a,12),dp(a,12),dp(a,12),dp(a,24));
                s.more=chip(a,text(a,"過去の新着を読み込む","Load older activity","載入較早的動態"));
                s.more.setOnClickListener(v->{State selected=state.current;request(a,selected,selected.failed&&selected.items.isEmpty());});tail.addView(s.more);
                s.list.addFooterView(tail,null,false);s.rows=new Rows(a,s);s.list.setAdapter(s.rows);
                s.list.setDivider(null);s.list.setCacheColorHint(Color.TRANSPARENT);ThemeChoice.background(s.list);
                // Card controls own their clicks; category and empty rows are not selectable.
                s.list.setOnItemClickListener((parent,view,position,id)->{
                    State selected=state.current;if(position<selected.visible.size()&&selected.visible.get(position) instanceof Item)open(a,selected,(Item)selected.visible.get(position),false);
                });
                s.list.setOnScrollListener(new AbsListView.OnScrollListener(){
                    public void onScrollStateChanged(AbsListView l,int mode){if(mode==AbsListView.OnScrollListener.SCROLL_STATE_TOUCH_SCROLL)state.current.autoLoad=true;}
                    public void onScroll(AbsListView l,int first,int count,int total){
                        State selected=state.current;if(selected.autoLoad&&!selected.failed&&!selected.visible.isEmpty()&&count>0&&first+count>=total-1)request(a,selected,false);
                    }
                });
                s.swipe.addView(s.list,new FrameLayout.LayoutParams(-1,-1));s.refresh=new FeedRefresh209(a,s.swipe,()->{State selected=state.current;request(a,selected,true);selected.list.setSelection(0);});root.addView(s.refresh,new LinearLayout.LayoutParams(-1,0,1));
                a.getClass().getField("y").set(a,root);STATES.put(a,s);
                renderAuthors(a,s);rebuild(a,s);
                a.getApplication().registerActivityLifecycleCallbacks(new android.app.Application.ActivityLifecycleCallbacks(){
                    public void onActivityCreated(Activity x,Bundle b){}
                    public void onActivityStarted(Activity x){}
                    public void onActivityResumed(Activity x){if(x==a){for(State page:state.pages)if(page!=null)page.stopped=false;ShortImages.resume(a);State selected=state.current;updateFooter(a,selected);if(!selected.busy){if(!selected.initialized){rebuild(a,selected);request(a,selected,true);}}}}
                    public void onActivityPaused(Activity x){}
                    public void onActivityStopped(Activity x){if(x==a){for(State page:state.pages)if(page!=null){page.stopped=true;if(page.task!=null)page.task.cancel();if(page.busy&&page.items.isEmpty())page.initialized=false;page.busy=false;}updateFooter(a,state.current);ShortImages.cancel(a);}}
                    public void onActivitySaveInstanceState(Activity x,Bundle b){}
                    public void onActivityDestroyed(Activity x){if(x==a){for(State page:state.pages)if(page!=null&&page.task!=null)page.task.cancel();STATES.remove(a);a.getApplication().unregisterActivityLifecycleCallbacks(this);}}
                });
            }
            request(a,s.current,true);
        }catch(Exception error){android.util.Log.w("nicoid-feed","Feed view failed",error);}
    }
    private static void select(Activity a,State session,int index){
        State previous=session.current;
        if(previous.filter==index)return;
        previous.scroll=previous.list.onSaveInstanceState();
        State next=session.pages[index];
        if(next==null){
            next=new State();next.filter=index;next.session=session;next.stopped=previous.stopped;
            next.list=session.list;next.status=session.status;next.progress=session.progress;next.more=session.more;
            next.refresh=session.refresh;next.tabs=session.tabs;next.swipe=session.swipe;next.authors=session.authors;next.rows=new Rows(a,next);
            session.pages[index]=next;
        }
        boolean authorChanged=!java.util.Objects.equals(next.actorKey,session.actorKey);
        next.actorKey=session.actorKey;if(next.actorKey!=null&&session.actors.containsKey(next.actorKey))next.actors.put(next.actorKey,session.actors.get(next.actorKey));if(authorChanged)next.scroll=null;
        session.current=next;next.autoLoad=false;next.authorStamp=null;
        next.list.setAdapter(next.rows);next.tabs.select(index);next.status.setText(next.message);
        renderAuthors(a,next);rebuild(a,next);updateFooter(a,next);
        if(next.scroll!=null)next.list.onRestoreInstanceState(next.scroll);else next.list.setSelection(0);
        if(!next.initialized)request(a,next,true);
    }
    private static void status(State s,CharSequence message){s.message=message;if(s.active())s.status.setText(message);}
    public static boolean menu(Activity a,Menu menu){
        if(Ranking190.managerMenu(a,menu))return true;
        menu.clear();menu.add(text(a,"更新","Refresh","重新整理")).setOnMenuItemClickListener(item->{load(a);return true;});return true;
    }
    private static String cookie(Activity a)throws Exception{
        return SessionCookies194.cookie(a,PlaybackSession.get(a,"E"));
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
        if(a.isFinishing()||a.isDestroyed()||s.stopped||(!refresh&&(s.busy||s.end))){if(refresh&&s.refresh!=null)s.refresh.setRefreshing(s.busy&&!s.stopped);return;}
        s.initialized=true;if(s.task!=null)s.task.cancel();s.failed=false;
        if(refresh){s.cursor=null;s.end=false;s.items.clear();s.ids.clear();s.cursors.clear();s.now=System.currentTimeMillis();rebuild(a,s);}
        String credentials;try{credentials=cookie(a);}catch(Exception error){credentials="";}
        if(credentials.isEmpty()){s.busy=false;s.failed=true;status(s,text(a,"ログインが必要です","Sign in to view following activity","請登入以查看追蹤動態"));rebuild(a,s);updateFooter(a,s);return;}
        final String auth=credentials,cursor=s.cursor;final int filter=s.filter;NetworkTask task=new NetworkTask();s.task=task;s.busy=true;rebuild(a,s);updateFooter(a,s);
        status(s,text(a,"読み込み中…","Loading…","載入中…"));
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
                    status(s,s.actorKey==null?"":text(a,"投稿者で絞り込み中","Filtered by creator","依投稿者篩選"));
                });
            }catch(Exception error){
                if(task.cancelled())return;
                MAIN.post(()->{if(task.cancelled()||s.task!=task||a.isDestroyed()||s.stopped)return;s.busy=false;s.failed=true;
                    status(s,error instanceof LoginRequired?text(a,"ログインし直してください","Please sign in again","請重新登入"):
                        text(a,"取得できませんでした。更新して再試行してください","Could not load. Refresh to retry","無法取得，請重新整理以重試"));
                    rebuild(a,s);updateFooter(a,s);});
                android.util.Log.w("nicoid-feed","Feed request failed",error);
            }
        });
    }
    private static void updateFooter(Activity a,State s){
        if(!s.active())return;
        if(s.refresh!=null)s.refresh.setRefreshing(s.busy);
        s.progress.setVisibility(s.busy?View.VISIBLE:View.GONE);
        s.more.setVisibility(s.end&&!s.failed?View.GONE:View.VISIBLE);s.more.setEnabled(!s.busy&&!s.stopped);
        s.more.setText(s.failed?text(a,"再試行","Retry","重試"):text(a,"過去の新着を読み込む","Load older activity","載入較早的動態"));
    }
    private static String period(Context c,int bucket){
        String[][] labels={{"今日","Today","今天"},{"昨日","Yesterday","昨天"},{"1週間","Past week","一週內"},{"1か月","Past month","一個月內"},{"1か月以上前","Older than a month","一個月以前"},{"日付不明","Date unavailable","日期不明"}};
        return text(c,labels[bucket][0],labels[bucket][1],labels[bucket][2]);
    }
    private static void rebuild(Activity a,State s){
        if(!s.active())return;
        s.visible.clear();int last=-1;
        for(Item item:s.items)if(item.matches(3,s.actorKey)){
            int bucket=FollowFeedData.bucket(item.time,s.now);if(bucket!=last){s.visible.add(Integer.valueOf(bucket));last=bucket;}s.visible.add(item);
        }
        if(!s.busy&&!s.failed)status(s,s.actorKey==null?"":text(a,"投稿者で絞り込み中","Filtered by creator","依投稿者篩選"));
        if(s.tabs!=null)s.tabs.select(s.filter);s.rows.notifyDataSetChanged();
    }
    private static void chooseActor(Activity a,State page,String key){
        State session=page.session==null?page:page.session;
        session.actorKey=key;Actor chosen=page.actors.get(key);if(chosen!=null)session.actors.put(key,chosen);
        if(session.pages!=null)for(State state:session.pages)if(state!=null){state.actorKey=key;if(chosen!=null)state.actors.put(key,chosen);state.authorStamp=null;state.scroll=null;}
        page.actorKey=key;renderAuthors(a,page);rebuild(a,page);page.list.setSelection(0);
    }
    private static void renderAuthors(Activity a,State s){
        if(!s.active())return;
        StringBuilder stamp=new StringBuilder(String.valueOf(s.actorKey));int count=0;
        for(Actor actor:s.actors.values()){if(count++>=50)break;stamp.append('|').append(actor.key()).append('|').append(actor.name).append('|').append(actor.icon);}
        String value=stamp.toString();if(value.equals(s.authorStamp))return;s.authorStamp=value;
        s.authors.removeAllViews();
        Button all=chip(a,text(a,"すべて","All","全部"));all.setSelected(s.actorKey==null);
        all.setOnClickListener(v->{chooseActor(a,s,null);});
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
            entry.setContentDescription(actor.name);entry.setOnClickListener(v->{chooseActor(a,s,actor.key());});
            s.authors.addView(entry,new LinearLayout.LayoutParams(dp(a,72),-2));
        }
    }
    private static FrameLayout imageBox(Activity a,boolean round){
        FrameLayout box=round?new FrameLayout(a):new Thumbnail(a);box.setBackground(shape(a,surface(a),round?100:0,false));
        ImageView image=new ImageView(a);image.setScaleType(ImageView.ScaleType.CENTER_CROP);box.addView(image,new FrameLayout.LayoutParams(-1,-1));
        TextView fallback=label(a,round?18:28,false);fallback.setText(round?"●":"▶");fallback.setTextColor(ThemeChoice.accent(a));fallback.setGravity(Gravity.CENTER);box.addView(fallback,new FrameLayout.LayoutParams(-1,-1));
        box.setTag(new View[]{image,fallback});
        if(round)Following190.roundAvatar(box);return box;
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
    private static void open(Activity a,State s,Item item,boolean info){
        if(!info&&item.shortVideo){
            ArrayList<String> ids=new ArrayList<>(),titles=new ArrayList<>(),thumbnails=new ArrayList<>();int selected=-1;
            // s.items is maintained in newest-first chronological order. Keep that same
            // order in the player session so vertical swipes follow the displayed feed.
            for(Item candidate:s.items)if(candidate.matches(3,s.actorKey)&&candidate.shortVideo){
                if(candidate.id.equals(item.id))selected=ids.size();
                ids.add(candidate.id);titles.add(candidate.title);thumbnails.add(candidate.thumbnail);
            }
            if(selected>=0&&ModernShorts.openVideos(a,ids.toArray(new String[0]),titles.toArray(new String[0]),thumbnails.toArray(new String[0]),selected))return;
        }
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
                row=new FeedLayout194(a);row.setOrientation(LinearLayout.VERTICAL);row.setPadding(dp(a,16),dp(a,12),dp(a,16),dp(a,12));h=new Holder();
                LinearLayout actor=new LinearLayout(a);actor.setGravity(Gravity.CENTER_VERTICAL);
                h.avatar=imageBox(a,true);actor.addView(h.avatar,new LinearLayout.LayoutParams(dp(a,40),dp(a,40)));
                LinearLayout words=new LinearLayout(a);words.setOrientation(LinearLayout.VERTICAL);words.setPadding(dp(a,12),0,0,0);
                LinearLayout top=new LinearLayout(a);top.setGravity(Gravity.CENTER_VERTICAL);
                h.name=label(a,14,false);h.name.setSingleLine(true);h.name.setEllipsize(android.text.TextUtils.TruncateAt.END);
                top.addView(h.name,new LinearLayout.LayoutParams(0,-2,1));h.date=label(a,12,false);h.date.setAlpha(.65f);top.addView(h.date);
                words.addView(top);h.event=label(a,12,false);h.event.setAlpha(.7f);words.addView(h.event);actor.addView(words,new LinearLayout.LayoutParams(0,-2,1));row.addView(actor);
                h.card=new LinearLayout(a);h.card.setOrientation(LinearLayout.VERTICAL);h.card.setBackground(shape(a,Ui110.actionColor(a),12,true));h.card.setClipToOutline(true);
                LinearLayout.LayoutParams cardParams=new LinearLayout.LayoutParams(-1,-2);cardParams.setMargins(dp(a,52),dp(a,8),0,0);row.addView(h.card,cardParams);
                h.thumbnail=imageBox(a,false);h.card.addView(h.thumbnail,new LinearLayout.LayoutParams(-1,-2));
                h.badge=label(a,11,true);h.badge.setTextColor(Color.WHITE);h.badge.setPadding(dp(a,5),dp(a,2),dp(a,5),dp(a,2));h.badge.setBackground(shape(a,0xbb111111,3,false));
                FrameLayout.LayoutParams badge=new FrameLayout.LayoutParams(-2,-2,Gravity.TOP|Gravity.START);badge.setMargins(dp(a,8),dp(a,8),0,0);h.thumbnail.addView(h.badge,badge);
                h.duration=label(a,11,true);h.duration.setTextColor(Color.WHITE);h.duration.setPadding(dp(a,5),dp(a,2),dp(a,5),dp(a,2));h.duration.setBackground(shape(a,0xbb111111,3,false));
                FrameLayout.LayoutParams duration=new FrameLayout.LayoutParams(-2,-2,Gravity.BOTTOM|Gravity.END);duration.setMargins(0,0,dp(a,8),dp(a,8));h.thumbnail.addView(h.duration,duration);
                LinearLayout bottom=new LinearLayout(a);bottom.setGravity(Gravity.CENTER_VERTICAL);bottom.setPadding(dp(a,10),dp(a,8),0,dp(a,8));
                h.title=label(a,14,false);h.title.setMaxLines(3);h.title.setEllipsize(android.text.TextUtils.TruncateAt.END);bottom.addView(h.title,new LinearLayout.LayoutParams(0,-2,1));
                h.menu=chip(a,"⋮");Ui110.circle(h.menu);h.menu.setTextSize(24);h.menu.setPadding(0,0,0,0);h.menu.setContentDescription(text(a,"動画メニュー","Video menu","影片選單"));bottom.addView(h.menu,new LinearLayout.LayoutParams(dp(a,48),dp(a,48)));h.card.addView(bottom);
                row.setTag(h);
            }else{row=(LinearLayout)recycled;h=(Holder)row.getTag();}
            h.name.setText(item.actor.isEmpty()?text(a,"投稿者","Creator","投稿者"):item.actor);h.date.setText(FollowFeedData.date(item));h.event.setText(event(a,item));
            h.title.setText(item.title);h.badge.setText(badge(a,item));h.duration.setText(FollowFeedData.duration(item.duration));h.duration.setVisibility(item.duration>0?View.VISIBLE:View.GONE);
            bindImage(h.avatar,item.author.icon);bindImage(h.thumbnail,item.thumbnail);
            h.card.setContentDescription(item.title);h.card.setOnClickListener(v->open(a,s,item,false));h.thumbnail.setOnClickListener(v->open(a,s,item,false));h.title.setOnClickListener(v->open(a,s,item,false));
            h.menu.setOnClickListener(v->{
                PopupMenu menu=new PopupMenu(UiTheme191.context(a),v);
                menu.getMenu().add(text(a,"再生","Play","播放")).setOnMenuItemClickListener(m->{open(a,s,item,false);return true;});
                menu.getMenu().add(text(a,"動画情報","Video details","影片資訊")).setOnMenuItemClickListener(m->{open(a,s,item,true);return true;});
                menu.getMenu().add(text(a,"共有","Share","分享")).setOnMenuItemClickListener(m->{
                    a.startActivity(Intent.createChooser(new Intent(Intent.ACTION_SEND).setType("text/plain").putExtra(Intent.EXTRA_TEXT,"https://www.nicovideo.jp/watch/"+item.id),text(a,"共有","Share","分享")));return true;
                });menu.show();
            });
            return row;
        }
    }
}
