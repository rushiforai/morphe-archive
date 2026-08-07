.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$c;
.super Ll/h80;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/h80<",
        "Lcom/p1/mobile/putong/feed/data/Moment;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic i:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$c;->i:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/h80;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public f(Landroid/view/ViewGroup;Landroid/view/ViewGroup;)V
    .locals 2

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$c;->i:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    const v0, 0x1020002

    .line 6
    .line 7
    .line 8
    invoke-virtual {p2, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    invoke-static {}, Ll/cmg;->s()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$c;->i:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->X()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    sget p1, Ll/hdc0;->g1:I

    .line 27
    .line 28
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$c;->i:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 36
    .line 37
    const-class v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 38
    .line 39
    invoke-virtual {v0, v1, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->P(Ljava/lang/Class;Landroid/view/View;)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 44
    .line 45
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$c;->i:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 46
    .line 47
    iget v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->j:I

    .line 48
    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    const/16 v1, 0xe

    .line 52
    .line 53
    if-eq v0, v1, :cond_2

    .line 54
    .line 55
    const/16 v1, 0x11

    .line 56
    .line 57
    if-eq v0, v1, :cond_2

    .line 58
    .line 59
    const/16 v1, 0x12

    .line 60
    .line 61
    if-ne v0, v1, :cond_1

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_1
    const/4 p2, 0x0

    .line 65
    goto :goto_2

    .line 66
    :cond_2
    :goto_1
    sget v0, Ll/hdc0;->R:I

    .line 67
    .line 68
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    check-cast p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 73
    .line 74
    :goto_2
    if-nez p1, :cond_3

    .line 75
    .line 76
    goto :goto_3

    .line 77
    :cond_3
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$c$a;

    .line 78
    .line 79
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$c$a;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$c;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 83
    .line 84
    .line 85
    if-nez p2, :cond_4

    .line 86
    .line 87
    :goto_3
    return-void

    .line 88
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$c;->i:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 89
    .line 90
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->K(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;)Ll/h80;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {p1, p2}, Ll/h80;->p(Landroid/view/View;)V

    .line 95
    .line 96
    .line 97
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$c$b;

    .line 98
    .line 99
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$c$b;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$c;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p2, p1}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public bridge synthetic k(Ljava/lang/Object;ILandroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$c;->s(Lcom/p1/mobile/putong/feed/data/Moment;ILandroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic m(Ljava/lang/Object;IJLandroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$c;->t(Lcom/p1/mobile/putong/feed/data/Moment;IJLandroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/feed/data/Moment;ILandroid/view/View;)V
    .locals 0

    .line 1
    instance-of p2, p3, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$c;->i:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 6
    .line 7
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->N(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 8
    .line 9
    .line 10
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 11
    .line 12
    iget-object p0, p0, Ll/jka;->D0:Ljava/util/List;

    .line 13
    .line 14
    iget-object p2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 15
    .line 16
    invoke-interface {p0, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-nez p0, :cond_0

    .line 21
    .line 22
    invoke-static {}, Ll/pzi0;->o()J

    .line 23
    .line 24
    .line 25
    move-result-wide p2

    .line 26
    iput-wide p2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->momentViewTime:J

    .line 27
    .line 28
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 29
    .line 30
    iget-object p0, p0, Ll/jka;->F0:Ljava/util/List;

    .line 31
    .line 32
    iget-object p2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 33
    .line 34
    invoke-interface {p0, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-nez p0, :cond_0

    .line 39
    .line 40
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 41
    .line 42
    iget-object p0, p0, Ll/jka;->F0:Ljava/util/List;

    .line 43
    .line 44
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 45
    .line 46
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method

.method public t(Lcom/p1/mobile/putong/feed/data/Moment;IJLandroid/view/View;)V
    .locals 6

    .line 1
    instance-of v0, p5, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-wide v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->momentViewTime:J

    .line 6
    .line 7
    const-wide/16 v2, -0x1

    .line 8
    .line 9
    cmp-long v0, v0, v2

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ll/pzi0;->o()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    iget-wide v2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->momentViewTime:J

    .line 18
    .line 19
    sub-long/2addr v0, v2

    .line 20
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$c;->i:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 21
    .line 22
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->L(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;)J

    .line 23
    .line 24
    .line 25
    move-result-wide v2

    .line 26
    const-wide/16 v4, 0x3e8

    .line 27
    .line 28
    mul-long/2addr v2, v4

    .line 29
    cmp-long v0, v0, v2

    .line 30
    .line 31
    if-ltz v0, :cond_0

    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 34
    .line 35
    iget-object v0, v0, Ll/jka;->D0:Ljava/util/List;

    .line 36
    .line 37
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 38
    .line 39
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_0

    .line 44
    .line 45
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 46
    .line 47
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ll/jka;->z6(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    :cond_0
    invoke-static {p5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    instance-of v0, p5, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;

    .line 59
    .line 60
    if-eqz v0, :cond_1

    .line 61
    .line 62
    check-cast p5, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;

    .line 63
    .line 64
    invoke-virtual {p5}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->a0()V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_1
    invoke-static {p5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_2

    .line 73
    .line 74
    instance-of v0, p5, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;

    .line 75
    .line 76
    if-eqz v0, :cond_2

    .line 77
    .line 78
    check-cast p5, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;

    .line 79
    .line 80
    invoke-virtual {p5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->L()V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_2
    invoke-static {p5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-eqz v0, :cond_3

    .line 89
    .line 90
    instance-of v0, p5, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;

    .line 91
    .line 92
    if-eqz v0, :cond_3

    .line 93
    .line 94
    return-void

    .line 95
    :cond_3
    invoke-static {p5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-eqz v0, :cond_4

    .line 100
    .line 101
    instance-of v0, p5, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;

    .line 102
    .line 103
    if-eqz v0, :cond_4

    .line 104
    .line 105
    check-cast p5, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;

    .line 106
    .line 107
    invoke-virtual {p5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;->V()V

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :cond_4
    invoke-static {p5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-eqz v0, :cond_5

    .line 116
    .line 117
    instance-of v0, p5, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;

    .line 118
    .line 119
    if-eqz v0, :cond_5

    .line 120
    .line 121
    return-void

    .line 122
    :cond_5
    invoke-static {p5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-eqz v0, :cond_6

    .line 127
    .line 128
    instance-of v0, p5, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;

    .line 129
    .line 130
    if-eqz v0, :cond_6

    .line 131
    .line 132
    return-void

    .line 133
    :cond_6
    invoke-static {p5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    if-eqz v0, :cond_7

    .line 138
    .line 139
    instance-of v0, p5, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;

    .line 140
    .line 141
    if-eqz v0, :cond_7

    .line 142
    .line 143
    return-void

    .line 144
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$c;->i:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 145
    .line 146
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    .line 147
    .line 148
    iget-boolean v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->i:Z

    .line 149
    .line 150
    invoke-static {v1, v0}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 155
    .line 156
    .line 157
    move-result v1

    .line 158
    if-eqz v1, :cond_8

    .line 159
    .line 160
    return-void

    .line 161
    :cond_8
    invoke-static {p5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result v1

    .line 165
    if-eqz v1, :cond_9

    .line 166
    .line 167
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$c;->i:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 168
    .line 169
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->X()Z

    .line 170
    .line 171
    .line 172
    move-result v1

    .line 173
    if-eqz v1, :cond_9

    .line 174
    .line 175
    invoke-static {}, Ll/cmg;->y0()Z

    .line 176
    .line 177
    .line 178
    move-result v1

    .line 179
    if-eqz v1, :cond_9

    .line 180
    .line 181
    invoke-virtual {p5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 182
    .line 183
    .line 184
    move-result-object p5

    .line 185
    check-cast p5, Landroidx/recyclerview/widget/RecyclerView$p;

    .line 186
    .line 187
    invoke-static {}, Ll/pzi0;->o()J

    .line 188
    .line 189
    .line 190
    move-result-wide v1

    .line 191
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$c;->i:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 192
    .line 193
    iget-wide v3, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->z:J

    .line 194
    .line 195
    sub-long/2addr v1, v3

    .line 196
    invoke-virtual {p5}, Landroidx/recyclerview/widget/RecyclerView$p;->f()Z

    .line 197
    .line 198
    .line 199
    move-result p5

    .line 200
    if-nez p5, :cond_9

    .line 201
    .line 202
    const-wide/16 v3, 0x12c

    .line 203
    .line 204
    cmp-long p5, v1, v3

    .line 205
    .line 206
    if-gez p5, :cond_9

    .line 207
    .line 208
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$c;->i:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 209
    .line 210
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->M(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;)Z

    .line 211
    .line 212
    .line 213
    :cond_9
    const-string p0, "moment_id"

    .line 214
    .line 215
    iget-object p5, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 216
    .line 217
    invoke-static {p0, p5}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 218
    .line 219
    .line 220
    move-result-object p0

    .line 221
    const-string p5, "owner_id"

    .line 222
    .line 223
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 224
    .line 225
    invoke-static {p5, v1}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 226
    .line 227
    .line 228
    move-result-object p5

    .line 229
    new-instance v1, Ljava/lang/StringBuilder;

    .line 230
    .line 231
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 232
    .line 233
    .line 234
    invoke-virtual {v1, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 235
    .line 236
    .line 237
    const-string p3, ""

    .line 238
    .line 239
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 240
    .line 241
    .line 242
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object p3

    .line 246
    const-string p4, "moment_exit"

    .line 247
    .line 248
    invoke-static {p4, p3}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 249
    .line 250
    .line 251
    move-result-object p3

    .line 252
    const-string p4, "order"

    .line 253
    .line 254
    invoke-static {p4, p2}, Ll/tfj0$a;->f(Ljava/lang/String;I)Ll/tfj0$a;

    .line 255
    .line 256
    .line 257
    move-result-object p2

    .line 258
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 259
    .line 260
    .line 261
    move-result-object p4

    .line 262
    invoke-virtual {p4, p1}, Ll/er60;->y(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object p1

    .line 266
    const-string p4, "moment_type"

    .line 267
    .line 268
    invoke-static {p4, p1}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 269
    .line 270
    .line 271
    move-result-object p1

    .line 272
    filled-new-array {p0, p5, p3, p2, p1}, [Ll/tfj0$a;

    .line 273
    .line 274
    .line 275
    move-result-object p0

    .line 276
    const-string p1, "e_moment_exit"

    .line 277
    .line 278
    invoke-static {p1, v0, p0}, Ll/tfj0;->f(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 279
    .line 280
    .line 281
    return-void
.end method
