.class public abstract Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;
.super Lv/VFrame;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/view/View;",
        ">",
        "Lv/VFrame;"
    }
.end annotation


# instance fields
.field public a:Ll/zub0;

.field public b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 10
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->K(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->K(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->K(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->b:Ljava/lang/String;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->K(Landroid/content/Context;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private getFrom()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;Ll/l1i;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->L(Ll/l1i;)V

    return-void
.end method


# virtual methods
.method public B(Ll/l1i;)Landroid/view/View;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/l1i;",
            ")TT;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->getQaTopicVoteViewList()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Ll/l1i;->c()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Landroid/view/View;

    .line 14
    .line 15
    return-object p0
.end method

.method public abstract C(Ll/l1i;)V
.end method

.method public abstract E(Ll/l1i;)V
.end method

.method public F(Ll/l1i;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/l1i;->i()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->C(Ll/l1i;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->E(Ll/l1i;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public abstract G(Ll/l1i;)V
.end method

.method public K(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->s(Lcom/p1/mobile/android/app/Act;)Ll/zub0;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->a:Ll/zub0;

    .line 10
    .line 11
    return-void
.end method

.method public final synthetic L(Ll/l1i;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->M(Ll/l1i;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public M(Ll/l1i;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->B(Ll/l1i;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ll/l1i;->f()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/l1i;->i()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    sget-object p1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaItemVoteStatus;->HAVE_VOTE_BE_VOTING:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaItemVoteStatus;

    .line 18
    .line 19
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->N(Landroid/view/View;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaItemVoteStatus;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaItemVoteStatus;->HAVE_VOTE_NOT_BE_VOTING:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaItemVoteStatus;

    .line 24
    .line 25
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->N(Landroid/view/View;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaItemVoteStatus;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaItemVoteStatus;->NO_VOTE:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaItemVoteStatus;

    .line 30
    .line 31
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->N(Landroid/view/View;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaItemVoteStatus;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public abstract N(Landroid/view/View;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaItemVoteStatus;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaItemVoteStatus;",
            ")V"
        }
    .end annotation
.end method

.method public O(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->a:Ll/zub0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/zub0;->w(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 6
    .line 7
    .line 8
    :cond_0
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

.method public abstract getAnimTime()I
.end method

.method public abstract getQaTopicVoteViewList()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation
.end method

.method public abstract getView()Landroid/view/View;
.end method

.method public abstract getVoteListContainer()Landroid/view/View;
.end method

.method public abstract getVoteViewContainerList()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end method

.method public final s(Lcom/p1/mobile/android/app/Act;)Ll/zub0;
    .locals 3

    .line 1
    new-instance v0, Ll/zub0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->u()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->getFrom()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-direct {v0, p0, p1, v1, v2}, Ll/zub0;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public setCancelSuccess(Ll/x20;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->a:Ll/zub0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/zub0;->y(Ll/x20;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setVoteSuccess(Ll/x20;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->a:Ll/zub0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/zub0;->z(Ll/x20;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public u()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public abstract v(Ll/l1i;)V
.end method

.method public w(Ll/l1i;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/l1i;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->F(Ll/l1i;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->G(Ll/l1i;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public z(Ll/l1i;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/l1i;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->v(Ll/l1i;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Ll/l1i;->h()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/xxh;

    .line 21
    .line 22
    invoke-direct {v1, p0, p1}, Ll/xxh;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;Ll/l1i;)V

    .line 23
    .line 24
    .line 25
    const-wide/16 p0, 0x12c

    .line 26
    .line 27
    invoke-virtual {v0, v1, p0, p1}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->M(Ll/l1i;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->w(Ll/l1i;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->M(Ll/l1i;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method
