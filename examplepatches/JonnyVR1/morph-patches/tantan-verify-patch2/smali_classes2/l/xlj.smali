.class public Ll/xlj;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final t:Ll/h1e0;

.field public static final u:Ll/h1e0;


# instance fields
.field public a:Landroid/content/res/Resources;

.field public b:I

.field public c:F

.field public d:Landroid/graphics/drawable/Drawable;

.field public e:Ll/h1e0;

.field public f:Landroid/graphics/drawable/Drawable;

.field public g:Ll/h1e0;

.field public h:Landroid/graphics/drawable/Drawable;

.field public i:Ll/h1e0;

.field public j:Landroid/graphics/drawable/Drawable;

.field public k:Ll/h1e0;

.field public l:Ll/h1e0;

.field public m:Landroid/graphics/Matrix;

.field public n:Landroid/graphics/PointF;

.field public o:Landroid/graphics/ColorFilter;

.field public p:Landroid/graphics/drawable/Drawable;

.field public q:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation
.end field

.field public r:Landroid/graphics/drawable/Drawable;

.field public s:Lcom/facebook/drawee/generic/RoundingParams;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Ll/h1e0;->h:Ll/h1e0;

    .line 2
    .line 3
    sput-object v0, Ll/xlj;->t:Ll/h1e0;

    .line 4
    .line 5
    sget-object v0, Ll/h1e0;->i:Ll/h1e0;

    .line 6
    .line 7
    sput-object v0, Ll/xlj;->u:Ll/h1e0;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/res/Resources;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/xlj;->a:Landroid/content/res/Resources;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xlj;->t()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static u(Landroid/content/res/Resources;)Ll/xlj;
    .locals 1

    .line 1
    new-instance v0, Ll/xlj;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/xlj;-><init>(Landroid/content/res/Resources;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public A(Landroid/graphics/drawable/Drawable;)Ll/xlj;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xlj;->h:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method public B(Ll/h1e0;)Ll/xlj;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xlj;->i:Ll/h1e0;

    .line 2
    .line 3
    return-object p0
.end method

.method public C(Landroid/graphics/drawable/Drawable;)Ll/xlj;
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Ll/xlj;->q:Ljava/util/List;

    .line 5
    .line 6
    return-object p0

    .line 7
    :cond_0
    filled-new-array {p1}, [Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Ll/xlj;->q:Ljava/util/List;

    .line 16
    .line 17
    return-object p0
.end method

.method public D(Landroid/graphics/drawable/Drawable;)Ll/xlj;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xlj;->d:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method public E(Ll/h1e0;)Ll/xlj;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xlj;->e:Ll/h1e0;

    .line 2
    .line 3
    return-object p0
.end method

.method public F(Landroid/graphics/drawable/Drawable;)Ll/xlj;
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Ll/xlj;->r:Landroid/graphics/drawable/Drawable;

    .line 5
    .line 6
    return-object p0

    .line 7
    :cond_0
    new-instance v0, Landroid/graphics/drawable/StateListDrawable;

    .line 8
    .line 9
    invoke-direct {v0}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 10
    .line 11
    .line 12
    const v1, 0x10100a7

    .line 13
    .line 14
    .line 15
    filled-new-array {v1}, [I

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1, p1}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ll/xlj;->r:Landroid/graphics/drawable/Drawable;

    .line 23
    .line 24
    return-object p0
.end method

.method public G(Landroid/graphics/drawable/Drawable;)Ll/xlj;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xlj;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method public H(Ll/h1e0;)Ll/xlj;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xlj;->k:Ll/h1e0;

    .line 2
    .line 3
    return-object p0
.end method

.method public I(Landroid/graphics/drawable/Drawable;)Ll/xlj;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xlj;->f:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method public J(Ll/h1e0;)Ll/xlj;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xlj;->g:Ll/h1e0;

    .line 2
    .line 3
    return-object p0
.end method

.method public K(Lcom/facebook/drawee/generic/RoundingParams;)Ll/xlj;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xlj;->s:Lcom/facebook/drawee/generic/RoundingParams;

    .line 2
    .line 3
    return-object p0
.end method

.method public final L()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/xlj;->q:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Landroid/graphics/drawable/Drawable;

    .line 20
    .line 21
    invoke-static {v0}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method public a()Ll/wlj;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xlj;->L()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/wlj;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/wlj;-><init>(Ll/xlj;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public b()Landroid/graphics/ColorFilter;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xlj;->o:Landroid/graphics/ColorFilter;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Landroid/graphics/PointF;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xlj;->n:Landroid/graphics/PointF;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ll/h1e0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xlj;->l:Ll/h1e0;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xlj;->p:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()F
    .locals 0

    .line 1
    iget p0, p0, Ll/xlj;->c:F

    .line 2
    .line 3
    return p0
.end method

.method public g()I
    .locals 0

    .line 1
    iget p0, p0, Ll/xlj;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public h()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xlj;->h:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()Ll/h1e0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xlj;->i:Ll/h1e0;

    .line 2
    .line 3
    return-object p0
.end method

.method public j()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/xlj;->q:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public k()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xlj;->d:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method public l()Ll/h1e0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xlj;->e:Ll/h1e0;

    .line 2
    .line 3
    return-object p0
.end method

.method public m()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xlj;->r:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method public n()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xlj;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method public o()Ll/h1e0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xlj;->k:Ll/h1e0;

    .line 2
    .line 3
    return-object p0
.end method

.method public p()Landroid/content/res/Resources;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xlj;->a:Landroid/content/res/Resources;

    .line 2
    .line 3
    return-object p0
.end method

.method public q()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xlj;->f:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method public r()Ll/h1e0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xlj;->g:Ll/h1e0;

    .line 2
    .line 3
    return-object p0
.end method

.method public s()Lcom/facebook/drawee/generic/RoundingParams;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xlj;->s:Lcom/facebook/drawee/generic/RoundingParams;

    .line 2
    .line 3
    return-object p0
.end method

.method public final t()V
    .locals 2

    .line 1
    const/16 v0, 0x12c

    .line 2
    .line 3
    iput v0, p0, Ll/xlj;->b:I

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput v0, p0, Ll/xlj;->c:F

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/xlj;->d:Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    sget-object v1, Ll/xlj;->t:Ll/h1e0;

    .line 12
    .line 13
    iput-object v1, p0, Ll/xlj;->e:Ll/h1e0;

    .line 14
    .line 15
    iput-object v0, p0, Ll/xlj;->f:Landroid/graphics/drawable/Drawable;

    .line 16
    .line 17
    iput-object v1, p0, Ll/xlj;->g:Ll/h1e0;

    .line 18
    .line 19
    iput-object v0, p0, Ll/xlj;->h:Landroid/graphics/drawable/Drawable;

    .line 20
    .line 21
    iput-object v1, p0, Ll/xlj;->i:Ll/h1e0;

    .line 22
    .line 23
    iput-object v0, p0, Ll/xlj;->j:Landroid/graphics/drawable/Drawable;

    .line 24
    .line 25
    iput-object v1, p0, Ll/xlj;->k:Ll/h1e0;

    .line 26
    .line 27
    sget-object v1, Ll/xlj;->u:Ll/h1e0;

    .line 28
    .line 29
    iput-object v1, p0, Ll/xlj;->l:Ll/h1e0;

    .line 30
    .line 31
    iput-object v0, p0, Ll/xlj;->m:Landroid/graphics/Matrix;

    .line 32
    .line 33
    iput-object v0, p0, Ll/xlj;->n:Landroid/graphics/PointF;

    .line 34
    .line 35
    iput-object v0, p0, Ll/xlj;->o:Landroid/graphics/ColorFilter;

    .line 36
    .line 37
    iput-object v0, p0, Ll/xlj;->p:Landroid/graphics/drawable/Drawable;

    .line 38
    .line 39
    iput-object v0, p0, Ll/xlj;->q:Ljava/util/List;

    .line 40
    .line 41
    iput-object v0, p0, Ll/xlj;->r:Landroid/graphics/drawable/Drawable;

    .line 42
    .line 43
    iput-object v0, p0, Ll/xlj;->s:Lcom/facebook/drawee/generic/RoundingParams;

    .line 44
    .line 45
    return-void
.end method

.method public v(Ll/h1e0;)Ll/xlj;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xlj;->l:Ll/h1e0;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Ll/xlj;->m:Landroid/graphics/Matrix;

    .line 5
    .line 6
    return-object p0
.end method

.method public w(Landroid/graphics/drawable/Drawable;)Ll/xlj;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xlj;->p:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method public x(F)Ll/xlj;
    .locals 0

    .line 1
    iput p1, p0, Ll/xlj;->c:F

    .line 2
    .line 3
    return-object p0
.end method

.method public y(I)Ll/xlj;
    .locals 0

    .line 1
    iput p1, p0, Ll/xlj;->b:I

    .line 2
    .line 3
    return-object p0
.end method

.method public z(I)Ll/xlj;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xlj;->a:Landroid/content/res/Resources;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Ll/xlj;->h:Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    return-object p0
.end method
