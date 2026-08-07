.class public Ll/q7o;
.super Ll/z0u;
.source "SourceFile"

# interfaces
.implements Ll/p4u;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/z0u<",
        "Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareNearbyItemView;",
        ">;",
        "Ll/p4u;"
    }
.end annotation


# instance fields
.field public final j:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Lcom/p1/mobile/putong/live/base/data/BLiveSettings;ILcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;I)V
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
    invoke-direct {p0, p1, p2, p3, p5}, Ll/z0u;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Lcom/p1/mobile/putong/live/base/data/BLiveSettings;II)V

    .line 2
    .line 3
    .line 4
    iput-object p4, p0, Ll/q7o;->j:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public K()Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->location:Lcom/p1/mobile/putong/data/Location;

    .line 6
    .line 7
    invoke-static {v0}, Ll/xau;->x(Lcom/p1/mobile/putong/data/Location;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return-object p0

    .line 15
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iput-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->distance:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 22
    .line 23
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 24
    .line 25
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->title:Ljava/lang/String;

    .line 26
    .line 27
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->room_name:Ljava/lang/String;

    .line 28
    .line 29
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->memberCount:I

    .line 30
    .line 31
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->viewer:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v0, p0, Ll/q7o;->j:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 38
    .line 39
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    iget-object v0, p0, Ll/q7o;->j:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;->value:Ljava/lang/String;

    .line 48
    .line 49
    iput-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->label_name:Ljava/lang/String;

    .line 50
    .line 51
    :cond_1
    iget-object v0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 54
    .line 55
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-nez v0, :cond_6

    .line 60
    .line 61
    const/4 v0, 0x0

    .line 62
    move v2, v0

    .line 63
    :goto_0
    iget-object v3, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 64
    .line 65
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 66
    .line 67
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    iget-object v4, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 72
    .line 73
    if-ge v2, v3, :cond_5

    .line 74
    .line 75
    iget-object v3, v4, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 76
    .line 77
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;

    .line 82
    .line 83
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;->type:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 89
    .line 90
    .line 91
    move-result v4

    .line 92
    const/4 v5, -0x1

    .line 93
    packed-switch v4, :pswitch_data_0

    .line 94
    .line 95
    .line 96
    goto :goto_1

    .line 97
    :pswitch_0
    const-string v4, "C"

    .line 98
    .line 99
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v3

    .line 103
    if-nez v3, :cond_2

    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_2
    const/4 v5, 0x2

    .line 107
    goto :goto_1

    .line 108
    :pswitch_1
    const-string v4, "B"

    .line 109
    .line 110
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result v3

    .line 114
    if-nez v3, :cond_3

    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_3
    const/4 v5, 0x1

    .line 118
    goto :goto_1

    .line 119
    :pswitch_2
    const-string v4, "A"

    .line 120
    .line 121
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result v3

    .line 125
    if-nez v3, :cond_4

    .line 126
    .line 127
    goto :goto_1

    .line 128
    :cond_4
    move v5, v0

    .line 129
    :goto_1
    packed-switch v5, :pswitch_data_1

    .line 130
    .line 131
    .line 132
    goto :goto_2

    .line 133
    :pswitch_3
    iget-object v3, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 134
    .line 135
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 136
    .line 137
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v3

    .line 141
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;

    .line 142
    .line 143
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;->name:Ljava/lang/String;

    .line 144
    .line 145
    iput-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->label_name_fixed:Ljava/lang/String;

    .line 146
    .line 147
    goto :goto_2

    .line 148
    :pswitch_4
    iget-object v3, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 149
    .line 150
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 151
    .line 152
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object v3

    .line 156
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;

    .line 157
    .line 158
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;->name:Ljava/lang/String;

    .line 159
    .line 160
    iput-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->label_name_custom:Ljava/lang/String;

    .line 161
    .line 162
    goto :goto_2

    .line 163
    :pswitch_5
    iget-object v3, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 164
    .line 165
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 166
    .line 167
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object v3

    .line 171
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;

    .line 172
    .line 173
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;->name:Ljava/lang/String;

    .line 174
    .line 175
    iput-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->label_name:Ljava/lang/String;

    .line 176
    .line 177
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 178
    .line 179
    goto :goto_0

    .line 180
    :cond_5
    iget-object p0, v4, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 181
    .line 182
    invoke-static {p0}, Ll/dwn;->e(Ljava/util/List;)Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object p0

    .line 186
    iput-object p0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->have_red_packet:Ljava/lang/String;

    .line 187
    .line 188
    :cond_6
    return-object v1

    .line 189
    :pswitch_data_0
    .packed-switch 0x41
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    .line 190
    .line 191
    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch
.end method

.method public bridge synthetic N(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareNearbyItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/q7o;->V(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareNearbyItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic O(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareNearbyItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/q7o;->W(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareNearbyItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public S(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareNearbyItemView;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareNearbyItemView;->a:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 2
    .line 3
    iget p0, p0, Ll/z0u;->g:I

    .line 4
    .line 5
    invoke-static {v0, p0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareNearbyItemView;->a:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->getSimpleDraweeView()Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Ll/wlj;

    .line 19
    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    sget v0, Ll/nbc0;->p0:I

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ll/wlj;->D(I)V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareNearbyItemView;->a:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 28
    .line 29
    sget p1, Ll/qa00;->i:I

    .line 30
    .line 31
    int-to-float p1, p1

    .line 32
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->setRadius(F)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public T(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareNearbyItemView;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareNearbyItemView;->a:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->getSimpleDraweeView()Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 19
    .line 20
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->coverUrl:Ljava/lang/String;

    .line 21
    .line 22
    iget v2, p0, Ll/z0u;->g:I

    .line 23
    .line 24
    const-string v3, "context_square"

    .line 25
    .line 26
    invoke-static {v3, v0, v1, v2, v2}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 30
    .line 31
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->memberCount:I

    .line 32
    .line 33
    int-to-double v0, v0

    .line 34
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareNearbyItemView;->c(D)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 40
    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->location:Lcom/p1/mobile/putong/data/Location;

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareNearbyItemView;->setDistance(Lcom/p1/mobile/putong/data/Location;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 49
    .line 50
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 51
    .line 52
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->name:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareNearbyItemView;->setLiveName(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    :cond_1
    iget-object v0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 58
    .line 59
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->basicLabel:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 60
    .line 61
    if-eqz v0, :cond_2

    .line 62
    .line 63
    iget-object v1, p0, Ll/z0u;->b:Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 64
    .line 65
    if-eqz v1, :cond_2

    .line 66
    .line 67
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareNearbyItemView;->e(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_2
    const/4 v0, 0x0

    .line 72
    iget-object v1, p0, Ll/z0u;->b:Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 73
    .line 74
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareNearbyItemView;->e(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V

    .line 75
    .line 76
    .line 77
    :goto_0
    iget-object v0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 78
    .line 79
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->isOnLive()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    xor-int/lit8 v0, v0, 0x1

    .line 84
    .line 85
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareNearbyItemView;->f(Z)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Ll/q7o;->j:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 89
    .line 90
    if-eqz v0, :cond_3

    .line 91
    .line 92
    iget-object v0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 93
    .line 94
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 95
    .line 96
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-eqz v0, :cond_3

    .line 101
    .line 102
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareNearbyItemView;->c:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSpecialLabelView;

    .line 103
    .line 104
    iget-object v1, p0, Ll/q7o;->j:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 105
    .line 106
    iget-object v2, p0, Ll/z0u;->b:Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 107
    .line 108
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSpecialLabelView;->d(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V

    .line 109
    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareNearbyItemView;->c:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSpecialLabelView;

    .line 113
    .line 114
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSpecialLabelView;->c()V

    .line 115
    .line 116
    .line 117
    :goto_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareNearbyItemView;->d:Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

    .line 118
    .line 119
    iget-object v1, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 120
    .line 121
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 122
    .line 123
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    xor-int/lit8 v1, v1, 0x1

    .line 128
    .line 129
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 133
    .line 134
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 135
    .line 136
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    if-nez v0, :cond_4

    .line 141
    .line 142
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareNearbyItemView;->d:Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

    .line 143
    .line 144
    iget-object p0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 145
    .line 146
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 147
    .line 148
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;->O(Ljava/util/List;)V

    .line 149
    .line 150
    .line 151
    :cond_4
    return-void
.end method

.method public U(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareNearbyItemView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/z0u;->w(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareNearbyItemView;->a:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->q()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public V(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareNearbyItemView;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareNearbyItemView;->a:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 2
    .line 3
    iget-object p0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->videoCaptureUrl:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->n(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public W(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareNearbyItemView;)V
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareNearbyItemView;->a:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->q()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareNearbyItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/q7o;->S(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareNearbyItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/xec0;->Z:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareNearbyItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/q7o;->T(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareNearbyItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareNearbyItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/q7o;->U(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareNearbyItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
