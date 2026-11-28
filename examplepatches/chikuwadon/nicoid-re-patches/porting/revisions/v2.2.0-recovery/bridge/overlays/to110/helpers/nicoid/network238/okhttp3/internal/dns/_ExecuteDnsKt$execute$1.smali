.class public final Lnicoid/network238/okhttp3/internal/dns/_ExecuteDnsKt$execute$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/Dns$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okhttp3/internal/dns/_ExecuteDnsKt;->execute(Lnicoid/network238/okhttp3/Dns$Call;)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00009\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010 \n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J&\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u000c\u0010\r\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u000eH\u0016J\u0018\u0010\u000f\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u0010\u001a\u00020\u0011H\u0016J\u0014\u0010\u0012\u001a\u00020\u00082\n\u0008\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u0011H\u0002R\u0017\u0010\u0002\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\u0013"
    }
    d2 = {
        "nicoid/network238/okhttp3/internal/dns/_ExecuteDnsKt$execute$1",
        "Lnicoid/network238/okhttp3/Dns$Callback;",
        "allRecords",
        "",
        "Lnicoid/network238/okhttp3/Dns$Record;",
        "getAllRecords",
        "()Ljava/util/List;",
        "onRecords",
        "",
        "call",
        "Lnicoid/network238/okhttp3/Dns$Call;",
        "last",
        "",
        "records",
        "",
        "onFailure",
        "e",
        "Ljava/io/IOException;",
        "complete",
        "okhttp"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $queue:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Lnicoid/network238/kotlin/Result;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $this_execute:Lnicoid/network238/okhttp3/Dns$Call;

.field private final allRecords:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Dns$Record;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lnicoid/network238/okhttp3/Dns$Call;Ljava/util/concurrent/LinkedBlockingQueue;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okhttp3/Dns$Call;",
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Lnicoid/network238/kotlin/Result;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/_ExecuteDnsKt$execute$1;->$this_execute:Lnicoid/network238/okhttp3/Dns$Call;

    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/dns/_ExecuteDnsKt$execute$1;->$queue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/_ExecuteDnsKt$execute$1;->allRecords:Ljava/util/List;

    return-void
.end method

.method private final complete(Ljava/io/IOException;)V
    .registers 4

    .line 65
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/_ExecuteDnsKt$execute$1;->allRecords:Ljava/util/List;

    .line 83
    instance-of v1, v0, Ljava/util/Collection;

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 84
    :cond_0
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnicoid/network238/okhttp3/Dns$Record;

    .line 65
    instance-of v1, v1, Lnicoid/network238/okhttp3/Dns$Record$IpAddress;

    if-eqz v1, :cond_1

    .line 66
    sget-object p1, Lnicoid/network238/kotlin/Result;->Companion:Lnicoid/network238/kotlin/Result$Companion;

    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/_ExecuteDnsKt$execute$1;->allRecords:Ljava/util/List;

    invoke-static {p1}, Lnicoid/network238/kotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    goto :goto_1

    .line 70
    :cond_2
    :goto_0
    sget-object v0, Lnicoid/network238/kotlin/Result;->Companion:Lnicoid/network238/kotlin/Result$Companion;

    if-nez p1, :cond_3

    .line 71
    new-instance p1, Ljava/net/UnknownHostException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "DNS returned no addresses for "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/_ExecuteDnsKt$execute$1;->$this_execute:Lnicoid/network238/okhttp3/Dns$Call;

    invoke-interface {v1}, Lnicoid/network238/okhttp3/Dns$Call;->getRequest()Lnicoid/network238/okhttp3/Dns$Request;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Dns$Request;->hostname()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/net/UnknownHostException;-><init>(Ljava/lang/String;)V

    .line 70
    :cond_3
    invoke-static {p1}, Lnicoid/network238/kotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Lnicoid/network238/kotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 75
    :goto_1
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/_ExecuteDnsKt$execute$1;->$queue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-static {p1}, Lnicoid/network238/kotlin/Result;->box-impl(Ljava/lang/Object;)Lnicoid/network238/kotlin/Result;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/concurrent/LinkedBlockingQueue;->put(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic complete$default(Lnicoid/network238/okhttp3/internal/dns/_ExecuteDnsKt$execute$1;Ljava/io/IOException;ILjava/lang/Object;)V
    .registers 4

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    const/4 p1, 0x0

    .line 62
    :cond_0
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/dns/_ExecuteDnsKt$execute$1;->complete(Ljava/io/IOException;)V

    return-void
.end method


# virtual methods
.method public final getAllRecords()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Dns$Record;",
            ">;"
        }
    .end annotation

    .line 42
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/_ExecuteDnsKt$execute$1;->allRecords:Ljava/util/List;

    return-object v0
.end method

.method public onFailure(Lnicoid/network238/okhttp3/Dns$Call;Ljava/io/IOException;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 59
    invoke-direct {p0, p2}, Lnicoid/network238/okhttp3/internal/dns/_ExecuteDnsKt$execute$1;->complete(Ljava/io/IOException;)V

    return-void
.end method

.method public onRecords(Lnicoid/network238/okhttp3/Dns$Call;ZLjava/util/List;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okhttp3/Dns$Call;",
            "Z",
            "Ljava/util/List<",
            "+",
            "Lnicoid/network238/okhttp3/Dns$Record;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 49
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/_ExecuteDnsKt$execute$1;->allRecords:Ljava/util/List;

    invoke-static {p1, p3}, Lnicoid/network238/kotlin/collections/CollectionsKt;->addAll(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    if-eqz p2, :cond_0

    .line 51
    const/4 p1, 0x0

    const/4 p2, 0x1

    invoke-static {p0, p1, p2, p1}, Lnicoid/network238/okhttp3/internal/dns/_ExecuteDnsKt$execute$1;->complete$default(Lnicoid/network238/okhttp3/internal/dns/_ExecuteDnsKt$execute$1;Ljava/io/IOException;ILjava/lang/Object;)V

    :cond_0
    return-void
.end method
