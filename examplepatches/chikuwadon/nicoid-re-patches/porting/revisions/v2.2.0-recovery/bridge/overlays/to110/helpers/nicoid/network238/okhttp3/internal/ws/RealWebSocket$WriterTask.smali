.class final Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$WriterTask;
.super Lnicoid/network238/okhttp3/internal/concurrent/Task;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "WriterTask"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0000\u0008\u0082\u0004\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0008\u0010\u0004\u001a\u00020\u0005H\u0016\u00a8\u0006\u0006"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$WriterTask;",
        "Lnicoid/network238/okhttp3/internal/concurrent/Task;",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;)V",
        "runOnce",
        "",
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
.field final synthetic this$0:Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 666
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$WriterTask;->this$0:Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    # getter for: Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->name:Ljava/lang/String;
    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->access$getName$p(Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " writer"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, p1, v2, v0, v1}, Lnicoid/network238/okhttp3/internal/concurrent/Task;-><init>(Ljava/lang/String;ZILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method


# virtual methods
.method public runOnce()J
    .registers 8

    .line 669
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$WriterTask;->this$0:Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->writeOneFrame$okhttp()Z

    move-result v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v0, :cond_0

    const-wide/16 v0, 0x0

    return-wide v0

    :catch_0
    move-exception v0

    move-object v2, v0

    .line 671
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$WriterTask;->this$0:Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-static/range {v1 .. v6}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->failWebSocket$default(Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;Ljava/lang/Exception;Lnicoid/network238/okhttp3/Response;ZILjava/lang/Object;)V

    :cond_0
    const-wide/16 v0, -0x1

    return-wide v0
.end method
