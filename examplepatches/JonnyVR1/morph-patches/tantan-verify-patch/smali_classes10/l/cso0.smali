.class public Ll/cso0;
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


# instance fields
.field public final r:Ljava/lang/String;

.field public s:Z

.field public t:I


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;Ljava/lang/String;)V
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
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/qrm0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/cso0;->s:Z

    .line 6
    .line 7
    iput p1, p0, Ll/cso0;->t:I

    .line 8
    .line 9
    iput-object p4, p0, Ll/cso0;->r:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic o4(Ll/cso0;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cso0;->q4(Ljava/lang/Integer;)V

    return-void
.end method


# virtual methods
.method public C1(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;->BOTTOM:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public E()I
    .locals 0

    .line 1
    iget p0, p0, Ll/cso0;->t:I

    .line 2
    .line 3
    return p0
.end method

.method public P3()V
    .locals 0

    .line 1
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomZoneEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;->setSettingButtonRedPoint()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Ll/i6t;->f3(Ll/v3f$b;)Ll/i6t$a;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/bso0;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/bso0;-><init>(Ll/cso0;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/i6t$a;->b(Ll/y20;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public bridge synthetic T3(IZ)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cso0;->p4(IZ)Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceRedDotButton;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public a4()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "settingButton"

    .line 2
    .line 3
    return-object p0
.end method

.method public b4()I
    .locals 0

    .line 1
    sget p0, Ll/obc0;->K8:I

    .line 2
    .line 3
    return p0
.end method

.method public c4()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public l1()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cso0;->r:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "layered"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/qrm0;->q:Ll/jxd0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    xor-int/lit8 p0, p0, 0x1

    .line 24
    .line 25
    return p0

    .line 26
    :cond_0
    iget-boolean p0, p0, Ll/cso0;->s:Z

    .line 27
    .line 28
    return p0
.end method

.method public m4(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/qrm0;->q:Ll/jxd0;

    .line 2
    .line 3
    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {p1, p2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/cso0;->r:Ljava/lang/String;

    .line 9
    .line 10
    const-string p2, "layered"

    .line 11
    .line 12
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/qrm0;->X3()Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceRedDotButton;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/cso0;->l1()Z

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceRedDotButton;->g0(Z)V

    .line 29
    .line 30
    .line 31
    :cond_0
    invoke-virtual {p0}, Ll/qrm0;->f4()Ll/qct;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p1}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->BootBubbleEvent:Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;

    .line 40
    .line 41
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;->dismissBubble()Ll/v3f$d;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    const-string p2, "settingButtonBubble"

    .line 46
    .line 47
    invoke-virtual {p1, p2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Ll/qrm0;->f4()Ll/qct;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomZoneEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;

    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;->showSettingDialog()Ll/v3f$c;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public p4(IZ)Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceRedDotButton;
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

.method public final synthetic q4(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Ll/cso0;->t:I

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/qrm0;->X3()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceRedDotButton;

    .line 18
    .line 19
    iget p0, p0, Ll/cso0;->t:I

    .line 20
    .line 21
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceRedDotButton;->b(I)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    const/4 v0, -0x1

    .line 30
    const/4 v1, 0x0

    .line 31
    if-ne p1, v0, :cond_1

    .line 32
    .line 33
    const/4 p1, 0x1

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    move p1, v1

    .line 36
    :goto_0
    iput-boolean p1, p0, Ll/cso0;->s:Z

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/qrm0;->X3()Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceRedDotButton;

    .line 43
    .line 44
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceRedDotButton;->setRedDotCount(I)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Ll/qrm0;->X3()Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceRedDotButton;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/cso0;->l1()Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceRedDotButton;->g0(Z)V

    .line 58
    .line 59
    .line 60
    return-void
.end method
