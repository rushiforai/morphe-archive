.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;

.field public b:Landroidx/recyclerview/widget/RecyclerView;

.field public c:Lv/VLinear;

.field public d:Landroid/widget/TextView;

.field public e:I

.field public f:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;",
            ">;"
        }
    .end annotation
.end field

.field public g:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-direct {p0, p1, v1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    .line 5
    .line 6
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;->e:I

    .line 7
    .line 8
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;->s(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    iget p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;->e:I

    .line 20
    .line 21
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;->u(I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 25
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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

    .line 26
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 27
    new-instance p1, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    invoke-direct {p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;->g:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;->v(Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;Landroid/view/View;)V

    return-void
.end method

.method private u(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;->b:Landroidx/recyclerview/widget/RecyclerView;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;->g:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;->B(I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public final B(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;->c:Lv/VLinear;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;->z(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public s(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/g7o0;->b(Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public setItemClickAction(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;->f:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic v(Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;->f:Ll/y20;

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

.method public w(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;",
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
    iget p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;->e:I

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;->B(I)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;->c:Lv/VLinear;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    new-instance v0, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;

    .line 45
    .line 46
    new-instance v2, Ll/d7o0;

    .line 47
    .line 48
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;->e:I

    .line 49
    .line 50
    invoke-direct {v2, v1, v3}, Ll/d7o0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;I)V

    .line 51
    .line 52
    .line 53
    new-instance v3, Ll/f7o0;

    .line 54
    .line 55
    invoke-direct {v3, p0, v1}, Ll/f7o0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v2, v3}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 59
    .line 60
    .line 61
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;->g:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final z(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;->d:Landroid/widget/TextView;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->ai:I

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
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Yh:I

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
