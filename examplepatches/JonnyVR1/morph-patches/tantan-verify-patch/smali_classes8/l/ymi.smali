.class public Ll/ymi;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:F

.field private b:F

.field private c:F

.field private d:F


# direct methods
.method public constructor <init>(FFF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/ymi;->a:F

    .line 5
    .line 6
    iput p2, p0, Ll/ymi;->b:F

    .line 7
    .line 8
    iput p3, p0, Ll/ymi;->c:F

    .line 9
    .line 10
    sub-float/2addr p2, p1

    .line 11
    iput p2, p0, Ll/ymi;->d:F

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public a(F)F
    .locals 1

    .line 1
    iget v0, p0, Ll/ymi;->c:F

    .line 2
    .line 3
    div-float/2addr p1, v0

    .line 4
    iget v0, p0, Ll/ymi;->d:F

    .line 5
    .line 6
    mul-float/2addr v0, p1

    .line 7
    mul-float/2addr v0, p1

    .line 8
    iget p0, p0, Ll/ymi;->a:F

    .line 9
    .line 10
    add-float/2addr v0, p0

    .line 11
    return v0
.end method

.method public b(F)F
    .locals 4

    .line 1
    iget v0, p0, Ll/ymi;->c:F

    .line 2
    .line 3
    const/high16 v1, 0x40000000    # 2.0f

    .line 4
    .line 5
    div-float/2addr v0, v1

    .line 6
    div-float/2addr p1, v0

    .line 7
    const/high16 v0, 0x3f800000    # 1.0f

    .line 8
    .line 9
    cmpg-float v2, p1, v0

    .line 10
    .line 11
    iget v3, p0, Ll/ymi;->d:F

    .line 12
    .line 13
    if-gez v2, :cond_0

    .line 14
    .line 15
    div-float/2addr v3, v1

    .line 16
    mul-float/2addr v3, p1

    .line 17
    mul-float/2addr v3, p1

    .line 18
    iget p0, p0, Ll/ymi;->a:F

    .line 19
    .line 20
    add-float/2addr v3, p0

    .line 21
    return v3

    .line 22
    :cond_0
    sub-float/2addr p1, v0

    .line 23
    neg-float v2, v3

    .line 24
    div-float/2addr v2, v1

    .line 25
    sub-float v1, p1, v1

    .line 26
    .line 27
    mul-float/2addr p1, v1

    .line 28
    sub-float/2addr p1, v0

    .line 29
    mul-float/2addr v2, p1

    .line 30
    iget p0, p0, Ll/ymi;->a:F

    .line 31
    .line 32
    add-float/2addr v2, p0

    .line 33
    return v2
.end method

.method public c(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/ymi;->c:F

    .line 2
    .line 3
    return-void
.end method
