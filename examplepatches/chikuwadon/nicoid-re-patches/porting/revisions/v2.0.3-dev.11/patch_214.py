"""v2.0.3-dev.11: correct centered portrait/pillarbox geometry and MP3 save.

Video, tab, details and page must use the same frame. The 4:3-only
heuristic introduced in dev.7 incorrectly left portrait videos with
right=1440 and zero right gutter; do not special-case only 4:3.
"""
from pathlib import Path
import importlib.util

ROOT=Path(__file__).resolve().parent
PREV=ROOT.parent/"v2.0.3-dev.10/patch_212.py"
spec=importlib.util.spec_from_file_location("_nicoid_dev10_patch",PREV)
previous=importlib.util.module_from_spec(spec)
spec.loader.exec_module(previous)
OVERRIDES=frozenset(previous.OVERRIDES)

def once(source,old,new,label):
    count=source.count(old)
    if count!=1:raise AssertionError(f"{label}: expected one anchor got {count}")
    return source.replace(old,new)

def portrait_and_pillarbox(source):
    old="""                    if (visiblePicture.left > 0 && visiblePicture.right > parentWidth
                            && visiblePicture.left < parentWidth/3
                            && parentHeight > 0) {
                        // When centered pillarboxing is expressed as translation only,
                        // reflect the exposed left border to obtain the right border.
                        int symmetricRight=parentWidth-visiblePicture.left;
                        float ratio=(symmetricRight-visiblePicture.left)/(float) parentHeight;
                        if(Math.abs(ratio-4f/3f)<.12f)visiblePicture.right=symmetricRight;
                    }"""
    new="""                    // TextureView supplies its untransformed 1440px layout
                    // width, but the nicoid player centers the actual 9:16,
                    // 4:3 or square picture via translation. Coordinates can
                    // therefore read [442,1882] although the real picture is
                    // [442,998] on a 1440px viewport. The older 4:3-only ratio
                    // test skipped this case entirely, setting right gutter=0.
                    // Restrict mirroring to a centered, positive left inset
                    // and a source at least as wide as the parent viewport.
                    if (!split && visiblePicture.left > 1
                            && visiblePicture.left < parentWidth / 2
                            && visiblePicture.right > parentWidth
                            && lastSource != null
                            && lastSource.getWidth() >= parentWidth * .98f) {
                        int beforeRight=visiblePicture.right;
                        int symmetricRight=parentWidth-visiblePicture.left;
                        if (symmetricRight > visiblePicture.left) {
                            visiblePicture.right=symmetricRight;
                            AmbientGeometryTrace.record("normal centered portrait/letterbox"
                                    +" rawRight="+beforeRight
                                    +" correctedRight="+symmetricRight
                                    +" gutters="+visiblePicture.left+"/"+(parentWidth-symmetricRight));
                        }
                    }"""
    return once(source,old,new,"centered image aspect-independent correction")

def stage(base,destination):
    base,destination=Path(base),Path(destination)
    previous.stage(base,destination)
    ambient=destination/"AmbientLight.java"
    ambient.write_text(portrait_and_pillarbox(ambient.read_text(encoding="utf-8")),
                       encoding="utf-8")
    return tuple(sorted(destination.glob("*.java")))
