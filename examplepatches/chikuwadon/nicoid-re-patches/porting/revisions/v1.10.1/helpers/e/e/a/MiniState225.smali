.class final Le/e/a/MiniState225;
.super Ljava/lang/Object;
.source "MiniState225.java"


# static fields
.field static final CLOSED:I = 0x4

.field static final DRAG:I = 0x1

.field static final MINI:I = 0x0

.field static final RESTORING:I = 0x3

.field static final SETTLING:I = 0x2


# instance fields
.field fraction:F

.field generation:I

.field phase:I


# direct methods
.method constructor <init>()V
    .registers 2

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 6
    iput v0, p0, Le/e/a/MiniState225;->phase:I

    return-void
.end method


# virtual methods
.method cancel()I
    .registers 2

    .line 8
    iget v0, p0, Le/e/a/MiniState225;->generation:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Le/e/a/MiniState225;->generation:I

    invoke-virtual {p0}, Le/e/a/MiniState225;->live()Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x0

    iput v0, p0, Le/e/a/MiniState225;->phase:I

    const/4 v0, 0x0

    iput v0, p0, Le/e/a/MiniState225;->fraction:F

    :cond_12
    iget v0, p0, Le/e/a/MiniState225;->generation:I

    return v0
.end method

.method close()V
    .registers 2

    .line 13
    iget v0, p0, Le/e/a/MiniState225;->generation:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Le/e/a/MiniState225;->generation:I

    const/4 v0, 0x4

    iput v0, p0, Le/e/a/MiniState225;->phase:I

    const/4 v0, 0x0

    iput v0, p0, Le/e/a/MiniState225;->fraction:F

    return-void
.end method

.method current(I)Z
    .registers 3

    .line 12
    invoke-virtual {p0}, Le/e/a/MiniState225;->live()Z

    move-result v0

    if-eqz v0, :cond_c

    iget v0, p0, Le/e/a/MiniState225;->generation:I

    if-ne v0, p1, :cond_c

    const/4 p1, 0x1

    return p1

    :cond_c
    const/4 p1, 0x0

    return p1
.end method

.method drag(FF)Z
    .registers 5

    .line 9
    invoke-virtual {p0}, Le/e/a/MiniState225;->live()Z

    move-result v0

    if-eqz v0, :cond_27

    iget v0, p0, Le/e/a/MiniState225;->phase:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_c

    goto :goto_27

    :cond_c
    iget v0, p0, Le/e/a/MiniState225;->generation:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iput v0, p0, Le/e/a/MiniState225;->generation:I

    iput v1, p0, Le/e/a/MiniState225;->phase:I

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v0, p2}, Ljava/lang/Math;->max(FF)F

    move-result p2

    div-float/2addr p1, p2

    invoke-static {v0, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    const/4 p2, 0x0

    invoke-static {p2, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    iput p1, p0, Le/e/a/MiniState225;->fraction:F

    return v1

    :cond_27
    :goto_27
    const/4 p1, 0x0

    return p1
.end method

.method expand(F)Z
    .registers 4

    .line 10
    iget v0, p0, Le/e/a/MiniState225;->fraction:F

    const v1, 0x3eb33333    # 0.35f

    cmpl-float v0, v0, v1

    if-gez v0, :cond_11

    const/high16 v0, -0x3b9f0000    # -900.0f

    cmpg-float p1, p1, v0

    if-ltz p1, :cond_11

    const/4 p1, 0x0

    return p1

    :cond_11
    const/4 p1, 0x1

    return p1
.end method

.method live()Z
    .registers 3

    .line 7
    iget v0, p0, Le/e/a/MiniState225;->phase:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_7

    const/4 v0, 0x1

    return v0

    :cond_7
    const/4 v0, 0x0

    return v0
.end method

.method settle(Z)I
    .registers 3

    .line 11
    invoke-virtual {p0}, Le/e/a/MiniState225;->live()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 p1, -0x1

    return p1

    :cond_8
    if-eqz p1, :cond_c

    const/4 p1, 0x3

    goto :goto_d

    :cond_c
    const/4 p1, 0x2

    :goto_d
    iput p1, p0, Le/e/a/MiniState225;->phase:I

    iget p1, p0, Le/e/a/MiniState225;->generation:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Le/e/a/MiniState225;->generation:I

    return p1
.end method
