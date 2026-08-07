.class public Ll/vo0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/animation/Interpolator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/vo0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    iput v0, p0, Ll/vo0$a;->a:F

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getInterpolation(F)F
    .locals 2

    .line 1
    iget p0, p0, Ll/vo0$a;->a:F

    .line 2
    .line 3
    const/high16 v0, 0x3f800000    # 1.0f

    .line 4
    .line 5
    cmpl-float v1, p0, v0

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    sub-float p0, v0, p1

    .line 10
    .line 11
    mul-float/2addr p0, p0

    .line 12
    sub-float/2addr v0, p0

    .line 13
    return v0

    .line 14
    :cond_0
    sub-float/2addr v0, p1

    .line 15
    float-to-double v0, v0

    .line 16
    const/high16 p1, 0x40000000    # 2.0f

    .line 17
    .line 18
    mul-float/2addr p0, p1

    .line 19
    float-to-double p0, p0

    .line 20
    invoke-static {v0, v1, p0, p1}, Ljava/lang/Math;->pow(DD)D

    .line 21
    .line 22
    .line 23
    move-result-wide p0

    .line 24
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 25
    .line 26
    sub-double/2addr v0, p0

    .line 27
    double-to-float p0, v0

    .line 28
    return p0
.end method
