.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView$a;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceMaxHeightRecyclerView;

.field public b:Landroid/widget/LinearLayout;

.field public c:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

.field public d:Ljava/lang/String;


# direct methods
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

    .line 33
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    new-instance p2, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 5
    .line 6
    invoke-direct {p2}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;->c:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 10
    .line 11
    const-string p2, ""

    .line 12
    .line 13
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;->d:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    sget p2, Ll/yec0;->f9:I

    .line 20
    .line 21
    const/4 p3, 0x1

    .line 22
    invoke-virtual {p1, p2, p0, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;->a(Landroid/view/View;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;->b()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 34
    invoke-direct {p0, p1, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 35
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/wrp;->a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final b()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceMaxHeightRecyclerView;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView$a;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView$a;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceMaxHeightRecyclerView;

    .line 12
    .line 13
    new-instance v1, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    const/4 v3, 0x3

    .line 20
    invoke-direct {v1, v2, v3}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceMaxHeightRecyclerView;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;->c:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;->c:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/p4o0;",
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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;->b:Landroid/widget/LinearLayout;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x1

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceMaxHeightRecyclerView;

    .line 15
    .line 16
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceMaxHeightRecyclerView;

    .line 24
    .line 25
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;->c:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public getModels()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;->c:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getPageName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
