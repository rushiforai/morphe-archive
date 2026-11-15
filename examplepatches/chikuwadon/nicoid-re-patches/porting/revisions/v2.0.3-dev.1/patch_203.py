"""Immutable v2.0.3-dev.1 source delta on user-verified v2.0.2-dev.4."""
import importlib.util
from pathlib import Path

ROOT = Path(__file__).resolve().parent
PREVIOUS = ROOT.parent / "v2.0.2-dev.4" / "patch_202.py"
spec = importlib.util.spec_from_file_location("_nicoid_202_overlay", PREVIOUS)
previous = importlib.util.module_from_spec(spec)
spec.loader.exec_module(previous)
OVERRIDES = frozenset(set(previous.OVERRIDES) | {
    "AmbientLight.java", "AppBarPlacement202.java",
    "NicoliveActivity.java", "NicolivePlayerFrame.java",
})

def once(source, old, new, label):
    if source.count(old) != 1:
        raise AssertionError("%s: expected one anchor, got %d" % (label, source.count(old)))
    return source.replace(old, new)

def patch_ambient(source):
    # A nearly motionless dark patch is part of the actual video, not a
    # decoder letterbox. Inferring geometry from luminance shifted the glow
    # inside the fullscreen picture (introduced with Ambient Mode v1.11.0).
    return once(source, """            if (mode == FULL) {
                content.left = darkMargin(sample, 2);
                content.right -= darkMargin(sample, 3);
                content.top = darkMargin(sample, 0);
                content.bottom -= darkMargin(sample, 1);
            }
""", """            // Use the measured visible Surface/Texture bounds in fullscreen.
            // Never infer video margins from stationary or dark image pixels.
""", "fullscreen dark-content bleed")

def patch_appbar(source):
    source = once(source,
        "import android.view.MotionEvent;",
        "import android.view.MotionEvent;\nimport android.view.Gravity;",
        "drawer geometry import")
    source = once(source,
        "        private WeakReference<View> appBar, content;",
        """        private WeakReference<View> appBar, content, drawer;
        private boolean drawerOpen(Activity host) {
            View view = drawer == null ? null : drawer.get();
            if (view == null || !view.isAttachedToWindow()) {
                view = find(host.getWindow().getDecorView(), "DrawerLayout");
                if (view != null) drawer = new WeakReference<>(view);
            }
            if (view == null) return false;
            try {
                return Boolean.TRUE.equals(view.getClass()
                    .getMethod("isDrawerVisible", int.class).invoke(view, Gravity.START));
            } catch (ReflectiveOperationException missing) {
                return false;
            }
        }
        // Calculate the actual occlusion, not a hardcoded app/tab height:
        // the content frame is already translated for several arrangements.
        // Geometry based docking keeps the mini visible without a blank gap.
        private void avoidMiniOverlap(Activity host, int mode, int appH, int tabH) {
            ViewGroup contentHost = host.findViewById(android.R.id.content);
            if (contentHost == null) return;
            View mini = contentHost.findViewWithTag("nicoid-retained-mini-player");
            if (mini == null || mini.getHeight() < 2) return;
            if (mini.getHeight() > PanelUi.dp(host, 76)) {
                if (mini.getTranslationY() != 0) mini.setTranslationY(0);
                return;
            }
            if (mini.getTranslationY() != 0) mini.setTranslationY(0);
            int[] xy = new int[2], position = new int[2];
            mini.getLocationOnScreen(position);
            int miniTop = position[1], miniBottom = miniTop + mini.getHeight();
            int overlap = 0;
            View nativeApp = appBar == null ? null : appBar.get();
            View tabs = strip == null ? null : strip.get();
            for (View fixed : new View[]{nativeApp, tabs}) {
                if (fixed == null || fixed.getVisibility() != View.VISIBLE
                    || fixed.getHeight() <= 0) continue;
                fixed.getLocationOnScreen(xy);
                if (xy[1] < miniBottom && xy[1] + fixed.getHeight() > miniTop)
                    overlap = Math.max(overlap, miniBottom - xy[1]);
            }
            if (overlap > 0) mini.setTranslationY(-overlap);
        }""","drawer and mini helpers")
    source = once(source,
        """            decor.getViewTreeObserver().addOnGlobalLayoutListener(this);
            listening = true;""",
        """            decor.getViewTreeObserver().addOnGlobalLayoutListener(this);
            // Drawer uses translation/animation without guaranteeing a new
            // global layout. Its scrim and hit targets must always win over
            // the floating strip, even while the drawer is sliding.
            decor.getViewTreeObserver().addOnPreDrawListener(() -> {
                Activity active = owner.get();
                FrameLayout layer = overlay == null ? null : overlay.get();
                if (active != null && layer != null) {
                    int visibility = drawerOpen(active) ? View.INVISIBLE : View.VISIBLE;
                    if (layer.getVisibility() != visibility)
                        layer.setVisibility(visibility);
                }
                return true;
            });
            listening = true;""",
        "drawer on-pre-draw check")
    source = once(source,
        """                lastMode = mode;""",
        """                 avoidMiniOverlap(host, mode, h, t);
                 lastMode = mode;""",
        "position mini above bottom bars")
    return source

def patch_player(source):
    source = once(source,
        " final boolean popup;",
        " final boolean popup;\n boolean compact;",
        "mini frame mode")
    source = once(source,
        " void fullscreen(boolean full){",
        """ void compact(boolean value){
   compact=value;
   if(compact){
    comments.setVisibility(GONE);
    bottom.setVisibility(GONE);
    top.setVisibility(GONE);
    setClickable(false);
    video.setClickable(false);
   }
  }
  void fullscreen(boolean full){""",
        "mini mode control")
    source = once(source,
        "  if(owner==null)return;boolean playing=owner.playRequested();",
        """   if(owner==null)return;
   if(compact){bottom.setVisibility(GONE);return;}
   boolean playing=owner.playRequested();""",
        "mini mode does not show player buttons")
    return source

def patch_live(source):
    source = once(source,
        " LinearLayout categoryTabs,nowPlayingBar;",
        " LinearLayout categoryTabs,nowPlayingBar; NicolivePlayerFrame miniFrame; TextView miniTitle; ImageButton miniPlay;",
        "live mini fields")
    source = once(source,
        "playerFrame=null;input=null;chat=null;base();",
        """playerFrame=null;input=null;chat=null;
   if(service!=null&&miniFrame!=null)service.detach(miniFrame);
   miniFrame=null;miniTitle=null;miniPlay=null;
   base();""",
        "release old mini on hub recreation")
    source = once(source,
        "++loadToken;viewer();Intent start=",
        """++loadToken;
   if(service!=null&&miniFrame!=null)service.detach(miniFrame);
   miniFrame=null;miniTitle=null;miniPlay=null;
   viewer();Intent start=""",
        "detach mini before watching")
    old = '''  nowPlayingBar=NicoliveUi.row(this);
  Button resume=NicoliveUi.button(this,"再生中の生放送に戻る");
  nowPlayingBar.addView(resume,new LinearLayout.LayoutParams(0,NicoliveUi.dp(this,48),1));
  resume.setOnClickListener(v->{NicoliveService playing=activeBroadcast();if(playing!=null)watch(playing.id);});
  ImageButton close=NicoliveUi.icon(this,"close","再生中の生放送を閉じる");
  close.setTag("nicoid-live-close-broadcast");
  nowPlayingBar.addView(close);
  close.setOnClickListener(v->{
   NicoliveService playing=activeBroadcast();
   if(playing!=null)playing.stopPlayback();
   updateNowPlaying();
  });
  body.addView(nowPlayingBar,new LinearLayout.LayoutParams(-1,NicoliveUi.dp(this,48)));'''
    new = '''   // YouTube-style in-app mini player: reuse the one Media3 Service
   // session and move only its video TextureView output.
   nowPlayingBar=NicoliveUi.row(this);
   nowPlayingBar.setGravity(Gravity.CENTER_VERTICAL);
   nowPlayingBar.setBackground(NicoliveUi.panel(this,4));
   miniFrame=new NicolivePlayerFrame(this,false);
   miniFrame.compact(true);
   FrameLayout thumb=new FrameLayout(this);
   thumb.addView(miniFrame,new FrameLayout.LayoutParams(-1,-1));
   nowPlayingBar.addView(thumb,new LinearLayout.LayoutParams(NicoliveUi.dp(this,116),-1));
   miniTitle=NicoliveUi.text(this,"再生中の生放送",13);
   miniTitle.setSingleLine(true);
   miniTitle.setEllipsize(TextUtils.TruncateAt.END);
   miniTitle.setPadding(NicoliveUi.dp(this,9),0,0,0);
   nowPlayingBar.addView(miniTitle,new LinearLayout.LayoutParams(0,-1,1));
   miniTitle.setGravity(Gravity.CENTER_VERTICAL);
   miniPlay=NicoliveUi.icon(this,"pause","一時停止");
   nowPlayingBar.addView(miniPlay);
   miniPlay.setOnClickListener(v->{
    NicoliveService live=activeBroadcast();
    if(live!=null){if(live.playRequested())live.pause();else live.resume();updateNowPlaying();}
   });
   ImageButton close=NicoliveUi.icon(this,"close","再生中の生放送を閉じる");
   close.setTag("nicoid-live-close-broadcast");
   nowPlayingBar.addView(close);
   close.setOnClickListener(v->{
    NicoliveService live=activeBroadcast();
    if(live!=null)live.stopPlayback();
    updateNowPlaying();
   });
   thumb.setOnClickListener(v->{NicoliveService live=activeBroadcast();if(live!=null)watch(live.id);});
   miniTitle.setOnClickListener(v->{NicoliveService live=activeBroadcast();if(live!=null)watch(live.id);});
   body.addView(nowPlayingBar,new LinearLayout.LayoutParams(-1,NicoliveUi.dp(this,68)));'''
    source = once(source, old, new, "real live mini player replaces text-only bar")
    source = once(source,
        """ void updateNowPlaying(){
  if(!watching&&nowPlayingBar!=null)nowPlayingBar.setVisibility(activeBroadcast()==null?View.GONE:View.VISIBLE);
 }""",
        """  void updateNowPlaying(){
   if(watching||nowPlayingBar==null)return;
   NicoliveService live=activeBroadcast();
   // Do not steal video output from an external popup overlay.
   boolean visible=live!=null&&live.popup==null;
   nowPlayingBar.setVisibility(visible?View.VISIBLE:View.GONE);
   if(!visible)return;
   if(miniTitle!=null){
    String text=live.program!=null&&!live.program.title.isEmpty()?
        live.program.title:"再生中の生放送";
    if(!text.contentEquals(miniTitle.getText()))miniTitle.setText(text);
   }
   if(miniPlay!=null){
    boolean playing=live.playRequested();
    miniPlay.setContentDescription(playing?"一時停止":"再生");
    miniPlay.setImageDrawable(new NicoliveUi.Glyph(playing?"pause":"play",Color.WHITE));
   }
   if(miniFrame!=null&&live.frame!=miniFrame)live.returnToFrame(miniFrame);
  }""",
        "update Media3 mini without reconnect")
    return source

def stage(base, destination):
    base, destination = Path(base), Path(destination)
    previous.stage(base, destination)
    for name, transform in (
        ("AmbientLight.java", patch_ambient),
        ("AppBarPlacement202.java", patch_appbar),
        ("NicoliveActivity.java", patch_live),
        ("NicolivePlayerFrame.java", patch_player),
    ):
        file = destination/name
        source = file if file.is_file() else ROOT.parent/"v2.0.2-dev.4"/"java/e/e/a"/name
        if not source.is_file():
            raise FileNotFoundError(source)
        file.write_text(transform(source.read_text(encoding="utf-8")),encoding="utf-8")
    return tuple(sorted(destination.glob("*.java")))
