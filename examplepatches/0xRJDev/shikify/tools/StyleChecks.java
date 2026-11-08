import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.content.res.AssetManager;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.BackgroundColorSpan;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;
import java.lang.reflect.Field;
import java.lang.reflect.Proxy;
import java.util.Map;

/** Inflate actual candidate resources with actual Boost widgets. No app install/navigation. */
public final class StyleChecks {
    static int checks;
    static ClassLoader loader;
    static Context context;
    static boolean omitWebView;
    static boolean omitProgressSpinner;
    static boolean omitProfileServices;
    static String indentMode,colorPattern;
    static void check(boolean value,String label) { if(!value)throw new AssertionError(label);checks++;System.out.println("PASS: "+label); }
    static int id(String name) { return context.getResources().getIdentifier(name,"id",context.getPackageName()); }
    static View find(View root,String name) { return root.findViewById(id(name)); }
    static Object allocate(Class<?> type) throws Exception {
        Class<?> unsafe=Class.forName("sun.misc.Unsafe");
        for(Field f:unsafe.getDeclaredFields())if(f.getType()==unsafe){f.setAccessible(true);return unsafe.getMethod("allocateInstance",Class.class).invoke(f.get(null),type);}
        throw new AssertionError("Unsafe unavailable");
    }
    static void settings() throws Exception {
        Class<?> type=Class.forName("ps2",true,loader);Object settings=allocate(type);
        SharedPreferences preferences=(SharedPreferences)Proxy.newProxyInstance(loader,new Class<?>[]{SharedPreferences.class},(proxy,method,args)->{
            if(method.getName().equals("getString") && args!=null && args.length==2) {
                if("pref_indent_style".equals(args[0]) && indentMode!=null)return indentMode;
                if("pref_comments_color_pattern".equals(args[0]) && colorPattern!=null)return colorPattern;
            }
            if(method.getName().equals("contains"))return false;
            if(method.getName().equals("getAll"))return java.util.Collections.emptyMap();
            if(args!=null && args.length==2)return args[1];return null;
        });
        Field a=type.getDeclaredField("a");a.setAccessible(true);a.set(settings,preferences);
        Field b=type.getDeclaredField("b");b.setAccessible(true);b.set(null,settings);
    }
    static Context candidateContext(Context base,String apk,boolean dark) throws Exception {
        AssetManager assets=AssetManager.class.getConstructor().newInstance();
        AssetManager.class.getMethod("addAssetPath",String.class).invoke(assets,apk);
        Configuration config=new Configuration(base.getResources().getConfiguration());
        config.uiMode=(config.uiMode & ~Configuration.UI_MODE_NIGHT_MASK)|(dark ? Configuration.UI_MODE_NIGHT_YES:Configuration.UI_MODE_NIGHT_NO);
        Resources res=new Resources(assets,base.getResources().getDisplayMetrics(),config);
        ContextWrapper wrapper=new ContextWrapper(base) {
            @Override public Resources getResources(){return res;}
            @Override public AssetManager getAssets(){return assets;}
            @Override public ClassLoader getClassLoader(){return loader;}
            @Override public String getPackageName(){return "com.rubenmayayo.reddit";}
        };
        Context themed=new android.view.ContextThemeWrapper(wrapper,res.getIdentifier(dark ? "MaterialDarkTheme.Dynamic":"MaterialLightTheme.Dynamic","style",wrapper.getPackageName()));
        // Boost applies these native user-size overlays after choosing its colour theme.
        for(String name:new String[]{"FontStyle.Medium","FontStyle.Title.Medium"})themed.getTheme().applyStyle(res.getIdentifier(name,"style",wrapper.getPackageName()),true);
        return themed;
    }
    static View inflate(String name) throws Exception {
        LayoutInflater inflater=LayoutInflater.from(RuntimeUiChecks.context).cloneInContext(context);
        inflater.setFactory2(new LayoutInflater.Factory2(){
            public View onCreateView(View parent,String name,Context ctx,android.util.AttributeSet attrs){return onCreateView(name,ctx,attrs);}
            public View onCreateView(String name,Context ctx,android.util.AttributeSet attrs){
                if(omitProfileServices && name.equals("com.rubenmayayo.reddit.ui.customviews.UserInfoView")){android.widget.FrameLayout header=new android.widget.FrameLayout(ctx,attrs);inflater.inflate(ctx.getResources().getIdentifier("view_user_info","layout",ctx.getPackageName()),header,true);return header;}
                if(omitProfileServices && name.equals("com.rubenmayayo.reddit.ui.customviews.SearchOptionsView"))return new android.widget.FrameLayout(ctx,attrs);
                if(omitWebView && (name.equals("WebView") || name.equals("android.webkit.WebView")))return new View(ctx,attrs);
                if(omitProgressSpinner && name.equals("com.pnikosis.materialishprogress.ProgressWheel"))return new View(ctx,attrs);
                if(!name.contains("."))return null;
                try{return (View)Class.forName(name,true,loader).getConstructor(Context.class,android.util.AttributeSet.class).newInstance(ctx,attrs);}
                catch(Exception error){throw new RuntimeException("Inflating "+name,error);}
            }
        });
        return inflater.inflate(context.getResources().getIdentifier(name,"layout",context.getPackageName()),null);
    }
    public static final class Holder {
        public Object P;
        public View a,commentContainer,commentTv,authorRichFlairTv,indentView,awardsView;
        public TextView authorTv,authorTagTv,distinguishedTv,scoreTv,timeTv,collapsedTv,plusCollapsedTv;
        public ImageView authorAvatarIv;
        public View thumbnailIv,title,infoTop,commentsTv,voteUpButton,voteDownButton,overFlowButton;
    }
    static Holder comment(View root) {
        Holder h=new Holder();h.a=root;h.commentContainer=find(root,"item_comment_container");h.commentTv=find(root,"item_comment_body");
        h.authorTv=(TextView)find(root,"item_comment_author");h.scoreTv=(TextView)find(root,"item_comment_score");h.timeTv=(TextView)find(root,"item_comment_time");
        h.authorTagTv=(TextView)find(root,"item_comment_author_tag");h.distinguishedTv=(TextView)find(root,"item_comment_distinguished");h.collapsedTv=(TextView)find(root,"item_comment_collapsed");h.plusCollapsedTv=(TextView)find(root,"item_comment_plus");
        h.authorAvatarIv=(ImageView)find(root,"item_comment_author_avatar");h.awardsView=find(root,"awards_view");h.authorRichFlairTv=find(root,"item_comment_author_rich_flair");h.indentView=find(root,"indent_view");
        h.authorTv.setText("everydayasl");h.scoreTv.setText("896");h.timeTv.setText("2h");if(h.authorAvatarIv!=null)h.authorAvatarIv.setImageDrawable(new ColorDrawable(Color.GREEN));
        if(h.commentTv!=null)try{h.commentTv.getClass().getMethod("setTextHtml",String.class).invoke(h.commentTv,"<p>The most cutest and sweetest killer I have ever seen.</p>");}catch(Exception error){throw new RuntimeException(error);}
        return h;
    }
    static ViewTreeObserver.OnPreDrawListener bind(String type,String map,Holder holder) throws Exception {
        Class<?> cls=Class.forName("app.morphe.extension.boost."+type,true,loader);cls.getMethod(type.equals("MaterialYouTweaks") ? "bindPost":"bind",Object.class).invoke(null,holder);
        Field rows=cls.getDeclaredField(map);rows.setAccessible(true);
        Object controller=((Map<?,?>)rows.get(null)).get(holder.a);check(controller!=null,"Controller attaches to actual "+type+" resource");
        return (ViewTreeObserver.OnPreDrawListener)controller;
    }
    static void measure(View row,int width) {row.measure(View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));row.layout(0,0,width,row.getMeasuredHeight());}
    static int role(String name) {TypedValue value=new TypedValue();check(context.getTheme().resolveAttribute(context.getResources().getIdentifier(name,"attr",context.getPackageName()),value,true),"Theme resolves "+name);return value.resourceId!=0 ? context.getColor(value.resourceId):value.data;}
    static void save(View row,String path) throws Exception {Bitmap bitmap=Bitmap.createBitmap(row.getWidth(),Math.max(1,row.getHeight()),Bitmap.Config.ARGB_8888);row.draw(new Canvas(bitmap));try(java.io.FileOutputStream out=new java.io.FileOutputStream(path)){bitmap.compress(Bitmap.CompressFormat.PNG,100,out);}bitmap.recycle();}
    static void quoteChecks()throws Exception {
        TextView quote=(TextView)Class.forName("com.rubenmayayo.reddit.ui.customviews.LinkTextView",true,loader).getConstructor(Context.class).newInstance(context);
        quote.getClass().getMethod("setTextHtml",String.class).invoke(quote,"<blockquote>Quoted <b>words</b><br>Second line</blockquote>");
        Spanned text=(Spanned)quote.getText();Object[] spans=text.getSpans(0,text.length(),Object.class);Object nativeQuote=null;
        for(Object span:spans)if(span.getClass().getName().equals("y60")){nativeQuote=span;break;}
        check(nativeQuote!=null,"Markdown quote keeps Boost's actual CustomQuoteSpan renderer");
        check(nativeQuote.getClass().getField("a").getInt(nativeQuote)==role("colorSurfaceContainerHighest"),"Native quote background resolves to the active Material You tonal role");
        check(text.toString().contains("Second line") && text.getSpans(0,text.length(),android.text.style.StyleSpan.class).length>0,"Quote text, multiline content and bold formatting survive native rendering");
    }
    static void run(String[] args) throws Exception {
        loader=RuntimeUiChecks.initialize(args);settings();Context base=RuntimeUiChecks.context;
        context=candidateContext(base,args[0],true);float density=context.getResources().getDisplayMetrics().density;int width=Math.round(360*density);
        quoteChecks();
        int surface=role("colorSurface"),container=role("colorSurfaceContainerHigh"),primary=role("colorPrimary");
        check(Color.red(container)+Color.green(container)+Color.blue(container)>Color.red(surface)+Color.green(surface)+Color.blue(surface),"Dark content surface is lighter than its background");
        int dynamic=context.getResources().getIdentifier("m3_sys_color_dynamic_dark_primary","color",context.getPackageName());
        check(primary==context.getColor(dynamic),"Primary resolves to Boost's actual wallpaper-derived M3 resource");
        check(primary==context.getColor(android.R.color.system_accent1_200),"Primary matches the connected phone's wallpaper accent");
        for(String layout:new String[]{"row_comment_indent_avatar","row_comment_indent","row_comment_collapsed_indent"}) {
            View root=inflate(layout);Holder h=comment(root);
            Class.forName("app.morphe.extension.boost.CommentsChromeTweaks",true,loader).getMethod("beforeCommentBind",Object.class).invoke(null,h);
            if(h.indentView!=null)h.indentView.getClass().getMethod("setIndentLevel",int.class).invoke(h.indentView,2);
            ViewTreeObserver.OnPreDrawListener listener=bind("CommentLayoutTweaks","ROWS",h);
            check(listener.onPreDraw(),"Initial comment styling permits the current draw frame");measure(root,width);listener.onPreDraw();measure(root,width);
            ViewGroup header=(ViewGroup)h.authorTv.getParent();
            check(h.scoreTv.getParent()==header && h.timeTv.getParent()==header,"Actual author/points/time are grouped together");
            check(h.scoreTv.getLeft()>=h.authorTv.getRight() && h.timeTv.getLeft()>=h.scoreTv.getRight(),"Actual points/time follow username on the left");
            check(h.timeTv.getRight()<header.getWidth(),"Metadata fits inside the actual comment header");
            check(h.scoreTv.getText().toString().equals("896 points"),"Native score has the compact points label");
            if(h.commentTv!=null)check(h.commentTv.getTop()>=((View)header).getBottom(),"Body stays below header and optional flair");
            int[] clicked={0};h.authorTv.setOnClickListener(v->clicked[0]++);h.authorTv.performClick();check(clicked[0]==1,"Username callback remains functional after reparenting");
            h.authorTv.setText("A_very_long_username_that_will_need_ellipsizing");h.scoreTv.setText("12500");listener.onPreDraw();measure(root,Math.round(240*density));listener.onPreDraw();measure(root,Math.round(240*density));
            check(h.authorTv.getWidth()>0 && h.authorTv.getEllipsize()==android.text.TextUtils.TruncateAt.END,"Long username yields space and ellipsizes");
            check(h.timeTv.getRight()<=header.getWidth() && h.scoreTv.getRight()<=header.getWidth(),"Narrow nested header keeps score/time inside its bounds");
            check(listener.onPreDraw(),"Native layout remains stable after repeated binds/draws");
            h.authorTv.setText("everydayasl");h.scoreTv.setText("896");listener.onPreDraw();measure(root,width);listener.onPreDraw();measure(root,width);
            if(h.indentView!=null)check(h.indentView.getForeground()==null,"Native thread widget retains Boost's own reply-line renderer");
            if(args.length>2 && layout.equals("row_comment_indent_avatar"))save(root,args[2]+"/comment-preview.png");
        }
        for(String mode:new String[]{"0","1","2"}) {
            indentMode=mode;colorPattern=Color.MAGENTA+","+Color.RED+","+Color.GREEN+","+Color.BLUE;settings();
            View root=inflate("row_comment_indent_avatar");Holder h=comment(root);
            Field palette=h.indentView.getClass().getDeclaredField("b");palette.setAccessible(true);
            int[] before=((int[])palette.get(h.indentView)).clone();
            Field nativeMode=h.indentView.getClass().getDeclaredField("B");nativeMode.setAccessible(true);
            ViewTreeObserver.OnPreDrawListener listener=bind("CommentLayoutTweaks","ROWS",h);listener.onPreDraw();
            check(nativeMode.getInt(h.indentView)==Integer.parseInt(mode),"Boost's selected native reply-line style "+mode+" remains active");
            check(java.util.Arrays.equals(before,(int[])palette.get(h.indentView)),"Styling retains the native palette for reply-line mode "+mode);
            if(!mode.equals("1"))check(before[1]==Color.RED && before[2]==Color.GREEN && before[3]==Color.BLUE,"Custom rainbow palette comes from native preferences for mode "+mode);
            check(h.indentView.getForeground()==null,"Reply-line mode "+mode+" has no Shikify foreground override");
            h.indentView.getClass().getMethod("setIndentLevel",int.class).invoke(h.indentView,3);measure(root,width);
            Field nativeLine=h.indentView.getClass().getDeclaredField("c"),nativeMargin=h.indentView.getClass().getDeclaredField("y");nativeLine.setAccessible(true);nativeMargin.setAccessible(true);
            int expectedLine=Math.round((mode.equals("0") ? 4:2)*density),expectedGap=Math.round((mode.equals("0") ? 0:14)*density);
            check(nativeLine.getInt(h.indentView)==expectedLine && nativeMargin.getInt(h.indentView)==expectedGap,"Wider line spacing retains the native style selection "+mode);
            if(mode.equals("2")) {
                Bitmap lines=Bitmap.createBitmap(root.getWidth(),root.getHeight(),Bitmap.Config.ARGB_8888);root.draw(new Canvas(lines));
                int red=0,green=0,blue=0;for(int y=0;y<lines.getHeight();y++)for(int x=0;x<h.indentView.getWidth();x++){
                    int c=lines.getPixel(x,y);if(c==Color.RED)red++;if(c==Color.GREEN)green++;if(c==Color.BLUE)blue++;
                }
                lines.recycle();check(red>0 && green>0 && blue>0,"Actual native coloured-line renderer visibly draws the configured rainbow");
            }
        }
        indentMode=colorPattern=null;settings();
        for(String layout:new String[]{"row_submission_minimal_cardview","row_submission_minimal_cardview_left"}) {
            View row=inflate(layout);Holder h=new Holder();h.a=row;h.title=find(row,"submission_header_title");h.infoTop=find(row,"submission_header_info_top");h.thumbnailIv=find(row,"submission_header_thumbnail");h.scoreTv=(TextView)find(row,"submission_header_score");h.commentsTv=find(row,"submission_header_comment_count");
            h.voteUpButton=find(row,"submission_header_upvote");h.voteDownButton=find(row,"submission_header_downvote");h.overFlowButton=find(row,"submission_header_overflow");
            ((TextView)h.title).setText("An attempt of a little cat trying to hunt down the pigeons nearby");h.scoreTv.setText("10.2k");((TextView)h.commentsTv).setText("275 comments");
            SpannableString info=new SpannableString("MadeMeSmile · user · 3h · CATS");info.setSpan(new BackgroundColorSpan(Color.RED),info.toString().indexOf("CATS"),info.length(),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);((TextView)h.infoTop).setText(info);
            h.thumbnailIv.setVisibility(View.VISIBLE);((ImageView)h.thumbnailIv).setImageDrawable(new ColorDrawable(role("colorPrimaryContainer")));
            for(View button:new View[]{h.voteUpButton,h.voteDownButton})button.getClass().getMethod("c",boolean.class,boolean.class).invoke(button,false,false);
            View spoiler=find(row,"submission_header_spoiler"),nsfw=find(row,"submission_header_nsfw");if(spoiler!=null)spoiler.setVisibility(View.GONE);if(nsfw!=null)nsfw.setVisibility(View.GONE);
            Class<?> skin=Class.forName("app.morphe.extension.boost.MaterialYouTweaks",true,loader);
            h.P=java.lang.Enum.valueOf((Class)Class.forName("jh1",true,loader),"Cards");skin.getMethod("bindPost",Object.class).invoke(null,h);
            Field guard=skin.getDeclaredField("CARDS");guard.setAccessible(true);check(!((Map<?,?>)guard.get(null)).containsKey(row),"Full-card layout mode is excluded from the mini-card transformation");
            h.P=java.lang.Enum.valueOf((Class)Class.forName("jh1",true,loader),"MiniCards");
            ViewTreeObserver.OnPreDrawListener listener=bind("MaterialYouTweaks","CARDS",h);skin.getMethod("onPostBound",Object.class).invoke(null,h);check(listener.onPreDraw(),"Bound card permits its first frame without a draw veto");measure(row,width);listener.onPreDraw();measure(row,width);
            check(h.scoreTv.getParent()==h.commentsTv.getParent(),"Counts share the responsive footer group");
            check(h.voteUpButton.getParent()==h.voteDownButton.getParent() && h.overFlowButton.getParent()==h.voteUpButton.getParent(),"Native voting and overflow buttons share the footer");
            check(((View)h.voteUpButton.getParent()).getParent()!=h.infoTop.getParent(),"Voting footer is independent of title metadata");
            android.content.res.ColorStateList bg=(android.content.res.ColorStateList)row.getClass().getMethod("getCardBackgroundColor").invoke(row);
            check(bg.getDefaultColor()==container,"Actual MaterialCardView uses the wallpaper content surface");
            check(Math.abs((Float)row.getClass().getMethod("getRadius").invoke(row)-16*density)<1,"Actual mini card has 16dp corners");
            android.graphics.Rect titleBounds=new android.graphics.Rect(),thumbBounds=new android.graphics.Rect();h.title.getDrawingRect(titleBounds);h.thumbnailIv.getDrawingRect(thumbBounds);
            ((ViewGroup)row).offsetDescendantRectToMyCoords(h.title,titleBounds);((ViewGroup)row).offsetDescendantRectToMyCoords(h.thumbnailIv,thumbBounds);
            check(titleBounds.right<=thumbBounds.left || titleBounds.left>=thumbBounds.right,"Title stays beside the inset thumbnail without overlapping");
            check(h.thumbnailIv.getWidth()==Math.round(64*density) && h.thumbnailIv.getClipToOutline(),"Thumbnail is inset, sized and rounded");
            int[] clicks={0};h.voteUpButton.setOnClickListener(v->clicks[0]++);h.voteUpButton.performClick();h.overFlowButton.setOnClickListener(v->clicks[0]++);h.overFlowButton.performClick();check(clicks[0]==2,"Moved vote and overflow callbacks still fire once");
            check(!((TextView)h.infoTop).getText().toString().contains("CATS"),"Native inline flair is moved out of the metadata text");
            check(listener.onPreDraw(),"Card styling is stable across repeated draws");
            Field cards=Class.forName("app.morphe.extension.boost.MaterialYouTweaks",true,loader).getDeclaredField("CARDS");cards.setAccessible(true);
            Object controller=((Map<?,?>)cards.get(null)).get(row);Field flairField=controller.getClass().getDeclaredField("flair");flairField.setAccessible(true);
            TextView chip=(TextView)((java.lang.ref.WeakReference<?>)flairField.get(controller)).get();
            check(chip!=null && chip.getVisibility()==View.VISIBLE && chip.getHeight()>=((TextView)h.infoTop).getLineHeight(),"Flair pill has a visible measured text line");
            check(chip.getText().toString().equals("CATS"),"Flair label is preserved in its own pill row");
            android.graphics.Outline outline=new android.graphics.Outline();h.thumbnailIv.getOutlineProvider().getOutline(h.thumbnailIv,outline);
            check(Math.abs(outline.getRadius()-12*density)<1,"Thumbnail clipping outline has a 12dp radius");
            SpannableString emojiFlair=new SpannableString("MadeMeSmile · user · CATS");
            int mark=emojiFlair.toString().indexOf("CATS");emojiFlair.setSpan(new BackgroundColorSpan(Color.RED),mark,emojiFlair.length(),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            ColorDrawable emoji=new ColorDrawable(Color.GREEN);emoji.setBounds(0,0,Math.round(12*density),Math.round(12*density));
            emojiFlair.setSpan(new android.text.style.ImageSpan(emoji),mark,mark+1,Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            ((TextView)h.infoTop).setText(emojiFlair);listener.onPreDraw();measure(row,width);listener.onPreDraw();measure(row,width);
            Bitmap emojiBitmap=Bitmap.createBitmap(chip.getWidth(),chip.getHeight(),Bitmap.Config.ARGB_8888);chip.draw(new Canvas(emojiBitmap));
            int green=0;for(int y=0;y<emojiBitmap.getHeight();y++)for(int x=0;x<emojiBitmap.getWidth();x++)if(emojiBitmap.getPixel(x,y)==Color.GREEN)green++;
            emojiBitmap.recycle();check(green>0,"Flair pill renders embedded native image/emoji spans instead of flattening them");
            ((TextView)h.infoTop).setText("MadeMeSmile · another_user · 4h");h.scoreTv.setText("42");check(listener.onPreDraw(),"Recycled card updates its score and flair without cancelling a frame");measure(row,width);check(listener.onPreDraw(),"Recycled card settles without accumulating rows");
            ((TextView)h.infoTop).setText(info);listener.onPreDraw();measure(row,width);listener.onPreDraw();measure(row,width);
            if(args.length>2 && layout.equals("row_submission_minimal_cardview"))save(row,args[2]+"/card-preview.png");
        }
        context=candidateContext(base,args[0],false);quoteChecks();
        int light=role("colorSurface"),lightContent=role("colorSurfaceContainer");
        check(Color.red(light)+Color.green(light)+Color.blue(light)>Color.red(surface)+Color.green(surface)+Color.blue(surface),"Light mode keeps the light dynamic palette");
        check(light!=lightContent,"Light mode retains distinct content/background roles");
        System.out.println("STYLE CHECKS PASSED: "+checks);System.exit(0);
    }
    public static void main(String[] args){try{run(args);}catch(Throwable error){error.printStackTrace(System.out);System.exit(1);}}
}
