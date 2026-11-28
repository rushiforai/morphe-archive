.class public final Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Running"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\r\u0018\u00002\u00020\u0001BO\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0003\u0012\u000c\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u00020\t0\u0008\u0012\u000e\u0008\u0002\u0010\n\u001a\u0008\u0012\u0004\u0012\u00020\u000b0\u0008\u0012\u000e\u0008\u0002\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\r0\u0008\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u0008\u0010\u0019\u001a\u00020\u0000H\u0016R\u0014\u0010\u0002\u001a\u00020\u0003X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0010\u0010\u0011R\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0012\u0010\u0013R\u0011\u0010\u0006\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0014\u0010\u0011R\u0017\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u00020\t0\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0015\u0010\u0016R\u0017\u0010\n\u001a\u0008\u0012\u0004\u0012\u00020\u000b0\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0017\u0010\u0016R\u0017\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\r0\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0018\u0010\u0016\u00a8\u0006\u001a"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;",
        "Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State;",
        "canceled",
        "",
        "callback",
        "Lnicoid/network238/okhttp3/Dns$Callback;",
        "lockHeld",
        "runningQueries",
        "",
        "Lnicoid/network238/okhttp3/internal/dns/DnsQuery;",
        "pendingRecords",
        "Lnicoid/network238/okhttp3/Dns$Record;",
        "pendingExceptions",
        "Ljava/io/IOException;",
        "<init>",
        "(ZLnicoid/network238/okhttp3/Dns$Callback;ZLjava/util/List;Ljava/util/List;Ljava/util/List;)V",
        "getCanceled",
        "()Z",
        "getCallback",
        "()Lnicoid/network238/okhttp3/Dns$Callback;",
        "getLockHeld",
        "getRunningQueries",
        "()Ljava/util/List;",
        "getPendingRecords",
        "getPendingExceptions",
        "cancel",
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
.field private final callback:Lnicoid/network238/okhttp3/Dns$Callback;

.field private final canceled:Z

.field private final lockHeld:Z

.field private final pendingExceptions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/io/IOException;",
            ">;"
        }
    .end annotation
.end field

.field private final pendingRecords:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Dns$Record;",
            ">;"
        }
    .end annotation
.end field

.field private final runningQueries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/dns/DnsQuery;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(ZLnicoid/network238/okhttp3/Dns$Callback;ZLjava/util/List;Ljava/util/List;Ljava/util/List;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Lnicoid/network238/okhttp3/Dns$Callback;",
            "Z",
            "Ljava/util/List<",
            "+",
            "Lnicoid/network238/okhttp3/internal/dns/DnsQuery;",
            ">;",
            "Ljava/util/List<",
            "+",
            "Lnicoid/network238/okhttp3/Dns$Record;",
            ">;",
            "Ljava/util/List<",
            "+",
            "Ljava/io/IOException;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 340
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 341
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;->canceled:Z

    .line 342
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;->callback:Lnicoid/network238/okhttp3/Dns$Callback;

    .line 343
    iput-boolean p3, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;->lockHeld:Z

    .line 344
    iput-object p4, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;->runningQueries:Ljava/util/List;

    .line 345
    iput-object p5, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;->pendingRecords:Ljava/util/List;

    .line 346
    iput-object p6, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;->pendingExceptions:Ljava/util/List;

    .line 349
    invoke-interface {p5}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_0

    if-nez p3, :cond_0

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Check failed."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_0
    return-void
.end method

.method public synthetic constructor <init>(ZLnicoid/network238/okhttp3/Dns$Callback;ZLjava/util/List;Ljava/util/List;Ljava/util/List;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 16

    and-int/lit8 p8, p7, 0x4

    if-eqz p8, :cond_0

    const/4 p3, 0x0

    :cond_0
    move v3, p3

    and-int/lit8 p3, p7, 0x10

    if-eqz p3, :cond_1

    .line 345
    invoke-static {}, Lnicoid/network238/kotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object p5

    move-object v5, p5

    goto :goto_0

    .line 0
    :cond_1
    move-object v5, p5

    .line 345
    :goto_0
    and-int/lit8 p7, p7, 0x20

    if-eqz p7, :cond_2

    .line 346
    invoke-static {}, Lnicoid/network238/kotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object p6

    move-object v6, p6

    goto :goto_1

    .line 345
    :cond_2
    move-object v6, p6

    .line 340
    :goto_1
    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move-object v4, p4

    invoke-direct/range {v0 .. v6}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;-><init>(ZLnicoid/network238/okhttp3/Dns$Callback;ZLjava/util/List;Ljava/util/List;Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public cancel()Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;
    .registers 8

    .line 353
    new-instance v0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;

    .line 355
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;->callback:Lnicoid/network238/okhttp3/Dns$Callback;

    .line 356
    iget-boolean v3, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;->lockHeld:Z

    .line 357
    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;->runningQueries:Ljava/util/List;

    .line 358
    iget-object v5, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;->pendingRecords:Ljava/util/List;

    .line 359
    iget-object v6, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;->pendingExceptions:Ljava/util/List;

    .line 353
    const/4 v1, 0x1

    invoke-direct/range {v0 .. v6}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;-><init>(ZLnicoid/network238/okhttp3/Dns$Callback;ZLjava/util/List;Ljava/util/List;Ljava/util/List;)V

    return-object v0
.end method

.method public bridge synthetic cancel()Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State;
    .registers 2

    .line 340
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;->cancel()Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;

    move-result-object v0

    return-object v0
.end method

.method public final getCallback()Lnicoid/network238/okhttp3/Dns$Callback;
    .registers 2

    .line 342
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;->callback:Lnicoid/network238/okhttp3/Dns$Callback;

    return-object v0
.end method

.method public getCanceled()Z
    .registers 2

    .line 341
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;->canceled:Z

    return v0
.end method

.method public final getLockHeld()Z
    .registers 2

    .line 343
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;->lockHeld:Z

    return v0
.end method

.method public final getPendingExceptions()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/io/IOException;",
            ">;"
        }
    .end annotation

    .line 346
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;->pendingExceptions:Ljava/util/List;

    return-object v0
.end method

.method public final getPendingRecords()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Dns$Record;",
            ">;"
        }
    .end annotation

    .line 345
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;->pendingRecords:Ljava/util/List;

    return-object v0
.end method

.method public final getRunningQueries()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/dns/DnsQuery;",
            ">;"
        }
    .end annotation

    .line 344
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;->runningQueries:Ljava/util/List;

    return-object v0
.end method
