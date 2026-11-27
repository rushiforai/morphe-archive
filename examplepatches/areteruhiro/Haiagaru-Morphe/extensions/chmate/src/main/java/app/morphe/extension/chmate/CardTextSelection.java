package app.morphe.extension.chmate;

import android.os.SystemClock;
import android.widget.TextView;
import java.util.WeakHashMap;

/** Prevent appended preview height from scrolling the row during native selection startup. */
public final class CardTextSelection {
    private static final WeakHashMap<TextView,Long> STARTING=new WeakHashMap<>();
    public static void begin(Object object){
        if(!(object instanceof TextView))return;
        TextView view=(TextView)object;CharSequence text=view.getText();
        if(text==null)return;
        CharSequence body=SiteCards.strip(text);
        if(body.length()!=text.length()||XPostPreview.originalText(body).length()!=body.length())
            STARTING.put(view,SystemClock.uptimeMillis()+350);
    }
    public static boolean suppressScroll(Object object){
        if(!(object instanceof TextView))return false;
        Long until=STARTING.get(object);
        if(until==null)return false;
        if(SystemClock.uptimeMillis()<=until)return true;
        STARTING.remove(object);return false;
    }
    private CardTextSelection(){}
}
