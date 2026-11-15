"""v2.0.3-dev.3 source overlay, preserving verified dev.2 modules."""
import importlib.util
from pathlib import Path

ROOT=Path(__file__).resolve().parent
BASE=ROOT.parent/"v2.0.3-dev.2"/"patch_204.py"
spec=importlib.util.spec_from_file_location("_nicoid_204_overlay",BASE)
previous=importlib.util.module_from_spec(spec)
spec.loader.exec_module(previous)
OVERRIDES=frozenset(set(previous.OVERRIDES)|{"NicoliveUi.java"})

def once(s,old,new,name):
    n=s.count(old)
    if n!=1:
        raise AssertionError("%s: expected exactly one anchor, got %d"%(name,n))
    return s.replace(old,new)

def appbar(src):
    return once(src,
        '''            try {
                return Boolean.TRUE.equals(view.getClass()
                    .getMethod("isDrawerVisible", int.class).invoke(view, Gravity.START));
            } catch (ReflectiveOperationException missing) {
                return false;
            }''',
        '''            // The installed Nicoid APK ships an obfuscated androidx
            // DrawerLayout. Its public isDrawerVisible(int) is named e(int).
            // The previous reflective lookup always failed, leaving bottom
            // action/tab bars visible over the last drawer entries.
            for (String method : new String[]{"e", "isDrawerVisible", "isDrawerOpen"}) {
                try {
                    Object value=view.getClass().getMethod(method,int.class)
                        .invoke(view,Gravity.START);
                    if (Boolean.TRUE.equals(value)) return true;
                } catch (ReflectiveOperationException ignored) { }
            }
            return false;''',
        "obfuscated DrawerLayout open detection")

def icons(src):
    src=once(src,
      'v.setBackground(new RippleDrawable(ColorStateList.valueOf((accent&0xffffff)|0x55000000),icon,mask));}',
      '''if(v instanceof android.widget.ImageView){
        // The native ImageButton already draws an image drawable. Painting
        // another icon as its background rendered two play glyphs on load.
        android.widget.ImageView image=(android.widget.ImageView)v;
        image.setImageTintList(null);
        image.setImageDrawable(icon);
        if(v instanceof android.widget.ImageButton&&(name.equals("play")||name.equals("pause")
             ||name.equals("prev")||name.equals("next")))
          v.setPadding(0,0,0,0);
        v.setBackground(new RippleDrawable(ColorStateList.valueOf((accent&0xffffff)|0x55000000),null,mask));
       }else{
        v.setBackground(new RippleDrawable(ColorStateList.valueOf((accent&0xffffff)|0x55000000),icon,mask));
       }}''',
      "remove native/custom glyph double-draw")
    src=once(src,
      'float glyphScale(){return fullscreenIcon(iconOwner())?.62f:.82f;}',
      '''float glyphScale(){
       if(fullscreenIcon(iconOwner())&&(name.equals("prev")||name.equals("next")))return 1.0f;
       return fullscreenIcon(iconOwner())?.62f:.82f;
      }''',
      "next/previous fullscreen glyph dimensions")
    return src

def liveui(src):
    return once(src,
      'p.setStrokeWidth(1.8f);p.setStrokeCap(Paint.Cap.ROUND);',
      'p.setStrokeWidth(name.equals("pause")||name.equals("play")?2.9f:name.equals("close")?2.4f:1.8f);p.setStrokeCap(Paint.Cap.ROUND);',
      "thicken NicoLive play/pause and floating close icons")

def live_activity(src):
    src=src.replace("NicoliveFloatingMini204 miniWindow","NicoliveFloatingMini205 miniWindow")
    src=src.replace("NicoliveFloatingMini204.install","NicoliveFloatingMini205.install")
    if "NicoliveFloatingMini204" in src:
        raise AssertionError("old mini type remains")
    src=once(src,
      'NicoliveFloatingMini205 miniWindow; boolean miniTouchSequence;',
      'NicoliveFloatingMini205 miniWindow; boolean miniTouchSequence, autoMiniPopup;',
      "mini app switch flag")
    src=once(src,
      ''' @Override protected void onResume(){super.onResume();refreshAccount();updateNowPlaying();}''',
      '''  @Override protected void onResume(){
    super.onResume();refreshAccount();
    if(autoMiniPopup&&service!=null&&service.popup!=null&&miniFrame!=null){
      service.returnToFrame(miniFrame);
      autoMiniPopup=false;
    }
    updateNowPlaying();
   }
   @Override protected void onUserLeaveHint(){
    super.onUserLeaveHint();
    // Only leave-app navigation promotes a small in-app mini to overlay;
    // opening notification shade does not invoke onUserLeaveHint.
    if(!watching&&miniWindow!=null
       &&miniWindow.getVisibility()==View.VISIBLE&&service!=null
       &&!service.stopped&&service.popup==null
       &&android.provider.Settings.canDrawOverlays(this)){
      int[] position=new int[2];
      miniWindow.getLocationOnScreen(position);
      service.showPopup();
      if(service.popup!=null){
       service.resizePopup(miniWindow.getWidth());
       service.movePopup(position[0],position[1]);
       miniWindow.setVisibility(View.GONE);
       autoMiniPopup=true;
      }
    }
   }''',
      "seamless background overlay handoff")
    return src

def stage(base,destination):
    base,destination=Path(base),Path(destination)
    previous.stage(base,destination)
    for name,transform in (
       ("AppBarPlacement202.java",appbar),
       ("PlayerIcons.java",icons),
       ("NicoliveActivity.java",live_activity),
    ):
        path=destination/name
        path.write_text(transform(path.read_text(encoding="utf-8")),encoding="utf-8")
    source=ROOT.parent/"v2.0.0-dev.1/java/e/e/a/NicoliveUi.java"
    (destination/"NicoliveUi.java").write_text(liveui(source.read_text(encoding="utf-8")),encoding="utf-8")
    return tuple(sorted(destination.glob("*.java")))
