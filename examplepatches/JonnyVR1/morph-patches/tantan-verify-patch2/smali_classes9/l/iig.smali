.class public Ll/iig;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Landroid/view/View;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VImage;

.field public b:Lv/VDraweeView;

.field public c:Lv/VDraweeView;

.field public d:Lv/VDraweeView;

.field public e:Landroid/view/View;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Ll/kcg0;

.field public final i:Ll/ner;

.field public j:Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;

.field public k:Ll/cm0;

.field public l:Ll/q5m;


# direct methods
.method public constructor <init>(Ll/ner;Ll/q5m;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/iig;->i:Ll/ner;

    .line 5
    .line 6
    iput-object p2, p0, Ll/iig;->l:Ll/q5m;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic H(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic I(Ll/iig;Ll/ruf0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/iig;->L(Ll/ruf0;)V

    return-void
.end method

.method public static synthetic J(Ll/iig;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/iig;->N(Landroid/view/View;)V

    return-void
.end method

.method private synthetic L(Ll/ruf0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/iig;->c:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/iig;->c:Lv/VDraweeView;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public K()Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iig;->j:Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic N(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/iig;->a:Lv/VImage;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    xor-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/iig;->j:Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;

    .line 13
    .line 14
    iget-object v0, p0, Ll/iig;->a:Lv/VImage;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/View;->isSelected()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->setSelected(Z)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/iig;->l:Ll/q5m;

    .line 24
    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    invoke-interface {p1, p0}, Ll/q5m;->a(Ll/iig;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public O(Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;Ll/cm0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/iig;->j:Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;

    .line 2
    .line 3
    iput-object p2, p0, Ll/iig;->k:Ll/cm0;

    .line 4
    .line 5
    return-void
.end method

.method public m(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->P0:I

    .line 2
    .line 3
    return p0
.end method

.method public u(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/mdc0;->E5:I

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VImage;

    .line 11
    .line 12
    iput-object v0, p0, Ll/iig;->a:Lv/VImage;

    .line 13
    .line 14
    sget v0, Ll/mdc0;->t:I

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lv/VDraweeView;

    .line 21
    .line 22
    iput-object v0, p0, Ll/iig;->b:Lv/VDraweeView;

    .line 23
    .line 24
    sget v0, Ll/mdc0;->z4:I

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Ll/iig;->e:Landroid/view/View;

    .line 31
    .line 32
    sget v0, Ll/mdc0;->e4:I

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lv/VText;

    .line 39
    .line 40
    iput-object v0, p0, Ll/iig;->f:Lv/VText;

    .line 41
    .line 42
    sget v0, Ll/mdc0;->E1:I

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Lv/VDraweeView;

    .line 49
    .line 50
    iput-object v0, p0, Ll/iig;->c:Lv/VDraweeView;

    .line 51
    .line 52
    sget v0, Ll/mdc0;->Q7:I

    .line 53
    .line 54
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Lv/VDraweeView;

    .line 59
    .line 60
    iput-object v0, p0, Ll/iig;->d:Lv/VDraweeView;

    .line 61
    .line 62
    sget v0, Ll/mdc0;->b1:I

    .line 63
    .line 64
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Lv/VText;

    .line 69
    .line 70
    iput-object v0, p0, Ll/iig;->g:Lv/VText;

    .line 71
    .line 72
    iget-object v0, p0, Ll/iig;->h:Ll/kcg0;

    .line 73
    .line 74
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/iig;->b:Lv/VDraweeView;

    .line 78
    .line 79
    iget-object v1, p0, Ll/iig;->j:Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;

    .line 80
    .line 81
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->avatar:Ljava/lang/String;

    .line 82
    .line 83
    const-string v2, "context_livingAct"

    .line 84
    .line 85
    invoke-static {v2, v0, v1}, Ll/izs;->o(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Ll/iig;->e:Landroid/view/View;

    .line 89
    .line 90
    iget-object v1, p0, Ll/iig;->j:Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;

    .line 91
    .line 92
    iget-boolean v1, v1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->isOnline:Z

    .line 93
    .line 94
    const/4 v2, 0x0

    .line 95
    if-eqz v1, :cond_0

    .line 96
    .line 97
    move v1, v2

    .line 98
    goto :goto_0

    .line 99
    :cond_0
    const/16 v1, 0x8

    .line 100
    .line 101
    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Ll/iig;->f:Lv/VText;

    .line 105
    .line 106
    iget-object v1, p0, Ll/iig;->j:Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;

    .line 107
    .line 108
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->name:Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Ll/iig;->g:Lv/VText;

    .line 114
    .line 115
    iget-object v1, p0, Ll/iig;->j:Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;

    .line 116
    .line 117
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->desc:Ljava/lang/String;

    .line 118
    .line 119
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Ll/iig;->j:Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;

    .line 123
    .line 124
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->fanbaseGrade:I

    .line 125
    .line 126
    iget-object v1, p0, Ll/iig;->k:Ll/cm0;

    .line 127
    .line 128
    iget-object v1, v1, Ll/cm0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 129
    .line 130
    invoke-static {v0, v1}, Ll/vag;->h(ILcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;)Lrx/c;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    if-eqz v0, :cond_1

    .line 135
    .line 136
    iget-object v1, p0, Ll/iig;->i:Ll/ner;

    .line 137
    .line 138
    invoke-interface {v1, v0}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    new-instance v1, Ll/fig;

    .line 143
    .line 144
    invoke-direct {v1, p0}, Ll/fig;-><init>(Ll/iig;)V

    .line 145
    .line 146
    .line 147
    new-instance v2, Ll/gig;

    .line 148
    .line 149
    invoke-direct {v2}, Ll/gig;-><init>()V

    .line 150
    .line 151
    .line 152
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    iput-object v0, p0, Ll/iig;->h:Ll/kcg0;

    .line 161
    .line 162
    goto :goto_1

    .line 163
    :cond_1
    iget-object v0, p0, Ll/iig;->c:Lv/VDraweeView;

    .line 164
    .line 165
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 166
    .line 167
    .line 168
    :goto_1
    iget-object v0, p0, Ll/iig;->j:Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;

    .line 169
    .line 170
    iget v1, v0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->grade:I

    .line 171
    .line 172
    const/16 v2, 0x26

    .line 173
    .line 174
    if-lt v1, v2, :cond_2

    .line 175
    .line 176
    sget v1, Ll/i0k;->b:I

    .line 177
    .line 178
    goto :goto_2

    .line 179
    :cond_2
    sget v1, Ll/i0k;->a:I

    .line 180
    .line 181
    :goto_2
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->getGradleUrl()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    iget-object v2, p0, Ll/iig;->d:Lv/VDraweeView;

    .line 186
    .line 187
    invoke-static {v0, v2, v1}, Ll/i0k;->c(Ljava/lang/String;Lv/VDraweeView;I)V

    .line 188
    .line 189
    .line 190
    iget-object v0, p0, Ll/iig;->a:Lv/VImage;

    .line 191
    .line 192
    iget-object v1, p0, Ll/iig;->j:Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;

    .line 193
    .line 194
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->isSelected()Z

    .line 195
    .line 196
    .line 197
    move-result v1

    .line 198
    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 199
    .line 200
    .line 201
    new-instance v0, Ll/hig;

    .line 202
    .line 203
    invoke-direct {v0, p0}, Ll/hig;-><init>(Ll/iig;)V

    .line 204
    .line 205
    .line 206
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 207
    .line 208
    .line 209
    return-void
.end method
