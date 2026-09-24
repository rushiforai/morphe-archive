package app.yydarlinker.deepseekcaptions;
import android.content.Context;
import android.util.AttributeSet;
/** Separate persistent Shorts visibility, independent of the regular player shortcut. */
public final class CaptionShortsFlyoutPreference extends CaptionFlyoutPreference {
    public CaptionShortsFlyoutPreference(Context c){super(c);}
    public CaptionShortsFlyoutPreference(Context c,AttributeSet a){super(c,a);}
    public CaptionShortsFlyoutPreference(Context c,AttributeSet a,int d){super(c,a,d);}
    public CaptionShortsFlyoutPreference(Context c,AttributeSet a,int d,int r){super(c,a,d,r);}
    @Override protected boolean saved(){return DeepSeekConfig.shortsFlyoutMenuEnabled(getContext());}
    @Override protected void save(boolean visible){DeepSeekConfig.saveShortsFlyoutMenuEnabled(getContext(),visible);}
    @Override protected String title(){return "Shorts 弹出菜单中的 AI 字幕开关";}
}
