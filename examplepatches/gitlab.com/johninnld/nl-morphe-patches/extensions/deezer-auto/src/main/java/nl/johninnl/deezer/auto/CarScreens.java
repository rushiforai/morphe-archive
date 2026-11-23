package nl.johninnl.deezer.auto;

import android.os.Bundle;
import android.support.v4.media.MediaBrowserCompat;
import android.support.v4.media.MediaDescriptionCompat;
import android.support.v4.media.session.MediaSessionCompat;
import android.support.v4.media.session.PlaybackStateCompat;
import androidx.car.app.*;
import androidx.car.app.media.model.MediaPlaybackStyle;
import androidx.car.app.media.model.MediaPlaybackTemplate;
import androidx.car.app.model.*;
import java.util.*;

/** Native CAL composition. Section delegates own scrolling/paging; there are no page commands. */
final class CarScreens {
    private static final CarColor ACCENT=CarColor.createCustom(0xffa238ff,0xffa238ff);
    private static final CarColor DARK=CarColor.createCustom(0xff28232e,0xff28232e);
    private static final CarColor WHITE=CarColor.createCustom(0xffffffff,0xffffffff);
    private static Header header(Screen screen,DeezerCarSession session,String title,boolean root){
        Header.Builder h=new Header.Builder().setTitle(title).setStartHeaderAction(root?Action.APP_ICON:Action.BACK);
        h.addEndHeaderAction(new Action.Builder().setTitle("Search").setOnClickListener(session.action(screen,()->screen.getScreenManager().push(new Search(screen.getCarContext(),session)))).build());
        if(!session.upcoming().isEmpty())h.addEndHeaderAction(new Action.Builder().setTitle("Up next").setOnClickListener(session.action(screen,session::showQueue)).build());
        return h.build();
    }
    private static SectionedItemTemplate.Builder sectioned(Screen screen,DeezerCarSession session,String title,boolean root){
        SectionedItemTemplate.Builder b=new SectionedItemTemplate.Builder().setHeader(header(screen,session,title,root));
        if(screen.getCarContext().getCarAppApiLevel()<9)b.addAction(Action.MEDIA_PLAYBACK);
        return b;
    }
    private static RowSection info(String text){return new RowSection.Builder().addItem(new Row.Builder().setTitle(text).build()).build();}
    private static RowSection retry(Screen screen,DeezerCarSession session,NativeBrowseRepository.Folder folder){
        return new RowSection.Builder().addItem(new Row.Builder().setTitle(folder.items.isEmpty()?"Could not load "+folder.title:"Could not load all of "+folder.title).addText("Retry")
            .setOnClickListener(session.action(screen,()->{session.repository.retry(folder);screen.invalidate();})).build()).build();
    }
    private static void append(Screen screen,DeezerCarSession session,SectionedItemTemplate.Builder template,NativeBrowseRepository.Folder folder){
        if(folder==null){
            NativeBrowseRepository.Folder root=session.repository.root;
            if(root!=null&&root.failed)template.addSection(retry(screen,session,root));
            else template.addSection(info(root==null||root.loading?"Loading Deezer…":"Deezer has not provided this destination"));
            return;
        }
        if(folder.items.isEmpty()){
            if(folder.failed)template.addSection(retry(screen,session,folder));
            else template.addSection(info(folder.loading?"Loading Deezer…":"No items in this collection"));
            return;
        }
        for(NativeBrowseRepository.Group group:session.repository.groups(folder)){
            if(group.items.isEmpty())continue;
            if(screen.getCarContext().getCarAppApiLevel()>=9&&group.title.toLowerCase(Locale.ROOT).startsWith("flow")){
                CondensedSection.Builder section=new CondensedSection.Builder().setTitle(group.title)
                    .setIncompleteLastRowStrategy(CondensedSection.INCOMPLETE_LAST_ROW_AS_IS);
                for(MediaBrowserCompat.MediaItem item:group.items){
                    CondensedItem.Builder tile=new CondensedItem.Builder().setTitle(NativeBrowseRepository.label(item.getDescription().getTitle()));
                    CarIcon icon=CarArtwork.icon(screen.getCarContext(),item.getDescription());
                    if(icon!=null)tile.setLeadingImage(icon,CondensedItem.IMAGE_TYPE_MEDIUM);
                    if(item.isBrowsable()||item.isPlayable())tile.setOnClickListener(session.action(screen,()->session.open(screen,item,folder)));
                    section.addItem(tile.build());
                }
                template.addSection(section.build());
            }else if(group.grid){
                GridSection.Builder section=new GridSection.Builder().setItemSize(GridSection.ITEM_SIZE_LARGE);
                if(!group.title.isEmpty())section.setTitle(group.title);
                if(screen.getCarContext().getCarAppApiLevel()>=9)section.setIncompleteLastRowStrategy(GridSection.INCOMPLETE_LAST_ROW_AS_IS);
                boolean artists=true;
                for(MediaBrowserCompat.MediaItem item:group.items){Bundle e=item.getDescription().getExtras();if(e==null||e.getLong("android.media.extra.BT_FOLDER_TYPE",-1)!=3)artists=false;}
                if(artists)section.setItemImageShape(GridSection.ITEM_IMAGE_SHAPE_CIRCLE);
                for(MediaBrowserCompat.MediaItem item:group.items){
                    MediaDescriptionCompat d=item.getDescription();GridItem.Builder tile=new GridItem.Builder().setTitle(NativeBrowseRepository.label(d.getTitle()));
                    if(d.getSubtitle()!=null&&d.getSubtitle().length()>0)tile.setText(d.getSubtitle());
                    CarIcon icon=CarArtwork.icon(screen.getCarContext(),d);if(icon!=null)tile.setImage(icon);
                    if(item.isBrowsable()||item.isPlayable())tile.setOnClickListener(session.action(screen,()->session.open(screen,item,folder)));
                    section.addItem(tile.build());
                }
                template.addSection(section.build());
            }else{
                RowSection.Builder section=new RowSection.Builder();if(!group.title.isEmpty())section.setTitle(group.title);
                for(MediaBrowserCompat.MediaItem item:group.items){
                    MediaDescriptionCompat d=item.getDescription();Row.Builder row=new Row.Builder().setTitle(NativeBrowseRepository.label(d.getTitle())).setBrowsable(item.isBrowsable());
                    if(d.getSubtitle()!=null&&d.getSubtitle().length()>0)row.addText(d.getSubtitle());
                    CarIcon icon=CarArtwork.icon(screen.getCarContext(),d);if(icon!=null)row.setImage(icon,CarArtwork.resource(d)?Row.IMAGE_TYPE_SMALL:Row.IMAGE_TYPE_LARGE);
                    if(item.isBrowsable()||item.isPlayable())row.setOnClickListener(session.action(screen,()->session.open(screen,item,folder)));
                    section.addItem(row.build());
                }
                template.addSection(section.build());
            }
            if(group.expanded!=null&&group.expanded.failed)template.addSection(retry(screen,session,group.expanded));
        }
        if(folder.failed)template.addSection(retry(screen,session,folder));
    }
    static final class Home extends Screen {
        final DeezerCarSession session;String selected;
        Home(CarContext context,DeezerCarSession session,String selected){super(context);this.session=session;this.selected=selected;}
        void select(String key){selected=key;invalidate();}
        @Override public Template onGetTemplate(){
            if(!session.ready())return session.pending(this);
            SectionedItemTemplate.Builder template=sectioned(this,session,"Deezer",true);
            if(getCarContext().getCarAppApiLevel()>=9){
                ChipSection.Builder nav=new ChipSection.Builder();int count=0;
                for(String key:new String[]{"home","explore","library","recents"}){
                    MediaBrowserCompat.MediaItem item=session.repository.destination(key);if(item==null)continue;count++;
                    boolean active=selected.equals(key);CarColor fill=active?ACCENT:DARK;
                    nav.addItem(new Chip.Builder().setTitle(NativeBrowseRepository.label(item.getDescription().getTitle())).setSelected(active)
                        .setStyle(new ChipStyle.Builder().setShape(Shape.CORNER_FULL).setBackgroundColor(fill).setOutlineColor(active?ACCENT:WHITE).setContentColor(WHITE).build())
                        .setOnClickListener(session.action(this,()->select(key))).build());
                }
                if(count>0)template.addSection(nav.build());
            }else{
                RowSection.Builder nav=new RowSection.Builder();int count=0;
                for(String key:new String[]{"home","explore","library","recents"}){MediaBrowserCompat.MediaItem item=session.repository.destination(key);if(item!=null){count++;nav.addItem(new Row.Builder().setTitle(NativeBrowseRepository.label(item.getDescription().getTitle())).setOnClickListener(session.action(this,()->select(key))).build());}}
                if(count>0)template.addSection(nav.build());
            }
            append(this,session,template,session.repository.destinationFolder(selected));
            return template.build();
        }
    }
    static final class Collection extends Screen {
        final DeezerCarSession session;final NativeBrowseRepository.Folder folder;
        Collection(CarContext context,DeezerCarSession session,NativeBrowseRepository.Folder folder){super(context);this.session=session;this.folder=folder;}
        @Override public Template onGetTemplate(){if(!session.ready())return session.pending(this);SectionedItemTemplate.Builder t=sectioned(this,session,folder==null?"Deezer":folder.title,false);append(this,session,t,folder);return t.build();}
    }
    static final class Player extends Screen {
        final DeezerCarSession session;
        Player(CarContext context,DeezerCarSession session){super(context);this.session=session;setMarker("deezer-player");}
        @Override public Template onGetTemplate(){
            if(!session.ready())return session.pending(this);
            Header.Builder h=new Header.Builder().setTitle("Deezer").setStartHeaderAction(Action.BACK)
                .addEndHeaderAction(new Action.Builder().setTitle("Library").setOnClickListener(session.action(this,()->session.showHome("library"))).build());
            if(!session.upcoming().isEmpty())h.addEndHeaderAction(new Action.Builder().setTitle("Up next").setOnClickListener(session.action(this,session::showQueue)).build());
            MediaPlaybackTemplate.Builder t=new MediaPlaybackTemplate.Builder().setHeader(h.build());
            if(getCarContext().getCarAppApiLevel()>=9)t.setStyle(new MediaPlaybackStyle.Builder().setMediaAccentColor(ACCENT).setProgressBarStrokeCap(StrokeCap.ROUND).build());
            return t.build();
        }
    }
    static final class Queue extends Screen {
        final DeezerCarSession session;
        Queue(CarContext context,DeezerCarSession session){super(context);this.session=session;}
        @Override public Template onGetTemplate(){
            if(!session.ready())return session.pending(this);
            RowSection.Builder rows=new RowSection.Builder();List<MediaSessionCompat.QueueItem> queue=session.upcoming();
            PlaybackStateCompat state=session.connection.controller().getPlaybackState();boolean selectable=state!=null&&(state.getActions()&PlaybackStateCompat.ACTION_SKIP_TO_QUEUE_ITEM)!=0;
            for(MediaSessionCompat.QueueItem item:queue){MediaDescriptionCompat d=item.getDescription();Row.Builder row=new Row.Builder().setTitle(NativeBrowseRepository.label(d.getTitle()));
                if(d.getSubtitle()!=null&&d.getSubtitle().length()>0)row.addText(d.getSubtitle());CarIcon icon=CarArtwork.icon(getCarContext(),d);if(icon!=null)row.setImage(icon,Row.IMAGE_TYPE_LARGE);
                if(selectable)row.setOnClickListener(session.action(this,()->{PlaybackStateCompat current=session.connection.controller().getPlaybackState();if(current!=null&&(current.getActions()&PlaybackStateCompat.ACTION_SKIP_TO_QUEUE_ITEM)!=0){session.connection.notePlayRequest();session.connection.controller().getTransportControls().skipToQueueItem(item.getQueueId());}}));
                rows.addItem(row.build());}
            if(queue.isEmpty())rows.addItem(new Row.Builder().setTitle("Deezer has no upcoming queue").build());
            SectionedItemTemplate.Builder t=new SectionedItemTemplate.Builder().setHeader(new Header.Builder().setTitle("Up next").setStartHeaderAction(Action.BACK).build());
            if(!selectable&&!queue.isEmpty())t.addSection(info("Queue selection is currently unavailable"));
            return t.addSection(rows.build()).build();
        }
    }
    static final class Search extends Screen {
        final DeezerCarSession session;String query="";boolean loading,failed;int request;
        List<MediaBrowserCompat.MediaItem> items=Collections.emptyList();
        final android.os.Handler main=new android.os.Handler(android.os.Looper.getMainLooper());
        Runnable pending;
        Search(CarContext context,DeezerCarSession session){super(context);this.session=session;
            getLifecycle().addObserver(new androidx.lifecycle.DefaultLifecycleObserver(){@Override public void onDestroy(androidx.lifecycle.LifecycleOwner o){request++;if(pending!=null)main.removeCallbacks(pending);}});}
        private void search(String value){query=value;int expected=++request;items=Collections.emptyList();failed=false;loading=!value.trim().isEmpty();invalidate();
            if(!loading)return;session.repository.search(value,(rows,error)->{if(expected!=request)return;items=rows;failed=error;loading=false;invalidate();});}
        @Override public Template onGetTemplate(){
            if(!session.ready())return session.pending(this);
            SearchTemplate.Builder t=new SearchTemplate.Builder(new SearchTemplate.SearchCallback(){
                @Override public void onSearchTextChanged(String text){query=text;request++;if(pending!=null)main.removeCallbacks(pending);pending=()->search(text);main.postDelayed(pending,350);}
                @Override public void onSearchSubmitted(String text){if(pending!=null)main.removeCallbacks(pending);if(!text.trim().isEmpty())getScreenManager().push(new SearchResults(getCarContext(),session,text));}
            }).setHeaderAction(Action.BACK).setInitialSearchText(query).setSearchHint("Search Deezer").setShowKeyboardByDefault(true);
            if(loading)return t.setLoading(true).build();
            ItemList.Builder rows=new ItemList.Builder().setNoItemsMessage(query.isEmpty()?"Search for music, artists, albums or playlists":failed?"Deezer could not return search results":"No results");
            int limit=Math.max(1,getCarContext().getCarService(androidx.car.app.constraints.ConstraintManager.class).getContentLimit(androidx.car.app.constraints.ConstraintManager.CONTENT_LIMIT_TYPE_LIST));
            for(MediaBrowserCompat.MediaItem item:items.subList(0,Math.min(limit,items.size()))){MediaDescriptionCompat d=item.getDescription();Row.Builder row=new Row.Builder().setTitle(NativeBrowseRepository.label(d.getTitle())).setBrowsable(item.isBrowsable());if(d.getSubtitle()!=null)row.addText(d.getSubtitle());CarIcon icon=CarArtwork.icon(getCarContext(),d);if(icon!=null)row.setImage(icon,Row.IMAGE_TYPE_LARGE);row.setOnClickListener(session.action(this,()->session.open(this,item,null)));rows.addItem(row.build());}
            return t.setItemList(rows.build()).build();
        }
    }
    static final class SearchResults extends Screen {
        final DeezerCarSession session;
        final NativeBrowseRepository.Folder results;
        boolean destroyed;
        SearchResults(CarContext context,DeezerCarSession session,String query){
            super(context);this.session=session;results=new NativeBrowseRepository.Folder("",query,null,2,1);
            getLifecycle().addObserver(new androidx.lifecycle.DefaultLifecycleObserver(){@Override public void onDestroy(androidx.lifecycle.LifecycleOwner owner){destroyed=true;}});
            results.retry=()->load(query);load(query);
        }
        void load(String query){results.loading=true;results.failed=false;session.repository.search(query,(rows,error)->{if(destroyed)return;results.items=rows;results.loading=false;results.failed=error;invalidate();});}
        @Override public Template onGetTemplate(){if(!session.ready())return session.pending(this);SectionedItemTemplate.Builder t=sectioned(this,session,results.title,false);append(this,session,t,results);return t.build();}
    }

}
