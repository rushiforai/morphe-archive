.class public Ll/tvo0;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/jqm0;",
        ">;"
    }
.end annotation


# instance fields
.field public final i:Lcom/p1/mobile/putong/live/livingroom/voice/intl/player/VoiceIncomeAreaStateView;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/voice/intl/player/VoiceIncomeAreaStateView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "Ll/jqm0;",
            ">;",
            "Lcom/p1/mobile/putong/live/livingroom/voice/intl/player/VoiceIncomeAreaStateView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/tvo0;->i:Lcom/p1/mobile/putong/live/livingroom/voice/intl/player/VoiceIncomeAreaStateView;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic J3(Ll/tvo0;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tvo0;->K3(Ll/jsv;)V

    return-void
.end method

.method private K3(Ll/jsv;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/jqm0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Ll/tvo0;->i:Lcom/p1/mobile/putong/live/livingroom/voice/intl/player/VoiceIncomeAreaStateView;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->isMainLandArea()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/player/VoiceIncomeAreaStateView;->Q(Z)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/tvo0;->i:Lcom/p1/mobile/putong/live/livingroom/voice/intl/player/VoiceIncomeAreaStateView;

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/jsv;->a()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    const/4 v0, 0x4

    .line 27
    if-ne p1, v0, :cond_0

    .line 28
    .line 29
    const/4 p1, 0x1

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const/4 p1, 0x0

    .line 32
    :goto_0
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    return-void
.end method


# virtual methods
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
    check-cast v0, Ll/jqm0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/vp20;->l()Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/svo0;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/svo0;-><init>(Ll/tvo0;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method
