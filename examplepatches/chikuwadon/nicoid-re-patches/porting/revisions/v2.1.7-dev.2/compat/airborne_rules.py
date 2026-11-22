"""Playable flying hazards for v1.5 standard only, using Canvas primitives.

A flyer is safe to ride underneath, but can damage an airborne cyclist.
It is deterministic, moves with the scrolling world, and is retired after hit.
"""
OWNER = "Le/e/a/internal/standard150/BikeRun"
MODEL = OWNER + "Model;"
TRACK = OWNER + "$Track;"


def replace_once(text, old, new, name):
    count = text.count(old)
    if count != 1:
        raise ValueError("%s: expected one site, found %d" % (name, count))
    return text.replace(old, new, 1)


FLYER_TICK = r"""
.method private updateFlyer()V
    .registers 7
    iget-boolean v0, p0, Le/e/a/internal/standard150/BikeRunModel;->started:Z
    if-eqz v0, :flyer_done
    iget-boolean v0, p0, Le/e/a/internal/standard150/BikeRunModel;->over:Z
    if-nez v0, :flyer_done
    iget v0, p0, Le/e/a/internal/standard150/BikeRunModel;->distance:F
    iget v1, p0, Le/e/a/internal/standard150/BikeRunModel;->flyerDistance:F
    const/high16 v2, 0x428c0000    # 70.0f passed viewport
    add-float v3, v1, v2
    cmpl-float v4, v0, v3
    if-lez v4, :flyer_advance
    sub-float v2, v1, v0
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F
    move-result v2
    const/high16 v3, 0x42100000    # 36.0f contact width
    cmpl-float v4, v2, v3
    if-lez v4, :flyer_done
    iget v2, p0, Le/e/a/internal/standard150/BikeRunModel;->damageCooldown:F
    const/4 v3, 0x0
    cmpl-float v4, v2, v3
    if-lez v4, :flyer_done
    iget v2, p0, Le/e/a/internal/standard150/BikeRunModel;->y:F
    const/high16 v3, -0x3d000000    # -128.0f
    cmpg-float v4, v2, v3
    if-gez v4, :flyer_done
    const/high16 v3, -0x3e100000    # -30.0f
    cmpl-float v4, v2, v3
    if-lez v4, :flyer_done
    const/high16 v3, 0x42f00000    # fixed rider at x=120
    const/4 v4, 0x0
    invoke-direct {p0, v3, v4}, Le/e/a/internal/standard150/BikeRunModel;->isGapAt(FF)Z
    move-result v3
    if-nez v3, :flyer_done
    const/4 v2, 0x1
    iput-boolean v2, p0, Le/e/a/internal/standard150/BikeRunModel;->collisionHit:Z
    iput-boolean v2, p0, Le/e/a/internal/standard150/BikeRunModel;->over:Z
    :flyer_advance
    const v2, 0x44d48000    # 1700.0f
    add-float/2addr v1, v2
    iput v1, p0, Le/e/a/internal/standard150/BikeRunModel;->flyerDistance:F
    :flyer_done
    return-void
.end method
"""

FLYER_RENDER = r"""
.method private drawFlyer(Landroid/graphics/Canvas;F)V
    .registers 14
    iget-object v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;
    iget v1, v0, Le/e/a/internal/standard150/BikeRunModel;->flyerDistance:F
    iget v2, v0, Le/e/a/internal/standard150/BikeRunModel;->distance:F
    sub-float/2addr v1, v2
    const/high16 v3, 0x42f00000    # rider at 120.0f
    add-float/2addr v1, v3
    const/high16 v3, -0x3e100000    # -30.0f
    cmpg-float v4, v1, v3
    if-gez v4, :flyer_render_done
    const/high16 v3, 0x44380000    # 736.0f
    cmpl-float v4, v1, v3
    if-lez v4, :flyer_render_done
    invoke-virtual {v0, v1}, Le/e/a/internal/standard150/BikeRunModel;->groundAt(F)F
    move-result v2
    add-float/2addr v2, p2
    const/high16 v3, 0x42c80000    # 100.0f above ground
    sub-float/2addr v2, v3
    iget-object v5, p0, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;
    invoke-virtual {v5}, Landroid/graphics/Paint;->getColor()I
    move-result v6
    invoke-virtual {v5}, Landroid/graphics/Paint;->getStyle()Landroid/graphics/Paint$Style;
    move-result-object v7
    invoke-virtual {v5}, Landroid/graphics/Paint;->getStrokeWidth()F
    move-result v8
    const v9, 0xffd9b36a
    invoke-virtual {v5, v9}, Landroid/graphics/Paint;->setColor(I)V
    sget-object v9, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;
    invoke-virtual {v5, v9}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V
    const/high16 v9, 0x40400000    # 3.0f
    invoke-virtual {v5, v9}, Landroid/graphics/Paint;->setStrokeWidth(F)V
    const/high16 v3, 0x41200000    # 10.0f body radius
    invoke-virtual {p1, v1, v2, v3, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V
    move v9, v1
    move v10, v2
    const/high16 v3, 0x41000000    # 8.0f
    sub-float/2addr v1, v3
    const/high16 v4, 0x41c80000    # 25.0f wing span
    sub-float v3, v9, v4
    const/high16 v4, 0x41000000    # 8.0f wing rise
    sub-float v4, v10, v4
    move-object v0, p1
    move-object v5, v5
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V
    move v1, v9
    const/high16 v3, 0x41000000    # 8.0f
    add-float/2addr v1, v3
    move v2, v10
    const/high16 v4, 0x41c80000    # 25.0f
    add-float v3, v9, v4
    const/high16 v4, 0x41000000    # 8.0f
    sub-float v4, v10, v4
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V
    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V
    invoke-virtual {v5, v7}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V
    invoke-virtual {v5, v8}, Landroid/graphics/Paint;->setStrokeWidth(F)V
    :flyer_render_done
    return-void
.end method
"""


def patch_model(content):
    content = replace_once(
        content, ".field public pickupDistance:F",
        ".field public pickupDistance:F\n\n.field public flyerDistance:F",
        "flyer location state")
    content = replace_once(
        content,
        "    const/high16 v1, 0x44800000    # initial pickup at 1024.0f\n\n"
        "    iput v1, p0, " + MODEL + "->pickupDistance:F",
        "    const/high16 v1, 0x44800000    # initial pickup at 1024.0f\n\n"
        "    iput v1, p0, " + MODEL + "->pickupDistance:F\n\n"
        "    const v1, 0x44af0000    # first flyer at 1400.0f\n\n"
        "    iput v1, p0, " + MODEL + "->flyerDistance:F",
        "reset flyer state")
    # Physics updates before the health wrapper checks whether a collision
    # depleted a life. The new enemy sets the exact same collisionHit marker.
    content = replace_once(
        content,
        "    invoke-direct {p0}, " + MODEL + "->updatePickup()V",
        "    invoke-direct {p0}, " + MODEL + "->updateFlyer()V\n"
        "    invoke-direct {p0}, " + MODEL + "->updatePickup()V",
        "flying enemy tick")
    return content + "\n" + FLYER_TICK


def patch_track(content):
    anchor = "    add-float v14, v0, v2"
    call = ("    invoke-direct {v6, v7, v14}, " + OWNER
            + "$Track;->drawFlyer(Landroid/graphics/Canvas;F)V")
    content = replace_once(content, anchor, anchor + "\n\n" + call,
                           "airborne enemy under terrain draw")
    return content + "\n" + FLYER_RENDER
