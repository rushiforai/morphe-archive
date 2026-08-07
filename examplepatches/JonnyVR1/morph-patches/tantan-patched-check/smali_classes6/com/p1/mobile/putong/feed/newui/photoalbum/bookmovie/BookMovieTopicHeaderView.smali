.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;
.super Lv/VRelative;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;

.field public e:Lv/VDraweeView;

.field public f:Landroid/widget/LinearLayout;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Landroid/widget/LinearLayout;

.field public j:Landroid/widget/ImageView;

.field public k:Lv/VText;

.field public l:Lv/VText;

.field public m:Lcom/p1/mobile/android/app/Act;

.field public n:Lcom/p1/mobile/putong/feed/data/TopicMoment;

.field public o:Ll/x8i;

.field public p:Ljava/lang/String;

.field public q:Z


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

.method public static synthetic B(Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->P(Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method private synthetic O(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;

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

.method public static synthetic p(Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->M(Ll/pf60;)V

    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;Lcom/p1/mobile/putong/feed/data/FeedLiterature;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->Q(Lcom/p1/mobile/putong/feed/data/FeedLiterature;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->O(Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public final H(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/h53;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final I(Lcom/p1/mobile/putong/feed/data/FeedLiterature;)Ljava/lang/String;
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/FeedLiterature;->counter:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception p1

    .line 14
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    :goto_0
    invoke-static {p1}, Ll/ksg;->q(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string p1, "\u4eba\u6dfb\u52a0"

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public final L(Lcom/p1/mobile/putong/feed/data/FeedLiterature;)Ljava/lang/String;
    .locals 3

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedLiterature;->category:Ljava/lang/String;

    .line 7
    .line 8
    const-string v1, "book"

    .line 9
    .line 10
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const-string v1, "/"

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/FeedLiterature;->authors:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_3

    .line 29
    .line 30
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-lez v2, :cond_0

    .line 41
    .line 42
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    :cond_0
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/FeedLiterature;->kinds:Ljava/util/List;

    .line 50
    .line 51
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_3

    .line 60
    .line 61
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    if-lez v2, :cond_2

    .line 72
    .line 73
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    :cond_2
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_3
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    return-object p0
.end method

.method public final synthetic M(Ll/pf60;)V
    .locals 7

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/feed/data/FeedLiterature;

    .line 4
    .line 5
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Lcom/p1/mobile/putong/feed/data/FeedLiteraturesComment;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    invoke-static {v1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const/4 v2, 0x1

    .line 19
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 23
    .line 24
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->e:Lv/VDraweeView;

    .line 25
    .line 26
    iget-object v4, v0, Lcom/p1/mobile/putong/feed/data/FeedLiterature;->headUrl:Ljava/lang/String;

    .line 27
    .line 28
    sget v5, Ll/qa00;->F:I

    .line 29
    .line 30
    sget v6, Ll/qa00;->K:I

    .line 31
    .line 32
    invoke-virtual {v1, v3, v4, v5, v6}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->S(Lcom/p1/mobile/putong/feed/data/FeedLiterature;)V

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->g:Lv/VText;

    .line 39
    .line 40
    invoke-static {v2}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->g:Lv/VText;

    .line 48
    .line 49
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/data/FeedLiterature;->title:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 52
    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->h:Lv/VText;

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->L(Lcom/p1/mobile/putong/feed/data/FeedLiterature;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->k:Lv/VText;

    .line 64
    .line 65
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->I(Lcom/p1/mobile/putong/feed/data/FeedLiterature;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->T(Lcom/p1/mobile/putong/feed/data/FeedLiterature;Lcom/p1/mobile/putong/feed/data/FeedLiteraturesComment;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public final synthetic P(Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/data/FeedLiteraturesComment;->isShowArtAdd(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->p:Ljava/lang/String;

    .line 14
    .line 15
    const-string p1, "e_artwork_add"

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->getPageId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {p1, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    const/4 p1, 0x1

    .line 25
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/data/FeedLiteraturesComment;->formatInterestLevel(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->V(ZLjava/lang/String;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method public final synthetic Q(Lcom/p1/mobile/putong/feed/data/FeedLiterature;Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->p:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/data/FeedLiteraturesComment;->isShowArtAdd(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    const-string p2, "e_artwork_add"

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->getPageId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->m:Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/FeedLiterature;->id:Ljava/lang/String;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/FeedLiterature;->category:Ljava/lang/String;

    .line 27
    .line 28
    new-instance v2, Ll/g53;

    .line 29
    .line 30
    invoke-direct {v2, p0}, Ll/g53;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;)V

    .line 31
    .line 32
    .line 33
    invoke-interface {p2, v0, v1, p1, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->kj(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/z20;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public R(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/TopicMoment;Ll/x8i;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->m:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->n:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->o:Ll/x8i;

    .line 6
    .line 7
    sget-object p3, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 8
    .line 9
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->source:Lcom/p1/mobile/putong/feed/data/TopicSource;

    .line 10
    .line 11
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/TopicSource;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p3, p2}, Ll/jka;->G7(Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    new-instance p2, Ll/d53;

    .line 22
    .line 23
    invoke-direct {p2, p0}, Ll/d53;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;)V

    .line 24
    .line 25
    .line 26
    new-instance p3, Ll/e53;

    .line 27
    .line 28
    invoke-direct {p3, p0}, Ll/e53;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;)V

    .line 29
    .line 30
    .line 31
    invoke-static {p2, p3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final S(Lcom/p1/mobile/putong/feed/data/FeedLiterature;)V
    .locals 2

    .line 1
    const-string v0, "book"

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/FeedLiterature;->category:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->j:Landroid/widget/ImageView;

    .line 12
    .line 13
    sget p1, Ll/lbc0;->Y:I

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const-string v0, "movie"

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/FeedLiterature;->category:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->j:Landroid/widget/ImageView;

    .line 28
    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    sget p1, Ll/lbc0;->Z:I

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    sget p1, Ll/lbc0;->a0:I

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final T(Lcom/p1/mobile/putong/feed/data/FeedLiterature;Lcom/p1/mobile/putong/feed/data/FeedLiteraturesComment;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->l:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->l:Lv/VText;

    .line 8
    .line 9
    invoke-static {v1}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->l:Lv/VText;

    .line 17
    .line 18
    new-instance v2, Ll/f53;

    .line 19
    .line 20
    invoke-direct {v2, p0, p1}, Ll/f53;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;Lcom/p1/mobile/putong/feed/data/FeedLiterature;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->q:Z

    .line 27
    .line 28
    if-nez p1, :cond_1

    .line 29
    .line 30
    if-eqz p2, :cond_0

    .line 31
    .line 32
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/FeedLiteraturesComment;->interestLevel:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/data/FeedLiteraturesComment;->isShowArtAdd(Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    :cond_0
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->q:Z

    .line 41
    .line 42
    const-string p1, "e_artwork_add"

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->getPageId()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-static {p1, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    const/4 p1, 0x0

    .line 52
    if-nez p2, :cond_2

    .line 53
    .line 54
    const-string p2, ""

    .line 55
    .line 56
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/data/FeedLiteraturesComment;->formatInterestLevel(Ljava/lang/String;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->V(ZLjava/lang/String;)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_2
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/data/FeedLiteraturesComment;->interestLevel:Ljava/lang/String;

    .line 65
    .line 66
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->p:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/data/FeedLiteraturesComment;->isToWatch()Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-nez v0, :cond_4

    .line 73
    .line 74
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/data/FeedLiteraturesComment;->isWatching()Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-nez v0, :cond_4

    .line 79
    .line 80
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/data/FeedLiteraturesComment;->isWatched()Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_3

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_3
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/FeedLiteraturesComment;->interestLevel:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/data/FeedLiteraturesComment;->formatInterestLevel(Ljava/lang/String;)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->V(ZLjava/lang/String;)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_4
    :goto_0
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/FeedLiteraturesComment;->interestLevel:Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/data/FeedLiteraturesComment;->formatInterestLevel(Ljava/lang/String;)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-virtual {p0, v1, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->V(ZLjava/lang/String;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public final V(ZLjava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->l:Lv/VText;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    invoke-virtual {v0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->l:Lv/VText;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Ll/k9c0;->q:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 p1, 0x0

    .line 26
    invoke-virtual {v0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->l:Lv/VText;

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sget v1, Ll/k9c0;->p0:I

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 42
    .line 43
    .line 44
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->l:Lv/VText;

    .line 45
    .line 46
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public getPageId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->o:Ll/x8i;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "p_topic_latest"

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/x8i;->x()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->H(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
