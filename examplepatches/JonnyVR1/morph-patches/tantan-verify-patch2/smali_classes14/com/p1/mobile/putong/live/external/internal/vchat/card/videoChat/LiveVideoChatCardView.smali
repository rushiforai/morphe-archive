.class public Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatStatusView;

.field public b:Lv/VDraweeView;

.field public c:Landroid/widget/TextView;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/view/View;

.field public g:Landroid/widget/LinearLayout;

.field public h:Landroid/widget/TextView;

.field public i:Lv/VDraweeView;

.field public j:Landroid/widget/LinearLayout;

.field public k:Landroid/widget/TextView;

.field public l:Lv/VDraweeView;

.field public m:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
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
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;Ll/lwu$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->d(Ll/lwu$b;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;Ll/lwu;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->c(Ll/lwu;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final synthetic c(Ll/lwu;Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance p2, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "source"

    .line 7
    .line 8
    const-string v1, "square"

    .line 9
    .line 10
    invoke-virtual {p2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Ll/lwu;->d()Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;->setGoExtra(Ljava/util/Map;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p1}, Ll/lwu;->d()Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-static {p0, p2}, Ll/yrs;->a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1}, Ll/lwu;->l()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/apibean/LiveCardTracker;->trackMc(Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic d(Ll/lwu$b;)V
    .locals 3

    .line 1
    new-instance v0, Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p1, Ll/lwu$b;->text:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p1, Ll/lwu$b;->textColor:Ljava/lang/String;

    .line 16
    .line 17
    const/4 v2, -0x1

    .line 18
    invoke-static {v1, v2}, Ll/n3d0;->h(Ljava/lang/String;I)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 23
    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    const/high16 v2, 0x41300000    # 11.0f

    .line 27
    .line 28
    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p1, Ll/lwu$b;->background:Ljava/lang/String;

    .line 32
    .line 33
    const-string v1, "#666666"

    .line 34
    .line 35
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-static {p1, v1}, Ll/n3d0;->h(Ljava/lang/String;I)I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 44
    .line 45
    .line 46
    sget p1, Ll/qa00;->g:I

    .line 47
    .line 48
    invoke-static {v0, p1}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 49
    .line 50
    .line 51
    sget v1, Ll/qa00;->d:I

    .line 52
    .line 53
    sget v2, Ll/qa00;->c:I

    .line 54
    .line 55
    invoke-virtual {v0, p1, v1, p1, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 56
    .line 57
    .line 58
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 59
    .line 60
    sget v1, Ll/bnl0;->f:I

    .line 61
    .line 62
    invoke-direct {p1, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 63
    .line 64
    .line 65
    sget v1, Ll/qa00;->h:I

    .line 66
    .line 67
    iput v1, p1, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 68
    .line 69
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->j:Landroid/widget/LinearLayout;

    .line 70
    .line 71
    invoke-virtual {p0, v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public e(Ll/lwu;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatStatusView;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/lwu;->h()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatStatusView;->setStatus(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->b:Lv/VDraweeView;

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/lwu;->b()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const-string v2, "context_square"

    .line 17
    .line 18
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->c:Landroid/widget/TextView;

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/lwu;->k()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Ll/lwu;->i()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->d:Landroid/widget/TextView;

    .line 39
    .line 40
    const/4 v2, 0x1

    .line 41
    const/4 v3, 0x0

    .line 42
    if-eqz v0, :cond_0

    .line 43
    .line 44
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->d:Landroid/widget/TextView;

    .line 52
    .line 53
    invoke-virtual {p1}, Ll/lwu;->i()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    :goto_0
    invoke-virtual {p1}, Ll/lwu;->c()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-eqz v1, :cond_1

    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->e:Landroid/widget/TextView;

    .line 71
    .line 72
    invoke-virtual {p1}, Ll/lwu;->g()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->k:Landroid/widget/TextView;

    .line 80
    .line 81
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 82
    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->k:Landroid/widget/TextView;

    .line 86
    .line 87
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 88
    .line 89
    .line 90
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->e:Landroid/widget/TextView;

    .line 91
    .line 92
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->k:Landroid/widget/TextView;

    .line 96
    .line 97
    invoke-virtual {p1}, Ll/lwu;->g()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->k:Landroid/widget/TextView;

    .line 105
    .line 106
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaintFlags()I

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    or-int/lit8 v1, v1, 0x10

    .line 111
    .line 112
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setPaintFlags(I)V

    .line 113
    .line 114
    .line 115
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->f:Landroid/view/View;

    .line 116
    .line 117
    new-instance v1, Ll/mwu;

    .line 118
    .line 119
    invoke-direct {v1, p0, p1}, Ll/mwu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;Ll/lwu;)V

    .line 120
    .line 121
    .line 122
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p1}, Ll/lwu;->l()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    const-string v1, "index"

    .line 130
    .line 131
    invoke-virtual {v0, v1}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-virtual {p1}, Ll/lwu;->l()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    const-string v2, "anchorId"

    .line 144
    .line 145
    invoke-virtual {v1, v2}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    filled-new-array {v0, v1}, [Ll/pf60;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    const-string v1, "e_live_video_quickchat_profile_enter"

    .line 158
    .line 159
    const-string v2, "p_live_video_quickchat"

    .line 160
    .line 161
    invoke-static {v1, v2, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {p1}, Ll/lwu;->f()Ll/lwu$a;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->f(Ll/lwu$a;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {p1}, Ll/lwu;->j()Ljava/util/ArrayList;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->h(Ljava/util/ArrayList;)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {p1}, Ll/lwu;->e()Lcom/p1/mobile/putong/live/base/apibean/LiveCardIntimacy;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->g(Lcom/p1/mobile/putong/live/base/apibean/LiveCardIntimacy;)V

    .line 183
    .line 184
    .line 185
    return-void
.end method

.method public final f(Ll/lwu$a;)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_3

    .line 3
    .line 4
    iget-object v1, p1, Ll/lwu$a;->text:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    goto :goto_2

    .line 13
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->g:Landroid/widget/LinearLayout;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p1, Ll/lwu$a;->icon:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->i:Lv/VDraweeView;

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-static {v3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->h:Landroid/widget/TextView;

    .line 33
    .line 34
    const/high16 v3, 0x40c00000    # 6.0f

    .line 35
    .line 36
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    invoke-static {v1, v3}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->i:Lv/VDraweeView;

    .line 48
    .line 49
    iget-object v3, p1, Ll/lwu$a;->icon:Ljava/lang/String;

    .line 50
    .line 51
    const-string v4, "context_square"

    .line 52
    .line 53
    invoke-static {v4, v1, v3}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->h:Landroid/widget/TextView;

    .line 57
    .line 58
    invoke-static {v1, v0}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 59
    .line 60
    .line 61
    :goto_0
    iget-object v1, p1, Ll/lwu$a;->background:Ljava/util/List;

    .line 62
    .line 63
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    const/4 v3, 0x6

    .line 68
    if-nez v1, :cond_2

    .line 69
    .line 70
    iget-object v1, p1, Ll/lwu$a;->background:Ljava/util/List;

    .line 71
    .line 72
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;->z(Ljava/util/List;I)I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    iget-object v1, p1, Ll/lwu$a;->background:Ljava/util/List;

    .line 77
    .line 78
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;->z(Ljava/util/List;I)I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    sget-object v2, Landroid/graphics/drawable/GradientDrawable$Orientation;->TL_BR:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 83
    .line 84
    invoke-static {v0, v1, v3, v2}, Ll/fc2;->k(IIILandroid/graphics/drawable/GradientDrawable$Orientation;)Landroid/graphics/drawable/GradientDrawable;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    goto :goto_1

    .line 89
    :cond_2
    sget v0, Ll/l9c0;->a:I

    .line 90
    .line 91
    invoke-static {v0}, Ll/n3d0;->a(I)I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    invoke-static {v0, v3}, Ll/fc2;->i(II)Landroid/graphics/drawable/GradientDrawable;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->h:Landroid/widget/TextView;

    .line 100
    .line 101
    iget-object p1, p1, Ll/lwu$a;->text:Ljava/lang/String;

    .line 102
    .line 103
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 104
    .line 105
    .line 106
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->g:Landroid/widget/LinearLayout;

    .line 107
    .line 108
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_3
    :goto_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->g:Landroid/widget/LinearLayout;

    .line 113
    .line 114
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public final g(Lcom/p1/mobile/putong/live/base/apibean/LiveCardIntimacy;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/LiveCardIntimacy;->getIcon()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_2

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->m:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 14
    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->l:Lv/VDraweeView;

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/LiveCardIntimacy;->getIcon()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Ll/n3d0;->e(Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->l:Lv/VDraweeView;

    .line 31
    .line 32
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->m:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 36
    .line 37
    xor-int/lit8 v2, v0, 0x1

    .line 38
    .line 39
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->l:Lv/VDraweeView;

    .line 45
    .line 46
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/LiveCardIntimacy;->getIcon()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    const-string v0, "context_square"

    .line 51
    .line 52
    invoke-static {v0, p0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->m:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 57
    .line 58
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/LiveCardIntimacy;->getIcon()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    const/4 v0, -0x1

    .line 63
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 64
    .line 65
    .line 66
    :cond_2
    :goto_0
    return-void
.end method

.method public final h(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ll/lwu$b;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->j:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    new-instance v0, Ll/nwu;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/nwu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->m:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->m:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->o()V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->l:Lv/VDraweeView;

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/ldc0;->z1:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatStatusView;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatStatusView;

    .line 13
    .line 14
    sget v0, Ll/ldc0;->S:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lv/VDraweeView;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->b:Lv/VDraweeView;

    .line 23
    .line 24
    sget v0, Ll/ldc0;->R1:I

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->c:Landroid/widget/TextView;

    .line 33
    .line 34
    sget v0, Ll/ldc0;->B1:I

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->d:Landroid/widget/TextView;

    .line 43
    .line 44
    sget v0, Ll/ldc0;->z:I

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Landroid/widget/TextView;

    .line 51
    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->e:Landroid/widget/TextView;

    .line 53
    .line 54
    sget v0, Ll/ldc0;->m0:I

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->f:Landroid/view/View;

    .line 61
    .line 62
    sget v0, Ll/ldc0;->M:I

    .line 63
    .line 64
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Landroid/widget/LinearLayout;

    .line 69
    .line 70
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->g:Landroid/widget/LinearLayout;

    .line 71
    .line 72
    sget v0, Ll/ldc0;->b:I

    .line 73
    .line 74
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    check-cast v0, Landroid/widget/TextView;

    .line 79
    .line 80
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->h:Landroid/widget/TextView;

    .line 81
    .line 82
    sget v0, Ll/ldc0;->a:I

    .line 83
    .line 84
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    check-cast v0, Lv/VDraweeView;

    .line 89
    .line 90
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->i:Lv/VDraweeView;

    .line 91
    .line 92
    sget v0, Ll/ldc0;->O1:I

    .line 93
    .line 94
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    check-cast v0, Landroid/widget/LinearLayout;

    .line 99
    .line 100
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->j:Landroid/widget/LinearLayout;

    .line 101
    .line 102
    sget v0, Ll/ldc0;->b0:I

    .line 103
    .line 104
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    check-cast v0, Landroid/widget/TextView;

    .line 109
    .line 110
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->k:Landroid/widget/TextView;

    .line 111
    .line 112
    sget v0, Ll/ldc0;->U0:I

    .line 113
    .line 114
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    check-cast v0, Lv/VDraweeView;

    .line 119
    .line 120
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->l:Lv/VDraweeView;

    .line 121
    .line 122
    sget v0, Ll/ldc0;->T0:I

    .line 123
    .line 124
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    check-cast v0, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 129
    .line 130
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->m:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 131
    .line 132
    sget v0, Ll/qa00;->i:I

    .line 133
    .line 134
    invoke-static {p0, v0}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 135
    .line 136
    .line 137
    return-void
.end method
