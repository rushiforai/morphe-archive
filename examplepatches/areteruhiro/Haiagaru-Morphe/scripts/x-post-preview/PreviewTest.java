package app.morphe.extension.chmate;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.os.Looper;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.URLSpan;
import android.widget.TextView;
import java.lang.reflect.Field;
import java.util.Map;
import android.view.MotionEvent;
import android.view.View;

/** Runs the real preview code with Android TextView/Spanned; no real downloads. */
public final class PreviewTest {
    static final class ShownTextView extends TextView {
        ShownTextView(Context context) {
            super(context);
            setLayoutParams(new android.view.ViewGroup.LayoutParams(900, android.view.ViewGroup.LayoutParams.WRAP_CONTENT));
        }
        @Override public boolean isShown() { return getVisibility() == android.view.View.VISIBLE; }
    }
    static int checks;
    /** Matches native ChMate body setText -> injected onBound, unlike plain TextView. */
    static final class BoundTextView extends TextView {
        boolean armed, failWrite;
        int depth, maximumDepth, bindings;
        BoundTextView(Context context) {
            super(context);
            setLayoutParams(new android.view.ViewGroup.LayoutParams(900,android.view.ViewGroup.LayoutParams.WRAP_CONTENT));
            armed = true;
        }
        @Override public boolean isShown() { return true; }
        @Override public void setText(CharSequence text, BufferType type) {
            if (failWrite) { failWrite = false; throw new IllegalStateException("test write failed"); }
            super.setText(text, type);
            if (!armed) return;
            bindings++;
            depth++;
            maximumDepth = Math.max(maximumDepth, depth);
            try {
                if (depth > 8) throw new AssertionError("Recursive native preview binding");
                XPostPreview.onBound(this);
            } finally { depth--; }
        }
    }
    static final class RecordingContext extends ContextWrapper {
        Intent opened;
        RecordingContext(Context context) { super(context); }
        @Override public void startActivity(Intent intent) { opened = intent; }
    }
    static void check(boolean ok, String message) {
        if (!ok) throw new AssertionError(message);
        checks++;
    }
    public static void main(String[] args) throws Exception {
        if (Looper.getMainLooper() == null) Looper.prepareMainLooper();
        Class<?> activityThread = Class.forName("android.app.ActivityThread");
        Object thread = activityThread.getMethod("systemMain").invoke(null);
        Context context = (Context) activityThread.getMethod("getSystemContext").invoke(thread);
        run(context);
        System.exit(0);
    }
    public static void run(Context context) throws Exception {
        try { runChecks(context); }
        catch (Throwable error) {
            android.util.Log.e("HaiagaruPreviewTest", "FAIL", error);
            throw error;
        }
    }
    static void runChecks(Context context) throws Exception {
        String json = "{\"id_str\":\"123\",\"text\":\"本文 + / <script>\\n2行目\","
                + "\"user\":{\"name\":\"投稿者\",\"screen_name\":\"example\"},\"created_at\":\"2026-10-16\"}";
        XPostPreview.Data data = XPostPreview.parse(json, "123");
        check(data != null && data.text.equals("本文 + / <script>\n2行目"), "Literal text, symbols and newline");
        check(XPostPreview.parse(json, "999") == null, "Mismatched tweet ID");
        check(XPostPreview.parse("{}", "123") == null, "Unavailable tweet");
        check(XPostPreview.parse(json.replace("example", "evil/path"), "123") == null, "Invalid author path");
        check(XPostPreview.parse(json.replace("本文 + / <script>\\n2行目", ""), "123") == null, "Empty tweet");
        String longText = "全文テスト😀".repeat(100);
        String extended = new org.json.JSONObject(json).put("full_text", longText).toString();
        check(XPostPreview.parse(extended, "123").text.equals(longText), "Full text takes precedence over excerpt");
        String note = new org.json.JSONObject(json).put("note_tweet", new org.json.JSONObject()
                .put("note_tweet_results", new org.json.JSONObject().put("result", new org.json.JSONObject().put("text",longText)))).toString();
        check(XPostPreview.parse(note, "123").text.equals(longText), "Long-form note text retained");
        String nearLimitReply = new org.json.JSONObject(json).put("text", "@a " + "漢".repeat(139))
                .put("in_reply_to_status_id_str", "1").put("note_tweet", new org.json.JSONObject().put("id", "stub")).toString();
        Haiagaru.warningMode=1;
        check(!XPostPreview.parse(nearLimitReply,"123").possiblyTruncated,"420-byte mode ignores reply handle and metadata-only note stub");
        Haiagaru.warningMode=0;
        check(!XPostPreview.parse(nearLimitReply,"123").possiblyTruncated,"280-point mode ignores reply handle");
        String exact280=new org.json.JSONObject(json).put("text","漢".repeat(140)).toString();
        check(!XPostPreview.parse(exact280,"123").possiblyTruncated,"Detailed 280-point boundary remains displayable");
        String above280=new org.json.JSONObject(json).put("text","漢".repeat(140)+"a").toString();
        check(XPostPreview.parse(above280,"123").possiblyTruncated,"Detailed warning starts above 280 points");
        String quoteAndImage = "@a " + "漢".repeat(114)
                + " https://x.com/a/status/1 https://x.com/b/status/2 https://t.co/photo";
        int mediaStart=quoteAndImage.indexOf("https://t.co/photo");
        org.json.JSONObject mediaPost=new org.json.JSONObject(json).put("text",quoteAndImage)
                .put("in_reply_to_status_id_str","1")
                .put("entities",new org.json.JSONObject().put("media",new org.json.JSONArray()
                        .put(new org.json.JSONObject().put("indices",new org.json.JSONArray().put(mediaStart).put(quoteAndImage.length())))));
        Haiagaru.warningMode=0;
        check(!XPostPreview.parse(mediaPost.toString(),"123").possiblyTruncated,
                "Detailed score excludes reply handle and attached t.co, counting quote-post URLs");
        org.json.JSONObject noMediaMetadata=new org.json.JSONObject(json).put("text",quoteAndImage)
                .put("in_reply_to_status_id_str","1");
        check(XPostPreview.parse(noMediaMetadata.toString(),"123").possiblyTruncated,
                "Detailed score counts quoted URLs and an unclassified t.co as text URLs");
        String exact420 = new org.json.JSONObject(json).put("text", "漢".repeat(140)).toString();
        Haiagaru.warningMode=1;
        check(!XPostPreview.parse(exact420,"123").possiblyTruncated,"420-byte boundary remains displayable in simple mode");
        String above420 = new org.json.JSONObject(json).put("text", "漢".repeat(140)+"a").toString();
        check(XPostPreview.parse(above420,"123").possiblyTruncated,"Simple warning starts above 420 visible bytes");
        String attachedAtLimit="漢".repeat(140)+" https://t.co/image";
        int attachedStart=attachedAtLimit.indexOf("https://t.co/image");
        org.json.JSONObject attachmentAtLimit=new org.json.JSONObject(json).put("text",attachedAtLimit)
                .put("entities",new org.json.JSONObject().put("media",new org.json.JSONArray()
                        .put(new org.json.JSONObject().put("indices",new org.json.JSONArray().put(attachedStart).put(attachedAtLimit.length())))));
        XPostPreview.Data attachmentData=XPostPreview.parse(attachmentAtLimit.toString(),"123");
        check(attachmentData.visibleBytes==420&&!attachmentData.possiblyTruncated,
                "Attachment t.co and its preceding ASCII space do not trigger the 420-byte warning");
        check(attachmentData.text.equals("漢".repeat(140)),"Attached t.co URL and its separator are omitted from preview text");
        check(XPostLength.detailedPoints(attachedAtLimit,attachmentAtLimit)==280,
                "Attachment t.co separator is excluded from detailed point counting too");
        String legacy = new org.json.JSONObject(json).put("text", "短文")
                .put("legacy",new org.json.JSONObject().put("full_text",longText)).toString();
        check(XPostPreview.parse(legacy,"123").text.equals(longText),"Legacy full_text takes precedence over excerpt");
        Class<?> entryType = Class.forName("app.morphe.extension.chmate.XPostPreview$Entry");
        var constructor = entryType.getDeclaredConstructor(); constructor.setAccessible(true);
        Object entry = constructor.newInstance();
        Field dataField = entryType.getDeclaredField("data"); dataField.setAccessible(true); dataField.set(entry, data);
        Field expiresField = entryType.getDeclaredField("expires"); expiresField.setAccessible(true); expiresField.setLong(entry, android.os.SystemClock.elapsedRealtime()+900000);
        Field cache = XPostPreview.class.getDeclaredField("CACHE"); cache.setAccessible(true);
        ((Map) cache.get(null)).put("123", entry);
        String original = "元のレス\nhttps://x.com/example/status/123/photo/1\n末尾";
        SpannableStringBuilder source = new SpannableStringBuilder(original);
        int start = original.indexOf("https:"), end = original.indexOf("\n末尾");
        URLSpan originalLink = new URLSpan(original.substring(start, end));
        source.setSpan(originalLink, start, end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        TextView view = new ShownTextView(context);
        view.setText(source, TextView.BufferType.SPANNABLE);
        Haiagaru.enabled = false;
        XPostPreview.apply(view);
        check(view.getText().toString().equals(original), "OFF retains original text");
        Haiagaru.enabled = true;
        XPostPreview.apply(view);
        check(view.getText().toString().startsWith(original + "\n\n"), "Inline preview appended only");
        check(view.getText().toString().contains("投稿者  @example"), "Author shown");
        check(view.getText().toString().contains(data.text), "Tweet literal content shown");
        check(!Haiagaru.full,"Full text option defaults OFF in isolated settings fixture");
        dataField.set(entry,attachmentData);
        RecordingContext attachmentRecording=new RecordingContext(context);
        TextView attachmentView=new ShownTextView(attachmentRecording);
        attachmentView.setText("https://x.com/example/status/123",TextView.BufferType.SPANNABLE);
        XPostPreview.apply(attachmentView);
        Spanned attachmentPreview=(Spanned)attachmentView.getText();
        check(!attachmentPreview.toString().contains("https://t.co/image"),"Attached media URL is absent from rendered X preview");
        XPostPreviewTouch.PostLink[] attachmentLinks=attachmentPreview.getSpans(0,attachmentPreview.length(),XPostPreviewTouch.PostLink.class);
        boolean attachedLink=false;for(XPostPreviewTouch.PostLink candidate:attachmentLinks)
            if(candidate.getURL().contains("t.co/image"))attachedLink=true;
        check(!attachedLink,"Attached media URL is not linkified as an empty website card");
        java.lang.reflect.Method extractCards=Class.forName("app.morphe.extension.chmate.SiteCards").getDeclaredMethod("urls",CharSequence.class);
        extractCards.setAccessible(true);
        java.util.List<?> attachmentCards=(java.util.List<?>)extractCards.invoke(null,attachmentPreview);
        check(!attachmentCards.contains("https://t.co/image"),"Attached t.co is not submitted for a URL-only website card");
        dataField.set(entry,data);
        check(source.toString().equals(original), "Native source not mutated");
        Spanned displayed = (Spanned) view.getText();
        check(displayed.getSpanStart(originalLink) == start && displayed.getSpanEnd(originalLink) == end,
                "Original URL span offsets preserved");
        String first = view.getText().toString();
        XPostPreview.apply(view);
        check(view.getText().toString().equals(first), "Repeated layout does not duplicate preview");
        Haiagaru.enabled = false;
        XPostPreview.apply(view);
        check(view.getText().toString().equals(original), "Turning OFF removes preview");
        Haiagaru.enabled = true;
        XPostPreview.apply(view);
        check(view.getText().toString().equals(first), "Turning ON restores one preview");
        CharSequence prepared=XPostPreview.prepare(source);
        check(prepared.toString().equals(first), "Warm preview rendered before native measurement");
        check(XPostPreview.prepare(prepared).toString().equals(first), "Warm rebind never duplicates preview");
        dataField.set(entry, XPostPreview.parse(extended,"123"));
        Haiagaru.full=false;
        view.setText(source,TextView.BufferType.SPANNABLE);XPostPreview.apply(view);
        check(!view.getText().toString().contains(longText) && view.getText().toString().contains("…"), "Excerpt mode is bounded");
        Haiagaru.full=true;XPostPreview.apply(view);
        check(view.getText().toString().contains(longText), "Full text toggle refreshes existing row");
        RecordingContext recording=new RecordingContext(context);
        TextView clickable=new ShownTextView(recording);
        dataField.set(entry,data);
        clickable.setText(XPostPreview.prepare(source),TextView.BufferType.SPANNABLE);
        clickable.measure(View.MeasureSpec.makeMeasureSpec(900,View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(20000,View.MeasureSpec.AT_MOST));
        clickable.layout(0,0,900,clickable.getMeasuredHeight());
        Spanned links=(Spanned)clickable.getText();
        XPostPreviewTouch.PostLink link=links.getSpans(0,links.length(),XPostPreviewTouch.PostLink.class)[0];
        int offset=links.getSpanStart(link)+1,line=clickable.getLayout().getLineForOffset(offset);
        float x=clickable.getLayout().getPrimaryHorizontal(offset)+clickable.getTotalPaddingLeft();
        float y=(clickable.getLayout().getLineTop(line)+clickable.getLayout().getLineBottom(line))/2f+clickable.getTotalPaddingTop();
        MotionEvent down=MotionEvent.obtain(100,100,MotionEvent.ACTION_DOWN,x,y,0);
        MotionEvent up=MotionEvent.obtain(100,150,MotionEvent.ACTION_UP,x,y,0);
        check(XPostPreviewTouch.onTouch(clickable,down), "Own post link consumes down");
        check(XPostPreviewTouch.onTouch(clickable,up), "Own post link consumes up");
        check(recording.opened!=null && "https://x.com/example/status/123".equals(recording.opened.getDataString()), "Post link opens exact original post");
        check((recording.opened.getFlags()&Intent.FLAG_ACTIVITY_NEW_TASK)!=0,"Post opened in separate task");
        recording.opened=null;
        XPostPreviewTouch.onTouch(clickable,down);
        MotionEvent moved=MotionEvent.obtain(100,125,MotionEvent.ACTION_MOVE,x,y+200,0);
        XPostPreviewTouch.onTouch(clickable,moved);XPostPreviewTouch.onTouch(clickable,up);
        check(recording.opened==null,"Dragging link never opens post");
        Haiagaru.card=true;
        XPostPreview.Data linked=XPostPreview.parse(new org.json.JSONObject(json)
                .put("text","本文のリンク https://example.com/path). 続き")
                .toString(),"123");
        dataField.set(entry,linked);
        TextView cardView=new ShownTextView(recording);
        cardView.setText(XPostPreview.prepare(source),TextView.BufferType.SPANNABLE);
        Spanned cardText=(Spanned)cardView.getText();
        XPostPreviewTouch.PostLink[] bodyLinks=cardText.getSpans(0,cardText.length(),XPostPreviewTouch.PostLink.class);
        XPostPreviewTouch.PostLink bodyLink=null;
        for(XPostPreviewTouch.PostLink candidate:bodyLinks)if(candidate.getURL().equals("https://example.com/path"))bodyLink=candidate;
        check(bodyLink!=null,"URL inside X post card is a clickable link");
        check(cardText.subSequence(cardText.getSpanStart(bodyLink),cardText.getSpanEnd(bodyLink)).toString().equals("https://example.com/path"),"Card URL excludes trailing punctuation");
        java.lang.reflect.Method cardUrls=Class.forName("app.morphe.extension.chmate.SiteCards").getDeclaredMethod("urls",CharSequence.class);
        cardUrls.setAccessible(true);
        java.util.List<?> previews=(java.util.List<?>)cardUrls.invoke(null,cardText);
        check(previews.contains("https://example.com/path"),"Ordinary rich link-card extraction includes URLs inside the X preview");
        MotionEvent nativeDown=MotionEvent.obtain(200,200,MotionEvent.ACTION_DOWN,2,2,0);
        check(!XPostPreviewTouch.onTouch(clickable,nativeDown),"Native text touches not intercepted");
        down.recycle();up.recycle();moved.recycle();nativeDown.recycle();
        Haiagaru.collapsible=true;
        clickable.setText(source,TextView.BufferType.SPANNABLE);
        XPostPreview.apply(clickable);
        check(clickable.getText().toString().contains("▶ X投稿") && !clickable.getText().toString().contains(data.text), "Collapsed preview hides cached body");
        tapToggle(clickable);
        check(clickable.getText().toString().contains("▼ X投稿") && clickable.getText().toString().contains(data.text), "Tap expands preview");
        check(recording.opened==null,"Expanding never opens browser");
        tapToggle(clickable);
        check(!clickable.getText().toString().contains(data.text),"Second tap collapses preview");
        tapToggle(clickable);
        clickable.setText(new SpannableStringBuilder("別のレス "+original),TextView.BufferType.SPANNABLE);
        XPostPreview.apply(clickable);
        check(!clickable.getText().toString().contains(data.text),"Recycling resets expansion");
        int calls=XPostMetadata.calls;
        clickable.setText(new SpannableStringBuilder("https://x.com/example/status/999"),TextView.BufferType.SPANNABLE);
        XPostPreview.apply(clickable);
        check(clickable.getText().toString().contains("▶ X投稿") && XPostMetadata.calls==calls,"Uncached collapsed preview does not fetch metadata");
        clickable.setText(source,TextView.BufferType.SPANNABLE);
        XPostPreview.apply(clickable);
        Haiagaru.collapsible=false;
        XPostPreview.apply(clickable);
        check(clickable.getText().toString().contains(data.text) && !clickable.getText().toString().contains("▶ X投稿"),"Setting OFF restores expanded display");
        view.setText(new SpannableStringBuilder("別のレス https://example.com/"), TextView.BufferType.SPANNABLE);
        XPostPreview.apply(view);
        check(!view.getText().toString().contains("投稿者"), "Recycled row has no old tweet");
        view.setText(source, TextView.BufferType.SPANNABLE);
        view.setVisibility(android.view.View.GONE);
        XPostPreview.apply(view);
        check(view.getText().toString().equals(original), "Hidden body receives no preview");
        checkNativeReentry(context, source, original, data.text);
        checkCards(context, source, original, data.text);
        checkActions(context, source);
        System.out.println("PASS: " + checks + " Android tweet-preview checks; no network or account access.");
    }

    static void checkActions(Context context, CharSequence source) {
        Haiagaru.enabled=true; Haiagaru.collapsible=false; Haiagaru.actions=true;
        RecordingContext recording=new RecordingContext(context);
        BoundTextView view=new BoundTextView(recording);
        view.setText(source, TextView.BufferType.SPANNABLE);
        XPostPreview.apply(view);
        Spanned text=(Spanned)view.getText();
        XPostPreviewTouch.ActionLink[] actions=text.getSpans(0,text.length(),XPostPreviewTouch.ActionLink.class);
        check(actions.length==4,"Four optional actions rendered");
        check(recording.opened==null,"Rendering actions opens no page");
        String[] urls={"https://x.com/intent/tweet?in_reply_to=123", "https://x.com/intent/retweet?tweet_id=123", "https://x.com/intent/like?tweet_id=123"};
        for(int i=0;i<3;i++) {
            actions[i].onClick(view);
            check(urls[i].equals(recording.opened.getDataString()),"Official action URL "+i);
            check(recording.opened.hasExtra("android.support.customtabs.extra.SESSION"),"Custom tab requested "+i);
        }
        check(actions[3].copy && actions[3].getURL().equals("https://x.com/example/status/123"),"Copy uses canonical post URL, not intent URL");
        check(!XPostPreviewTouch.browserIntent(urls[0],false).hasExtra("android.support.customtabs.extra.SESSION"),"External browser option omits custom tab session");
        try { XPostPreviewTouch.actionUrl("like","123&evil=1"); throw new AssertionError("Invalid ID accepted"); }
        catch(IllegalArgumentException expected) { checks++; }
        Haiagaru.actions=false;
        XPostPreview.apply(view);
        text=(Spanned)view.getText();
        check(text.getSpans(0,text.length(),XPostPreviewTouch.ActionLink.class).length==0,"Actions setting off removes spans without rebinding source");
        Haiagaru.card=false;
    }

    static void checkCards(Context context,CharSequence source,String original,String body) {
        Haiagaru.enabled=true;Haiagaru.full=true;Haiagaru.collapsible=false;Haiagaru.card=true;
        BoundTextView view=new BoundTextView(context);
        view.setTextColor(0xffe7e9ea);view.setTextSize(16);
        view.setText(source,TextView.BufferType.SPANNABLE);
        Spanned text=(Spanned)view.getText();
        check(text.getSpans(0,text.length(),XPostPreviewCard.class).length==1,"Card uses one native decoration");
        check(text.toString().contains(body)&&text.toString().startsWith(original),"Card keeps original response and full post");
        check(text.getSpans(0,text.length(),XPostPreviewTouch.PostLink.class).length==1,"Card preserves open-post link");
        check(text.getSpans(0,text.length(),android.text.style.QuoteSpan.class).length==0,"Card replaces legacy quote border");
        view.measure(View.MeasureSpec.makeMeasureSpec(900,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(20000,View.MeasureSpec.AT_MOST));
        view.layout(0,0,900,view.getMeasuredHeight());
        android.graphics.Bitmap bitmap=android.graphics.Bitmap.createBitmap(900,view.getHeight(),android.graphics.Bitmap.Config.ARGB_8888);
        android.graphics.Canvas canvas=new android.graphics.Canvas(bitmap);canvas.drawColor(0xff17221e);view.draw(canvas);
        int painted=0;for(int y=0;y<bitmap.getHeight();y++)if(bitmap.getPixel(450,y)==0xff15202b)painted++;
        check(painted>10,"Dark card background is actually drawn");
        view.setTextColor(0xff0f1419);canvas.drawColor(0xffffffff);view.draw(canvas);
        painted=0;for(int y=0;y<bitmap.getHeight();y++)if(bitmap.getPixel(450,y)==0xfff8f9fb)painted++;
        check(painted>10,"Light card background follows dark text theme");
        int writes=view.bindings;
        for(int i=0;i<100;i++){XPostPreview.onBound(view);XPostPreview.apply(view);}
        check(view.bindings==writes,"Stable card does not trigger repeated text layouts");
        Haiagaru.collapsible=true;XPostPreview.apply(view);
        check(!view.getText().toString().contains(body),"Card can be collapsed");
        tapToggle(view);
        check(view.getText().toString().contains(body),"Card expands with existing toggle link");
        Haiagaru.card=false;Haiagaru.collapsible=false;XPostPreview.apply(view);
        text=(Spanned)view.getText();
        check(text.getSpans(0,text.length(),XPostPreviewCard.class).length==0,"Turning card mode off restores legacy preview");
        check(text.getSpans(0,text.length(),android.text.style.QuoteSpan.class).length==1,"Legacy preview border restored");
        bitmap.recycle();
    }

    static void checkNativeReentry(Context context, CharSequence source, String original, String body) {
        Haiagaru.enabled = true; Haiagaru.collapsible = false;
        BoundTextView nativeView = new BoundTextView(context);
        nativeView.setText(source, TextView.BufferType.SPANNABLE);
        check(nativeView.maximumDepth == 2 && nativeView.bindings == 2, "Native setText reentry is bounded");
        check(nativeView.getText().toString().contains(body), "Cached preview survives native binding");
        String expected = nativeView.getText().toString();
        int writesBefore = nativeView.bindings;
        for (int i = 0; i < 20; i++) XPostPreview.onBound(nativeView);
        check(nativeView.getText().toString().equals(expected), "Repeated native binding never duplicates preview");
        check(nativeView.bindings == writesBefore, "Unchanged native binding performs no additional setText/layout");
        check(nativeView.maximumDepth == 2, "Repeated rebind does not grow the stack");
        Haiagaru.collapsible = true;
        nativeView.setText(source, TextView.BufferType.SPANNABLE);
        check(nativeView.getText().toString().contains("▶ X投稿"), "Collapsed native binding remains usable");
        XPostPreview.toggle(nativeView, "123");
        check(nativeView.getText().toString().contains(body), "Native expand does not recurse");
        XPostPreview.toggle(nativeView, "123");
        check(!nativeView.getText().toString().contains(body), "Native collapse does not recurse");
        nativeView.setText(new SpannableStringBuilder("https://x.com/example/status/999"), TextView.BufferType.SPANNABLE);
        check(nativeView.getText().toString().contains("▶ X投稿"), "Uncached collapsed native binding does not recurse");
        Haiagaru.collapsible = false;
        nativeView.armed = false;
        nativeView.setText(source, TextView.BufferType.SPANNABLE);
        nativeView.armed = true; nativeView.failWrite = true;
        try { XPostPreview.onBound(nativeView); throw new AssertionError("Expected test write failure"); }
        catch (IllegalStateException expectedFailure) { checks++; }
        XPostPreview.onBound(nativeView);
        check(nativeView.getText().toString().contains(body), "Write guard is cleared after an exception");
        nativeView.setText(new SpannableStringBuilder("別のレス"), TextView.BufferType.SPANNABLE);
        check(nativeView.getText().toString().equals("別のレス"), "Recycled native row removes previous preview");
        nativeView.setText(source, TextView.BufferType.SPANNABLE);
        Haiagaru.enabled = false; XPostPreview.apply(nativeView);
        check(nativeView.getText().toString().equals(original), "OFF removes preview through native binding");
        Haiagaru.enabled = true;
    }

    static void tapToggle(TextView view) {
        view.measure(View.MeasureSpec.makeMeasureSpec(900,View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(20000,View.MeasureSpec.AT_MOST));
        view.layout(0,0,900,view.getMeasuredHeight());
        Spanned text=(Spanned)view.getText();
        XPostPreviewTouch.ToggleLink toggle=text.getSpans(0,text.length(),XPostPreviewTouch.ToggleLink.class)[0];
        int offset=text.getSpanStart(toggle)+1,line=view.getLayout().getLineForOffset(offset);
        float x=view.getLayout().getPrimaryHorizontal(offset)+view.getTotalPaddingLeft();
        float y=(view.getLayout().getLineTop(line)+view.getLayout().getLineBottom(line))/2f+view.getTotalPaddingTop();
        MotionEvent down=MotionEvent.obtain(300,300,MotionEvent.ACTION_DOWN,x,y,0);
        MotionEvent up=MotionEvent.obtain(300,350,MotionEvent.ACTION_UP,x,y,0);
        check(XPostPreviewTouch.onTouch(view,down) && XPostPreviewTouch.onTouch(view,up),"Toggle handles tap");
        down.recycle();up.recycle();
    }
}
