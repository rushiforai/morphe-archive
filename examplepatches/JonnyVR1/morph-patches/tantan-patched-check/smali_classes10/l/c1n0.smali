.class public Ll/c1n0;
.super Ll/oan0;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/rwn0;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;",
            "Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/oan0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p4(Ll/c1n0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/c1n0;->r4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method


# virtual methods
.method public C1(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qrm0;->l:Ll/dum;

    .line 2
    .line 3
    iget-boolean p0, p0, Ll/dum;->d:Z

    .line 4
    .line 5
    return p0
.end method

.method public b4()I
    .locals 0

    .line 1
    sget p0, Ll/obc0;->k9:I

    .line 2
    .line 3
    return p0
.end method

.method public e4(Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    return-object p0
.end method

.method public m4(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/c1n0;->q4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public q4()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 15
    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-nez v1, :cond_1

    .line 23
    .line 24
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->V:I

    .line 25
    .line 26
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    iget-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 31
    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_2

    .line 39
    .line 40
    :goto_0
    return-void

    .line 41
    :cond_2
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_3

    .line 46
    .line 47
    iget-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_3
    iget-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 51
    .line 52
    :goto_1
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 53
    .line 54
    xor-int/lit8 v1, v1, 0x1

    .line 55
    .line 56
    const-string v2, ""

    .line 57
    .line 58
    invoke-static {p0, v0, v1, v2}, Ll/ydn0;->p(Ll/i6t;Ljava/lang/String;ZLjava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final r4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/c1n0;->s4(Z)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 14
    .line 15
    if-nez v0, :cond_2

    .line 16
    .line 17
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 18
    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const/4 p1, 0x0

    .line 23
    goto :goto_1

    .line 24
    :cond_2
    :goto_0
    const/4 p1, 0x1

    .line 25
    :goto_1
    invoke-virtual {p0, p1}, Ll/c1n0;->s4(Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public s4(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget p1, Ll/obc0;->j9:I

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    sget p1, Ll/obc0;->k9:I

    .line 7
    .line 8
    :goto_0
    invoke-virtual {p0}, Ll/qrm0;->X3()Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceRedDotButton;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceRedDotButton;->a:Lv/VDraweeView;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 17
    .line 18
    .line 19
    return-void
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
    invoke-virtual {v0}, Ll/rwn0;->Z2()Lrx/c;

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
    new-instance v1, Ll/b1n0;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/b1n0;-><init>(Ll/c1n0;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

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
