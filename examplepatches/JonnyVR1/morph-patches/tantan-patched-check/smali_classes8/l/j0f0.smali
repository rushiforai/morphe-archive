.class public Ll/j0f0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:F

.field public b:F

.field public c:Landroid/graphics/drawable/ShapeDrawable;

.field public d:Landroid/graphics/Paint;

.field public e:F


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/ShapeDrawable;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/j0f0;->a:F

    .line 6
    .line 7
    iput v0, p0, Ll/j0f0;->b:F

    .line 8
    .line 9
    const/high16 v0, 0x3f800000    # 1.0f

    .line 10
    .line 11
    iput v0, p0, Ll/j0f0;->e:F

    .line 12
    .line 13
    iput-object p1, p0, Ll/j0f0;->c:Landroid/graphics/drawable/ShapeDrawable;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a()Landroid/graphics/drawable/ShapeDrawable;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j0f0;->c:Landroid/graphics/drawable/ShapeDrawable;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()F
    .locals 0

    .line 1
    iget p0, p0, Ll/j0f0;->a:F

    .line 2
    .line 3
    return p0
.end method

.method public c()F
    .locals 0

    .line 1
    iget p0, p0, Ll/j0f0;->b:F

    .line 2
    .line 3
    return p0
.end method

.method public d(FF)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j0f0;->c:Landroid/graphics/drawable/ShapeDrawable;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/ShapeDrawable;->getShape()Landroid/graphics/drawable/shapes/Shape;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1, p2}, Landroid/graphics/drawable/shapes/Shape;->resize(FF)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public e(Landroid/graphics/Paint;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/j0f0;->d:Landroid/graphics/Paint;

    .line 2
    .line 3
    return-void
.end method

.method public f(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/j0f0;->a:F

    .line 2
    .line 3
    return-void
.end method

.method public g(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/j0f0;->b:F

    .line 2
    .line 3
    return-void
.end method
