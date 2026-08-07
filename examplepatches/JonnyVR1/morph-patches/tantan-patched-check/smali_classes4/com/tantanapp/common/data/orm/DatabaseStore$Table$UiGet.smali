.class public Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/common/data/orm/DatabaseStore$Table;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "UiGet"
.end annotation


# instance fields
.field private final bs:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "TT;>;"
        }
    .end annotation
.end field

.field changed:Z

.field public final id:Ljava/lang/String;

.field private status:Ljava/util/concurrent/atomic/AtomicInteger;

.field final synthetic this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;


# direct methods
.method public constructor <init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Ljava/lang/String;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-direct {p1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;->status:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 13
    .line 14
    iput-boolean v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;->changed:Z

    .line 15
    .line 16
    iput-object p2, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;->id:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;->bs:Lrx/subjects/a;

    .line 23
    .line 24
    return-void
.end method

.method public static synthetic a(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;Lcom/tantanapp/common/data/DbObject;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;->status:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 5
    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 10
    .line 11
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1, p1}, Lcom/tantanapp/common/data/orm/LruCache2;->cache(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;->bs:Lrx/subjects/a;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic access$600(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;)Lrx/subjects/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;->bs:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;)Lcom/tantanapp/common/data/DbObject;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method


# virtual methods
.method public triggerIfChanged()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;->changed:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;->bs:Lrx/subjects/a;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 8
    .line 9
    iget-object v2, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->queryCache(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    sget-boolean v0, Lcom/tantanapp/common/data/orm/DatabaseStore;->DETAILED_LOGGING:Z

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    new-instance v0, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    const-string v1, "triggered get "

    .line 25
    .line 26
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->d(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    const/4 v0, 0x0

    .line 42
    iput-boolean v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;->changed:Z

    .line 43
    .line 44
    :cond_1
    return-void
.end method

.method public tryInitiate(Z)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;->status:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/orm/LruCache2;->cached(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/tantanapp/common/data/DbObject;

    .line 20
    .line 21
    const/4 v1, 0x2

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;->status:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 25
    .line 26
    invoke-virtual {p1, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;->bs:Lrx/subjects/a;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    if-eqz p1, :cond_1

    .line 36
    .line 37
    sget-boolean p1, Lcom/tantanapp/common/data/orm/DatabaseStore;->debug_delayTransaction10Seconds:Z

    .line 38
    .line 39
    if-nez p1, :cond_1

    .line 40
    .line 41
    iget-object p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 42
    .line 43
    iget-object v0, p1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 44
    .line 45
    new-instance v2, Ll/t7c;

    .line 46
    .line 47
    invoke-direct {v2, p0}, Ll/t7c;-><init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;)V

    .line 48
    .line 49
    .line 50
    new-instance v3, Ll/u7c;

    .line 51
    .line 52
    invoke-direct {v3, p0}, Ll/u7c;-><init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;)V

    .line 53
    .line 54
    .line 55
    const/4 v4, 0x0

    .line 56
    const/4 v5, 0x1

    .line 57
    const/4 v1, 0x0

    .line 58
    invoke-virtual/range {v0 .. v5}, Lcom/tantanapp/common/data/orm/DatabaseStore;->asyncFetch(ZLl/pcj;Ll/y20;Ll/x20;Z)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_1
    iget-object p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;->status:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 63
    .line 64
    invoke-virtual {p1, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;->bs:Lrx/subjects/a;

    .line 68
    .line 69
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 70
    .line 71
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;->id:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->queryCache(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p1, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    :cond_2
    return-void
.end method
