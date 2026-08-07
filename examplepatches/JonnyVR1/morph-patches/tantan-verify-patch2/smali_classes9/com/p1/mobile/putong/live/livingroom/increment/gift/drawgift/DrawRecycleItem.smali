.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;

.field public b:Lv/VDraweeView;

.field public c:Lv/VLinear;

.field public d:Lv/VDraweeView;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lv/VLinear;

.field public h:Lv/VDraweeView;

.field public i:Lv/VText;

.field public j:Lv/VText;

.field public k:Landroid/widget/TextView;

.field public l:Ll/x20;

.field public m:Ll/x20;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;->l:Ll/x20;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;->m:Ll/x20;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;->l:Ll/x20;

    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;->m:Ll/x20;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;->l:Ll/x20;

    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;->m:Ll/x20;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;->d(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;->e(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jce;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic d(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;->l:Ll/x20;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final synthetic e(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;->m:Ll/x20;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public f(Ll/qbe;)V
    .locals 7

    .line 1
    iget-object v0, p1, Ll/qbe;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    iget-boolean v1, p1, Ll/qbe;->b:Z

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;->c:Lv/VLinear;

    .line 6
    .line 7
    const-string v3, "%s\u63a2\u63a2\u5e01"

    .line 8
    .line 9
    const-string v4, "context_livingAct"

    .line 10
    .line 11
    const/4 v5, 0x1

    .line 12
    const/4 v6, 0x0

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    invoke-static {v2, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;->g:Lv/VLinear;

    .line 19
    .line 20
    invoke-static {v1, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;->b:Lv/VDraweeView;

    .line 24
    .line 25
    sget-object v2, Ll/zft;->s:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v4, v1, v2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget p1, p1, Ll/qbe;->d:I

    .line 31
    .line 32
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v1}, Ll/vwt;->g4()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;->k:Landroid/widget/TextView;

    .line 41
    .line 42
    if-lt p1, v1, :cond_0

    .line 43
    .line 44
    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;->k:Landroid/widget/TextView;

    .line 48
    .line 49
    const/4 v1, -0x1

    .line 50
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;->k:Landroid/widget/TextView;

    .line 54
    .line 55
    sget v1, Ll/obc0;->A0:I

    .line 56
    .line 57
    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_0
    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;->k:Landroid/widget/TextView;

    .line 65
    .line 66
    const v1, -0x7f000001

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;->k:Landroid/widget/TextView;

    .line 73
    .line 74
    sget v1, Ll/obc0;->W0:I

    .line 75
    .line 76
    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 77
    .line 78
    .line 79
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;->h:Lv/VDraweeView;

    .line 80
    .line 81
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->url:Ljava/lang/String;

    .line 82
    .line 83
    invoke-static {v4, p1, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;->i:Lv/VText;

    .line 87
    .line 88
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getLocalName()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    .line 94
    .line 95
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;->j:Lv/VText;

    .line 96
    .line 97
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getPrice()J

    .line 98
    .line 99
    .line 100
    move-result-wide v0

    .line 101
    long-to-double v0, v0

    .line 102
    invoke-static {v0, v1}, Ll/a9g0;->d(D)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-static {v3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 115
    .line 116
    .line 117
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;->k:Landroid/widget/TextView;

    .line 118
    .line 119
    new-instance v0, Ll/hce;

    .line 120
    .line 121
    invoke-direct {v0, p0}, Ll/hce;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 125
    .line 126
    .line 127
    goto :goto_1

    .line 128
    :cond_1
    invoke-static {v2, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 129
    .line 130
    .line 131
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;->g:Lv/VLinear;

    .line 132
    .line 133
    invoke-static {p1, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 134
    .line 135
    .line 136
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;->b:Lv/VDraweeView;

    .line 137
    .line 138
    const/4 v1, 0x0

    .line 139
    invoke-virtual {p1, v1}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 140
    .line 141
    .line 142
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;->b:Lv/VDraweeView;

    .line 143
    .line 144
    sget v1, Ll/obc0;->b1:I

    .line 145
    .line 146
    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 147
    .line 148
    .line 149
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;->d:Lv/VDraweeView;

    .line 150
    .line 151
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->url:Ljava/lang/String;

    .line 152
    .line 153
    invoke-static {v4, p1, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;->e:Lv/VText;

    .line 157
    .line 158
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getLocalName()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 163
    .line 164
    .line 165
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;->f:Lv/VText;

    .line 166
    .line 167
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getPrice()J

    .line 168
    .line 169
    .line 170
    move-result-wide v0

    .line 171
    long-to-double v0, v0

    .line 172
    invoke-static {v0, v1}, Ll/a9g0;->d(D)Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    invoke-static {v3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 185
    .line 186
    .line 187
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;

    .line 188
    .line 189
    new-instance v0, Ll/ice;

    .line 190
    .line 191
    invoke-direct {v0, p0}, Ll/ice;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 195
    .line 196
    .line 197
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
