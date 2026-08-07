.class public Ll/mhx$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/TypeEvaluator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/mhx;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/animation/TypeEvaluator<",
        "Landroid/graphics/Matrix;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/graphics/Matrix;

.field public b:Landroid/graphics/Matrix;

.field public c:Landroid/graphics/Matrix;

.field public d:Landroid/animation/FloatEvaluator;

.field public e:F

.field public f:F

.field public g:F

.field public h:F

.field public i:F

.field public j:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Matrix;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/mhx$a;->a:Landroid/graphics/Matrix;

    .line 10
    .line 11
    new-instance v0, Landroid/animation/FloatEvaluator;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/animation/FloatEvaluator;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/mhx$a;->d:Landroid/animation/FloatEvaluator;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/Matrix;Landroid/graphics/Matrix;)V
    .locals 2

    .line 1
    new-instance v0, Ll/phx;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/phx;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ll/phx;->d(Landroid/graphics/Matrix;)F

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    iput v1, p0, Ll/mhx$a;->e:F

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ll/phx;->e(Landroid/graphics/Matrix;)F

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iput v1, p0, Ll/mhx$a;->f:F

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ll/phx;->c(Landroid/graphics/Matrix;)F

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    iput v1, p0, Ll/mhx$a;->g:F

    .line 23
    .line 24
    invoke-virtual {v0, p2}, Ll/phx;->d(Landroid/graphics/Matrix;)F

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    iput v1, p0, Ll/mhx$a;->h:F

    .line 29
    .line 30
    invoke-virtual {v0, p2}, Ll/phx;->e(Landroid/graphics/Matrix;)F

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    iput v1, p0, Ll/mhx$a;->i:F

    .line 35
    .line 36
    invoke-virtual {v0, p2}, Ll/phx;->c(Landroid/graphics/Matrix;)F

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iput v0, p0, Ll/mhx$a;->j:F

    .line 41
    .line 42
    iput-object p1, p0, Ll/mhx$a;->b:Landroid/graphics/Matrix;

    .line 43
    .line 44
    iput-object p2, p0, Ll/mhx$a;->c:Landroid/graphics/Matrix;

    .line 45
    .line 46
    return-void
.end method

.method public b(FLandroid/graphics/Matrix;Landroid/graphics/Matrix;)Landroid/graphics/Matrix;
    .locals 3

    .line 1
    invoke-virtual {p0, p2, p3}, Ll/mhx$a;->c(Landroid/graphics/Matrix;Landroid/graphics/Matrix;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p2, p3}, Ll/mhx$a;->a(Landroid/graphics/Matrix;Landroid/graphics/Matrix;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p2, p0, Ll/mhx$a;->d:Landroid/animation/FloatEvaluator;

    .line 11
    .line 12
    iget p3, p0, Ll/mhx$a;->e:F

    .line 13
    .line 14
    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    iget v0, p0, Ll/mhx$a;->h:F

    .line 19
    .line 20
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p2, p1, p3, v0}, Landroid/animation/FloatEvaluator;->evaluate(FLjava/lang/Number;Ljava/lang/Number;)Ljava/lang/Float;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    iget-object p3, p0, Ll/mhx$a;->d:Landroid/animation/FloatEvaluator;

    .line 33
    .line 34
    iget v0, p0, Ll/mhx$a;->f:F

    .line 35
    .line 36
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget v1, p0, Ll/mhx$a;->i:F

    .line 41
    .line 42
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {p3, p1, v0, v1}, Landroid/animation/FloatEvaluator;->evaluate(FLjava/lang/Number;Ljava/lang/Number;)Ljava/lang/Float;

    .line 47
    .line 48
    .line 49
    move-result-object p3

    .line 50
    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    .line 51
    .line 52
    .line 53
    move-result p3

    .line 54
    iget-object v0, p0, Ll/mhx$a;->d:Landroid/animation/FloatEvaluator;

    .line 55
    .line 56
    iget v1, p0, Ll/mhx$a;->g:F

    .line 57
    .line 58
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    iget v2, p0, Ll/mhx$a;->j:F

    .line 63
    .line 64
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-virtual {v0, p1, v1, v2}, Landroid/animation/FloatEvaluator;->evaluate(FLjava/lang/Number;Ljava/lang/Number;)Ljava/lang/Float;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    iget-object v0, p0, Ll/mhx$a;->a:Landroid/graphics/Matrix;

    .line 77
    .line 78
    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/mhx$a;->a:Landroid/graphics/Matrix;

    .line 82
    .line 83
    invoke-virtual {v0, p1, p1}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Ll/mhx$a;->a:Landroid/graphics/Matrix;

    .line 87
    .line 88
    invoke-virtual {p1, p2, p3}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 89
    .line 90
    .line 91
    iget-object p0, p0, Ll/mhx$a;->a:Landroid/graphics/Matrix;

    .line 92
    .line 93
    return-object p0
.end method

.method public final c(Landroid/graphics/Matrix;Landroid/graphics/Matrix;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mhx$a;->b:Landroid/graphics/Matrix;

    .line 2
    .line 3
    if-ne v0, p1, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Ll/mhx$a;->c:Landroid/graphics/Matrix;

    .line 6
    .line 7
    if-eq p0, p2, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method public bridge synthetic evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p2, Landroid/graphics/Matrix;

    .line 2
    .line 3
    check-cast p3, Landroid/graphics/Matrix;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ll/mhx$a;->b(FLandroid/graphics/Matrix;Landroid/graphics/Matrix;)Landroid/graphics/Matrix;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
