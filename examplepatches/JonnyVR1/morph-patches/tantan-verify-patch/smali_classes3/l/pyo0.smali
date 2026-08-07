.class public Ll/pyo0;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/rzo0;",
        ">;"
    }
.end annotation


# instance fields
.field public k:Lv/VText;

.field public l:Lv/VText;

.field public m:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpHeadView;

.field public n:Lv/VLinear;

.field public o:Lv/VText;

.field public p:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/rzo0;Ll/rq2;)V
    .locals 1

    .line 1
    sget v0, Ll/yec0;->ra:I

    .line 2
    .line 3
    invoke-direct {p0, v0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;-><init>(ILcom/p1/mobile/android/app/Act;Ll/y8s;Ll/rq2;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->B(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic F(Ll/pyo0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/pyo0;->K(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/pyo0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/pyo0;->L(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic H(Ll/pyo0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/pyo0;->M(Landroid/view/View;)V

    return-void
.end method

.method private synthetic K(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 5
    .line 6
    check-cast p1, Ll/rzo0;

    .line 7
    .line 8
    iget-object p0, p0, Ll/pyo0;->p:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 9
    .line 10
    invoke-virtual {p1, p0}, Ll/rzo0;->a4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private synthetic L(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p1, Ll/rzo0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/pyo0;->p:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getUserId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p1, p0}, Ll/rzo0;->c4(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private synthetic M(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p1, Ll/rzo0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/pyo0;->p:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getOtherUserId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p1, p0}, Ll/rzo0;->c4(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
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

.method public final I(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/qyo0;->a(Ll/pyo0;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public J(Ll/rzo0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final N(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;)V
    .locals 8

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getOtherUserName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getOtherUserName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/16 v2, 0xc

    .line 20
    .line 21
    if-le v1, v2, :cond_0

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "..."

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    :cond_0
    iget-object v1, p0, Ll/pyo0;->k:Lv/VText;

    .line 35
    .line 36
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->ag:I

    .line 37
    .line 38
    invoke-static {v2, v0}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getHouseName()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez v0, :cond_2

    .line 54
    .line 55
    new-instance v0, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    const-string v1, "LV."

    .line 58
    .line 59
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getHouseRank()I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getHouseName()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v5

    .line 80
    iget-object v2, p0, Ll/pyo0;->m:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpHeadView;

    .line 81
    .line 82
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getHouseImage()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v4

    .line 86
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getUserAvatar()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v6

    .line 90
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getOtherUserAvatar()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v7

    .line 94
    const/4 v3, 0x0

    .line 95
    invoke-virtual/range {v2 .. v7}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpHeadView;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    :cond_2
    return-void
.end method

.method public O(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iput-object p1, p0, Ll/pyo0;->p:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/pyo0;->N(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/rzo0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/pyo0;->J(Ll/rzo0;)V

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

.method public m(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/pyo0;->I(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/pyo0;->o:Lv/VText;

    .line 8
    .line 9
    new-instance v0, Ll/myo0;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/myo0;-><init>(Ll/pyo0;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Ll/pyo0;->m:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpHeadView;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpHeadView;->e:Lv/VDraweeView;

    .line 20
    .line 21
    new-instance v0, Ll/nyo0;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/nyo0;-><init>(Ll/pyo0;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/pyo0;->m:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpHeadView;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpHeadView;->g:Lv/VDraweeView;

    .line 32
    .line 33
    new-instance v0, Ll/oyo0;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Ll/oyo0;-><init>(Ll/pyo0;)V

    .line 36
    .line 37
    .line 38
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public bridge synthetic n(Ll/y8s;)V
    .locals 0

    .line 1
    check-cast p1, Ll/rzo0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/pyo0;->J(Ll/rzo0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
