from pathlib import Path
import xml.etree.ElementTree as E
import json,sys
root=Path(sys.argv[1]);a="{http://schemas.android.com/apk/res/android}"
found=[]
for p in root.rglob("*.xml"):
 if p.parent.name!="xml":continue
 try:r=E.parse(p).getroot()
 except E.ParseError:continue
 for screen in r.iter("PreferenceScreen"):
  children=list(screen);keys=[c.get(a+"key") for c in children]
  if "deepseek_caption_enabled" not in keys:continue
  i=keys.index("deepseek_caption_enabled")
  assert keys[i+1:i+3]==["deepseek_caption_flyout_menu","deepseek_caption_shorts_flyout_menu"],(str(p),keys)
  for child,key,cls,title in zip(children[i+1:i+3],keys[i+1:i+3],["CaptionFlyoutPreference","CaptionShortsFlyoutPreference"],["cap_flyout_title","cap_shorts_flyout_title"]):
   assert child.tag=="app.yydarlinker.deepseekcaptions."+cls
   assert child.get(a+"title")=="@string/"+title
   assert child.get(a+"summary")=="@string/cap_flyout_summary"
   assert child.get(a+"dependency") is None
  found.append(str(p))
assert found,"Generated AI settings screen not found"
print(json.dumps({"generated_settings_screens":found,"adjacent_independent_switches":True},indent=2))
