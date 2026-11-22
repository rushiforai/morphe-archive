"""Clip actual terrain *before* filling it: never paint any cliff gap.

The old renderer builds one continuous, filled path even across missing
terrain, then overwrites gaps with the background color. That is not a real
transparent hole and fails in sloped or partially visible gaps.

This patch saves the Canvas, excludes all explicit Hazard.gap spans and all
procedurally generated terrainGapAt() spans, fills the existing road once,
and restores the Canvas. Both old opaque erase rectangles are disabled.
The ordinary sky already painted at the beginning of onDraw shines through.
No new color is painted inside holes; physics/edge outlines are unaffected.
"""

TRACK = "Le/e/a/internal/standard150/BikeRun$Track;"
MODEL = "Le/e/a/internal/standard150/BikeRunModel;"
HAZARD = "Le/e/a/internal/standard150/BikeRunModel$Hazard;"

DRAW_NO_GAPS = r"""
.method private drawTerrainWithoutHoles(Landroid/graphics/Canvas;Landroid/graphics/Path;Landroid/graphics/Paint;Le/e/a/internal/standard150/BikeRunModel;)V
    .registers 23
    move-object/from16 v0, p1
    move-object/from16 v1, p2
    move-object/from16 v2, p3
    move-object/from16 v3, p4
    invoke-virtual {v0}, Landroid/graphics/Canvas;->save()I
    # Tall clipping bounds cover the complete 1440-unit canvas plus margin.
    const v12, -0x3a800000    # -4096.0f
    const v13, 0x45800000     # +4096.0f

    # First remove real, explicit cliff obstacles from the fill.
    iget-object v5, v3, Le/e/a/internal/standard150/BikeRunModel;->hazards:Ljava/util/ArrayList;
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;
    move-result-object v6
    :hole_hazards
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z
    move-result v8
    if-eqz v8, :hole_profiles_start
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Le/e/a/internal/standard150/BikeRunModel$Hazard;
    iget-boolean v8, v7, Le/e/a/internal/standard150/BikeRunModel$Hazard;->gap:Z
    if-eqz v8, :hole_hazards
    iget v9, v7, Le/e/a/internal/standard150/BikeRunModel$Hazard;->x:F
    iget v10, v7, Le/e/a/internal/standard150/BikeRunModel$Hazard;->width:F
    add-float v11, v9, v10
    invoke-virtual {v0, v9, v12, v11, v13}, Landroid/graphics/Canvas;->clipOutRect(FFFF)Z
    goto :hole_hazards

    # Then remove profile-defined terrain holes. Adjacent samples are merged
    # into one excluded rectangle per hole (no per-pixel clip operations).
    :hole_profiles_start
    iget v4, v3, Le/e/a/internal/standard150/BikeRunModel;->distance:F
    const/4 v15, 0x0       # screen x
    const/4 v14, 0x0       # inside profile gap?
    const/16 v17, 0x0      # gap starting x (8-bit destination)
    :hole_scan
    const/high16 v10, 0x44340000    # logical viewport width = 720
    cmpl-float v8, v15, v10
    if-lez v8, :hole_scan_end
    add-float v9, v4, v15
    invoke-virtual {v3, v9}, Le/e/a/internal/standard150/BikeRunModel;->terrainGapAt(F)Z
    move-result v8
    if-eqz v8, :hole_current_solid
    if-nez v14, :hole_scan_next
    # Expand left by one sample so no green edge remains at transitions.
    const/high16 v10, 0x41000000    # 8
    sub-float v17, v15, v10
    const/4 v11, 0x0
    move/from16 v9, v17
    invoke-static {v9, v11}, Ljava/lang/Math;->max(FF)F
    move-result v17
    const/4 v14, 0x1
    goto :hole_scan_next
    :hole_current_solid
    if-eqz v14, :hole_scan_next
    move/from16 v9, v17
    move v11, v15
    invoke-virtual {v0, v9, v12, v11, v13}, Landroid/graphics/Canvas;->clipOutRect(FFFF)Z
    const/4 v14, 0x0
    :hole_scan_next
    const/high16 v10, 0x41000000    # 8
    add-float/2addr v15, v10
    goto :hole_scan
    :hole_scan_end
    if-eqz v14, :hole_fill
    move/from16 v9, v17
    const/high16 v11, 0x44340000
    invoke-virtual {v0, v9, v12, v11, v13}, Landroid/graphics/Canvas;->clipOutRect(FFFF)Z
    :hole_fill
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V
    invoke-virtual {v0}, Landroid/graphics/Canvas;->restore()V
    return-void
.end method
"""


def _replace_once(text, before, after, name):
    count = text.count(before)
    if count != 1:
        raise ValueError("%s: expected 1 match, found %d" % (name, count))
    return text.replace(before, after, 1)


def patch_track(content):
    start = content.index(".method scenery(Landroid/graphics/Canvas;F)V")
    end = content.index(".end method", start)
    scene = content[start:end]

    # Replace *only* the main ground fill, not the road outline or obstacle.
    main_fill = (
        "    invoke-virtual {v1, v9, v3}, Landroid/graphics/Canvas;"
        "->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V"
    )
    masked_fill = (
        "    invoke-direct {v0, v1, v9, v3, v4}, " + TRACK
        + "->drawTerrainWithoutHoles(Landroid/graphics/Canvas;"
        "Landroid/graphics/Path;Landroid/graphics/Paint;" + MODEL + ")V"
    )
    scene = _replace_once(scene, main_fill, masked_fill, "masked ground fill")

    # The explicit gap had a second phase that painted a solid background
    # rectangle over the missing terrain: remove the paint operation.
    mark = "    iget-boolean v9, v7, " + HAZARD + "->gap:Z"
    index = scene.find(mark)
    if index < 0:
        raise ValueError("Explicit gap branch missing")
    rect = (
        "    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;"
        "->drawRect(FFFFLandroid/graphics/Paint;)V"
    )
    rect_index = scene.find(rect, index)
    if rect_index < 0 or rect_index - index > 1200:
        raise ValueError("Expected explicit gap background fill near gap branch")
    section = scene[index:rect_index]
    if ("->background:I" not in section or
            "->width:F" not in section or
            "->groundAt(F)F" not in section):
        raise ValueError("Explicit gap fill is not the expected rectangle")
    scene = scene[:rect_index] + "    nop    # no background paint in explicit cliff hole" + scene[rect_index + len(rect):]

    # The final rectangle in scenery() was another solid cover-up of
    # procedurally generated terrain gaps. Eliminate it too.
    rect_index = scene.rfind(rect)
    if rect_index < 0 or len(scene) - rect_index > 1100:
        raise ValueError("Expected terminal procedural gap background rectangle")
    section = scene[max(0, rect_index - 800):rect_index]
    if "->background:I" not in section:
        raise ValueError("Terminal drawRect is not a background gap eraser")
    scene = scene[:rect_index] + "    nop    # no background paint in procedural hole" + scene[rect_index + len(rect):]

    if "drawTerrainWithoutHoles" in content:
        raise ValueError("Ground fill mask applied twice")
    return content[:start] + scene + content[end:] + "\n" + DRAW_NO_GAPS
