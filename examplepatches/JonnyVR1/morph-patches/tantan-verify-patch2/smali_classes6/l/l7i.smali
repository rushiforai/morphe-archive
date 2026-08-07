.class public abstract Ll/l7i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/v7i;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Ll/lol;",
        ">",
        "Ljava/lang/Object;",
        "Ll/v7i;"
    }
.end annotation


# static fields
.field public static r:Ljava/lang/String; = "photo_album_feed_"


# instance fields
.field public a:Ll/dj70;

.field public b:Landroid/widget/LinearLayout;

.field public c:Landroid/widget/LinearLayout;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/RelativeLayout;

.field public f:Lv/VDraweeView;

.field public g:Lv/VImage;

.field public h:Lv/VLinear_FillerMeasure;

.field public i:Landroid/widget/TextView;

.field public j:Landroid/widget/ImageView;

.field public k:Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;

.field public l:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/WealthLevelView;

.field public m:Lv/VImage;

.field public n:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

.field public o:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public p:Lv/VDraweeView;

.field public q:Ll/lol;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/lol;Ll/dj70;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ll/dj70;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/l7i;->q:Ll/lol;

    .line 5
    .line 6
    iput-object p2, p0, Ll/l7i;->a:Ll/dj70;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/l7i;->p()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic l(Ll/l7i;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/l7i;->u(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m(Ll/l7i;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/l7i;->w(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n(Ll/l7i;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/l7i;->v(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final A(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/l7i;->x()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/l7i;->o()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0}, Ll/l7i;->o()Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {p0}, Ll/l7i;->x()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v1, p0, p1}, Ll/at0;->c(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    invoke-virtual {p0}, Ll/l7i;->o()Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p0}, Ll/l7i;->x()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {p0}, Ll/l7i;->x()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {v0, v1, p0, p1}, Ll/at0;->i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final B(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/l7i;->a:Ll/dj70;

    .line 2
    .line 3
    iget-object p1, p1, Ll/dj70;->b:Ljava/lang/String;

    .line 4
    .line 5
    const-string v0, "from_nearby_falls_feed"

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const-string p1, "from_nearby_falls_feed_single"

    .line 14
    .line 15
    goto/16 :goto_3

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 18
    .line 19
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 20
    .line 21
    const-string v1, "from_nearby_focus"

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    const-string p1, "from_nearby_focus_single"

    .line 30
    .line 31
    goto/16 :goto_3

    .line 32
    .line 33
    :cond_1
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 34
    .line 35
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 36
    .line 37
    const-string v1, "original_moments"

    .line 38
    .line 39
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    const-string p1, "original_personal_moments"

    .line 46
    .line 47
    goto/16 :goto_3

    .line 48
    .line 49
    :cond_2
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 50
    .line 51
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 52
    .line 53
    const-string v1, "recommend_only_video"

    .line 54
    .line 55
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-nez v0, :cond_c

    .line 60
    .line 61
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 62
    .line 63
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 64
    .line 65
    const-string v1, "recommend_multiple"

    .line 66
    .line 67
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_3

    .line 72
    .line 73
    goto/16 :goto_2

    .line 74
    .line 75
    :cond_3
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 76
    .line 77
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 78
    .line 79
    const-string v1, "from_profile_opt"

    .line 80
    .line 81
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-eqz v0, :cond_4

    .line 86
    .line 87
    const-string p1, "from_profile_opt_single"

    .line 88
    .line 89
    goto/16 :goto_3

    .line 90
    .line 91
    :cond_4
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 92
    .line 93
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 94
    .line 95
    const-string v1, "from_topic_nearby_header"

    .line 96
    .line 97
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-nez v0, :cond_b

    .line 102
    .line 103
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 104
    .line 105
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 106
    .line 107
    const-string v1, "from_topic_official"

    .line 108
    .line 109
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-nez v0, :cond_b

    .line 114
    .line 115
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 116
    .line 117
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 118
    .line 119
    const-string v1, "from_no_topic_aggregation_list"

    .line 120
    .line 121
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    if-nez v0, :cond_b

    .line 126
    .line 127
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 128
    .line 129
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 130
    .line 131
    const-string v1, "from_h5_topic_aggregation"

    .line 132
    .line 133
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    if-eqz v0, :cond_5

    .line 138
    .line 139
    goto :goto_1

    .line 140
    :cond_5
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 141
    .line 142
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 143
    .line 144
    const-string v1, "p_nearby_online"

    .line 145
    .line 146
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    if-eqz v0, :cond_6

    .line 151
    .line 152
    :goto_0
    move-object p1, v1

    .line 153
    goto :goto_3

    .line 154
    :cond_6
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 155
    .line 156
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 157
    .line 158
    const-string v1, "p_like"

    .line 159
    .line 160
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    if-eqz v0, :cond_7

    .line 165
    .line 166
    goto :goto_0

    .line 167
    :cond_7
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 168
    .line 169
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 170
    .line 171
    const-string v1, "from_discover_dating"

    .line 172
    .line 173
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    if-eqz v0, :cond_8

    .line 178
    .line 179
    const-string p1, "p_discover_dating"

    .line 180
    .line 181
    goto :goto_3

    .line 182
    :cond_8
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 183
    .line 184
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 185
    .line 186
    const-string v1, "from_discover_discussion"

    .line 187
    .line 188
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 189
    .line 190
    .line 191
    move-result v0

    .line 192
    if-eqz v0, :cond_9

    .line 193
    .line 194
    const-string p1, "p_discover_discussion"

    .line 195
    .line 196
    goto :goto_3

    .line 197
    :cond_9
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 198
    .line 199
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 200
    .line 201
    const-string v1, "from_activity_tab_one"

    .line 202
    .line 203
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 204
    .line 205
    .line 206
    move-result v0

    .line 207
    if-eqz v0, :cond_a

    .line 208
    .line 209
    invoke-static {v1}, Ll/pu20;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    goto :goto_3

    .line 214
    :cond_a
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 215
    .line 216
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 217
    .line 218
    const-string v1, "from_activity_tab_two"

    .line 219
    .line 220
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 221
    .line 222
    .line 223
    move-result v0

    .line 224
    if-eqz v0, :cond_d

    .line 225
    .line 226
    invoke-static {v1}, Ll/pu20;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object p1

    .line 230
    goto :goto_3

    .line 231
    :cond_b
    :goto_1
    const-string p1, "from_topic_aggregation"

    .line 232
    .line 233
    goto :goto_3

    .line 234
    :cond_c
    :goto_2
    const-string p1, "recommend_falls_to_detail"

    .line 235
    .line 236
    :cond_d
    :goto_3
    invoke-virtual {p0, p1}, Ll/l7i;->A(Ljava/lang/String;)V

    .line 237
    .line 238
    .line 239
    return-void
.end method

.method public b(Ll/dj70;)Z
    .locals 2

    .line 1
    iget-object v0, p1, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/l7i;->y()V

    .line 7
    .line 8
    .line 9
    return v1

    .line 10
    :cond_0
    iget-object p0, p1, Ll/dj70;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_1
    return v1
.end method

.method public c(Ll/dj70;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/l7i;->a:Ll/dj70;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/l7i;->r()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d(Ll/dj70;)V
    .locals 0

    .line 1
    return-void
.end method

.method public e()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l7i;->c:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/l7i;->b:Landroid/widget/LinearLayout;

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public f()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/l7i;->i:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/l7i;->x()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v2, p0, Ll/l7i;->a:Ll/dj70;

    .line 8
    .line 9
    iget-object v2, v2, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v1, v2}, Ll/at0;->a(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/l7i;->i:Landroid/widget/TextView;

    .line 21
    .line 22
    iget-object v1, p0, Ll/l7i;->a:Ll/dj70;

    .line 23
    .line 24
    iget-object v1, v1, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    invoke-static {v1}, Ll/cai;->b(Lcom/p1/mobile/putong/data/User;)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/l7i;->k:Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;

    .line 34
    .line 35
    const/16 v1, 0x8

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/l7i;->n:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 41
    .line 42
    const/4 v2, 0x0

    .line 43
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/l7i;->j:Landroid/widget/ImageView;

    .line 47
    .line 48
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ll/l7i;->o()Lcom/p1/mobile/android/app/Act;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-object v3, p0, Ll/l7i;->a:Ll/dj70;

    .line 56
    .line 57
    iget-object v3, v3, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 58
    .line 59
    iget-object v4, p0, Ll/l7i;->j:Landroid/widget/ImageView;

    .line 60
    .line 61
    const/4 v5, 0x1

    .line 62
    invoke-static {v0, v3, v4, v5, v2}, Ll/orb0;->y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Landroid/widget/ImageView;ZZ)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Ll/l7i;->j:Landroid/widget/ImageView;

    .line 66
    .line 67
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-nez v0, :cond_0

    .line 72
    .line 73
    iget-object v0, p0, Ll/l7i;->j:Landroid/widget/ImageView;

    .line 74
    .line 75
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    iget-object v4, p0, Ll/l7i;->j:Landroid/widget/ImageView;

    .line 80
    .line 81
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    iget v4, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 86
    .line 87
    invoke-static {v0, v3, v4}, Ll/ksg;->D0(Landroid/view/View;Landroid/graphics/drawable/Drawable;I)V

    .line 88
    .line 89
    .line 90
    :cond_0
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 91
    .line 92
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 93
    .line 94
    const-string v3, "from_live_square_tab"

    .line 95
    .line 96
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-eqz v0, :cond_3

    .line 101
    .line 102
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 103
    .line 104
    iget-boolean v0, v0, Ll/dj70;->c:Z

    .line 105
    .line 106
    if-nez v0, :cond_3

    .line 107
    .line 108
    move v0, v2

    .line 109
    :goto_0
    iget-object v3, p0, Ll/l7i;->h:Lv/VLinear_FillerMeasure;

    .line 110
    .line 111
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    .line 112
    .line 113
    .line 114
    move-result v3

    .line 115
    if-ge v0, v3, :cond_3

    .line 116
    .line 117
    iget-object v3, p0, Ll/l7i;->h:Lv/VLinear_FillerMeasure;

    .line 118
    .line 119
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    invoke-virtual {v3}, Landroid/view/View;->getId()I

    .line 124
    .line 125
    .line 126
    move-result v3

    .line 127
    sget v4, Ll/hdc0;->d1:I

    .line 128
    .line 129
    if-eq v3, v4, :cond_2

    .line 130
    .line 131
    iget-object v3, p0, Ll/l7i;->h:Lv/VLinear_FillerMeasure;

    .line 132
    .line 133
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    invoke-virtual {v3}, Landroid/view/View;->getId()I

    .line 138
    .line 139
    .line 140
    move-result v3

    .line 141
    sget v4, Ll/hdc0;->G0:I

    .line 142
    .line 143
    if-ne v3, v4, :cond_1

    .line 144
    .line 145
    goto :goto_1

    .line 146
    :cond_1
    iget-object v3, p0, Ll/l7i;->h:Lv/VLinear_FillerMeasure;

    .line 147
    .line 148
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 149
    .line 150
    .line 151
    move-result-object v3

    .line 152
    invoke-virtual {v3, v1}, Landroid/view/View;->setVisibility(I)V

    .line 153
    .line 154
    .line 155
    goto :goto_2

    .line 156
    :cond_2
    :goto_1
    iget-object v3, p0, Ll/l7i;->h:Lv/VLinear_FillerMeasure;

    .line 157
    .line 158
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 159
    .line 160
    .line 161
    move-result-object v3

    .line 162
    invoke-virtual {v3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 163
    .line 164
    .line 165
    :goto_2
    add-int/lit8 v0, v0, 0x1

    .line 166
    .line 167
    goto :goto_0

    .line 168
    :cond_3
    return-void
.end method

.method public h()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l7i;->g:Lv/VImage;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/l7i;->f:Lv/VDraweeView;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/l7i;->x()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Ll/l7i;->f:Lv/VDraweeView;

    .line 17
    .line 18
    iget-object p0, p0, Ll/l7i;->a:Ll/dj70;

    .line 19
    .line 20
    iget-object p0, p0, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    invoke-static {v0, v1, p0}, Ll/at0;->e(Lcom/p1/mobile/putong/feed/data/Moment;Lv/VDraweeView;Lcom/p1/mobile/putong/data/User;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public j()V
    .locals 0

    .line 1
    return-void
.end method

.method public o()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l7i;->a:Ll/dj70;

    .line 2
    .line 3
    iget-object p0, p0, Ll/dj70;->g:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    return-object p0
.end method

.method public abstract p()V
.end method

.method public q(Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance v0, Ll/j7i;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/j7i;-><init>(Ll/l7i;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public r()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 2
    .line 3
    iget-boolean v0, v0, Ll/dj70;->c:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/l7i;->t()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/l7i;->s()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public s()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/l7i;->z()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public t()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/l7i;->e:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    iget-object v1, p0, Ll/l7i;->i:Landroid/widget/TextView;

    .line 4
    .line 5
    iget-object v2, p0, Ll/l7i;->f:Lv/VDraweeView;

    .line 6
    .line 7
    const/4 v3, 0x3

    .line 8
    new-array v3, v3, [Landroid/view/View;

    .line 9
    .line 10
    const/4 v4, 0x0

    .line 11
    aput-object v0, v3, v4

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    aput-object v1, v3, v0

    .line 15
    .line 16
    const/4 v0, 0x2

    .line 17
    aput-object v2, v3, v0

    .line 18
    .line 19
    invoke-static {v3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/i7i;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/i7i;-><init>(Ll/l7i;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic u(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dj70;->l:Ll/fj70;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/fj70;->d(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/l7i;->B(Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic v(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dj70;->l:Ll/fj70;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/fj70;->d(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    const-string p1, "from_nearby_focus_single"

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/l7i;->A(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic w(Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance v0, Ll/k7i;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/k7i;-><init>(Ll/l7i;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public x()Lcom/p1/mobile/putong/feed/data/Moment;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l7i;->a:Ll/dj70;

    .line 2
    .line 3
    iget-object p0, p0, Ll/dj70;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    return-object p0
.end method

.method public y()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l7i;->f:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/l7i;->i:Landroid/widget/TextView;

    .line 8
    .line 9
    const-string v1, ""

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/l7i;->c:Landroid/widget/LinearLayout;

    .line 15
    .line 16
    const/16 v0, 0x8

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public z()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/l7i;->e:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    iget-object v1, p0, Ll/l7i;->i:Landroid/widget/TextView;

    .line 4
    .line 5
    iget-object v2, p0, Ll/l7i;->f:Lv/VDraweeView;

    .line 6
    .line 7
    const/4 v3, 0x3

    .line 8
    new-array v3, v3, [Landroid/view/View;

    .line 9
    .line 10
    const/4 v4, 0x0

    .line 11
    aput-object v0, v3, v4

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    aput-object v1, v3, v0

    .line 15
    .line 16
    const/4 v0, 0x2

    .line 17
    aput-object v2, v3, v0

    .line 18
    .line 19
    invoke-static {v3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/h7i;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/h7i;-><init>(Ll/l7i;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method
