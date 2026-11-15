"""v2.0.3-dev.6: preserve dev.5 fixes; repair first-frame, drawer and ambient layering."""
from pathlib import Path
import importlib.util

ROOT = Path(__file__).resolve().parent
BEFORE = ROOT.parent / "v2.0.3-dev.5" / "patch_207.py"
spec = importlib.util.spec_from_file_location("_nicoid_207_overlay", BEFORE)
previous = importlib.util.module_from_spec(spec)
spec.loader.exec_module(previous)
OVERRIDES = frozenset(set(previous.OVERRIDES))

def once(source, old, new, label):
    count = source.count(old)
    if count != 1:
        raise AssertionError("%s: expected one anchor, got %d" % (label, count))
    return source.replace(old, new)

def change_ambient(source):
    source = once(source,
        "        View normalOverlayHost, normalTabView, normalPageView;",
        "        View normalOverlayHost, normalTabView, normalPageView;\n"
        "        NormalGlowLayer208 normalGlowLayer;",
        "ambient plane field")
    source = once(source,
        """            normalOverlayHost = null;
            perimeterGlow.edgeLimits = null;""",
        """            normalOverlayHost = null;
            removeNormalGlowLayer();
            perimeterGlow.edgeLimits = null;""",
        "detach normal light below comment overlays")
    source = once(source,
        """        void installNormalExterior(View target) {""",
        """        void removeNormalGlowLayer() {
            if (normalGlowLayer != null) {
                normalGlowLayer.detach();
                if (normalGlowLayer.getParent() instanceof ViewGroup)
                    ((ViewGroup) normalGlowLayer.getParent()).removeView(normalGlowLayer);
                normalGlowLayer = null;
            }
        }

        void installNormalExterior(View target) {""",
        "ambient layer lifecycle")
    old = """            if (split) {
                if (normalOverlayHost != null) normalOverlayHost.getOverlay().remove(perimeterGlow);
                normalOverlayHost = null;
                Arrays.fill(normalEdgeLimits, 0);
            } else {
                if (normalOverlayHost == null) {
                    decor.getOverlay().add(perimeterGlow);
                    normalOverlayHost = decor;
                }
                perimeterGlow.invalidateSelf();
            }"""
    new = """            // The old DecorView overlay is the highest rendering layer and
            // necessarily paints over scrolling captions and center controls.
            // Insert a non-interactive plane immediately after the video
            // texture instead. Native comment and control siblings stay above.
            if (normalOverlayHost != null) {
                normalOverlayHost.getOverlay().remove(perimeterGlow);
                normalOverlayHost = null;
            }
            if (split) {
                removeNormalGlowLayer();
                Arrays.fill(normalEdgeLimits, 0);
            } else {
                ViewGroup parent = lastSource != null && lastSource.getParent() instanceof ViewGroup
                        ? (ViewGroup) lastSource.getParent() : null;
                if (parent != null && parent.getWidth() > 1 && parent.getHeight() > 1) {
                    if (normalGlowLayer == null || normalGlowLayer.getParent() != parent) {
                        removeNormalGlowLayer();
                        normalGlowLayer = new NormalGlowLayer208(root.getContext(), perimeterGlow);
                        normalGlowLayer.setTag("nicoid-normal-ambient-underlay");
                        AmbientGeometryTrace.record("normal ambient underlay parent="
                                + parent.getClass().getSimpleName()
                                + " texture-index=" + parent.indexOfChild(lastSource));
                        int index = parent.indexOfChild(lastSource);
                        parent.addView(normalGlowLayer, index >= 0 ? index + 1 : parent.getChildCount(),
                                new ViewGroup.LayoutParams(-1, -1));
                    }
                    normalGlowLayer.update(decor);
                    perimeterGlow.invalidateSelf();
                } else {
                    removeNormalGlowLayer();
                }
            }"""
    source = once(source, old, new, "move normal glow below comment plane")
    return source

def stage(base, destination):
    base, destination = Path(base), Path(destination)
    previous.stage(base, destination)
    for name, old, new, label in (
        ("PlayerIcons.java", "PlayerStart207.install(root)", "PlayerStart208.install(root)",
         "real first-frame center controls"),
        ("AppBarPlacement202.java", "DrawerFront207.attach(host, frame, layer);",
         "DrawerFront208.attach(host, frame, layer);", "drawer occludes floating tabs"),
    ):
        path = destination / name
        path.write_text(once(path.read_text(encoding="utf-8"), old, new, label),
                        encoding="utf-8")
    ambient = destination / "AmbientLight.java"
    ambient.write_text(change_ambient(ambient.read_text(encoding="utf-8")),
                       encoding="utf-8")
    return tuple(sorted(destination.glob("*.java")))
