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
    return source

def stage(base,destination):
    base=Path(base);destination=Path(destination)
    previous.stage(base,destination)
    target=destination/"NicoliveActivity.java"
    if not target.is_file():
        target.write_text((base/"NicoliveActivity.java").read_text(encoding="utf-8"),encoding="utf-8")
    target.write_text(patch_activity(target.read_text(encoding="utf-8")),encoding="utf-8")
    return tuple(sorted(destination.glob("*.java")))
