.class public Lcom/p1/mobile/putong/feed/newui/camera/widget/f;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/camera/widget/f$a;,
        Lcom/p1/mobile/putong/feed/newui/camera/widget/f$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/p1/mobile/putong/feed/newui/camera/widget/f$a;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/newui/camera/widget/f$b;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
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
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/f;->b:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/f;->a:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public A(Landroid/view/ViewGroup;I)Lcom/p1/mobile/putong/feed/newui/camera/widget/f$a;
    .locals 1
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/f;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget p2, Ll/tec0;->W:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupSeekbarPageView;

    .line 15
    .line 16
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/f$a;

    .line 17
    .line 18
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/f$a;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupSeekbarPageView;)V

    .line 19
    .line 20
    .line 21
    return-object p1
.end method

.method public C(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/f;->c:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public getItemCount()I
    .locals 0

    const/4 p0, 0x5

    return p0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/f$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/f;->z(Lcom/p1/mobile/putong/feed/newui/camera/widget/f$a;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$e0;
    .locals 0
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/f;->A(Landroid/view/ViewGroup;I)Lcom/p1/mobile/putong/feed/newui/camera/widget/f$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public y(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/newui/camera/widget/f$b;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/f;->b:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/f;->b:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public z(Lcom/p1/mobile/putong/feed/newui/camera/widget/f$a;I)V
    .locals 2
    .param p1    # Lcom/p1/mobile/putong/feed/newui/camera/widget/f$a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/f$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupSeekbarPageView;

    .line 2
    .line 3
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupSeekbarPageView;->i()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/f;->b:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/f$b;

    .line 20
    .line 21
    if-nez p2, :cond_0

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupSeekbarPageView;->n()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 v1, 0x1

    .line 28
    if-ne p2, v1, :cond_1

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupSeekbarPageView;->o(Lcom/p1/mobile/putong/feed/newui/camera/widget/f$b;)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    const/4 v1, 0x2

    .line 35
    if-ne p2, v1, :cond_2

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupSeekbarPageView;->r(Lcom/p1/mobile/putong/feed/newui/camera/widget/f$b;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_2
    const/4 v1, 0x3

    .line 42
    if-ne p2, v1, :cond_3

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupSeekbarPageView;->s(Lcom/p1/mobile/putong/feed/newui/camera/widget/f$b;)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_3
    const/4 v1, 0x4

    .line 49
    if-ne p2, v1, :cond_4

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupSeekbarPageView;->p(Lcom/p1/mobile/putong/feed/newui/camera/widget/f$b;)V

    .line 52
    .line 53
    .line 54
    :cond_4
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/f;->c:Ll/y20;

    .line 55
    .line 56
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupSeekbarPageView;->setOnResetItemClick(Ll/y20;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method
