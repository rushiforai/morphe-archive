.class public Lv/VFrame_FlipContainer$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lv/VFrame_FlipContainer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public final a:Landroid/graphics/RectF;

.field public final b:Landroid/graphics/RectF;

.field public final c:Landroid/graphics/RectF;

.field public final d:Landroid/graphics/Matrix;

.field public final e:Landroid/graphics/Camera;

.field public final f:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/RectF;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lv/VFrame_FlipContainer$a;->a:Landroid/graphics/RectF;

    .line 10
    .line 11
    new-instance v0, Landroid/graphics/RectF;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lv/VFrame_FlipContainer$a;->b:Landroid/graphics/RectF;

    .line 17
    .line 18
    new-instance v0, Landroid/graphics/RectF;

    .line 19
    .line 20
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lv/VFrame_FlipContainer$a;->c:Landroid/graphics/RectF;

    .line 24
    .line 25
    new-instance v0, Landroid/graphics/Matrix;

    .line 26
    .line 27
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lv/VFrame_FlipContainer$a;->d:Landroid/graphics/Matrix;

    .line 31
    .line 32
    new-instance v0, Landroid/graphics/Camera;

    .line 33
    .line 34
    invoke-direct {v0}, Landroid/graphics/Camera;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lv/VFrame_FlipContainer$a;->e:Landroid/graphics/Camera;

    .line 38
    .line 39
    new-instance v0, Landroid/graphics/Paint;

    .line 40
    .line 41
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lv/VFrame_FlipContainer$a;->f:Landroid/graphics/Paint;

    .line 45
    .line 46
    return-void
.end method

.method public synthetic constructor <init>(Ll/xxk0;)V
    .locals 0

    .line 47
    invoke-direct {p0}, Lv/VFrame_FlipContainer$a;-><init>()V

    return-void
.end method

.method public static bridge synthetic a(Lv/VFrame_FlipContainer$a;)Landroid/graphics/Paint;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VFrame_FlipContainer$a;->f:Landroid/graphics/Paint;

    return-object p0
.end method

.method public static bridge synthetic b(Lv/VFrame_FlipContainer$a;)Landroid/graphics/RectF;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VFrame_FlipContainer$a;->a:Landroid/graphics/RectF;

    return-object p0
.end method

.method public static bridge synthetic c(Lv/VFrame_FlipContainer$a;)Landroid/graphics/RectF;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VFrame_FlipContainer$a;->c:Landroid/graphics/RectF;

    return-object p0
.end method

.method public static bridge synthetic d(Lv/VFrame_FlipContainer$a;)Landroid/graphics/RectF;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VFrame_FlipContainer$a;->b:Landroid/graphics/RectF;

    return-object p0
.end method

.method public static bridge synthetic e(Lv/VFrame_FlipContainer$a;)Lv/VFrame_FlipContainer$a;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lv/VFrame_FlipContainer$a;->g()Lv/VFrame_FlipContainer$a;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic f(Lv/VFrame_FlipContainer$a;Landroid/graphics/Canvas;FFF)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lv/VFrame_FlipContainer$a;->h(Landroid/graphics/Canvas;FFF)V

    return-void
.end method


# virtual methods
.method public final g()Lv/VFrame_FlipContainer$a;
    .locals 2

    .line 1
    iget-object v0, p0, Lv/VFrame_FlipContainer$a;->f:Landroid/graphics/Paint;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lv/VFrame_FlipContainer$a;->f:Landroid/graphics/Paint;

    .line 8
    .line 9
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 12
    .line 13
    .line 14
    return-object p0
.end method

.method public final h(Landroid/graphics/Canvas;FFF)V
    .locals 3

    .line 1
    iget-object v0, p0, Lv/VFrame_FlipContainer$a;->d:Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lv/VFrame_FlipContainer$a;->e:Landroid/graphics/Camera;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/graphics/Camera;->save()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lv/VFrame_FlipContainer$a;->e:Landroid/graphics/Camera;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, p3, v1, v1}, Landroid/graphics/Camera;->translate(FFF)V

    .line 15
    .line 16
    .line 17
    iget-object p3, p0, Lv/VFrame_FlipContainer$a;->e:Landroid/graphics/Camera;

    .line 18
    .line 19
    invoke-virtual {p3, p2}, Landroid/graphics/Camera;->rotateY(F)V

    .line 20
    .line 21
    .line 22
    iget-object p2, p0, Lv/VFrame_FlipContainer$a;->e:Landroid/graphics/Camera;

    .line 23
    .line 24
    iget-object p3, p0, Lv/VFrame_FlipContainer$a;->d:Landroid/graphics/Matrix;

    .line 25
    .line 26
    invoke-virtual {p2, p3}, Landroid/graphics/Camera;->getMatrix(Landroid/graphics/Matrix;)V

    .line 27
    .line 28
    .line 29
    iget-object p2, p0, Lv/VFrame_FlipContainer$a;->e:Landroid/graphics/Camera;

    .line 30
    .line 31
    invoke-virtual {p2}, Landroid/graphics/Camera;->restore()V

    .line 32
    .line 33
    .line 34
    iget-object p2, p0, Lv/VFrame_FlipContainer$a;->a:Landroid/graphics/RectF;

    .line 35
    .line 36
    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    const/high16 p3, 0x40000000    # 2.0f

    .line 41
    .line 42
    div-float/2addr p2, p3

    .line 43
    iget-object v0, p0, Lv/VFrame_FlipContainer$a;->a:Landroid/graphics/RectF;

    .line 44
    .line 45
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    div-float/2addr v0, p3

    .line 50
    iget-object p3, p0, Lv/VFrame_FlipContainer$a;->d:Landroid/graphics/Matrix;

    .line 51
    .line 52
    neg-float v1, p2

    .line 53
    neg-float v2, v0

    .line 54
    invoke-virtual {p3, v1, v2}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 55
    .line 56
    .line 57
    iget-object p3, p0, Lv/VFrame_FlipContainer$a;->d:Landroid/graphics/Matrix;

    .line 58
    .line 59
    invoke-virtual {p3, p4, p4}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 60
    .line 61
    .line 62
    iget-object p3, p0, Lv/VFrame_FlipContainer$a;->d:Landroid/graphics/Matrix;

    .line 63
    .line 64
    invoke-virtual {p3, p2, v0}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 65
    .line 66
    .line 67
    iget-object p0, p0, Lv/VFrame_FlipContainer$a;->d:Landroid/graphics/Matrix;

    .line 68
    .line 69
    invoke-virtual {p1, p0}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method
