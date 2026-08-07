.class public Ll/ply;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/lmy;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/requestmic/MemberRequestMicPageView;

.field public b:Ll/lmy;

.field public c:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/requestmic/MemberRequestMicPageView;->j0(Landroid/view/LayoutInflater;)Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/requestmic/MemberRequestMicPageView;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Ll/ply;->a:Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/requestmic/MemberRequestMicPageView;

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/d3q;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    instance-of v0, p1, Ll/nly;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/nly;

    .line 6
    .line 7
    iget-object p1, p1, Ll/nly;->a:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method private c()V
    .locals 4

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    iget-object v1, p0, Ll/ply;->c:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v1, 0x0

    .line 21
    :goto_0
    iget-object v2, p0, Ll/ply;->a:Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/requestmic/MemberRequestMicPageView;

    .line 22
    .line 23
    iget-object v2, v2, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/requestmic/MemberRequestMicPageView;->l:Lv/VLinear;

    .line 24
    .line 25
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v2, p0, Ll/ply;->a:Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/requestmic/MemberRequestMicPageView;

    .line 29
    .line 30
    iget-object v2, v2, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/requestmic/MemberRequestMicPageView;->k:Lv/VRecyclerView;

    .line 31
    .line 32
    xor-int/lit8 v3, v1, 0x1

    .line 33
    .line 34
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Ll/ply;->b:Ll/lmy;

    .line 38
    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MemberManagerEvent:Lcom/tantan/live/eventbus/LiveEventBus$MemberManagerEvent;

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MemberManagerEvent;->clearTabRedPoint()Ll/v3f$d;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MemberManagerEvent:Lcom/tantan/live/eventbus/LiveEventBus$MemberManagerEvent;

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MemberManagerEvent;->addTabRedPoint()Ll/v3f$d;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public b(Ll/lmy;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final d(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ll/nly;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ply;->c:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ll/oly;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Ll/oly;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ll/d3q;

    .line 17
    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    check-cast p0, Ll/nly;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e()Landroid/view/View;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<VM:",
            "Ll/ply;",
            ">()",
            "Landroid/view/View;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ply;->a:Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/requestmic/MemberRequestMicPageView;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Ll/lmy;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/ply;->b:Ll/lmy;

    .line 2
    .line 3
    new-instance v0, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 4
    .line 5
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Ll/ply;->c:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 9
    .line 10
    iget-object v1, p0, Ll/ply;->a:Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/requestmic/MemberRequestMicPageView;

    .line 11
    .line 12
    invoke-virtual {v1, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/requestmic/MemberRequestMicPageView;->l0(Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;Ll/lmy;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/ply;->c:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 16
    .line 17
    new-instance p1, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/ply;->d(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ll/nly;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/ply;->c:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->W(Ll/d3q;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0}, Ll/ply;->c()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/lmy;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ply;->b(Ll/lmy;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public j(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ply;->i(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ply;->m()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ll/ply;->c()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public k(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ply;->a:Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/requestmic/MemberRequestMicPageView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/requestmic/MemberRequestMicPageView;->e:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 4
    .line 5
    iget-object v1, p0, Ll/ply;->b:Ll/lmy;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/lmy;->x4()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    xor-int/lit8 v1, v1, 0x1

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    new-instance v0, Ll/mly;

    .line 23
    .line 24
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-direct {v0, v1}, Ll/mly;-><init>(I)V

    .line 29
    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    invoke-interface {p1, v1, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object v0, p0, Ll/ply;->c:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 36
    .line 37
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 38
    .line 39
    .line 40
    invoke-direct {p0}, Ll/ply;->c()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public l(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ply;->a:Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/requestmic/MemberRequestMicPageView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/requestmic/MemberRequestMicPageView;->n0(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ply;->c:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-lez v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Ll/ply;->c:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->H(I)Ll/d3q;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    instance-of v0, v0, Ll/mly;

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    iget-object v0, p0, Ll/ply;->c:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->H(I)Ll/d3q;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Ll/mly;

    .line 31
    .line 32
    iget-object v2, p0, Ll/ply;->c:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 33
    .line 34
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    const/4 v3, 0x1

    .line 43
    if-gt v2, v3, :cond_0

    .line 44
    .line 45
    iget-object v2, p0, Ll/ply;->c:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 46
    .line 47
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-interface {v2, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/ply;->c:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRemoved(I)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    iget-object v2, p0, Ll/ply;->b:Ll/lmy;

    .line 61
    .line 62
    invoke-virtual {v2}, Ll/lmy;->t4()I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    invoke-virtual {v0, v2}, Ll/mly;->I(I)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Ll/ply;->c:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 72
    .line 73
    .line 74
    :cond_1
    :goto_0
    invoke-direct {p0}, Ll/ply;->c()V

    .line 75
    .line 76
    .line 77
    return-void
.end method
