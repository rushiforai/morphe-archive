.class public Ll/zro0;
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

.field public b:Ll/ugd0;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Lcom/p1/mobile/android/app/Frag;

.field public final f:Ll/aso0;

.field public final g:Ll/ft5;


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
    iput-object v0, p0, Ll/zro0;->a:Ll/tf3;

    .line 14
    .line 15
    new-instance v0, Ll/ft5;

    .line 16
    .line 17
    invoke-direct {v0}, Ll/ft5;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ll/zro0;->g:Ll/ft5;

    .line 21
    .line 22
    iput-object p1, p0, Ll/zro0;->e:Lcom/p1/mobile/android/app/Frag;

    .line 23
    .line 24
    iput-object p2, p0, Ll/zro0;->c:Ljava/lang/String;

    .line 25
    .line 26
    iput-object p3, p0, Ll/zro0;->d:Ljava/lang/String;

    .line 27
    .line 28
    new-instance p1, Ll/aso0;

    .line 29
    .line 30
    invoke-direct {p1, p2, p3}, Ll/aso0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Ll/zro0;->f:Ll/aso0;

    .line 34
    .line 35
    return-void
.end method

.method public static synthetic j(Ll/ugd0;Ll/isv;)V
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

.method public static synthetic k(Ll/zro0;Ll/isv;Ll/kfn0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zro0;->o(Ll/isv;Ll/kfn0;)V

    return-void
.end method

.method public static synthetic l(Ljava/util/Collection;Ll/isv;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Ll/isv;->r(Ljava/util/Collection;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic m(Ll/kfn0;Ll/isv;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Ll/isv;->q(Ll/kfn0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n(Ll/zro0;Ll/kfn0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zro0;->p(Ll/kfn0;)V

    return-void
.end method

.method private q(Ll/ugd0;)V
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
    iget-object v1, p1, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ll/isv;->f(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Ll/zro0;->e:Lcom/p1/mobile/android/app/Frag;

    .line 23
    .line 24
    iget-object v2, p0, Ll/zro0;->f:Ll/aso0;

    .line 25
    .line 26
    invoke-virtual {v2, p1}, Ll/aso0;->a(Ll/ugd0;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {v1, p1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

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
    new-instance v1, Ll/xro0;

    .line 43
    .line 44
    invoke-direct {v1, p0, v0}, Ll/xro0;-><init>(Ll/zro0;Ll/isv;)V

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
    iget-object p0, p0, Ll/zro0;->g:Ll/ft5;

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Ll/ft5;->a(Ll/kcg0;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method private r()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/zro0;->e:Lcom/p1/mobile/android/app/Frag;

    .line 2
    .line 3
    iget-object v1, p0, Ll/zro0;->f:Ll/aso0;

    .line 4
    .line 5
    iget-object v2, p0, Ll/zro0;->a:Ll/tf3;

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
    invoke-virtual {v2}, Ll/isv;->o()Ll/kfn0;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v1, v2}, Ll/aso0;->b(Ll/kfn0;)Lrx/c;

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
    new-instance v1, Ll/vro0;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/vro0;-><init>(Ll/zro0;)V

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
    iget-object p0, p0, Ll/zro0;->g:Ll/ft5;

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Ll/ft5;->a(Ll/kcg0;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zro0;->g:Ll/ft5;

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
    iget-object p0, p0, Ll/zro0;->a:Ll/tf3;

    .line 2
    .line 3
    new-instance v0, Ll/uro0;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/uro0;-><init>(Ljava/util/Collection;)V

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
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/zro0;->f()Ll/isv;

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
    iget-object p1, p0, Ll/zro0;->b:Ll/ugd0;

    .line 12
    .line 13
    invoke-direct {p0, p1}, Ll/zro0;->q(Ll/ugd0;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    add-int/lit8 v0, v0, -0x3

    .line 18
    .line 19
    if-le p1, v0, :cond_1

    .line 20
    .line 21
    invoke-direct {p0}, Ll/zro0;->r()V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V
    .locals 2

    .line 1
    sget-object v0, Ll/zro0$a;->a:[I

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
    invoke-virtual {p0, p1}, Ll/zro0;->b(Ljava/util/Collection;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public e(Ll/ugd0;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/zro0;->a:Ll/tf3;

    .line 2
    .line 3
    new-instance v0, Ll/wro0;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/wro0;-><init>(Ll/ugd0;)V

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
    iget-object p0, p0, Ll/zro0;->a:Ll/tf3;

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
    iget-object p0, p0, Ll/zro0;->a:Ll/tf3;

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
    iput-object p1, p0, Ll/zro0;->b:Ll/ugd0;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ll/zro0;->q(Ll/ugd0;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final synthetic o(Ll/isv;Ll/kfn0;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Ll/isv;->q(Ll/kfn0;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/zro0;->a:Ll/tf3;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/tf3;->e(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic p(Ll/kfn0;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/zro0;->a:Ll/tf3;

    .line 2
    .line 3
    new-instance v0, Ll/yro0;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/yro0;-><init>(Ll/kfn0;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/tf3;->a(Ll/y20;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    return-void
.end method
