.class public Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$c;
.super Landroid/view/ScaleGestureDetector$SimpleOnScaleGestureListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$c;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/ScaleGestureDetector$SimpleOnScaleGestureListener;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;Ll/vvb;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$c;-><init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)V

    return-void
.end method


# virtual methods
.method public final a(F)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$c;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->g(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)Ll/wvb;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/wvb;->j()F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    cmpl-float v0, p1, v0

    .line 12
    .line 13
    if-ltz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$c;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->g(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)Ll/wvb;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/wvb;->j()F

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$c;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 26
    .line 27
    invoke-static {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->g(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)Ll/wvb;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ll/wvb;->i()F

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    add-float/2addr v0, p0

    .line 36
    cmpg-float p0, p1, v0

    .line 37
    .line 38
    if-gtz p0, :cond_0

    .line 39
    .line 40
    const/4 p0, 0x1

    .line 41
    return p0

    .line 42
    :cond_0
    const/4 p0, 0x0

    .line 43
    return p0
.end method

.method public onScale(Landroid/view/ScaleGestureDetector;)Z
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getScaleFactor()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$c;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 6
    .line 7
    invoke-static {v1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->j(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$c;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-static {v2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->k(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)Ll/phx;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$c;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 20
    .line 21
    invoke-static {v2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->i(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)Landroid/graphics/Matrix;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v1, v2}, Ll/phx;->c(Landroid/graphics/Matrix;)F

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$c;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 34
    .line 35
    invoke-static {v2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->k(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)Ll/phx;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    iget-object v3, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$c;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 40
    .line 41
    invoke-static {v3}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->i(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)Landroid/graphics/Matrix;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-virtual {v2, v3}, Ll/phx;->b(Landroid/graphics/Matrix;)F

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    :goto_0
    mul-float/2addr v1, v0

    .line 58
    goto :goto_1

    .line 59
    :cond_0
    invoke-static {v2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->k(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)Ll/phx;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$c;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 64
    .line 65
    invoke-static {v2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->i(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)Landroid/graphics/Matrix;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {v1, v2}, Ll/phx;->c(Landroid/graphics/Matrix;)F

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    goto :goto_0

    .line 74
    :goto_1
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$c;->a(F)Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-eqz v1, :cond_1

    .line 79
    .line 80
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$c;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 81
    .line 82
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusX()F

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusY()F

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    invoke-static {v1, v0, v2, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->n(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;FFF)V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$c;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 94
    .line 95
    invoke-static {p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->g(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)Ll/wvb;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$c;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 100
    .line 101
    invoke-static {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->m(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)F

    .line 102
    .line 103
    .line 104
    move-result p0

    .line 105
    invoke-virtual {p1, p0}, Ll/wvb;->v(F)Ll/wvb;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {p0}, Ll/wvb;->b()V

    .line 110
    .line 111
    .line 112
    :cond_1
    const/4 p0, 0x1

    .line 113
    return p0
.end method
