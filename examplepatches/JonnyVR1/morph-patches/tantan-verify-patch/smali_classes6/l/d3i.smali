.class public Ll/d3i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/p2i;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/p2i<",
        "Ljava/util/List<",
        "Lcom/p1/mobile/putong/data/BubbleInfo;",
        ">;>;"
    }
.end annotation


# instance fields
.field public a:Ll/p2i$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/p2i$a<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/BubbleInfo;",
            ">;>;"
        }
    .end annotation
.end field

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/BubbleInfo;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ljava/lang/String;

.field public f:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

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
    iput-object v0, p0, Ll/d3i;->d:Ljava/util/List;

    .line 10
    .line 11
    const-string v0, ""

    .line 12
    .line 13
    iput-object v0, p0, Ll/d3i;->e:Ljava/lang/String;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Ll/d3i;->f:Z

    .line 17
    .line 18
    iput-object p1, p0, Ll/d3i;->b:Ljava/lang/String;

    .line 19
    .line 20
    iput-object p2, p0, Ll/d3i;->c:Ljava/lang/String;

    .line 21
    .line 22
    return-void
.end method

.method public static synthetic b(Ll/d3i;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d3i;->k(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic c(Ll/d3i;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/d3i;->j(Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic d(Ll/d3i;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/d3i;->l(Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic e(Ll/d3i;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/d3i;->m(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic f(Ll/d3i;Ljava/lang/String;Lcom/p1/mobile/putong/data/BubbleInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/d3i;->i(Ljava/lang/String;Lcom/p1/mobile/putong/data/BubbleInfo;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method private synthetic l(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d3i;->d:Ljava/util/List;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Envelope;->data:Lcom/p1/mobile/putong/data/Data;

    .line 4
    .line 5
    const-class v1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 6
    .line 7
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/data/Data;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->states:Ljava/util/List;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-interface {v0, v1, p1}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    const-string p1, ""

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/d3i;->h(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private synthetic m(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p1, ""

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/d3i;->h(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/p2i$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/p2i$a<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/BubbleInfo;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/d3i;->a:Ll/p2i$a;

    .line 2
    .line 3
    return-void
.end method

.method public g()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d3i;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h(Ljava/lang/String;)V
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
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 12
    .line 13
    invoke-virtual {v1, p1}, Ll/jka;->A7(Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    new-instance v1, Ll/a3i;

    .line 18
    .line 19
    invoke-direct {v1, p0, v0}, Ll/a3i;-><init>(Ll/d3i;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    new-instance v0, Ll/b3i;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Ll/b3i;-><init>(Ll/d3i;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final synthetic i(Ljava/lang/String;Lcom/p1/mobile/putong/data/BubbleInfo;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/d3i;->b:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object v0, p2, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_1

    .line 12
    .line 13
    :cond_0
    iget-object p0, p2, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public final synthetic j(Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/d3i;->d:Ljava/util/List;

    .line 2
    .line 3
    iget-object v1, p2, Lcom/p1/mobile/putong/data/Envelope;->data:Lcom/p1/mobile/putong/data/Data;

    .line 4
    .line 5
    const-class v2, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/data/Data;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->states:Ljava/util/List;

    .line 14
    .line 15
    new-instance v2, Ll/c3i;

    .line 16
    .line 17
    invoke-direct {v2, p0, p1}, Ll/c3i;-><init>(Ll/d3i;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v1, v2}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 25
    .line 26
    .line 27
    iget-object p1, p2, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 32
    .line 33
    iput-object p1, p0, Ll/d3i;->e:Ljava/lang/String;

    .line 34
    .line 35
    iget-object p1, p0, Ll/d3i;->a:Ll/p2i$a;

    .line 36
    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    iget-object p2, p0, Ll/d3i;->d:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {p1, p2}, Ll/p2i$a;->a3(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    const/4 p1, 0x0

    .line 45
    iput-boolean p1, p0, Ll/d3i;->f:Z

    .line 46
    .line 47
    return-void
.end method

.method public final synthetic k(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/d3i;->f:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/d3i;->a:Ll/p2i$a;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ll/p2i$a;->S0(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public next()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/d3i;->g()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-boolean v0, p0, Ll/d3i;->f:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p0}, Ll/d3i;->g()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Ll/d3i;->h(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    iput-boolean v0, p0, Ll/d3i;->f:Z

    .line 25
    .line 26
    :cond_1
    :goto_0
    return-void
.end method

.method public previous()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/d3i;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/d3i;->b:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 15
    .line 16
    iget-object v1, p0, Ll/d3i;->b:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v2, p0, Ll/d3i;->c:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Ll/jka;->Z7(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/y2i;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/y2i;-><init>(Ll/d3i;)V

    .line 27
    .line 28
    .line 29
    new-instance v2, Ll/z2i;

    .line 30
    .line 31
    invoke-direct {v2, p0}, Ll/z2i;-><init>(Ll/d3i;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    const-string v0, ""

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Ll/d3i;->h(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method
