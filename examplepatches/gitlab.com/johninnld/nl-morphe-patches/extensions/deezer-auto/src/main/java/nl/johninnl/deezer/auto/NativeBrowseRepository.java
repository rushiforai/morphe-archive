package nl.johninnl.deezer.auto;

import android.os.Bundle;
import android.support.v4.media.MediaBrowserCompat;
import android.support.v4.media.MediaDescriptionCompat;
import java.util.*;

/** Real native destinations/collections. CAL pages the presentation; navigation never adds page rows. */
final class NativeBrowseRepository {
    static final String GROUP = "android.media.browse.CONTENT_STYLE_GROUP_TITLE_HINT";
    static final String BROWSABLE = "android.media.browse.CONTENT_STYLE_BROWSABLE_HINT";
    static final String PLAYABLE = "android.media.browse.CONTENT_STYLE_PLAYABLE_HINT";
    static final int PAGE_SIZE = 160;
    static final class Folder {
        final String id, title;
        final MediaBrowserCompat.MediaItem origin;
        final int browsableStyle, playableStyle;
        List<MediaBrowserCompat.MediaItem> items = Collections.emptyList();
        boolean loading = true, failed;
        int revision, run;
        Runnable retry;
        Folder(String id, String title, MediaBrowserCompat.MediaItem origin, int browsableStyle, int playableStyle) {
            this.id=id; this.title=title; this.origin=origin; this.browsableStyle=browsableStyle; this.playableStyle=playableStyle;
        }
    }
    static final class Group {
        final String title;
        final List<MediaBrowserCompat.MediaItem> items;
        final boolean grid;
        final Folder expanded;
        Group(String title,List<MediaBrowserCompat.MediaItem> items,boolean grid,Folder expanded){this.title=title;this.items=items;this.grid=grid;this.expanded=expanded;}
    }
    private static final class Subscription {
        final MediaBrowserCompat browser; final String id; final Folder owner; final int page;
        final MediaBrowserCompat.SubscriptionCallback callback;
        Subscription(MediaBrowserCompat b,Folder owner,int page,MediaBrowserCompat.SubscriptionCallback c){browser=b;this.id=owner.id;this.owner=owner;this.page=page;callback=c;}
        void close(){if(browser.isConnected())browser.unsubscribe(id,callback);}
    }
    private final NativeMediaConnection connection;
    private final Runnable changed;
    private final Map<String,Folder> folders=new LinkedHashMap<>();
    private final List<Subscription> subscriptions=new ArrayList<>();
    private final Map<String,MediaBrowserCompat.MediaItem> destinations=new LinkedHashMap<>();
    private boolean closed;
    private int generation;
    Folder root;
    NativeBrowseRepository(NativeMediaConnection connection,Runnable changed){this.connection=connection;this.changed=changed;}
    void start(){
        closeSubscriptions(); folders.clear();destinations.clear();closed=false;generation=connection.generation();
        MediaBrowserCompat browser=connection.browser();
        root=new Folder(browser.getRoot(),"Deezer",null,style(browser.getExtras(),BROWSABLE,1),style(browser.getExtras(),PLAYABLE,1));
        folders.put(root.id,root);load(root);
    }
    List<MediaBrowserCompat.MediaItem> destinations(){return new ArrayList<>(destinations.values());}
    MediaBrowserCompat.MediaItem destination(String key){return destinations.get(key);}
    Folder destinationFolder(String key){MediaBrowserCompat.MediaItem item=destination(key);return item==null?null:folder(item,root);}
    Folder folder(MediaBrowserCompat.MediaItem item,Folder parent){
        String id=item.getMediaId();if(id==null)return null;
        Folder old=folders.get(id);if(old!=null)return old;
        Bundle extras=item.getDescription().getExtras();
        Folder f=new Folder(id,label(item.getDescription().getTitle()),item,style(extras,BROWSABLE,parent==null?1:parent.browsableStyle),style(extras,PLAYABLE,parent==null?1:parent.playableStyle));
        folders.put(id,f);load(f);return f;
    }
    void retry(Folder folder){if(folder!=null){if(folder.retry!=null)folder.retry.run();else if(!folder.id.isEmpty()){folder.failed=false;load(folder);}}}
    private void load(Folder folder){
        cancel(folder,false);folder.loading=true;folder.failed=false;
        loadPage(folder,0,++folder.run,folder.revision,new ArrayList<>());
    }
    private void cancel(Folder owner,boolean additionalOnly){
        for(Iterator<Subscription> i=subscriptions.iterator();i.hasNext();){Subscription s=i.next();if(s.owner==owner&&(!additionalOnly||s.page>0)){s.close();i.remove();}}
    }
    private void loadPage(Folder folder,int page,int run,int revision,List<MediaBrowserCompat.MediaItem> accumulated){
        if(closed||!connection.current(generation))return;
        MediaBrowserCompat browser=connection.browser();Bundle options=new Bundle();
        options.putInt("android.media.browse.extra.PAGE",page);options.putInt("android.media.browse.extra.PAGE_SIZE",PAGE_SIZE);
        MediaBrowserCompat.SubscriptionCallback callback=new MediaBrowserCompat.SubscriptionCallback(){
            boolean delivered;
            private boolean current(String id){return !closed&&connection.current(generation)&&folder.id.equals(id)&&folder.run==run&&(page==0||folder.revision==revision);}
            private void loaded(String id,List<MediaBrowserCompat.MediaItem> items){
                if(!current(id)||page>0&&delivered)return;delivered=true;
                int nextRevision=revision;
                List<MediaBrowserCompat.MediaItem> result=accumulated;
                if(page==0){cancel(folder,true);nextRevision=++folder.revision;result=new ArrayList<>();}
                else {browser.unsubscribe(id,this);subscriptions.removeIf(s->s.callback==this);}
                result.addAll(items);folder.items=Collections.unmodifiableList(new ArrayList<>(result));
                folder.failed=false;folder.loading=items.size()==PAGE_SIZE;
                if(folder==root)discoverRoots();
                changed.run();
                if(folder.loading)loadPage(folder,page+1,run,nextRevision,result);
            }
            @Override public void onChildrenLoaded(String id,List<MediaBrowserCompat.MediaItem> items){loaded(id,items);}
            @Override public void onChildrenLoaded(String id,List<MediaBrowserCompat.MediaItem> items,Bundle options){loaded(id,items);}
            @Override public void onError(String id){if(current(id)){folder.loading=false;folder.failed=true;changed.run();}}
            @Override public void onError(String id,Bundle options){onError(id);}
        };
        subscriptions.add(new Subscription(browser,folder,page,callback));
        browser.subscribe(folder.id,options,callback);
    }
    private void discoverRoots(){
        for(MediaBrowserCompat.MediaItem item:root.items){
            String id=item.getMediaId();if(id==null)continue;
            String key=id.endsWith("/home_parent")?"home":id.endsWith("/explore_parent")?"explore":id.endsWith("/favorites_parent")?"library":id.endsWith("/recently_played_parent")?"recents":null;
            if(key!=null)destinations.put(key,item);
        }
        destinationFolder("home");
    }
    List<Group> groups(Folder folder){
        if(folder==null)return Collections.emptyList();
        List<Group> result=new ArrayList<>();
        for(NativePageGroups.Part<MediaBrowserCompat.MediaItem> part:NativePageGroups.split(folder.items,NativeBrowseRepository::group))
            result.add(expand(part.title,part.items,folder));
        return result;
    }
    private Group expand(String title,List<MediaBrowserCompat.MediaItem> items,Folder parent){
        MediaBrowserCompat.MediaItem overflow=null;
        for(MediaBrowserCompat.MediaItem item:items)if(item.isBrowsable()&&item.getMediaId()!=null&&item.getMediaId().endsWith("_view_all")){overflow=item;break;}
        List<MediaBrowserCompat.MediaItem> output=items;
        Folder all=overflow==null?null:folder(overflow,parent);
        if(all!=null){if(!all.items.isEmpty())output=all.items;else if(!all.failed){output=new ArrayList<>(items);output.remove(overflow);}}
        boolean onlyBrowsable=true,onlyPlayable=true;
        for(MediaBrowserCompat.MediaItem item:output){onlyBrowsable&=item.isBrowsable();onlyPlayable&=!item.isBrowsable()&&item.isPlayable();}
        boolean grid=onlyBrowsable?parent.browsableStyle==2:onlyPlayable?parent.playableStyle==2:parent.browsableStyle==2&&parent.playableStyle==2;
        return new Group(title==null?"":title,Collections.unmodifiableList(new ArrayList<>(output)),grid,all);
    }
    void search(String query,java.util.function.BiConsumer<List<MediaBrowserCompat.MediaItem>,Boolean> result){
        if(!connection.current(generation)){result.accept(Collections.emptyList(),true);return;}
        final int captured=generation;
        connection.browser().search(query,new Bundle(),new MediaBrowserCompat.SearchCallback(){
            @Override public void onSearchResult(String q,Bundle extras,List<MediaBrowserCompat.MediaItem> items){if(!closed&&connection.current(captured))result.accept(items==null?Collections.emptyList():new ArrayList<>(items),false);}
            @Override public void onError(String q,Bundle extras){if(!closed&&connection.current(captured))result.accept(Collections.emptyList(),true);}
        });
    }
    void close(){closed=true;closeSubscriptions();folders.clear();destinations.clear();root=null;}
    private void closeSubscriptions(){for(Subscription s:subscriptions)s.close();subscriptions.clear();}
    static String group(MediaBrowserCompat.MediaItem item){Bundle b=item.getDescription().getExtras();if(b==null)return "";b.setClassLoader(NativeBrowseRepository.class.getClassLoader());return b.getString(GROUP,"");}
    static int style(Bundle b,String key,int fallback){if(b==null)return fallback;b.setClassLoader(NativeBrowseRepository.class.getClassLoader());return b.getInt(key,fallback);}
    static String label(CharSequence value){return value==null||value.length()==0?"Deezer":value.toString();}
}
