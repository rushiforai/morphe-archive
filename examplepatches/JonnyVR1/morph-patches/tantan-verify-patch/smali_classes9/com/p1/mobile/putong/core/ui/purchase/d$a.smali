.class public Lcom/p1/mobile/putong/core/ui/purchase/d$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/purchase/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public A:I

.field public B:Ljava/lang/String;

.field public C:Z

.field public D:Ljava/lang/String;

.field public E:Ljava/lang/String;

.field public F:Ljava/lang/String;

.field public final a:Lcom/p1/mobile/putong/core/data/Merchandise;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public b:D

.field public c:D

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:Ljava/lang/String;

.field public j:D

.field public k:Z

.field public l:Z

.field public m:Z

.field public n:Z

.field public o:Ljava/lang/String;

.field public p:I

.field public q:Ljava/lang/String;

.field public r:Ljava/lang/String;

.field public s:Ljava/lang/String;

.field public t:Ljava/lang/String;

.field public u:Ljava/lang/String;

.field public v:Ljava/lang/String;

.field public w:Lcom/p1/mobile/putong/core/data/ProductCategory;

.field public x:Ll/t6c;

.field public y:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

.field public z:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/data/Merchandise;)V
    .locals 2
    .param p1    # Lcom/p1/mobile/putong/core/data/Merchandise;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->o:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->p:I

    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->q:Ljava/lang/String;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->r:Ljava/lang/String;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s:Ljava/lang/String;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->t:Ljava/lang/String;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->u:Ljava/lang/String;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->v:Ljava/lang/String;

    .line 22
    .line 23
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->z:Z

    .line 24
    .line 25
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->C:Z

    .line 26
    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->D:Ljava/lang/String;

    .line 28
    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->E:Ljava/lang/String;

    .line 30
    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->F:Ljava/lang/String;

    .line 32
    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->a:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 34
    .line 35
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)Lcom/p1/mobile/putong/core/data/ProductCategory;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->w:Lcom/p1/mobile/putong/core/data/ProductCategory;

    return-object p0
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)Lcom/p1/mobile/putong/core/data/Merchandise;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->a:Lcom/p1/mobile/putong/core/data/Merchandise;

    return-object p0
.end method


# virtual methods
.method public A()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->E:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public B()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->D:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public C()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->a:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public D()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->C:Z

    .line 2
    .line 3
    return p0
.end method

.method public E()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->n:Z

    .line 2
    .line 3
    return p0
.end method

.method public F()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->l:Z

    .line 2
    .line 3
    return p0
.end method

.method public G()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->m:Z

    .line 2
    .line 3
    return p0
.end method

.method public H()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->z:Z

    .line 2
    .line 3
    return p0
.end method

.method public I()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->k:Z

    .line 2
    .line 3
    return p0
.end method

.method public J(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->F:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public K(D)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->c:D

    .line 2
    .line 3
    return-void
.end method

.method public L(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->C:Z

    .line 2
    .line 3
    return-void
.end method

.method public M(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->t:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public N(Lcom/p1/mobile/putong/core/data/ProductCategory;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->w:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 2
    .line 3
    return-void
.end method

.method public O(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public P(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->n:Z

    .line 2
    .line 3
    return-void
.end method

.method public Q(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->l:Z

    .line 2
    .line 3
    return-void
.end method

.method public R(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public S(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->m:Z

    .line 2
    .line 3
    return-void
.end method

.method public T(Ll/t6c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->x:Ll/t6c;

    .line 2
    .line 3
    return-void
.end method

.method public U(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public V(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public W(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public X(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public Y(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->B:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public Z(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->v:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public a0(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->A:I

    .line 2
    .line 3
    return-void
.end method

.method public b0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->u:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->F:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->z:Z

    .line 2
    .line 3
    return-void
.end method

.method public d()D
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->c:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public d0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->k:Z

    .line 2
    .line 3
    return-void
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->t:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public e0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->o:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public f()Lcom/p1/mobile/putong/core/data/ProductCategory;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->w:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 2
    .line 3
    return-object p0
.end method

.method public f0(D)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->b:D

    .line 2
    .line 3
    return-void
.end method

.method public g()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public g0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->i:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public h()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public h0(D)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->j:D

    .line 2
    .line 3
    return-void
.end method

.method public i()Ll/t6c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->x:Ll/t6c;

    .line 2
    .line 3
    return-object p0
.end method

.method public i0(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->p:I

    .line 2
    .line 3
    return-void
.end method

.method public j()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public j0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->q:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public k()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public k0(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->y:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

    .line 2
    .line 3
    return-void
.end method

.method public l()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public l0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->r:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public m()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public m0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->E:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public n()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->B:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public n0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->D:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public o()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->v:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public p()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->A:I

    .line 2
    .line 3
    return p0
.end method

.method public q()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->u:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public r()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->o:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public s()Lcom/p1/mobile/putong/core/data/Merchandise;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->a:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 2
    .line 3
    return-object p0
.end method

.method public t()D
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->b:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public u()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->i:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public v()D
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->j:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public w()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->p:I

    .line 2
    .line 3
    return p0
.end method

.method public x()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->q:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public y()Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->y:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

    .line 2
    .line 3
    return-object p0
.end method

.method public z()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->r:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
