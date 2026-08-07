.class public Ll/s2i;
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

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/BubbleInfo;",
            ">;"
        }
    .end annotation
.end field

.field public c:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/BubbleInfo;",
            ">;>;"
        }
    .end annotation
.end field

.field public d:Ljava/lang/String;

.field public e:Z


# direct methods
.method public constructor <init>(Lrx/subjects/a;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/subjects/a<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/BubbleInfo;",
            ">;>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

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
    iput-object v0, p0, Ll/s2i;->b:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Ll/s2i;->e:Z

    .line 13
    .line 14
    iput-object p1, p0, Ll/s2i;->c:Lrx/subjects/a;

    .line 15
    .line 16
    iput-object p2, p0, Ll/s2i;->d:Ljava/lang/String;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic b(Ll/s2i;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s2i;->f(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic c(Ll/s2i;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s2i;->e(Lcom/p1/mobile/putong/data/Envelope;)V

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
    iput-object p1, p0, Ll/s2i;->a:Ll/p2i$a;

    .line 2
    .line 3
    return-void
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s2i;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic e(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/s2i;->b:Ljava/util/List;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Envelope;->data:Lcom/p1/mobile/putong/data/Data;

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
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 23
    .line 24
    iput-object p1, p0, Ll/s2i;->d:Ljava/lang/String;

    .line 25
    .line 26
    iget-object p1, p0, Ll/s2i;->a:Ll/p2i$a;

    .line 27
    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    iget-object v0, p0, Ll/s2i;->b:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {p1, v0}, Ll/p2i$a;->a3(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    const/4 p1, 0x0

    .line 36
    iput-boolean p1, p0, Ll/s2i;->e:Z

    .line 37
    .line 38
    return-void
.end method

.method public final synthetic f(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/s2i;->e:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/s2i;->a:Ll/p2i$a;

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
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/s2i;->d()Ljava/lang/String;

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
    iget-boolean v0, p0, Ll/s2i;->e:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x1

    .line 17
    iput-boolean v0, p0, Ll/s2i;->e:Z

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/s2i;->d()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Ll/jka;->A7(Ljava/lang/String;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/q2i;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/q2i;-><init>(Ll/s2i;)V

    .line 32
    .line 33
    .line 34
    new-instance v2, Ll/r2i;

    .line 35
    .line 36
    invoke-direct {v2, p0}, Ll/r2i;-><init>(Ll/s2i;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    :cond_1
    :goto_0
    return-void
.end method

.method public previous()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s2i;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/s2i;->b:Ljava/util/List;

    .line 7
    .line 8
    iget-object v1, p0, Ll/s2i;->c:Lrx/subjects/a;

    .line 9
    .line 10
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Ljava/util/Collection;

    .line 15
    .line 16
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/s2i;->a:Ll/p2i$a;

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Ll/s2i;->b:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v0, p0}, Ll/p2i$a;->a3(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method
