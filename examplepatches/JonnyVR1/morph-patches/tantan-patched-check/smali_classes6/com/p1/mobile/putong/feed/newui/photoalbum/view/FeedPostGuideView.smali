.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;
.super Lv/VRelative;
.source "SourceFile"


# instance fields
.field public d:Lv/VRelative;

.field public e:Lv/VImage;

.field public f:Lv/VText;

.field public g:Lv/VLinear;

.field public h:Landroid/widget/TextView;

.field public i:Lv/VText;

.field public j:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

.field public k:I

.field public l:Lcom/p1/mobile/putong/feed/data/TopicOperations;

.field public m:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation
.end field

.field public n:Z


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

.method private synthetic H(Landroid/view/View;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->B()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->l:Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 5
    .line 6
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->postGuide:Lcom/p1/mobile/putong/feed/data/PostGuide;

    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/PostGuide;->topicId:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->l:Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 20
    .line 21
    const-string v2, "man_made"

    .line 22
    .line 23
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->m:Ljava/util/List;

    .line 30
    .line 31
    new-instance v2, Ll/vuh;

    .line 32
    .line 33
    invoke-direct {v2, p1}, Ll/vuh;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v0, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    move-object v8, p1

    .line 41
    check-cast v8, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 42
    .line 43
    invoke-static {v8}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_0

    .line 48
    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->j:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 50
    .line 51
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    new-array p1, v1, [Lcom/p1/mobile/putong/data/Media;

    .line 56
    .line 57
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->l:Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 62
    .line 63
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->postGuide:Lcom/p1/mobile/putong/feed/data/PostGuide;

    .line 64
    .line 65
    iget-object v6, p1, Lcom/p1/mobile/putong/feed/data/PostGuide;->momentValue:Ljava/lang/String;

    .line 66
    .line 67
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v7

    .line 73
    const/4 v4, 0x1

    .line 74
    const-string v5, "moment_post_guide"

    .line 75
    .line 76
    invoke-static/range {v2 .. v8}, Ll/cn40;->m0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->j:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 81
    .line 82
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    new-array p1, v1, [Lcom/p1/mobile/putong/data/Media;

    .line 87
    .line 88
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->l:Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 93
    .line 94
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->postGuide:Lcom/p1/mobile/putong/feed/data/PostGuide;

    .line 95
    .line 96
    iget-object v6, p1, Lcom/p1/mobile/putong/feed/data/PostGuide;->momentValue:Ljava/lang/String;

    .line 97
    .line 98
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 99
    .line 100
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v7

    .line 104
    const/4 v4, 0x1

    .line 105
    const-string v5, "moment_post_guide"

    .line 106
    .line 107
    invoke-static/range {v2 .. v7}, Ll/cn40;->l0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    return-void
.end method

.method private getGuideViewTrackingParis()Ljava/util/List;
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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->l:Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const-string v2, "moment_post_guide_type"

    .line 15
    .line 16
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->l:Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->id:Ljava/lang/String;

    .line 26
    .line 27
    const-string v1, "moment_post_guide_id"

    .line 28
    .line 29
    invoke-static {v1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    return-object v0
.end method

.method private getPageId()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/cmg;->s()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->k:I

    .line 8
    .line 9
    const/16 v0, 0xe

    .line 10
    .line 11
    if-ne p0, v0, :cond_0

    .line 12
    .line 13
    const-string p0, "p_discover_dating"

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    const/16 v0, 0xf

    .line 17
    .line 18
    if-ne p0, v0, :cond_1

    .line 19
    .line 20
    const-string p0, "p_discover_discussion"

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    const-string p0, "p_follow"

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_2
    const-string p0, "p_nearby"

    .line 27
    .line 28
    return-object p0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->H(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic q(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method private r()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->l:Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 4
    .line 5
    const-string v1, "album_num_inc"

    .line 6
    .line 7
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->h:Ll/cu9;

    .line 14
    .line 15
    iget-object v0, v0, Ll/cu9;->H:Ll/vxd0;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->j:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->A:Ll/v670;

    .line 20
    .line 21
    iget v1, v1, Ll/v670;->o:I

    .line 22
    .line 23
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->h:Landroid/widget/TextView;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->l:Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 33
    .line 34
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->postGuide:Lcom/p1/mobile/putong/feed/data/PostGuide;

    .line 35
    .line 36
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/PostGuide;->title:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->l:Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->postGuide:Lcom/p1/mobile/putong/feed/data/PostGuide;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/PostGuide;->subTitle:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->i:Lv/VText;

    .line 52
    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    const/16 v0, 0x8

    .line 56
    .line 57
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    const/4 v0, 0x0

    .line 62
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->i:Lv/VText;

    .line 66
    .line 67
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->l:Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 68
    .line 69
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->postGuide:Lcom/p1/mobile/putong/feed/data/PostGuide;

    .line 70
    .line 71
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/PostGuide;->subTitle:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    .line 75
    .line 76
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->d:Lv/VRelative;

    .line 77
    .line 78
    new-instance v1, Ll/uuh;

    .line 79
    .line 80
    invoke-direct {v1, p0}, Ll/uuh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v1}, Lv/VRelative;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method


# virtual methods
.method public B()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->getGuideViewTrackingParis()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->getPageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v1, 0x0

    .line 10
    new-array v1, v1, [Ll/pf60;

    .line 11
    .line 12
    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, [Ll/pf60;

    .line 17
    .line 18
    const-string v1, "e_moment_post_guide"

    .line 19
    .line 20
    invoke-static {v1, p0, v0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public I(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;ILl/pf60;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;",
            "I",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/feed/data/TopicOperations;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->j:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->k:I

    .line 4
    .line 5
    iget-object p1, p3, Ll/pf60;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Ljava/util/List;

    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->m:Ljava/util/List;

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->l:Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->l:Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 22
    .line 23
    iget-object p2, p3, Ll/pf60;->a:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast p2, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 26
    .line 27
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 28
    .line 29
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-nez p1, :cond_0

    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->l:Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 36
    .line 37
    iget p1, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->position:I

    .line 38
    .line 39
    iget-object p2, p3, Ll/pf60;->a:Ljava/lang/Object;

    .line 40
    .line 41
    move-object v0, p2

    .line 42
    check-cast v0, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 43
    .line 44
    iget v0, v0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->position:I

    .line 45
    .line 46
    if-ne p1, v0, :cond_0

    .line 47
    .line 48
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->n:Z

    .line 49
    .line 50
    if-nez p1, :cond_0

    .line 51
    .line 52
    check-cast p2, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 53
    .line 54
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->l:Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->M()V

    .line 57
    .line 58
    .line 59
    :cond_0
    iget-object p1, p3, Ll/pf60;->a:Ljava/lang/Object;

    .line 60
    .line 61
    check-cast p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 62
    .line 63
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->l:Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 64
    .line 65
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->r()V

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->d:Lv/VRelative;

    .line 69
    .line 70
    const/4 p1, 0x1

    .line 71
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public L()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->n:Z

    .line 3
    .line 4
    return-void
.end method

.method public M()V
    .locals 10

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    new-instance v2, Ll/byd0;

    .line 7
    .line 8
    new-instance v3, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v4, "show_guide_time_"

    .line 11
    .line 12
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->l:Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 16
    .line 17
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 18
    .line 19
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->k:I

    .line 34
    .line 35
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    const-wide/16 v4, 0x0

    .line 43
    .line 44
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 45
    .line 46
    .line 47
    move-result-object v6

    .line 48
    invoke-direct {v2, v3, v6}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    check-cast v3, Ljava/lang/Long;

    .line 56
    .line 57
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 58
    .line 59
    .line 60
    move-result-wide v6

    .line 61
    invoke-static {}, Ll/pzi0;->o()J

    .line 62
    .line 63
    .line 64
    move-result-wide v8

    .line 65
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    invoke-virtual {v2, v3}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->l:Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 73
    .line 74
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 75
    .line 76
    const-string v3, "man_made"

    .line 77
    .line 78
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    const/4 v3, 0x0

    .line 83
    if-eqz v2, :cond_2

    .line 84
    .line 85
    new-instance v2, Ll/vxd0;

    .line 86
    .line 87
    new-instance v8, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    const-string v9, "show_man_made_guide_count_"

    .line 90
    .line 91
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    iget-object v9, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->l:Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 95
    .line 96
    iget-object v9, v9, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 97
    .line 98
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 102
    .line 103
    .line 104
    move-result-object v9

    .line 105
    invoke-interface {v9}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v9

    .line 109
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    iget v9, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->k:I

    .line 113
    .line 114
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v8

    .line 121
    invoke-direct {v2, v8, v3}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v8

    .line 128
    check-cast v8, Ljava/lang/Integer;

    .line 129
    .line 130
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    .line 131
    .line 132
    .line 133
    move-result v8

    .line 134
    cmp-long v4, v6, v4

    .line 135
    .line 136
    if-gtz v4, :cond_0

    .line 137
    .line 138
    invoke-virtual {v2, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    goto :goto_0

    .line 142
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 143
    .line 144
    .line 145
    move-result-wide v4

    .line 146
    invoke-static {v6, v7, v4, v5}, Ll/p6i;->l(JJ)Z

    .line 147
    .line 148
    .line 149
    move-result v4

    .line 150
    if-nez v4, :cond_1

    .line 151
    .line 152
    invoke-virtual {v2, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    goto :goto_0

    .line 156
    :cond_1
    invoke-static {}, Ll/pu20;->n()I

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    if-ge v8, v1, :cond_2

    .line 161
    .line 162
    add-int/2addr v8, v0

    .line 163
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    invoke-virtual {v2, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    :cond_2
    :goto_0
    iput-boolean v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->n:Z

    .line 171
    .line 172
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->getGuideViewTrackingParis()Ljava/util/List;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->getPageId()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    new-array v1, v3, [Ll/pf60;

    .line 181
    .line 182
    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    check-cast v0, [Ll/pf60;

    .line 187
    .line 188
    const-string v1, "e_moment_post_guide"

    .line 189
    .line 190
    invoke-static {v1, p0, v0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 191
    .line 192
    .line 193
    return-void
.end method

.method public getShowTopicOperations()Lcom/p1/mobile/putong/feed/data/TopicOperations;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->l:Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 2
    .line 3
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 3

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
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->z(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->d:Lv/VRelative;

    .line 13
    .line 14
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->f:Lv/VText;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-virtual {p0, v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final z(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/wuh;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
