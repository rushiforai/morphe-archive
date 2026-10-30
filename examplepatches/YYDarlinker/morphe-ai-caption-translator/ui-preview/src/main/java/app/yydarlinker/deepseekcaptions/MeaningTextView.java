package app.yydarlinker.deepseekcaptions;
import android.content.Context;
import android.graphics.Canvas;
import android.view.Gravity;
import android.widget.TextView;
import app.yydarlinker.caption.contracts.CaptionContracts;
/** Independent preview fixture. It is absent from production MPE. */
public final class MeaningTextView extends TextView {
    private String text="",target="zh-Hans",owner="",unitId="";private long intent=-1,epoch=-1,position;
    public long lastDrawNanos;public String lastDrawUnit="";public int lastFrom,lastTo;
    public MeaningTextView(Context c){super(c);setGravity(Gravity.CENTER);setMaxLines(2);setIncludeFontPadding(false);setTextSize(24);}
    public boolean apply(String text,String content,long nextIntent,long nextEpoch,long at,String target){
        if(nextIntent<intent||nextEpoch<epoch||nextIntent==intent&&!owner.isEmpty()&&!owner.equals(content))return false;
        intent=nextIntent;epoch=nextEpoch;owner=content;unitId=CaptionContracts.hash(content+":0:1");this.text=text;position=at;this.target=target;project();return true;}
    private void project(){if(text.isEmpty()||position<0||position>=60000){setText("");return;}
        CaptionRenderSpec spec=new CaptionRenderSpec(target,CaptionLanguageProfile.fromCode(target),target.startsWith("zh"));spec.apply(this);
        int[] cuts=CaptionUnicode.characterBoundaries(text,spec.locale);int begin=(int)(position/5000)%Math.max(1,cuts.length-1),end=Math.min(cuts.length-1,begin+20);
        lastFrom=cuts[begin];lastTo=cuts[end];setText(text.substring(lastFrom,lastTo));}
    @Override protected void onSizeChanged(int w,int h,int oldw,int oldh){super.onSizeChanged(w,h,oldw,oldh);project();}
    @Override protected void onDraw(Canvas c){super.onDraw(c);if(!text.isEmpty()&&getText().length()>0){lastDrawNanos=System.nanoTime();lastDrawUnit=unitId;}}
}
