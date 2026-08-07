.class public Ll/t6h;
.super Ll/a7;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/a7<",
        "Ljava/util/List<",
        "Lcom/p1/mobile/putong/data/User;",
        ">;>;"
    }
.end annotation


# instance fields
.field public b:Lcom/p1/mobile/putong/data/Links;

.field public c:Ljava/lang/String;

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public e:Lcom/p1/mobile/android/app/Act;

.field public f:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/a7;-><init>()V

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
    iput-object v0, p0, Ll/t6h;->d:Ljava/util/List;

    .line 10
    .line 11
    iput-object p2, p0, Ll/t6h;->c:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p1, p0, Ll/t6h;->e:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic c(Ll/t6h;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/t6h;->l(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic d(Ll/t6h;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/t6h;->k(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic e(Ll/t6h;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/t6h;->j(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic f(Ll/t6h;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/t6h;->m(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic g(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method private synthetic m(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/a7;->b()Ll/l6c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-interface {p0, p1}, Ll/l6c;->a(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final h(Ljava/util/List;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    new-instance v0, Ll/s6h;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/s6h;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p1, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 17
    .line 18
    .line 19
    return-object p1
.end method

.method public i()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t6h;->b:Lcom/p1/mobile/putong/data/Links;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 9
    .line 10
    return-object p0
.end method

.method public final synthetic j(Ll/bkj0;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/data/Links;

    .line 4
    .line 5
    iput-object v0, p0, Ll/t6h;->b:Lcom/p1/mobile/putong/data/Links;

    .line 6
    .line 7
    iget-object v0, p0, Ll/t6h;->d:Ljava/util/List;

    .line 8
    .line 9
    iget-object v1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v1, Ljava/util/List;

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Ll/t6h;->h(Ljava/util/List;)Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/a7;->b()Ll/l6c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v1, p0, Ll/t6h;->d:Ljava/util/List;

    .line 25
    .line 26
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast p1, Lcom/p1/mobile/putong/data/Links;

    .line 29
    .line 30
    invoke-interface {v0, v1, p1}, Ll/l6c;->z0(Ljava/lang/Object;Lcom/p1/mobile/putong/data/Links;)V

    .line 31
    .line 32
    .line 33
    const/4 p1, 0x0

    .line 34
    iput-boolean p1, p0, Ll/t6h;->f:Z

    .line 35
    .line 36
    return-void
.end method

.method public final synthetic k(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/a7;->b()Ll/l6c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-interface {v0, p1}, Ll/l6c;->a(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Ll/t6h;->f:Z

    .line 13
    .line 14
    return-void
.end method

.method public final synthetic l(Ll/bkj0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/t6h;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/t6h;->d:Ljava/util/List;

    .line 7
    .line 8
    iget-object v1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v1, Ljava/util/List;

    .line 11
    .line 12
    invoke-virtual {p0, v1}, Ll/t6h;->h(Ljava/util/List;)Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    iget-object v0, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast v0, Lcom/p1/mobile/putong/data/Links;

    .line 22
    .line 23
    iput-object v0, p0, Ll/t6h;->b:Lcom/p1/mobile/putong/data/Links;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/a7;->b()Ll/l6c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object p0, p0, Ll/t6h;->d:Ljava/util/List;

    .line 30
    .line 31
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast p1, Lcom/p1/mobile/putong/data/Links;

    .line 34
    .line 35
    invoke-interface {v0, p0, p1}, Ll/l6c;->z0(Ljava/lang/Object;Lcom/p1/mobile/putong/data/Links;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public next()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/t6h;->i()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_1

    .line 10
    .line 11
    iget-boolean v1, p0, Ll/t6h;->f:Z

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v1, 0x1

    .line 17
    iput-boolean v1, p0, Ll/t6h;->f:Z

    .line 18
    .line 19
    iget-object v1, p0, Ll/t6h;->e:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    sget-object v2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 22
    .line 23
    iget-object v3, p0, Ll/t6h;->c:Ljava/lang/String;

    .line 24
    .line 25
    const/4 v4, 0x0

    .line 26
    invoke-virtual {v2, v3, v4, v0}, Ll/jka;->D7(Ljava/lang/String;ILjava/lang/String;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/q6h;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/q6h;-><init>(Ll/t6h;)V

    .line 37
    .line 38
    .line 39
    new-instance v2, Ll/r6h;

    .line 40
    .line 41
    invoke-direct {v2, p0}, Ll/r6h;-><init>(Ll/t6h;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    :cond_1
    :goto_0
    return-void
.end method

.method public previous()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/t6h;->e:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 4
    .line 5
    iget-object v2, p0, Ll/t6h;->c:Ljava/lang/String;

    .line 6
    .line 7
    const/16 v3, 0x14

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    invoke-virtual {v1, v2, v3, v4}, Ll/jka;->D7(Ljava/lang/String;ILjava/lang/String;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/o6h;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/o6h;-><init>(Ll/t6h;)V

    .line 21
    .line 22
    .line 23
    new-instance v2, Ll/p6h;

    .line 24
    .line 25
    invoke-direct {v2, p0}, Ll/p6h;-><init>(Ll/t6h;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    return-void
.end method
