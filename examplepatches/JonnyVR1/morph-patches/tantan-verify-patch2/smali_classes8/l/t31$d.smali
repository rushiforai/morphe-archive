.class public Ll/t31$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/t31;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "d"
.end annotation


# instance fields
.field public final a:Ll/zde0;

.field public b:I

.field public c:I

.field public final synthetic d:Ll/t31;


# direct methods
.method public constructor <init>(Ll/t31;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/t31$d;->d:Ll/t31;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p2}, Ll/zde0;->c(Landroid/content/Context;)Ll/zde0;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Ll/t31$d;->a:Ll/zde0;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t31$d;->a:Ll/zde0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/zde0;->a()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(IIII)V
    .locals 13

    .line 1
    iget-object v0, p0, Ll/t31$d;->d:Ll/t31;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/t31;->t()Landroid/graphics/RectF;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_2

    .line 10
    :cond_0
    iget v1, v0, Landroid/graphics/RectF;->left:F

    .line 11
    .line 12
    neg-float v1, v1

    .line 13
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    int-to-float p1, p1

    .line 18
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    cmpg-float v1, p1, v1

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    if-gez v1, :cond_1

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    sub-float/2addr v1, p1

    .line 32
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    move v8, p1

    .line 37
    move v7, v2

    .line 38
    goto :goto_0

    .line 39
    :cond_1
    move v7, v3

    .line 40
    move v8, v7

    .line 41
    :goto_0
    iget p1, v0, Landroid/graphics/RectF;->top:F

    .line 42
    .line 43
    neg-float p1, p1

    .line 44
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    int-to-float p1, p2

    .line 49
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    cmpg-float p2, p1, p2

    .line 54
    .line 55
    if-gez p2, :cond_2

    .line 56
    .line 57
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    sub-float/2addr p2, p1

    .line 62
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    move v10, p1

    .line 67
    move v9, v2

    .line 68
    goto :goto_1

    .line 69
    :cond_2
    move v9, v4

    .line 70
    move v10, v9

    .line 71
    :goto_1
    iput v3, p0, Ll/t31$d;->b:I

    .line 72
    .line 73
    iput v4, p0, Ll/t31$d;->c:I

    .line 74
    .line 75
    if-ne v3, v8, :cond_4

    .line 76
    .line 77
    if-eq v4, v10, :cond_3

    .line 78
    .line 79
    goto :goto_3

    .line 80
    :cond_3
    :goto_2
    return-void

    .line 81
    :cond_4
    :goto_3
    iget-object v2, p0, Ll/t31$d;->a:Ll/zde0;

    .line 82
    .line 83
    const/4 v11, 0x0

    .line 84
    const/4 v12, 0x0

    .line 85
    move/from16 v5, p3

    .line 86
    .line 87
    move/from16 v6, p4

    .line 88
    .line 89
    invoke-virtual/range {v2 .. v12}, Ll/zde0;->e(IIIIIIIIII)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public run()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/t31$d;->a:Ll/zde0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/zde0;->h()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/t31$d;->d:Ll/t31;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/t31;->x()Lcom/facebook/drawee/view/DraweeView;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v1, p0, Ll/t31$d;->a:Ll/zde0;

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/zde0;->b()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    iget-object v1, p0, Ll/t31$d;->a:Ll/zde0;

    .line 27
    .line 28
    invoke-virtual {v1}, Ll/zde0;->f()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    iget-object v2, p0, Ll/t31$d;->a:Ll/zde0;

    .line 33
    .line 34
    invoke-virtual {v2}, Ll/zde0;->g()I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    iget-object v3, p0, Ll/t31$d;->d:Ll/t31;

    .line 39
    .line 40
    invoke-static {v3}, Ll/t31;->j(Ll/t31;)Landroid/graphics/Matrix;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    iget v4, p0, Ll/t31$d;->b:I

    .line 45
    .line 46
    sub-int/2addr v4, v1

    .line 47
    int-to-float v4, v4

    .line 48
    iget v5, p0, Ll/t31$d;->c:I

    .line 49
    .line 50
    sub-int/2addr v5, v2

    .line 51
    int-to-float v5, v5

    .line 52
    invoke-virtual {v3, v4, v5}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    .line 56
    .line 57
    .line 58
    iput v1, p0, Ll/t31$d;->b:I

    .line 59
    .line 60
    iput v2, p0, Ll/t31$d;->c:I

    .line 61
    .line 62
    iget-object v1, p0, Ll/t31$d;->d:Ll/t31;

    .line 63
    .line 64
    invoke-static {v1, v0, p0}, Ll/t31;->n(Ll/t31;Landroid/view/View;Ljava/lang/Runnable;)V

    .line 65
    .line 66
    .line 67
    :cond_1
    :goto_0
    return-void
.end method
