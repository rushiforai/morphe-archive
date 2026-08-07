.class public Ll/qvd;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

.field public e:I

.field public f:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/qvd;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ll/j2s;

.field public h:[Lcom/p1/mobile/putong/live/base/data/BLiveCall;


# direct methods
.method public constructor <init>(Z)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "position index illegal"

    .line 5
    .line 6
    iput-object v0, p0, Ll/qvd;->b:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "position has already a diff call"

    .line 9
    .line 10
    iput-object v0, p0, Ll/qvd;->c:Ljava/lang/String;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Ll/qvd;->d:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    iput v0, p0, Ll/qvd;->e:I

    .line 17
    .line 18
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Ll/qvd;->f:Lrx/subjects/a;

    .line 23
    .line 24
    new-instance v0, Ll/j2s;

    .line 25
    .line 26
    new-instance v1, Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 29
    .line 30
    .line 31
    new-instance v2, Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-direct {v0, v1, v2}, Ll/j2s;-><init>(Ljava/util/List;Ljava/util/List;)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Ll/qvd;->g:Ll/j2s;

    .line 40
    .line 41
    const/4 v0, 0x3

    .line 42
    new-array v0, v0, [Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 43
    .line 44
    iput-object v0, p0, Ll/qvd;->h:[Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 45
    .line 46
    iput-boolean p1, p0, Ll/qvd;->a:Z

    .line 47
    .line 48
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Lcom/p1/mobile/putong/live/base/data/BLiveCall;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->position:I

    .line 2
    .line 3
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->position:I

    .line 4
    .line 5
    if-le p0, p1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    if-ne p0, p1, :cond_1

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_1
    const/4 p0, -0x1

    .line 14
    return p0
.end method

.method public static synthetic b(Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method


# virtual methods
.method public c(Ll/y34;)V
    .locals 4

    .line 1
    iget-object v0, p1, Ll/y34;->a:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    iget-object p1, p1, Ll/y34;->b:Ll/h64;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->getDeputyViewPos()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0, v1}, Ll/qvd;->r(I)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Ll/qvd;->b:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/qvd;->u(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object v1, p0, Ll/qvd;->h:[Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->getDeputyViewPos()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    aget-object v1, v1, v2

    .line 28
    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    iget-object v1, p0, Ll/qvd;->g:Ll/j2s;

    .line 32
    .line 33
    iget-object v2, p0, Ll/qvd;->h:[Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->getDeputyViewPos()I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    aget-object v2, v2, v3

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Ll/j2s;->t(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    iget-object v1, p0, Ll/qvd;->h:[Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 45
    .line 46
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->getDeputyViewPos()I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    aput-object v0, v1, v2

    .line 51
    .line 52
    iget-object v1, p0, Ll/qvd;->g:Ll/j2s;

    .line 53
    .line 54
    invoke-virtual {v1, v0, p1}, Ll/j2s;->h(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Ll/h64;)V

    .line 55
    .line 56
    .line 57
    const/4 p1, 0x4

    .line 58
    invoke-virtual {p0, p1, v0}, Ll/qvd;->v(ILcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public d(I)Lcom/p1/mobile/putong/live/base/data/BLiveCall;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qvd;->h:[Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    aget-object p0, p0, p1

    .line 4
    .line 5
    return-object p0
.end method

.method public e(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveCall;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Ll/qvd;->h:[Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 3
    .line 4
    array-length v2, v1

    .line 5
    if-ge v0, v2, :cond_1

    .line 6
    .line 7
    aget-object v1, v1, v0

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v1, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/qvd;->h:[Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 20
    .line 21
    aget-object p0, p0, v0

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const/4 p0, 0x0

    .line 28
    return-object p0
.end method

.method public f(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveCall;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qvd;->g:Ll/j2s;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/j2s;->j(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public g(Ljava/lang/Integer;)Ll/h64;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qvd;->h:[Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    aget-object v0, v0, v1

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/qvd;->g:Ll/j2s;

    .line 12
    .line 13
    iget-object p0, p0, Ll/qvd;->h:[Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    aget-object p0, p0, p1

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->user:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Ll/j2s;->k(Ljava/lang/String;)Ll/h64;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return-object p0
.end method

.method public h()Lcom/p1/mobile/putong/live/base/data/BLiveCall;
    .locals 2

    .line 1
    iget-object p0, p0, Ll/qvd;->g:Ll/j2s;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/j2s;->m()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 22
    .line 23
    invoke-static {v0}, Ll/u54;->h(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    return-object v0

    .line 30
    :cond_1
    const/4 p0, 0x0

    .line 31
    return-object p0
.end method

.method public i()Lcom/p1/mobile/putong/live/base/data/BLiveCall;
    .locals 2

    .line 1
    iget-object p0, p0, Ll/qvd;->g:Ll/j2s;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/j2s;->m()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 22
    .line 23
    invoke-static {v0}, Ll/u54;->n(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_1

    .line 28
    .line 29
    invoke-static {v0}, Ll/u54;->m(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    :cond_1
    return-object v0

    .line 36
    :cond_2
    const/4 p0, 0x0

    .line 37
    return-object p0
.end method

.method public j()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/qvd;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/qvd;->f:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public k(I)Lcom/p1/mobile/putong/live/base/data/BLiveCall;
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/qvd;->r(I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-object p0, p0, Ll/qvd;->h:[Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 10
    .line 11
    aget-object p0, p0, p1

    .line 12
    .line 13
    return-object p0
.end method

.method public l()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCall;",
            ">;"
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
    iget-object p0, p0, Ll/qvd;->h:[Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 7
    .line 8
    new-instance v1, Ll/ovd;

    .line 9
    .line 10
    invoke-direct {v1, v0}, Ll/ovd;-><init>(Ljava/util/ArrayList;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p0, v1}, Ll/jyb;->A([Ljava/lang/Object;Ll/y20;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public m()Ll/j2s;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qvd;->g:Ll/j2s;

    .line 2
    .line 3
    return-object p0
.end method

.method public n()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCall;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object p0, p0, Ll/qvd;->g:Ll/j2s;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/j2s;->n()Ljava/util/Collection;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 10
    .line 11
    .line 12
    new-instance p0, Ll/pvd;

    .line 13
    .line 14
    invoke-direct {p0}, Ll/pvd;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-static {v0, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 18
    .line 19
    .line 20
    return-object v0
.end method

.method public o()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qvd;->d:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public p(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final q(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Lcom/p1/mobile/putong/live/base/data/BLiveCall;
    .locals 4

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->liveId:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->liveId:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->state:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->state:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->opState:Ljava/lang/String;

    .line 14
    .line 15
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->opState:Ljava/lang/String;

    .line 16
    .line 17
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->source:Ljava/lang/String;

    .line 18
    .line 19
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->source:Ljava/lang/String;

    .line 20
    .line 21
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->user:Ljava/lang/String;

    .line 22
    .line 23
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->user:Ljava/lang/String;

    .line 24
    .line 25
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchor:Ljava/lang/String;

    .line 26
    .line 27
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchor:Ljava/lang/String;

    .line 28
    .line 29
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userSendRewardPoint:J

    .line 30
    .line 31
    iput-wide v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userSendRewardPoint:J

    .line 32
    .line 33
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userRecvRewardPoint:J

    .line 34
    .line 35
    iput-wide v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userRecvRewardPoint:J

    .line 36
    .line 37
    iget p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->intendPosition:I

    .line 38
    .line 39
    iput p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->intendPosition:I

    .line 40
    .line 41
    iget p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->position:I

    .line 42
    .line 43
    iput p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->position:I

    .line 44
    .line 45
    iget-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->mutedByUser:Z

    .line 46
    .line 47
    iput-boolean p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->mutedByUser:Z

    .line 48
    .line 49
    iget-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->mutedByAnchor:Z

    .line 50
    .line 51
    iput-boolean p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->mutedByAnchor:Z

    .line 52
    .line 53
    iget-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->isAway:Z

    .line 54
    .line 55
    iput-boolean p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->isAway:Z

    .line 56
    .line 57
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->inviteId:Ljava/lang/String;

    .line 58
    .line 59
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->inviteId:Ljava/lang/String;

    .line 60
    .line 61
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userName:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    if-nez p0, :cond_0

    .line 68
    .line 69
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userName:Ljava/lang/String;

    .line 70
    .line 71
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userName:Ljava/lang/String;

    .line 72
    .line 73
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchorUserName:Ljava/lang/String;

    .line 74
    .line 75
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    if-nez p0, :cond_1

    .line 80
    .line 81
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchorUserName:Ljava/lang/String;

    .line 82
    .line 83
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchorUserName:Ljava/lang/String;

    .line 84
    .line 85
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userPicture:Ljava/lang/String;

    .line 86
    .line 87
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    if-nez p0, :cond_2

    .line 92
    .line 93
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userPicture:Ljava/lang/String;

    .line 94
    .line 95
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userPicture:Ljava/lang/String;

    .line 96
    .line 97
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchorPicture:Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    if-nez p0, :cond_3

    .line 104
    .line 105
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchorPicture:Ljava/lang/String;

    .line 106
    .line 107
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchorPicture:Ljava/lang/String;

    .line 108
    .line 109
    :cond_3
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->videoInviteTime:J

    .line 110
    .line 111
    const-wide/16 v2, 0x0

    .line 112
    .line 113
    cmp-long p0, v0, v2

    .line 114
    .line 115
    if-lez p0, :cond_4

    .line 116
    .line 117
    iput-wide v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->videoInviteTime:J

    .line 118
    .line 119
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->hangupReason:Ljava/lang/String;

    .line 120
    .line 121
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->hangupReason:Ljava/lang/String;

    .line 122
    .line 123
    return-object p2
.end method

.method public final r(I)Z
    .locals 0

    .line 1
    if-ltz p1, :cond_1

    .line 2
    .line 3
    const/4 p0, 0x2

    .line 4
    if-le p1, p0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 10
    return p0
.end method

.method public s()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qvd;->g:Ll/j2s;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/j2s;->s()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public t(Ljava/lang/String;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Ll/qvd;->h:[Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 3
    .line 4
    array-length v2, v1

    .line 5
    if-ge v0, v2, :cond_1

    .line 6
    .line 7
    aget-object v1, v1, v0

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object v1, p0, Ll/qvd;->h:[Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    aput-object v2, v1, v0

    .line 23
    .line 24
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    iget-object v0, p0, Ll/qvd;->g:Ll/j2s;

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Ll/j2s;->i(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    if-eqz p1, :cond_2

    .line 34
    .line 35
    iget-object v0, p0, Ll/qvd;->g:Ll/j2s;

    .line 36
    .line 37
    invoke-virtual {v0, p1}, Ll/j2s;->t(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 38
    .line 39
    .line 40
    const/4 v0, 0x3

    .line 41
    invoke-virtual {p0, v0, p1}, Ll/qvd;->v(ILcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 42
    .line 43
    .line 44
    :cond_2
    return-void
.end method

.method public final u(Ljava/lang/String;)V
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final v(ILcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p1, v0, :cond_0

    .line 3
    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "op is "

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, ", opdata is null"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0, v0}, Ll/qvd;->p(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    iput p1, p0, Ll/qvd;->e:I

    .line 29
    .line 30
    iput-object p2, p0, Ll/qvd;->d:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 31
    .line 32
    const-string p1, "send data"

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Ll/qvd;->p(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/qvd;->f:Lrx/subjects/a;

    .line 38
    .line 39
    invoke-virtual {p1, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public w(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 2
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveCall;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->getDeputyViewPos()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Ll/qvd;->r(I)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/qvd;->b:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/qvd;->u(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Ll/qvd;->h:[Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->getDeputyViewPos()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    aget-object v0, v0, v1

    .line 23
    .line 24
    invoke-virtual {p0, p1, v0}, Ll/qvd;->q(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v1, p0, Ll/qvd;->h:[Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->getDeputyViewPos()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    aput-object v0, v1, p1

    .line 35
    .line 36
    iget-object p1, p0, Ll/qvd;->g:Ll/j2s;

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Ll/j2s;->v(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 39
    .line 40
    .line 41
    const/4 p1, 0x2

    .line 42
    invoke-virtual {p0, p1, v0}, Ll/qvd;->v(ILcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public x(Ll/j2s;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Ll/j2s;->m()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/qvd;->h:[Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->getDeputyViewPos()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    invoke-virtual {p0, v3}, Ll/qvd;->r(I)Z

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    if-eqz v4, :cond_0

    .line 36
    .line 37
    iget-object p1, p0, Ll/qvd;->b:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Ll/qvd;->u(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    iget-object v4, p0, Ll/qvd;->h:[Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 44
    .line 45
    aput-object v1, v4, v3

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    iput-object p1, p0, Ll/qvd;->g:Ll/j2s;

    .line 49
    .line 50
    const/4 p1, 0x1

    .line 51
    invoke-virtual {p0, p1, v2}, Ll/qvd;->v(ILcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method
