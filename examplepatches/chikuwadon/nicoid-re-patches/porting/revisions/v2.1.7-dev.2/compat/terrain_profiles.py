"""Standard-mode-only smooth rolling ridge/dip terrain variations.

Wrap the v1.4.3 verified Profile.at implementation. Both the renderer and
collision logic keep calling at(F); the profile returns a shared height.
Classic engines and their 72/48 original pattern inventories remain frozen.
"""
PROFILE = "Le/e/a/internal/standard150/BikeRunModel$Profile;"


TERRAIN_VARIANTS = r"""
.method at(F)F
    .registers 12
    invoke-direct {p0, p1}, Le/e/a/internal/standard150/BikeRunModel$Profile;->atLegacy(F)F
    move-result v0
    # Add four seamless 1200-unit rolling contours inside the original
    # 9600-unit section. No discontinuities at window edges.
    const/high16 v1, 0x44480000    # 800.0f
    cmpg-float v2, p1, v1
    if-gez v2, :terrain_continue
    return v0
    :terrain_continue
    const v1, 0x45af0000    # 5600.0f
    cmpl-float v2, p1, v1
    if-lez v2, :terrain_kind
    return v0
    :terrain_kind
    iget v1, p0, Le/e/a/internal/standard150/BikeRunModel$Profile;->kind:I
    const/4 v2, 0x6
    if-ge v1, v2, :terrain_done
    iget v2, p0, Le/e/a/internal/standard150/BikeRunModel$Profile;->variant:I
    const/4 v3, 0x3
    rem-int v2, v2, v3
    # Wavelength 1200; peak at 600; zero at both ends
    const/high16 v3, 0x44480000    # 800.0f
    sub-float v4, p1, v3
    const v3, 0x44960000    # 1200.0f
    rem-float/2addr v4, v3
    const/high16 v3, 0x44160000    # 600.0f
    sub-float/2addr v4, v3
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F
    move-result v4
    sub-float v4, v3, v4
    div-float/2addr v4, v3
    # Flat-safe height 24,36,48 depending on section variant
    const/high16 v3, 0x41c00000    # 24.0f
    int-to-float v5, v2
    const/high16 v6, 0x41400000    # 12.0f
    mul-float/2addr v5, v6
    add-float/2addr v3, v5
    mul-float/2addr v4, v3
    const/4 v3, 0x2
    rem-int/2addr v1, v3
    if-nez v1, :terrain_apply
    neg-float v4, v4
    :terrain_apply
    add-float/2addr v0, v4
    :terrain_done
    return v0
.end method
"""

def patch_profile(content):
    old = ".method at(F)F"
    if content.count(old) != 1:
        raise ValueError("Expected one actual Profile.at(F) method")
    content = content.replace(old, ".method private atLegacy(F)F", 1)
    return content + "\n" + TERRAIN_VARIANTS
