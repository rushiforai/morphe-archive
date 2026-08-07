.class public Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionToolbarView;
.super Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionToolbarViewBindings;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionToolbarViewBindings<",
        "Ll/x81;",
        ">;"
    }
.end annotation


# instance fields
.field public g:J


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionToolbarViewBindings;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionToolbarView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionToolbarView;->i(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionToolbarView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionToolbarView;->j(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionToolbarView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionToolbarView;->k(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic i(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionToolbarViewBindings;->a:Ll/k3m;

    .line 2
    .line 3
    check-cast p0, Ll/x81;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/x81;->X3()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private r()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionToolbarViewBindings;->f:Lv/VImage;

    .line 2
    .line 3
    new-instance v1, Ll/b4v;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/b4v;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionToolbarView;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final synthetic j(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionToolbarViewBindings;->a:Ll/k3m;

    .line 2
    .line 3
    check-cast p1, Ll/i6t;

    .line 4
    .line 5
    invoke-static {p1}, Ll/t3m0;->f(Ll/i6t;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionToolbarViewBindings;->a:Ll/k3m;

    .line 9
    .line 10
    check-cast p0, Ll/x81;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceAuctionEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceAuctionEvent;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceAuctionEvent;->openRelationSettingsDlg()Ll/v3f$d;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string p1, ""

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic k(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionToolbarViewBindings;->a:Ll/k3m;

    .line 2
    .line 3
    check-cast p1, Ll/x81;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceAuctionEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceAuctionEvent;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceAuctionEvent;->openAuctionQueueDlg()Ll/v3f$d;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionToolbarView;->g:J

    .line 21
    .line 22
    const-wide/16 v2, 0x0

    .line 23
    .line 24
    cmp-long p1, v0, v2

    .line 25
    .line 26
    if-lez p1, :cond_0

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionToolbarViewBindings;->a:Ll/k3m;

    .line 29
    .line 30
    check-cast p0, Ll/i6t;

    .line 31
    .line 32
    invoke-static {p0}, Ll/t3m0;->i(Ll/i6t;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public l(ZLcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionToolbarView;->n(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;)V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionToolbarView;->m(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionToolbarViewBindings;->c:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionToolbarViewBindings;->e:Lv/VText;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionToolbarViewBindings;->d:Lv/VText;

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->currentUserQueueState:Ljava/lang/String;

    .line 19
    .line 20
    const-string v1, "applied"

    .line 21
    .line 22
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionToolbarViewBindings;->e:Lv/VText;

    .line 29
    .line 30
    const-string v0, "\u5df2\u7533\u8bf7"

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionToolbarViewBindings;->e:Lv/VText;

    .line 36
    .line 37
    new-instance p1, Ll/c4v;

    .line 38
    .line 39
    invoke-direct {p1}, Ll/c4v;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->currentUserQueueState:Ljava/lang/String;

    .line 47
    .line 48
    const-string v0, "queuing"

    .line 49
    .line 50
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionToolbarViewBindings;->e:Lv/VText;

    .line 55
    .line 56
    if-eqz p1, :cond_1

    .line 57
    .line 58
    const-string p1, "\u7b49\u5f85\u4e0a\u62cd"

    .line 59
    .line 60
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionToolbarViewBindings;->e:Lv/VText;

    .line 64
    .line 65
    new-instance p1, Ll/d4v;

    .line 66
    .line 67
    invoke-direct {p1}, Ll/d4v;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_1
    const-string p1, "\u7533\u8bf7\u62cd\u62cd"

    .line 75
    .line 76
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionToolbarViewBindings;->e:Lv/VText;

    .line 80
    .line 81
    new-instance v0, Ll/e4v;

    .line 82
    .line 83
    invoke-direct {v0, p0}, Ll/e4v;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionToolbarView;)V

    .line 84
    .line 85
    .line 86
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public n(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionToolbarViewBindings;->c:Lv/VText;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionToolbarViewBindings;->c:Lv/VText;

    .line 8
    .line 9
    const-string v0, "\u62cd\u62cd\u961f\u5217"

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionToolbarViewBindings;->e:Lv/VText;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionToolbarViewBindings;->d:Lv/VText;

    .line 21
    .line 22
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionToolbarViewBindings;->c:Lv/VText;

    .line 26
    .line 27
    new-instance v0, Ll/f4v;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Ll/f4v;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionToolbarView;)V

    .line 30
    .line 31
    .line 32
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionToolbarViewBindings;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionToolbarView;->r()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public p(J)V
    .locals 3

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionToolbarViewBindings;->d:Lv/VText;

    .line 6
    .line 7
    if-lez v0, :cond_1

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionToolbarViewBindings;->d:Lv/VText;

    .line 14
    .line 15
    const-wide/16 v1, 0x63

    .line 16
    .line 17
    cmp-long v1, p1, v1

    .line 18
    .line 19
    if-lez v1, :cond_0

    .line 20
    .line 21
    const-string v1, "99+"

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_1
    const/4 v0, 0x0

    .line 33
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    :goto_1
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionToolbarView;->g:J

    .line 37
    .line 38
    return-void
.end method
