.class public Lv/progressbar/ProgressDrawable$i;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lv/progressbar/ProgressDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "i"
.end annotation


# instance fields
.field public a:[I

.field public b:F

.field public c:F

.field public d:F

.field public e:I

.field public f:I

.field public g:Lv/progressbar/ProgressDrawable$Style;

.field public h:Landroid/view/animation/Interpolator;

.field public i:Landroid/view/animation/Interpolator;

.field public j:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lv/progressbar/ProgressDrawable;->u()Landroid/view/animation/Interpolator;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lv/progressbar/ProgressDrawable$i;->h:Landroid/view/animation/Interpolator;

    .line 9
    .line 10
    invoke-static {}, Lv/progressbar/ProgressDrawable;->t()Landroid/view/animation/Interpolator;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lv/progressbar/ProgressDrawable$i;->i:Landroid/view/animation/Interpolator;

    .line 15
    .line 16
    const/high16 v0, -0x40800000    # -1.0f

    .line 17
    .line 18
    iput v0, p0, Lv/progressbar/ProgressDrawable$i;->j:F

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lv/progressbar/ProgressDrawable$i;->d(Landroid/content/Context;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public a()Lv/progressbar/ProgressDrawable;
    .locals 12

    .line 1
    new-instance v0, Lv/progressbar/ProgressDrawable;

    .line 2
    .line 3
    iget-object v1, p0, Lv/progressbar/ProgressDrawable$i;->a:[I

    .line 4
    .line 5
    iget v2, p0, Lv/progressbar/ProgressDrawable$i;->d:F

    .line 6
    .line 7
    iget v3, p0, Lv/progressbar/ProgressDrawable$i;->j:F

    .line 8
    .line 9
    iget v4, p0, Lv/progressbar/ProgressDrawable$i;->b:F

    .line 10
    .line 11
    iget v5, p0, Lv/progressbar/ProgressDrawable$i;->c:F

    .line 12
    .line 13
    iget v6, p0, Lv/progressbar/ProgressDrawable$i;->e:I

    .line 14
    .line 15
    iget v7, p0, Lv/progressbar/ProgressDrawable$i;->f:I

    .line 16
    .line 17
    iget-object v8, p0, Lv/progressbar/ProgressDrawable$i;->g:Lv/progressbar/ProgressDrawable$Style;

    .line 18
    .line 19
    iget-object v9, p0, Lv/progressbar/ProgressDrawable$i;->i:Landroid/view/animation/Interpolator;

    .line 20
    .line 21
    iget-object v10, p0, Lv/progressbar/ProgressDrawable$i;->h:Landroid/view/animation/Interpolator;

    .line 22
    .line 23
    const/4 v11, 0x0

    .line 24
    invoke-direct/range {v0 .. v11}, Lv/progressbar/ProgressDrawable;-><init>([IFFFFIILv/progressbar/ProgressDrawable$Style;Landroid/view/animation/Interpolator;Landroid/view/animation/Interpolator;Ll/p4b0;)V

    .line 25
    .line 26
    .line 27
    return-object v0
.end method

.method public b(I)Lv/progressbar/ProgressDrawable$i;
    .locals 0

    .line 1
    filled-new-array {p1}, [I

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lv/progressbar/ProgressDrawable$i;->a:[I

    .line 6
    .line 7
    return-object p0
.end method

.method public c([I)Lv/progressbar/ProgressDrawable$i;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/o4b0;->b([I)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lv/progressbar/ProgressDrawable$i;->a:[I

    .line 5
    .line 6
    return-object p0
.end method

.method public final d(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/bac0;->f:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Lv/progressbar/ProgressDrawable$i;->d:F

    .line 12
    .line 13
    const/high16 v0, 0x3f800000    # 1.0f

    .line 14
    .line 15
    iput v0, p0, Lv/progressbar/ProgressDrawable$i;->b:F

    .line 16
    .line 17
    iput v0, p0, Lv/progressbar/ProgressDrawable$i;->c:F

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget v1, Ll/z8c0;->x:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    filled-new-array {v0}, [I

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, Lv/progressbar/ProgressDrawable$i;->a:[I

    .line 34
    .line 35
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    sget v1, Ll/zdc0;->b:I

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    iput v0, p0, Lv/progressbar/ProgressDrawable$i;->e:I

    .line 46
    .line 47
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    sget v0, Ll/zdc0;->a:I

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getInteger(I)I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    iput p1, p0, Lv/progressbar/ProgressDrawable$i;->f:I

    .line 58
    .line 59
    sget-object p1, Lv/progressbar/ProgressDrawable$Style;->ROUNDED:Lv/progressbar/ProgressDrawable$Style;

    .line 60
    .line 61
    iput-object p1, p0, Lv/progressbar/ProgressDrawable$i;->g:Lv/progressbar/ProgressDrawable$Style;

    .line 62
    .line 63
    return-void
.end method

.method public e(I)Lv/progressbar/ProgressDrawable$i;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/o4b0;->a(I)V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lv/progressbar/ProgressDrawable$i;->f:I

    .line 5
    .line 6
    return-object p0
.end method

.method public f(I)Lv/progressbar/ProgressDrawable$i;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/o4b0;->a(I)V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lv/progressbar/ProgressDrawable$i;->e:I

    .line 5
    .line 6
    return-object p0
.end method

.method public g(F)Lv/progressbar/ProgressDrawable$i;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/o4b0;->d(F)V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lv/progressbar/ProgressDrawable$i;->c:F

    .line 5
    .line 6
    return-object p0
.end method

.method public h(F)Lv/progressbar/ProgressDrawable$i;
    .locals 0

    .line 1
    iput p1, p0, Lv/progressbar/ProgressDrawable$i;->j:F

    .line 2
    .line 3
    return-object p0
.end method

.method public i(F)Lv/progressbar/ProgressDrawable$i;
    .locals 1

    .line 1
    const-string v0, "StrokeWidth"

    .line 2
    .line 3
    invoke-static {p1, v0}, Ll/o4b0;->c(FLjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput p1, p0, Lv/progressbar/ProgressDrawable$i;->d:F

    .line 7
    .line 8
    return-object p0
.end method

.method public j(F)Lv/progressbar/ProgressDrawable$i;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/o4b0;->d(F)V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lv/progressbar/ProgressDrawable$i;->b:F

    .line 5
    .line 6
    return-object p0
.end method
