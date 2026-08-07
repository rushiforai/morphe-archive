.class public Ll/swr;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Landroid/widget/FrameLayout;",
        ">;"
    }
.end annotation


# instance fields
.field private avatar:Lv/VDraweeView;

.field private final data:Ll/pwr$a;

.field private descView:Landroid/widget/TextView;

.field private sideIcon:Lv/VDraweeView;

.field private titleView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Ll/pwr$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/swr;->data:Ll/pwr$a;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public H(Landroid/widget/FrameLayout;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/jdc0;->Z0:I

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/widget/TextView;

    .line 11
    .line 12
    iput-object v0, p0, Ll/swr;->titleView:Landroid/widget/TextView;

    .line 13
    .line 14
    sget v0, Ll/jdc0;->j:I

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
    iput-object v0, p0, Ll/swr;->avatar:Lv/VDraweeView;

    .line 23
    .line 24
    sget v0, Ll/jdc0;->E:I

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Landroid/widget/TextView;

    .line 31
    .line 32
    iput-object v0, p0, Ll/swr;->descView:Landroid/widget/TextView;

    .line 33
    .line 34
    sget v0, Ll/jdc0;->I0:I

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Lv/VDraweeView;

    .line 41
    .line 42
    iput-object p1, p0, Ll/swr;->sideIcon:Lv/VDraweeView;

    .line 43
    .line 44
    iget-object p1, p0, Ll/swr;->descView:Landroid/widget/TextView;

    .line 45
    .line 46
    iget-object v0, p0, Ll/swr;->data:Ll/pwr$a;

    .line 47
    .line 48
    invoke-virtual {v0}, Ll/pwr$a;->a()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Ll/swr;->titleView:Landroid/widget/TextView;

    .line 56
    .line 57
    iget-object v0, p0, Ll/swr;->data:Ll/pwr$a;

    .line 58
    .line 59
    invoke-virtual {v0}, Ll/pwr$a;->f()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Ll/swr;->avatar:Lv/VDraweeView;

    .line 67
    .line 68
    iget-object v0, p0, Ll/swr;->data:Ll/pwr$a;

    .line 69
    .line 70
    invoke-virtual {v0}, Ll/pwr$a;->d()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    const-string v1, "context_square"

    .line 75
    .line 76
    invoke-static {v1, p1, v0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Ll/swr;->data:Ll/pwr$a;

    .line 80
    .line 81
    invoke-virtual {p1}, Ll/pwr$a;->e()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    iget-object v0, p0, Ll/swr;->sideIcon:Lv/VDraweeView;

    .line 90
    .line 91
    const/4 v2, 0x0

    .line 92
    if-eqz p1, :cond_0

    .line 93
    .line 94
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 95
    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_0
    const/4 p1, 0x1

    .line 99
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 100
    .line 101
    .line 102
    iget-object p1, p0, Ll/swr;->sideIcon:Lv/VDraweeView;

    .line 103
    .line 104
    iget-object v0, p0, Ll/swr;->data:Ll/pwr$a;

    .line 105
    .line 106
    invoke-virtual {v0}, Ll/pwr$a;->e()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-static {v1, p1, v0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    :goto_0
    iget-object p1, p0, Ll/swr;->data:Ll/pwr$a;

    .line 114
    .line 115
    invoke-virtual {p1}, Ll/pwr$a;->g()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/apibean/LiveCardTracker;->trackMv(Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V

    .line 120
    .line 121
    .line 122
    iget-object p1, p0, Ll/swr;->avatar:Lv/VDraweeView;

    .line 123
    .line 124
    invoke-virtual {p1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    check-cast p1, Ll/wlj;

    .line 129
    .line 130
    invoke-virtual {p1}, Ll/wlj;->p()Lcom/facebook/drawee/generic/RoundingParams;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    if-eqz p1, :cond_2

    .line 135
    .line 136
    iget-object p1, p0, Ll/swr;->data:Ll/pwr$a;

    .line 137
    .line 138
    invoke-virtual {p1}, Ll/pwr$a;->h()Z

    .line 139
    .line 140
    .line 141
    move-result p1

    .line 142
    iget-object v0, p0, Ll/swr;->avatar:Lv/VDraweeView;

    .line 143
    .line 144
    if-eqz p1, :cond_1

    .line 145
    .line 146
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    check-cast p1, Ll/wlj;

    .line 151
    .line 152
    invoke-virtual {p1}, Ll/wlj;->p()Lcom/facebook/drawee/generic/RoundingParams;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    const-string v0, "#ff8231"

    .line 157
    .line 158
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    invoke-virtual {p1, v0}, Lcom/facebook/drawee/generic/RoundingParams;->p(I)Lcom/facebook/drawee/generic/RoundingParams;

    .line 163
    .line 164
    .line 165
    iget-object p0, p0, Ll/swr;->avatar:Lv/VDraweeView;

    .line 166
    .line 167
    invoke-virtual {p0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    check-cast p0, Ll/wlj;

    .line 172
    .line 173
    invoke-virtual {p0}, Ll/wlj;->p()Lcom/facebook/drawee/generic/RoundingParams;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    const/high16 p1, 0x40e00000    # 7.0f

    .line 178
    .line 179
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 180
    .line 181
    .line 182
    move-result p1

    .line 183
    int-to-float p1, p1

    .line 184
    invoke-virtual {p0, p1}, Lcom/facebook/drawee/generic/RoundingParams;->u(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 185
    .line 186
    .line 187
    return-void

    .line 188
    :cond_1
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    check-cast p1, Ll/wlj;

    .line 193
    .line 194
    invoke-virtual {p1}, Ll/wlj;->p()Lcom/facebook/drawee/generic/RoundingParams;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    invoke-virtual {p1, v2}, Lcom/facebook/drawee/generic/RoundingParams;->p(I)Lcom/facebook/drawee/generic/RoundingParams;

    .line 199
    .line 200
    .line 201
    iget-object p0, p0, Ll/swr;->avatar:Lv/VDraweeView;

    .line 202
    .line 203
    invoke-virtual {p0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    check-cast p0, Ll/wlj;

    .line 208
    .line 209
    invoke-virtual {p0}, Ll/wlj;->p()Lcom/facebook/drawee/generic/RoundingParams;

    .line 210
    .line 211
    .line 212
    move-result-object p0

    .line 213
    const/high16 p1, 0x40400000    # 3.0f

    .line 214
    .line 215
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 216
    .line 217
    .line 218
    move-result p1

    .line 219
    int-to-float p1, p1

    .line 220
    invoke-virtual {p0, p1}, Lcom/facebook/drawee/generic/RoundingParams;->u(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 221
    .line 222
    .line 223
    :cond_2
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/vec0;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/swr;->H(Landroid/widget/FrameLayout;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
