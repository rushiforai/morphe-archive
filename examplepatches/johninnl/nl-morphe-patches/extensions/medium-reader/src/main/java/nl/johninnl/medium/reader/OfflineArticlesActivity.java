package nl.johninnl.medium.reader;

import android.app.Activity;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.Typeface;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.method.LinkMovementMethod;
import android.text.style.StyleSpan;
import android.text.style.TypefaceSpan;
import android.text.style.URLSpan;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.*;
import java.io.File;
import java.text.DateFormat;
import java.util.*;
import java.util.concurrent.RejectedExecutionException;

/** Read-only editorial snapshots, independent of feed, account requests and connectivity. */
public final class OfflineArticlesActivity extends Activity {
    private final Handler main = new Handler(Looper.getMainLooper());
    private List<BodyCache.Entry> entries = Collections.emptyList();
    private ListView list;
    private TextView title;
    private boolean articleOpen;
    private int generation;
    private int foreground;
    private int background;
    private Button saveImages;
    private BodyCache.Entry selected;
    private Cancellation download;

    @Override public void onCreate(Bundle state) {
        super.onCreate(state); ReaderBootstrap.initialize(this);
        applyStyle("UserTextSizePreference.Large");
        boolean dark = (getResources().getConfiguration().uiMode & 48) == 32;
        foreground = dark ? 0xffeeeeee : 0xff222222; background = dark ? 0xff191919 : 0xffffffff;
        LinearLayout root = new LinearLayout(this); root.setOrientation(1); root.setBackgroundColor(background);
        root.setOnApplyWindowInsetsListener((view,insets)->{
            android.graphics.Insets bars=insets.getInsets(android.view.WindowInsets.Type.systemBars());
            root.setPadding(bars.left,bars.top+dp(4),bars.right,bars.bottom+dp(4));
            return insets;
        });
        LinearLayout toolbar = new LinearLayout(this); toolbar.setGravity(Gravity.CENTER_VERTICAL);
        Button back = new Button(this); back.setText("Back"); back.setOnClickListener(v -> onBackPressed()); toolbar.addView(back);
        title = new TextView(this); title.setText("Offline articles"); title.setTextColor(foreground); title.setTextSize(18);
        toolbar.addView(title,new LinearLayout.LayoutParams(0,-2,1));root.addView(toolbar);
        saveImages = new Button(this); saveImages.setText("Save images"); saveImages.setVisibility(View.GONE);
        saveImages.setOnClickListener(v -> saveSelectedImages()); toolbar.addView(saveImages);
        list = new ListView(this); list.setDivider(null); list.setCacheColorHint(Color.TRANSPARENT); root.addView(list,new LinearLayout.LayoutParams(-1,0,1));
        TextView note = new TextView(this); note.setText("Saved snapshots · Account actions are available in the online reader"); note.setTextColor(foreground); note.setTextSize(12); note.setPadding(dp(16),dp(6),dp(16),0); root.addView(note);
        setContentView(root); root.requestApplyInsets(); load();
    }
    private void applyStyle(String name) { int id=getResources().getIdentifier(name,"style",getPackageName());if(id!=0)getTheme().applyStyle(id,true); }
    private int dp(int value) { return (int)(value*getResources().getDisplayMetrics().density); }
    private void load() {
        int request = ++generation; title.setText("Loading saved articles…");
        try { ReaderRuntime.workers().execute(() -> {
            List<BodyCache.Entry> saved;
            try { ArticleLoader loader = ReaderRuntime.loader(); saved = loader instanceof CachedArticleLoader ? ((CachedArticleLoader)loader).saved() : Collections.emptyList(); }
            catch (java.io.IOException failure) { saved=Collections.emptyList(); }
            List<BodyCache.Entry> result=saved;
            main.post(() -> { if(isDestroyed()||request!=generation)return;entries=result;showShelf(); });
        }); } catch(RejectedExecutionException busy) { title.setText("Reader is busy · reopen shortly"); }
    }
    private void showShelf() {
        articleOpen=false;selected=null;saveImages.setVisibility(View.GONE);generation++;title.setText(entries.isEmpty()?"No saved articles yet":"Offline articles ("+entries.size()+")");
        list.setOnItemClickListener((parent,view,position,id)->showArticle(entries.get(position)));
        list.setAdapter(new BaseAdapter() {
            public int getCount(){return entries.size();}public Object getItem(int p){return entries.get(p);}public long getItemId(int p){return p;}
            public View getView(int position,View recycled,ViewGroup parent){
                TextView row=new TextView(OfflineArticlesActivity.this);BodyCache.Entry entry=entries.get(position);
                row.setText((entry.body.title==null||entry.body.title.isEmpty()?entry.body.postId:entry.body.title)+"\nSaved "+DateFormat.getDateTimeInstance().format(new Date(entry.fetchedAtMillis)));
                row.setTextColor(foreground);row.setTextSize(18);row.setPadding(dp(20),dp(18),dp(20),dp(18));return row;
            }
        });
    }
    private TextView text(String style,CharSequence value) {
        TextView view=new TextView(this);int id=getResources().getIdentifier(style,"style",getPackageName());if(id!=0)view.setTextAppearance(this,id);
        view.setTextColor(foreground);view.setText(value);view.setTextIsSelectable(true);view.setMovementMethod(LinkMovementMethod.getInstance());
        view.setPadding(dp(20),dp(10),dp(20),dp(10));return view;
    }
    private void showArticle(BodyCache.Entry entry) {
        articleOpen=true;selected=entry;saveImages.setVisibility(View.VISIBLE);int render=++generation;title.setText("Saved article");list.setOnItemClickListener(null);
        list.setAdapter(new BaseAdapter() {
            public int getCount(){return entry.body.blocks.size()+1;}public Object getItem(int p){return p==0?entry:entry.body.blocks.get(p-1);}public long getItemId(int p){return p;}
            public int getViewTypeCount(){return 2;}public int getItemViewType(int p){return p>0&&entry.body.blocks.get(p-1).image!=null?1:0;}
            public View getView(int position,View recycled,ViewGroup parent) {
                if(position==0) {
                    LinearLayout heading=new LinearLayout(OfflineArticlesActivity.this);heading.setOrientation(1);
                    heading.addView(text("TextStyle.StoryH3",entry.body.title==null?entry.body.postId:entry.body.title));
                    heading.addView(text("TextStyle.Detail.S.Lighter","Saved snapshot · "+DateFormat.getDateTimeInstance().format(new Date(entry.fetchedAtMillis))));return heading;
                }
                ArticleBody.Block block=entry.body.blocks.get(position-1);
                if(block.type.equals("HR")){View line=new View(OfflineArticlesActivity.this);line.setBackgroundColor(0xff777777);line.setLayoutParams(new AbsListView.LayoutParams(-1,dp(1)));return line;}
                int number=1;
                if(block.type.equals("OLI"))for(int previous=position-2;previous>=0&&entry.body.blocks.get(previous).type.equals("OLI");previous--)number++;
                String prefix=block.type.equals("ULI")?"• ":block.type.equals("OLI")?number+". ":"";
                SpannableStringBuilder formatted=new SpannableStringBuilder(prefix+block.text);
                for(ArticleBody.Markup markup:block.markups) {
                    Object span=markup.type.equals("STRONG")?new StyleSpan(Typeface.BOLD):markup.type.equals("EM")?new StyleSpan(Typeface.ITALIC):markup.type.equals("CODE")?new TypefaceSpan("monospace"):markup.type.equals("A")?new URLSpan(markup.href):null;
                    if(span!=null&&markup.start>=0&&markup.end<=block.text.length())formatted.setSpan(span,prefix.length()+markup.start,prefix.length()+markup.end,Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                }
                String style=block.type.matches("H[123]")?"TextStyle.StoryH3":block.type.equals("H4")?"TextStyle.StoryH4":block.type.equals("PQ")?"TextStyle.StoryPullQuote":block.type.equals("PRE")?"TextStyle.StoryPre":block.type.equals("SECTION_CAPTION")?"TextStyle.StoryMediaCaption":"TextStyle.StoryBodyIceland";
                if(block.type.equals("BQ")&&formatted.length()>0)formatted.setSpan(new android.text.style.QuoteSpan(foreground),0,formatted.length(),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                TextView paragraph=text(style,formatted);
                if(block.type.equals("PRE")){paragraph.setTypeface(Typeface.MONOSPACE);paragraph.setBackgroundColor((background&0xff000000)|0x282828);}
                if(block.image==null)return paragraph;
                LinearLayout row=new LinearLayout(OfflineArticlesActivity.this);row.setOrientation(1);
                ImageView image=new ImageView(OfflineArticlesActivity.this);image.setAdjustViewBounds(true);image.setScaleType(ImageView.ScaleType.FIT_CENTER);image.setContentDescription(block.image.alt);image.setTag(block.image.url.toString());row.addView(image,new LinearLayout.LayoutParams(-1,-2));
                TextView missing=text("TextStyle.Detail.S.Lighter","Image not saved offline");row.addView(missing);row.addView(paragraph);
                try { ReaderRuntime.workers().execute(() -> {
                    Bitmap bitmap=null;
                    try {
                        File file=ReaderImages.cachedFile(block.image);
                        if(file!=null) {
                            BitmapFactory.Options bounds=new BitmapFactory.Options();bounds.inJustDecodeBounds=true;BitmapFactory.decodeFile(file.getAbsolutePath(),bounds);
                            BitmapFactory.Options options=new BitmapFactory.Options();options.inSampleSize=1;int target=Math.min(1400,getResources().getDisplayMetrics().widthPixels);
                            while(Math.max(bounds.outWidth,bounds.outHeight)/options.inSampleSize>target*2)options.inSampleSize*=2;
                            bitmap=BitmapFactory.decodeFile(file.getAbsolutePath(),options);
                        }
                    } catch(ArticleException failure) { }
                    Bitmap result=bitmap;
                    main.post(() -> {if(isDestroyed()||render!=generation){if(result!=null)result.recycle();return;}if(result!=null){image.setImageBitmap(result);missing.setVisibility(View.GONE);}});
                }); } catch(RejectedExecutionException busy) { }
                return row;
            }
        });list.setSelection(0);
    }
    private void saveSelectedImages() {
        BodyCache.Entry entry=selected; if(entry==null)return;
        android.net.ConnectivityManager manager=(android.net.ConnectivityManager)getSystemService(CONNECTIVITY_SERVICE);
        if(manager==null||manager.getActiveNetwork()==null){Toast.makeText(this,"Connect to save missing images",Toast.LENGTH_SHORT).show();return;}
        if(download!=null)download.cancel();download=new Cancellation();Cancellation token=download;
        saveImages.setEnabled(false);Toast.makeText(this,"Saving article images…",Toast.LENGTH_SHORT).show();
        try{ReaderRuntime.workers().execute(()->{
            String message;
            try{int[] done=ReaderImages.saveOffline(entry.body,token);message="Images saved: "+done[0]+" of "+done[1];}
            catch(ArticleException failed){message=failed.code.equals("CANCELLED")?"Image saving cancelled":"Could not save every image";}
            String result=message;main.post(()->{if(!isDestroyed()){
                saveImages.setEnabled(true);
                if(articleOpen&&selected==entry){int position=list.getFirstVisiblePosition();View first=list.getChildAt(0);int offset=first==null?0:first.getTop();showArticle(entry);list.setSelectionFromTop(position,offset);}
                Toast.makeText(OfflineArticlesActivity.this,result,Toast.LENGTH_LONG).show();
            }});
        });}catch(RejectedExecutionException busy){saveImages.setEnabled(true);Toast.makeText(this,"Reader is busy",Toast.LENGTH_SHORT).show();}
    }
    @Override public void onBackPressed(){if(articleOpen)showShelf();else super.onBackPressed();}
    @Override public void onDestroy(){generation++;if(download!=null)download.cancel();super.onDestroy();}
}
