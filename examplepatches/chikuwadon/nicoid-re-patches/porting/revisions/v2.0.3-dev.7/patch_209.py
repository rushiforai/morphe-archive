"""v2.0.3-dev.7: 4:3 halo geometry, native drawer order, decoded fullscreen handoff."""
from pathlib import Path
import importlib.util

ROOT=Path(__file__).resolve().parent
PREV=ROOT.parent/"v2.0.3-dev.6/patch_208.py"
spec=importlib.util.spec_from_file_location("_nicoid_dev6_patch",PREV)
previous=importlib.util.module_from_spec(spec)
spec.loader.exec_module(previous)
OVERRIDES=frozenset(previous.OVERRIDES)

def once(src,old,new,label):
    count=src.count(old)
    if count!=1:
        raise AssertionError(f"{label}: expected one anchor, got {count}")
    return src.replace(old,new)

def normal_ambient(src):
    anchor="""                    normalGlowLayer.update(decor);
                    perimeterGlow.invalidateSelf();"""
    replacement="""                    // The underlay canvas is local to the video parent, never to DecorView.
                    // 4:3 TextureView sometimes reports its unscaled 16:9 width despite
                    // Android positioning the actual pillarboxed picture with a left inset.
                    int[] parentScreen = new int[2];
                    int[] targetScreen = new int[2];
                    parent.getLocationOnScreen(parentScreen);
                    target.getLocationOnScreen(targetScreen);
                    perimeterGlow.video.set(glow.video);
                    perimeterGlow.video.offset(targetScreen[0]-parentScreen[0],
                            targetScreen[1]-parentScreen[1]);
                    Rect visiblePicture = perimeterGlow.video;
                    int parentWidth = parent.getWidth();
                    int parentHeight = parent.getHeight();
                    if (visiblePicture.left > 0 && visiblePicture.right > parentWidth
                            && visiblePicture.left < parentWidth/3
                            && parentHeight > 0) {
                        // When centered pillarboxing is expressed as translation only,
                        // reflect the exposed left border to obtain the right border.
                        int symmetricRight=parentWidth-visiblePicture.left;
                        float ratio=(symmetricRight-visiblePicture.left)/(float) parentHeight;
                        if(Math.abs(ratio-4f/3f)<.12f)visiblePicture.right=symmetricRight;
                    }
                    visiblePicture.intersect(0,0,parentWidth,parentHeight);
                    perimeterGlow.setBounds(0,0,parentWidth,parentHeight);
                    // Both 4:3 gutters are usable glow space; do not cap them at 10dp.
                    int sideReach=dp(root,Math.min(108f,config[1]));
                    normalEdgeLimits[0]=Math.min(topSafe,Math.max(0,visiblePicture.top));
                    normalEdgeLimits[1]=tabGlowActive?0:Math.min(bottomSafe,
                            Math.max(0,parentHeight-visiblePicture.bottom));
                    normalEdgeLimits[2]=Math.min(sideReach,Math.max(0,visiblePicture.left));
                    normalEdgeLimits[3]=Math.min(sideReach,Math.max(0,parentWidth-visiblePicture.right));
                    AmbientGeometryTrace.record("normal ambient local="+visiblePicture.toShortString()
                            +" parent="+parentWidth+"x"+parentHeight
                            +" limits="+Arrays.toString(normalEdgeLimits));
                    normalGlowLayer.update(parent);
                    perimeterGlow.invalidateSelf();"""
    return once(src,anchor,replacement,"local 4:3 underlay geometry")

def stage(base,destination):
    base,destination=Path(base),Path(destination)
    previous.stage(base,destination)
    for name,old,new,label in (
        ("PlayerIcons.java","PlayerStart208.install(root)","PlayerStart209.install(root)","first-frame controls"),
        ("AppBarPlacement202.java","DrawerFront208.attach(host, frame, layer);",
         "DrawerFront209.attach(host, frame, layer);","native drawer z-order"),
    ):
        path=destination/name
        path.write_text(once(path.read_text(encoding="utf-8"),old,new,label),encoding="utf-8")
    path=destination/"AmbientLight.java"
    path.write_text(normal_ambient(path.read_text(encoding="utf-8")),encoding="utf-8")
    return tuple(sorted(destination.glob("*.java")))
