.class public Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/avatarline/LiveAvatarLineCardView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field private adapter:Ll/v6u;

.field private recyclerView:Lv/VRecyclerView;

.field savedRingSet:Ll/xyd0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/xyd0;

    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "live_voice_avatar_line_ring"

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/vxr;->l()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ljava/util/HashSet;

    .line 25
    .line 26
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-direct {p1, v0, v1}, Ll/xyd0;-><init>(Ljava/lang/String;Ljava/util/HashSet;)V

    .line 30
    .line 31
    .line 32
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/avatarline/LiveAvatarLineCardView;->savedRingSet:Ll/xyd0;

    .line 33
    .line 34
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

    .line 35
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 36
    new-instance p1, Ll/xyd0;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "live_voice_avatar_line_ring"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    invoke-static {}, Ll/vxr;->l()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    invoke-direct {p1, p2, v0}, Ll/xyd0;-><init>(Ljava/lang/String;Ljava/util/HashSet;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/avatarline/LiveAvatarLineCardView;->savedRingSet:Ll/xyd0;

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

    .line 38
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 39
    new-instance p1, Ll/xyd0;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "live_voice_avatar_line_ring"

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    invoke-static {}, Ll/vxr;->l()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    new-instance p3, Ljava/util/HashSet;

    invoke-direct {p3}, Ljava/util/HashSet;-><init>()V

    invoke-direct {p1, p2, p3}, Ll/xyd0;-><init>(Ljava/lang/String;Ljava/util/HashSet;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/avatarline/LiveAvatarLineCardView;->savedRingSet:Ll/xyd0;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/avatarline/LiveAvatarLineCardView;Ll/pwr$a;Ll/d3q;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/avatarline/LiveAvatarLineCardView;->d(Ll/pwr$a;Ll/d3q;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ljava/util/HashSet;Ljava/util/HashSet;Ll/pwr$a;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Ll/pwr$a;->b()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p2}, Ll/pwr$a;->b()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p2}, Ll/pwr$a;->b()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p1, p0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x0

    .line 30
    invoke-virtual {p2, p0}, Ll/pwr$a;->i(Z)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    const/4 p0, 0x1

    .line 35
    invoke-virtual {p2, p0}, Ll/pwr$a;->i(Z)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private setLocalRingVisible(Ll/pwr;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/pwr;->a()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/avatarline/LiveAvatarLineCardView;->savedRingSet:Ll/xyd0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ljava/util/HashSet;

    .line 19
    .line 20
    new-instance v1, Ljava/util/HashSet;

    .line 21
    .line 22
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 23
    .line 24
    .line 25
    new-instance v2, Ll/qwr;

    .line 26
    .line 27
    invoke-direct {v2, v0, v1}, Ll/qwr;-><init>(Ljava/util/HashSet;Ljava/util/HashSet;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p1, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/avatarline/LiveAvatarLineCardView;->savedRingSet:Ll/xyd0;

    .line 34
    .line 35
    invoke-virtual {p0, v1}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public final c(Ll/pwr;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pwr;",
            ")",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_1

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/pwr;->a()Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    invoke-virtual {p1}, Ll/pwr;->a()Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Ll/pwr$a;

    .line 38
    .line 39
    new-instance v2, Ll/swr;

    .line 40
    .line 41
    invoke-direct {v2, v1}, Ll/swr;-><init>(Ll/pwr$a;)V

    .line 42
    .line 43
    .line 44
    new-instance v3, Ll/rwr;

    .line 45
    .line 46
    invoke-direct {v3, p0, v1, v2}, Ll/rwr;-><init>(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/avatarline/LiveAvatarLineCardView;Ll/pwr$a;Ll/d3q;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2, v3}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    :goto_1
    return-object v0
.end method

.method public final synthetic d(Ll/pwr$a;Ll/d3q;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p1}, Ll/pwr$a;->c()Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p3, v0}, Ll/yrs;->a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/avatarline/LiveAvatarLineCardView;->f(Ll/d3q;Ll/pwr$a;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Ll/pwr$a;->g()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/apibean/LiveCardTracker;->trackMc(Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public e(Ll/pwr;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/avatarline/LiveAvatarLineCardView;->setLocalRingVisible(Ll/pwr;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/avatarline/LiveAvatarLineCardView;->adapter:Ll/v6u;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/avatarline/LiveAvatarLineCardView;->c(Ll/pwr;)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final f(Ll/d3q;Ll/pwr$a;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/d3q<",
            "*>;",
            "Ll/pwr$a;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ll/pwr$a;->b()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p2, v0}, Ll/pwr$a;->i(Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/avatarline/LiveAvatarLineCardView;->savedRingSet:Ll/xyd0;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Ljava/util/HashSet;

    .line 23
    .line 24
    invoke-virtual {p2}, Ll/pwr$a;->b()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {v0, p2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/avatarline/LiveAvatarLineCardView;->savedRingSet:Ll/xyd0;

    .line 32
    .line 33
    invoke-virtual {p2, v0}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/avatarline/LiveAvatarLineCardView;->adapter:Ll/v6u;

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->O(Ll/d3q;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/jdc0;->y0:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VRecyclerView;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/avatarline/LiveAvatarLineCardView;->recyclerView:Lv/VRecyclerView;

    .line 13
    .line 14
    new-instance v0, Ll/v6u;

    .line 15
    .line 16
    invoke-direct {v0}, Ll/v6u;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/avatarline/LiveAvatarLineCardView;->adapter:Ll/v6u;

    .line 20
    .line 21
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-direct {v0, v1, v2, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/avatarline/LiveAvatarLineCardView;->recyclerView:Lv/VRecyclerView;

    .line 32
    .line 33
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 34
    .line 35
    .line 36
    new-instance v0, Ll/luf0;

    .line 37
    .line 38
    sget v1, Ll/qa00;->h:I

    .line 39
    .line 40
    invoke-direct {v0, v2, v1}, Ll/luf0;-><init>(II)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/avatarline/LiveAvatarLineCardView;->recyclerView:Lv/VRecyclerView;

    .line 44
    .line 45
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/avatarline/LiveAvatarLineCardView;->recyclerView:Lv/VRecyclerView;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/avatarline/LiveAvatarLineCardView;->adapter:Ll/v6u;

    .line 51
    .line 52
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method
