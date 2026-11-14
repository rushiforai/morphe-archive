"""Strict source overlay for v2.0.2-dev.1 NicoLive app-bar placement."""
import importlib.util
from pathlib import Path

ROOT=Path(__file__).resolve().parent
PREVIOUS=ROOT.parent / "v2.0.1-dev.7/patch_207.py"
spec=importlib.util.spec_from_file_location("_nicoid_207_overlay", PREVIOUS)
previous=importlib.util.module_from_spec(spec)
spec.loader.exec_module(previous)
OVERRIDES=frozenset(set(previous.OVERRIDES)|{"NicoliveActivity.java"})

def once(source,old,new,label):
    if source.count(old)!=1:
        raise ValueError(f"NicoLive {label}: expected one anchor, got {source.count(old)}")
    return source.replace(old,new)

def patch_activity(source):
    source=once(source,
        '  body.addView(hubNavigation());\n  updateNowPlaying();',
        '   body.addView(hubNavigation());\n'
        '   NicoliveAppBarPlacement.place(root,body,header,NicoliveAppBarPlacement.position(prefs()));\n'
        '   updateNowPlaying();',"hub navigation placement")
    source=once(source,
        '  Button tap=settingChoiceRow(options,refresh.getCompoundPaddingStart());',
        '  Button tap=settingChoiceRow(options,refresh.getCompoundPaddingStart());\n'
        '   Button appBar=settingChoiceRow(options,refresh.getCompoundPaddingStart());',
        "new app bar choice")
    source=once(source,
        '   ExitModeOptions.mode(this,ExitModeOptions.LIVE_KEY)};',
        '    ExitModeOptions.mode(this,ExitModeOptions.LIVE_KEY),\n'
        '    NicoliveAppBarPlacement.position(preferences)};',
        "app bar state")
    source=once(source,
        '  bindSettingChoice(tap,"タップ時の動作",new String[]{"通常再生","ポップアップ再生"},selections,2);',
        '  bindSettingChoice(tap,"タップ時の動作",new String[]{"通常再生","ポップアップ再生"},selections,2);\n'
        '   bindSettingChoice(appBar,"アプリバーの配置",NicoliveAppBarPlacement.LABELS,selections,4);',
        "new setting choice")
    source=once(source,
        '.putBoolean(START_TIME,selections[1]==1).putInt(TAP_BEHAVIOR,selections[2]).apply();\n    updateHubDisplayOptions();',
        '.putBoolean(START_TIME,selections[1]==1).putInt(TAP_BEHAVIOR,selections[2])\n'
        '      .putInt(NicoliveAppBarPlacement.KEY,selections[4]).apply();\n'
        '     if(!watching)NicoliveAppBarPlacement.place(root,body,header,selections[4]);\n'
        '     updateHubDisplayOptions();',
        "apply without network reload")
    # The NicoLive overflow is a compact action menu, not a settings page.
    # Keep its placement attached to the actual 3-dot button even when
    # the live app bar is moved around the bottom navigation.
    source=once(source,
        'AlertDialog menu=UiDialogs.builder(this).setTitle("ニコ生")',
        'AlertDialog menu=UiDialogs.builder(this)',
        "remove redundant NicoLive menu heading")
    source=once(source,
        '''  if(window!=null){
   window.setGravity(Gravity.TOP|Gravity.END);
   WindowManager.LayoutParams layout=window.getAttributes();
   layout.y=NicoliveUi.dp(this,48);
   window.setAttributes(layout);
   window.setLayout(Math.min(getResources().getDisplayMetrics().widthPixels,NicoliveUi.dp(this,288)),
    ViewGroup.LayoutParams.WRAP_CONTENT);
  }''',
        '''   if(window!=null){
    android.graphics.Rect visible=new android.graphics.Rect();
    getWindow().getDecorView().getWindowVisibleDisplayFrame(visible);
    int[] anchor=new int[2];
    header.getLocationOnScreen(anchor);
    int location=NicoliveAppBarPlacement.position(prefs());
    if(location==0){
     window.setGravity(Gravity.TOP|Gravity.END);
    }else{
     window.setGravity(Gravity.BOTTOM|Gravity.END);
    }
    WindowManager.LayoutParams layout=window.getAttributes();
    layout.x=NicoliveUi.dp(this,8);
    layout.y=location==0
     ? Math.max(0,anchor[1]+header.getHeight()-visible.top)
     : Math.max(0,visible.bottom-anchor[1]);
    window.setAttributes(layout);
    int available=Math.max(NicoliveUi.dp(this,200),
     getResources().getDisplayMetrics().widthPixels-NicoliveUi.dp(this,24));
    window.setLayout(Math.min(available,NicoliveUi.dp(this,244)),
     ViewGroup.LayoutParams.WRAP_CONTENT);
   }''',
        "overflow aligned with current app bar and sized to actions")
    return source

def stage(base,destination):
    base=Path(base);destination=Path(destination)
    previous.stage(base,destination)
    target=destination/"NicoliveActivity.java"
    if not target.is_file():
        target.write_text((base/"NicoliveActivity.java").read_text(encoding="utf-8"),encoding="utf-8")
    target.write_text(patch_activity(target.read_text(encoding="utf-8")),encoding="utf-8")
    return tuple(sorted(destination.glob("*.java")))
