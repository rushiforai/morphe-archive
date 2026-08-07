.class public Ll/b8o;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final a:Lcom/p1/mobile/android/app/Act;

.field public final b:Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

.field public final c:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;",
            ">;>;"
        }
    .end annotation
.end field

.field public d:Ljava/lang/String;

.field public final e:Ll/ner;

.field public final f:Ll/wyd0;

.field public g:Z

.field public h:Ljava/lang/String;

.field public i:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 1
    const-string v9, "square-intlFollowing"

    .line 2
    .line 3
    const-string v10, "square-intlGame"

    .line 4
    .line 5
    const-string v0, "square-nearby"

    .line 6
    .line 7
    const-string v1, "square-suggested"

    .line 8
    .line 9
    const-string v2, "square-anchor-suggested"

    .line 10
    .line 11
    const-string v3, "square-following"

    .line 12
    .line 13
    const-string v4, "square-ongoing"

    .line 14
    .line 15
    const-string v5, "square-teen-mode"

    .line 16
    .line 17
    const-string v6, "voice-live"

    .line 18
    .line 19
    const-string v7, "square-multi-call"

    .line 20
    .line 21
    const-string v8, "square-newcomer"

    .line 22
    .line 23
    filled-new-array/range {v0 .. v10}, [Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sput-object v0, Ll/b8o;->j:Ljava/util/List;

    .line 32
    .line 33
    return-void
.end method

.method public constructor <init>(Ll/ner;Lcom/p1/mobile/android/app/Act;Lcom/tantan/live/home/eventbus/LiveHomeEventBus;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 5
    .line 6
    invoke-static {v0}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Ll/b8o;->c:Lrx/subjects/a;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Ll/b8o;->d:Ljava/lang/String;

    .line 14
    .line 15
    new-instance v0, Ll/wyd0;

    .line 16
    .line 17
    new-instance v1, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v2, "intl_live_square_act_record_tab_id"

    .line 20
    .line 21
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const-string v2, ""

    .line 36
    .line 37
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Ll/b8o;->f:Ll/wyd0;

    .line 41
    .line 42
    const/4 v0, 0x1

    .line 43
    iput-boolean v0, p0, Ll/b8o;->g:Z

    .line 44
    .line 45
    iput-object p1, p0, Ll/b8o;->e:Ll/ner;

    .line 46
    .line 47
    iput-object p2, p0, Ll/b8o;->a:Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    iput-object p3, p0, Ll/b8o;->b:Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 50
    .line 51
    return-void
.end method

.method public static synthetic a(Ll/b8o;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b8o;->r(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic b(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->name:Ljava/lang/String;

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

.method public static synthetic c(Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic d(Ll/b8o;Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b8o;->p(Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e(Ll/b8o;Lcom/p1/mobile/putong/live/external/square/LiveSquareSummaryInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b8o;->q(Lcom/p1/mobile/putong/live/external/square/LiveSquareSummaryInfo;)V

    return-void
.end method

.method public static synthetic f(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->id:Ljava/lang/String;

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

.method public static synthetic g(Ll/b8o;Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b8o;->s(Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V

    return-void
.end method

.method public static o(Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;)Z
    .locals 2

    .line 1
    const-string v0, "square-following"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->name:Ljava/lang/String;

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
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_0
    sget-object v0, Ll/b8o;->j:Ljava/util/List;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->name:Ljava/lang/String;

    .line 16
    .line 17
    invoke-interface {v0, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method


# virtual methods
.method public final A(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/b8o;->c:Lrx/subjects/a;

    .line 2
    .line 3
    new-instance v0, Ll/w7o;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/w7o;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p1, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public h()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object p0, p0, Ll/b8o;->c:Lrx/subjects/a;

    .line 4
    .line 5
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/util/Collection;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public i(Ljava/lang/String;)I
    .locals 1

    .line 1
    iget-object p0, p0, Ll/b8o;->c:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/4 p0, -0x1

    .line 16
    return p0

    .line 17
    :cond_0
    new-instance v0, Ll/z7o;

    .line 18
    .line 19
    invoke-direct {v0, p1}, Ll/z7o;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p0, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0
.end method

.method public j()Ljava/lang/String;
    .locals 3
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/b8o;->d:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return-object v1

    .line 7
    :cond_0
    iget-boolean v2, p0, Ll/b8o;->g:Z

    .line 8
    .line 9
    if-eqz v2, :cond_1

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    iput-boolean v1, p0, Ll/b8o;->g:Z

    .line 13
    .line 14
    return-object v0

    .line 15
    :cond_1
    return-object v1
.end method

.method public k()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/b8o;->c:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ll/h4z;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/h4z;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lrx/c;->skipWhile(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public l()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/b8o;->c:Lrx/subjects/a;

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

.method public m(I)Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/b8o;->c:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-lt p1, v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->name:Ljava/lang/String;

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_1
    :goto_0
    const-string p0, ""

    .line 32
    .line 33
    return-object p0
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/b8o;->u()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/b8o;->v()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/b8o;->w()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic p(Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/b8o;->f:Ll/wyd0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/lang/CharSequence;

    .line 10
    .line 11
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final synthetic q(Lcom/p1/mobile/putong/live/external/square/LiveSquareSummaryInfo;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/square/LiveSquareSummaryInfo;->getFirstLiveSquareSummary()Lcom/p1/mobile/putong/live/base/data/BLiveSquareSummary;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareSummary;->extTabId:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareSummary;->extTabId:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ll/b8o;->z(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    if-eqz p1, :cond_1

    .line 27
    .line 28
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareSummary;->defaultTabId:I

    .line 29
    .line 30
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const/4 p1, 0x0

    .line 36
    :goto_0
    iput-object p1, p0, Ll/b8o;->d:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/b8o;->u()V

    .line 39
    .line 40
    .line 41
    sget-object v1, Ll/tbs;->b:Ll/vwt;

    .line 42
    .line 43
    invoke-virtual {v1}, Ll/vwt;->kb()Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_3

    .line 48
    .line 49
    new-instance v1, Ll/a8o;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/a8o;-><init>(Ll/b8o;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 59
    .line 60
    if-nez v0, :cond_2

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_2
    iget-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->id:Ljava/lang/String;

    .line 64
    .line 65
    :goto_1
    iput-object p1, p0, Ll/b8o;->d:Ljava/lang/String;

    .line 66
    .line 67
    :cond_3
    return-void
.end method

.method public final synthetic r(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/b8o;->u()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic s(Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSquareTabs:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/b8o;->A(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final t()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/b8o;->i:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/b8o;->i:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/b8o;->z(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object v0, p0, Ll/b8o;->h:Ljava/lang/String;

    .line 16
    .line 17
    iput-object v0, p0, Ll/b8o;->d:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/b8o;->u()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public u()V
    .locals 1

    .line 1
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSquareTabs:Ljava/util/List;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/b8o;->A(Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public v()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/b8o;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    const-string v1, "live-tab"

    .line 4
    .line 5
    invoke-static {v1}, Lcom/p1/mobile/putong/live/external/intl/module/api/IntlLiveSquareApi;->getLiveSquareSummaryInfo(Ljava/lang/String;)Lrx/c;

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
    new-instance v1, Ll/t7o;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/t7o;-><init>(Ll/b8o;)V

    .line 16
    .line 17
    .line 18
    new-instance v2, Ll/u7o;

    .line 19
    .line 20
    invoke-direct {v2, p0}, Ll/u7o;-><init>(Ll/b8o;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public w()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/b8o;->e:Ll/ner;

    .line 2
    .line 3
    sget-object v1, Ll/tbs;->b:Ll/vwt;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/mof0;->k()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v0, v1}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/x7o;

    .line 18
    .line 19
    invoke-direct {v1}, Ll/x7o;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/y7o;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/y7o;-><init>(Ll/b8o;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

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

.method public x(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    new-instance p0, Ljava/lang/NullPointerException;

    .line 4
    .line 5
    const-string p1, "LiveSquareAct start intent lost data"

    .line 6
    .line 7
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v0, p0, Ll/b8o;->a:Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    invoke-static {p1, v0}, Ll/n4u;->j(Landroid/os/Bundle;Lcom/p1/mobile/android/app/Act;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    const-string v0, "default_tab_id"

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Ll/b8o;->h:Ljava/lang/String;

    .line 31
    .line 32
    const-string v0, "from"

    .line 33
    .line 34
    const/4 v2, 0x0

    .line 35
    invoke-virtual {p1, v0, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    const-string v2, "extra_tab_id"

    .line 40
    .line 41
    invoke-virtual {p1, v2, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iput-object v1, p0, Ll/b8o;->i:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v1, p0, Ll/b8o;->a:Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    invoke-static {p1, v0, v1}, Ll/n4u;->g(Landroid/os/Bundle;ILcom/p1/mobile/android/app/Act;)V

    .line 50
    .line 51
    .line 52
    const/4 p1, 0x1

    .line 53
    iput-boolean p1, p0, Ll/b8o;->g:Z

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/b8o;->t()V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public y(I)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/b8o;->h()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x1

    .line 10
    if-le v1, v2, :cond_0

    .line 11
    .line 12
    sget-object v1, Ll/tbs;->b:Ll/vwt;

    .line 13
    .line 14
    invoke-virtual {v1}, Ll/vwt;->kb()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    if-ltz p1, :cond_0

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-ge p1, v1, :cond_0

    .line 27
    .line 28
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 33
    .line 34
    iget-object p0, p0, Ll/b8o;->f:Ll/wyd0;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->id:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public final z(Ljava/lang/String;)V
    .locals 3

    .line 1
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSquareExtTabs:Ljava/util/List;

    .line 15
    .line 16
    new-instance v2, Ll/v7o;

    .line 17
    .line 18
    invoke-direct {v2, p1}, Ll/v7o;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 26
    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    :cond_0
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/b8o;->u()V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    invoke-virtual {p0, v1}, Ll/b8o;->A(Ljava/util/List;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method
