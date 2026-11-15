package app.morphe.extension.chmate;

import android.content.Intent;
import android.net.Uri;
import android.text.Layout;
import android.view.MotionEvent;
import android.view.ViewConfiguration;
import android.widget.TextView;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Base64;
import java.util.WeakHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

final class QuotedPostChecker {
    private static final Pattern HEADER=Pattern.compile(
            "^[\\s>＞]*(?:[0-9]{1,6}(?:\\s*[:：]\\s*|\\s+))?(?:名前\\s*[:：]\\s*)?(風吹けば名無し|それでも動く名無し)"
            +"[^\\r\\n]{0,100}?([0-9]{4}|[0-9]{2})/([0-9]{1,2})/([0-9]{1,2})"
            +"(?:\\([^\\r\\n)]{1,4}\\))?[ \\t]+[0-9]{1,2}:[0-9]{2}:[0-9]{2}(?:\\.[0-9]{1,9})?"
            +"[ \\t]+ID:([A-Za-z0-9+/]{8,12})(?=$|[\\s（(])");
    private static final WeakHashMap<TextView,Press> PRESSES=new WeakHashMap<>();
    private static boolean replaying;
    private static final class Press {
        final String address;
        final CharSequence text;
        final float x,y;
        Press(String address,CharSequence text,MotionEvent event){
            this.address=address;this.text=text;x=event.getX();y=event.getY();
        }
    }

    static String target(String line,int offset){
        if(line.length()>300)return null;
        Matcher match=HEADER.matcher(line);
        if(!match.find()||offset<match.start(5)-3||offset>=match.end(5))return null;
        try{
            int year=Integer.parseInt(match.group(2));
            if(year<100)year+=2000;
            LocalDate day=LocalDate.of(year,Integer.parseInt(match.group(3)),Integer.parseInt(match.group(4)));
            String board=match.group(1).equals("風吹けば名無し")?"livejupiter":"livegalileo";
            String id=Base64.getUrlEncoder().withoutPadding().encodeToString(match.group(5).getBytes(java.nio.charset.StandardCharsets.US_ASCII));
            return "http://hissi.org/read.php/"+board+"/"+day.format(DateTimeFormatter.BASIC_ISO_DATE)+"/"+id+".html";
        }catch(RuntimeException invalid){return null;}
    }

    static boolean touch(TextView view,MotionEvent event){
        if(replaying)return false;
        int action=event.getActionMasked();
        if(action==MotionEvent.ACTION_DOWN){
            PRESSES.remove(view);
            Layout layout=view.getLayout();
            CharSequence text=view.getText();
            if(layout==null||text==null||view instanceof android.widget.EditText)return false;
            float y=event.getY()-view.getTotalPaddingTop()+view.getScrollY();
            if(y<0||y>=layout.getHeight())return false;
            int row=layout.getLineForVertical((int)y);
            float x=event.getX()-view.getTotalPaddingLeft()+view.getScrollX();
            if(x<layout.getLineLeft(row)||x>=layout.getLineRight(row))return false;
            int offset=layout.getOffsetForHorizontal(row,x);
            int start=offset,end=offset;
            while(start>0&&offset-start<300&&text.charAt(start-1)!='\n')start--;
            while(end<text.length()&&end-start<=300&&text.charAt(end)!='\n')end++;
            String address=target(text.subSequence(start,end).toString(),offset-start);
            if(address==null)return false;
            PRESSES.put(view,new Press(address,text,event));
            return true;
        }
        Press press=PRESSES.get(view);
        if(press==null)return false;
        int slop=ViewConfiguration.get(view.getContext()).getScaledTouchSlop();
        if(action==MotionEvent.ACTION_CANCEL||event.getPointerCount()!=1||Math.abs(event.getX()-press.x)>slop||Math.abs(event.getY()-press.y)>slop)
            PRESSES.remove(view);
        else if(action==MotionEvent.ACTION_UP){
            PRESSES.remove(view);
            boolean held=event.getEventTime()-event.getDownTime()>=ViewConfiguration.getLongPressTimeout();
            if(view.getText()==press.text&&held){
                Intent open=new Intent(Intent.ACTION_VIEW,Uri.parse(press.address)).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                if(Haiagaru.dedicatedCheckerViewerAvailable()){
                    open.setClass(view.getContext(),HissiMenuActivity.class);
                    open.putExtra("haiagaru.checker.forceHissi",true);
                }
                try{view.getContext().startActivity(open);}
                catch(android.content.ActivityNotFoundException ignored){}
            }else if(!held&&view.getText()==press.text){
                // Preserve ChMate's ordinary tap on a quoted ID. The original
                // down was held back to prevent the wrong native long press.
                MotionEvent down=MotionEvent.obtain(event);
                down.setAction(MotionEvent.ACTION_DOWN);
                down.setLocation(press.x,press.y);
                replaying=true;
                try{if(view.dispatchTouchEvent(down))view.dispatchTouchEvent(event);}
                finally{replaying=false;down.recycle();}
            }
        }
        return true;
    }
    private QuotedPostChecker(){}
}
