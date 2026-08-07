.class public Ll/gqf;
.super Ll/hqf;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/hqf<",
        "Ll/uol;",
        ">;"
    }
.end annotation


# instance fields
.field g:F

.field h:F

.field i:Landroid/animation/TimeInterpolator;


# direct methods
.method public constructor <init>(Ll/uol;FFLandroid/animation/TimeInterpolator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hqf;-><init>(Ll/yol;)V

    .line 2
    .line 3
    .line 4
    iput p2, p0, Ll/gqf;->g:F

    .line 5
    .line 6
    iput p3, p0, Ll/gqf;->h:F

    .line 7
    .line 8
    iput-object p4, p0, Ll/gqf;->i:Landroid/animation/TimeInterpolator;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public d(F)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hqf;->a:Ll/yol;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/gqf;->i:Landroid/animation/TimeInterpolator;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-interface {v0, p1}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    :cond_0
    iget-object v0, p0, Ll/hqf;->a:Ll/yol;

    .line 14
    .line 15
    check-cast v0, Ll/uol;

    .line 16
    .line 17
    iget v1, p0, Ll/gqf;->g:F

    .line 18
    .line 19
    iget p0, p0, Ll/gqf;->h:F

    .line 20
    .line 21
    sub-float/2addr p0, v1

    .line 22
    mul-float/2addr p0, p1

    .line 23
    add-float/2addr v1, p0

    .line 24
    invoke-interface {v0, v1}, Ll/uol;->d(F)V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method
