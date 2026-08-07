.class public Ll/mmy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/tmy;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/requestsettlein/MemberRequestSettleInView;

.field public b:Ll/tjy;

.field public c:Ll/tmy;


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
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/requestsettlein/MemberRequestSettleInView;->i0(Landroid/view/LayoutInflater;)Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/requestsettlein/MemberRequestSettleInView;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Ll/mmy;->a:Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/requestsettlein/MemberRequestSettleInView;

    .line 13
    .line 14
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

.method public a(Ll/tmy;)V
    .locals 0

    .line 1
    return-void
.end method

.method public b(Ljava/lang/Boolean;)V
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-virtual {p0}, Ll/mmy;->i()V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Ll/mmy;->a:Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/requestsettlein/MemberRequestSettleInView;

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/requestsettlein/MemberRequestSettleInView;->m0(Z)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    iget-object p0, p0, Ll/mmy;->c:Ll/tmy;

    .line 23
    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MemberManagerEvent:Lcom/tantan/live/eventbus/LiveEventBus$MemberManagerEvent;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MemberManagerEvent;->clearTabRedPoint()Ll/v3f$d;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MemberManagerEvent:Lcom/tantan/live/eventbus/LiveEventBus$MemberManagerEvent;

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MemberManagerEvent;->addTabRedPoint()Ll/v3f$d;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public c()Landroid/view/View;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<VM:",
            "Ll/mmy;",
            ">()",
            "Landroid/view/View;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/mmy;->a:Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/requestsettlein/MemberRequestSettleInView;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ll/tmy;Ll/y20;Ll/y20;Ll/y20;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/tmy;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;",
            ">;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;",
            ">;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/mmy;->c:Ll/tmy;

    .line 2
    .line 3
    new-instance v0, Ll/tjy;

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    move-object v1, p1

    .line 7
    move-object v3, p2

    .line 8
    move-object v4, p3

    .line 9
    move-object v5, p4

    .line 10
    invoke-direct/range {v0 .. v5}, Ll/tjy;-><init>(Ll/djy;ILl/y20;Ll/y20;Ll/y20;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/mmy;->b:Ll/tjy;

    .line 14
    .line 15
    iget-object p1, p0, Ll/mmy;->a:Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/requestsettlein/MemberRequestSettleInView;

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/requestsettlein/MemberRequestSettleInView;->k0(Ll/tjy;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/mmy;->b:Ll/tjy;

    .line 21
    .line 22
    new-instance p1, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/tjy;->I(Ljava/util/List;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(ILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/mmy;->a:Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/requestsettlein/MemberRequestSettleInView;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/requestsettlein/MemberRequestSettleInView;->l0(ILjava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/mmy;->a:Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/requestsettlein/MemberRequestSettleInView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/requestsettlein/MemberRequestSettleInView;->setListData(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mmy;->b:Ll/tjy;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/tjy;->C()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/mmy;->b:Ll/tjy;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/tmy;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/mmy;->a(Ll/tmy;)V

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
