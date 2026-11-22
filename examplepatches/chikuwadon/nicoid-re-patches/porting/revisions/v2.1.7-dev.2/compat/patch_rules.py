"""Private, deterministic smali overlays for the three Bike Run engines.

All changes are applied to temporary copies of original classes.
Original archive files are NEVER modified.
"""
import re
import state_items
import scene_weather
import airborne_rules
import terrain_profiles
import history_actions
import shape_library
import version_order
import version_binding
import terrain_mask

PICKER = "Le/e/a/BikeRunSelector;"


def one_replace(src, old, new, name):
    if src.count(old) != 1:
        raise ValueError("%s: expected exactly one %r, found %d" %
                         (name, old[:90], src.count(old)))
    return src.replace(old, new, 1)


def patch_dialog_tag(content, owner):
    # In BikeRun.open: v0 holds Dialog, v3 holds the game Track.
    anchor = "    invoke-direct {v3, p0}, %s$Track;-><init>(Landroid/content/Context;)V" % owner
    tagged = (anchor + "\n\n"
              "    invoke-virtual {v3, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V")
    return one_replace(content, anchor, tagged, owner + ".open")


def patch_title_touch(content, owner):
    field_anchor = ".field historyOpen:Z"
    content = one_replace(content, field_anchor, field_anchor + "\n\n.field titlePressed:Z",
                          owner + "$Track field")
    anchor = (".method public onTouchEvent(Landroid/view/MotionEvent;)Z\n"
              "    .registers 7\n")
    hook = """
    # Consume only title-area DOWN/UP; never dispatch it as a game jump.
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I
    move-result v0
    if-nez v0, :bike_title_up
    invoke-static {p0, p1}, Le/e/a/BikeRunSelector;->isTitleHit(Landroid/view/View;Landroid/view/MotionEvent;)Z
    move-result v1
    iput-boolean v1, p0, %s$Track;->titlePressed:Z
    if-eqz v1, :bike_title_original
    const/4 v0, 0x1
    return v0

    :bike_title_up
    const/4 v1, 0x1
    if-ne v0, v1, :bike_title_cancel
    iget-boolean v1, p0, %s$Track;->titlePressed:Z
    if-eqz v1, :bike_title_original
    const/4 v1, 0x0
    iput-boolean v1, p0, %s$Track;->titlePressed:Z
    invoke-static {p0, p1}, Le/e/a/BikeRunSelector;->isTitleHit(Landroid/view/View;Landroid/view/MotionEvent;)Z
    move-result v1
    if-eqz v1, :bike_title_consumed
    invoke-virtual {p0}, %s$Track;->performClick()Z
    invoke-static {p0}, Le/e/a/BikeRunSelector;->showFor(Landroid/view/View;)V
    :bike_title_consumed
    const/4 v0, 0x1
    return v0

    :bike_title_cancel
    const/4 v1, 0x3
    if-ne v0, v1, :bike_title_original
    const/4 v1, 0x0
    iput-boolean v1, p0, %s$Track;->titlePressed:Z

    :bike_title_original
""" % ((owner,) * 5)
    return one_replace(content, anchor, anchor + hook, owner + "$Track.onTouchEvent")


def patch_standard_two_finger_pause(content):
    owner = "Le/e/a/internal/standard150/BikeRun"
    content = one_replace(content, ".field paused:Z",
                          ".field paused:Z\n\n.field pauseGesture:Z", "pause gesture state")
    start = ".method public onTouchEvent(Landroid/view/MotionEvent;)Z\n    .registers 7\n"
    hook = ("\n    invoke-direct {p0, p1}, %s$Track;->handleTwoFingerPause(Landroid/view/MotionEvent;)Z\n"
            "    move-result v0\n"
            "    if-eqz v0, :bike_pause_continue\n"
            "    return v0\n"
            "    :bike_pause_continue\n" % owner)
    content = one_replace(content, start, start + hook, "pause entry")
    helper = r"""
.method private handleTwoFingerPause(Landroid/view/MotionEvent;)Z
    .registers 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I
    move-result v0
    const/4 v1, 0x5
    if-ne v0, v1, :pause_release
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I
    move-result v0
    const/4 v1, 0x2
    if-lt v0, v1, :pause_no
    iget-boolean v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->historyOpen:Z
    if-nez v0, :pause_no
    iget-object v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;
    iget-boolean v1, v0, Le/e/a/internal/standard150/BikeRunModel;->started:Z
    if-eqz v1, :pause_no
    iget-boolean v1, v0, Le/e/a/internal/standard150/BikeRunModel;->over:Z
    if-nez v1, :pause_no
    const/4 v0, 0x1
    iput-boolean v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->paused:Z
    iput-boolean v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->pauseGesture:Z
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V
    return v0
    :pause_release
    iget-boolean v1, p0, Le/e/a/internal/standard150/BikeRun$Track;->pauseGesture:Z
    if-eqz v1, :pause_no
    const/4 v2, 0x1
    if-eq v0, v2, :pause_clear
    const/4 v2, 0x3
    if-eq v0, v2, :pause_clear
    const/4 v0, 0x1
    return v0
    :pause_clear
    const/4 v0, 0x0
    iput-boolean v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->pauseGesture:Z
    const/4 v0, 0x1
    return v0
    :pause_no
    const/4 v0, 0x0
    return v0
.end method
"""
    return content + "\n" + helper


def patch_bidirectional_wheelie(content, owner):
    # Existing calculation is (finger DOWN Y) - (finger UP Y).
    # Positive >=86 = upward swipe. Negative <=-86 = downward swipe.
    # Keep exactly the original wheelie toggle, grounded-only and airborne guards.
    pattern = re.compile(
        r"(    const/16 v3, 0x56\n\n)"
        r"    if-lt v2, v3, (:[A-Za-z0-9_]+)\n"
    )
    def repl(m):
        return (m.group(1) +
                "    if-ge v2, v3, :bike_wheelie_toggle\n\n"
                "    const/16 v3, -0x56\n\n"
                "    if-gt v2, v3, " + m.group(2) + "\n\n"
                "    :bike_wheelie_toggle\n")
    replaced, count = pattern.subn(repl, content, count=1)
    if count != 1:
        raise ValueError("%s: original 86px upward-wheelie branch not found" % owner)
    return replaced


FX_METHOD = r"""
# Lightweight Canvas-only speed streaks; standard v1.5.0 only.
.method private static drawSpeedLines(Landroid/graphics/Canvas;Landroid/graphics/Paint;Le/e/a/internal/standard150/BikeRunModel;)V
    .registers 12
    iget-boolean v0, p2, Le/e/a/internal/standard150/BikeRunModel;->started:Z
    if-eqz v0, :done_fx
    iget-boolean v0, p2, Le/e/a/internal/standard150/BikeRunModel;->over:Z
    if-nez v0, :done_fx
    iget v6, p2, Le/e/a/internal/standard150/BikeRunModel;->distance:F
    const/high16 v8, 0x41400000    # 12.0f
    div-float/2addr v6, v8
    const/high16 v8, 0x43a00000    # 320.0f
    rem-float/2addr v6, v8
    const/high16 v8, 0x43960000    # 300.0f
    add-float/2addr v6, v8
    const/16 v8, 0x46
    invoke-virtual {p1, v8}, Landroid/graphics/Paint;->setAlpha(I)V

    move-object v0, p0
    move v1, v6
    const/high16 v2, 0x43820000    # 260.0f
    const/high16 v8, 0x425c0000    # 55.0f
    add-float v3, v6, v8
    move v4, v2
    move-object v5, p1
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v8, 0x42a00000    # 80.0f
    sub-float v1, v6, v8
    const/high16 v2, 0x43a50000    # 330.0f
    const/high16 v8, 0x42200000    # 40.0f
    add-float v3, v1, v8
    move v4, v2
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/16 v8, 0xff
    invoke-virtual {p1, v8}, Landroid/graphics/Paint;->setAlpha(I)V
    :done_fx
    return-void
.end method
"""

def patch_standard_graphics(content):
    owner = "Le/e/a/internal/standard150/BikeRun"
    # The renderer has two equivalent scenery call sites, both must call the effect.
    call = ("    invoke-virtual {v6, v7, v9}, %s$Track;->scenery(Landroid/graphics/Canvas;F)V" % owner)
    if content.count(call) != 2:
        raise ValueError("standard renderer has an unexpected scenery call count")
    # Preserve v0: :goto_c4 uses it as a float road offset.
    # Reusing v0 as Paint caused Android ART VerifyError on game startup.
    # v2/v3 are overwritten immediately at that merge point.
    fx = (call + "\n\n"
          "    iget-object v2, v6, %s$Track;->paint:Landroid/graphics/Paint;\n" % owner +
          "    iget-object v3, v6, %s$Track;->game:%sModel;\n" % (owner, owner) +
          "    invoke-static {v7, v2, v3}, %s$Track;->drawSpeedLines(Landroid/graphics/Canvas;Landroid/graphics/Paint;%sModel;)V" % (owner, owner))
    content = content.replace(call, fx)
    return content + "\n" + FX_METHOD



def patch_record_version_validation(content):
    """Accept stable and prerelease semver without changing the record format.

    All three engines read the same SharedPreferences key. Each Entry
    constructor must accept e.g. 1.5.0-dev.8 or older engines will discard
    the new entries during decode.
    """
    old = r'[0-9]+\\.[0-9]+\\.[0-9]+'
    new = r'[0-9]+\\.[0-9]+\\.[0-9]+(-[a-zA-Z0-9.-]+)?'
    if content.count(old) != 1:
        raise ValueError("Unexpected record version validator count")
    return content.replace(old, new)


# v1.5 standard only: two-hit health and brief damage immunity.
# Wrapper keeps the verified physics and hazard generation in stepLegacy.
HEALTH_METHOD = r"""
.method public step(F)V
    .registers 6
    iget-boolean v0, p0, Le/e/a/internal/standard150/BikeRunModel;->started:Z
    if-eqz v0, :health_done
    iget-boolean v0, p0, Le/e/a/internal/standard150/BikeRunModel;->over:Z
    if-nez v0, :health_done
    iget v0, p0, Le/e/a/internal/standard150/BikeRunModel;->damageCooldown:F
    const/4 v1, 0x0
    cmpg-float v2, v0, v1
    if-lez v2, :health_step
    sub-float/2addr v0, p1
    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F
    move-result v0
    iput v0, p0, Le/e/a/internal/standard150/BikeRunModel;->damageCooldown:F
    :health_step
    const/4 v0, 0x0
    iput-boolean v0, p0, Le/e/a/internal/standard150/BikeRunModel;->collisionHit:Z
    invoke-direct {p0, p1}, Le/e/a/internal/standard150/BikeRunModel;->stepLegacy(F)V
    iget-boolean v0, p0, Le/e/a/internal/standard150/BikeRunModel;->over:Z
    if-eqz v0, :health_done
    iget-boolean v0, p0, Le/e/a/internal/standard150/BikeRunModel;->collisionHit:Z
    if-eqz v0, :health_done
    iget v0, p0, Le/e/a/internal/standard150/BikeRunModel;->damageCooldown:F
    cmpl-float v2, v0, v1
    if-lez v2, :health_damage
    const/4 v0, 0x0
    iput-boolean v0, p0, Le/e/a/internal/standard150/BikeRunModel;->over:Z
    goto :health_done
    :health_damage
    iget v0, p0, Le/e/a/internal/standard150/BikeRunModel;->lives:I
    add-int/lit8 v0, v0, -0x1
    iput v0, p0, Le/e/a/internal/standard150/BikeRunModel;->lives:I
    if-gtz v0, :health_revive
    goto :health_done
    :health_revive
    const/4 v0, 0x0
    iput-boolean v0, p0, Le/e/a/internal/standard150/BikeRunModel;->over:Z
    const/high16 v0, 0x3fc00000    # 1.5f
    iput v0, p0, Le/e/a/internal/standard150/BikeRunModel;->damageCooldown:F
    :health_done
    return-void
.end method
"""

def patch_standard_model(content):
    owner = "Le/e/a/internal/standard150/BikeRunModel;"
    content = content.replace(".field public distance:F",
                              ".field public lives:I\n\n.field public damageCooldown:F\n\n.field public collisionHit:Z\n\n.field public distance:F", 1)
    content = one_replace(content, ".method public step(F)V",
                          ".method private stepLegacy(F)V", "standard model physics wrapper")
    content = one_replace(content, "    iput v0, p0, " + owner + "->gapTime:F",
                          "    iput v0, p0, " + owner + "->damageCooldown:F\n\n"
                          "    const/4 v1, 0x3\n\n"
                          "    iput v1, p0, " + owner + "->lives:I\n\n"
                          "    iput v0, p0, " + owner + "->gapTime:F",
                          "standard model reset")
    # Reset fall marker on each new run.
    content = one_replace(content,
                          "    iput v0, p0, " + owner + "->damageCooldown:F",
                          "    iput v0, p0, " + owner + "->damageCooldown:F\n\n"
                          "    const/4 v1, 0x0\n\n"
                          "    iput-boolean v1, p0, " + owner + "->collisionHit:Z",
                          "standard reset fall marker")
    # Once a solid obstacle has registered a collision, retire that
    # obstacle before the next physics tick. Without this, the same obstacle
    # can kill the rider again as soon as the cooldown expires.
    # Explicitly mark hazard hits. Falling and cliff-impact game-over paths
    # never set this marker, so they remain fatal regardless of health.
    collision = "    iput-boolean v7, v0, " + owner + "->over:Z"
    collision_fix = ("    const/4 v7, 0x1\n"
                     "    const v8, -0x39e3c000    # -10000.0f\n"
                     "    iput v8, v4, Le/e/a/internal/standard150/BikeRunModel$Hazard;->x:F\n"
                     "    iput-boolean v7, v0, " + owner + "->collisionHit:Z\n"
                     + collision)
    content = one_replace(content, collision, collision_fix, "retire collided hazard")
    # The separate terrain/enemy contact path also signals a hit.
    terrain_hit = "    iput-boolean v11, v0, " + owner + "->over:Z"
    terrain_fix = ("    const v11, -0x39e3c000    # -10000.0f\n"
                   "    iput v11, v4, Le/e/a/internal/standard150/BikeRunModel$Hazard;->x:F\n"
                   "    const/4 v11, 0x1\n"
                   "    iput-boolean v11, v0, " + owner + "->collisionHit:Z\n"
                   + terrain_hit)
    content = one_replace(content, terrain_hit, terrain_fix, "mark terrain enemy collision")
    # A steep ledge is an impact, not a fall into a pit. Mark it as damage
    # so the health wrapper can preserve the run while lives remain.
    ledge = ("    iput-boolean v8, v0, " + owner + "->over:Z")
    ledge_fix = ("    iput-boolean v8, v0, " + owner + "->collisionHit:Z\n" + ledge)
    if content.count(ledge) != 2:
        raise ValueError("expected two steep-ledge death paths")
    content = content.replace(ledge, ledge_fix)
    # Fatality is determined by explicit collision markers rather than falling state.
    # Remove the early content locks; the original shuffled pattern bag
    # still supplies variety, while difficulty() continues to scale by distance.
    content = content.replace("const/high16 v11, 0x44160000    # 600.0f",
                              "const/4 v11, 0x0", 1)
    content = content.replace("const/high16 v13, 0x44340000    # 720.0f",
                              "const/4 v13, 0x0", 1)
    content = content.replace("const/high16 v16, 0x45af0000    # 5600.0f",
                              "const/high16 v16, 0x44160000    # 600.0f", 1)
    content = content.replace("const v16, 0x463b8000    # 12000.0f",
                              "const v16, 0x44c80000    # 1600.0f", 1)
    content = content.replace("const/high16 v1, 0x45f00000    # 7680.0f",
                              "const/high16 v1, 0x44c80000    # 1600.0f", 1)
    # Seven opening silhouettes instead of the original five width families.
    # The shuffled 48-pattern bag remains deterministic and collision-safe.
    content = one_replace(content,
                          "    rem-int/lit8 v4, v4, 0x5",
                          "    rem-int/lit8 v4, v4, 0x7",
                          "seven initial hazard shape families")
    # Previously unreachable fourth hazard: pattern index is 0..4,
    # so the original >=6 check could never succeed.
    content = one_replace(content,
                          "    const/4 v15, 0x6",
                          "    const/4 v15, 0x2",
                          "enable advanced multi-hazard patterns")
    return content + "\n" + HEALTH_METHOD


LIVES_HUD = r"""
.method private static drawLives(Landroid/graphics/Canvas;Landroid/graphics/Paint;Le/e/a/internal/standard150/BikeRunModel;)V
    .registers 12
    iget v8, p2, Le/e/a/internal/standard150/BikeRunModel;->lives:I
    sget-object v7, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;
    invoke-virtual {p1, v7}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V
    const/high16 v7, 0x41000000    # 8.0f
    invoke-virtual {p1, v7}, Landroid/graphics/Paint;->setStrokeWidth(F)V
    move-object v0, p0
    const/high16 v2, -0x3d200000    # -112.0f
    move v4, v2
    move-object v5, p1
    const/16 v7, 0x50
    invoke-virtual {p1, v7}, Landroid/graphics/Paint;->setAlpha(I)V
    const v1, -0x3df40000    # -35.0f
    const/high16 v3, -0x3e900000    # -10.0f
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V
    const/high16 v1, -0x3ee00000    # -5.0f
    const/high16 v3, 0x41200000    # 15.0f
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V
    const/high16 v1, 0x41700000    # 20.0f
    const v3, 0x420c0000    # 40.0f
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V
    const/16 v7, 0xff
    invoke-virtual {p1, v7}, Landroid/graphics/Paint;->setAlpha(I)V
    if-lez v8, :health_bar_restore
    const v1, -0x3df40000    # -35.0f
    const/high16 v3, -0x3e900000    # -10.0f
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V
    const/4 v7, 0x1
    if-le v8, v7, :health_bar_restore
    const/high16 v1, -0x3ee00000    # -5.0f
    const/high16 v3, 0x41200000    # 15.0f
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V
    const/4 v7, 0x2
    if-le v8, v7, :health_bar_restore
    const/high16 v1, 0x41700000    # 20.0f
    const v3, 0x420c0000    # 40.0f
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V
    :health_bar_restore
    const/high16 v7, 0x40800000    # 4.0f
    invoke-virtual {p1, v7}, Landroid/graphics/Paint;->setStrokeWidth(F)V
    :health_bar_end
    return-void
.end method
"""

BLINK_METHOD = r"""
.method private static applyDamageBlink(Landroid/graphics/Paint;Le/e/a/internal/standard150/BikeRunModel;)V
    .registers 6
    iget v0, p1, Le/e/a/internal/standard150/BikeRunModel;->damageCooldown:F
    const/4 v1, 0x0
    cmpl-float v0, v0, v1
    if-lez v0, :blink_visible
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    const-wide/16 v2, 0x96
    div-long/2addr v0, v2
    const-wide/16 v2, 0x1
    and-long/2addr v0, v2
    cmp-long v0, v0, v2
    if-nez v0, :blink_visible
    const/16 v0, 0x30
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setAlpha(I)V
    return-void
    :blink_visible
    const/16 v0, 0xff
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setAlpha(I)V
    return-void
.end method
"""

BLINK_CANVAS = r"""
.method private static blinkRider(Landroid/graphics/Canvas;Le/e/a/internal/standard150/BikeRunModel;)V
    .registers 8
    iget v0, p1, Le/e/a/internal/standard150/BikeRunModel;->damageCooldown:F
    const/4 v1, 0x0
    cmpl-float v0, v0, v1
    if-lez v0, :blink_end
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    const-wide/16 v2, 0x96
    div-long/2addr v0, v2
    const-wide/16 v2, 0x1
    and-long/2addr v0, v2
    cmp-long v0, v0, v2
    if-nez v0, :blink_end
    const/4 v0, 0x0
    invoke-virtual {p0, v0, v0}, Landroid/graphics/Canvas;->scale(FF)V
    :blink_end
    return-void
.end method
"""

def patch_standard_hud(content):
    owner = "Le/e/a/internal/standard150/BikeRun"
    anchor = "    invoke-virtual {v7, v13, v14}, Landroid/graphics/Canvas;->translate(FF)V"
    insertion = (anchor + "\n"
                 "    iget-object v0, v6, %s$Track;->paint:Landroid/graphics/Paint;\n" % owner +
                 "    iget-object v1, v6, %s$Track;->game:%sModel;\n" % (owner, owner) +
                 "    invoke-static {v7, v0, v1}, %s$Track;->drawLives(Landroid/graphics/Canvas;Landroid/graphics/Paint;%sModel;)V" % (owner, owner))
    content = one_replace(content, anchor, insertion, "rider-relative health bar")
    blink_call = ("    invoke-static {v7, v1}, %s$Track;->blinkRider(Landroid/graphics/Canvas;%sModel;)V" % (owner, owner))
    content = one_replace(content, insertion, insertion + "\n" + blink_call, "rider blink")
    return content + "\n" + LIVES_HUD + "\n" + BLINK_CANVAS

def patch_standard_speed(content):
    # Road height increases downward in Canvas coordinates. A positive
    # ground derivative is a downhill and should accelerate the cyclist.
    start = content.index(".method public speed()F")
    end = content.index(".end method", start)
    method = content[start:end]
    addition = """    const/high16 v1, 0x42f00000    # 120.0f
    invoke-virtual {p0, v1}, Le/e/a/internal/standard150/BikeRunModel;->slopeAt(F)F
    move-result v1
    const/high16 v2, 0x42a00000    # 80.0f
    mul-float/2addr v1, v2
    add-float/2addr v0, v1
    const/high16 v1, 0x42a00000    # minimum 80 world units/s
    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F
    move-result v0
"""
    last_return = method.rfind("    return v0")
    if last_return < 0:
        raise ValueError("speed return missing")
    method = method[:last_return] + addition + method[last_return:]
    return content[:start] + method + content[end:]


def patch_standard_profile(content):
    # Reduce gap width in the narrow-platform terrain family, preserving
    # the deterministic seed and the original profile's difficulty progression.
    content = one_replace(content, "    mul-int/lit8 v2, v2, 0xc",
                          "    mul-int/lit8 v2, v2, 0x8", "wider landing platforms")
    content = one_replace(content, "    add-int/lit8 v2, v2, 0x7d",
                          "    add-int/lit8 v2, v2, 0x60", "shorter terrain gaps")
    return content


GAP_BACKDROP = r"""
.method private static fillCliffBackdrop(Landroid/graphics/Canvas;Le/e/a/internal/standard150/BikeRun$Track;FF)V
    .registers 12
    iget-object v5, p1, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;
    const v6, -0xeed3da    # ARGB FF112C26
    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V
    sget-object v6, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;
    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V
    move-object v0, p0
    const/4 v1, 0x0
    const/high16 v6, 0x43700000    # 240.0f
    sub-float v2, p2, v6
    const/high16 v3, 0x44340000    # 720.0f
    move v4, p3
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
    return-void
.end method
"""

def patch_standard_cliff_background(content):
    owner = "Le/e/a/internal/standard150/BikeRun"
    anchor = "    add-float v14, v0, v2"
    content = one_replace(content, anchor,
                          anchor + "\n\n    invoke-static {v7, v6, v14, v9}, %s$Track;->fillCliffBackdrop(Landroid/graphics/Canvas;%s$Track;FF)V" % (owner, owner),
                          "consistent green cliff backdrop")
    return content + "\n" + GAP_BACKDROP


def patch_standard_gap_edges(content):
    # Remove only the vertical cliff accent lines. The terrain outline
    # and the collision model are left unchanged.
    start = content.index(".method protected onDraw(Landroid/graphics/Canvas;)V")
    end = content.index(".end method", start)
    draw = content[start:end]
    call = "    invoke-virtual/range {v0 .. v5}, Le/e/a/internal/standard150/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V"
    # Gap hazard branch is between :cond_335 and :goto_38b.
    first = draw.index("\\n    :cond_335\\n".replace("\\n", "\n"))
    last = draw.index("    :goto_38b", first)
    section = draw[first:last]
    if section.count(call) != 2:
        raise ValueError("hazard gap boundary draw count changed: %d" % section.count(call))
    draw = draw[:first] + section.replace(call, "    nop") + draw[last:]
    # Procedural terrain gap edge is between :cond_42d and :cond_460.
    first = draw.index("    :cond_42d\n")
    last = draw.index("    :cond_460", first)
    section = draw[first:last]
    if section.count(call) != 1:
        raise ValueError("terrain gap boundary draw count changed: %d" % section.count(call))
    draw = draw[:first] + section.replace(call, "    nop") + draw[last:]
    return content[:start] + draw + content[end:]


DEEP_SCENERY = r"""
.method private drawDeepScenery(Landroid/graphics/Canvas;F)V
    .registers 9
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I
    const v0, 0x3f2aaaab    # 2/3
    mul-float v0, p2, v0
    const/high16 v1, 0x422c0000    # 43
    add-float/2addr v0, v1
    const/4 v1, 0x0
    const/high16 v2, 0x44340000    # 720
    invoke-virtual {p1, v1, v0, v2, p2}, Landroid/graphics/Canvas;->clipRect(FFFF)Z
    const/high16 v0, 0x43480000    # 200
    invoke-virtual {p1, v1, v0}, Landroid/graphics/Canvas;->translate(FF)V
    invoke-virtual {p0, p1, p2}, Le/e/a/internal/standard150/BikeRun$Track;->scenery(Landroid/graphics/Canvas;F)V
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V
    return-void
.end method
"""

def patch_standard_deep_scenery(content):
    owner = "Le/e/a/internal/standard150/BikeRun"
    call = "    invoke-virtual {v6, v7, v9}, %s$Track;->scenery(Landroid/graphics/Canvas;F)V" % owner
    if content.count(call) != 2:
        raise ValueError("expected two scenery call sites")
    content = content.replace(call, call + "\n    invoke-direct {v6, v7, v9}, %s$Track;->drawDeepScenery(Landroid/graphics/Canvas;F)V" % owner)
    return content + "\n" + DEEP_SCENERY


def patch_standard_environment(content):
    # Only the v1.5.0 renderer: finer terrain samples prevent visible gaps
    # where 16px samples previously missed the edge of a 4px cliff segment.
    content = one_replace(content,
                          "    add-int/lit8 v0, v0, 0x10",
                          "    add-int/lit8 v0, v0, 0x2",
                          "two-pixel terrain contour")
    # Keep cloud elements alive for a much longer scroll cycle. Their
    # spacing remains fixed and scenery is still rendered with Canvas.
    scenery_start = content.index(".method scenery(Landroid/graphics/Canvas;F)V")
    scenery_end = content.index(".end method", scenery_start)
    scenery = content[scenery_start:scenery_end]
    scenery = one_replace(scenery, "    const/4 v15, 0x5",
                          "    const/16 v15, 0x8",
                          "eight continuous clouds")
    scenery = one_replace(scenery, "    const/high16 v15, 0x44750000    # 980.0f",
                          "    const/high16 v15, 0x44f50000    # 1960.0f",
                          "cloud wrap period")
    scenery = one_replace(scenery,
                          "    sub-float v10, v10, v13",
                          "    sub-float v10, v10, v13\n\n"
                          "    add-float/2addr v10, v15\n\n"
                          "    rem-float/2addr v10, v15\n\n"
                          "    const/high16 v13, 0x43750000    # 245.0f\n\n"
                          "    sub-float/2addr v10, v13",
                          "offscreen-only cloud recycling")
    return content[:scenery_start] + scenery + content[scenery_end:]


def transform_standard(content, name):
    # Start from the verified v1.4.3 classes, preserving physics and records.
    owner = "Le/e/a/internal/standard150/BikeRun"
    content = content.replace("Le/e/a/BikeRun", owner)
    if name == "BikeRunModel.smali":
        # A single authoritative version for the title, records and rankings.
        content = content.replace('" v1.4.3"', '" v1.5.0"')
        content = content.replace('"1.4.3"', '"1.5.0"')
    if name == "BikeRun$Track.smali":
        content = version_binding.patch_standard_track(content)
    if name == "BikeRunModel.smali":
        content = patch_standard_model(content)
        content = patch_standard_speed(content)
        content = shape_library.patch_model(content)
        content = state_items.patch_model(content)
        content = airborne_rules.patch_model(content)
    if name == "BikeRunModel$Hazard.smali":
        content = shape_library.patch_hazard(content)
    if name == "BikeRunRecords$2.smali":
        content = version_order.patch(content, owner)
    if name == "BikeRunModel$Profile.smali":
        content = patch_standard_profile(content)
        content = terrain_profiles.patch_profile(content)
    if name == "BikeRunRecords$Entry.smali":
        content = patch_record_version_validation(content)
    if name == "BikeRunRecords.smali":
        content = history_actions.patch_records(content, owner)
    if name == "BikeRun$RecordsPane.smali":
        content = history_actions.patch_pane(content, owner)
        content = version_binding.patch_standard_pane(content)
    if name == "BikeRun.smali":
        content = patch_dialog_tag(content, owner)
    elif name == "BikeRun$Track.smali":
        content = patch_title_touch(content, owner)
        content = patch_standard_two_finger_pause(content)
        content = one_replace(content, '    const-string v3, "\\u30bf\\u30c3\\u30d7\\u3067\\u518d\\u958b"', '    const-string v3, "PAUSE"', "pause label")
        content = one_replace(content, '    const-string v0, "Tap to resume"', '    const-string v0, "PAUSE"', "pause English")
        content = one_replace(content, '    const-string v1, "\\u70b9\\u51fb\\u7ee7\\u7eed"', '    const-string v1, "PAUSE"', "pause Chinese")
        content = patch_bidirectional_wheelie(content, owner)
        # Remove dev.5 stray speed streaks (the two unexplained lines).
        content = patch_standard_hud(content)
        content = patch_standard_environment(content)
        content = terrain_mask.patch_track(content)
        content = state_items.patch_track(content)
        content = scene_weather.patch_track(content)
        content = airborne_rules.patch_track(content)
        content = shape_library.patch_track(content)
    return content


def transform_original(content, name):
    owner = "Le/e/a/BikeRun"
    if name == "BikeRunRecords.smali":
        return history_actions.patch_records(content, owner)
    if name == "BikeRunRecords$2.smali":
        return version_order.patch(content, owner)
    if name == "BikeRun$RecordsPane.smali":
        return history_actions.patch_pane(content, owner)
    if name == "BikeRunRecords$Entry.smali":
        return patch_record_version_validation(content)
    if name == "BikeRun.smali":
        return patch_dialog_tag(content, owner)
    if name == "BikeRun$Track.smali":
        return patch_bidirectional_wheelie(patch_title_touch(content, owner), owner)
    return content


def transform_classic131(content, name):
    owner = "Le/e/a/internal/classic131/BikeRun"
    if name == "BikeRunRecords.smali":
        return history_actions.patch_records(content, owner)
    if name == "BikeRunRecords$2.smali":
        return version_order.patch(content, owner)
    if name == "BikeRun$RecordsPane.smali":
        return history_actions.patch_pane(content, owner)
    if name == "BikeRunRecords$Entry.smali":
        return patch_record_version_validation(content)
    if name == "BikeRun.smali":
        return patch_dialog_tag(content, owner)
    if name == "BikeRun$Track.smali":
        return patch_title_touch(content, owner)
    return content
