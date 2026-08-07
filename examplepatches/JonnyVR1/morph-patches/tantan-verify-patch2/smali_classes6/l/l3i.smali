.class public Ll/l3i;
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
    iput-object v0, p0, Ll/l3i;->d:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Ll/l3i;->b:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p2, p0, Ll/l3i;->c:Ljava/lang/String;

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic b(Ll/l3i;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/l3i;->d(Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic c(Ll/l3i;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/l3i;->e(Ljava/lang/Throwable;)V

    return-void
.end method

.method private synthetic d(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l3i;->d:Ljava/util/List;

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
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/l3i;->a:Ll/p2i$a;

    .line 19
    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Ll/l3i;->d:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {p1, p0}, Ll/p2i$a;->a3(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method private synthetic e(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l3i;->a:Ll/p2i$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/p2i$a;->S0(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    :cond_0
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
    iput-object p1, p0, Ll/l3i;->a:Ll/p2i$a;

    .line 2
    .line 3
    return-void
.end method

.method public next()V
    .locals 0

    .line 1
    return-void
.end method

.method public previous()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object v1, p0, Ll/l3i;->b:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Ll/l3i;->c:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/jka;->Z7(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/j3i;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/j3i;-><init>(Ll/l3i;)V

    .line 14
    .line 15
    .line 16
    new-instance v2, Ll/k3i;

    .line 17
    .line 18
    invoke-direct {v2, p0}, Ll/k3i;-><init>(Ll/l3i;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method
