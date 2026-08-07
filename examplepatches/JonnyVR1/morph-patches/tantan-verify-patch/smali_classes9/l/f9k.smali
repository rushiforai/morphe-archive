.class public Ll/f9k;
.super Landroid/text/style/CharacterStyle;
.source "SourceFile"

# interfaces
.implements Landroid/text/style/UpdateAppearance;


# instance fields
.field public a:Landroid/graphics/LinearGradient;

.field public final b:Landroid/graphics/Matrix;

.field public c:I

.field public d:I

.field public e:I

.field public f:I
    .annotation build Landroidx/annotation/ColorRes;
    .end annotation
.end field

.field public g:I

.field public h:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroid/text/style/CharacterStyle;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x5dc

    .line 5
    .line 6
    iput v0, p0, Ll/f9k;->c:I

    .line 7
    .line 8
    const/16 v0, 0x14

    .line 9
    .line 10
    iput v0, p0, Ll/f9k;->d:I

    .line 11
    .line 12
    const/16 v0, -0x3e8

    .line 13
    .line 14
    iput v0, p0, Ll/f9k;->e:I

    .line 15
    .line 16
    sget v1, Ll/n9c0;->w1:I

    .line 17
    .line 18
    iput v1, p0, Ll/f9k;->f:I

    .line 19
    .line 20
    iput v0, p0, Ll/f9k;->g:I

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-boolean v0, p0, Ll/f9k;->h:Z

    .line 24
    .line 25
    new-instance v0, Landroid/graphics/Matrix;

    .line 26
    .line 27
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ll/f9k;->b:Landroid/graphics/Matrix;

    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public a(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/f9k;->h:Z

    .line 2
    .line 3
    return-void
.end method

.method public b(Ljava/util/List;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v1, Landroid/graphics/LinearGradient;

    .line 8
    .line 9
    iget p1, p0, Ll/f9k;->f:I

    .line 10
    .line 11
    invoke-static {p1}, Ll/n3d0;->a(I)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    sget v0, Ll/n9c0;->x:I

    .line 16
    .line 17
    invoke-static {v0}, Ll/n3d0;->a(I)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    sget v2, Ll/n9c0;->C0:I

    .line 22
    .line 23
    invoke-static {v2}, Ll/n3d0;->a(I)I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    sget v3, Ll/n9c0;->R0:I

    .line 28
    .line 29
    invoke-static {v3}, Ll/n3d0;->a(I)I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    iget v4, p0, Ll/f9k;->f:I

    .line 34
    .line 35
    invoke-static {v4}, Ll/n3d0;->a(I)I

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    filled-new-array {p1, v0, v2, v3, v4}, [I

    .line 40
    .line 41
    .line 42
    move-result-object v6

    .line 43
    const/4 v7, 0x0

    .line 44
    sget-object v8, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 45
    .line 46
    const/4 v2, 0x0

    .line 47
    const/4 v3, 0x0

    .line 48
    const/high16 v4, 0x43fa0000    # 500.0f

    .line 49
    .line 50
    const/4 v5, 0x0

    .line 51
    invoke-direct/range {v1 .. v8}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 52
    .line 53
    .line 54
    iput-object v1, p0, Ll/f9k;->a:Landroid/graphics/LinearGradient;

    .line 55
    .line 56
    return-void

    .line 57
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/lit8 v1, v0, 0x2

    .line 62
    .line 63
    new-array v7, v1, [I

    .line 64
    .line 65
    const/4 v2, 0x0

    .line 66
    :goto_0
    if-ge v2, v1, :cond_3

    .line 67
    .line 68
    if-eqz v2, :cond_2

    .line 69
    .line 70
    add-int/lit8 v3, v0, 0x1

    .line 71
    .line 72
    if-ne v2, v3, :cond_1

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_1
    add-int/lit8 v3, v2, -0x1

    .line 76
    .line 77
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    check-cast v3, Ljava/lang/String;

    .line 82
    .line 83
    invoke-static {v3}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    aput v3, v7, v2

    .line 88
    .line 89
    goto :goto_2

    .line 90
    :cond_2
    :goto_1
    iget v3, p0, Ll/f9k;->f:I

    .line 91
    .line 92
    invoke-static {v3}, Ll/n3d0;->a(I)I

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    aput v3, v7, v2

    .line 97
    .line 98
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_3
    new-instance v2, Landroid/graphics/LinearGradient;

    .line 102
    .line 103
    const/4 v8, 0x0

    .line 104
    sget-object v9, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 105
    .line 106
    const/4 v3, 0x0

    .line 107
    const/4 v4, 0x0

    .line 108
    const/high16 v5, 0x43fa0000    # 500.0f

    .line 109
    .line 110
    const/4 v6, 0x0

    .line 111
    invoke-direct/range {v2 .. v9}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 112
    .line 113
    .line 114
    iput-object v2, p0, Ll/f9k;->a:Landroid/graphics/LinearGradient;

    .line 115
    .line 116
    return-void
.end method

.method public c(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/f9k;->e:I

    .line 2
    .line 3
    return-void
.end method

.method public d(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/f9k;->f:I

    .line 2
    .line 3
    return-void
.end method

.method public e(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/f9k;->c:I

    .line 2
    .line 3
    return-void
.end method

.method public f(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/f9k;->d:I

    .line 2
    .line 3
    return-void
.end method

.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 3

    .line 1
    iget v0, p0, Ll/f9k;->g:I

    .line 2
    .line 3
    iget v1, p0, Ll/f9k;->d:I

    .line 4
    .line 5
    add-int/2addr v0, v1

    .line 6
    iput v0, p0, Ll/f9k;->g:I

    .line 7
    .line 8
    iget v1, p0, Ll/f9k;->c:I

    .line 9
    .line 10
    if-ge v0, v1, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Ll/f9k;->b:Landroid/graphics/Matrix;

    .line 13
    .line 14
    int-to-float v0, v0

    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-virtual {v1, v0, v2}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/f9k;->a:Landroid/graphics/LinearGradient;

    .line 20
    .line 21
    iget-object v1, p0, Ll/f9k;->b:Landroid/graphics/Matrix;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-boolean v0, p0, Ll/f9k;->h:Z

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget v0, p0, Ll/f9k;->e:I

    .line 32
    .line 33
    iput v0, p0, Ll/f9k;->g:I

    .line 34
    .line 35
    :cond_1
    :goto_0
    iget v0, p0, Ll/f9k;->f:I

    .line 36
    .line 37
    invoke-static {v0}, Ll/n3d0;->a(I)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Ll/f9k;->a:Landroid/graphics/LinearGradient;

    .line 45
    .line 46
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 47
    .line 48
    .line 49
    return-void
.end method
