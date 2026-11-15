"""Source-level v2.0.3-dev.2 fixes layered on the complete dev.1 patch."""
import importlib.util
from pathlib import Path

ROOT = Path(__file__).resolve().parent
BASE = ROOT.parent / "v2.0.3-dev.1" / "patch_203.py"
spec = importlib.util.spec_from_file_location("_nicoid_203_overlay", BASE)
previous = importlib.util.module_from_spec(spec)
spec.loader.exec_module(previous)
OVERRIDES = frozenset(set(previous.OVERRIDES) | {"PlayerIcons.java"})

def once(src, old, new, reason):
    found = src.count(old)
    if found != 1:
        raise AssertionError("%s: expected exactly one anchor, found %s" % (reason, found))
    return src.replace(old, new)

def appbar(src):
    src = once(src, "private boolean listening, updating;",
        "private boolean listening, updating, drawerWasOpen;", "drawer flag")
    old = """                    int visibility = drawerOpen(active) ? View.INVISIBLE : View.VISIBLE;
                    if (layer.getVisibility() != visibility)
                        layer.setVisibility(visibility);"""
    new = """                    boolean open = drawerOpen(active);
                    int visibility = open ? View.INVISIBLE : View.VISIBLE;
                    if (layer.getVisibility() != visibility)
                        layer.setVisibility(visibility);
                    // The native bottom app bar, not only the floating tab strip,
                    // otherwise occludes the drawer's Settings/Other entries.
                    View normalContent = content == null ? null : content.get();
                    View normalChrome = appBar == null ? null : appBar.get();
                    if (open) {
                        drawerWasOpen = true;
                        if (normalContent != null) {
                            if (normalContent.getTranslationY() != 0)
                                normalContent.setTranslationY(0);
                            if (normalContent.getTranslationZ() < 8f)
                                normalContent.setTranslationZ(8f);
                        }
                        if (normalChrome != null && normalChrome.getAlpha() != 0f)
                            normalChrome.setAlpha(0f);
                    } else if (drawerWasOpen) {
                        drawerWasOpen = false;
                        if (normalContent != null) normalContent.setTranslationZ(0f);
                        if (normalChrome != null) normalChrome.setAlpha(1f);
                        active.getWindow().getDecorView().post(this::apply);
                    }"""
    src=once(src,old,new,"restore all drawer bounds")
    # While drawer is visible, the normal placement must not override the
    # temporary full-height position that makes bottom menu entries reachable.
    src=once(src,"            if (updating) return;\n            Activity host = owner.get();",
             "            if (updating || drawerWasOpen) return;\n            Activity host = owner.get();",
             "drawer geometry lock")
    return src

def icons(src):
    src=once(src,"QueueButtons110.bind(root,null);",
             "QueueButtons110.bind(root,null);QueueVisibility204.attach(root);",
             "queue preference visibility listener")
    if src.count("paint.setStrokeWidth(.75f);")!=2:
        raise AssertionError("unexpected play/pause outline thickness")
    src=src.replace("paint.setStrokeWidth(.75f);","paint.setStrokeWidth(.42f);")
    original='''paint.setStyle(Paint.Style.FILL);Path skip=new Path();skip.moveTo(next?5:19,5);skip.lineTo(next?16:8,12);skip.lineTo(next?5:19,19);skip.close();c.drawPath(skip,paint);c.drawRoundRect(next?17:4,5,next?20:7,19,1,1,paint);break;'''
    replacement='''Path skip=new Path();skip.moveTo(next?5:19,5);skip.lineTo(next?16:8,12);skip.lineTo(next?5:19,19);skip.close();
     paint.setColor(0xaa000000);paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(.42f);
     c.drawPath(skip,paint);c.drawRoundRect(next?17:4,5,next?20:7,19,1,1,paint);
     paint.setColor(ink);paint.setAlpha(alpha);paint.setStyle(Paint.Style.FILL);
     c.drawPath(skip,paint);c.drawRoundRect(next?17:4,5,next?20:7,19,1,1,paint);break;'''
    return once(src,original,replacement,"prev/next matching dark outlines")

def live_frame(src):
    src=once(src,"    comments.setVisibility(GONE);\n    bottom.setVisibility(GONE);",
             "    comments.setVisibility(VISIBLE);\n    bottom.setVisibility(GONE);",
             "render live comments in compact player")
    return src

def live_activity(src):
    src=once(src,"NicolivePlayerFrame miniFrame; TextView miniTitle; ImageButton miniPlay;",
             "NicolivePlayerFrame miniFrame; TextView miniTitle; ImageButton miniPlay; NicoliveFloatingMini204 miniWindow; boolean miniTouchSequence;",
             "floating mini state")
    src=once(src,"miniFrame=null;miniTitle=null;miniPlay=null;",
             "miniFrame=null;miniTitle=null;miniPlay=null;miniWindow=null;",
             "clear floating mini on hub rebuild") if src.count("miniFrame=null;miniTitle=null;miniPlay=null;")==1 else src.replace("miniFrame=null;miniTitle=null;miniPlay=null;", "miniFrame=null;miniTitle=null;miniPlay=null;miniWindow=null;")
    assert "miniWindow=null;" in src
    start=src.index("   // YouTube-style in-app mini player:")
    end_anchor="body.addView(nowPlayingBar,new LinearLayout.LayoutParams(-1,NicoliveUi.dp(this,68)));"
    finish=src.index(end_anchor,start)+len(end_anchor)
    src=src[:start]+'''   // Movable overlay reuses the existing Media3 TextureView and comments.
   nowPlayingBar=null;
   miniFrame=new NicolivePlayerFrame(this,false);
   miniFrame.compact(true);
   miniWindow=NicoliveFloatingMini204.install(this,miniFrame,
     ()->{NicoliveService live=activeBroadcast();if(live!=null)watch(live.id);},
     ()->{NicoliveService live=activeBroadcast();if(live!=null)live.stopPlayback();updateNowPlaying();});
'''+src[finish:]
    start=src.index("  void updateNowPlaying(){")
    finish=src.index("\n  }",start)+len("\n  }")
    src=src[:start]+'''  void updateNowPlaying(){
   if(watching||miniWindow==null)return;
   NicoliveService live=activeBroadcast();
   boolean visible=live!=null&&live.popup==null;
   miniWindow.setVisibility(visible?View.VISIBLE:View.GONE);
   if(!visible)return;
   if(miniFrame!=null&&live.frame!=miniFrame)live.returnToFrame(miniFrame);
   miniWindow.sync(live);
  }'''+src[finish:]
    old='''  if (!watching && listGestures.handle(this,feed,event)) return true;
  return super.dispatchTouchEvent(event);'''
    new='''  if(!watching){
   int type=event.getActionMasked();
   if(type==MotionEvent.ACTION_DOWN){
    android.graphics.Rect bounds=new android.graphics.Rect();
    miniTouchSequence=miniWindow!=null&&miniWindow.getVisibility()==View.VISIBLE
        &&miniWindow.getGlobalVisibleRect(bounds)
        &&bounds.contains((int)event.getRawX(),(int)event.getRawY());
   }
   if(miniTouchSequence){
    boolean handled=super.dispatchTouchEvent(event);
    if(type==MotionEvent.ACTION_UP||type==MotionEvent.ACTION_CANCEL)miniTouchSequence=false;
    return handled;
   }
   if(listGestures.handle(this,feed,event))return true;
  }
  return super.dispatchTouchEvent(event);'''
    return once(src,old,new,"float mini touch routing")

def stage(base,destination):
    base,destination=Path(base),Path(destination)
    previous.stage(base,destination)
    for name,modify in (
        ("AppBarPlacement202.java",appbar),
        ("NicoliveActivity.java",live_activity),
        ("NicolivePlayerFrame.java",live_frame),
    ):
        path=destination/name
        path.write_text(modify(path.read_text(encoding="utf-8")),encoding="utf-8")
    source=ROOT.parent/"v1.10.0/src/e/e/a/PlayerIcons.java"
    (destination/"PlayerIcons.java").write_text(
        icons(source.read_text(encoding="utf-8")),encoding="utf-8")
    return tuple(sorted(destination.glob("*.java")))
