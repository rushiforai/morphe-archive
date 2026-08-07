.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;

.field public b:Landroidx/recyclerview/widget/RecyclerView;

.field public c:Landroid/widget/LinearLayout;

.field public d:Landroid/widget/TextView;

.field public e:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

.field public f:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 35
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 36
    new-instance p1, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    invoke-direct {p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;->e:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    const/4 p1, 0x0

    .line 37
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;->f:Ll/y20;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;->e:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;->f:Ll/y20;

    .line 13
    .line 14
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;->c(I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 29
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 30
    new-instance p1, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    invoke-direct {p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;->e:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    const/4 p1, 0x0

    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;->f:Ll/y20;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 32
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 33
    new-instance p1, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    invoke-direct {p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;->e:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    const/4 p1, 0x0

    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;->f:Ll/y20;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;->d(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/rkn0;->b(Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final c(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    new-instance v1, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    const/4 v3, 0x4

    .line 10
    invoke-direct {v1, v2, v3}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;->e:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;->g(I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic d(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;->f:Ll/y20;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public e(Ljava/util/List;I)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;",
            ">;I)V"
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
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;->g(I)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;->c:Landroid/widget/LinearLayout;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    new-instance v0, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;

    .line 43
    .line 44
    new-instance v2, Ll/lkn0;

    .line 45
    .line 46
    invoke-direct {v2, v1, p2}, Ll/lkn0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;I)V

    .line 47
    .line 48
    .line 49
    new-instance v3, Ll/qkn0;

    .line 50
    .line 51
    invoke-direct {v3, p0, v1}, Ll/qkn0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v2, v3}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 55
    .line 56
    .line 57
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;->e:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 62
    .line 63
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public final f(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;->d:Landroid/widget/TextView;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->jh:I

    .line 6
    .line 7
    invoke-static {p1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->ih:I

    .line 16
    .line 17
    invoke-static {p1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final g(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;->c:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;->f(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setItemClickAction(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;->f:Ll/y20;

    .line 2
    .line 3
    return-void
.end method
