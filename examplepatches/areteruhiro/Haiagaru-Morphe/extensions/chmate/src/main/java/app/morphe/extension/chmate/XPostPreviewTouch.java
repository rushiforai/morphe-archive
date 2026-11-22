package app.morphe.extension.chmate;

import android.content.Intent;
import android.net.Uri;
import android.text.Layout;
import android.text.Spanned;
import android.text.style.URLSpan;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.widget.TextView;
import android.widget.Toast;
import java.util.WeakHashMap;

/** Intercepts only our appended link; stock links, selection and gestures stay native. */
public final class XPostPreviewTouch {
    private static final WeakHashMap<TextView, Press> PRESSES = new WeakHashMap<>();
    static class PostLink extends URLSpan {
        PostLink(String url) { super(url); }
        @Override public void onClick(View view) {
            open(view, getURL());
        }
    }
    static void open(View view, String url) {
        if (GigaFilePosting.openLink(view.getContext(),url)) return;
            try {
                Intent intent = browserIntent(url, Haiagaru.xPostPreviewBrowser());
                if (Haiagaru.xPostPreviewBrowser()) {
                    android.content.pm.PackageManager manager = view.getContext().getPackageManager();
                    java.util.List<android.content.pm.ResolveInfo> browsers = manager.queryIntentServices(
                            new Intent("android.support.customtabs.action.CustomTabsService"), 0);
                    android.content.pm.ResolveInfo preferred = manager.resolveActivity(
                            new Intent(Intent.ACTION_VIEW, Uri.parse("https://x.com/")),
                            android.content.pm.PackageManager.MATCH_DEFAULT_ONLY);
                    String selected = null;
                    for (android.content.pm.ResolveInfo browser : browsers) {
                        if (browser.serviceInfo == null) continue;
                        String name = browser.serviceInfo.packageName;
                        if (selected == null) selected = name;
                        if (preferred != null && preferred.activityInfo != null
                                && name.equals(preferred.activityInfo.packageName)) { selected = name; break; }
                    }
                    if (selected != null) intent.setPackage(selected);
                }
                view.getContext().startActivity(intent);
            } catch (android.content.ActivityNotFoundException error) {
                try { view.getContext().startActivity(browserIntent(url, false)); }
                catch (android.content.ActivityNotFoundException missing) {
                    Toast.makeText(view.getContext(), "投稿を開けるアプリがありません", Toast.LENGTH_SHORT).show();
                }
            }
    }
    static Intent browserIntent(String url, boolean internal) {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
                intent.addCategory(Intent.CATEGORY_BROWSABLE);
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                if (internal) {
                    // Standard Custom Tabs protocol: supporting browsers show their own secure
                    // in-app tab and reuse browser login. Others ignore these optional extras.
                    android.os.Bundle extras = new android.os.Bundle();
                    extras.putBinder("android.support.customtabs.extra.SESSION", null);
                    extras.putBoolean("android.support.customtabs.extra.SHARE_MENU_ITEM", true);
                    intent.putExtras(extras);
                }
                return intent;
    }
    static final class ActionLink extends PostLink {
        final boolean copy;
        ActionLink(String url, boolean copy) { super(url); this.copy = copy; }
        @Override public void onClick(View view) {
            if (!copy) { super.onClick(view); return; }
            android.content.ClipboardManager clipboard = (android.content.ClipboardManager)
                    view.getContext().getSystemService(android.content.Context.CLIPBOARD_SERVICE);
            if (clipboard == null) return;
            clipboard.setPrimaryClip(android.content.ClipData.newPlainText("X投稿", getURL()));
            Toast.makeText(view.getContext(), "投稿リンクをコピーしました", Toast.LENGTH_SHORT).show();
        }
    }
    static String actionUrl(String action, String id) {
        if (id == null || !id.matches("[0-9]{1,25}")) throw new IllegalArgumentException("Invalid post ID");
        if ("reply".equals(action)) return "https://x.com/intent/tweet?in_reply_to=" + id;
        if ("like".equals(action)) return "https://x.com/intent/like?tweet_id=" + id;
        if ("repost".equals(action)) return "https://x.com/intent/retweet?tweet_id=" + id;
        throw new IllegalArgumentException("Invalid post action");
    }
    static final class ToggleLink extends PostLink {
        final String id;
        ToggleLink(String id) { super("https://x.com/i/status/" + id); this.id=id; }
        @Override public void onClick(View view) {
            if(view instanceof TextView)XPostPreview.toggle((TextView)view,id);
        }
    }
    private static final class GigaLink extends PostLink {
        GigaLink(String url) { super(url); }
    }
    private static final java.util.regex.Pattern GIGA_URL = java.util.regex.Pattern.compile(
            "https://[0-9]{1,4}\\.gigafile\\.nu/[0-9]{4}-[A-Za-z0-9_-]{8,120}/?(?![A-Za-z0-9_/?#-])");
    private static final class Press {
        final PostLink link;
        final float x, y;
        boolean moved;
        Press(PostLink link, MotionEvent event) { this.link=link; x=event.getX(); y=event.getY(); }
    }
    public static boolean onTouch(Object object, MotionEvent event) {
        if (!(object instanceof TextView) || object instanceof android.widget.EditText) return false;
        TextView view=(TextView)object;
        MediaViewerNavigation.rememberBody(view,event);
        XPostPreviewPosition.onTouch(view,event);
        if(QuotedPostChecker.touch(view,event))return true;
        int action=event.getActionMasked();
        if (action==MotionEvent.ACTION_DOWN) {
            PRESSES.remove(view);
            PostLink link=hit(view,event);
            if(link==null)return false;
            PRESSES.put(view,new Press(link,event));
            return true;
        }
        Press press=PRESSES.get(view);
        if(press==null)return false;
        int slop=ViewConfiguration.get(view.getContext()).getScaledTouchSlop();
        if(Math.abs(event.getX()-press.x)>slop || Math.abs(event.getY()-press.y)>slop
                || event.getPointerCount()!=1)press.moved=true;
        if(action==MotionEvent.ACTION_UP || action==MotionEvent.ACTION_CANCEL) {
            PRESSES.remove(view);
            if(action==MotionEvent.ACTION_UP && !press.moved
                    && (press.link instanceof GigaLink || press.link instanceof SettingsOptionLinks.OptionLink || (press.link instanceof SiteCards.SiteLink ? Haiagaru.siteCardsEnabled() : Haiagaru.xPostPreviewEnabled()))
                    && event.getEventTime()-event.getDownTime()<ViewConfiguration.getLongPressTimeout()
                    && sameLink(press.link,hit(view,event)))press.link.onClick(view);
        }
        return true;
    }
    private static boolean sameLink(PostLink first, PostLink second) {
        return first == second || first instanceof GigaLink && second instanceof GigaLink
                && first.getURL().equals(second.getURL());
    }

    private static PostLink hit(TextView view, MotionEvent event) {
        CharSequence text=view.getText(); Layout layout=view.getLayout();
        if(!(text instanceof Spanned)||layout==null)return null;
        float x=event.getX()-view.getTotalPaddingLeft()+view.getScrollX();
        float y=event.getY()-view.getTotalPaddingTop()+view.getScrollY();
        if(y<0||y>=layout.getHeight())return null;
        int line=layout.getLineForVertical((int)y);
        if(x<layout.getLineLeft(line)||x>layout.getLineRight(line))return null;
        int offset=layout.getOffsetForHorizontal(line,x);
        Spanned spans=(Spanned)text;
        for (URLSpan link : spans.getSpans(offset,offset,URLSpan.class))
            if (offset>=spans.getSpanStart(link) && offset<spans.getSpanEnd(link)
                    && MediaUploadWebPolicy.gigaShare(link.getURL())) return new GigaLink(link.getURL());
        int left=Math.max(0,offset-180), right=Math.min(text.length(),offset+180);
        if (android.text.TextUtils.indexOf(text,".gigafile.nu/",left,right)>=0) {
            java.util.regex.Matcher url=GIGA_URL.matcher(text).region(left,right);
            while(url.find()) if(url.start()<=offset && offset<url.end()
                    && MediaUploadWebPolicy.gigaShare(url.group())) return new GigaLink(url.group());
        }
        for(PostLink link:spans.getSpans(offset,offset,PostLink.class))
            if(offset>=spans.getSpanStart(link)&&(offset<spans.getSpanEnd(link)
                    ||link instanceof SiteCards.SiteLink&&offset==spans.getSpanEnd(link)
                    &&line==layout.getLineForOffset(spans.getSpanStart(link))))return link;
        return null;
    }
}
