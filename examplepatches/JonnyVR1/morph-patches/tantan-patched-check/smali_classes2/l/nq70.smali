.class public Ll/nq70;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroid/content/res/Resources;

.field public b:Ll/ytd;

.field public c:Ll/rce;

.field public d:Ljava/util/concurrent/Executor;

.field public e:Ll/mpy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/mpy<",
            "Ll/by3;",
            "Ll/db5;",
            ">;"
        }
    .end annotation
.end field

.field public f:Lcom/facebook/common/internal/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/common/internal/ImmutableList<",
            "Ll/rce;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ll/a7h0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a7h0<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Landroid/content/res/Resources;Ll/ytd;Ll/rce;Ljava/util/concurrent/Executor;Ll/mpy;Lcom/facebook/common/internal/ImmutableList;Ll/a7h0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/res/Resources;",
            "Ll/ytd;",
            "Ll/rce;",
            "Ljava/util/concurrent/Executor;",
            "Ll/mpy<",
            "Ll/by3;",
            "Ll/db5;",
            ">;",
            "Lcom/facebook/common/internal/ImmutableList<",
            "Ll/rce;",
            ">;",
            "Ll/a7h0<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/nq70;->a:Landroid/content/res/Resources;

    .line 2
    .line 3
    iput-object p2, p0, Ll/nq70;->b:Ll/ytd;

    .line 4
    .line 5
    iput-object p3, p0, Ll/nq70;->c:Ll/rce;

    .line 6
    .line 7
    iput-object p4, p0, Ll/nq70;->d:Ljava/util/concurrent/Executor;

    .line 8
    .line 9
    iput-object p5, p0, Ll/nq70;->e:Ll/mpy;

    .line 10
    .line 11
    iput-object p6, p0, Ll/nq70;->f:Lcom/facebook/common/internal/ImmutableList;

    .line 12
    .line 13
    iput-object p7, p0, Ll/nq70;->g:Ll/a7h0;

    .line 14
    .line 15
    return-void
.end method

.method public b(Landroid/content/res/Resources;Ll/ytd;Ll/rce;Ljava/util/concurrent/Executor;Ll/mpy;Lcom/facebook/common/internal/ImmutableList;)Ll/kq70;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/res/Resources;",
            "Ll/ytd;",
            "Ll/rce;",
            "Ljava/util/concurrent/Executor;",
            "Ll/mpy<",
            "Ll/by3;",
            "Ll/db5;",
            ">;",
            "Lcom/facebook/common/internal/ImmutableList<",
            "Ll/rce;",
            ">;)",
            "Ll/kq70;"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/kq70;

    .line 2
    .line 3
    invoke-direct/range {p0 .. p6}, Ll/kq70;-><init>(Landroid/content/res/Resources;Ll/ytd;Ll/rce;Ljava/util/concurrent/Executor;Ll/mpy;Lcom/facebook/common/internal/ImmutableList;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public c()Ll/kq70;
    .locals 7

    .line 1
    iget-object v1, p0, Ll/nq70;->a:Landroid/content/res/Resources;

    .line 2
    .line 3
    iget-object v2, p0, Ll/nq70;->b:Ll/ytd;

    .line 4
    .line 5
    iget-object v3, p0, Ll/nq70;->c:Ll/rce;

    .line 6
    .line 7
    iget-object v4, p0, Ll/nq70;->d:Ljava/util/concurrent/Executor;

    .line 8
    .line 9
    iget-object v5, p0, Ll/nq70;->e:Ll/mpy;

    .line 10
    .line 11
    iget-object v6, p0, Ll/nq70;->f:Lcom/facebook/common/internal/ImmutableList;

    .line 12
    .line 13
    move-object v0, p0

    .line 14
    invoke-virtual/range {v0 .. v6}, Ll/nq70;->b(Landroid/content/res/Resources;Ll/ytd;Ll/rce;Ljava/util/concurrent/Executor;Ll/mpy;Lcom/facebook/common/internal/ImmutableList;)Ll/kq70;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    iget-object v0, v0, Ll/nq70;->g:Ll/a7h0;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-interface {v0}, Ll/a7h0;->get()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Ljava/lang/Boolean;

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    invoke-virtual {p0, v0}, Ll/kq70;->z0(Z)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-object p0
.end method
