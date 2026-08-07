.class public final Ll/lpm0;
.super Ll/hj2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/rwn0;",
        ">",
        "Ll/hj2<",
        "TD;",
        "Ll/jpm0;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000D\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0018\u0000*\u0008\u0008\u0000\u0010\u0002*\u00020\u00012\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00020\u00040\u0003B\u0015\u0012\u000c\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0005\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u000f\u0010\n\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u0013\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00020\r0\u000c\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u0015\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0011\u001a\u00020\u0010\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u000f\u0010\u0015\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u0015\u0010\u0016J\u000f\u0010\u0017\u001a\u00020\u0012H\u0002\u00a2\u0006\u0004\u0008\u0017\u0010\u0018R\u001d\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u00058\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0019\u0010\u001a\u001a\u0004\u0008\u001b\u0010\u001cR\u0016\u0010 \u001a\u00020\u001d8\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u0008\u001e\u0010\u001f\u00a8\u0006!"
    }
    d2 = {
        "Ll/lpm0;",
        "Ll/rwn0;",
        "D",
        "Ll/hj2;",
        "Ll/jpm0;",
        "Ll/dum;",
        "curInfo",
        "<init>",
        "(Ll/dum;)V",
        "",
        "t",
        "()V",
        "",
        "Ll/dpm0;",
        "R3",
        "()Ljava/util/List;",
        "",
        "name",
        "Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/relationlist/view/LiveVoiceAuctionListPage;",
        "S3",
        "(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/relationlist/view/LiveVoiceAuctionListPage;",
        "T3",
        "()Ll/jpm0;",
        "P3",
        "()Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/relationlist/view/LiveVoiceAuctionListPage;",
        "k",
        "Ll/dum;",
        "getCurInfo",
        "()Ll/dum;",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoice;",
        "l",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoice;",
        "curLive",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final k:Ll/dum;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/dum<",
            "TD;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public l:Lcom/p1/mobile/putong/live/base/data/BLiveVoice;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0
    .param p1    # Ll/dum;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/hj2;-><init>(Ll/dum;)V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/lpm0;->k:Ll/dum;

    .line 8
    .line 9
    return-void
.end method

.method public static O3(Ll/lpm0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/hj2;->L3()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/hj2;->N3()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast p0, Ll/jpm0;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->j()V

    .line 19
    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public bridge synthetic K3()Ll/isl;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/lpm0;->T3()Ll/jpm0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final P3()Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/relationlist/view/LiveVoiceAuctionListPage;
    .locals 3

    .line 1
    sget v0, Ll/yec0;->H7:I

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/cyr;->C0()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/relationlist/view/LiveVoiceAuctionListPage;

    .line 21
    .line 22
    return-object p0
.end method

.method public final R3()Ljava/util/List;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/dpm0;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/dpm0;

    .line 7
    .line 8
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    move-object v5, v2

    .line 11
    check-cast v5, Ll/eqm0;

    .line 12
    .line 13
    const/16 v8, 0x14

    .line 14
    .line 15
    const/4 v9, 0x0

    .line 16
    const-string v2, "apply"

    .line 17
    .line 18
    const-string v3, "\u62cd\u62cd\u7533\u8bf7"

    .line 19
    .line 20
    const/4 v4, 0x0

    .line 21
    const/4 v6, 0x0

    .line 22
    const/4 v7, 0x0

    .line 23
    invoke-direct/range {v1 .. v9}, Ll/dpm0;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/view/ViewGroup;Ll/eqm0;ZIILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 24
    .line 25
    .line 26
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    new-instance v2, Ll/dpm0;

    .line 30
    .line 31
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 32
    .line 33
    move-object v6, v1

    .line 34
    check-cast v6, Ll/eqm0;

    .line 35
    .line 36
    const/16 v9, 0x14

    .line 37
    .line 38
    const/4 v10, 0x0

    .line 39
    const-string v3, "invite"

    .line 40
    .line 41
    const-string v4, "\u9080\u8bf7\u62cd\u62cd"

    .line 42
    .line 43
    const/4 v5, 0x0

    .line 44
    const/4 v8, 0x1

    .line 45
    invoke-direct/range {v2 .. v10}, Ll/dpm0;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/view/ViewGroup;Ll/eqm0;ZIILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 46
    .line 47
    .line 48
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    new-instance v3, Ll/dpm0;

    .line 52
    .line 53
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 54
    .line 55
    move-object v7, p0

    .line 56
    check-cast v7, Ll/eqm0;

    .line 57
    .line 58
    const/16 v10, 0x14

    .line 59
    .line 60
    const/4 v11, 0x0

    .line 61
    const-string v4, "list"

    .line 62
    .line 63
    const-string v5, "\u62cd\u62cd\u6392\u5e8f"

    .line 64
    .line 65
    const/4 v6, 0x0

    .line 66
    const/4 v8, 0x0

    .line 67
    const/4 v9, 0x2

    .line 68
    invoke-direct/range {v3 .. v11}, Ll/dpm0;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/view/ViewGroup;Ll/eqm0;ZIILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 69
    .line 70
    .line 71
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    return-object v0
.end method

.method public final S3(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/relationlist/view/LiveVoiceAuctionListPage;
    .locals 3
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/lpm0;->P3()Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/relationlist/view/LiveVoiceAuctionListPage;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ll/z3v;

    .line 9
    .line 10
    iget-object v2, p0, Ll/lpm0;->k:Ll/dum;

    .line 11
    .line 12
    invoke-direct {v1, p1, v2, v0}, Ll/z3v;-><init>(Ljava/lang/String;Ll/dum;Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/relationlist/view/LiveVoiceAuctionListPage;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v1}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public T3()Ll/jpm0;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ll/jpm0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/xzs;->e:Ll/dum;

    .line 4
    .line 5
    iget-object p0, p0, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/jpm0;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/rwn0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/lpm0;->l:Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceAuctionEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceAuctionEvent;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceAuctionEvent;->openAuctionQueueDlg()Ll/v3f$d;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Lrx/c;

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/kpm0;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/kpm0;-><init>(Ll/lpm0;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    return-void
.end method
