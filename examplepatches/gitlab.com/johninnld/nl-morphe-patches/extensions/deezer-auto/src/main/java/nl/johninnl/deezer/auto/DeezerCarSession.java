package nl.johninnl.deezer.auto;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.media.MediaBrowserCompat;
import android.support.v4.media.session.MediaSessionCompat;
import android.support.v4.media.session.PlaybackStateCompat;
import androidx.car.app.*;
import androidx.car.app.media.MediaConstants;
import androidx.car.app.media.MediaPlaybackManager;
import androidx.car.app.model.*;
import androidx.lifecycle.DefaultLifecycleObserver;
import androidx.lifecycle.LifecycleOwner;
import java.util.*;

/** UI ownership is separate from the application playback connection. */
final class DeezerCarSession extends Session implements NativeMediaConnection.Listener {
    NativeMediaConnection connection;
    NativeBrowseRepository repository;
    boolean destroyed,registered;
    String error;
    @Override public Screen onCreateScreen(Intent intent){
        getLifecycle().addObserver(new DefaultLifecycleObserver(){@Override public void onDestroy(LifecycleOwner owner){
            destroyed=true;registered=false;
            if(repository!=null)repository.close();
            if(connection!=null)connection.detach(DeezerCarSession.this);
        }});
        reconnect();
        return MediaConstants.ACTION_SHOW_MEDIA_PLAYBACK.equals(intent.getAction())?new CarScreens.Player(getCarContext(),this):new CarScreens.Home(getCarContext(),this,"home");
    }
    void reconnect(){
        ScreenManager screens=getCarContext().getCarService(ScreenManager.class);
        if(!screens.getScreenStack().isEmpty())screens.popToRoot();
        if(repository!=null)repository.close();
        if(connection!=null)connection.detach(this);
        registered=false;error=null;
        connection=NativeMediaConnection.get(getCarContext().getApplicationContext());
        repository=new NativeBrowseRepository(connection,this::refresh);
        connection.attach(this);
    }
    @Override public void connected(){
        if(destroyed||!connection.ready())return;
        try{
            getCarContext().getCarService(MediaPlaybackManager.class).registerMediaPlaybackToken(connection.browser().getSessionToken());
            registered=true;error=null;repository.start();refresh();
        }catch(RuntimeException failure){disconnected("Could not register Deezer playback. Reconnect to continue.");}
    }
    @Override public void changed(){refresh();}
    @Override public void disconnected(String reason){registered=false;error=reason;refresh();}
    @Override public void onNewIntent(Intent intent){if(MediaConstants.ACTION_SHOW_MEDIA_PLAYBACK.equals(intent.getAction()))showPlayer();}
    boolean ready(){return !destroyed&&registered&&connection!=null&&connection.ready();}
    void refresh(){
        if(destroyed)return;
        try{Screen top=getCarContext().getCarService(ScreenManager.class).getTop();if(top!=null)top.invalidate();}
        catch(IllegalStateException notCreatedYet){}
    }
    OnClickListener action(Screen screen,Runnable action){
        final NativeMediaConnection origin=connection;final int generation=origin==null?-1:origin.generation();
        return ()->{if(ready()&&connection==origin&&origin.current(generation)&&screen.getScreenManager().getTop()==screen)action.run();};
    }
    void showPlayer(){
        ScreenManager screens=getCarContext().getCarService(ScreenManager.class);
        if(screens.getTop() instanceof CarScreens.Player)return;
        for(Screen screen:screens.getScreenStack())if(screen instanceof CarScreens.Player){screens.popTo("deezer-player");return;}
        if(screens.getScreenStack().size()>=5)screens.popToRoot();
        screens.push(new CarScreens.Player(getCarContext(),this));
    }
    void showHome(String key){ScreenManager screens=getCarContext().getCarService(ScreenManager.class);screens.popToRoot();if(screens.getTop() instanceof CarScreens.Home)((CarScreens.Home)screens.getTop()).select(key);else screens.push(new CarScreens.Home(getCarContext(),this,key));}
    void showQueue(){ScreenManager screens=getCarContext().getCarService(ScreenManager.class);if(!(screens.getTop() instanceof CarScreens.Queue))screens.push(new CarScreens.Queue(getCarContext(),this));}
    void open(Screen owner,MediaBrowserCompat.MediaItem item,NativeBrowseRepository.Folder parent){
        if(item.isBrowsable()){
            ScreenManager screens=owner.getScreenManager();if(screens.getScreenStack().size()>=5)screens.popToRoot();
            screens.push(new CarScreens.Collection(getCarContext(),this,repository.folder(item,parent)));
        }
        else if(item.isPlayable()&&item.getMediaId()!=null){
            connection.notePlayRequest();Bundle extras=item.getDescription().getExtras();
            connection.controller().getTransportControls().playFromMediaId(item.getMediaId(),extras==null?new Bundle():new Bundle(extras));
            showPlayer();
        }
    }
    List<MediaSessionCompat.QueueItem> upcoming(){
        if(!ready())return Collections.emptyList();List<MediaSessionCompat.QueueItem> queue=connection.controller().getQueue();
        if(queue==null||queue.isEmpty())return Collections.emptyList();
        PlaybackStateCompat state=connection.controller().getPlaybackState();long active=state==null?-1:state.getActiveQueueItemId();
        for(int i=0;i<queue.size();i++)if(queue.get(i).getQueueId()==active)return new ArrayList<>(queue.subList(i+1,queue.size()));
        return new ArrayList<>(queue);
    }
    Template pending(Screen owner){
        MessageTemplate.Builder b=new MessageTemplate.Builder(error==null?"Connecting to Deezer…":error).setTitle("Deezer").setHeaderAction(Action.APP_ICON);
        if(error==null)b.setLoading(true);else b.addAction(new Action.Builder().setTitle("Reconnect").setOnClickListener(()->{if(!destroyed&&owner.getScreenManager().getTop()==owner)reconnect();}).build());
        return b.build();
    }
}
