.class public Ll/f0g0;
.super Ll/tr2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/tr2<",
        "Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;",
        ">;"
    }
.end annotation


# instance fields
.field public final d:Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/SquareRecyclerView;

.field public final e:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/SquareRecyclerView;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/SquareRecyclerView;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/tr2;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/f0g0;->f:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, p0, Ll/f0g0;->d:Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/SquareRecyclerView;

    .line 9
    .line 10
    iput-object p2, p0, Ll/f0g0;->e:Ll/y20;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/f0g0;->J(Landroid/view/View;Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p0, p2}, Ll/tr2;->G(I)Ll/uf3;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    check-cast p2, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 6
    .line 7
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    new-instance p1, Landroid/view/View;

    .line 14
    .line 15
    iget-object p0, p0, Ll/f0g0;->d:Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/SquareRecyclerView;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-direct {p1, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    return-object p1

    .line 25
    :cond_0
    iget-object p2, p2, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;->e:Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper$Type;

    .line 26
    .line 27
    sget-object v0, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper$Type;->chatRoom:Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper$Type;

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    if-ne p2, v0, :cond_1

    .line 31
    .line 32
    iget-object p0, p0, Ll/f0g0;->d:Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/SquareRecyclerView;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    sget p2, Ll/kec0;->ec:I

    .line 43
    .line 44
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0

    .line 49
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper$Type;->momentState:Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper$Type;

    .line 50
    .line 51
    if-ne p2, v0, :cond_2

    .line 52
    .line 53
    iget-object p0, p0, Ll/f0g0;->d:Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/SquareRecyclerView;

    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    sget p2, Ll/kec0;->fc:I

    .line 64
    .line 65
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    return-object p0

    .line 70
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper$Type;->quickChat:Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper$Type;

    .line 71
    .line 72
    if-ne p2, v0, :cond_3

    .line 73
    .line 74
    iget-object p0, p0, Ll/f0g0;->d:Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/SquareRecyclerView;

    .line 75
    .line 76
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    sget p2, Ll/kec0;->gc:I

    .line 85
    .line 86
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    return-object p0

    .line 91
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper$Type;->momentChatRoom:Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper$Type;

    .line 92
    .line 93
    if-ne p2, v0, :cond_4

    .line 94
    .line 95
    iget-object p0, p0, Ll/f0g0;->d:Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/SquareRecyclerView;

    .line 96
    .line 97
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    sget p2, Ll/kec0;->dc:I

    .line 106
    .line 107
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    return-object p0

    .line 112
    :cond_4
    new-instance p1, Landroid/view/View;

    .line 113
    .line 114
    iget-object p0, p0, Ll/f0g0;->d:Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/SquareRecyclerView;

    .line 115
    .line 116
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-direct {p1, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 121
    .line 122
    .line 123
    return-object p1
.end method

.method public J(Landroid/view/View;Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;II)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f0g0;->d:Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/SquareRecyclerView;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/SquareRecyclerView;->T(Landroid/view/View;Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;II)V

    .line 4
    .line 5
    .line 6
    instance-of p3, p1, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;

    .line 7
    .line 8
    if-eqz p3, :cond_0

    .line 9
    .line 10
    move-object p3, p1

    .line 11
    check-cast p3, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;

    .line 12
    .line 13
    new-instance v0, Ll/e0g0;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/e0g0;-><init>(Ll/f0g0;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p3, p2, v0}, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->d(Ll/uf3;Ll/qm50;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    instance-of p2, p1, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;

    .line 22
    .line 23
    if-eqz p2, :cond_1

    .line 24
    .line 25
    check-cast p1, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;

    .line 26
    .line 27
    iget-object p0, p0, Ll/f0g0;->e:Ll/y20;

    .line 28
    .line 29
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->m(Ll/y20;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    instance-of p2, p1, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;

    .line 34
    .line 35
    if-eqz p2, :cond_2

    .line 36
    .line 37
    check-cast p1, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;

    .line 38
    .line 39
    iget-object p2, p0, Ll/f0g0;->f:Ljava/lang/String;

    .line 40
    .line 41
    iget-object p0, p0, Ll/f0g0;->e:Ll/y20;

    .line 42
    .line 43
    invoke-virtual {p1, p2, p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->l(Ljava/lang/String;Ll/y20;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_2
    instance-of p2, p1, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;

    .line 48
    .line 49
    if-eqz p2, :cond_3

    .line 50
    .line 51
    check-cast p1, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;

    .line 52
    .line 53
    iget-object p0, p0, Ll/f0g0;->e:Ll/y20;

    .line 54
    .line 55
    invoke-virtual {p1, p0, p4}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->l(Ll/y20;I)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_3
    instance-of p2, p1, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;

    .line 60
    .line 61
    if-eqz p2, :cond_4

    .line 62
    .line 63
    check-cast p1, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;

    .line 64
    .line 65
    iget-object p0, p0, Ll/f0g0;->e:Ll/y20;

    .line 66
    .line 67
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->l(Ll/y20;)V

    .line 68
    .line 69
    .line 70
    :cond_4
    return-void
.end method

.method public K(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/f0g0;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public onViewAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onViewAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/f0g0;->d:Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/SquareRecyclerView;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/SquareRecyclerView;->W(Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onViewDetachedFromWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onViewDetachedFromWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/f0g0;->d:Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/SquareRecyclerView;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/SquareRecyclerView;->X(Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
