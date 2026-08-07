.class public Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VMenuBar;

.field public b:Lv/VSearchBar;

.field public c:Lv/VLinear;

.field public d:Landroid/widget/LinearLayout;

.field public e:Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedHeader;

.field public f:Lv/VRecyclerView;

.field public g:Lv/VRecyclerView;

.field public h:Lv/VButton;

.field public i:Ll/a8j0;

.field public j:Ll/e9j0;

.field public k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation
.end field

.field public m:Lcom/p1/mobile/putong/feed/data/TopicCategorie;

.field public n:Ll/urg;

.field public o:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;>;"
        }
    .end annotation
.end field

.field public p:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicCategorie;",
            ">;"
        }
    .end annotation
.end field

.field public q:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation
.end field

.field public r:Ll/r4h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/r4h<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation
.end field

.field public s:Ll/zaj0;

.field public t:Ljava/lang/String;

.field public u:Ll/h80;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

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
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->k:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->l:Ljava/util/List;

    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->p:Ljava/util/List;

    .line 24
    .line 25
    new-instance v0, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->q:Ljava/util/ArrayList;

    .line 31
    .line 32
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView$a;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->u:Ll/h80;

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->u(Landroid/content/Context;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 43
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 44
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->k:Ljava/util/List;

    .line 45
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->l:Ljava/util/List;

    .line 46
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->p:Ljava/util/List;

    .line 47
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->q:Ljava/util/ArrayList;

    .line 48
    new-instance p2, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView$a;

    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->u:Ll/h80;

    .line 49
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->u(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 50
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 51
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->k:Ljava/util/List;

    .line 52
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->l:Ljava/util/List;

    .line 53
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->p:Ljava/util/List;

    .line 54
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->q:Ljava/util/ArrayList;

    .line 55
    new-instance p2, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView$a;

    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->u:Ll/h80;

    .line 56
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->u(Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->A(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;Landroid/view/View;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->x(Landroid/view/View;Z)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/feed/data/TopicMoment;Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/feed/data/TopicMoment;Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic e(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

.method public static synthetic f(Lcom/p1/mobile/putong/feed/data/TopicMoment;Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->K(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    return-void
.end method

.method private getChildTopics()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->m:Lcom/p1/mobile/putong/feed/data/TopicCategorie;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->k:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->m:Lcom/p1/mobile/putong/feed/data/TopicCategorie;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->topicIds:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ljava/lang/String;

    .line 30
    .line 31
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->k:Ljava/util/List;

    .line 32
    .line 33
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->l:Ljava/util/List;

    .line 34
    .line 35
    new-instance v4, Ll/jvh;

    .line 36
    .line 37
    invoke-direct {v4, v1}, Ll/jvh;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v3, v4}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    check-cast v1, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 45
    .line 46
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    :goto_1
    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;Lcom/p1/mobile/putong/feed/data/TopicCategorie;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->q(Lcom/p1/mobile/putong/feed/data/TopicCategorie;)V

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->w(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->z(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/feed/data/TopicMoment;Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;Ll/tee0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->y(Ll/tee0;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->t:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->D(Ljava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method public final synthetic A(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->n:Ll/urg;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/app/Dialog;->dismiss()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->n:Ll/urg;

    .line 7
    .line 8
    iget-object p1, p1, Ll/urg;->a:Ll/l4g0;

    .line 9
    .line 10
    invoke-static {p1}, Ll/w1e;->e(Ll/l4g0;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->o:Ll/y20;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->o:Ll/y20;

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->q:Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-interface {p1, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    const-string p1, ""

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->q:Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-ge v0, v1, :cond_2

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->q:Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 46
    .line 47
    if-nez v0, :cond_1

    .line 48
    .line 49
    iget-object p1, v1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string p1, ","

    .line 61
    .line 62
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    iget-object p1, v1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_2
    const-string p0, "topic_id_list"

    .line 78
    .line 79
    invoke-static {p0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    filled-new-array {p0}, [Ll/pf60;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    const-string p1, "e_pick_topic_confirm"

    .line 88
    .line 89
    const-string v0, "p_pick_topic"

    .line 90
    .line 91
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public B(Lcom/p1/mobile/putong/feed/data/TopicCategorie;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->L(Lcom/p1/mobile/putong/feed/data/TopicCategorie;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->getChildTopics()V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->j:Ll/e9j0;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->k:Ljava/util/List;

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Ll/e9j0;->J(Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public C(Lcom/p1/mobile/putong/feed/data/TopicMoment;)Z
    .locals 4

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->selected:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->q:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    add-int/2addr v0, v2

    .line 14
    const/4 v3, 0x3

    .line 15
    if-le v0, v3, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->r1:I

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->n:Ll/urg;

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {p1, p0}, Ll/o1j0;->z(Ljava/lang/String;Landroid/view/View;)V

    .line 38
    .line 39
    .line 40
    return v1

    .line 41
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->q:Ljava/util/ArrayList;

    .line 42
    .line 43
    new-instance v3, Ll/dvh;

    .line 44
    .line 45
    invoke-direct {v3, p1}, Ll/dvh;-><init>(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v0, v3}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 53
    .line 54
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    if-eqz v3, :cond_1

    .line 59
    .line 60
    iput-boolean v1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->selected:Z

    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->q:Ljava/util/ArrayList;

    .line 63
    .line 64
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    return v2

    .line 68
    :cond_1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->J(Lcom/p1/mobile/putong/feed/data/TopicMoment;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-nez v0, :cond_3

    .line 73
    .line 74
    iput-boolean v2, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->selected:Z

    .line 75
    .line 76
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->q:Ljava/util/ArrayList;

    .line 77
    .line 78
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    const-string v0, "topic_id"

    .line 82
    .line 83
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 84
    .line 85
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->t:Ljava/lang/String;

    .line 90
    .line 91
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    if-eqz p0, :cond_2

    .line 96
    .line 97
    const-string p0, "1"

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_2
    const-string p0, "2"

    .line 101
    .line 102
    :goto_0
    const-string v0, "topic_attribute"

    .line 103
    .line 104
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    filled-new-array {p1, p0}, [Ll/pf60;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    const-string p1, "e_add_topic_pick"

    .line 113
    .line 114
    const-string v0, "p_pick_topic"

    .line 115
    .line 116
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 117
    .line 118
    .line 119
    return v2

    .line 120
    :cond_3
    return v1
.end method

.method public final D(Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p1, ""

    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->t:Ljava/lang/String;

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->t(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public E(Ll/pf60;Landroid/app/Dialog;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicCategorie;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;>;",
            "Landroid/app/Dialog;",
            "Ll/y20<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    check-cast p2, Ll/urg;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->n:Ll/urg;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->o:Ll/y20;

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p2, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast p2, Ljava/util/List;

    .line 13
    .line 14
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->p:Ljava/util/List;

    .line 15
    .line 16
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    if-nez p2, :cond_2

    .line 21
    .line 22
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->p:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result p3

    .line 32
    const/4 v0, 0x0

    .line 33
    if-eqz p3, :cond_1

    .line 34
    .line 35
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p3

    .line 39
    check-cast p3, Lcom/p1/mobile/putong/feed/data/TopicCategorie;

    .line 40
    .line 41
    iput-boolean v0, p3, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->selected:Z

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->p:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    check-cast p2, Lcom/p1/mobile/putong/feed/data/TopicCategorie;

    .line 51
    .line 52
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->L(Lcom/p1/mobile/putong/feed/data/TopicCategorie;)V

    .line 53
    .line 54
    .line 55
    :cond_2
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 56
    .line 57
    check-cast p1, Ljava/util/List;

    .line 58
    .line 59
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->l:Ljava/util/List;

    .line 60
    .line 61
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    :cond_3
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    if-eqz p2, :cond_4

    .line 70
    .line 71
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    check-cast p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 76
    .line 77
    iget-boolean p3, p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->selected:Z

    .line 78
    .line 79
    if-eqz p3, :cond_3

    .line 80
    .line 81
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->q:Ljava/util/ArrayList;

    .line 82
    .line 83
    invoke-virtual {p3, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_4
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->getChildTopics()V

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->i:Ll/a8j0;

    .line 91
    .line 92
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->p:Ljava/util/List;

    .line 93
    .line 94
    invoke-virtual {p1, p2}, Ll/a8j0;->J(Ljava/util/List;)V

    .line 95
    .line 96
    .line 97
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->j:Ll/e9j0;

    .line 98
    .line 99
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->k:Ljava/util/List;

    .line 100
    .line 101
    invoke-virtual {p1, p2}, Ll/e9j0;->J(Ljava/util/List;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->F()V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public final F()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->q:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->e:Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedHeader;

    .line 8
    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, v1, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedHeader;->f:Lorg/apmem/tools/layouts/FlowLayout;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->e:Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedHeader;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedHeader;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->r:Ll/r4h;

    .line 25
    .line 26
    check-cast v0, Ll/x8j0;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->q:Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/x8j0;->F(Ljava/util/List;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->r:Ll/r4h;

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/r4h;->notifyDataSetChanged()V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    iget-object v0, v1, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedHeader;->f:Lorg/apmem/tools/layouts/FlowLayout;

    .line 40
    .line 41
    const/16 v1, 0x8

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->e:Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedHeader;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedHeader;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 51
    .line 52
    .line 53
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->G()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final G()V
    .locals 5

    .line 1
    invoke-static {}, Ll/cmg;->N()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->q:Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_2

    .line 24
    .line 25
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 30
    .line 31
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 32
    .line 33
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->name:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-nez v3, :cond_1

    .line 40
    .line 41
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    const-string v2, ""

    .line 50
    .line 51
    if-nez v1, :cond_3

    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->e:Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedHeader;

    .line 54
    .line 55
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedHeader;->d:Lv/VText;

    .line 56
    .line 57
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->e:Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedHeader;

    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedHeader;->e:Lv/VText;

    .line 63
    .line 64
    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    const/4 v3, 0x1

    .line 73
    const-string v4, "(\u540c\u6b65\u5230%s"

    .line 74
    .line 75
    if-ne v1, v3, :cond_4

    .line 76
    .line 77
    const/4 v1, 0x0

    .line 78
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    check-cast v0, Ljava/lang/String;

    .line 83
    .line 84
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->e:Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedHeader;

    .line 85
    .line 86
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedHeader;->d:Lv/VText;

    .line 87
    .line 88
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-static {v4, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 97
    .line 98
    .line 99
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->e:Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedHeader;

    .line 100
    .line 101
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedHeader;->e:Lv/VText;

    .line 102
    .line 103
    const-string v0, "\u5708\u5b50\uff0c\u83b7\u5f97\u66f4\u591a\u66dd\u5149)"

    .line 104
    .line 105
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_4
    new-instance v1, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    if-eqz v2, :cond_6

    .line 123
    .line 124
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    check-cast v2, Ljava/lang/String;

    .line 129
    .line 130
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 131
    .line 132
    .line 133
    move-result v3

    .line 134
    if-nez v3, :cond_5

    .line 135
    .line 136
    const-string v3, "\uff0c"

    .line 137
    .line 138
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    :cond_5
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    goto :goto_1

    .line 145
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->e:Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedHeader;

    .line 146
    .line 147
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedHeader;->d:Lv/VText;

    .line 148
    .line 149
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    invoke-static {v4, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 158
    .line 159
    .line 160
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->e:Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedHeader;

    .line 161
    .line 162
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedHeader;->e:Lv/VText;

    .line 163
    .line 164
    const-string v0, "\u7b49\u5708\u5b50)"

    .line 165
    .line 166
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 167
    .line 168
    .line 169
    return-void
.end method

.method public final H(Ll/tee0;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/tee0<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;)V"
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
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x1

    .line 11
    const/4 v3, 0x0

    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/tee0;->a()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    iget-object v1, p1, Ll/tee0;->b:Ll/pf60;

    .line 21
    .line 22
    iget-object v1, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v1, Ljava/util/Collection;

    .line 25
    .line 26
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-nez v1, :cond_1

    .line 31
    .line 32
    iget-object p1, p1, Ll/tee0;->b:Ll/pf60;

    .line 33
    .line 34
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast p1, Ljava/util/Collection;

    .line 37
    .line 38
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 39
    .line 40
    .line 41
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_0

    .line 50
    .line 51
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    check-cast v1, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 56
    .line 57
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->q:Ljava/util/ArrayList;

    .line 58
    .line 59
    new-instance v5, Ll/kvh;

    .line 60
    .line 61
    invoke-direct {v5, v1}, Ll/kvh;-><init>(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v4, v5}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 65
    .line 66
    .line 67
    move-result v4

    .line 68
    iput-boolean v4, v1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->selected:Z

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->j:Ll/e9j0;

    .line 72
    .line 73
    invoke-virtual {p1, v0}, Ll/e9j0;->J(Ljava/util/List;)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->c:Lv/VLinear;

    .line 77
    .line 78
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->d:Landroid/widget/LinearLayout;

    .line 82
    .line 83
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->e:Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedHeader;

    .line 87
    .line 88
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 89
    .line 90
    .line 91
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->f:Lv/VRecyclerView;

    .line 92
    .line 93
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 94
    .line 95
    .line 96
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->h:Lv/VButton;

    .line 97
    .line 98
    invoke-static {p0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->c:Lv/VLinear;

    .line 103
    .line 104
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 105
    .line 106
    .line 107
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->d:Landroid/widget/LinearLayout;

    .line 108
    .line 109
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 110
    .line 111
    .line 112
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->h:Lv/VButton;

    .line 113
    .line 114
    invoke-static {p0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public final I()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->c:Lv/VLinear;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->d:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->h:Lv/VButton;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    const-string v0, ""

    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->t:Ljava/lang/String;

    .line 20
    .line 21
    return-void
.end method

.method public final J(Lcom/p1/mobile/putong/feed/data/TopicMoment;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->q:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->q:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->isTopicAnonymousType()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/4 v2, 0x1

    .line 24
    if-eqz v0, :cond_3

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->isTopicAnonymousType()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->n:Ll/urg;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const-string p1, "\u53ea\u80fd\u6dfb\u52a0\u4e00\u6761\u533f\u540d\u8bdd\u9898"

    .line 43
    .line 44
    invoke-static {p1, p0}, Ll/o1j0;->z(Ljava/lang/String;Landroid/view/View;)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    invoke-static {}, Ll/cmg;->O()Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->n:Ll/urg;

    .line 53
    .line 54
    if-eqz p1, :cond_2

    .line 55
    .line 56
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    const-string p1, "\u4f60\u5df2\u6dfb\u52a0\u533f\u540d\u8bdd\u9898\uff0c\u4e0d\u53ef\u540c\u9009\u5f53\u524d\u8bdd\u9898"

    .line 65
    .line 66
    invoke-static {p1, p0}, Ll/o1j0;->z(Ljava/lang/String;Landroid/view/View;)V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_2
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    const-string p1, "\u6dfb\u52a0\u4e86\u533f\u540d\u8bdd\u9898\uff0c\u4e0d\u80fd\u518d\u6dfb\u52a0\u666e\u901a\u8bdd\u9898"

    .line 79
    .line 80
    invoke-static {p1, p0}, Ll/o1j0;->z(Ljava/lang/String;Landroid/view/View;)V

    .line 81
    .line 82
    .line 83
    :goto_0
    return v2

    .line 84
    :cond_3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->isTopicAnonymousType()Z

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-eqz p1, :cond_5

    .line 89
    .line 90
    invoke-static {}, Ll/cmg;->O()Z

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->n:Ll/urg;

    .line 95
    .line 96
    if-eqz p1, :cond_4

    .line 97
    .line 98
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    const-string p1, "\u533f\u540d\u8bdd\u9898\u4e0e\u5df2\u6dfb\u52a0\u8bdd\u9898\u4e0d\u53ef\u540c\u9009"

    .line 107
    .line 108
    invoke-static {p1, p0}, Ll/o1j0;->z(Ljava/lang/String;Landroid/view/View;)V

    .line 109
    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_4
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    const-string p1, "\u6dfb\u52a0\u4e86\u666e\u901a\u8bdd\u9898\uff0c\u4e0d\u80fd\u518d\u6dfb\u52a0\u533f\u540d\u8bdd\u9898"

    .line 121
    .line 122
    invoke-static {p1, p0}, Ll/o1j0;->z(Ljava/lang/String;Landroid/view/View;)V

    .line 123
    .line 124
    .line 125
    :goto_1
    return v2

    .line 126
    :cond_5
    return v1
.end method

.method public final K(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->C(Lcom/p1/mobile/putong/feed/data/TopicMoment;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->t:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    iget-boolean p1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->selected:Z

    .line 17
    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->b:Lv/VSearchBar;

    .line 21
    .line 22
    invoke-virtual {p1}, Lv/VSearchBar;->getCancelText()Lv/VText;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const/16 v0, 0x8

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->b:Lv/VSearchBar;

    .line 32
    .line 33
    invoke-virtual {p1}, Lv/VSearchBar;->getClearLayout()Landroid/widget/FrameLayout;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->b:Lv/VSearchBar;

    .line 41
    .line 42
    invoke-virtual {p1}, Lv/VSearchBar;->getEditText()Lv/VEditText;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    const-string v0, ""

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->b:Lv/VSearchBar;

    .line 52
    .line 53
    invoke-virtual {p1}, Lv/VSearchBar;->clearFocus()V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->r()V

    .line 57
    .line 58
    .line 59
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->F()V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->j:Ll/e9j0;

    .line 63
    .line 64
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final L(Lcom/p1/mobile/putong/feed/data/TopicCategorie;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->m:Lcom/p1/mobile/putong/feed/data/TopicCategorie;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->m:Lcom/p1/mobile/putong/feed/data/TopicCategorie;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    iput-boolean v1, v0, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->selected:Z

    .line 13
    .line 14
    :cond_0
    const/4 v0, 0x1

    .line 15
    iput-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->selected:Z

    .line 16
    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->m:Lcom/p1/mobile/putong/feed/data/TopicCategorie;

    .line 18
    .line 19
    return-void
.end method

.method public final M()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->b:Lv/VSearchBar;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView$d;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView$d;-><init>(Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lv/VSearchBar;->d(Landroid/text/TextWatcher;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public o(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ovh;->b(Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final p()Lcom/p1/mobile/android/app/Act;
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

.method public final q(Lcom/p1/mobile/putong/feed/data/TopicCategorie;)V
    .locals 1

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->selected:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->B(Lcom/p1/mobile/putong/feed/data/TopicCategorie;)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->g:Lv/VRecyclerView;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->i:Ll/a8j0;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final r()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->p()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->b:Lv/VSearchBar;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->k:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 27
    .line 28
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->q:Ljava/util/ArrayList;

    .line 29
    .line 30
    new-instance v3, Ll/lvh;

    .line 31
    .line 32
    invoke-direct {v3, v1}, Ll/lvh;-><init>(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v2, v3}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    iput-boolean v2, v1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->selected:Z

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->j:Ll/e9j0;

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->k:Ljava/util/List;

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ll/e9j0;->J(Ljava/util/List;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->c:Lv/VLinear;

    .line 50
    .line 51
    const/4 v1, 0x0

    .line 52
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->d:Landroid/widget/LinearLayout;

    .line 56
    .line 57
    const/4 v1, 0x1

    .line 58
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->e:Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedHeader;

    .line 62
    .line 63
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->f:Lv/VRecyclerView;

    .line 67
    .line 68
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->h:Lv/VButton;

    .line 72
    .line 73
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 74
    .line 75
    .line 76
    const-string v0, ""

    .line 77
    .line 78
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->t:Ljava/lang/String;

    .line 79
    .line 80
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->q:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->l:Ljava/util/List;

    .line 7
    .line 8
    new-instance v1, Ll/evh;

    .line 9
    .line 10
    invoke-direct {v1, p1}, Ll/evh;-><init>(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 18
    .line 19
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->selected:Z

    .line 27
    .line 28
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->F()V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->j:Ll/e9j0;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public t(Ljava/lang/CharSequence;)V
    .locals 2

    .line 1
    const-string v0, "[^\\x{4e00}-\\x{9fa5}A-Za-z0-9]+"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v0, ""

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->t:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->t:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->s:Ll/zaj0;

    .line 37
    .line 38
    const/16 v1, 0x1e

    .line 39
    .line 40
    if-lt p1, v1, :cond_1

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->t:Ljava/lang/String;

    .line 43
    .line 44
    const/4 p1, 0x0

    .line 45
    invoke-virtual {p0, p1, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v0, p0}, Ll/b6;->i(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->t:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v0, p0}, Ll/b6;->i(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final u(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1, p0}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->o(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->b:Lv/VSearchBar;

    .line 13
    .line 14
    invoke-static {}, Ll/cmg;->q0()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->M()V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->b:Lv/VSearchBar;

    .line 25
    .line 26
    new-instance v0, Ll/cvh;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Ll/cvh;-><init>(Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, v0}, Lv/VSearchBar;->setCancelListener(Landroid/view/View$OnClickListener;)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->b:Lv/VSearchBar;

    .line 35
    .line 36
    new-instance v0, Ll/fvh;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Ll/fvh;-><init>(Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, v0}, Lv/VSearchBar;->setFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 42
    .line 43
    .line 44
    new-instance p1, Ll/zaj0;

    .line 45
    .line 46
    invoke-direct {p1}, Ll/zaj0;-><init>()V

    .line 47
    .line 48
    .line 49
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->s:Ll/zaj0;

    .line 50
    .line 51
    new-instance v0, Ll/gvh;

    .line 52
    .line 53
    invoke-direct {v0, p0}, Ll/gvh;-><init>(Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1, v0}, Ll/zaj0;->o(Ll/y20;)V

    .line 57
    .line 58
    .line 59
    new-instance p1, Ll/x8j0;

    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->k:Ljava/util/List;

    .line 62
    .line 63
    invoke-direct {p1, v0, p0}, Ll/x8j0;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;)V

    .line 64
    .line 65
    .line 66
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->r:Ll/r4h;

    .line 67
    .line 68
    new-instance p1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 69
    .line 70
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-direct {p1, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 75
    .line 76
    .line 77
    const/4 v0, 0x0

    .line 78
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->f:Lv/VRecyclerView;

    .line 82
    .line 83
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 84
    .line 85
    .line 86
    new-instance p1, Ll/e9j0;

    .line 87
    .line 88
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->p()Lcom/p1/mobile/android/app/Act;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->u:Ll/h80;

    .line 93
    .line 94
    invoke-direct {p1, v0, v1}, Ll/e9j0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/h80;)V

    .line 95
    .line 96
    .line 97
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->j:Ll/e9j0;

    .line 98
    .line 99
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->g:Lv/VRecyclerView;

    .line 100
    .line 101
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 102
    .line 103
    .line 104
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->g:Lv/VRecyclerView;

    .line 105
    .line 106
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView$b;

    .line 107
    .line 108
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView$b;-><init>(Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 112
    .line 113
    .line 114
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView$c;

    .line 115
    .line 116
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView$c;-><init>(Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;)V

    .line 117
    .line 118
    .line 119
    new-instance v0, Ll/a8j0;

    .line 120
    .line 121
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->p()Lcom/p1/mobile/android/app/Act;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    invoke-direct {v0, v1, p1}, Ll/a8j0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/h80;)V

    .line 126
    .line 127
    .line 128
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->i:Ll/a8j0;

    .line 129
    .line 130
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->r:Ll/r4h;

    .line 131
    .line 132
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->e:Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedHeader;

    .line 133
    .line 134
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedHeader;->f:Lorg/apmem/tools/layouts/FlowLayout;

    .line 135
    .line 136
    invoke-virtual {p1, v0}, Ll/r4h;->t(Lorg/apmem/tools/layouts/FlowLayout;)V

    .line 137
    .line 138
    .line 139
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->f:Lv/VRecyclerView;

    .line 140
    .line 141
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->i:Ll/a8j0;

    .line 142
    .line 143
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 144
    .line 145
    .line 146
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->i:Ll/a8j0;

    .line 147
    .line 148
    new-instance v0, Ll/hvh;

    .line 149
    .line 150
    invoke-direct {v0, p0}, Ll/hvh;-><init>(Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p1, v0}, Ll/a8j0;->K(Ll/y20;)V

    .line 154
    .line 155
    .line 156
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->j:Ll/e9j0;

    .line 157
    .line 158
    new-instance v0, Ll/ivh;

    .line 159
    .line 160
    invoke-direct {v0, p0}, Ll/ivh;-><init>(Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {p1, v0}, Ll/e9j0;->K(Ll/y20;)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->v()V

    .line 167
    .line 168
    .line 169
    return-void
.end method

.method public final v()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->a:Lv/VMenuBar;

    .line 2
    .line 3
    new-instance v1, Ll/mvh;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/mvh;-><init>(Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lv/VMenuBar;->setLeftRegionClick(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->h:Lv/VButton;

    .line 12
    .line 13
    new-instance v1, Ll/nvh;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/nvh;-><init>(Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->r()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic x(Landroid/view/View;Z)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->b:Lv/VSearchBar;

    .line 2
    .line 3
    const/high16 v0, 0x41800000    # 16.0f

    .line 4
    .line 5
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    const/high16 v0, 0x40a00000    # 5.0f

    .line 12
    .line 13
    :cond_0
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-virtual {p1, v1, v2, v0, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 19
    .line 20
    .line 21
    if-eqz p2, :cond_1

    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->t:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->I()V

    .line 32
    .line 33
    .line 34
    const-string p0, "e_search_topic"

    .line 35
    .line 36
    const-string p1, "p_pick_topic"

    .line 37
    .line 38
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->p()Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->b:Lv/VSearchBar;

    .line 47
    .line 48
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final synthetic y(Ll/tee0;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->t:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v1, p1, Ll/tee0;->c:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->H(Ll/tee0;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final synthetic z(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->n:Ll/urg;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/app/Dialog;->dismiss()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->n:Ll/urg;

    .line 7
    .line 8
    iget-object p0, p0, Ll/urg;->a:Ll/l4g0;

    .line 9
    .line 10
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
