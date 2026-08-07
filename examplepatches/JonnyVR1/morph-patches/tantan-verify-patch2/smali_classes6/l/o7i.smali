.class public Ll/o7i;
.super Ll/f7;
.source "SourceFile"

# interfaces
.implements Ll/t6i;


# instance fields
.field public a:Ll/lol;

.field public b:Ll/dj70;

.field public c:Ll/kcg0;

.field public d:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ll/f7i;


# direct methods
.method public constructor <init>(Ll/lol;Ll/dj70;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/f7;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/o7i;->d:Lrx/subjects/b;

    .line 9
    .line 10
    iput-object p1, p0, Ll/o7i;->a:Ll/lol;

    .line 11
    .line 12
    iput-object p2, p0, Ll/o7i;->b:Ll/dj70;

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic n(Ll/o7i;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o7i;->w(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public static synthetic o(Ll/o7i;Ll/dj70;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/o7i;->v(Ll/dj70;Landroid/view/View;)V

    return-void
.end method

.method public static t(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "from_nearby_focus"

    .line 2
    .line 3
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string p0, "follow_photo"

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const-string v0, "from_nearby_falls_feed"

    .line 13
    .line 14
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    const-string p0, "nearby_photo"

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    const/4 p0, 0x0

    .line 24
    return-object p0
.end method

.method public static u(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    const-string v0, "from_discover_dating"

    .line 2
    .line 3
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string p0, "p_discover_dating"

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const-string v0, "from_discover_discussion"

    .line 13
    .line 14
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const-string p0, "p_discover_discussion"

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    const-string v0, "from_nearby_focus"

    .line 24
    .line 25
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    const-string p0, "p_follow"

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_2
    const-string v0, "from_nearby_falls_feed"

    .line 35
    .line 36
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    const-string p0, "p_nearby"

    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_3
    const-string v0, "from_nearby_online"

    .line 46
    .line 47
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_4

    .line 52
    .line 53
    const-string p0, "p_nearby_online"

    .line 54
    .line 55
    return-object p0

    .line 56
    :cond_4
    const-string v0, "from_activity_tab_one"

    .line 57
    .line 58
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-eqz v1, :cond_5

    .line 63
    .line 64
    invoke-static {v0}, Ll/pu20;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0

    .line 69
    :cond_5
    const-string v0, "from_activity_tab_two"

    .line 70
    .line 71
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    if-eqz p0, :cond_6

    .line 76
    .line 77
    invoke-static {v0}, Ll/pu20;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0

    .line 82
    :cond_6
    const/4 p0, 0x0

    .line 83
    return-object p0
.end method


# virtual methods
.method public final A(Ll/dj70;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/o7i;->a:Ll/lol;

    .line 10
    .line 11
    instance-of v0, v0, Ll/lnh;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/o7i;->s()Ll/lnh;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-object p0, p0, Ll/lnh;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/WealthLevelView;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    :goto_0
    if-eqz p0, :cond_1

    .line 24
    .line 25
    iget-object p1, p1, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/WealthLevelView;->x(Lcom/p1/mobile/putong/data/User;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public final B(Ll/dj70;)V
    .locals 4

    .line 1
    iget-object v0, p1, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    const-string v0, "from_live_square_tab"

    .line 12
    .line 13
    iget-object v1, p1, Ll/dj70;->b:Ljava/lang/String;

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
    goto/16 :goto_0

    .line 22
    .line 23
    :cond_0
    iget-object v0, p1, Ll/dj70;->b:Ljava/lang/String;

    .line 24
    .line 25
    const-string v1, "from_discover_dating"

    .line 26
    .line 27
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/o7i;->s()Ll/lnh;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object v0, v0, Ll/lnh;->o:Lv/VDraweeView;

    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ll/o7i;->s()Ll/lnh;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object v0, v0, Ll/lnh;->r:Lv/AutoVDraweeView;

    .line 45
    .line 46
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ll/o7i;->s()Ll/lnh;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget-object v0, v0, Ll/lnh;->s:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;

    .line 54
    .line 55
    const/4 v2, 0x1

    .line 56
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Ll/o7i;->s()Ll/lnh;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iget-object v0, v0, Ll/lnh;->v:Lv/VImage;

    .line 64
    .line 65
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Ll/o7i;->s()Ll/lnh;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iget-object v0, v0, Ll/lnh;->i:Lv/VDraweeView;

    .line 73
    .line 74
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Ll/o7i;->s()Ll/lnh;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iget-object v0, v0, Ll/lnh;->s:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;

    .line 82
    .line 83
    const-string v1, "#FF69AB"

    .line 84
    .line 85
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    const-string v2, "#FF5EEA"

    .line 90
    .line 91
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->c(II)V

    .line 96
    .line 97
    .line 98
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 99
    .line 100
    iget-object v1, p1, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 101
    .line 102
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-virtual {v0, v1}, Ll/fsb0;->X0(Lcom/p1/mobile/putong/data/Picture$ImageUri;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    new-instance v1, Ll/q3d0;

    .line 115
    .line 116
    invoke-virtual {p0}, Ll/o7i;->s()Ll/lnh;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    iget-object v2, v2, Ll/lnh;->s:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;

    .line 121
    .line 122
    invoke-virtual {v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->getAvatarSize()I

    .line 123
    .line 124
    .line 125
    move-result v2

    .line 126
    invoke-virtual {p0}, Ll/o7i;->s()Ll/lnh;

    .line 127
    .line 128
    .line 129
    move-result-object v3

    .line 130
    iget-object v3, v3, Ll/lnh;->s:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;

    .line 131
    .line 132
    invoke-virtual {v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->getAvatarSize()I

    .line 133
    .line 134
    .line 135
    move-result v3

    .line 136
    invoke-direct {v1, v2, v3}, Ll/q3d0;-><init>(II)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v0, v1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->O(Ll/q3d0;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 148
    .line 149
    new-instance v2, Ll/m7i;

    .line 150
    .line 151
    invoke-direct {v2, p0}, Ll/m7i;-><init>(Ll/o7i;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v1, v0, v2}, Ll/fsb0;->F(Lcom/facebook/imagepipeline/request/ImageRequest;Ll/y20;)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {p0}, Ll/o7i;->s()Ll/lnh;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    iget-object v0, v0, Ll/lnh;->n:Landroid/widget/FrameLayout;

    .line 162
    .line 163
    invoke-virtual {p0, v0, p1}, Ll/o7i;->q(Landroid/view/View;Ll/dj70;)V

    .line 164
    .line 165
    .line 166
    return-void

    .line 167
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/o7i;->s()Ll/lnh;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    iget-object v0, v0, Ll/lnh;->o:Lv/VDraweeView;

    .line 172
    .line 173
    invoke-virtual {p0, v0, p1}, Ll/o7i;->q(Landroid/view/View;Ll/dj70;)V

    .line 174
    .line 175
    .line 176
    return-void
.end method

.method public final C(Ll/dj70;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o7i;->a:Ll/lol;

    .line 2
    .line 3
    instance-of v0, v0, Ll/lnh;

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-boolean v0, p1, Ll/dj70;->c:Z

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p1, Ll/dj70;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 12
    .line 13
    invoke-static {p1, v0}, Ll/u6i;->b(Ll/dj70;Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/o7i;->p()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    instance-of v0, v0, Lcom/p1/mobile/putong/feed/newui/topic/topicaggregation/TopicAggregationAct;

    .line 24
    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/o7i;->B(Ll/dj70;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget-object p0, p0, Ll/o7i;->c:Ll/kcg0;

    .line 32
    .line 33
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public b(Ll/dj70;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p1, Ll/dj70;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public c(Ll/dj70;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/o7i;->b:Ll/dj70;

    .line 2
    .line 3
    return-void
.end method

.method public e()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/o7i;->a:Ll/lol;

    .line 2
    .line 3
    instance-of v0, v0, Ll/lnh;

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 8
    .line 9
    iget-object v0, v0, Ll/jka;->Y:Ll/jxd0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Ll/o7i;->e:Ll/f7i;

    .line 24
    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    new-instance v0, Ll/f7i;

    .line 28
    .line 29
    invoke-direct {v0}, Ll/f7i;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Ll/o7i;->e:Ll/f7i;

    .line 33
    .line 34
    :cond_0
    iget-object v1, p0, Ll/o7i;->e:Ll/f7i;

    .line 35
    .line 36
    iget-object v2, p0, Ll/o7i;->b:Ll/dj70;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/o7i;->s()Ll/lnh;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget-object v3, v0, Ll/lnh;->j:Landroid/widget/LinearLayout;

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/o7i;->s()Ll/lnh;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object v4, v0, Ll/lnh;->k:Landroid/widget/TextView;

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/o7i;->s()Ll/lnh;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    iget-object v6, p0, Ll/lnh;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

    .line 55
    .line 56
    const/4 v5, 0x0

    .line 57
    invoke-virtual/range {v1 .. v6}, Ll/f7i;->s(Ll/dj70;Landroid/view/View;Landroid/widget/TextView;Ljava/lang/String;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;)V

    .line 58
    .line 59
    .line 60
    :cond_1
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    return-void
.end method

.method public h()V
    .locals 0

    .line 1
    return-void
.end method

.method public j()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/o7i;->y()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/o7i;->z()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/o7i;->r()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public l(Ll/dj70;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/o7i;->b:Ll/dj70;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/o7i;->C(Ll/dj70;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/o7i;->A(Ll/dj70;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public m(Ll/dj70;)V
    .locals 0

    .line 1
    return-void
.end method

.method public p()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o7i;->b:Ll/dj70;

    .line 2
    .line 3
    iget-object p0, p0, Ll/dj70;->g:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    return-object p0
.end method

.method public final q(Landroid/view/View;Ll/dj70;)V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/n7i;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2}, Ll/n7i;-><init>(Ll/o7i;Ll/dj70;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final r()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/o7i;->a:Ll/lol;

    .line 2
    .line 3
    instance-of v0, p0, Ll/lnh;

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    check-cast p0, Ll/lnh;

    .line 8
    .line 9
    iget-object v0, p0, Ll/lnh;->Q:Lv/VText;

    .line 10
    .line 11
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/lnh;->O:Lv/VText;

    .line 18
    .line 19
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Ll/lnh;->P:Lv/VText;

    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iget-object p0, p0, Ll/lnh;->P:Lv/VText;

    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method public final s()Ll/lnh;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o7i;->a:Ll/lol;

    .line 2
    .line 3
    check-cast p0, Ll/lnh;

    .line 4
    .line 5
    return-object p0
.end method

.method public final synthetic v(Ll/dj70;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p2, "from_nearby_focus"

    .line 2
    .line 3
    iget-object v0, p1, Ll/dj70;->b:Ljava/lang/String;

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
    const-string p2, "follow_photo"

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string p2, "from_nearby_falls_feed"

    .line 15
    .line 16
    iget-object v0, p1, Ll/dj70;->b:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    if-eqz p2, :cond_1

    .line 23
    .line 24
    const-string p2, "nearby_photo"

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const-string p2, ""

    .line 28
    .line 29
    :goto_0
    invoke-virtual {p0}, Ll/o7i;->p()Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    iget-object v0, p1, Ll/dj70;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 36
    .line 37
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Live;->recommendInfo:Lcom/p1/mobile/putong/data/RecommendInfo;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/data/RecommendInfo;->category:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {p0, v1, p2, v0}, Ll/orb0;->H(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p1, Ll/dj70;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 47
    .line 48
    iget p2, p1, Ll/dj70;->h:I

    .line 49
    .line 50
    add-int/lit8 p2, p2, 0x1

    .line 51
    .line 52
    iget-object v0, p1, Ll/dj70;->b:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {v0}, Ll/o7i;->t(Ljava/lang/String;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iget-object v1, p1, Ll/dj70;->b:Ljava/lang/String;

    .line 59
    .line 60
    invoke-static {v1}, Ll/o7i;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    iget-object p1, p1, Ll/dj70;->j:Ll/n570;

    .line 65
    .line 66
    invoke-static {p0, p2, v0, v1, p1}, Ll/dug;->j(Lcom/p1/mobile/putong/feed/data/Moment;ILjava/lang/String;Ljava/lang/String;Ll/n570;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final synthetic w(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/o7i;->s()Ll/lnh;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Ll/lnh;->s:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->setAvatar(Landroid/graphics/Bitmap;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public x()Lcom/p1/mobile/putong/feed/data/Moment;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o7i;->b:Ll/dj70;

    .line 2
    .line 3
    iget-object p0, p0, Ll/dj70;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    return-object p0
.end method

.method public final y()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/o7i;->a:Ll/lol;

    .line 2
    .line 3
    instance-of v0, v0, Ll/lnh;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/o7i;->x()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    iget-object v1, p0, Ll/o7i;->b:Ll/dj70;

    .line 26
    .line 27
    iget-object v1, v1, Ll/dj70;->o:Ll/r6i;

    .line 28
    .line 29
    iget-boolean v1, v1, Ll/r6i;->a:Z

    .line 30
    .line 31
    if-nez v1, :cond_0

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 34
    .line 35
    iget v0, v0, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 36
    .line 37
    const/4 v1, 0x1

    .line 38
    invoke-static {v0, v1}, Ll/q8g0;->p(IZ)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p0}, Ll/o7i;->s()Ll/lnh;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    iget-object v1, v1, Ll/lnh;->Q:Lv/VText;

    .line 47
    .line 48
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ll/o7i;->s()Ll/lnh;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    iget-object p0, p0, Ll/lnh;->Q:Lv/VText;

    .line 56
    .line 57
    const/4 v0, 0x0

    .line 58
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 59
    .line 60
    .line 61
    :cond_0
    return-void
.end method

.method public final z()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/o7i;->a:Ll/lol;

    .line 2
    .line 3
    instance-of v0, v0, Ll/lnh;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/o7i;->s()Ll/lnh;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Ll/lnh;->O:Lv/VText;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/o7i;->x()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 18
    .line 19
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/Live;->startTime:D

    .line 20
    .line 21
    invoke-static {v1, v2}, Ll/p6i;->q(D)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method
