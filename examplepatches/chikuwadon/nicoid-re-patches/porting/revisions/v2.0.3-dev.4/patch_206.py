"""v2.0.3-dev.4 follow-up; preserve user-verified dev.3 fixes."""
from pathlib import Path
import importlib.util
ROOT=Path(__file__).resolve().parent
BASE=ROOT.parent/"v2.0.3-dev.3"/"patch_205.py"
spec=importlib.util.spec_from_file_location("_nicoid_205_overlay",BASE)
previous=importlib.util.module_from_spec(spec)
spec.loader.exec_module(previous)
OVERRIDES=frozenset(previous.OVERRIDES)

def once(src,old,new,label):
 n=src.count(old)
 if n!=1:raise AssertionError("%s: expected one anchor, got %d"%(label,n))
 return src.replace(old,new)

def appbar(src):
 # Checking an open-status flag after a DrawerLayout animation starts is too
 # late. Detect the actual START drawer geometry, including opening frames.
 marker='''            if (view == null) return false;
            // The installed Nicoid APK ships an obfuscated androidx'''
 expanded='''            if (view == null) return false;
            if (view instanceof ViewGroup) {
                ViewGroup drawerRoot=(ViewGroup)view;
                for (int i=0;i<drawerRoot.getChildCount();i++){
                    View child=drawerRoot.getChildAt(i);
                    if(child.getVisibility()!=View.VISIBLE||child.getWidth()<=0||
                            child.getWidth()>=drawerRoot.getWidth()*.95f)continue;
                    float right=child.getLeft()+child.getTranslationX()+child.getWidth();
                    if(right>1f)return true; // Drawer partly or fully on screen
                }
            }
            // The installed Nicoid APK ships an obfuscated androidx'''
 src=once(src,marker,expanded,"drawer geometry during animation")
 # Dev.2/3 raised the entire content above the drawer and hid the real native
 # action bar. Restore the framework's *original* app/content layout instead.
 start=src.index('''                    // The native bottom app bar, not only the floating tab strip,''')
 finish=src.index('''                }''',src.index('''                    } else if (drawerWasOpen) {''',start))+len('''                }''')
 old=src[start:finish]
 new='''                    View normalContent = content == null ? null : content.get();
                    View normalChrome = appBar == null ? null : appBar.get();
                    if (open && !drawerWasOpen) {
                        drawerWasOpen = true;
                        // Native top action-bar geometry makes the drawer
                        // full-height and restores its own touch/z hierarchy.
                        if(normalContent != null){
                            normalContent.setTranslationY(0);
                            normalContent.setTranslationZ(0f);
                        }
                        if(normalChrome != null){
                            normalChrome.setTranslationY(0);
                            normalChrome.setAlpha(1f);
                        }
                    } else if (!open && drawerWasOpen) {
                        drawerWasOpen = false;
                        active.getWindow().getDecorView().post(this::apply);
                    }'''
 src=once(src,old,new,"stop reordering content over drawer")
 return src

def icons(src):
 return once(src,
    'if(!(root instanceof PopupPinchLayout)){View container=find(root,"viewctrllay");',
    'if(!(root instanceof PopupPinchLayout)){PlayerStart206.install(root);View container=find(root,"viewctrllay");',
    "suppress play overlay during initial buffer")

def live_activity(src):
 src=src.replace("NicoliveFloatingMini205 miniWindow","NicoliveFloatingMini206 miniWindow")
 src=src.replace("NicoliveFloatingMini205.install","NicoliveFloatingMini206.install")
 if "NicoliveFloatingMini205" in src:raise AssertionError("old in-app mini remains")
 return src

def stage(base,destination):
 base,destination=Path(base),Path(destination)
 previous.stage(base,destination)
 for name,transform in (
   ("AppBarPlacement202.java",appbar),
   ("PlayerIcons.java",icons),
   ("NicoliveActivity.java",live_activity)):
  f=destination/name
  f.write_text(transform(f.read_text(encoding="utf-8")),encoding="utf-8")
 return tuple(sorted(destination.glob("*.java")))
