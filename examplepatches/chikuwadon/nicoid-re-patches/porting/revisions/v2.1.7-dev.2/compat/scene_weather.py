"""Canvas-only v1.5 visual additions; classic game bytecode remains untouched.

Weather is based on the existing seeded terrain mood. Tall hazard outlines now
cover the full collision width rather than presenting as a single vertical pole.
"""
OWNER = "Le/e/a/internal/standard150/BikeRun"


def replace_once(text, old, new, reason):
    found = text.count(old)
    if found != 1:
        raise ValueError("%s: expected one insertion site, found %d" % (reason, found))
    return text.replace(old, new, 1)


WEATHER_METHOD = r"""
.method private drawWeather(Landroid/graphics/Canvas;F)V
    .registers 16
    # Weather lasts ~15s and returns only once per ~45s at standard speeds,
    # rather than tracking fast-changing 6.4k terrain mood sections.
    iget-object v11, p0, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;
    iget v10, v11, Le/e/a/internal/standard150/BikeRunModel;->distance:F
    const v4, 0x463b8000    # 12000.0f initial clear period
    add-float/2addr v10, v4
    const v4, 0x46cb2000    # 26000.0f weather cycle
    rem-float v10, v10, v4
    const v4, 0x460ca000    # 9000.0f wet window
    cmpl-float v4, v10, v4
    if-lez v4, :weather_skip
    goto :wet_active
    :weather_skip
    return-void
    :wet_active
    # Weather type is fixed throughout each storm, regardless of biome changes.
    iget v9, v11, Le/e/a/internal/standard150/BikeRunModel;->distance:F
    const v4, 0x463b8000    # 12000.0f
    add-float/2addr v9, v4
    const v4, 0x46cb2000    # 26000.0f
    div-float/2addr v9, v4
    float-to-int v9, v9
    rem-int/lit8 v9, v9, 0x2
    if-nez v9, :storm_rain
    const/4 v9, 0x2    # snow
    :storm_rain
    iget-object v6, p0, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;
    invoke-virtual {v6}, Landroid/graphics/Paint;->getColor()I
    move-result v8
    const v4, 0xffa3bec9
    invoke-virtual {v6, v4}, Landroid/graphics/Paint;->setColor(I)V
    # Fade for 1200 distance units at both ends of the storm.
    const v4, 0x44960000    # 1200
    div-float v3, v10, v4
    const v2, 0x460ca000    # 9000
    sub-float/2addr v2, v10
    div-float/2addr v2, v4
    invoke-static {v3, v2}, Ljava/lang/Math;->min(FF)F
    move-result v3
    const/high16 v2, 0x3f800000
    invoke-static {v3, v2}, Ljava/lang/Math;->min(FF)F
    move-result v3
    const/high16 v2, 0x42a00000    # alpha 80
    mul-float/2addr v3, v2
    float-to-int v3, v3
    invoke-virtual {v6, v3}, Landroid/graphics/Paint;->setAlpha(I)V
    # Clip to sky by excluding the ground polygon; no rain drawn through soil.
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I
    new-instance v12, Landroid/graphics/Path;
    invoke-direct {v12}, Landroid/graphics/Path;-><init>()V
    const/4 v0, 0x0
    const/high16 v1, 0x45fa0000    # bottom 8000
    invoke-virtual {v12, v0, v1}, Landroid/graphics/Path;->moveTo(FF)V
    const/4 v7, 0x0
    :weather_ground_loop
    const/16 v4, 0x30
    if-le v7, v4, :weather_ground_sample
    goto :weather_ground_finish
    :weather_ground_sample
    mul-int/lit8 v4, v7, 0xf
    int-to-float v0, v4
    invoke-virtual {v11, v0}, Le/e/a/internal/standard150/BikeRunModel;->groundAt(F)F
    move-result v1
    add-float/2addr v1, p2
    invoke-virtual {v12, v0, v1}, Landroid/graphics/Path;->lineTo(FF)V
    add-int/lit8 v7, v7, 0x1
    goto :weather_ground_loop
    :weather_ground_finish
    const/high16 v0, 0x44340000    # 720
    const/high16 v1, 0x45fa0000    # 8000
    invoke-virtual {v12, v0, v1}, Landroid/graphics/Path;->lineTo(FF)V
    invoke-virtual {v12}, Landroid/graphics/Path;->close()V
    invoke-virtual {p1, v12}, Landroid/graphics/Canvas;->clipOutPath(Landroid/graphics/Path;)Z
    # 48 quasi-random distributed streaks throughout the visible sky.
    const/4 v7, 0x0
    :weather_loop
    const/16 v4, 0x30
    if-ge v7, v4, :weather_end
    const/16 v4, 0x4f
    mul-int v1, v7, v4
    int-to-float v1, v1
    iget v4, v11, Le/e/a/internal/standard150/BikeRunModel;->distance:F
    const/high16 v3, 0x41000000
    div-float/2addr v4, v3
    add-float/2addr v1, v4
    const/high16 v3, 0x44340000
    rem-float/2addr v1, v3
    const/16 v4, 0x67
    mul-int v2, v7, v4
    int-to-float v2, v2
    iget v4, v11, Le/e/a/internal/standard150/BikeRunModel;->distance:F
    const/high16 v3, 0x41800000
    div-float/2addr v4, v3
    add-float/2addr v2, v4
    const v3, 0x44b40000    # full 1440 logical height
    rem-float/2addr v2, v3
    const/4 v4, 0x2
    if-ne v9, v4, :weather_rain
    move v3, v1
    const/high16 v4, 0x40800000
    add-float v4, v2, v4
    goto :weather_draw
    :weather_rain
    const/high16 v4, 0x40c00000
    sub-float v3, v1, v4
    const/high16 v4, 0x41500000
    add-float v4, v2, v4
    :weather_draw
    move-object v0, p1
    move-object v5, v6
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V
    add-int/lit8 v7, v7, 0x1
    goto :weather_loop
    :weather_end
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V
    invoke-virtual {v6, v8}, Landroid/graphics/Paint;->setColor(I)V
    return-void
.end method
"""


def patch_track(content):
    # The v14 camera-space offset is established once before any terrain work.
    anchor = "    add-float v14, v0, v2"
    # Remove experimental free-floating parallax strokes that appear as
    # unidentified diagonal streaks near the top of the screen.
    call = ("    invoke-direct {v6, v7, v14}, " + OWNER
            + "$Track;->drawWeather(Landroid/graphics/Canvas;F)V")
    content = replace_once(content, anchor, anchor + "\n\n" + call,
                           "weather in camera coordinates")
    return content + "\n" + WEATHER_METHOD
