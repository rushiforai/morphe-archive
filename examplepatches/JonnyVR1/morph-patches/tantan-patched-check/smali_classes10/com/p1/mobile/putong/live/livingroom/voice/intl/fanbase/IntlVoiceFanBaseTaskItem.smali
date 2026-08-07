.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Landroid/widget/TextView;

.field public c:Landroid/widget/TextView;

.field public d:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Ll/xup;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xup;->f4()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, p1, v0}, Ll/xup;->m4(Ljava/lang/String;Z)V

    .line 7
    .line 8
    .line 9
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Xg:I

    .line 10
    .line 11
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;Ll/xup;Ll/mvp;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseTask;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;->e(Ll/xup;Ll/mvp;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseTask;Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;)Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;->d:Landroid/widget/TextView;

    return-object p0
.end method


# virtual methods
.method public final d(Ll/xup;Ll/mvp;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseTask;)V
    .locals 9

    .line 1
    const-string p2, "sign"

    .line 2
    .line 3
    iget-object v0, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseTask;->taskType:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/xup;->f4()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Ll/itv;->S(Ljava/lang/String;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p1, p0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    new-instance p2, Ll/ovp;

    .line 24
    .line 25
    invoke-direct {p2, p1}, Ll/ovp;-><init>(Ll/xup;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    const-string p2, "sendGift"

    .line 37
    .line 38
    iget-object v0, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseTask;->taskType:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    if-eqz p2, :cond_1

    .line 45
    .line 46
    invoke-virtual {p1}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;->handleScheme()Ll/v3f$d;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    new-instance p2, Ll/bae0$a;

    .line 57
    .line 58
    const/16 v0, 0x1b59

    .line 59
    .line 60
    invoke-direct {p2, v0}, Ll/bae0$a;-><init>(I)V

    .line 61
    .line 62
    .line 63
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseTask;->schema:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {p2, p3}, Ll/bae0$a;->e(Ljava/lang/String;)Ll/bae0$a;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    invoke-virtual {p2}, Ll/bae0$a;->c()Ll/bae0;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    invoke-virtual {p0, p2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1}, Ll/xup;->d4()V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_1
    const-string p2, "sendTicket"

    .line 81
    .line 82
    iget-object v0, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseTask;->taskType:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result p2

    .line 88
    if-eqz p2, :cond_2

    .line 89
    .line 90
    iget-object p2, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseTask;->schema:Ljava/lang/String;

    .line 91
    .line 92
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    const-string p3, "giftId"

    .line 97
    .line 98
    invoke-virtual {p2, p3}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    const-string p3, "toUserId"

    .line 103
    .line 104
    invoke-virtual {p2, p3}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v7

    .line 108
    const-string p3, "sendConfirm"

    .line 109
    .line 110
    const/4 v0, 0x0

    .line 111
    invoke-virtual {p2, p3, v0}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    .line 112
    .line 113
    .line 114
    move-result p2

    .line 115
    invoke-virtual {p1}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 116
    .line 117
    .line 118
    move-result-object p3

    .line 119
    iget-object p3, p3, Lcom/tantan/live/eventbus/LiveEventBus;->SendGiftEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;

    .line 120
    .line 121
    invoke-virtual {p3}, Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;->sendGift()Ll/v3f$d;

    .line 122
    .line 123
    .line 124
    move-result-object p3

    .line 125
    new-instance v0, Ll/hne0$a;

    .line 126
    .line 127
    invoke-direct {v0}, Ll/hne0$a;-><init>()V

    .line 128
    .line 129
    .line 130
    new-instance v2, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem$a;

    .line 131
    .line 132
    invoke-direct {v2, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;Ll/xup;)V

    .line 133
    .line 134
    .line 135
    const-string p0, "fans"

    .line 136
    .line 137
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->getNativeTraceServerData(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 142
    .line 143
    .line 144
    move-result-object v6

    .line 145
    const-string v8, "source_voice_fan_base"

    .line 146
    .line 147
    const/4 v3, 0x1

    .line 148
    const-string v4, "fans_club"

    .line 149
    .line 150
    const-string v5, "send_ticket"

    .line 151
    .line 152
    invoke-virtual/range {v0 .. v8}, Ll/hne0$a;->v(Ljava/lang/String;Ll/aiv$a$a;ILjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;Ljava/lang/String;Ljava/lang/String;)Ll/hne0$a;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-virtual {p0, p2}, Ll/hne0$a;->A(Z)Ll/hne0$a;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    invoke-virtual {p0}, Ll/hne0$a;->t()Ll/hne0;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    invoke-virtual {p3, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 165
    .line 166
    .line 167
    :cond_2
    return-void
.end method

.method public final synthetic e(Ll/xup;Ll/mvp;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseTask;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;->d(Ll/xup;Ll/mvp;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseTask;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f(Ll/xup;Ll/mvp;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseTask;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;->b:Landroid/widget/TextView;

    .line 2
    .line 3
    iget-object v1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseTask;->title:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;->c:Landroid/widget/TextView;

    .line 9
    .line 10
    iget-object v1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseTask;->desc:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    iget-boolean v0, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseTask;->finish:Z

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;->d:Landroid/widget/TextView;

    .line 18
    .line 19
    const-string v2, "sendTicket"

    .line 20
    .line 21
    const-string v3, "sign"

    .line 22
    .line 23
    const/4 v4, 0x0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Eg:I

    .line 27
    .line 28
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(I)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;->d:Landroid/widget/TextView;

    .line 32
    .line 33
    const/4 p2, 0x0

    .line 34
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setSelected(Z)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;->d:Landroid/widget/TextView;

    .line 38
    .line 39
    invoke-static {p1, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_0
    const/4 v0, 0x1

    .line 44
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setSelected(Z)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseTask;->taskType:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;->d:Landroid/widget/TextView;

    .line 56
    .line 57
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Wg:I

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    iget-object v0, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseTask;->taskType:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;->d:Landroid/widget/TextView;

    .line 70
    .line 71
    if-eqz v0, :cond_2

    .line 72
    .line 73
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Kg:I

    .line 74
    .line 75
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_2
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Mg:I

    .line 80
    .line 81
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 82
    .line 83
    .line 84
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;->d:Landroid/widget/TextView;

    .line 85
    .line 86
    new-instance v1, Ll/nvp;

    .line 87
    .line 88
    invoke-direct {v1, p0, p1, p2, p3}, Ll/nvp;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;Ll/xup;Ll/mvp;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseTask;)V

    .line 89
    .line 90
    .line 91
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 92
    .line 93
    .line 94
    :goto_1
    iget-object p1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseTask;->taskType:Ljava/lang/String;

    .line 95
    .line 96
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    if-eqz p1, :cond_3

    .line 101
    .line 102
    const-string v4, "https://auto.tancdn.com/v1/images/eyJpZCI6IkVSQzdNRTdMQzc2NU0zRjZHNkRWMkRUREU1QVRHUjE0IiwidyI6MTY4LCJoIjoxNjgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMDg1MTEyMDkwOTQzNDkxODU1fQ.png"

    .line 103
    .line 104
    goto :goto_2

    .line 105
    :cond_3
    const-string p1, "sendGift"

    .line 106
    .line 107
    iget-object p2, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseTask;->taskType:Ljava/lang/String;

    .line 108
    .line 109
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    if-eqz p1, :cond_4

    .line 114
    .line 115
    const-string v4, "https://auto.tancdn.com/v1/images/eyJpZCI6IkQ0VktIRklHT1Y1R0E2V1ZZU0M2SUNFQ1dWTUYzTDE0IiwidyI6MTY4LCJoIjoxNjgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxNjY5NTIyMjc2OTMyNTg3Mjc5fQ.png"

    .line 116
    .line 117
    goto :goto_2

    .line 118
    :cond_4
    iget-object p1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseTask;->taskType:Ljava/lang/String;

    .line 119
    .line 120
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    if-eqz p1, :cond_5

    .line 125
    .line 126
    const-string v4, "https://auto.tancdn.com/v1/images/eyJpZCI6IlhGSjI1WExZV09EWDdXNDVERkc3UlMzSkkyMlRQTzE0IiwidyI6MTY4LCJoIjoxNjgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMDg1MTAzMjkzMjU2NjM2MTc1fQ.png"

    .line 127
    .line 128
    :cond_5
    :goto_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;->a:Lv/VDraweeView;

    .line 129
    .line 130
    sget p1, Ll/qa00;->E:I

    .line 131
    .line 132
    const-string p2, "context_livingAct"

    .line 133
    .line 134
    invoke-static {p2, p0, v4, p1}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 135
    .line 136
    .line 137
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/mdc0;->B6:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VDraweeView;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;->a:Lv/VDraweeView;

    .line 13
    .line 14
    sget v0, Ll/mdc0;->F6:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Landroid/widget/TextView;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;->b:Landroid/widget/TextView;

    .line 23
    .line 24
    sget v0, Ll/mdc0;->A6:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Landroid/widget/TextView;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;->c:Landroid/widget/TextView;

    .line 33
    .line 34
    sget v0, Ll/mdc0;->z6:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Landroid/widget/TextView;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;->d:Landroid/widget/TextView;

    .line 43
    .line 44
    return-void
.end method
