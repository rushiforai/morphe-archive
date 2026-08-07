.class public Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VRecyclerView;

.field public d:Lv/VRecyclerView;

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/uxr<",
            "*>;>;"
        }
    .end annotation
.end field

.field public f:Lcom/p1/mobile/android/app/Frag;

.field public g:Ll/q7v;

.field public h:Ll/r0u;

.field public i:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntryCardData;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/u6v;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/u6v;-><init>(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->i:Ll/z20;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Ll/u6v;

    invoke-direct {p1, p0}, Ll/u6v;-><init>(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->i:Ll/z20;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Ll/u6v;

    invoke-direct {p1, p0}, Ll/u6v;-><init>(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->i:Ll/z20;

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;Ljava/lang/Integer;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->a0(Ljava/lang/Integer;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V

    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntryCardData;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->Z(Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntryCardData;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic R(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic S(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->Y()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic T(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;)Ll/r0u;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->h:Ll/r0u;

    return-object p0
.end method


# virtual methods
.method public final V(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/y6v;->a(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public W()Ll/r0u;
    .locals 5

    .line 1
    invoke-static {}, Ll/r0u;->J0()Ll/r0u;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->h:Ll/r0u;

    .line 6
    .line 7
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/4 v2, 0x6

    .line 14
    const/4 v3, 0x1

    .line 15
    const/4 v4, 0x0

    .line 16
    invoke-direct {v0, v1, v2, v3, v4}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;IIZ)V

    .line 17
    .line 18
    .line 19
    new-instance v1, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView$a;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView$a;-><init>(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->v(Landroidx/recyclerview/widget/GridLayoutManager$c;)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->c:Lv/VRecyclerView;

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->c:Lv/VRecyclerView;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->h:Ll/r0u;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->c:Lv/VRecyclerView;

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$l;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->h:Ll/r0u;

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->f:Lcom/p1/mobile/android/app/Frag;

    .line 48
    .line 49
    new-instance v2, Ll/x6v;

    .line 50
    .line 51
    invoke-direct {v2, p0}, Ll/x6v;-><init>(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;)V

    .line 52
    .line 53
    .line 54
    sget-object v3, Lcom/p1/mobile/putong/live/external/page/teenmode/LiveTeenDialogAct;->g:Lrx/subjects/b;

    .line 55
    .line 56
    invoke-virtual {v0, v1, v2, v3}, Ll/v6u;->o0(Lcom/p1/mobile/android/app/Frag;Ll/pcj;Lrx/subjects/b;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->h:Ll/r0u;

    .line 60
    .line 61
    invoke-virtual {v0, v4}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->X(Z)V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->h:Ll/r0u;

    .line 65
    .line 66
    return-object p0
.end method

.method public final X()Ll/q7v;
    .locals 3

    .line 1
    new-instance v0, Ll/q7v;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/q7v;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->g:Ll/q7v;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->i:Ll/z20;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/q7v;->i0(Ll/z20;)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const/4 v2, 0x3

    .line 20
    invoke-direct {v0, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->d:Lv/VRecyclerView;

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->d:Lv/VRecyclerView;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->g:Ll/q7v;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->g:Ll/q7v;

    .line 36
    .line 37
    return-object p0
.end method

.method public final synthetic Y()Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic Z(Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntryCardData;Ljava/lang/Integer;)V
    .locals 3

    .line 1
    const-string v0, "p_audio_explore_recommend"

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntryCardData;->getTrackData()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "e_audio_shortcut"

    .line 8
    .line 9
    invoke-static {v2, v0, v1}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntryCardData;->getSource()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->d0(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic a0(Ljava/lang/Integer;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V
    .locals 2

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;->getList()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->f:Lcom/p1/mobile/android/app/Frag;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;->getList()Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntrySuggested;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntrySuggested;->getGoAction()Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {p0, v0}, Ll/yrs;->a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;->getList()Ljava/util/List;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    check-cast p0, Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntrySuggested;

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntrySuggested;->getTrackData()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    const-string p2, "index"

    .line 53
    .line 54
    invoke-interface {p0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    const-string p1, "e_live_audio_room_enter"

    .line 58
    .line 59
    const-string p2, "p_audio_explore_recommend"

    .line 60
    .line 61
    invoke-static {p1, p2, p0}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_1
    :goto_0
    const-string p0, "\u5f53\u524d\u6682\u65e0\u8fd9\u7c7b\u7fa4\u7ec4\uff0c\u4f60\u6765\u521b\u5efa\u4e00\u4e2a\u5427"

    .line 66
    .line 67
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public b0(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/uxr<",
            "*>;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->e:Ljava/util/List;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->h:Ll/r0u;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->W()Ll/r0u;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->h:Ll/r0u;

    .line 12
    .line 13
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->h:Ll/r0u;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->getItemCount()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v1, 0x1

    .line 26
    if-le v0, v1, :cond_1

    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->h:Ll/r0u;

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->h:Ll/r0u;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/v6u;->k0()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public c0(Lcom/p1/mobile/android/app/Frag;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Frag;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntryCardData;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->f:Lcom/p1/mobile/android/app/Frag;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->g:Ll/q7v;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->X()Ll/q7v;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->g:Ll/q7v;

    .line 12
    .line 13
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->g:Ll/q7v;

    .line 14
    .line 15
    invoke-virtual {p1, p2}, Ll/q7v;->h0(Ljava/util/List;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->d:Lv/VRecyclerView;

    .line 19
    .line 20
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    xor-int/lit8 p1, p1, 0x1

    .line 25
    .line 26
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public d0(Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->f:Lcom/p1/mobile/android/app/Frag;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/live/external/module/api/LiveVoiceInternalSquareApi;->requestEntrysSuggested(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance v0, Ll/v6v;

    .line 12
    .line 13
    invoke-direct {v0, p0, p2}, Ll/v6v;-><init>(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;Ljava/lang/Integer;)V

    .line 14
    .line 15
    .line 16
    new-instance p0, Ll/w6v;

    .line 17
    .line 18
    invoke-direct {p0}, Ll/w6v;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->V(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
