.class public Ll/bkt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/o5m;


# instance fields
.field public final a:Ll/tf3;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/tf3<",
            "Ll/isv;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Lcom/p1/mobile/android/app/Frag;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public e:Ll/ugd0;

.field public final f:Ll/ckt;

.field public final g:Ll/ft5;

.field public final h:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Frag;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/tf3;

    .line 5
    .line 6
    invoke-static {}, Ll/isv;->g()Ll/isv;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {v0, v1}, Ll/tf3;-><init>(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/bkt;->a:Ll/tf3;

    .line 14
    .line 15
    new-instance v0, Ll/ft5;

    .line 16
    .line 17
    invoke-direct {v0}, Ll/ft5;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ll/bkt;->g:Ll/ft5;

    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Ll/bkt;->h:Ljava/lang/String;

    .line 31
    .line 32
    iput-object p1, p0, Ll/bkt;->b:Lcom/p1/mobile/android/app/Frag;

    .line 33
    .line 34
    iput-object p2, p0, Ll/bkt;->c:Ljava/lang/String;

    .line 35
    .line 36
    iput-object p3, p0, Ll/bkt;->d:Ljava/lang/String;

    .line 37
    .line 38
    new-instance p1, Ll/ckt;

    .line 39
    .line 40
    invoke-direct {p1, p2, p3}, Ll/ckt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iput-object p1, p0, Ll/bkt;->f:Ll/ckt;

    .line 44
    .line 45
    return-void
.end method

.method public static synthetic j(Ll/bkt;Ll/ubu;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bkt;->q(Ll/ubu;)V

    return-void
.end method

.method public static synthetic k(Ll/ugd0;Ll/isv;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ll/isv;->f(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic l(Ll/bkt;Ll/isv;Ll/ubu;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bkt;->p(Ll/isv;Ll/ubu;)V

    return-void
.end method

.method public static synthetic m(Ljava/util/Collection;Ll/isv;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Ll/isv;->r(Ljava/util/Collection;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n(Ll/ubu;Ll/isv;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Ll/isv;->p(Ll/ubu;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o(Ll/ugd0;Ll/isv;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 2
    .line 3
    iget-object v1, p0, Ll/mr2;->b:Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 4
    .line 5
    iget-object p0, p0, Ll/mr2;->a:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    invoke-virtual {p1, v0, v1, p0}, Ll/isv;->u(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;Lcom/p1/mobile/putong/data/User;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bkt;->g:Ll/ft5;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ft5;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/bkt;->a:Ll/tf3;

    .line 2
    .line 3
    new-instance v0, Ll/wjt;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/wjt;-><init>(Ljava/util/Collection;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/tf3;->a(Ll/y20;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public c(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/bkt;->f()Ll/isv;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/isv;->n()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Ll/bkt;->e:Ll/ugd0;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/bkt;->r(Ll/ugd0;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const/4 v1, -0x1

    .line 18
    if-eq p1, v1, :cond_1

    .line 19
    .line 20
    add-int/lit8 v0, v0, -0x4

    .line 21
    .line 22
    if-le p1, v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/bkt;->s()V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V
    .locals 2

    .line 1
    sget-object v0, Ll/bkt$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->getJumpRoomType()Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    aget v0, v0, v1

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    if-eq v0, v1, :cond_0

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->getLiveIdNeedToRemove()Ljava/util/HashSet;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Ll/bkt;->b(Ljava/util/Collection;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public e(Ll/ugd0;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/bkt;->a:Ll/tf3;

    .line 2
    .line 3
    new-instance v0, Ll/zjt;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/zjt;-><init>(Ll/ugd0;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/tf3;->a(Ll/y20;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public f()Ll/isv;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/bkt;->a:Ll/tf3;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/tf3;->c()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/isv;

    .line 8
    .line 9
    return-object p0
.end method

.method public g()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/isv;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/bkt;->a:Ll/tf3;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/tf3;->d()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public i(Ll/ugd0;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bkt;->e:Ll/ugd0;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/bkt;->r(Ll/ugd0;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Ll/bkt;->a:Ll/tf3;

    .line 10
    .line 11
    new-instance p2, Ll/yjt;

    .line 12
    .line 13
    invoke-direct {p2, p1}, Ll/yjt;-><init>(Ll/ugd0;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p2}, Ll/tf3;->a(Ll/y20;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic p(Ll/isv;Ll/ubu;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Ll/isv;->p(Ll/ubu;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/bkt;->a:Ll/tf3;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/tf3;->e(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic q(Ll/ubu;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/bkt;->a:Ll/tf3;

    .line 2
    .line 3
    new-instance v0, Ll/akt;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/akt;-><init>(Ll/ubu;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/tf3;->a(Ll/y20;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final r(Ll/ugd0;)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance v0, Ll/isv;

    .line 5
    .line 6
    iget-object v1, p1, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 7
    .line 8
    iget-object v2, p1, Ll/mr2;->b:Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 9
    .line 10
    iget-object v3, p1, Ll/mr2;->a:Lcom/p1/mobile/putong/data/User;

    .line 11
    .line 12
    invoke-direct {v0, v1, v2, v3}, Ll/isv;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;Lcom/p1/mobile/putong/data/User;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p1, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ll/isv;->f(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/bkt;->b:Lcom/p1/mobile/android/app/Frag;

    .line 23
    .line 24
    iget-object v1, p0, Ll/bkt;->f:Ll/ckt;

    .line 25
    .line 26
    invoke-virtual {v1}, Ll/ckt;->b()Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {p1, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    new-instance v1, Ll/vjt;

    .line 43
    .line 44
    invoke-direct {v1, p0, v0}, Ll/vjt;-><init>(Ll/bkt;Ll/isv;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iget-object p0, p0, Ll/bkt;->g:Ll/ft5;

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Ll/ft5;->a(Ll/kcg0;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final s()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/bkt;->b:Lcom/p1/mobile/android/app/Frag;

    .line 2
    .line 3
    iget-object v1, p0, Ll/bkt;->f:Ll/ckt;

    .line 4
    .line 5
    iget-object v2, p0, Ll/bkt;->a:Ll/tf3;

    .line 6
    .line 7
    invoke-virtual {v2}, Ll/tf3;->c()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    check-cast v2, Ll/isv;

    .line 12
    .line 13
    invoke-virtual {v2}, Ll/isv;->j()Ll/ubu;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v1, v2}, Ll/ckt;->c(Ll/ubu;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/xjt;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/xjt;-><init>(Ll/bkt;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object p0, p0, Ll/bkt;->g:Ll/ft5;

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Ll/ft5;->a(Ll/kcg0;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method
