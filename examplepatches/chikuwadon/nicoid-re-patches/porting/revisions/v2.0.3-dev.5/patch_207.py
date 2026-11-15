"""v2.0.3-dev.5: rebuild broken presentation hooks on stable source, keep confirmed fixes."""
from pathlib import Path
import importlib.util
ROOT=Path(__file__).resolve().parent
BASE=ROOT.parent/"v2.0.3-dev.4"/"patch_206.py"
spec=importlib.util.spec_from_file_location("_nicoid_206_overlay",BASE)
previous=importlib.util.module_from_spec(spec)
spec.loader.exec_module(previous)
BASE203=ROOT.parent/"v2.0.3-dev.1"/"patch_203.py"
s203=importlib.util.spec_from_file_location("_nicoid_203_drawer",BASE203)
old203=importlib.util.module_from_spec(s203)
s203.loader.exec_module(old203)
OVERRIDES=frozenset(set(previous.OVERRIDES)|{"RetainedPlayback137.java"})

def one(src,before,after,label):
 n=src.count(before)
 if n!=1:raise AssertionError("%s: expected one anchor, found %d"%(label,n))
 return src.replace(before,after)

def restore_drawer():
 # dev.2-dev.4 changed ContentFrameLayout's vertical position and alpha
 # while the drawer was opening, breaking menu taps. Use the dev.1 geometry
 # and only correct decor-layer draw/touch priority.
 original=(ROOT.parent/"v2.0.2-dev.4/java/e/e/a/AppBarPlacement202.java").read_text(encoding="utf-8")
 src=old203.patch_appbar(original)
 import re
 pattern=r"            decor.getViewTreeObserver\(\).addOnPreDrawListener\(\(\) -> \{.*?\n            \}\);\n"
 src,n=re.subn(pattern,"",src,count=1,flags=re.DOTALL)
 if n!=1:raise AssertionError("native pre-draw tab visibility hook changed")
 begin=src.index("        private boolean drawerOpen(Activity host) {")
 end=src.index("        // Calculate the actual occlusion",begin)
 src=src[:begin]+src[end:]
 src=one(src,"private WeakReference<View> appBar, content, drawer;",
             "private WeakReference<View> appBar, content;","remove defunct drawer weakref")
 src=one(src,"import android.view.Gravity;\n","","remove obfuscated method")
 src=one(src,"                lastMode = mode;",
    "                DrawerFront207.attach(host, frame, layer);\n                lastMode = mode;",
    "only bring the existing native drawer above floating tabs")
 return src

def player(src):
 return one(src,"PlayerStart206.install(root)","PlayerStart207.install(root)",
            "hide complete prev/play/next cluster while buffering")

def normal_ambient(src):
 src=one(src,
   "            content.set(0, 0, size, size);\n",
   """            content.set(0, 0, size, size);
            if (mode == NORMAL) {
                // TextureView fills the container even when its decoded picture
                // has an opaque black letterbox inside. Use genuine content
                // bounds so that BOTH exposed side bands get ambient light.
                int left = normalBlackBand(sample, 2);
                int right = normalBlackBand(sample, 3);
                if (left >= 2 && left < size / 2) content.left = left;
                if (right >= 2 && right < size / 2) content.right -= right;
            }
            """,
   "sample stable normal-mode interior video edges")
 src=one(src,"    private static int darkMargin(Bitmap b, int edge) {",
   """    private static int normalBlackBand(Bitmap b,int edge) {
        int size=b.getWidth();
        int max=Math.max(2,Math.round(size*.40f));
        int n=0;
        while(n<max && litPixels(b,edge,n,20)<=Math.max(1,size/12)) n++;
        if(n<2 || n>=max || n+1>=size)return 0;
        int required=Math.max(2,size/5);
        return litPixels(b,edge,n,36)>=required
             && litPixels(b,edge,n+1,36)>=required ? n : 0;
    }
    private static int darkMargin(Bitmap b, int edge) {""",
   "conditional black letterbox border detection")
 src=one(src,
   "            int sideSafe = dp(root, split ? 8 : 10);",
   """            int sideSafe = dp(root, split ? 8 : 10);
            int leftSafe = glow.video.left > dp(root, 12)
                    ? dp(root, Math.min(108, config[1])) : sideSafe;
            int rightSafe = target.getWidth() - glow.video.right > dp(root, 12)
                    ? dp(root, Math.min(108, config[1])) : sideSafe;""",
   "allow ambient spread inside real source-side black gutters")
 src=one(src,"Math.min(sideSafe, r.left - leftInset)",
             "Math.min(leftSafe, r.left - leftInset)","left exterior")
 src=one(src,"Math.min(sideSafe, decor.getWidth() - rightInset - r.right)",
             "Math.min(rightSafe, decor.getWidth() - rightInset - r.right)","right exterior")
 return src

def retained(src):
 src=one(src,
   '    @Override public void onStop(){send(target,"stop");}',
   '''    @Override public void onStop(){send(target,"stop");}
    @Override public void onSeekTo(long requested){
     // The system notification selects this retained MediaSession when the
     // Activity goes to the background. Forward scrubbing to the SAME player.
     if(!usable(target))return;
     try{
      long duration=((Number)call(target.player,"getDuration")).longValue();
      long bounded=Math.max(0,duration>0?Math.min(duration,requested):requested);
      target.player.getClass().getMethod("seekTo",long.class).invoke(target.player,bounded);
      Log.i(TAG,"Retained MediaSession seekTo="+bounded+" token="+target.token);
      MAIN.post(()->{
       if(usable(target)&&target.service!=null)notifyPlayback(target.service,target);
      });
     }catch(Exception e){Log.w(TAG,"Retained seekTo rejected",e);}
    }''',
   "system notification seek forwarding to existing decoder")
 src=one(src,
    '''   });
   s.media.setActive(true);''',
    '''   }, MAIN);
   s.media.setActive(true);''',
    "execute retained media controls on main handler")
 src=one(src,
   "PlaybackState.ACTION_PLAY|PlaybackState.ACTION_PAUSE|PlaybackState.ACTION_STOP)",
   "PlaybackState.ACTION_PLAY|PlaybackState.ACTION_PAUSE|PlaybackState.ACTION_STOP|PlaybackState.ACTION_SEEK_TO)",
   "advertise actual seek support in background MediaSession")
 return src

def stage(base,destination):
 base,destination=Path(base),Path(destination)
 previous.stage(base,destination)
 for name,transform in (
  ("PlayerIcons.java",player),("AmbientLight.java",normal_ambient)):
  p=destination/name
  p.write_text(transform(p.read_text(encoding="utf-8")),encoding="utf-8")
 (destination/"AppBarPlacement202.java").write_text(restore_drawer(),encoding="utf-8")
 retained_source=ROOT.parent/"v1.11.1/java/e/e/a/RetainedPlayback137.java"
 (destination/"RetainedPlayback137.java").write_text(
   retained(retained_source.read_text(encoding="utf-8")),encoding="utf-8")
 return tuple(sorted(destination.glob("*.java")))
