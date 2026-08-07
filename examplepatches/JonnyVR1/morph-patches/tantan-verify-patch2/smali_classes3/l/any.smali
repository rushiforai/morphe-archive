.class public Ll/any;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/hny;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/settlein/MemberSettleInPageView;

.field public b:Ll/tjy;

.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;",
            ">;"
        }
    .end annotation
.end field


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
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/settlein/MemberSettleInPageView;->i0(Landroid/view/LayoutInflater;)Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/settlein/MemberSettleInPageView;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Ll/any;->a:Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/settlein/MemberSettleInPageView;

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;->userId:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;->userId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
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

.method public b(Ll/hny;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c()Landroid/view/View;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<VM:",
            "Ll/any;",
            ">()",
            "Landroid/view/View;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/any;->a:Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/settlein/MemberSettleInPageView;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ll/hny;Ll/y20;Ll/y20;Ll/y20;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/hny;",
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
    new-instance v0, Ll/tjy;

    .line 2
    .line 3
    const/4 v2, 0x1

    .line 4
    move-object v1, p1

    .line 5
    move-object v3, p2

    .line 6
    move-object v4, p3

    .line 7
    move-object v5, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Ll/tjy;-><init>(Ll/djy;ILl/y20;Ll/y20;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/any;->b:Ll/tjy;

    .line 12
    .line 13
    iget-object p1, p0, Ll/any;->a:Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/settlein/MemberSettleInPageView;

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/settlein/MemberSettleInPageView;->k0(Ll/tjy;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/any;->b:Ll/tjy;

    .line 19
    .line 20
    new-instance p1, Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ll/tjy;->I(Ljava/util/List;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ljava/util/List;)V
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
    iput-object p1, p0, Ll/any;->c:Ljava/util/List;

    .line 2
    .line 3
    iget-object p0, p0, Ll/any;->a:Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/settlein/MemberSettleInPageView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/settlein/MemberSettleInPageView;->setListData(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/any;->b:Ll/tjy;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/any;->c:Ljava/util/List;

    .line 8
    .line 9
    new-instance v1, Ll/zmy;

    .line 10
    .line 11
    invoke-direct {v1, p1}, Ll/zmy;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/jyb;->O(Ljava/util/List;Ll/qcj;)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iget-object p0, p0, Ll/any;->b:Ll/tjy;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/hny;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/any;->b(Ll/hny;)V

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
