.class public Ll/dmf;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static d:Ljava/lang/String; = "ExpandedBaseHolder"


# instance fields
.field public a:Landroid/view/View;

.field public b:Z

.field public c:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/dmf;->b:Z

    .line 6
    .line 7
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Ll/dmf;->c:Lrx/subjects/b;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic e(Lrx/c;)Lrx/c;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic f(Landroid/view/View;Landroid/view/View;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-ne p1, p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method


# virtual methods
.method public g(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public h()V
    .locals 0

    .line 1
    return-void
.end method

.method public i(Landroid/view/View;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/dmf;->a:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dmf;->g(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ll/dmf;->d:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p1, v0, p0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public j(Landroid/view/View;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public k(Ll/ner;Lrx/c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/ner;",
            "Lrx/c<",
            "TV;>;)",
            "Lrx/c<",
            "TV;>;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/dmf;->l(Ll/ner;Lrx/c;Z)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public l(Ll/ner;Lrx/c;Z)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/ner;",
            "Lrx/c<",
            "TV;>;Z)",
            "Lrx/c<",
            "TV;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dmf;->a:Landroid/view/View;

    .line 2
    .line 3
    invoke-interface {p1}, Ll/ner;->lifecycle()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {}, Ll/psd0;->E()Lrx/c$d;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {p1, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object p0, p0, Ll/dmf;->c:Lrx/subjects/b;

    .line 16
    .line 17
    new-instance v1, Ll/bmf;

    .line 18
    .line 19
    invoke-direct {v1, v0}, Ll/bmf;-><init>(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p1, p0}, Lrx/c;->takeUntil(Lrx/c;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    new-instance p1, Ll/cmf;

    .line 31
    .line 32
    invoke-direct {p1, p2}, Ll/cmf;-><init>(Lrx/c;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p1, p0, p3}, Ll/psd0;->D(Ll/pcj;Lrx/c;Z)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public m()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dmf;->a:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public n()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/dmf;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public o()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dmf;->a:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/dmf;->c:Lrx/subjects/b;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public p(III)V
    .locals 0

    .line 1
    return-void
.end method

.method public q(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public r()V
    .locals 0

    .line 1
    return-void
.end method

.method public s()V
    .locals 0

    .line 1
    return-void
.end method

.method public t()V
    .locals 0

    .line 1
    return-void
.end method

.method public u(ZIII)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/dmf;->b:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Ll/dmf;->b:Z

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/dmf;->q(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-boolean p1, p0, Ll/dmf;->b:Z

    .line 11
    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0, p2, p3, p4}, Ll/dmf;->p(III)V

    .line 15
    .line 16
    .line 17
    :cond_1
    return-void
.end method

.method public v()V
    .locals 0

    .line 1
    return-void
.end method
