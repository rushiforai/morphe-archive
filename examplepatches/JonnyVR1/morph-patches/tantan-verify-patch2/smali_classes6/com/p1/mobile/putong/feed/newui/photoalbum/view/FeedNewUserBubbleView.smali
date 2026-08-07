.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;
.super Lv/VRelative;
.source "SourceFile"


# instance fields
.field public d:Lv/VRelative;

.field public e:Lv/VImage;

.field public f:Lv/VText;

.field public g:Lv/VLinear;

.field public h:Landroid/widget/TextView;

.field public i:Lv/VText;

.field public j:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

.field public k:Lcom/p1/mobile/putong/feed/data/TopicOperations;

.field public l:I

.field public m:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VRelative;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;->H(Landroid/content/Context;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;->H(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;->H(Landroid/content/Context;)V

    return-void
.end method

.method private H(Landroid/content/Context;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    invoke-virtual {p0, v0, v1, v0, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p0, p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;->z(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;->f:Lv/VText;

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-virtual {p1, v2, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;->d:Lv/VRelative;

    .line 24
    .line 25
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private synthetic I(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;->Q()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private Q()V
    .locals 9

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;->B()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;->k:Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;->k:Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->publishGuide:Lcom/p1/mobile/putong/feed/data/PublishGuide;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->new_()Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 23
    .line 24
    .line 25
    move-result-object v7

    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;->k:Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->publishGuide:Lcom/p1/mobile/putong/feed/data/PublishGuide;

    .line 29
    .line 30
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/data/PublishGuide;->topicId:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v7, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/PublishGuide;->topicName:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v0, v7, Lcom/p1/mobile/putong/feed/data/TopicMoment;->name:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;->j:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    const/4 v0, 0x0

    .line 45
    new-array v0, v0, [Lcom/p1/mobile/putong/data/Media;

    .line 46
    .line 47
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;->k:Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->publishGuide:Lcom/p1/mobile/putong/feed/data/PublishGuide;

    .line 54
    .line 55
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/data/PublishGuide;->momentValue:Ljava/lang/String;

    .line 56
    .line 57
    const/4 v6, 0x0

    .line 58
    const/4 v8, 0x0

    .line 59
    const/4 v3, 0x0

    .line 60
    const-string v4, "newuser_checkin"

    .line 61
    .line 62
    invoke-static/range {v1 .. v8}, Ll/cn40;->n0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/TopicMoment;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    :cond_0
    return-void
.end method

.method private getPageId()Ljava/lang/String;
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;->l:I

    .line 2
    .line 3
    const/16 v0, 0xc

    .line 4
    .line 5
    if-eq p0, v0, :cond_2

    .line 6
    .line 7
    const/16 v0, 0xe

    .line 8
    .line 9
    if-eq p0, v0, :cond_1

    .line 10
    .line 11
    const/16 v0, 0xf

    .line 12
    .line 13
    if-eq p0, v0, :cond_0

    .line 14
    .line 15
    const-string p0, "p_follow"

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    const-string p0, "p_discover_discussion"

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_1
    const-string p0, "p_discover_dating"

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_2
    const-string p0, "p_like"

    .line 25
    .line 26
    return-object p0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;->L(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;->I(Landroid/view/View;)V

    return-void
.end method

.method private r()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;->d:Lv/VRelative;

    .line 2
    .line 3
    new-instance v1, Ll/wjh;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/wjh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public B()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;->getPageId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    new-array v0, v0, [Ll/pf60;

    .line 7
    .line 8
    const-string v1, "e_newuser_checkin_moment"

    .line 9
    .line 10
    invoke-static {v1, p0, v0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic L(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;->d:Lv/VRelative;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public M(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;->j:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;->l:I

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;->r()V

    .line 6
    .line 7
    .line 8
    sget-object p2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 9
    .line 10
    iget-object p2, p2, Ll/jka;->A1:Lrx/subjects/a;

    .line 11
    .line 12
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    new-instance p2, Ll/vjh;

    .line 17
    .line 18
    invoke-direct {p2, p0}, Ll/vjh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;)V

    .line 19
    .line 20
    .line 21
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public O(Lcom/p1/mobile/putong/feed/data/TopicOperations;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 4
    .line 5
    const-string v1, "newUserAIMoment"

    .line 6
    .line 7
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;->k:Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->publishGuide:Lcom/p1/mobile/putong/feed/data/PublishGuide;

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;->h:Landroid/widget/TextView;

    .line 20
    .line 21
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/PublishGuide;->title:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;->i:Lv/VText;

    .line 27
    .line 28
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/PublishGuide;->subTitle:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;->d:Lv/VRelative;

    .line 34
    .line 35
    const/4 v0, 0x1

    .line 36
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;->m:Z

    .line 40
    .line 41
    if-nez p1, :cond_0

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;->P()V

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void

    .line 47
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;->d:Lv/VRelative;

    .line 48
    .line 49
    const/4 p1, 0x0

    .line 50
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public P()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;->m:Z

    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;->getPageId()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const/4 v0, 0x0

    .line 9
    new-array v0, v0, [Ll/pf60;

    .line 10
    .line 11
    const-string v1, "e_newuser_checkin_moment"

    .line 12
    .line 13
    invoke-static {v1, p0, v0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public z(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/xjh;->b(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
