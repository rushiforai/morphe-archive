"""Private v1.5 standard-only collectible items and Canvas rendering.

Do not use these overlays for either frozen classic engine.
They operate on verified disassembled Smali, refusing ambiguous anchors.
"""
OWNER = "Le/e/a/internal/standard150/BikeRun"
MODEL = OWNER + "Model;"
TRACK = OWNER + "$Track;"


def replace_once(source, old, new, reason):
    count = source.count(old)
    if count != 1:
        raise ValueError("%s: expected 1 original site, found %d" % (reason, count))
    return source.replace(old, new, 1)


RECOVERY_TICK = r"""
.method private updatePickup()V
    .registers 7
    iget-boolean v0, p0, Le/e/a/internal/standard150/BikeRunModel;->started:Z
    if-eqz v0, :recovery_done
    iget-boolean v0, p0, Le/e/a/internal/standard150/BikeRunModel;->over:Z
    if-nez v0, :recovery_done
    iget v0, p0, Le/e/a/internal/standard150/BikeRunModel;->distance:F
    iget v1, p0, Le/e/a/internal/standard150/BikeRunModel;->pickupDistance:F
    const/high16 v2, 0x428c0000    # 70.0f
    add-float v3, v1, v2
    cmpl-float v4, v0, v3
    if-lez v4, :recovery_advance
    sub-float v2, v1, v0
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F
    move-result v2
    const/high16 v3, 0x42100000    # 36.0f
    cmpl-float v4, v2, v3
    if-lez v4, :recovery_done
    iget v2, p0, Le/e/a/internal/standard150/BikeRunModel;->lives:I
    const/4 v3, 0x3
    if-ge v2, v3, :recovery_done
    const/high16 v3, 0x42f00000    # rider at x=120
    const/4 v4, 0x0
    invoke-direct {p0, v3, v4}, Le/e/a/internal/standard150/BikeRunModel;->isGapAt(FF)Z
    move-result v3
    if-nez v3, :recovery_done
    iget v3, p0, Le/e/a/internal/standard150/BikeRunModel;->y:F
    const/high16 v4, -0x3d000000    # -128.0f
    cmpg-float v5, v3, v4
    if-gez v5, :recovery_done
    const/high16 v4, 0x41a00000    # 20.0f
    cmpl-float v5, v3, v4
    if-lez v5, :recovery_done
    add-int/lit8 v2, v2, 0x1
    iput v2, p0, Le/e/a/internal/standard150/BikeRunModel;->lives:I
    :recovery_advance
    const/high16 v2, 0x45000000    # 2048.0f
    add-float/2addr v1, v2
    iput v1, p0, Le/e/a/internal/standard150/BikeRunModel;->pickupDistance:F
    :recovery_done
    return-void
.end method
"""

RECOVERY_RENDER = r"""
.method private static drawRecovery(Landroid/graphics/Canvas;Le/e/a/internal/standard150/BikeRun$Track;F)V
    .registers 14
    iget-object v0, p1, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;
    iget v3, v0, Le/e/a/internal/standard150/BikeRunModel;->lives:I
    const/4 v4, 0x3
    if-ge v3, v4, :recovery_render_done
    iget v1, v0, Le/e/a/internal/standard150/BikeRunModel;->pickupDistance:F
    iget v2, v0, Le/e/a/internal/standard150/BikeRunModel;->distance:F
    sub-float/2addr v1, v2
    const/high16 v3, 0x42f00000    # rider at x=120
    add-float/2addr v1, v3
    const/high16 v3, -0x3e800000    # -16.0f
    cmpg-float v4, v1, v3
    if-gez v4, :recovery_render_done
    const/high16 v3, 0x44380000    # 736.0f
    cmpl-float v4, v1, v3
    if-lez v4, :recovery_render_done
    invoke-virtual {v0, v1}, Le/e/a/internal/standard150/BikeRunModel;->groundAt(F)F
    move-result v2
    add-float/2addr v2, p2
    const/high16 v3, 0x42700000    # 60.0f above ground
    sub-float/2addr v2, v3
    iget-object v5, p1, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;
    invoke-virtual {v5}, Landroid/graphics/Paint;->getColor()I
    move-result v6
    invoke-virtual {v5}, Landroid/graphics/Paint;->getStyle()Landroid/graphics/Paint$Style;
    move-result-object v7
    invoke-virtual {v5}, Landroid/graphics/Paint;->getStrokeWidth()F
    move-result v8
    const v9, 0xffffb63c
    invoke-virtual {v5, v9}, Landroid/graphics/Paint;->setColor(I)V
    sget-object v9, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;
    invoke-virtual {v5, v9}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V
    const/high16 v3, 0x41300000    # 11.0f
    invoke-virtual {p0, v1, v2, v3, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V
    const v9, 0xff163a31
    invoke-virtual {v5, v9}, Landroid/graphics/Paint;->setColor(I)V
    const/high16 v9, 0x40a00000    # 5.0f
    sub-float v10, v1, v9
    move v3, v1
    add-float/2addr v3, v9
    move-object v0, p0
    move v1, v10
    move v4, v2
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V
    move v1, v3
    sub-float/2addr v1, v9
    move v3, v1
    sub-float/2addr v2, v9
    move v4, v2
    add-float/2addr v4, v9
    add-float/2addr v4, v9
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V
    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V
    invoke-virtual {v5, v7}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V
    invoke-virtual {v5, v8}, Landroid/graphics/Paint;->setStrokeWidth(F)V
    :recovery_render_done
    return-void
.end method
"""


def patch_model(content):
    content = replace_once(
        content, ".field public collisionHit:Z",
        ".field public collisionHit:Z\n\n.field public pickupDistance:F",
        "pickup state field")
    content = replace_once(
        content,
        "    iput v1, p0, " + MODEL + "->lives:I",
        "    iput v1, p0, " + MODEL + "->lives:I\n\n"
        "    const/high16 v1, 0x44800000    # initial pickup at 1024.0f\n\n"
        "    iput v1, p0, " + MODEL + "->pickupDistance:F",
        "reset pickup state")
    content = replace_once(
        content,
        "    invoke-direct {p0, p1}, " + MODEL + "->stepLegacy(F)V",
        "    invoke-direct {p0, p1}, " + MODEL + "->stepLegacy(F)V\n"
        "    invoke-direct {p0}, " + MODEL + "->updatePickup()V",
        "pickup tick")
    return content + "\n" + RECOVERY_TICK


def patch_track(content):
    # Only one camera-space Y anchor exists in onDraw; do not paint over HUD.
    anchor = "    add-float v14, v0, v2"
    call = ("    invoke-static {v7, v6, v14}, " + OWNER
            + "$Track;->drawRecovery(Landroid/graphics/Canvas;"
            + OWNER + "$Track;F)V")
    content = replace_once(content, anchor, anchor + "\n\n" + call,
                           "camera-space recovery indicator")
    return content + "\n" + RECOVERY_RENDER
