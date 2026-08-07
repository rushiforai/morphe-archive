.class public Ll/l3m0;
.super Ll/y8s;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/y8s<",
        "Ll/rwn0;",
        "Ll/i3m0;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/y8s;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/i3m0;

    .line 5
    .line 6
    iget-object p1, p1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-direct {v0, p1, p0}, Ll/i3m0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/l3m0;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic S3(Ll/l3m0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/l3m0;->T3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;)V

    return-void
.end method


# virtual methods
.method public final synthetic T3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/i3m0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/i3m0;->O(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VirtualRoomInfoEvent:Lcom/tantan/live/eventbus/LiveEventBus$VirtualRoomInfoEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VirtualRoomInfoEvent;->showVoiceRoomHeatDialog()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/k3m0;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/k3m0;-><init>(Ll/l3m0;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
