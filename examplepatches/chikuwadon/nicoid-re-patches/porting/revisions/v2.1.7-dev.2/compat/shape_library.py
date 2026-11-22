"""Fifty genuinely different standard-mode Bike Run enemy silhouettes.

Ten main polygon body architectures, each with five visibly different
insets, head crests and colors. The first ten eligible hazards use ten
different silhouettes; subsequent eligible hazards advance through all 50.
Actual hazard collision rectangles, physics and old engines are unchanged.
"""
from struct import pack, unpack

OWNER = "Le/e/a/internal/standard150/BikeRun"
HAZARD = OWNER + "Model$Hazard;"
MODEL = OWNER + "Model;"

# All polygon vertices lie within the existing hitbox; Canvas clips to the
# verified obstacle Path so visual accents never float in empty screen space.
ARCHETYPES = (
    ((.04,1),(.50,.04),(.96,1)),  # pyramid / cone
    ((.02,.55),(.50,.02),(.98,.55),(.50,.98)),  # crystal
    ((.02,.22),(.50,.02),(.98,.22),(.92,.98),(.08,.98)),  # pentagon
    ((.08,.98),(.08,.33),(.25,.33),(.25,.10),(.72,.10),(.72,.33),(.92,.33),(.92,.98)),  # robot
    ((.02,.98),(.02,.38),(.18,.38),(.18,.12),(.44,.12),(.44,.38),(.67,.38),(.67,.12),(.90,.12),(.98,.98)),  # castle
    ((.02,.98),(.19,.58),(.34,.65),(.50,.08),(.67,.65),(.81,.58),(.98,.98)),  # saw
    ((.08,.98),(.04,.50),(.35,.50),(.35,.14),(.65,.14),(.65,.50),(.96,.50),(.92,.98)),  # anvil
    ((.02,.98),(.02,.22),(.35,.22),(.35,.05),(.67,.05),(.67,.22),(.98,.22),(.98,.98)),  # post
    ((.02,.98),(.05,.68),(.28,.50),(.07,.31),(.29,.08),(.72,.08),(.93,.31),(.72,.50),(.95,.68),(.98,.98)), # gear
    ((.05,.98),(.05,.60),(.30,.60),(.30,.31),(.56,.31),(.56,.08),(.91,.08),(.91,.98)), # stepped
)
COLORS = (0xff0fbc9b, 0xff59bed8, 0xffd5b064, 0xff85c66f, 0xffccd5cb)


def one(text, old, new, purpose):
    count = text.count(old)
    if count != 1:
        raise ValueError("%s: %d matches" % (purpose, count))
    return text.replace(old, new, 1)


def patch_hazard(content):
    content = one(content, "# instance fields",
                  "# static fields\n.field private static nextSpecies:I\n\n"
                  "# instance fields\n.field public species:I\n",
                  "species fields")
    content = one(content, ".method constructor <init>(FFFZZ)V\n    .registers 6",
                  ".method constructor <init>(FFFZZ)V\n    .registers 9",
                  "constructor headroom")
    needle = ("    iput-boolean p5, p0, " + HAZARD + "->spikes:Z")
    tail = (
        needle + "\n\n"
        "    if-eqz p4, :species_assign\n"
        "    const/4 v0, -0x1\n"
        "    iput v0, p0, " + HAZARD + "->species:I\n"
        "    goto :species_init_end\n"
        "    :species_assign\n"
        "    sget v0, " + HAZARD + "->nextSpecies:I\n"
        "    rem-int/lit8 v1, v0, 0x32    # 50 shapes\n"
        "    iput v1, p0, " + HAZARD + "->species:I\n"
        "    add-int/lit8 v0, v0, 0x1\n"
        "    sput v0, " + HAZARD + "->nextSpecies:I\n"
        "    :species_init_end"
    )
    return one(content, needle, tail, "species assigned at spawn")


def _f(value):
    bits = unpack(">I", pack(">f", float(value)))[0]
    return "0x%08x" % bits


def _vertex(x,y,first):
    # v1 = bounding left, v2 = top, v3 = width, v4 = height.
    instr = "moveTo" if first else "lineTo"
    return (f"    const v12, {_f(x)}\n"
            "    mul-float/2addr v12, v3\n"
            "    add-float/2addr v12, v1\n"
            f"    const v13, {_f(y)}\n"
            "    mul-float/2addr v13, v4\n"
            "    add-float/2addr v13, v2\n"
            f"    invoke-virtual {{v10, v12, v13}}, Landroid/graphics/Path;->{instr}(FF)V\n")


def _make_draw():
    lines = [r"""
.method private drawEnemySpecies(Landroid/graphics/Canvas;Landroid/graphics/Path;Le/e/a/internal/standard150/BikeRunModel$Hazard;)V
    .registers 23
    move-object/from16 v0, p1
    move-object/from16 v6, p2
    move-object/from16 v7, p3
    move-object/from16 v8, p0
    iget-boolean v11, v7, Le/e/a/internal/standard150/BikeRunModel$Hazard;->gap:Z
    if-nez v11, :species_end
    # Keep spikes in their original teal/outline-only presentation.
    iget-boolean v11, v7, Le/e/a/internal/standard150/BikeRunModel$Hazard;->spikes:Z
    if-nez v11, :species_end
    iget v11, v7, Le/e/a/internal/standard150/BikeRunModel$Hazard;->species:I
    if-ltz v11, :species_end
    new-instance v9, Landroid/graphics/RectF;
    invoke-direct {v9}, Landroid/graphics/RectF;-><init>()V
    const/4 v14, 0x1
    invoke-virtual {v6, v9, v14}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V
    iget v1, v9, Landroid/graphics/RectF;->left:F
    iget v2, v9, Landroid/graphics/RectF;->top:F
    iget v3, v9, Landroid/graphics/RectF;->right:F
    sub-float/2addr v3, v1
    iget v4, v9, Landroid/graphics/RectF;->bottom:F
    sub-float/2addr v4, v2
    const/high16 v14, 0x41800000    # 16 minimum width
    cmpg-float v15, v3, v14
    if-gez v15, :species_height
    goto :species_end
    :species_height
    const/high16 v14, 0x41600000    # 14 minimum height
    cmpg-float v15, v4, v14
    if-gez v15, :species_prepare
    goto :species_end
    :species_prepare
    iget-object v5, v8, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;
    invoke-virtual {v5}, Landroid/graphics/Paint;->getColor()I
    move-result v16
    invoke-virtual {v5}, Landroid/graphics/Paint;->getStyle()Landroid/graphics/Paint$Style;
    move-result-object v17
    invoke-virtual {v5}, Landroid/graphics/Paint;->getStrokeWidth()F
    move-result v18
    invoke-virtual {v0}, Landroid/graphics/Canvas;->save()I
    invoke-virtual {v0, v6}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z
    # Five tiers change body width/height and internal crest markings.
    div-int/lit8 v14, v11, 0xa
    int-to-float v12, v14
    const v13, 0x3c75c28f   # .015
    mul-float/2addr v12, v13
    mul-float v13, v12, v3
    add-float/2addr v1, v13
    add-float/2addr v13, v13
    sub-float/2addr v3, v13
    mul-float v13, v12, v4
    add-float/2addr v2, v13
    sub-float/2addr v4, v13
    sget-object v15, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;
    invoke-virtual {v5, v15}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V
"""]
    for i, color in enumerate(COLORS):
        lines.append(f"    const/4 v15, {i}\n    if-ne v14, v15, :species_color_{i+1}\n"
                     f"    const v15, {_fint(color)}\n"
                     "    invoke-virtual {v5, v15}, Landroid/graphics/Paint;->setColor(I)V\n"
                     "    goto :species_color_done\n"
                     f"    :species_color_{i+1}\n")
    lines.append("    :species_color_done\n"
                 "    new-instance v10, Landroid/graphics/Path;\n"
                 "    invoke-direct {v10}, Landroid/graphics/Path;-><init>()V\n"
                 "    rem-int/lit8 v11, v11, 0xa\n")
    for i in range(10):
        lines.append(f"    const/16 v15, {i}\n"
                     f"    if-ne v11, v15, :species_test_{i+1}\n"
                     f"    goto/16 :species_body_{i}\n"
                     f"    :species_test_{i+1}\n")
    lines.append("    goto/16 :species_body_0\n")
    for i, pts in enumerate(ARCHETYPES):
        lines.append(f"    :species_body_{i}\n")
        for k,(x,y) in enumerate(pts):
            lines.append(_vertex(x,y,k==0))
        lines.append("    invoke-virtual {v10}, Landroid/graphics/Path;->close()V\n"
                     "    goto/16 :species_body_done\n")
    lines.append(r"""
    :species_body_done
    invoke-virtual {v0, v10, v5}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V
    # Tier-specific crest: 0 to 4 internal eyes/dots.
    iget v11, v7, Le/e/a/internal/standard150/BikeRunModel$Hazard;->species:I
    div-int/lit8 v11, v11, 0xa
    const/4 v14, 0x0
    :species_crest_loop
    if-ge v14, v11, :species_restore
    # Repeat small dots at (n+1)/6 of width and .68 height
    add-int/lit8 v15, v14, 0x1
    int-to-float v12, v15
    const/high16 v13, 0x40c00000
    div-float/2addr v12, v13
    mul-float/2addr v12, v3
    add-float/2addr v12, v1
    const v13, 0x3f2e147b    # .68
    mul-float/2addr v13, v4
    add-float/2addr v13, v2
    iget v15, v8, Le/e/a/internal/standard150/BikeRun$Track;->background:I
    invoke-virtual {v5, v15}, Landroid/graphics/Paint;->setColor(I)V
    const/high16 v15, 0x40000000    # 2px dot
    invoke-virtual {v0, v12, v13, v15, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V
    add-int/lit8 v14, v14, 0x1
    goto :species_crest_loop
    :species_restore
    invoke-virtual {v0}, Landroid/graphics/Canvas;->restore()V
    move/from16 v12, v16
    invoke-virtual {v5, v12}, Landroid/graphics/Paint;->setColor(I)V
    move-object/from16 v12, v17
    invoke-virtual {v5, v12}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V
    move/from16 v12, v18
    invoke-virtual {v5, v12}, Landroid/graphics/Paint;->setStrokeWidth(F)V
    :species_end
    return-void
.end method
""")
    return "".join(lines)


def _fint(x):
    return "0x%08x" % x


DRAW_ENEMY = _make_draw()


def patch_track(content):
    anchor = ("    iget-object v0, v6, " + OWNER
              + "$Track;->obstacle:Landroid/graphics/Path;\n\n"
              "    iget-object v1, v6, " + OWNER
              + "$Track;->paint:Landroid/graphics/Paint;\n\n"
              "    invoke-virtual {v7, v0, v1}, Landroid/graphics/Canvas;"
              "->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V")
    call = ("    invoke-direct {v6, v7, v0, v13}, " + OWNER
            + "$Track;->drawEnemySpecies(Landroid/graphics/Canvas;"
            "Landroid/graphics/Path;" + HAZARD + ")V")
    content = one(content, anchor, anchor + "\n\n" + call,
                  "standard-only silhouette renderer")
    return content + "\n" + DRAW_ENEMY


GENTLE_SPAWN = r"""
.method private gentleSpawnSpan(FF)Z
    .registers 10
    # Enemies are permitted on flat or gently rolling ground, never across
    # a gap or a suddenly steep section. Step in 48 unit increments.
    move v0, p1
    invoke-virtual {p0, v0}, Le/e/a/internal/standard150/BikeRunModel;->terrainGapAt(F)Z
    move-result v1
    if-nez v1, :gentle_no
    invoke-virtual {p0, v0}, Le/e/a/internal/standard150/BikeRunModel;->terrain(F)F
    move-result v2
    :gentle_loop
    cmpg-float v1, v0, p2
    if-gez v1, :gentle_yes
    const/high16 v3, 0x42400000    # 48.0f
    add-float/2addr v0, v3
    invoke-static {v0, p2}, Ljava/lang/Math;->min(FF)F
    move-result v0
    invoke-virtual {p0, v0}, Le/e/a/internal/standard150/BikeRunModel;->terrainGapAt(F)Z
    move-result v1
    if-nez v1, :gentle_no
    invoke-virtual {p0, v0}, Le/e/a/internal/standard150/BikeRunModel;->terrain(F)F
    move-result v3
    sub-float v4, v3, v2
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F
    move-result v4
    const/high16 v5, 0x41600000    # <=14 height per 48 distance
    cmpl-float v1, v4, v5
    if-lez v1, :gentle_continue
    goto :gentle_no
    :gentle_continue
    move v2, v3
    goto :gentle_loop
    :gentle_yes
    const/4 v0, 0x1
    return v0
    :gentle_no
    const/4 v0, 0x0
    return v0
.end method
"""


def patch_model(content):
    # Use the actual tested placement method instead of adding fake hazards
    # during drawing. Both real hit detection and obstacle renderer see them.
    old = ("    invoke-virtual {p0, v4, v3}, "
           + MODEL + "->flatSpan(FF)Z")
    new = ("    invoke-direct {p0, v4, v3}, "
           + MODEL + "->gentleSpawnSpan(FF)Z")
    content = one(content, old, new, "permit placement on gentle slopes")
    content = one(content,
                  "    const/16 v4, 0xfa\n\n"
                  "    invoke-virtual {v3, v4}, Ljava/util/Random;->nextInt(I)I",
                  "    const/16 v4, 0xaf    # 175 instead of 250\n\n"
                  "    invoke-virtual {v3, v4}, Ljava/util/Random;->nextInt(I)I",
                  "small spawn interval variation")
    content = one(content,
                  "    add-int/lit16 v3, v3, 0x1b8",
                  "    add-int/lit16 v3, v3, 0x17c    # 380 instead of 440",
                  "more activity in easy stretches")
    return content + "\n" + GENTLE_SPAWN
