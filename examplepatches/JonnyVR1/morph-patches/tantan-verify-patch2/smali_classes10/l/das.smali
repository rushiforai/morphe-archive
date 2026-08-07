.class public Ll/das;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/aas;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VDraweeView;

.field public c:Lv/VText;

.field public d:Landroid/widget/TextView;

.field public e:Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

.field public f:Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

.field public g:Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

.field public h:Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

.field public i:Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

.field public j:Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

.field public k:Landroid/widget/LinearLayout;

.field public l:Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

.field public m:Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

.field public n:Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

.field public o:Landroid/widget/LinearLayout;

.field public p:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/view/multiple/LiveMarqueeTextView;

.field public q:Lv/VImage;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private c(Lcom/p1/mobile/putong/live/base/data/BLiveSummary;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/das;->e:Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

    .line 2
    .line 3
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->duration:J

    .line 4
    .line 5
    const-wide/16 v3, 0x3e8

    .line 6
    .line 7
    mul-long/2addr v1, v3

    .line 8
    invoke-static {v1, v2}, Ll/kdu;->W(J)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;->setValueText(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->rewardPoint:D

    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/yau;->c(D)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Ll/p6s;->s0()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    new-instance v1, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v0, "\u4eba\u6c14\u503c"

    .line 40
    .line 41
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    goto :goto_0

    .line 49
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string v0, "\u5fc3\u52a8"

    .line 58
    .line 59
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    :goto_0
    iget-object v1, p0, Ll/das;->d:Landroid/widget/TextView;

    .line 67
    .line 68
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/das;->f:Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

    .line 72
    .line 73
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->audienceCount:D

    .line 74
    .line 75
    invoke-static {v1, v2}, Ll/yau;->c(D)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;->setValueText(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Ll/das;->g:Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

    .line 83
    .line 84
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->newFollowCount:D

    .line 85
    .line 86
    invoke-static {v1, v2}, Ll/yau;->c(D)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;->setValueText(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Ll/das;->i:Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

    .line 94
    .line 95
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->rewarderCount:D

    .line 96
    .line 97
    invoke-static {v1, v2}, Ll/yau;->c(D)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;->setValueText(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Ll/das;->j:Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

    .line 105
    .line 106
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->chatMsgCount:I

    .line 107
    .line 108
    int-to-double v1, v1

    .line 109
    invoke-static {v1, v2}, Ll/yau;->c(D)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;->setValueText(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Ll/das;->h:Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

    .line 117
    .line 118
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->newFanbaseCount:I

    .line 119
    .line 120
    int-to-double v1, v1

    .line 121
    invoke-static {v1, v2}, Ll/yau;->c(D)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;->setValueText(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    iget-object v0, p0, Ll/das;->o:Landroid/widget/LinearLayout;

    .line 129
    .line 130
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->riseDirection:Ljava/lang/String;

    .line 131
    .line 132
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    const/4 v2, 0x1

    .line 137
    xor-int/2addr v1, v2

    .line 138
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 139
    .line 140
    .line 141
    iget-object v0, p0, Ll/das;->p:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/view/multiple/LiveMarqueeTextView;

    .line 142
    .line 143
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->riseDirection:Ljava/lang/String;

    .line 144
    .line 145
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 146
    .line 147
    .line 148
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->officialShowSummary:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowSummary;

    .line 149
    .line 150
    iget-object v1, p0, Ll/das;->k:Landroid/widget/LinearLayout;

    .line 151
    .line 152
    if-eqz v0, :cond_1

    .line 153
    .line 154
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 155
    .line 156
    .line 157
    iget-object v0, p0, Ll/das;->l:Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

    .line 158
    .line 159
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->officialShowSummary:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowSummary;

    .line 160
    .line 161
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowSummary;->audienceCount:I

    .line 162
    .line 163
    int-to-double v1, v1

    .line 164
    invoke-static {v1, v2}, Ll/yau;->c(D)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;->setValueText(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    iget-object v0, p0, Ll/das;->m:Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

    .line 172
    .line 173
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->officialShowSummary:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowSummary;

    .line 174
    .line 175
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowSummary;->newFollowCount:I

    .line 176
    .line 177
    int-to-double v1, v1

    .line 178
    invoke-static {v1, v2}, Ll/yau;->c(D)Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;->setValueText(Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    iget-object p0, p0, Ll/das;->n:Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

    .line 186
    .line 187
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->officialShowSummary:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowSummary;

    .line 188
    .line 189
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowSummary;->rewarderCount:I

    .line 190
    .line 191
    int-to-double v0, p1

    .line 192
    invoke-static {v0, v1}, Ll/yau;->c(D)Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object p1

    .line 196
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;->setValueText(Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    return-void

    .line 200
    :cond_1
    const/4 p0, 0x0

    .line 201
    invoke-static {v1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 202
    .line 203
    .line 204
    return-void
.end method

.method private f(Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/das;->c:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/das;->b:Lv/VDraweeView;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 15
    .line 16
    const/high16 v2, 0x42a00000    # 80.0f

    .line 17
    .line 18
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    const-string v3, "context_livingAct"

    .line 23
    .line 24
    invoke-static {v3, v0, v1, v2}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/das;->a:Lv/VDraweeView;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 34
    .line 35
    const/high16 v0, 0x41a00000    # 20.0f

    .line 36
    .line 37
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    const/4 v1, 0x1

    .line 42
    invoke-static {v3, p0, p1, v1, v0}, Ll/izs;->p(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 43
    .line 44
    .line 45
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public b(Ll/aas;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveSummary;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/das;->f(Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p2}, Ll/das;->c(Lcom/p1/mobile/putong/live/base/data/BLiveSummary;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p2}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->o2:I

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Dialog$e;->u0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object p0, p0, Ll/das;->q:Lv/VImage;

    .line 29
    .line 30
    new-instance p2, Ll/cas;

    .line 31
    .line 32
    invoke-direct {p2, p1}, Ll/cas;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/aas;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/das;->b(Ll/aas;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4

    .line 1
    sget v0, Ll/yec0;->I0:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    sget p2, Ll/mdc0;->D2:I

    .line 9
    .line 10
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    check-cast p2, Lv/VDraweeView;

    .line 15
    .line 16
    iput-object p2, p0, Ll/das;->a:Lv/VDraweeView;

    .line 17
    .line 18
    sget p2, Ll/mdc0;->t:I

    .line 19
    .line 20
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    check-cast p2, Lv/VDraweeView;

    .line 25
    .line 26
    iput-object p2, p0, Ll/das;->b:Lv/VDraweeView;

    .line 27
    .line 28
    sget p2, Ll/mdc0;->k:I

    .line 29
    .line 30
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    check-cast p2, Lv/VText;

    .line 35
    .line 36
    iput-object p2, p0, Ll/das;->c:Lv/VText;

    .line 37
    .line 38
    sget p2, Ll/mdc0;->i5:I

    .line 39
    .line 40
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    check-cast p2, Landroid/widget/TextView;

    .line 45
    .line 46
    iput-object p2, p0, Ll/das;->d:Landroid/widget/TextView;

    .line 47
    .line 48
    sget p2, Ll/mdc0;->h1:I

    .line 49
    .line 50
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    check-cast p2, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

    .line 55
    .line 56
    iput-object p2, p0, Ll/das;->e:Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

    .line 57
    .line 58
    sget p2, Ll/mdc0;->W7:I

    .line 59
    .line 60
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    check-cast p2, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

    .line 65
    .line 66
    iput-object p2, p0, Ll/das;->f:Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

    .line 67
    .line 68
    sget p2, Ll/mdc0;->h4:I

    .line 69
    .line 70
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    check-cast p2, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

    .line 75
    .line 76
    iput-object p2, p0, Ll/das;->g:Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

    .line 77
    .line 78
    sget p2, Ll/mdc0;->g4:I

    .line 79
    .line 80
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    check-cast p2, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

    .line 85
    .line 86
    iput-object p2, p0, Ll/das;->h:Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

    .line 87
    .line 88
    sget p2, Ll/mdc0;->t4:I

    .line 89
    .line 90
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    check-cast p2, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

    .line 95
    .line 96
    iput-object p2, p0, Ll/das;->i:Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

    .line 97
    .line 98
    sget p2, Ll/mdc0;->K2:I

    .line 99
    .line 100
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 101
    .line 102
    .line 103
    move-result-object p2

    .line 104
    check-cast p2, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

    .line 105
    .line 106
    iput-object p2, p0, Ll/das;->j:Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

    .line 107
    .line 108
    sget p2, Ll/mdc0;->u4:I

    .line 109
    .line 110
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    check-cast p2, Landroid/widget/LinearLayout;

    .line 115
    .line 116
    iput-object p2, p0, Ll/das;->k:Landroid/widget/LinearLayout;

    .line 117
    .line 118
    sget p2, Ll/mdc0;->q:I

    .line 119
    .line 120
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 121
    .line 122
    .line 123
    move-result-object p2

    .line 124
    check-cast p2, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

    .line 125
    .line 126
    iput-object p2, p0, Ll/das;->l:Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

    .line 127
    .line 128
    sget p2, Ll/mdc0;->v4:I

    .line 129
    .line 130
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 131
    .line 132
    .line 133
    move-result-object p2

    .line 134
    check-cast p2, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

    .line 135
    .line 136
    iput-object p2, p0, Ll/das;->m:Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

    .line 137
    .line 138
    sget p2, Ll/mdc0;->q5:I

    .line 139
    .line 140
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 141
    .line 142
    .line 143
    move-result-object p2

    .line 144
    check-cast p2, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

    .line 145
    .line 146
    iput-object p2, p0, Ll/das;->n:Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

    .line 147
    .line 148
    sget p2, Ll/mdc0;->H2:I

    .line 149
    .line 150
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 151
    .line 152
    .line 153
    move-result-object p2

    .line 154
    check-cast p2, Landroid/widget/LinearLayout;

    .line 155
    .line 156
    iput-object p2, p0, Ll/das;->o:Landroid/widget/LinearLayout;

    .line 157
    .line 158
    sget p2, Ll/mdc0;->I2:I

    .line 159
    .line 160
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 161
    .line 162
    .line 163
    move-result-object p2

    .line 164
    check-cast p2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/view/multiple/LiveMarqueeTextView;

    .line 165
    .line 166
    iput-object p2, p0, Ll/das;->p:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/view/multiple/LiveMarqueeTextView;

    .line 167
    .line 168
    sget p2, Ll/mdc0;->y0:I

    .line 169
    .line 170
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 171
    .line 172
    .line 173
    move-result-object p2

    .line 174
    check-cast p2, Lv/VImage;

    .line 175
    .line 176
    iput-object p2, p0, Ll/das;->q:Lv/VImage;

    .line 177
    .line 178
    iget-object p2, p0, Ll/das;->e:Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

    .line 179
    .line 180
    const-string v0, "\u76f4\u64ad\u65f6\u957f"

    .line 181
    .line 182
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;->setTagText(Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    iget-object p2, p0, Ll/das;->f:Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

    .line 186
    .line 187
    const-string v0, "\u89c2\u770b\u4eba\u6570"

    .line 188
    .line 189
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;->setTagText(Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    iget-object p2, p0, Ll/das;->g:Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

    .line 193
    .line 194
    const-string v1, "\u65b0\u589e\u7c89\u4e1d"

    .line 195
    .line 196
    invoke-virtual {p2, v1}, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;->setTagText(Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    iget-object p2, p0, Ll/das;->h:Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

    .line 200
    .line 201
    const-string v2, "\u7c89\u4e1d\u56e2\u65b0\u589e"

    .line 202
    .line 203
    invoke-virtual {p2, v2}, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;->setTagText(Ljava/lang/String;)V

    .line 204
    .line 205
    .line 206
    iget-object p2, p0, Ll/das;->i:Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

    .line 207
    .line 208
    const-string v2, "\u9001\u793c\u4eba\u6570"

    .line 209
    .line 210
    invoke-virtual {p2, v2}, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;->setTagText(Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    iget-object p2, p0, Ll/das;->j:Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

    .line 214
    .line 215
    const-string v3, "\u4e92\u52a8\u6b21\u6570"

    .line 216
    .line 217
    invoke-virtual {p2, v3}, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;->setTagText(Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    iget-object p2, p0, Ll/das;->l:Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

    .line 221
    .line 222
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;->setTagText(Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    iget-object p2, p0, Ll/das;->m:Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

    .line 226
    .line 227
    invoke-virtual {p2, v1}, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;->setTagText(Ljava/lang/String;)V

    .line 228
    .line 229
    .line 230
    iget-object p0, p0, Ll/das;->n:Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;

    .line 231
    .line 232
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndDataItemView;->setTagText(Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    return-object p1
.end method
