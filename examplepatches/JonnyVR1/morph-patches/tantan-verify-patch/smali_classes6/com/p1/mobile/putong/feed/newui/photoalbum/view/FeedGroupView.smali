.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;
.super Lv/VRelative;
.source "SourceFile"


# instance fields
.field public A:Lv/VImage;

.field public B:Lv/VImage;

.field public C:Ljava/lang/String;

.field public D:Z

.field public E:Lcom/p1/mobile/putong/feed/data/Group;

.field public F:Lcom/p1/mobile/putong/feed/data/Moment;

.field public d:Lv/VRelative;

.field public e:Lv/VRelative;

.field public f:Lv/VDraweeView;

.field public g:Lv/VRelative;

.field public h:Lv/VImage;

.field public i:Lv/VLinear;

.field public j:Lv/VRelative;

.field public k:Landroid/widget/TextView;

.field public l:Lv/VLinear;

.field public m:Lv/VFrame;

.field public n:Lv/VDraweeView;

.field public o:Lv/VFrame;

.field public p:Lv/VDraweeView;

.field public q:Lv/VFrame;

.field public r:Lv/VDraweeView;

.field public s:Lv/VText;

.field public t:Lv/VImage;

.field public u:Landroid/widget/TextView;

.field public v:Lv/VFrame;

.field public w:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

.field public x:Lv/VFrame;

.field public y:Lv/VFrame;

.field public z:Lv/VDraweeView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VRelative;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private synthetic I(Landroid/view/View;)V
    .locals 5

    .line 1
    new-instance p1, Ljava/util/Random;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/util/Random;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x5

    .line 7
    invoke-virtual {p1, v0}, Ljava/util/Random;->nextInt(I)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    add-int/lit8 p1, p1, 0x1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->F:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 14
    .line 15
    invoke-static {}, Ll/pzi0;->o()J

    .line 16
    .line 17
    .line 18
    move-result-wide v1

    .line 19
    mul-int/lit16 p1, p1, 0x3e8

    .line 20
    .line 21
    int-to-long v3, p1

    .line 22
    sub-long/2addr v1, v3

    .line 23
    long-to-double v1, v1

    .line 24
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/feed/data/Moment;->setRecommendTime(D)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->z()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->E:Lcom/p1/mobile/putong/feed/data/Group;

    .line 43
    .line 44
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 45
    .line 46
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->F:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;->d(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;->a()Landroid/content/Intent;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method private getFeedGroupViewTrackingParis()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->E:Lcom/p1/mobile/putong/feed/data/Group;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 9
    .line 10
    const-string v2, "circle_id"

    .line 11
    .line 12
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->F:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    const-string v1, "moment_id"

    .line 24
    .line 25
    invoke-static {v1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    return-object v0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->I(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final B()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->v:Lv/VFrame;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->F:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 8
    .line 9
    invoke-static {v0}, Ll/ksg;->X(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->w:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->x:Lv/VFrame;

    .line 22
    .line 23
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->y:Lv/VFrame;

    .line 27
    .line 28
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->w:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->F:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 34
    .line 35
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->Z0(Lcom/p1/mobile/putong/feed/data/Moment;Z)Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->w:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->C:Ljava/lang/String;

    .line 41
    .line 42
    iget-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->D:Z

    .line 43
    .line 44
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->e1(Ljava/lang/String;Z)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->F:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 49
    .line 50
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 51
    .line 52
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-nez v0, :cond_2

    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->F:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 59
    .line 60
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 61
    .line 62
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 67
    .line 68
    instance-of v3, v0, Lcom/p1/mobile/putong/data/Video;

    .line 69
    .line 70
    if-eqz v3, :cond_1

    .line 71
    .line 72
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->w:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 73
    .line 74
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->x:Lv/VFrame;

    .line 78
    .line 79
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 80
    .line 81
    .line 82
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->y:Lv/VFrame;

    .line 83
    .line 84
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->O(Lcom/p1/mobile/putong/data/Media;)V

    .line 88
    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_1
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Picture;

    .line 92
    .line 93
    if-eqz v0, :cond_3

    .line 94
    .line 95
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->w:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 96
    .line 97
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->x:Lv/VFrame;

    .line 101
    .line 102
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->y:Lv/VFrame;

    .line 106
    .line 107
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->F:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 111
    .line 112
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 113
    .line 114
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->M(Ljava/util/List;)V

    .line 115
    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->v:Lv/VFrame;

    .line 119
    .line 120
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 121
    .line 122
    .line 123
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->w:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 124
    .line 125
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 126
    .line 127
    .line 128
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->x:Lv/VFrame;

    .line 129
    .line 130
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->y:Lv/VFrame;

    .line 134
    .line 135
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 136
    .line 137
    .line 138
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->d:Lv/VRelative;

    .line 139
    .line 140
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->v:Lv/VFrame;

    .line 141
    .line 142
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 143
    .line 144
    .line 145
    move-result p0

    .line 146
    if-eqz p0, :cond_4

    .line 147
    .line 148
    const/high16 p0, 0x41900000    # 18.0f

    .line 149
    .line 150
    :goto_1
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 151
    .line 152
    .line 153
    move-result p0

    .line 154
    goto :goto_2

    .line 155
    :cond_4
    const/high16 p0, 0x41700000    # 15.0f

    .line 156
    .line 157
    goto :goto_1

    .line 158
    :goto_2
    invoke-static {v0, p0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 159
    .line 160
    .line 161
    return-void
.end method

.method public final H(Ljava/util/List;I)V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;I)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->k:Landroid/widget/TextView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->E:Lcom/p1/mobile/putong/feed/data/Group;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Group;->name:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x3

    .line 15
    const/4 v2, 0x0

    .line 16
    if-lt v0, v1, :cond_0

    .line 17
    .line 18
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->n:Lv/VDraweeView;

    .line 21
    .line 22
    const/4 v3, 0x2

    .line 23
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    check-cast v3, Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-virtual {v0, v1, v3}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 38
    .line 39
    .line 40
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->p:Lv/VDraweeView;

    .line 43
    .line 44
    const/4 v3, 0x1

    .line 45
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    check-cast v3, Lcom/p1/mobile/putong/data/User;

    .line 50
    .line 51
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-virtual {v0, v1, v3}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 60
    .line 61
    .line 62
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 63
    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->r:Lv/VDraweeView;

    .line 65
    .line 66
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 71
    .line 72
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 81
    .line 82
    .line 83
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->C:Ljava/lang/String;

    .line 84
    .line 85
    const-string v0, "from_nearby_focus"

    .line 86
    .line 87
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    const-string v0, ""

    .line 92
    .line 93
    if-eqz p1, :cond_2

    .line 94
    .line 95
    const/16 p1, 0x63

    .line 96
    .line 97
    if-le p2, p1, :cond_1

    .line 98
    .line 99
    const-string p1, "99+"

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 103
    .line 104
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->s:Lv/VText;

    .line 118
    .line 119
    new-instance v1, Ljava/lang/StringBuilder;

    .line 120
    .line 121
    const-string v3, "\u7b49\u4eba\u66f4\u65b0\u4e86"

    .line 122
    .line 123
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    const-string p1, "\u6761\u5185\u5bb9"

    .line 130
    .line 131
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 139
    .line 140
    .line 141
    goto :goto_1

    .line 142
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->s:Lv/VText;

    .line 143
    .line 144
    new-instance p2, Ljava/lang/StringBuilder;

    .line 145
    .line 146
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 147
    .line 148
    .line 149
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->E:Lcom/p1/mobile/putong/feed/data/Group;

    .line 150
    .line 151
    iget v1, v1, Lcom/p1/mobile/putong/feed/data/Group;->userCounter:I

    .line 152
    .line 153
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    const-string v1, "\u4eba\u6b63\u5728\u5708\u5b50\u4e2d\u70ed\u804a"

    .line 157
    .line 158
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object p2

    .line 165
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 166
    .line 167
    .line 168
    :goto_1
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 169
    .line 170
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->F:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 171
    .line 172
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 173
    .line 174
    invoke-virtual {p1, p2}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    if-eqz p1, :cond_3

    .line 179
    .line 180
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 181
    .line 182
    :cond_3
    const/16 p1, 0x8

    .line 183
    .line 184
    invoke-static {v0, p1}, Ll/h9i;->k(Ljava/lang/String;I)Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    new-instance p2, Landroid/text/SpannableStringBuilder;

    .line 189
    .line 190
    new-instance v0, Ljava/lang/StringBuilder;

    .line 191
    .line 192
    const-string v1, "@"

    .line 193
    .line 194
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->F:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 198
    .line 199
    invoke-static {v1, p1}, Ll/at0;->a(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object p1

    .line 203
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    .line 205
    .line 206
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object p1

    .line 210
    invoke-direct {p2, p1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 211
    .line 212
    .line 213
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->F:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 214
    .line 215
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 216
    .line 217
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 218
    .line 219
    .line 220
    move-result p1

    .line 221
    if-nez p1, :cond_4

    .line 222
    .line 223
    const-string p1, ": "

    .line 224
    .line 225
    invoke-virtual {p2, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 226
    .line 227
    .line 228
    :cond_4
    invoke-virtual {p2}, Landroid/text/SpannableStringBuilder;->length()I

    .line 229
    .line 230
    .line 231
    move-result p1

    .line 232
    new-instance v0, Lv/text/CustomTypefaceSpan;

    .line 233
    .line 234
    const-string v1, "sans-serif"

    .line 235
    .line 236
    sget-object v3, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 237
    .line 238
    invoke-direct {v0, v1, v3}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;)V

    .line 239
    .line 240
    .line 241
    const/16 v1, 0x21

    .line 242
    .line 243
    invoke-virtual {p2, v0, v2, p1, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 244
    .line 245
    .line 246
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->F:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 247
    .line 248
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 249
    .line 250
    invoke-virtual {p2, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 251
    .line 252
    .line 253
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->u:Landroid/widget/TextView;

    .line 254
    .line 255
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 256
    .line 257
    .line 258
    new-instance p1, Ll/m8h;

    .line 259
    .line 260
    invoke-direct {p1, p0}, Ll/m8h;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;)V

    .line 261
    .line 262
    .line 263
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 264
    .line 265
    .line 266
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->w:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 267
    .line 268
    const p2, 0x7fffffff

    .line 269
    .line 270
    .line 271
    invoke-virtual {p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;->setMaxWidth(I)V

    .line 272
    .line 273
    .line 274
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->B()V

    .line 275
    .line 276
    .line 277
    return-void
.end method

.method public L(Ljava/lang/String;ZLcom/p1/mobile/putong/feed/data/Moment;Ll/pf60;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;",
            "Lcom/p1/mobile/putong/feed/data/Group;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p4, :cond_5

    .line 3
    .line 4
    if-eqz p3, :cond_5

    .line 5
    .line 6
    iget-object v1, p4, Ll/pf60;->a:Ljava/lang/Object;

    .line 7
    .line 8
    if-eqz v1, :cond_5

    .line 9
    .line 10
    iget-object p4, p4, Ll/pf60;->b:Ljava/lang/Object;

    .line 11
    .line 12
    if-nez p4, :cond_0

    .line 13
    .line 14
    goto/16 :goto_1

    .line 15
    .line 16
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->C:Ljava/lang/String;

    .line 17
    .line 18
    iput-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->D:Z

    .line 19
    .line 20
    check-cast p4, Lcom/p1/mobile/putong/feed/data/Group;

    .line 21
    .line 22
    iput-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->E:Lcom/p1/mobile/putong/feed/data/Group;

    .line 23
    .line 24
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->F:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 25
    .line 26
    check-cast v1, Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;

    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->d:Lv/VRelative;

    .line 29
    .line 30
    const/4 p2, 0x1

    .line 31
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->g:Lv/VRelative;

    .line 35
    .line 36
    invoke-static {}, Ll/cmg;->O()Z

    .line 37
    .line 38
    .line 39
    move-result p3

    .line 40
    invoke-static {p1, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->f:Lv/VDraweeView;

    .line 44
    .line 45
    invoke-static {}, Ll/cmg;->O()Z

    .line 46
    .line 47
    .line 48
    move-result p3

    .line 49
    xor-int/2addr p3, p2

    .line 50
    invoke-static {p1, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    invoke-static {}, Ll/cmg;->O()Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-nez p1, :cond_1

    .line 58
    .line 59
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 60
    .line 61
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->f:Lv/VDraweeView;

    .line 62
    .line 63
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->E:Lcom/p1/mobile/putong/feed/data/Group;

    .line 64
    .line 65
    iget-object p4, p4, Lcom/p1/mobile/putong/feed/data/Group;->headIcon:Ljava/lang/String;

    .line 66
    .line 67
    const/high16 v2, 0x42180000    # 38.0f

    .line 68
    .line 69
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    const/high16 v3, 0x42200000    # 40.0f

    .line 74
    .line 75
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    invoke-virtual {p1, p3, p4, v2, v3}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 80
    .line 81
    .line 82
    :cond_1
    new-instance p1, Ljava/util/ArrayList;

    .line 83
    .line 84
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 85
    .line 86
    .line 87
    iget-object p3, v1, Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;->userIds:Ljava/util/List;

    .line 88
    .line 89
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 90
    .line 91
    .line 92
    move-result-object p3

    .line 93
    :cond_2
    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    .line 94
    .line 95
    .line 96
    move-result p4

    .line 97
    if-eqz p4, :cond_3

    .line 98
    .line 99
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object p4

    .line 103
    check-cast p4, Ljava/lang/String;

    .line 104
    .line 105
    sget-object v2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 106
    .line 107
    invoke-virtual {v2, p4}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 108
    .line 109
    .line 110
    move-result-object p4

    .line 111
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result v2

    .line 115
    if-eqz v2, :cond_2

    .line 116
    .line 117
    invoke-interface {p1, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_3
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->l:Lv/VLinear;

    .line 122
    .line 123
    iget p4, v1, Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;->unread:I

    .line 124
    .line 125
    const/4 v2, 0x3

    .line 126
    if-lt p4, v2, :cond_4

    .line 127
    .line 128
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 129
    .line 130
    .line 131
    move-result p4

    .line 132
    if-lt p4, v2, :cond_4

    .line 133
    .line 134
    move v0, p2

    .line 135
    :cond_4
    invoke-static {p3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 136
    .line 137
    .line 138
    iget p2, v1, Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;->unread:I

    .line 139
    .line 140
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->H(Ljava/util/List;I)V

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    :cond_5
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->d:Lv/VRelative;

    .line 145
    .line 146
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 147
    .line 148
    .line 149
    return-void
.end method

.method public final M(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->F:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->x:Lv/VFrame;

    .line 4
    .line 5
    const/4 v4, 0x1

    .line 6
    const/4 v5, 0x0

    .line 7
    const-string v3, ""

    .line 8
    .line 9
    move-object v1, p1

    .line 10
    invoke-static/range {v0 .. v5}, Ll/qtg;->f(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/util/List;Landroid/widget/FrameLayout;Ljava/lang/String;ZLl/a30;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final O(Lcom/p1/mobile/putong/data/Media;)V
    .locals 3

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/Video;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {}, Ll/ksg;->y()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    int-to-float v0, v0

    .line 13
    invoke-static {v0}, Lcom/facebook/drawee/generic/RoundingParams;->c(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Lcom/facebook/drawee/generic/RoundingParams$RoundingMethod;->BITMAP_ONLY:Lcom/facebook/drawee/generic/RoundingParams$RoundingMethod;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/generic/RoundingParams;->w(Lcom/facebook/drawee/generic/RoundingParams$RoundingMethod;)Lcom/facebook/drawee/generic/RoundingParams;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->z:Lv/VDraweeView;

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ll/wlj;

    .line 30
    .line 31
    invoke-virtual {v1, v0}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->A:Lv/VImage;

    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->B:Lv/VImage;

    .line 41
    .line 42
    sget v1, Ll/lbc0;->B6:I

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 48
    .line 49
    const-string v1, "raw"

    .line 50
    .line 51
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_1

    .line 56
    .line 57
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_1

    .line 64
    .line 65
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 66
    .line 67
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->z:Lv/VDraweeView;

    .line 68
    .line 69
    const/high16 v2, 0x42bc0000    # 94.0f

    .line 70
    .line 71
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/data/Picture;->calculatedWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 80
    .line 81
    .line 82
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->z:Lv/VDraweeView;

    .line 83
    .line 84
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 85
    .line 86
    invoke-static {p1}, Lcom/p1/mobile/putong/data/Media;->URL_TO_CACHEKEY(Ljava/lang/String;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {p0, p1}, Lv/VDraweeView;->setZoomAnimationKey(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    :cond_1
    :goto_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {p0, v0, v1, v0, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->q(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/n8h;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public z()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->getFeedGroupViewTrackingParis()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->C:Ljava/lang/String;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->D:Z

    .line 8
    .line 9
    invoke-static {v1, p0}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v1, 0x0

    .line 14
    new-array v1, v1, [Ll/pf60;

    .line 15
    .line 16
    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, [Ll/pf60;

    .line 21
    .line 22
    const-string v1, "e_circle_update"

    .line 23
    .line 24
    invoke-static {v1, p0, v0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
