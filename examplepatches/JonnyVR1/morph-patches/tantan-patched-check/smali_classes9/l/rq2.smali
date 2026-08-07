.class public abstract Ll/rq2;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I
    .annotation build Landroidx/annotation/StyleRes;
    .end annotation
.end field

.field public b:Z

.field public c:F

.field public d:Z

.field public e:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Landroid/view/Window;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/jgc0;->k:I

    .line 5
    .line 6
    iput v0, p0, Ll/rq2;->a:I

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Ll/rq2;->b:Z

    .line 10
    .line 11
    const/high16 v0, -0x40800000    # -1.0f

    .line 12
    .line 13
    iput v0, p0, Ll/rq2;->c:F

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Ll/rq2;->d:Z

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Ll/rq2;->e:Ll/y20;

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public a()F
    .locals 0

    .line 1
    iget p0, p0, Ll/rq2;->c:F

    .line 2
    .line 3
    return p0
.end method

.method public abstract b(Landroid/view/View;)Landroid/animation/ValueAnimator;
.end method

.method public abstract c(Landroid/view/View;)Landroid/animation/ValueAnimator;
.end method

.method public d()I
    .locals 0

    .line 1
    iget p0, p0, Ll/rq2;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public e()Ll/y20;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/y20<",
            "Landroid/view/Window;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/rq2;->e:Ll/y20;

    .line 2
    .line 3
    return-object p0
.end method

.method public abstract f()I
.end method

.method public g()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/rq2;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/rq2;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public i(F)Ll/rq2;
    .locals 0

    .line 1
    iput p1, p0, Ll/rq2;->c:F

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Z)Ll/rq2;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/rq2;->b:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public k(Z)Ll/rq2;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/rq2;->d:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public l(I)Ll/rq2;
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/StyleRes;
        .end annotation
    .end param

    .line 1
    iput p1, p0, Ll/rq2;->a:I

    .line 2
    .line 3
    return-object p0
.end method

.method public m(Ll/y20;)Ll/rq2;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Landroid/view/Window;",
            ">;)",
            "Ll/rq2;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/rq2;->e:Ll/y20;

    .line 2
    .line 3
    return-object p0
.end method
