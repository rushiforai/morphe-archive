.class public Ll/ucj0;
.super Ll/n570;
.source "SourceFile"

# interfaces
.implements Ll/wh00;


# instance fields
.field public d:Ll/cdj0;

.field public e:Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;Ll/cdj0;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Ll/n570;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;)V

    .line 3
    .line 4
    .line 5
    iput-object p1, p0, Ll/ucj0;->e:Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;

    .line 6
    .line 7
    iput-object p2, p0, Ll/ucj0;->d:Ll/cdj0;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic C(Ll/ucj0;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ucj0;->I(Ll/pf60;)V

    return-void
.end method

.method public static synthetic D(Ll/ucj0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ucj0;->K(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic E(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic F(Ll/ucj0;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ucj0;->J(Ll/bkj0;)V

    return-void
.end method

.method private synthetic I(Ll/pf60;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ucj0;->e:Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;->Q4(Ll/pf60;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic J(Ll/bkj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ucj0;->e:Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;->P4(Ll/bkj0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic K(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ucj0;->e:Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;->O4(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public A()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ucj0;->e:Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 4
    .line 5
    iget-object v2, p0, Ll/ucj0;->d:Ll/cdj0;

    .line 6
    .line 7
    iget-object v3, v2, Ll/cdj0;->d:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v2, v2, Ll/cdj0;->c:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v1, v3, v2}, Ll/jka;->od(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/qcj0;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/qcj0;-><init>(Ll/ucj0;)V

    .line 22
    .line 23
    .line 24
    new-instance v2, Ll/rcj0;

    .line 25
    .line 26
    invoke-direct {v2, p0}, Ll/rcj0;-><init>(Ll/ucj0;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public G(Lcom/p1/mobile/putong/feed/data/MomentMessage;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ucj0;->d:Ll/cdj0;

    .line 4
    .line 5
    iget-object v1, p0, Ll/cdj0;->d:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p0, p0, Ll/cdj0;->c:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, p1, v1, p0}, Ll/jka;->id(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public H(Lcom/p1/mobile/putong/feed/data/MomentMessage;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ucj0;->d:Ll/cdj0;

    .line 4
    .line 5
    iget-object v1, p0, Ll/cdj0;->d:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p0, p0, Ll/cdj0;->c:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, p1, v1, p0}, Ll/jka;->jd(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public a()V
    .locals 0

    .line 1
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ucj0;->e:Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;->R4(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    return-void
.end method

.method public o()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ucj0;->A()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public z()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ucj0;->e:Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 4
    .line 5
    iget-object v2, p0, Ll/ucj0;->d:Ll/cdj0;

    .line 6
    .line 7
    iget-object v3, v2, Ll/cdj0;->d:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v4, v2, Ll/cdj0;->c:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v2, v2, Ll/cdj0;->j:Lcom/p1/mobile/putong/data/Links;

    .line 12
    .line 13
    invoke-virtual {v1, v3, v4, v2}, Ll/jka;->nd(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Links;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/scj0;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/scj0;-><init>(Ll/ucj0;)V

    .line 24
    .line 25
    .line 26
    new-instance p0, Ll/tcj0;

    .line 27
    .line 28
    invoke-direct {p0}, Ll/tcj0;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

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
