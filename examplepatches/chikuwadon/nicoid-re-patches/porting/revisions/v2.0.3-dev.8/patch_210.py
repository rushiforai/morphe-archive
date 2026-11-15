"""v2.0.3-dev.8: continuous 4:3 lower-left ambient corner and drawer/rotation regression."""
from pathlib import Path
import importlib.util

ROOT=Path(__file__).resolve().parent
PREV=ROOT.parent/"v2.0.3-dev.7/patch_209.py"
spec=importlib.util.spec_from_file_location("_nicoid_dev7_patch",PREV)
previous=importlib.util.module_from_spec(spec)
spec.loader.exec_module(previous)
OVERRIDES=frozenset(previous.OVERRIDES)

def once(source,old,new,label):
    count=source.count(old)
    if count!=1: raise AssertionError("%s: expected one anchor, got %d"%(label,count))
    return source.replace(old,new)

def extend_corner(source):
    # Draw the lower-left quarter halo only on the tab BACKGROUND.
    # Native tabs and text are painted over it and are never touched.
    source=once(source,"tabGlow.sides = split ? 8 : 2;",
                "tabGlow.sides = split ? 8 : (2 | 4);",
                "left tab edge")
    source=once(source,"tabGlow.corners = split;",
                "tabGlow.corners = true;",
                "shared bottom-left corner")
    anchor='''                    AmbientGeometryTrace.record("normal ambient local="+visiblePicture.toShortString()'''
    replacement='''                    // Stitch the player left edge to the tab's lower-left
                    // shared quarter ellipse in the tab's own coordinates.
                    if (tabGlowActive && !split && normalTabView != null) {
                        int[] tabScreen = new int[2];
                        normalTabView.getLocationOnScreen(tabScreen);
                        tabGlow.video.set(visiblePicture);
                        tabGlow.video.offset(parentScreen[0]-tabScreen[0],
                                parentScreen[1]-tabScreen[1]);
                        tabGlow.invalidateSelf();
                    }
                    AmbientGeometryTrace.record("normal ambient local="+visiblePicture.toShortString()'''
    return once(source,anchor,replacement,"align corner to local picture")

def stage(base,destination):
    base,destination=Path(base),Path(destination)
    previous.stage(base,destination)
    for name,old,new,label in (
        ("PlayerIcons.java","PlayerStart209.install(root)","PlayerStart210.install(root)","first frame"),
        ("AppBarPlacement202.java","DrawerFront209.attach(host, frame, layer);",
         "DrawerFront210.attach(host, frame, layer);","drawer over mini")
    ):
        path=destination/name
        path.write_text(once(path.read_text(encoding="utf-8"),old,new,label),encoding="utf-8")
    ambient=destination/"AmbientLight.java"
    ambient.write_text(extend_corner(ambient.read_text(encoding="utf-8")),encoding="utf-8")
    return tuple(sorted(destination.glob("*.java")))
