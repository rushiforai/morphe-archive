package nl.johninnl.wuplaycar;

import android.app.*;
import android.content.*;
import android.content.res.Configuration;
import android.graphics.Rect;
import android.os.*;
import android.view.SurfaceHolder;
import androidx.car.app.*;
import androidx.car.app.model.*;
import androidx.car.app.model.signin.*;
import androidx.car.app.navigation.model.NavigationTemplate;
import androidx.car.app.serialization.Bundleable;
import java.util.*;
import java.util.concurrent.*;

/** Gearslip car protocol endpoint. Android services own lifecycle; WuPlay owns playback. */
public final class WuplayCarService extends Service {
    private final Handler main=new Handler(Looper.getMainLooper());
    private ExecutorService worker;
    private CarArtwork artwork;private int hostApi=5;private String hostPackage="";private boolean homeDirty;private String browseSession=UUID.randomUUID().toString();private int browseRevision;
    private NativeData data;private NativePlayer engine;private CarPlayback<SurfaceHolder> playback;private CarVideoRenderer renderer;
    private PowerManager.WakeLock wake;private IAppHost host;private final Deque<Page> pages=new ArrayDeque<>();private boolean ended;
    private Rect visibleArea;private NativeData.Item playingItem;private NativeData.Choice playingChoice;private SurfaceContainer currentSurface;
    private volatile String diagnostic="not started",lastAction="none";private volatile long tickAt;private int actionCount,templateCount;
    @Override protected void dump(java.io.FileDescriptor fd,java.io.PrintWriter out,String[] args){
        out.println("WuPlay car uid="+android.os.Process.myUid()+" ended="+ended+" page="+(pages.peekLast()==null?"none":pages.peekLast().getClass().getSimpleName()));
        out.println("ticksAgeMs="+(SystemClock.uptimeMillis()-tickAt)+" actions="+actionCount+" lastAction="+lastAction+" templates="+templateCount);out.println(diagnostic);if(renderer!=null)out.println(renderer.diagnostics());
    }
    private final Runnable reloadHome=()->{if(!ended&&pages.peekLast() instanceof HomePage){pages.peekLast().load();invalidate();}};
    private final Runnable tick=new Runnable(){public void run(){
        if(ended)return;
        try {
            diagnostic="refreshing";if(engine!=null)engine.refresh();if(renderer!=null)renderer.refresh();
            diagnostic=engine==null?"no engine":engine.diagnostics();tickAt=SystemClock.uptimeMillis();
            if(pages.peekLast() instanceof PlayerPage)((PlayerPage)pages.peekLast()).retryIfNeeded();
            boolean active=engine!=null&&engine.playing()&&!engine.status().equals("Finished");
            if(wake!=null){if(active&&!wake.isHeld())wake.acquire();else if(!active&&wake.isHeld())wake.release();}
        }catch(Exception e){showError("WuPlay playback needs another stream.");}
        main.postDelayed(this,500);
    }};
    @Override public void onCreate(){super.onCreate();worker=Executors.newFixedThreadPool(4);}
    @Override public IBinder onBind(Intent intent){return car;}
    @Override public boolean onUnbind(Intent intent){finishSession();return false;}
    @Override public void onDestroy(){finishSession();super.onDestroy();}
    private void trusted() {
        int uid=Binder.getCallingUid();if(uid==android.os.Process.myUid())return;
        if(HostPackages.allowed(getPackageManager().getPackagesForUid(uid)))return;
        throw new SecurityException("This interface accepts the Gearslip host package");
    }
    private interface Operation {Object run() throws Exception;}
    private void respond(IOnDoneCallback callback,Operation operation) {
        try {trusted();}catch(Exception e){failure(callback,e);return;}
        main.post(()->{try {Object result=operation.run();callback.onSuccess(result==null?null:transport(result));}
            catch(Exception e){failure(callback,e);}});
    }
    /** Publish the shared AIDL type, never an app-private anonymous Stub class name. */
    private Bundleable transport(Object value) throws Exception {
        Bundleable result=Bundleable.create(value);
        if(value instanceof IAppManager) {
            java.lang.reflect.Field field=Bundleable.class.getDeclaredField("mBundle");field.setAccessible(true);
            ((Bundle)field.get(result)).putString("tag_class_name",IAppManager.Stub.class.getName());
        }
        return result;
    }
    private void failure(IOnDoneCallback callback,Exception error) {
        try {callback.onFailure(Bundleable.create(new FailureResponse(error)));}catch(Exception ignored){android.util.Log.w("WuPlayCar","Host callback unavailable");}
    }
    private final ICarApp.Stub car=new ICarApp.Stub(){
        public int getInterfaceVersion(){return ICarApp.VERSION;}
        public void getAppInfo(IOnDoneCallback cb){respond(cb,()->new AppInfo(5,8,"WuPlay Gearslip / Car App 1.8"));}
        public void onHandshakeCompleted(Bundleable info,IOnDoneCallback cb){int caller=Binder.getCallingUid();respond(cb,()->{
            HandshakeInfo handshake=(HandshakeInfo)info.get();
            if(getPackageManager().getPackageUid(handshake.getHostPackageName(),0)!=caller)throw new SecurityException("Handshake package does not match caller UID");
            hostPackage=handshake.getHostPackageName();hostApi=handshake.getHostCarAppApiLevel();
            if(hostApi<5)throw new IllegalArgumentException("Car API 5 is required");return null;
        });}
        public void onAppCreate(ICarHost carHost,Intent intent,Configuration config,IOnDoneCallback cb){respond(cb,()->{
            startSession();host=IAppHost.Stub.asInterface(carHost.getHost("app"));host.setSurfaceCallback(surface);
            pages.clear();push(rootPage());return null;
        });}
        public void onAppStart(IOnDoneCallback cb){respond(cb,()->null);}
        public void onAppResume(IOnDoneCallback cb){respond(cb,()->null);}
        public void onAppPause(IOnDoneCallback cb){respond(cb,()->null);}
        public void onAppStop(IOnDoneCallback cb){respond(cb,()->{finishSession();return null;});}
        public void onNewIntent(Intent i,IOnDoneCallback cb){respond(cb,()->null);}
        public void onConfigurationChanged(Configuration c,IOnDoneCallback cb){respond(cb,()->null);}
        public void getManager(String type,IOnDoneCallback cb){respond(cb,()->{
            if(!type.equals("app"))return null;return manager.asBinder();
        });}
    };
    private final IAppManager.Stub manager=new IAppManager.Stub(){
        public int getInterfaceVersion(){return IAppManager.VERSION;}
        public void getTemplate(IOnDoneCallback cb){respond(cb,()->{
            templateCount++;Page page=pages.peekLast();if(page==null)throw new IllegalStateException("Car session ended");
            TemplateWrapper wrapper=TemplateWrapper.wrap(page.template(),page.id);wrapper.setRefresh(page.sent);page.sent=true;return wrapper;
        });}
        public void onBackPressed(IOnDoneCallback cb){respond(cb,()->{back();return null;});}
        public void startLocationUpdates(IOnDoneCallback cb){respond(cb,()->null);}
        public void stopLocationUpdates(IOnDoneCallback cb){respond(cb,()->null);}
    };
    private final ISurfaceCallback.Stub surface=new ISurfaceCallback.Stub(){
        public int getInterfaceVersion(){return ISurfaceCallback.VERSION;}
        public void onSurfaceAvailable(Bundleable value,IOnDoneCallback cb){respond(cb,()->{
            SurfaceContainer next=(SurfaceContainer)value.get();currentSurface=next;
            if(pages.peekLast() instanceof PlayerPage)openVideo();return null;
        });}
        public void onSurfaceDestroyed(Bundleable value,IOnDoneCallback cb){respond(cb,()->{
            SurfaceContainer old=(SurfaceContainer)value.get();
            if(renderer!=null)renderer.close();currentSurface=null;
            old.getSurface().release();return null;
        });}
        public void onVisibleAreaChanged(Rect rect,IOnDoneCallback cb){respond(cb,()->{visibleArea=new Rect(rect);if(renderer!=null)renderer.area(rect);return null;});}
        public void onStableAreaChanged(Rect rect,IOnDoneCallback cb){respond(cb,()->null);}
        public void onClick(float x,float y){trusted();main.post(()->{if(pages.peekLast() instanceof PlayerPage){playback.toggle();invalidate();}});}
        public void onScroll(float x,float y){trusted();}
        public void onFling(float x,float y){trusted();}
        public void onScale(float x,float y,float scale){trusted();}
    };
    private void startSession() throws Exception {
        ended=false;if(worker==null||worker.isShutdown())worker=Executors.newFixedThreadPool(4);
        if(data==null){
            artwork=new CarArtwork(this);data=new NativeData(this);engine=new NativePlayer(this,data);playback=new CarPlayback<>(engine);renderer=new CarVideoRenderer(playback,engine);
            NativeData observed=data;data.watchProfiles(()->main.post(()->{if(!ended&&data==observed)profileChanged();}));
            data.watchHome(()->main.post(()->{if(!ended&&data==observed){homeDirty=true;main.removeCallbacks(reloadHome);main.postDelayed(reloadHome,250);}}));
        }
        if(wake==null){wake=getSystemService(PowerManager.class).newWakeLock(PowerManager.PARTIAL_WAKE_LOCK,getPackageName()+":WuPlayCar");wake.setReferenceCounted(false);}
        NotificationManager notifications=getSystemService(NotificationManager.class);
        notifications.createNotificationChannel(new NotificationChannel("wuplay_car","WuPlay car playback",NotificationManager.IMPORTANCE_LOW));
        Intent launch=getPackageManager().getLaunchIntentForPackage(getPackageName());
        Notification.Builder n=new Notification.Builder(this,"wuplay_car").setContentTitle("WuPlay in Gearslip").setContentText("Car playback is connected").setSmallIcon(android.R.drawable.ic_media_play).setOngoing(true);
        if(launch!=null)n.setContentIntent(PendingIntent.getActivity(this,0,launch,PendingIntent.FLAG_IMMUTABLE|PendingIntent.FLAG_UPDATE_CURRENT));
        try {startForeground(6091,n.build(),android.content.pm.ServiceInfo.FOREGROUND_SERVICE_TYPE_MEDIA_PLAYBACK);}
        catch(RuntimeException e){android.util.Log.w("WuPlayCar","Foreground playback start requires phone activation");}
        main.removeCallbacks(tick);main.post(tick);
    }
    private void profileChanged() {
        for(Page page:pages)page.cancel();pages.clear();
        if(artwork!=null)artwork.close();artwork=new CarArtwork(this);browseSession=UUID.randomUUID().toString();browseRevision++;
        if(engine!=null)engine.profileChanged();renderer.close();playback.close();
        engine=new NativePlayer(this,data);playback=new CarPlayback<>(engine);renderer=new CarVideoRenderer(playback,engine);
        if(wake!=null&&wake.isHeld())wake.release();
        playingItem=null;playingChoice=null;push(rootPage());
    }
    private void finishSession() {
        if(ended)return;ended=true;main.removeCallbacks(tick);main.removeCallbacks(reloadHome);
        for(Page page:pages)page.cancel();pages.clear();
        if(renderer!=null)renderer.close();if(playback!=null)playback.close();if(data!=null)data.close();if(artwork!=null)artwork.close();artwork=null;
        if(worker!=null)worker.shutdownNow();
        host=null;renderer=null;playback=null;engine=null;data=null;playingItem=null;playingChoice=null;currentSurface=null;
        if(wake!=null&&wake.isHeld())wake.release();wake=null;
        stopForeground(STOP_FOREGROUND_REMOVE);
    }
    private void push(Page page){Page old=pages.peekLast();if(old!=null)old.cancel();pages.addLast(page);page.load();if(!(page instanceof PlayerPage)&&renderer!=null)renderer.close();invalidate();}
    private void back(){if(pages.size()>1){pages.removeLast().cancel();Page page=pages.peekLast();if(page instanceof PlayerPage)openVideo();else if(renderer!=null)renderer.close();if(page.loading||(page instanceof HomePage&&homeDirty))page.load();invalidate();}}
    private void invalidate(){try {if(host!=null)host.invalidate();}catch(Exception e){android.util.Log.w("WuPlayCar","Host unavailable");}}
    private void showError(String text){if(!ended){Page page=pages.peekLast();if(page!=null){page.error=text;page.loading=false;invalidate();}}}
    private void openVideo(){if(currentSurface==null||renderer==null)return;renderer.open(this,currentSurface.getSurface(),currentSurface.getWidth(),currentSurface.getHeight(),currentSurface.getDpi());if(visibleArea!=null)renderer.area(visibleArea);}
    private Action action(Page owner,String title,Runnable callback){return new Action.Builder().setTitle(title).setOnClickListener(()->{if(NavigationStack.current(pages,owner,ended)){actionCount++;lastAction=title;callback.run();}}).build();}
    private interface Load<T>{T run() throws Exception;}
    private interface Receive<T>{void accept(T value);}
    private abstract class Page {
        final String id=UUID.randomUUID().toString();String title="WuPlay",error;boolean loading,sent;int request,contentRevision;Future<?> pending;
        void cancel(){request++;if(pending!=null)pending.cancel(true);pending=null;}
        void load(){}
        <T> void async(Load<T> operation,Receive<T> receive){
            cancel();loading=true;error=null;int token=request;
            pending=worker.submit(()->{try {T value=operation.run();main.post(()->{if(!ended&&pages.peekLast()==this&&request==token){loading=false;receive.accept(value);invalidate();}});}
                catch(Exception e){if(!(e instanceof NativeData.PinRequired)&&!(e instanceof InterruptedException)&&!(e instanceof CancellationException))android.util.Log.w("WuPlayCar","Car page "+getClass().getSimpleName()+" failed ("+e.getClass().getSimpleName()+")");main.post(()->{if(!ended&&pages.peekLast()==this&&request==token){loading=false;if(e instanceof NativeData.PinRequired){push(new PinPage(this));return;}error=e instanceof InterruptedException?"Request cancelled; retry.":"WuPlay could not load this page. Check your selected profile and connection, then retry.";invalidate();}});}});
        }
        Template template(){if(error!=null)return new MessageTemplate.Builder(error).setTitle(title).setHeaderAction(Action.BACK).addAction(action(this,"Retry",this::load)).build();return content();}
        abstract Template content();
        ListTemplate.Builder list(){return new ListTemplate.Builder().setTitle(title).setHeaderAction(pages.size()>1?Action.BACK:Action.APP_ICON).setLoading(loading);}
        Row row(String name,String detail,Runnable click){Row.Builder b=new Row.Builder().setTitle(name.isEmpty()?"Untitled":name).setOnClickListener(()->{if(NavigationStack.current(pages,this,ended))click.run();});if(detail!=null&&!detail.isEmpty())b.addText(detail.replace('\n',' '));return b.build();}
    }
    private final class PinPage extends Page {
        final Page next;String message;
        PinPage(Page next){this.next=next;title="Unlock WuPlay profile";}
        @Override Template template(){
            InputSignInMethod.Builder input=new InputSignInMethod.Builder(new InputCallback(){
                @Override public void onInputSubmitted(String pin){
                    if(loading||pages.peekLast()!=PinPage.this)return;
                    async(()->data.verifyPin(pin),valid->{
                        if(valid){pages.removeLast();next.load();invalidate();}
                        else {message="PIN could not be verified. Check it and retry.";invalidate();}
                    });invalidate();
                }
            }).setHint("Profile PIN").setInputType(InputSignInMethod.INPUT_TYPE_PASSWORD).setKeyboardType(InputSignInMethod.KEYBOARD_NUMBER);
            if(error!=null||message!=null)input.setErrorMessage(error!=null?error:message);
            return new SignInTemplate.Builder(input.build()).setTitle(title).setHeaderAction(Action.BACK)
                .setInstructions("Enter the PIN for the profile selected in WuPlay.").setLoading(loading).build();
        }
        Template content(){return template();}
    }
    private Page rootPage(){return hostApi>=8?new HomePage(0):new CatalogPage();}
    private void openTitle(NativeData.Item item){push(item.parentId==null&&item.type.equals("series")?new EpisodesPage(item,0):new DetailsPage(item));}
    private Template shelves(Page page,List<Section<?>> sections){
        SectionedItemTemplate.Builder builder=new SectionedItemTemplate.Builder().setLoading(page.loading).setSections(sections);
        if(!(page instanceof HomePage))builder.setHeader(new Header.Builder().setTitle(page.title).setStartHeaderAction(Action.BACK).build());
        if(playingChoice!=null)builder.addAction(new Action.Builder().setIcon(CarIcon.MEDIA_PLAYBACK).setBackgroundColor(CarColor.BLUE)
            .setOnClickListener(()->{if(NavigationStack.current(pages,page,ended))push(new PlayerPage());}).build());
        SectionedItemTemplate content=builder.build();
        // DriveDeck versions the shelf cache by its delegate, so no visible navigation wrapper is needed.
        if(HostPackages.isDriveDeck(hostPackage))return content;
        // Older Gearslip needs the tab identity to prevent stale rows across profiles/reloads.
        String identity=ShelfGroups.identity(browseSession,page.contentRevision,page.id),home=identity+"/home",catalogs=identity+"/catalogs";
        return new TabTemplate.Builder(new TabTemplate.TabCallback(){public void onTabSelected(String selected){if(NavigationStack.current(pages,page,ended)&&selected.equals(catalogs))push(new CatalogPage());}})
            .setHeaderAction(Action.APP_ICON).addTab(new Tab.Builder().setTitle("Home").setIcon(CarIcon.APP_ICON).setContentId(home).build())
            .addTab(new Tab.Builder().setTitle("Catalogs").setIcon(CarIcon.MEDIA_PLAYBACK).setContentId(catalogs).build())
            .setActiveTabContentId(home).setTabContents(new TabContents.Builder(content).build()).build();
    }
    private GridItem tile(Page owner,NativeData.Item item){return new GridItem.Builder().setTitle(item.displayTitle()).setText(item.byline())
        .setImage(artwork.icon(item.artwork(),item.displayTitle())).setOnClickListener(()->{if(NavigationStack.current(pages,owner,ended))openTitle(item);}).build();}
    private GridItem moreTile(Page owner,String label,Runnable run){return new GridItem.Builder().setTitle(label).setImage(CarIcon.PAN).setOnClickListener(()->{if(NavigationStack.current(pages,owner,ended))run.run();}).build();}
    private final class Shelf {
        final NativeData.Catalog catalog;final List<NativeData.Item> items;final String error;
        Shelf(NativeData.Catalog catalog,List<NativeData.Item> items,String error){this.catalog=catalog;this.items=items;this.error=error;}
    }
    private final class HomePage extends Page {
        final int offset;List<NativeData.Catalog> catalogs=Collections.emptyList();List<Shelf> values=Collections.emptyList();
        HomePage(int offset){this.offset=offset;}
        void load(){homeDirty=false;contentRevision++;artwork.refresh();async(()->{
            List<NativeData.Catalog> all=data.catalogs();List<Future<Shelf>> pending=new ArrayList<>();
            List<NativeData.Catalog> group=ShelfGroups.window(all,offset,4);List<Shelf> shelves=new ArrayList<>();
            try{
                for(NativeData.Catalog catalog:group)pending.add(worker.submit(()->{
                    try{return new Shelf(catalog,ShelfGroups.window(data.items(catalog,0).items(),0,12),null);}
                    catch(NativeData.PinRequired e){throw e;}catch(InterruptedException|CancellationException e){throw e;}
                    catch(Exception e){return new Shelf(catalog,Collections.emptyList(),"Could not load. Open catalog to retry.");}
                }));
                for(int i=0;i<pending.size();i++)try{shelves.add(pending.get(i).get(15,TimeUnit.SECONDS));}
                catch(ExecutionException e){if(e.getCause() instanceof NativeData.PinRequired)throw (NativeData.PinRequired)e.getCause();throw e;}
                catch(TimeoutException e){pending.get(i).cancel(true);shelves.add(new Shelf(group.get(i),Collections.emptyList(),"Catalog timed out. Open it to retry."));}
            }finally{for(Future<?> job:pending)if(!job.isDone())job.cancel(true);}
            return new Object[]{all,shelves};
        },result->{catalogs=(List<NativeData.Catalog>)result[0];values=(List<Shelf>)result[1];});}
        Template content(){
            List<Section<?>> sections=new ArrayList<>();
            if(!loading){
                for(Shelf shelf:values){GridSection.Builder row=new GridSection.Builder().setTitle(shelf.catalog.title).setItemSize(GridSection.ITEM_SIZE_LARGE);
                    for(NativeData.Item item:shelf.items)row.addItem(tile(this,item));
                    row.addItem(moreTile(this,shelf.items.isEmpty()?"Open catalog":"More titles",()->push(new ItemsPage(shelf.catalog,0))));
                    if(shelf.error!=null)row.setNoItemsMessage(shelf.error);sections.add(row.build());}
                if(catalogs.size()>offset+4)sections.add(new RowSection.Builder().addItem(row("More catalogs","",()->push(new HomePage(offset+4)))).build());
                if(values.isEmpty())sections.add(new RowSection.Builder().setNoItemsMessage("Choose a profile and enable Home catalogs in Wuplay on your phone.").build());
            }
            return shelves(this,sections);
        }
    }
    private final class CatalogPage extends Page {
        List<NativeData.Catalog> values=Collections.emptyList();
        void load(){async(()->new Object[]{data.profileName(),data.catalogs()},v->{title="WuPlay · "+v[0];values=(List<NativeData.Catalog>)v[1];});}
        Template content(){ListTemplate.Builder b=list();if(loading)return b.build();ItemList.Builder rows=new ItemList.Builder();
            if(playingChoice!=null)rows.addItem(row("Now playing",playingItem.title,()->push(new PlayerPage())));
            for(NativeData.Catalog c:values)rows.addItem(row(c.title,"",()->push(new ItemsPage(c,0))));
            if(values.isEmpty())rows.setNoItemsMessage("Choose a profile and add catalogs in WuPlay on your phone, then reload.");
            return b.setSingleList(rows.build()).setActionStrip(new ActionStrip.Builder().addAction(action(this,"Reload",this::load)).build()).build();}
    }
    private final class ItemsPage extends Page {
        final NativeData.Catalog catalog;final int cursor;CatalogWindow<NativeData.Item> window;
        ItemsPage(NativeData.Catalog catalog,int cursor){this.catalog=catalog;this.cursor=cursor;title=catalog.title;}
        ItemsPage(NativeData.Catalog catalog,CatalogWindow<NativeData.Item> window){this(catalog,0);this.window=window;}
        void load(){if(window==null)async(()->data.items(catalog,cursor),v->window=v);}
        Template content(){
            if(hostApi>=8){List<Section<?>> sections=new ArrayList<>();if(!loading){GridSection.Builder grid=new GridSection.Builder().setTitle(title).setItemSize(GridSection.ITEM_SIZE_LARGE);
                for(NativeData.Item item:window.items())grid.addItem(tile(this,item));
                CatalogWindow<NativeData.Item> local=window.nextLocal();int next=window.remoteCursor();
                if(local!=null)grid.addItem(moreTile(this,"More titles",()->push(new ItemsPage(catalog,local))));
                else if(next>=0)grid.addItem(moreTile(this,"More titles",()->push(new ItemsPage(catalog,next))));
                grid.setNoItemsMessage("No titles in this catalog.");sections.add(grid.build());}return shelves(this,sections);}
            ListTemplate.Builder b=list();if(loading)return b.build();ItemList.Builder rows=new ItemList.Builder();
            for(NativeData.Item item:window.items())rows.addItem(new Row.Builder().setTitle(item.title).addText(item.byline()).setImage(artwork.icon(item.artwork(),item.title),Row.IMAGE_TYPE_LARGE).setOnClickListener(()->{if(NavigationStack.current(pages,this,ended))openTitle(item);}).build());
            CatalogWindow<NativeData.Item> local=window.nextLocal();int next=window.remoteCursor();
            if(local!=null)rows.addItem(row("More titles","",()->push(new ItemsPage(catalog,local))));
            else if(next>=0)rows.addItem(row("More titles","",()->push(new ItemsPage(catalog,next))));
            rows.setNoItemsMessage("No titles in this catalog.");return b.setSingleList(rows.build()).build();}
    }
    private final class DetailsPage extends Page {
        final NativeData.Item item;NativeData.Item detail;
        DetailsPage(NativeData.Item item){this.item=item;title=item.parentId==null?item.title:item.displayTitle();}
        void load(){async(()->data.details(item),v->detail=v);}
        Template content(){
            Pane.Builder pane=new Pane.Builder().setLoading(loading);
            if(!loading){
                String description=detail.overview();
                if(description.length()>600)description=description.substring(0,600)+"…";
                pane.setImage(artwork.icon(detail.artwork(),detail.displayTitle()));Row.Builder row=new Row.Builder().setTitle(detail.displayTitle());if(!detail.byline().isEmpty())row.addText(detail.byline());if(!description.isEmpty())row.addText(description);
                pane.addRow(row.build());
                if(item.parentId==null&&item.type.equals("series"))pane.addAction(action(this,"Seasons",()->push(new EpisodesPage(detail,0))));
                else pane.addAction(action(this,"Play · ≤10 Mbps",()->push(new PlayPage(detail)))).addAction(action(this,"Sources",()->push(new StreamsPage(detail))));
            }
            return new PaneTemplate.Builder(pane.build()).setTitle(title).setHeaderAction(Action.BACK).build();
        }
    }
    private final class EpisodesPage extends Page {
        final NativeData.Item item;final int offset;final Integer onlySeason;List<NativeData.Item> values=Collections.emptyList();
        EpisodesPage(NativeData.Item item,int offset){this(item,offset,null);}
        EpisodesPage(NativeData.Item item,int offset,Integer onlySeason){this.item=item;this.offset=offset;this.onlySeason=onlySeason;title=item.title;}
        void load(){async(()->data.episodes(item),v->values=v);}
        Template content(){
            if(hostApi>=8){List<Section<?>> sections=new ArrayList<>();if(!loading){
                Map<Integer,List<NativeData.Item>> grouped=ShelfGroups.seasons(values,NativeData.Item::season,Comparator.comparingInt(NativeData.Item::episode));
                List<Integer> seasons=new ArrayList<>(grouped.keySet());List<Integer> visible=onlySeason==null?ShelfGroups.window(seasons,offset,4):Collections.singletonList(onlySeason);
                for(Integer season:visible){List<NativeData.Item> episodes=grouped.getOrDefault(season,Collections.emptyList());int from=onlySeason==null?0:offset;
                    GridSection.Builder row=new GridSection.Builder().setTitle(season>0?"Season "+season:season==0?"Specials":"Episodes").setItemSize(GridSection.ITEM_SIZE_LARGE);
                    for(NativeData.Item episode:ShelfGroups.window(episodes,from,12))row.addItem(tile(this,episode));
                    if(episodes.size()>from+12)row.addItem(moreTile(this,"More episodes",()->push(new EpisodesPage(item,from+12,season))));
                    sections.add(row.build());}
                if(onlySeason==null&&seasons.size()>offset+4)sections.add(new RowSection.Builder().addItem(row("More seasons","",()->push(new EpisodesPage(item,offset+4)))).build());
                if(values.isEmpty())sections.add(new RowSection.Builder().setNoItemsMessage("No episodes available.").build());
            }return shelves(this,sections);}
            ListTemplate.Builder b=list();if(loading)return b.build();ItemList.Builder rows=new ItemList.Builder();
            for(NativeData.Item episode:ShelfGroups.window(values,offset,30))rows.addItem(row(episode.subtitle,"",()->push(new DetailsPage(episode))));
            if(values.size()>offset+30)rows.addItem(row("More episodes","",()->push(new EpisodesPage(item,offset+30))));
            rows.setNoItemsMessage("No episodes available.");return b.setSingleList(rows.build()).build();
        }
    }
    private final class PlayPage extends Page {
        final NativeData.Item item;PlayPage(NativeData.Item item){this.item=item;title="Play · "+item.displayTitle();}
        void load(){async(()->new Object[]{data.streams(item),data.preferredAddon()},result->{
            AutoplayQueue<NativeData.Choice> queue=new AutoplayQueue<>((List<NativeData.Choice>)result[0],(String)result[1]);
            NativeData.Choice first=queue.next();
            if(first==null){error="No suitable stream within 10 Mbps. Your add-ons returned no direct source with a known or verifiable bitrate within the limit.";return;}
            pages.removeLast().cancel();startPlayback(item,first,queue);
        });}
        Template content(){return new MessageTemplate.Builder("Choosing a stream within 10 Mbps…").setTitle(item.displayTitle()).setHeaderAction(Action.BACK).setLoading(loading).build();}
    }
    private void startPlayback(NativeData.Item item,NativeData.Choice choice,AutoplayQueue<NativeData.Choice> queue){
        try{
            if(!choice.direct()||!CarStreamPolicy.eligible(choice.rate))throw new IllegalStateException("No suitable stream within 10 Mbps");
            long token=playback.beginSelection();engine.selection(item,choice);
            if(playback.select(token,choice.url,choice.headers(),0)){playingItem=item;playingChoice=choice;push(new PlayerPage(queue));}
        }catch(Exception e){NativeData.Choice next=queue==null?null:queue.next();if(next!=null)startPlayback(item,next,queue);else showError("Wuplay could not start a stream within 10 Mbps. Retry or choose another eligible source.");}
    }
    private final class StreamsPage extends Page {
        final NativeData.Item item;NativeData.Item detail;List<NativeData.Choice> values=Collections.emptyList();
        StreamsPage(NativeData.Item item){this.item=item;title="Sources · ≤10 Mbps";}
        void load(){async(()->{detail=item.parentId==null?data.details(item):item;return CarStreamPolicy.ranked(data.streams(detail),data.preferredAddon());},v->values=v);}
        Template content(){ListTemplate.Builder b=list();if(loading)return b.build();ItemList.Builder rows=new ItemList.Builder();
            for(NativeData.Choice choice:values.subList(0,Math.min(30,values.size())))rows.addItem(row(choice.title,choice.addonName+" · "+choice.rateLabel(),()->startPlayback(detail,choice,null)));
            rows.setNoItemsMessage("No suitable stream within 10 Mbps. Unknown and higher bitrates are excluded.");return b.setSingleList(rows.build()).build();}
    }
    private boolean sameTitle(NativeData.Item first,NativeData.Item second){return first!=null&&second!=null&&first.type.equals(second.type)&&first.id.equals(second.id);}
    private final class TracksMenuPage extends Page {
        TracksMenuPage(){title="Playback options";}
        Template content(){return list().setSingleList(new ItemList.Builder()
            .addItem(row("Audio tracks","",()->push(new TracksPage(false))))
            .addItem(row("Subtitles","",()->push(new TracksPage(true))))
            .addItem(row("Choose another stream","",()->{
                boolean found=NavigationStack.rewind(pages,page->page instanceof StreamsPage&&sameTitle(((StreamsPage)page).item,playingItem),Page::cancel);
                if(renderer!=null)renderer.close();
                if(found){Page page=pages.peekLast();page.error=null;page.load();invalidate();}else push(new StreamsPage(playingItem));
            }))
            .build()).build();}
    }
    private final class TracksPage extends Page {
        final boolean subtitle;List<NativePlayer.Track> tracks=Collections.emptyList();
        TracksPage(boolean subtitle){this.subtitle=subtitle;title=subtitle?"Subtitles":"Audio tracks";}
        void load(){try {tracks=subtitle?engine.subtitles():engine.audioTracks();}catch(Exception e){error="Tracks are not ready. Retry after playback starts.";}}
        void choose(NativePlayer.Track track){try {if(subtitle)engine.subtitle(track);else engine.audio(track);back();back();}catch(Exception e){error="Track could not be selected. Reload the available tracks.";invalidate();}}
        Template content(){ItemList.Builder rows=new ItemList.Builder();if(subtitle)rows.addItem(row("Off","",()->choose(null)));
            for(NativePlayer.Track track:tracks)rows.addItem(row(track.title,"",()->choose(track)));
            rows.setNoItemsMessage("No alternate tracks in this stream.");return list().setSingleList(rows.build()).build();}
    }
    private final class PlayerPage extends Page {
        final AutoplayQueue<NativeData.Choice> attempts;boolean retryFinished;long attemptStarted=SystemClock.uptimeMillis();
        PlayerPage(){this(null);}
        PlayerPage(AutoplayQueue<NativeData.Choice> attempts){this.attempts=attempts;title=playingItem==null?"Wuplay":playingItem.title;}
        void load(){if(error!=null&&playingItem!=null){error=null;push(new PlayPage(playingItem));}else openVideo();}
        @Override void cancel(){super.cancel();if(attempts!=null)attempts.cancel();}
        void retryIfNeeded(){
            if(attempts==null||retryFinished||ended||pages.peekLast()!=this)return;
            String status=engine.status();long elapsed=SystemClock.uptimeMillis()-attemptStarted;
            if(!(status.startsWith("Playback failed")||(elapsed>8000&&status.startsWith("Playback stopped"))||(elapsed>30000&&status.equals("Buffering…"))))return;
            long position=Math.max(0,engine.position());
            NativeData.Choice next=attempts.prepareNext(candidate->{long token=playback.beginSelection();engine.selection(playingItem,candidate);return playback.select(token,candidate.url,candidate.headers(),position);});
            if(next==null){retryFinished=true;attempts.cancel();engine.release();error="No working stream within 10 Mbps. Return to the title and retry.";if(renderer!=null)renderer.close();invalidate();return;}
            attemptStarted=SystemClock.uptimeMillis();playingChoice=next;openVideo();
        }
        Template content(){return new NavigationTemplate.Builder().setActionStrip(new ActionStrip.Builder()
            .addAction(action(this,"−30s",()->playback.seekBy(-30000)))
            .addAction(action(this,engine.playing()?"Pause":"Play",()->{playback.toggle();invalidate();}))
            .addAction(action(this,"+30s",()->playback.seekBy(30000)))
            .addAction(action(this,"Tracks",()->push(new TracksMenuPage()))).build()).build();}
    }
}
