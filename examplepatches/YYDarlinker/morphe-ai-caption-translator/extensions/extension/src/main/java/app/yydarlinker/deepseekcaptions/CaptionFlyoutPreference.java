package app.yydarlinker.deepseekcaptions;
import android.content.Context;
import android.util.AttributeSet;
/** Independent menu visibility; never changes the caption engine, language or native CC state. */
public class CaptionFlyoutPreference extends AddonSwitchPreference {
    public CaptionFlyoutPreference(Context c){super(c);initialize();}
    public CaptionFlyoutPreference(Context c,AttributeSet a){super(c,a);initialize();}
    public CaptionFlyoutPreference(Context c,AttributeSet a,int d){super(c,a,d);initialize();}
    public CaptionFlyoutPreference(Context c,AttributeSet a,int d,int r){super(c,a,d,r);initialize();}
    protected boolean saved(){return DeepSeekConfig.flyoutMenuEnabled(getContext());}
    protected void save(boolean visible){DeepSeekConfig.saveFlyoutMenuEnabled(getContext(),visible);}
    protected String title(){return "普通视频弹出菜单中的 AI 字幕开关";}
    private void initialize(){
        setPersistent(false);
        setTitle(CaptionStrings.localize(getContext(),title()));
        setSummary(CaptionStrings.localize(getContext(),"在播放器弹出菜单中显示快捷开关；隐藏不关闭 AI 字幕，下次打开菜单生效"));
        setChecked(saved());
        setOnPreferenceChangeListener((p,value)->{
            boolean visible=Boolean.TRUE.equals(value);
            save(visible);
            setChecked(visible);return false;
        });
    }
    @Override protected void onBindView(android.view.View view){
        boolean visible=saved();
        if(isChecked()!=visible)setChecked(visible);
        super.onBindView(view);
    }
}
