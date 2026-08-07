.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;
.super Lv/VRelative;
.source "SourceFile"

# interfaces
.implements Ll/bi70;


# instance fields
.field public d:Lv/VFrame;

.field public e:Lv/VDraweeView;

.field public f:Lv/VFrame;

.field public g:Lv/VDraweeView;

.field public h:Lv/VFrame;

.field public i:Lv/VDraweeView;

.field public j:Landroid/widget/TextView;

.field public k:I

.field public l:Ljava/lang/String;

.field public m:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lv/VRelative;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x3

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;->k:I

    .line 6
    .line 7
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;->I(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 11
    invoke-direct {p0, p1, p2}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p2, 0x3

    .line 12
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;->k:I

    .line 13
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;->I(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x3

    .line 15
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;->k:I

    .line 16
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;->I(Landroid/content/Context;)V

    return-void
.end method

.method private I(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;->q(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;->L(ILandroid/view/View;)V

    return-void
.end method


# virtual methods
.method public B()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;->m:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;->l:Ljava/lang/String;

    .line 4
    .line 5
    invoke-interface {p0, v0, v1}, Ll/bi70;->n(ILjava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public H(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {p0, v0}, Ll/bi70;->c(Lcom/p1/mobile/android/app/Act;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "p_interactcell_detail"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;->l:Ljava/lang/String;

    .line 19
    .line 20
    invoke-interface {p0, p1, v0}, Ll/bi70;->n(ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic L(ILandroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;->z(I)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    new-instance p2, Landroid/content/Intent;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {}, Ll/cmg;->j0()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Jn()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const-class v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;

    .line 30
    .line 31
    :goto_0
    invoke-direct {p2, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 32
    .line 33
    .line 34
    sget p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->i:I

    .line 35
    .line 36
    invoke-virtual {p1, p2, p0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public M(Ljava/util/List;I)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;I)V"
        }
    .end annotation

    .line 1
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;->m:I

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x3

    .line 8
    const/4 v2, 0x2

    .line 9
    const/4 v3, 0x1

    .line 10
    const/4 v4, 0x0

    .line 11
    if-lt v0, v1, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;->d:Lv/VFrame;

    .line 14
    .line 15
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;->f:Lv/VFrame;

    .line 19
    .line 20
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;->e:Lv/VDraweeView;

    .line 26
    .line 27
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 42
    .line 43
    .line 44
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;->g:Lv/VDraweeView;

    .line 47
    .line 48
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 53
    .line 54
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 63
    .line 64
    .line 65
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 66
    .line 67
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;->i:Lv/VDraweeView;

    .line 68
    .line 69
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 74
    .line 75
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-ne v0, v2, :cond_1

    .line 92
    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;->d:Lv/VFrame;

    .line 94
    .line 95
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;->f:Lv/VFrame;

    .line 99
    .line 100
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 101
    .line 102
    .line 103
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 104
    .line 105
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;->g:Lv/VDraweeView;

    .line 106
    .line 107
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 112
    .line 113
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 122
    .line 123
    .line 124
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 125
    .line 126
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;->i:Lv/VDraweeView;

    .line 127
    .line 128
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 133
    .line 134
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 143
    .line 144
    .line 145
    goto :goto_0

    .line 146
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;->d:Lv/VFrame;

    .line 151
    .line 152
    if-ne v0, v3, :cond_2

    .line 153
    .line 154
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 155
    .line 156
    .line 157
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;->f:Lv/VFrame;

    .line 158
    .line 159
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 160
    .line 161
    .line 162
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;->h:Lv/VFrame;

    .line 163
    .line 164
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 165
    .line 166
    .line 167
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 168
    .line 169
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;->i:Lv/VDraweeView;

    .line 170
    .line 171
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 176
    .line 177
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 186
    .line 187
    .line 188
    goto :goto_0

    .line 189
    :cond_2
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 190
    .line 191
    .line 192
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;->f:Lv/VFrame;

    .line 193
    .line 194
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 195
    .line 196
    .line 197
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;->h:Lv/VFrame;

    .line 198
    .line 199
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 200
    .line 201
    .line 202
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;->j:Landroid/widget/TextView;

    .line 203
    .line 204
    new-instance v0, Ljava/lang/StringBuilder;

    .line 205
    .line 206
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 207
    .line 208
    .line 209
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    const-string v1, "\u4eba"

    .line 213
    .line 214
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 222
    .line 223
    .line 224
    new-instance p1, Ll/mng;

    .line 225
    .line 226
    invoke-direct {p1, p0, p2}, Ll/mng;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;I)V

    .line 227
    .line 228
    .line 229
    invoke-virtual {p0, p1}, Lv/VRelative;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 230
    .line 231
    .line 232
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public getEntranceType()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "normal"

    .line 2
    .line 3
    return-object p0
.end method

.method public q(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/nng;->b(Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public setInteractionType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;->l:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public final z(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;->l:Ljava/lang/String;

    .line 2
    .line 3
    invoke-interface {p0, p1, v0}, Ll/bi70;->b(ILjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
