.class public Ll/y8o;
.super Ll/b9o;
.source "SourceFile"

# interfaces
.implements Ll/d6m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/b9o<",
        "Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;",
        ">;",
        "Ll/d6m;"
    }
.end annotation


# instance fields
.field public j:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Lcom/p1/mobile/putong/live/base/data/BLiveSettings;II)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/live/base/data/BLiveSettings;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Ll/b9o;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Lcom/p1/mobile/putong/live/base/data/BLiveSettings;II)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/y8o;->j:Z

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public bridge synthetic L(Landroid/view/View;Ljava/util/List;)V
    .locals 0
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/y8o;->V(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic N(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/y8o;->X(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic O(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/y8o;->Z(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public P()Ljava/util/HashMap;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-boolean p0, p0, Ll/y8o;->j:Z

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    new-instance p0, Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v0, "module"

    .line 13
    .line 14
    const-string v1, "no_action_toast"

    .line 15
    .line 16
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    return-object p0
.end method

.method public Q()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/z0u;->I()Ll/kfd0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/kfd0$a;->a()Ll/kfd0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/d3q;->p()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p0}, Ll/y8o;->P()Ljava/util/HashMap;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-static {v0, v1, v2}, Ll/bfu;->d(Ll/kfd0;Ljava/lang/String;Ljava/util/Map;)V

    .line 18
    .line 19
    .line 20
    iget-boolean v0, p0, Ll/y8o;->j:Z

    .line 21
    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    const-string v0, "e_live_no_action_toast"

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/d3q;->p()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {v0, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public S(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;)V
    .locals 3

    .line 1
    iget v0, p0, Ll/z0u;->g:I

    .line 2
    .line 3
    invoke-static {p1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 4
    .line 5
    .line 6
    iget v0, p0, Ll/z0u;->g:I

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    new-array v1, v1, [Landroid/view/View;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    aput-object p1, v1, v2

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->c:Lv/VFrame;

    .line 18
    .line 19
    iget p0, p0, Ll/z0u;->g:I

    .line 20
    .line 21
    div-int/lit8 p0, p0, 0x2

    .line 22
    .line 23
    invoke-static {v0, p0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 24
    .line 25
    .line 26
    sget p0, Ll/qa00;->i:I

    .line 27
    .line 28
    invoke-static {p1, p0}, Ll/ynp0;->m(Landroid/view/View;I)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public T(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/y8o;->S(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public U(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;)V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->location:Lcom/p1/mobile/putong/data/Location;

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->setDistance(Lcom/p1/mobile/putong/data/Location;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->setAnchorGrade(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->s()V

    .line 21
    .line 22
    .line 23
    :goto_0
    iget-object v0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->a:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->getSimpleDraweeView()Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    iget-object v0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 38
    .line 39
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->coverUrl:Ljava/lang/String;

    .line 40
    .line 41
    iget v4, p0, Ll/z0u;->g:I

    .line 42
    .line 43
    invoke-static {}, Ll/irn;->a()Z

    .line 44
    .line 45
    .line 46
    move-result v8

    .line 47
    const/4 v9, 0x0

    .line 48
    const-string v1, "context_square"

    .line 49
    .line 50
    const/4 v6, 0x1

    .line 51
    const/4 v7, 0x0

    .line 52
    move v5, v4

    .line 53
    invoke-static/range {v1 .. v9}, Ll/izs;->v(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIZZZLl/fn2;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 57
    .line 58
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 59
    .line 60
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->title:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->setLiveName(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->m:Lv/VText;

    .line 66
    .line 67
    const/high16 v1, 0x41600000    # 14.0f

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 73
    .line 74
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->memberCount:I

    .line 75
    .line 76
    int-to-float v0, v0

    .line 77
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    int-to-long v0, v0

    .line 82
    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->setAudienceAmount(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 90
    .line 91
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->isOnLive()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    xor-int/lit8 v0, v0, 0x1

    .line 96
    .line 97
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->w(Z)V

    .line 98
    .line 99
    .line 100
    iget-boolean v0, p0, Ll/y8o;->j:Z

    .line 101
    .line 102
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->v(Z)V

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 106
    .line 107
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->specialLabel:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 108
    .line 109
    if-eqz v1, :cond_2

    .line 110
    .line 111
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabels:Ljava/util/List;

    .line 112
    .line 113
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-eqz v0, :cond_2

    .line 118
    .line 119
    iget-object v0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 120
    .line 121
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 122
    .line 123
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    if-eqz v0, :cond_2

    .line 128
    .line 129
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->f:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSpecialLabelView;

    .line 130
    .line 131
    iget-object v1, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 132
    .line 133
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->specialLabel:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 134
    .line 135
    iget-object v2, p0, Ll/z0u;->b:Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 136
    .line 137
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSpecialLabelView;->d(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V

    .line 138
    .line 139
    .line 140
    goto :goto_1

    .line 141
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->f:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSpecialLabelView;

    .line 142
    .line 143
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSpecialLabelView;->c()V

    .line 144
    .line 145
    .line 146
    :goto_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->j:Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

    .line 147
    .line 148
    iget-object v1, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 149
    .line 150
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 151
    .line 152
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 153
    .line 154
    .line 155
    move-result v1

    .line 156
    xor-int/lit8 v1, v1, 0x1

    .line 157
    .line 158
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 159
    .line 160
    .line 161
    iget-object v0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 162
    .line 163
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 164
    .line 165
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    if-nez v0, :cond_3

    .line 170
    .line 171
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->j:Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

    .line 172
    .line 173
    iget-object v1, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 174
    .line 175
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 176
    .line 177
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;->O(Ljava/util/List;)V

    .line 178
    .line 179
    .line 180
    goto :goto_2

    .line 181
    :cond_3
    iget-object v0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 182
    .line 183
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabels:Ljava/util/List;

    .line 184
    .line 185
    invoke-static {v0, p1}, Ll/dwn;->b(Ljava/util/List;Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;)V

    .line 186
    .line 187
    .line 188
    :goto_2
    iget-object v0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 189
    .line 190
    invoke-virtual {p0, v0, p1}, Ll/y8o;->Y(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;)V

    .line 191
    .line 192
    .line 193
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 194
    .line 195
    .line 196
    return-void
.end method

.method public V(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;Ljava/util/List;)V
    .locals 1
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2}, Ll/z0u;->L(Landroid/view/View;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    instance-of v0, p2, Ll/vvk;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    check-cast p2, Ll/vvk;

    .line 21
    .line 22
    invoke-virtual {p2}, Ll/vvk;->a()Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    iput-boolean p2, p0, Ll/y8o;->j:Z

    .line 27
    .line 28
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->v(Z)V

    .line 29
    .line 30
    .line 31
    iget-boolean p1, p0, Ll/y8o;->j:Z

    .line 32
    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    const-string p1, "e_live_no_action_toast"

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/d3q;->p()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {p1, p0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    :goto_0
    return-void
.end method

.method public W(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/z0u;->w(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/y8o;->Z(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public X(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->a:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 2
    .line 3
    iget-object v1, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->videoCaptureUrl:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->n(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-boolean p0, p0, Ll/y8o;->j:Z

    .line 11
    .line 12
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->v(Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final Y(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;)V
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->intlFrame:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_2

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;->frameId:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-static {}, Ll/ahn;->a()Ll/ahn;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->intlFrame:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;->frameId:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/ahn;->b(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveFrame;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    if-nez p0, :cond_1

    .line 28
    .line 29
    iget-object p0, p2, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->d:Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;

    .line 30
    .line 31
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFrame;->framePicUrl:Ljava/lang/String;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFrame;->frameSvgUrl:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p2, p1, p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->u(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_2
    :goto_0
    iget-object p0, p2, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->d:Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;

    .line 44
    .line 45
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public Z(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;)V
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->a:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->q()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Landroidx/recyclerview/widget/RecyclerView$e0;Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;)V
    .locals 0

    .line 1
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/y8o;->S(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public bridge synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/y8o;->T(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/xec0;->c0:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/y8o;->U(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/y8o;->W(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
