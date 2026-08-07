.class public Ll/oan0;
.super Ll/qrm0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qrm0<",
        "Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceRedDotButton;",
        ">;"
    }
.end annotation


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
    invoke-direct {p0, p1, p2, p3}, Ll/qrm0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public C1(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public bridge synthetic T3(IZ)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/oan0;->o4(IZ)Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceRedDotButton;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b4()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public c4()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public m4(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;->handleScheme()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance p1, Ll/bae0$a;

    .line 12
    .line 13
    const/16 p2, 0x320

    .line 14
    .line 15
    invoke-direct {p1, p2}, Ll/bae0$a;-><init>(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, p3}, Ll/bae0$a;->e(Ljava/lang/String;)Ll/bae0$a;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Ll/bae0$a;->c()Ll/bae0;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public o4(IZ)Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceRedDotButton;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/qrm0;->l:Ll/dum;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/yec0;->Q7:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceRedDotButton;

    .line 17
    .line 18
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 19
    .line 20
    iget v2, p0, Ll/qrm0;->j:I

    .line 21
    .line 22
    iget v3, p0, Ll/qrm0;->i:I

    .line 23
    .line 24
    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Ll/qrm0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 31
    .line 32
    sget-object v2, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;->BOTTOM:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;

    .line 33
    .line 34
    invoke-virtual {p0, v1, v2}, Ll/qrm0;->e4(Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-eqz v2, :cond_0

    .line 43
    .line 44
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceRedDotButton;->setLocalIcon(I)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    iget p1, p0, Ll/qrm0;->j:I

    .line 49
    .line 50
    iget p0, p0, Ll/qrm0;->i:I

    .line 51
    .line 52
    invoke-virtual {v0, v1, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceRedDotButton;->a(Ljava/lang/String;II)V

    .line 53
    .line 54
    .line 55
    :goto_0
    invoke-static {v0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    return-object v0
.end method
