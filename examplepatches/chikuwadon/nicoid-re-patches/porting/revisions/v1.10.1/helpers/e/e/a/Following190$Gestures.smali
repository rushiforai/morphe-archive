.class final Le/e/a/Following190$Gestures;
.super Ljava/lang/Object;
.source "Following190.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/Following190;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Gestures"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static isHorizontal(FFI)Z
    .registers 4

    .line 43
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    int-to-float p2, p2

    cmpl-float p2, v0, p2

    if-lez p2, :cond_1b

    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    move-result p0

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    const p2, 0x3fa66666    # 1.3f

    mul-float/2addr p1, p2

    cmpl-float p0, p0, p1

    if-lez p0, :cond_1b

    const/4 p0, 0x1

    return p0

    :cond_1b
    const/4 p0, 0x0

    return p0
.end method

.method static shouldSwitch(FFII)Z
    .registers 6

    .line 44
    if-lez p2, :cond_2c

    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    int-to-float p2, p2

    const v1, 0x3e4ccccd    # 0.2f

    mul-float/2addr v1, p2

    cmpl-float v0, v0, v1

    if-gtz v0, :cond_2a

    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const v1, 0x3d23d70a    # 0.04f

    mul-float/2addr p2, v1

    cmpl-float p2, v0, p2

    if-lez p2, :cond_2c

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p2

    int-to-float p3, p3

    cmpl-float p2, p2, p3

    if-lez p2, :cond_2c

    mul-float/2addr p0, p1

    const/4 p1, 0x0

    cmpl-float p0, p0, p1

    if-lez p0, :cond_2c

    :cond_2a
    const/4 p0, 0x1

    return p0

    :cond_2c
    const/4 p0, 0x0

    return p0
.end method
