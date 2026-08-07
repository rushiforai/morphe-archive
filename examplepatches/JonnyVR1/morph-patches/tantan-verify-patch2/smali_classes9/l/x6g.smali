.class public Ll/x6g;
.super Ll/tk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/tk2<",
        "Ll/w6g;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Ll/tk2;Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyViewGroup;Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/oo2;",
            ">;",
            "Ll/tk2;",
            "Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyViewGroup;",
            "Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;",
            "Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;",
            "Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/tk2;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/w6g;

    .line 5
    .line 6
    move-object p2, p3

    .line 7
    move-object p3, p4

    .line 8
    move-object p4, p5

    .line 9
    move-object p5, p6

    .line 10
    move-object p6, p7

    .line 11
    invoke-direct/range {p1 .. p6}, Ll/w6g;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyViewGroup;Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public O3()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/y8s;->O3()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/w6g;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/w6g;->b()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public g4(Ll/aeg;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/w6g;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/w6g;->c(Ll/aeg;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public i4(Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;Ljava/lang/String;I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FansClubEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;->showFansClubSendGiftDialog()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ll/kx50;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-direct {v0, v1, p1, p2, p3}, Ll/kx50;-><init>(ZLcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;Ljava/lang/String;I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
