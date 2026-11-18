package app.afterglow.extension.ui;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.net.Uri;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.view.Window;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.MediaController;
import android.widget.ProgressBar;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.VideoView;

import app.afterglow.extension.downloads.DownloadLibrary;
import app.afterglow.extension.downloads.DownloadManager;
import app.afterglow.extension.downloads.DownloadRequest;
import app.afterglow.extension.downloads.LibraryItem;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

/** Small owned viewer for Vault media. Every read uses the app's read-only content provider. */
public final class VaultPlayerActivity extends Activity implements DownloadManager.Listener {
    public static final String EXTRA_ITEM_ID="afterglow_vault_item";
    private DownloadLibrary library;
    private LibraryItem item;
    private VaultViews views;
    private FrameLayout surface;
    private VideoView video;
    private int position;
    private boolean resumePlayback=true,prepared,foreground;
    private boolean viewerCreated;
    private DownloadManager manager;

    @Override protected void onCreate(Bundle state){
        super.onCreate(state);requestWindowFeature(Window.FEATURE_NO_TITLE);
        views=new VaultViews(this);manager=DownloadManager.get(this);library=manager.library();
        if(state!=null){position=state.getInt("position");resumePlayback=state.getBoolean("playing",true);}
        if(manager.isLoaded())createViewer();else setContentView(new ProgressBar(this));
    }
    @Override protected void onStart(){super.onStart();manager.addListener(this);onDownloadsChanged();}
    @Override protected void onStop(){manager.removeListener(this);super.onStop();}
    @Override public void onDownloadsChanged(){if(!viewerCreated&&manager.isLoaded()&&DownloadsUi.alive(this))createViewer();}
    private void createViewer(){
        viewerCreated=true;item=library.item(getIntent().getStringExtra(EXTRA_ITEM_ID));
        if(item==null||item.isMissing()){new android.app.AlertDialog.Builder(this).setTitle("Missing File").setMessage("This saved file is unavailable.").setPositiveButton("Close",(d,w)->finish()).setOnCancelListener(d->finish()).show();return;}
        LinearLayout root=views.column();root.setBackgroundColor(views.background);root.setFitsSystemWindows(true);
        LinearLayout bar=views.row();views.pad(bar,10,4,10,4);bar.addView(views.button("Done",this::finish),new LinearLayout.LayoutParams(views.dp(58),-2));
        TextView title=views.label(item.title,16,true);title.setMaxLines(2);title.setGravity(Gravity.CENTER);bar.addView(title,new LinearLayout.LayoutParams(0,-2,1));
        bar.addView(views.button("Share",()->DownloadsUi.shareItem(this,item)),new LinearLayout.LayoutParams(views.dp(60),-2));root.addView(bar);
        surface=new FrameLayout(this);surface.setBackgroundColor(Color.BLACK);root.addView(surface,new LinearLayout.LayoutParams(-1,0,1));
        TextView open=views.button("Open In…",()->DownloadsUi.openItemExternally(this,item));root.addView(open,new LinearLayout.LayoutParams(-1,views.dp(48)));
        setContentView(root);getWindow().setStatusBarColor(views.background);getWindow().setNavigationBarColor(views.background);
        Uri uri=library.uriForItem(item.id);if(uri==null){showError("This saved file is unavailable.");return;}
        if(item.kind==DownloadRequest.Kind.THUMBNAIL)showImage(uri);
        else if(item.kind==DownloadRequest.Kind.CAPTIONS)showCaptions(uri);
        else showPlayer(uri);
    }
    private void showPlayer(Uri uri){
        video=new VideoView(this);FrameLayout.LayoutParams lp=new FrameLayout.LayoutParams(-1,-1,Gravity.CENTER);surface.addView(video,lp);
        MediaController controls=new MediaController(this);controls.setAnchorView(surface);video.setMediaController(controls);
        ProgressBar loading=new ProgressBar(this);surface.addView(loading,new FrameLayout.LayoutParams(views.dp(40),views.dp(40),Gravity.CENTER));
        if(item.audioOnly){
            LinearLayout art=views.column();art.setGravity(Gravity.CENTER);views.pad(art,24,24,24,24);art.setBackgroundColor(views.background);
            ImageView image=new ImageView(this);image.setImageDrawable(new VaultViews.Icon("audio",views.accent));art.addView(image,new LinearLayout.LayoutParams(views.dp(180),views.dp(180)));views.thumbnail(image,item.thumbnailUrl);
            views.gap(art,20);TextView title=views.label(item.title,20,true);title.setGravity(Gravity.CENTER);art.addView(title);views.gap(art,8);TextView meta=views.text(VaultViews.value(item.channelName,item.formatSummary),13,views.secondary,false);meta.setGravity(Gravity.CENTER);art.addView(meta);
            surface.addView(art,new FrameLayout.LayoutParams(-1,-1));art.setOnClickListener(v->controls.show(0));
        }
        video.setOnPreparedListener(player->{prepared=true;loading.setVisibility(View.GONE);if(position>0)video.seekTo(position);if(resumePlayback&&foreground)video.start();if(foreground)controls.show(item.audioOnly?0:5000);library.markPlayed(item.id);});
        video.setOnCompletionListener(player->{resumePlayback=false;controls.show(0);});
        video.setOnErrorListener((player,what,extra)->{loading.setVisibility(View.GONE);showError("Android couldn't play this format. You can try Open In with another player.");return true;});
        video.setOnTouchListener((v,event)->{controls.show(5000);return false;});video.setVideoURI(uri);
    }
    private void showImage(Uri uri){
        ProgressBar loading=new ProgressBar(this);surface.addView(loading,new FrameLayout.LayoutParams(views.dp(40),views.dp(40),Gravity.CENTER));
        DownloadsUi.run(this,()->{
            BitmapFactory.Options options=new BitmapFactory.Options();options.inJustDecodeBounds=true;
            try(InputStream in=getContentResolver().openInputStream(uri)){BitmapFactory.decodeStream(in,null,options);}
            options.inSampleSize=1;while(options.outWidth/options.inSampleSize>2048||options.outHeight/options.inSampleSize>2048)options.inSampleSize*=2;options.inJustDecodeBounds=false;
            Bitmap bitmap;try(InputStream in=getContentResolver().openInputStream(uri)){bitmap=BitmapFactory.decodeStream(in,null,options);}
            VaultViews.MAIN.post(()->{if(!DownloadsUi.alive(this))return;surface.removeAllViews();if(bitmap==null){showError("The saved image couldn't be decoded.");return;}ImageView image=new ImageView(this);image.setScaleType(ImageView.ScaleType.FIT_CENTER);image.setImageBitmap(bitmap);surface.addView(image,new FrameLayout.LayoutParams(-1,-1));library.markPlayed(item.id);});
        });
    }
    private void showCaptions(Uri uri){
        surface.setBackgroundColor(views.background);ProgressBar loading=new ProgressBar(this);surface.addView(loading,new FrameLayout.LayoutParams(views.dp(40),views.dp(40),Gravity.CENTER));
        DownloadsUi.run(this,()->{
            ByteArrayOutputStream bytes=new ByteArrayOutputStream();boolean limited=false;
            try(InputStream in=getContentResolver().openInputStream(uri)){if(in==null)throw new java.io.IOException();byte[] buffer=new byte[8192];int n;while((n=in.read(buffer))!=-1){if(bytes.size()+n>2*1024*1024){limited=true;break;}bytes.write(buffer,0,n);}}
            final String content=new String(bytes.toByteArray(),StandardCharsets.UTF_8)+(limited?"\n\nPreview limited to 2 MB. Use Open In to read the full file.":"");
            VaultViews.MAIN.post(()->{if(!DownloadsUi.alive(this))return;surface.removeAllViews();ScrollView scroll=new ScrollView(this);TextView text=views.text(content,14,views.text,false);text.setTextIsSelectable(true);views.pad(text,16,16,16,24);scroll.addView(text);surface.addView(scroll,new FrameLayout.LayoutParams(-1,-1));library.markPlayed(item.id);});
        });
    }
    private void showError(String message){surface.removeAllViews();LinearLayout error=views.column();error.setGravity(Gravity.CENTER);views.pad(error,24,24,24,24);TextView text=views.text(message,16,Color.WHITE,false);text.setGravity(Gravity.CENTER);error.addView(text);surface.setBackgroundColor(Color.BLACK);surface.addView(error,new FrameLayout.LayoutParams(-1,-1));}
    @Override protected void onPause(){foreground=false;if(video!=null&&prepared){position=video.getCurrentPosition();resumePlayback=video.isPlaying();video.pause();}super.onPause();}
    @Override protected void onResume(){super.onResume();foreground=true;if(video!=null&&prepared&&resumePlayback)video.start();}
    @Override protected void onSaveInstanceState(Bundle state){super.onSaveInstanceState(state);if(video!=null&&prepared)position=video.getCurrentPosition();state.putInt("position",position);state.putBoolean("playing",video!=null&&prepared&&foreground?video.isPlaying():resumePlayback);}
    @Override protected void onDestroy(){if(video!=null)video.stopPlayback();super.onDestroy();}
}
