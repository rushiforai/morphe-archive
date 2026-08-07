.class public Ll/di40;
.super Ll/fsf0;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/fsf0;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public f(Landroid/content/Context;)V
    .locals 3
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Ll/fsf0;->f(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/fsf0;->o:Landroid/util/DisplayMetrics;

    .line 5
    .line 6
    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    .line 7
    .line 8
    const/high16 v0, 0x41f00000    # 30.0f

    .line 9
    .line 10
    mul-float/2addr v0, p1

    .line 11
    iput v0, p0, Ll/fsf0;->c:F

    .line 12
    .line 13
    iput v0, p0, Ll/fsf0;->d:F

    .line 14
    .line 15
    const/high16 v1, 0x41000000    # 8.0f

    .line 16
    .line 17
    mul-float/2addr v1, p1

    .line 18
    iput v1, p0, Ll/fsf0;->g:F

    .line 19
    .line 20
    const/high16 v1, 0x40000000    # 2.0f

    .line 21
    .line 22
    mul-float/2addr v1, p1

    .line 23
    iput v1, p0, Ll/fsf0;->h:F

    .line 24
    .line 25
    const/high16 v1, 0x40800000    # 4.0f

    .line 26
    .line 27
    mul-float/2addr v1, p1

    .line 28
    iput v1, p0, Ll/fsf0;->e:F

    .line 29
    .line 30
    const/high16 v2, 0x41100000    # 9.0f

    .line 31
    .line 32
    mul-float/2addr p1, v2

    .line 33
    iput p1, p0, Ll/fsf0;->k:F

    .line 34
    .line 35
    sub-float/2addr v0, v1

    .line 36
    iput v0, p0, Ll/fsf0;->f:F

    .line 37
    .line 38
    return-void
.end method
