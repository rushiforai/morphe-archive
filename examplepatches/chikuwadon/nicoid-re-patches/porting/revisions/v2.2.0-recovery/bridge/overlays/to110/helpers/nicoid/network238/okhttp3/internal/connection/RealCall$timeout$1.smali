.class public final Lnicoid/network238/okhttp3/internal/connection/RealCall$timeout$1;
.super Lnicoid/network238/okio/AsyncTimeout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okhttp3/internal/connection/RealCall;-><init>(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/Request;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0008\u0010\u0002\u001a\u00020\u0003H\u0014\u00a8\u0006\u0004"
    }
    d2 = {
        "nicoid/network238/okhttp3/internal/connection/RealCall$timeout$1",
        "Lnicoid/network238/okio/AsyncTimeout;",
        "timedOut",
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
.field final synthetic this$0:Lnicoid/network238/okhttp3/internal/connection/RealCall;


# direct methods
.method constructor <init>(Lnicoid/network238/okhttp3/internal/connection/RealCall;)V
    .registers 2

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall$timeout$1;->this$0:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    .line 80
    invoke-direct {p0}, Lnicoid/network238/okio/AsyncTimeout;-><init>()V

    return-void
.end method


# virtual methods
.method protected timedOut()V
    .registers 2

    .line 82
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall$timeout$1;->this$0:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->cancel()V

    return-void
.end method
