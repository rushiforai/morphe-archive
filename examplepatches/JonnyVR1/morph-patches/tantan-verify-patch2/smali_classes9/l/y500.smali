.class public Ll/y500;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/v500;


# instance fields
.field public a:Ljava/lang/String;

.field public b:J


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/y500;->a:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic j(Ll/pp00;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->isIllegalContent(Ljava/lang/Throwable;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p0, p0, Ll/pp00;->p:Ll/bp00;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/bp00;->t0()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic k(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "\u5bf9\u65b9\u8d26\u53f7\u5f02\u5e38"

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public c(Ll/pp00;)V
    .locals 3

    .line 1
    iget-object p0, p1, Ll/pp00;->k:Lv/VLinear;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Ll/pp00;->a:Landroid/widget/RelativeLayout;

    .line 8
    .line 9
    const-string v1, "#1C000000"

    .line 10
    .line 11
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    invoke-virtual {p0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ll/pp00;->s()Lcom/p1/mobile/putong/core/ui/moment/MomentMessageAct;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p1, Ll/pp00;->k:Lv/VLinear;

    .line 30
    .line 31
    invoke-static {p0, v0}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p1, Ll/pp00;->k:Lv/VLinear;

    .line 35
    .line 36
    invoke-static {p0, v0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p1, Ll/pp00;->m:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 40
    .line 41
    const-string v1, "\u53d1\u6d88\u606f"

    .line 42
    .line 43
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p1, Ll/pp00;->m:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 47
    .line 48
    const/high16 v1, 0x41600000    # 14.0f

    .line 49
    .line 50
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p1, Ll/pp00;->d:Landroid/widget/LinearLayout;

    .line 54
    .line 55
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p1, Ll/pp00;->c:Landroid/widget/TextView;

    .line 59
    .line 60
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 61
    .line 62
    .line 63
    iget-object p0, p1, Ll/pp00;->l:Lv/VDraweeView;

    .line 64
    .line 65
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p1, Ll/pp00;->o:Lcom/p1/mobile/putong/core/ui/moment/MomentMessageAct;

    .line 69
    .line 70
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 71
    .line 72
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 73
    .line 74
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->W:Lrx/subjects/b;

    .line 75
    .line 76
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {p0, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    new-instance v0, Ll/w500;

    .line 89
    .line 90
    invoke-direct {v0, p1}, Ll/w500;-><init>(Ll/pp00;)V

    .line 91
    .line 92
    .line 93
    new-instance p1, Ll/x500;

    .line 94
    .line 95
    invoke-direct {p1}, Ll/x500;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-static {v0, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 2

    .line 1
    const-string v0, "state_comment"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageReference;->new_()Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "state"

    .line 14
    .line 15
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageReference;->type:Ljava/lang/String;

    .line 16
    .line 17
    iget-object p0, p0, Ll/y500;->a:Ljava/lang/String;

    .line 18
    .line 19
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/MessageReference;->id:Ljava/lang/String;

    .line 20
    .line 21
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->api_only_reference:Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 22
    .line 23
    return-void
.end method

.method public e(ILjava/lang/String;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p2}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_4

    .line 16
    .line 17
    sget p1, Lcom/p1/mobile/putong/core/R$string;->ai:I

    .line 18
    .line 19
    invoke-static {p1, p0}, Ll/o0b0;->h(ILcom/p1/mobile/putong/data/User;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const/4 p2, 0x1

    .line 24
    if-ne p1, p2, :cond_1

    .line 25
    .line 26
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_4

    .line 31
    .line 32
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Th:I

    .line 33
    .line 34
    invoke-static {p1, p0}, Ll/o0b0;->h(ILcom/p1/mobile/putong/data/User;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    const/4 p2, 0x2

    .line 39
    if-ne p1, p2, :cond_2

    .line 40
    .line 41
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->startJailedDialogLikeAct()V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_2
    const/4 p2, 0x3

    .line 50
    if-ne p1, p2, :cond_3

    .line 51
    .line 52
    invoke-static {p3}, Ll/qtk;->T0(Lcom/p1/mobile/android/app/Act;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_3
    const/4 p2, 0x4

    .line 57
    if-ne p1, p2, :cond_4

    .line 58
    .line 59
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-eqz p1, :cond_4

    .line 64
    .line 65
    sget p1, Lcom/p1/mobile/putong/core/R$string;->qj:I

    .line 66
    .line 67
    invoke-static {p1, p0}, Ll/o0b0;->h(ILcom/p1/mobile/putong/data/User;)V

    .line 68
    .line 69
    .line 70
    :cond_4
    return-void
.end method

.method public f(Ll/bp00;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/bp00;->k0()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p0}, Ll/bp00;->n0(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/bp00;->t0()V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public g(Ljava/lang/String;Ll/pp00;)V
    .locals 0

    .line 1
    iget-object p0, p2, Ll/pp00;->d:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p2, Ll/pp00;->c:Landroid/widget/TextView;

    .line 8
    .line 9
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p2, Ll/pp00;->m:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 13
    .line 14
    const-string p1, "\u53d1\u6d88\u606f"

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public h(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Ll/y500;->b:J

    .line 6
    .line 7
    return-void
.end method

.method public i(Ll/bp00;Lcom/p1/mobile/putong/core/data/Message;)Z
    .locals 8

    .line 1
    const-string v0, "match_state"

    .line 2
    .line 3
    iput-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->fromConvType:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/bp00;->k0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v4

    .line 9
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    iget-wide p0, p0, Ll/y500;->b:J

    .line 14
    .line 15
    sub-long v6, v0, p0

    .line 16
    .line 17
    const-string v2, "p_other_state"

    .line 18
    .line 19
    const-string v3, ""

    .line 20
    .line 21
    const/4 v5, 0x0

    .line 22
    move-object v1, p2

    .line 23
    invoke-static/range {v1 .. v7}, Ll/m600;->g(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IJ)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    return p0
.end method
