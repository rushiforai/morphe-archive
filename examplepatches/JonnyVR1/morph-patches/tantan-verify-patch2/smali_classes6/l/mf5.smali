.class public Ll/mf5;
.super Ll/kic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/kic0<",
        "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
        ">;"
    }
.end annotation


# instance fields
.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation
.end field

.field public e:Lcom/p1/mobile/android/app/Act;

.field public f:Ljava/lang/String;

.field public g:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation
.end field

.field public h:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/kic0;-><init>()V

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
    iput-object v0, p0, Ll/mf5;->d:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Ll/mf5;->h:Z

    .line 13
    .line 14
    iput-object p1, p0, Ll/mf5;->e:Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic F(Ll/mf5;Lcom/p1/mobile/putong/feed/newui/topic/topiclist/NewPostTopicItemView;Lcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/mf5;->P(Lcom/p1/mobile/putong/feed/newui/topic/topiclist/NewPostTopicItemView;Lcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic G(Ll/mf5;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mf5;->e:Lcom/p1/mobile/android/app/Act;

    return-object p0
.end method

.method public static bridge synthetic H(Ll/mf5;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mf5;->N(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic I(Ll/mf5;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mf5;->O(Landroid/view/View;)Z

    move-result p0

    return p0
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/mf5;->J(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/TopicMoment;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mf5;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 0

    .line 1
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/NewPostTopicItemView;

    .line 2
    .line 3
    iget-object p0, p0, Ll/mf5;->e:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/NewPostTopicItemView;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public J(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/TopicMoment;II)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/NewPostTopicItemView;

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/NewPostTopicItemView;->i(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 4
    .line 5
    .line 6
    if-nez p4, :cond_0

    .line 7
    .line 8
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p3

    .line 12
    if-eqz p3, :cond_0

    .line 13
    .line 14
    iget-object p3, p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->name:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/NewPostTopicItemView;->k(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Ll/cmg;->p0()Z

    .line 20
    .line 21
    .line 22
    move-result p3

    .line 23
    if-eqz p3, :cond_1

    .line 24
    .line 25
    iget-boolean p3, p0, Ll/mf5;->h:Z

    .line 26
    .line 27
    if-nez p3, :cond_1

    .line 28
    .line 29
    const/4 p3, 0x1

    .line 30
    iput-boolean p3, p0, Ll/mf5;->h:Z

    .line 31
    .line 32
    const-string p3, "e_create_topic"

    .line 33
    .line 34
    const-string p4, "p_moment_post"

    .line 35
    .line 36
    invoke-static {p3, p4}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/NewPostTopicItemView;->l()V

    .line 41
    .line 42
    .line 43
    :cond_1
    :goto_0
    iget-boolean p3, p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->selected:Z

    .line 44
    .line 45
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/NewPostTopicItemView;->setViewSelected(Z)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, p1, p2}, Ll/mf5;->M(Lcom/p1/mobile/putong/feed/newui/topic/topiclist/NewPostTopicItemView;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 49
    .line 50
    .line 51
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p3

    .line 55
    if-eqz p3, :cond_2

    .line 56
    .line 57
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->isActivityTopic()Z

    .line 58
    .line 59
    .line 60
    move-result p3

    .line 61
    if-eqz p3, :cond_2

    .line 62
    .line 63
    iget-boolean p3, p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->selected:Z

    .line 64
    .line 65
    if-eqz p3, :cond_2

    .line 66
    .line 67
    iget-object p3, p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {}, Ll/cng;->g()Ll/cng;

    .line 70
    .line 71
    .line 72
    move-result-object p4

    .line 73
    iget-object p4, p4, Ll/cng;->c:Ljava/lang/String;

    .line 74
    .line 75
    invoke-static {p3, p4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 76
    .line 77
    .line 78
    move-result p3

    .line 79
    if-eqz p3, :cond_2

    .line 80
    .line 81
    iget-object p3, p1, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/NewPostTopicItemView;->f:Landroid/widget/ImageView;

    .line 82
    .line 83
    new-instance p4, Ll/mf5$a;

    .line 84
    .line 85
    invoke-direct {p4, p0, p1, p2}, Ll/mf5$a;-><init>(Ll/mf5;Lcom/p1/mobile/putong/feed/newui/topic/topiclist/NewPostTopicItemView;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p3, p4}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 89
    .line 90
    .line 91
    :cond_2
    return-void
.end method

.method public K(I)Lcom/p1/mobile/putong/feed/data/TopicMoment;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mf5;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 8
    .line 9
    return-object p0
.end method

.method public L(Lcom/p1/mobile/putong/feed/data/TopicMoment;)I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mf5;->d:Ljava/util/List;

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
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/mf5;->d:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0

    .line 22
    :cond_0
    const/4 p0, -0x1

    .line 23
    return p0
.end method

.method public final M(Lcom/p1/mobile/putong/feed/newui/topic/topiclist/NewPostTopicItemView;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V
    .locals 1

    .line 1
    new-instance v0, Ll/lf5;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/lf5;-><init>(Ll/mf5;Lcom/p1/mobile/putong/feed/newui/topic/topiclist/NewPostTopicItemView;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final N(Landroid/view/View;)Z
    .locals 2

    .line 1
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    const/4 v0, 0x2

    .line 10
    new-array v0, v0, [I

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/view/View;->getLocationInWindow([I)V

    .line 13
    .line 14
    .line 15
    aget p1, v0, v1

    .line 16
    .line 17
    iget-object p0, p0, Ll/mf5;->e:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    sget v0, Ll/qa00;->o:I

    .line 32
    .line 33
    add-int/2addr p1, v0

    .line 34
    if-ge p1, p0, :cond_1

    .line 35
    .line 36
    const/4 p0, 0x1

    .line 37
    return p0

    .line 38
    :cond_1
    return v1
.end method

.method public final O(Landroid/view/View;)Z
    .locals 2

    .line 1
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    const/4 v0, 0x2

    .line 10
    new-array v0, v0, [I

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/view/View;->getLocationInWindow([I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    aget v0, v0, v1

    .line 20
    .line 21
    add-int/2addr v0, p1

    .line 22
    iget-object p0, p0, Ll/mf5;->e:Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    sget p1, Ll/qa00;->o:I

    .line 37
    .line 38
    add-int/2addr v0, p1

    .line 39
    if-ge v0, p0, :cond_1

    .line 40
    .line 41
    const/4 p0, 0x1

    .line 42
    return p0

    .line 43
    :cond_1
    return v1
.end method

.method public final synthetic P(Lcom/p1/mobile/putong/feed/newui/topic/topiclist/NewPostTopicItemView;Lcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/cng;->g()Ll/cng;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/NewPostTopicItemView;->f:Landroid/widget/ImageView;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/mf5;->O(Landroid/view/View;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/NewPostTopicItemView;->f:Landroid/widget/ImageView;

    .line 14
    .line 15
    :cond_0
    invoke-virtual {p3, p1}, Ll/cng;->b(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/mf5;->g:Ll/z20;

    .line 19
    .line 20
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    iget-object p1, p0, Ll/mf5;->g:Ll/z20;

    .line 27
    .line 28
    iget-object p0, p0, Ll/mf5;->f:Ljava/lang/String;

    .line 29
    .line 30
    invoke-interface {p1, p0, p2}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method public Q(Ljava/lang/String;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/mf5;->f:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Ll/mf5;->d:Ljava/util/List;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public R(Ll/z20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/mf5;->g:Ll/z20;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mf5;->K(I)Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemViewType(I)I
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemViewType(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
