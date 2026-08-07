.class public Ll/ej60;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static a(FFFFFFLandroid/animation/TimeInterpolator;)Ll/dj60;
    .locals 7

    .line 1
    new-instance v0, Ll/dj60;

    .line 2
    .line 3
    move v1, p0

    .line 4
    move v2, p1

    .line 5
    move v3, p2

    .line 6
    move v4, p3

    .line 7
    move v5, p4

    .line 8
    move v6, p5

    .line 9
    invoke-direct/range {v0 .. v6}, Ll/dj60;-><init>(FFFFFF)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x3

    .line 13
    iput p0, v0, Ll/dj60;->g:I

    .line 14
    .line 15
    invoke-virtual {v0, p6}, Ll/dj60;->a(Landroid/animation/TimeInterpolator;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public static b(FFLandroid/animation/TimeInterpolator;)Ll/dj60;
    .locals 2

    .line 1
    new-instance v0, Ll/dj60;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1, p0, p1}, Ll/dj60;-><init>(IFF)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    iput p0, v0, Ll/dj60;->g:I

    .line 9
    .line 10
    invoke-virtual {v0, p2}, Ll/dj60;->a(Landroid/animation/TimeInterpolator;)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method public static c(FFFFLandroid/animation/TimeInterpolator;)Ll/dj60;
    .locals 1

    .line 1
    new-instance v0, Ll/dj60;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Ll/dj60;-><init>(FFFF)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x2

    .line 7
    iput p0, v0, Ll/dj60;->g:I

    .line 8
    .line 9
    invoke-virtual {v0, p4}, Ll/dj60;->a(Landroid/animation/TimeInterpolator;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public static d(FF)Ll/dj60;
    .locals 2

    .line 1
    new-instance v0, Ll/dj60;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1, p0, p1}, Ll/dj60;-><init>(IFF)V

    .line 5
    .line 6
    .line 7
    iput v1, v0, Ll/dj60;->g:I

    .line 8
    .line 9
    return-object v0
.end method

.method public static e(FFLandroid/animation/TimeInterpolator;)Ll/dj60;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ej60;->d(FF)Ll/dj60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p2}, Ll/dj60;->a(Landroid/animation/TimeInterpolator;)V

    .line 6
    .line 7
    .line 8
    return-object p0
.end method
