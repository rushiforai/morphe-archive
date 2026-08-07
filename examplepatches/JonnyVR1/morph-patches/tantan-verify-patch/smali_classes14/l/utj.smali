.class public Ll/utj;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Ll/jjs;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/jjs;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ll/vlu;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vlu<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/vlu;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vlu<",
            "*>;",
            "Ljava/util/List<",
            "Ll/jjs;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/utj;->d:Ll/vlu;

    .line 5
    .line 6
    iput-object p2, p0, Ll/utj;->c:Ljava/util/List;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Ll/jjs;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/utj;->E(Landroid/view/View;Ll/jjs;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/utj;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/m0k;->c(Landroid/view/ViewGroup;)Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public E(Landroid/view/View;Ll/jjs;II)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

    .line 2
    .line 3
    iget-object p0, p0, Ll/utj;->d:Ll/vlu;

    .line 4
    .line 5
    invoke-virtual {p1, p2, p0, p4}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->R0(Ll/jjs;Ll/vlu;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public F(I)Ll/jjs;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/utj;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/jjs;

    .line 8
    .line 9
    return-object p0
.end method

.method public G(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/jjs;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/utj;->c:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/utj;->c:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/utj;->F(I)Ll/jjs;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$e0;ILjava/util/List;)V
    .locals 1
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/recyclerview/widget/RecyclerView$e0;",
            "I",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Ll/jic0;->onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$e0;I)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p3

    .line 16
    check-cast p3, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result p3

    .line 22
    if-nez p3, :cond_1

    .line 23
    .line 24
    iget-object p0, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 25
    .line 26
    instance-of p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

    .line 27
    .line 28
    if-eqz p1, :cond_3

    .line 29
    .line 30
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->k1()V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    const/4 v0, 0x1

    .line 37
    if-ne v0, p3, :cond_2

    .line 38
    .line 39
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 40
    .line 41
    instance-of p3, p1, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

    .line 42
    .line 43
    if-eqz p3, :cond_3

    .line 44
    .line 45
    check-cast p1, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

    .line 46
    .line 47
    invoke-virtual {p0, p2}, Ll/utj;->F(I)Ll/jjs;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->O0(Ll/jjs;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_2
    const/4 p0, 0x2

    .line 56
    if-ne p0, p3, :cond_3

    .line 57
    .line 58
    iget-object p0, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 59
    .line 60
    instance-of p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

    .line 61
    .line 62
    if-eqz p1, :cond_3

    .line 63
    .line 64
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->N0()V

    .line 67
    .line 68
    .line 69
    :cond_3
    return-void
.end method
