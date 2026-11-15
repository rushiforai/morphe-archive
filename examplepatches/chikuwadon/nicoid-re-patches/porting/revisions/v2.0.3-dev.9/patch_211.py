"""v2.0.3-dev.9: symmetric 4:3 halo, mini drawer inset, queued controls and landscape handoff."""
from pathlib import Path
import importlib.util

ROOT=Path(__file__).resolve().parent
PREV=ROOT.parent/"v2.0.3-dev.8/patch_210.py"
spec=importlib.util.spec_from_file_location("_nicoid_dev8_patch",PREV)
previous=importlib.util.module_from_spec(spec)
spec.loader.exec_module(previous)
OVERRIDES=frozenset(previous.OVERRIDES)

def once(source,old,new,label):
    count=source.count(old)
    if count!=1:
        raise AssertionError("%s: expected one anchor, found %d"%(label,count))
    return source.replace(old,new)

def ambient_corners(source):
    source=once(source,"tabGlow.sides = split ? 8 : (2 | 4);",
                "tabGlow.sides = split ? 8 : (2 | 4 | 8);",
                "both lower tab corners")
    source=once(source,"pageGlow.sides = split ? 8 : 2;  // Right side / portrait bottom.",
                "pageGlow.sides = split ? 8 : (2 | 4 | 8);  // Symmetric lower-left/right continuation.",
                "both lower page corners")
    source=once(source,"pageGlow.corners = split;",
                "pageGlow.corners = true;",
                "page background corner blending")
    needle='''                    AmbientGeometryTrace.record("normal ambient local="+visiblePicture.toShortString()'''
    replacement='''                    // The page and its detail/header planes used the original
                    // untranslated 4:3 right edge (1620 against 1440 screen).
                    // Use the SAME resolved [180,1260] picture as the native
                    // video underlay and tab strip.
                    if (pageGlowActive && !split && normalPageView != null) {
                        int[] pageScreen = new int[2];
                        normalPageView.getLocationOnScreen(pageScreen);
                        pageGlow.video.set(visiblePicture);
                        pageGlow.video.offset(parentScreen[0]-pageScreen[0],
                                parentScreen[1]-pageScreen[1]);
                        pageGlow.invalidateSelf();
                        installDetailPlanes(normalPageView);
                    }
                    AmbientGeometryTrace.record("normal ambient local="+visiblePicture.toShortString()'''
    source=once(source,needle,replacement,"correct detail page local picture")
    return source

def stage(base,destination):
    base,destination=Path(base),Path(destination)
    previous.stage(base,destination)
    for name,old,new,label in (
        ("PlayerIcons.java","PlayerStart210.install(root)","PlayerStart211.install(root)",
         "queued player controls"),
        ("AppBarPlacement202.java","DrawerFront210.attach(host, frame, layer);",
         "DrawerFront211.attach(host, frame, layer);","drawer bottom inset")
    ):
        file=destination/name
        file.write_text(once(file.read_text(encoding="utf-8"),old,new,label),
                        encoding="utf-8")
    ambient=destination/"AmbientLight.java"
    ambient.write_text(ambient_corners(ambient.read_text(encoding="utf-8")),
                       encoding="utf-8")
    return tuple(sorted(destination.glob("*.java")))
