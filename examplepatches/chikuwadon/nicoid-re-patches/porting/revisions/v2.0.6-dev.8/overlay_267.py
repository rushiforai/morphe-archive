"""Replace the custom scrolling pass while retaining the native fixed pass."""
from pathlib import Path

SCROLL = "scrolling(Ljava/lang/Object;Landroid/graphics/Canvas;Ljava/util/ArrayList;"
OLD = "    invoke-static/range {p0 .. p2}, Le/e/a/CommentVisuals;->" + SCROLL + ")Ljava/util/ArrayList;"


def replace_once(text, old, new):
    if text.count(old) != 1:
        raise ValueError(f"Unexpected native comment hook: {old}")
    return text.replace(old, new, 1)


def helpers(hooks: Path):
    file = hooks / "CommentVisuals.smali"
    text = file.read_text()
    start = text.index(".method public static " + SCROLL)
    end = text.index(".end method", start) + len(".end method")
    method = """
.method public static scrolling(Ljava/lang/Object;Landroid/graphics/Canvas;Ljava/util/ArrayList;Z)Ljava/util/ArrayList;
    .registers 7
    invoke-static {p0}, Le/e/a/CommentStyle;->refresh(Ljava/lang/Object;)V
    move-object v0, p0
    check-cast v0, Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v0
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sget-object v2, Le/e/a/CommentVisuals;->CONTEXT:Ljava/lang/ThreadLocal;
    invoke-virtual {v2, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V
    invoke-static {p0, p1, p2, p3}, Le/e/a/ScrollingComments267;->draw(Ljava/lang/Object;Landroid/graphics/Canvas;Ljava/util/ArrayList;Z)Ljava/util/ArrayList;
    move-result-object v0
    return-object v0
.end method"""
    text = text[:start] + method.lstrip() + text[end:]
    decode_context = """    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/Context;"""
    text = replace_once(text, decode_context, """    invoke-static {v0}, Le/e/a/ScrollingComments267;->fixedContext(Ljava/lang/ThreadLocal;)Landroid/content/Context;

    move-result-object v5""")
    file.write_text(text)


def native(native_dir: Path):
    for name in ("t", "u"):
        file = native_dir / "e/e/a" / (name + ".smali")
        # The two calls in the original render loop use separate native row maps.
        # Compare against the renderer's current primary map, so replacement of
        # either map does not change that stream's active comment ownership.
        prefix = f"""    move-object/from16 v0, p0
    iget-object v1, v0, Le/e/a/{name};->d:Ljava/util/HashMap;
    move-object/from16 v2, p3
    const/4 v3, 0x0
    if-eq v1, v2, :nicoid_primary_comments
    const/4 v3, 0x1
    :nicoid_primary_comments
    move-object/from16 v1, p1
    move-object/from16 v2, p2
    invoke-static {{v0, v1, v2, v3}}, Le/e/a/CommentVisuals;->{SCROLL}Z)Ljava/util/ArrayList;"""
        file.write_text(replace_once(file.read_text(), OLD, prefix))
