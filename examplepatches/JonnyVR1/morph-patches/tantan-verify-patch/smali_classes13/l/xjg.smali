.class public Ll/xjg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/animation/Interpolator;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getInterpolation(F)F
    .locals 2

    .line 1
    mul-float p0, p1, p1

    .line 2
    .line 3
    mul-float/2addr p1, p0

    .line 4
    const v0, -0x40266666    # -1.7f

    .line 5
    .line 6
    .line 7
    mul-float/2addr v0, p1

    .line 8
    mul-float/2addr v0, p0

    .line 9
    const v1, 0x4101999a    # 8.1f

    .line 10
    .line 11
    .line 12
    mul-float/2addr v1, p0

    .line 13
    mul-float/2addr v1, p0

    .line 14
    add-float/2addr v0, v1

    .line 15
    const v1, -0x3eae6666    # -13.1f

    .line 16
    .line 17
    .line 18
    mul-float/2addr p1, v1

    .line 19
    add-float/2addr v0, p1

    .line 20
    const p1, 0x40f66666    # 7.7f

    .line 21
    .line 22
    .line 23
    mul-float/2addr p0, p1

    .line 24
    add-float/2addr v0, p0

    .line 25
    return v0
.end method
