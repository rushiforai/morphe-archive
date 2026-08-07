.class public Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;
.super Lv/VFrame;
.source "SourceFile"

# interfaces
.implements Ll/qxh;


# static fields
.field public static h:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public a:Landroidx/recyclerview/widget/RecyclerView;

.field public b:Ll/m2i;

.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/BubbleInfo;",
            ">;"
        }
    .end annotation
.end field

.field public d:Lcom/p1/mobile/android/app/Act;

.field public e:Ljava/lang/String;

.field public f:Z

.field public g:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->h:Lrx/subjects/b;

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 18
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->c:Ljava/util/List;

    .line 19
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->G(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 20
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 21
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->c:Ljava/util/List;

    .line 22
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->G(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->c:Ljava/util/List;

    .line 10
    .line 11
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->g:Ljava/lang/String;

    .line 12
    .line 13
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->G(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->P(Ljava/util/Map;)V

    return-void
.end method

.method private G(Landroid/content/Context;)V
    .locals 2

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->d:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget v1, Ll/tec0;->M0:I

    .line 11
    .line 12
    invoke-virtual {v0, v1, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    const/16 v0, 0x8

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->K(Landroid/content/Context;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->T()V

    .line 24
    .line 25
    .line 26
    const/4 p1, 0x0

    .line 27
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->F(Z)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->d:Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 33
    .line 34
    iget-object v0, v0, Ll/jka;->t1:Lrx/subjects/b;

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    new-instance v0, Ll/d2i;

    .line 41
    .line 42
    invoke-direct {v0, p0}, Ll/d2i;-><init>(Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method private getPageId()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->g:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->M(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->N(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/data/BubbleInfo;Lcom/p1/mobile/putong/data/BubbleInfo;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/data/BubbleInfo;Lcom/p1/mobile/putong/data/BubbleInfo;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->O(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;ZLcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->L(ZLcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method


# virtual methods
.method public final C(Lcom/p1/mobile/putong/data/BubbleInfo;)Lcom/p1/mobile/putong/data/BubbleInfo;
    .locals 4

    .line 1
    const/4 p0, 0x0

    .line 2
    new-array p0, p0, [Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 3
    .line 4
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    sget-object v0, Ll/owi;->g:Ll/wyd0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_0
    const-class v1, Lcom/p1/mobile/putong/feed/data/StateEmotion;

    .line 24
    .line 25
    invoke-static {v0, v1}, Lcom/alibaba/fastjson/JSON;->parseArray(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_2

    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Lcom/p1/mobile/putong/feed/data/StateEmotion;

    .line 44
    .line 45
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/StateEmotion;->emotions:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-eqz v2, :cond_1

    .line 56
    .line 57
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    check-cast v2, Lcom/p1/mobile/putong/data/Emotion;

    .line 62
    .line 63
    invoke-static {}, Lcom/p1/mobile/putong/data/BubbleInfo;->new_()Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    iput-object v2, v3, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 68
    .line 69
    const/4 v2, 0x1

    .line 70
    invoke-virtual {v3, v2}, Lcom/p1/mobile/putong/data/BubbleInfo;->setPostSelectBubbleState(Z)V

    .line 71
    .line 72
    .line 73
    invoke-interface {p0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_2
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_3

    .line 82
    .line 83
    new-instance v0, Ll/j2i;

    .line 84
    .line 85
    invoke-direct {v0, p1}, Ll/j2i;-><init>(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 86
    .line 87
    .line 88
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    check-cast p0, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 93
    .line 94
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-eqz v0, :cond_3

    .line 99
    .line 100
    iget-object v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 101
    .line 102
    iget-object p0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 103
    .line 104
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 105
    .line 106
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 107
    .line 108
    :cond_3
    :goto_1
    return-object p1
.end method

.method public final E(Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/BubbleInfo;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/BubbleInfo;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    new-array p0, p0, [Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 3
    .line 4
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    sget-object v0, Ll/owi;->g:Ll/wyd0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    goto :goto_2

    .line 23
    :cond_0
    const-class v1, Lcom/p1/mobile/putong/feed/data/StateEmotion;

    .line 24
    .line 25
    invoke-static {v0, v1}, Lcom/alibaba/fastjson/JSON;->parseArray(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_2

    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Lcom/p1/mobile/putong/feed/data/StateEmotion;

    .line 44
    .line 45
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/StateEmotion;->emotions:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-eqz v2, :cond_1

    .line 56
    .line 57
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    check-cast v2, Lcom/p1/mobile/putong/data/Emotion;

    .line 62
    .line 63
    invoke-static {}, Lcom/p1/mobile/putong/data/BubbleInfo;->new_()Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    iput-object v2, v3, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 68
    .line 69
    const/4 v2, 0x1

    .line 70
    invoke-virtual {v3, v2}, Lcom/p1/mobile/putong/data/BubbleInfo;->setPostSelectBubbleState(Z)V

    .line 71
    .line 72
    .line 73
    invoke-interface {p0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_2
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-nez v0, :cond_4

    .line 82
    .line 83
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-nez v0, :cond_4

    .line 88
    .line 89
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    :cond_3
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    if-eqz v1, :cond_4

    .line 98
    .line 99
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    check-cast v1, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 104
    .line 105
    new-instance v2, Ll/g2i;

    .line 106
    .line 107
    invoke-direct {v2, v1}, Ll/g2i;-><init>(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 108
    .line 109
    .line 110
    invoke-static {p0, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    check-cast v2, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 115
    .line 116
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result v3

    .line 120
    if-eqz v3, :cond_3

    .line 121
    .line 122
    iget-object v1, v1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 123
    .line 124
    iget-object v2, v2, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 125
    .line 126
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 127
    .line 128
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 129
    .line 130
    goto :goto_1

    .line 131
    :cond_4
    :goto_2
    return-object p1
.end method

.method public final F(Z)V
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->e:Ljava/lang/String;

    .line 6
    .line 7
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->d:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->e:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Ll/jka;->A7(Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/e2i;

    .line 22
    .line 23
    invoke-direct {v1, p0, p1}, Ll/e2i;-><init>(Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;Z)V

    .line 24
    .line 25
    .line 26
    new-instance p1, Ll/f2i;

    .line 27
    .line 28
    invoke-direct {p1, p0}, Ll/f2i;-><init>(Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final K(Landroid/content/Context;)V
    .locals 4

    .line 1
    sget v0, Ll/hdc0;->x1:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 10
    .line 11
    const/high16 v1, 0x41100000    # 9.0f

    .line 12
    .line 13
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/4 v2, 0x1

    .line 18
    const/4 v3, 0x0

    .line 19
    invoke-virtual {v0, v1, v2, v3, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 23
    .line 24
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 25
    .line 26
    invoke-direct {v1, p1, v3, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 30
    .line 31
    .line 32
    new-instance v0, Ll/m2i;

    .line 33
    .line 34
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->g:Ljava/lang/String;

    .line 37
    .line 38
    invoke-direct {v0, p1, v1}, Ll/m2i;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->b:Ll/m2i;

    .line 42
    .line 43
    new-instance p1, Ll/h2i;

    .line 44
    .line 45
    invoke-direct {p1, p0}, Ll/h2i;-><init>(Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, p1}, Ll/m2i;->V(Ll/y20;)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->b:Ll/m2i;

    .line 54
    .line 55
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final synthetic L(ZLcom/p1/mobile/putong/data/Envelope;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->c:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p1, p2, Lcom/p1/mobile/putong/data/Envelope;->data:Lcom/p1/mobile/putong/data/Data;

    .line 9
    .line 10
    const-class v0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Data;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->states:Ljava/util/List;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->Q(Ljava/util/List;)V

    .line 21
    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->f:Z

    .line 25
    .line 26
    iget-object p1, p2, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 27
    .line 28
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 29
    .line 30
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 31
    .line 32
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->e:Ljava/lang/String;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->b:Ll/m2i;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Ll/m2i;->W(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic M(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->f:Z

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic N(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->b()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic O(Ljava/lang/Integer;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->b:Ll/m2i;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/jic0;->getItemCount()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    add-int/lit8 v0, v0, -0x4

    .line 12
    .line 13
    if-le p1, v0, :cond_0

    .line 14
    .line 15
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->f:Z

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->R()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final synthetic P(Ljava/util/Map;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->c:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-lez v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->c:Ljava/util/List;

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->c:Ljava/util/List;

    .line 32
    .line 33
    if-nez p1, :cond_0

    .line 34
    .line 35
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/MineAskPostState;

    .line 36
    .line 37
    invoke-direct {p1}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/MineAskPostState;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-interface {v0, v1, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->C(Lcom/p1/mobile/putong/data/BubbleInfo;)Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-interface {v0, v1, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->b:Ll/m2i;

    .line 52
    .line 53
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 54
    .line 55
    .line 56
    :cond_1
    return-void
.end method

.method public final Q(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/BubbleInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 31
    .line 32
    iget-object v2, v2, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 33
    .line 34
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_1

    .line 41
    .line 42
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/MineAskPostState;

    .line 43
    .line 44
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/MineAskPostState;-><init>()V

    .line 45
    .line 46
    .line 47
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->c:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->c:Ljava/util/List;

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->E(Ljava/util/List;)Ljava/util/List;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->c:Ljava/util/List;

    .line 62
    .line 63
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-lez p1, :cond_2

    .line 68
    .line 69
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 70
    .line 71
    .line 72
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->c:Ljava/util/List;

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->S(Ljava/util/List;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public final R()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->e:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->F(Z)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->f:Z

    .line 16
    .line 17
    return-void
.end method

.method public S(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/BubbleInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->c:Ljava/util/List;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->b:Ll/m2i;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/m2i;->U(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final T()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->d:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/jka;->K7()Lrx/subjects/a;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/i2i;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/i2i;-><init>(Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->F(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method
