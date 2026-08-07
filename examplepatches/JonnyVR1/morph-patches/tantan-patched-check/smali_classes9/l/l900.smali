.class public abstract Ll/l900;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lzl;


# instance fields
.field public a:Landroid/view/ViewGroup;

.field public b:Ll/kzl;

.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/l900;->c:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/l900;->d:Ljava/util/List;

    .line 17
    .line 18
    iput-object p1, p0, Ll/l900;->a:Landroid/view/ViewGroup;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public abstract a(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Message;II)V
.end method

.method public final b(Ll/kzl;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/l900;->b:Ll/kzl;

    .line 2
    .line 3
    iget-object v0, p0, Ll/l900;->c:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p1, v0}, Ll/kzl;->x(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/l900;->d:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {p1, v0}, Ll/kzl;->i(Ljava/util/List;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ll/l900;->c:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/l900;->d:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public c(Ll/ner;Lrx/c;)Lrx/c;
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
    iget-object v0, p0, Ll/l900;->b:Ll/kzl;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/l900;->b:Ll/kzl;

    .line 10
    .line 11
    invoke-interface {p0, p1, p2}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public abstract d()I
.end method

.method public g(Ll/ner;Lrx/c;Z)Lrx/c;
    .locals 1
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
    iget-object v0, p0, Ll/l900;->b:Ll/kzl;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/l900;->b:Ll/kzl;

    .line 10
    .line 11
    invoke-interface {p0, p1, p2, p3}, Ll/pol;->g(Ll/ner;Lrx/c;Z)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public j(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l900;->b:Ll/kzl;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/l900;->b:Ll/kzl;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/p4m;->j(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p0, p0, Ll/l900;->c:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public abstract m(I)Lcom/p1/mobile/putong/core/data/Message;
.end method

.method public abstract p(I)I
.end method

.method public final r()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l900;->b:Ll/kzl;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/l900;->b:Ll/kzl;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/kzl;->r()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public abstract s()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end method

.method public t(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l900;->b:Ll/kzl;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/l900;->b:Ll/kzl;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/p4m;->t(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p0, p0, Ll/l900;->c:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public abstract w(Landroid/view/ViewGroup;I)Landroid/view/View;
.end method

.method public y()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l900;->b:Ll/kzl;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/l900;->b:Ll/kzl;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/kzl;->n()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public z()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l900;->b:Ll/kzl;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/l900;->b:Ll/kzl;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/kzl;->u()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
