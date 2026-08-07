.class public Ll/b6m0;
.super Ll/atm0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/rwn0;",
        ">",
        "Ll/atm0<",
        "Ll/z5m0<",
        "TD;>;TD;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;",
            "Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/atm0;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/z5m0;

    .line 5
    .line 6
    invoke-direct {p1, p2}, Ll/z5m0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic l4(Ll/b6m0;Lcom/p1/mobile/putong/live/base/data/BLiveMedal;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/b6m0;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveMedal;Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public j4(Ll/vak0;)V
    .locals 0
    .param p1    # Ll/vak0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Ll/atm0;->j4(Ll/vak0;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/z5m0;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/z5m0;->f(Ll/vak0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic m4(Lcom/p1/mobile/putong/live/base/data/BLiveMedal;Ljava/util/List;)V
    .locals 1

    .line 1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;

    .line 17
    .line 18
    invoke-static {p1, p2, p0}, Ll/z6m0;->d(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;Ll/y8s;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMedal;->id:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;->id:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMedal;->url:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;->imageUrl:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMedal;->name:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;->name:Ljava/lang/String;

    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMedal;->type:Ljava/lang/String;

    .line 39
    .line 40
    iput-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;->type:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveJumpInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveJumpInfo;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    const-string v0, "\u8be5\u88c5\u626e\u6682\u65e0\u6cd5\u83b7\u53d6"

    .line 47
    .line 48
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveJumpInfo;->text:Ljava/lang/String;

    .line 49
    .line 50
    const-string v0, "\u77e5\u9053\u4e86"

    .line 51
    .line 52
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveJumpInfo;->buttonText:Ljava/lang/String;

    .line 53
    .line 54
    iput-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;->jumpInfo:Lcom/p1/mobile/putong/live/base/data/BLiveJumpInfo;

    .line 55
    .line 56
    iget-object p1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 57
    .line 58
    invoke-static {p1, p2, p0}, Ll/z6m0;->d(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;Ll/y8s;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public n4(Lcom/p1/mobile/putong/live/base/data/BLiveMedal;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMedal;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "medal"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/itv;->D(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/a6m0;

    .line 14
    .line 15
    invoke-direct {v1, p0, p1}, Ll/a6m0;-><init>(Ll/b6m0;Lcom/p1/mobile/putong/live/base/data/BLiveMedal;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    return-void
.end method
