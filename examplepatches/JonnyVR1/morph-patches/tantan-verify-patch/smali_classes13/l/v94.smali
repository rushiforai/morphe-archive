.class public Ll/v94;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Z

.field private b:I

.field private c:Z

.field private d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private e:Ljava/lang/String;

.field private f:Z

.field private g:I

.field private h:F

.field private i:F

.field private j:Z

.field private k:Z

.field private l:Z

.field private m:Z

.field private n:I

.field private o:F

.field private p:Z

.field private q:Z

.field private r:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/v94;->a:Z

    .line 6
    .line 7
    const/16 v1, 0x96

    .line 8
    .line 9
    iput v1, p0, Ll/v94;->b:I

    .line 10
    .line 11
    iput-boolean v0, p0, Ll/v94;->c:Z

    .line 12
    .line 13
    const/16 v1, 0x9

    .line 14
    .line 15
    iput v1, p0, Ll/v94;->g:I

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    iput-boolean v1, p0, Ll/v94;->j:Z

    .line 19
    .line 20
    iput-boolean v0, p0, Ll/v94;->k:Z

    .line 21
    .line 22
    iput-boolean v0, p0, Ll/v94;->l:Z

    .line 23
    .line 24
    iput-boolean v1, p0, Ll/v94;->m:Z

    .line 25
    .line 26
    iput v1, p0, Ll/v94;->n:I

    .line 27
    .line 28
    const/high16 v1, -0x40800000    # -1.0f

    .line 29
    .line 30
    iput v1, p0, Ll/v94;->o:F

    .line 31
    .line 32
    iput-boolean v0, p0, Ll/v94;->p:Z

    .line 33
    .line 34
    iput-boolean v0, p0, Ll/v94;->q:Z

    .line 35
    .line 36
    const/16 v0, 0x8

    .line 37
    .line 38
    iput v0, p0, Ll/v94;->r:I

    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public A(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/v94;->r:I

    .line 2
    .line 3
    return-void
.end method

.method public B(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/v94;->p:Z

    .line 2
    .line 3
    return-void
.end method

.method public C(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/v94;->o:F

    .line 2
    .line 3
    return-void
.end method

.method public D(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/v94;->j:Z

    .line 2
    .line 3
    return-void
.end method

.method public E(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/v94;->i:F

    .line 2
    .line 3
    return-void
.end method

.method public F(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/v94;->g:I

    .line 2
    .line 3
    return-void
.end method

.method public a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/v94;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public b()F
    .locals 0

    .line 1
    iget p0, p0, Ll/v94;->h:F

    .line 2
    .line 3
    return p0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v94;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget p0, p0, Ll/v94;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public e()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/v94;->d:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget p0, p0, Ll/v94;->r:I

    .line 2
    .line 3
    return p0
.end method

.method public g()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/v94;->p:Z

    .line 2
    .line 3
    return p0
.end method

.method public h()F
    .locals 0

    .line 1
    iget p0, p0, Ll/v94;->o:F

    .line 2
    .line 3
    return p0
.end method

.method public i()F
    .locals 0

    .line 1
    iget p0, p0, Ll/v94;->i:F

    .line 2
    .line 3
    return p0
.end method

.method public j()I
    .locals 0

    .line 1
    iget p0, p0, Ll/v94;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public k()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/v94;->m:Z

    .line 2
    .line 3
    return p0
.end method

.method public l()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/v94;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public m()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/v94;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public n()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/v94;->l:Z

    .line 2
    .line 3
    return p0
.end method

.method public o()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/v94;->k:Z

    .line 2
    .line 3
    return p0
.end method

.method public p()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/v94;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public q()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/v94;->j:Z

    .line 2
    .line 3
    return p0
.end method

.method public r(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/v94;->b:I

    .line 2
    .line 3
    return-void
.end method

.method public s(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/v94;->m:Z

    .line 2
    .line 3
    return-void
.end method

.method public t(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/v94;->h:F

    .line 2
    .line 3
    return-void
.end method

.method public u(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/v94;->c:Z

    .line 2
    .line 3
    return-void
.end method

.method public v(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/v94;->l:Z

    .line 2
    .line 3
    return-void
.end method

.method public w(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/v94;->k:Z

    .line 2
    .line 3
    return-void
.end method

.method public x(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/v94;->n:I

    .line 2
    .line 3
    return-void
.end method

.method public y(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/v94;->d:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public z(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/v94;->a:Z

    .line 2
    .line 3
    return-void
.end method
