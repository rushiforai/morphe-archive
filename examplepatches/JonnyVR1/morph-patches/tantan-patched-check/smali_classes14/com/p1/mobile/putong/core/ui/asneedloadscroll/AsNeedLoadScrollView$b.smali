.class public Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView$b;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Landroidx/recyclerview/widget/RecyclerView$e0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/hll0;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/h11;",
            ">;"
        }
    .end annotation
.end field

.field public c:Z

.field public d:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public constructor <init>(Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView$b;->a:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView$b;->b:Ljava/util/List;

    .line 17
    .line 18
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView$b;->c:Z

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public A(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/hll0;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView$b;->a:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public getItemCount()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView$b;->d:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView$b;->a:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public getItemViewType(I)I
    .locals 0

    return p1
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    instance-of p2, p1, Ll/h11;

    .line 2
    .line 3
    if-eqz p2, :cond_1

    .line 4
    .line 5
    check-cast p1, Ll/h11;

    .line 6
    .line 7
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView$b;->b:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p2, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-nez p2, :cond_0

    .line 14
    .line 15
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView$b;->b:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView$b;->d:Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    if-eqz p2, :cond_1

    .line 27
    .line 28
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView$b;->d:Lcom/p1/mobile/putong/data/User;

    .line 29
    .line 30
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView$b;->c:Z

    .line 31
    .line 32
    invoke-virtual {p1, p2, p0}, Ll/h11;->a(Lcom/p1/mobile/putong/data/User;Z)V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$e0;
    .locals 0
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView$b;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/hll0;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/hll0;->a(Landroid/view/ViewGroup;)Ll/h11;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public y()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/h11;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView$b;->b:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public z(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView$b;->d:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView$b;->b:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 6
    .line 7
    .line 8
    return-void
.end method
