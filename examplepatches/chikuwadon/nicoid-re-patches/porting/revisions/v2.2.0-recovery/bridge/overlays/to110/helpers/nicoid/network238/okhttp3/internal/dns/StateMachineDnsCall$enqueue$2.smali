.class public final Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$enqueue$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->enqueue(Lnicoid/network238/okhttp3/Dns$Callback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u001f\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0016J\u0010\u0010\u0006\u001a\u00020\u00032\u0006\u0010\u0007\u001a\u00020\u0008H\u0016\u00a8\u0006\t"
    }
    d2 = {
        "nicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$enqueue$2",
        "Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;",
        "onResponse",
        "",
        "dnsResponse",
        "Lnicoid/network238/okhttp3/internal/dns/DnsMessage;",
        "onFailure",
        "e",
        "Ljava/io/IOException;",
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
.field final synthetic $query:Lnicoid/network238/okhttp3/internal/dns/DnsQuery;

.field final synthetic $question:Lnicoid/network238/okhttp3/internal/dns/Question;

.field final synthetic this$0:Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;


# direct methods
.method constructor <init>(Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;Lnicoid/network238/okhttp3/internal/dns/Question;Lnicoid/network238/okhttp3/internal/dns/DnsQuery;)V
    .registers 4

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$enqueue$2;->this$0:Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;

    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$enqueue$2;->$question:Lnicoid/network238/okhttp3/internal/dns/Question;

    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$enqueue$2;->$query:Lnicoid/network238/okhttp3/internal/dns/DnsQuery;

    .line 125
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Ljava/io/IOException;)V
    .registers 9

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 135
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$enqueue$2;->this$0:Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;

    .line 136
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$enqueue$2;->$query:Lnicoid/network238/okhttp3/internal/dns/DnsQuery;

    .line 135
    const/4 v2, 0x0

    const/4 v4, 0x0

    const/16 v5, 0xa

    const/4 v6, 0x0

    move-object v3, p1

    invoke-static/range {v0 .. v6}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->updateStateAndCallCallbacks$default(Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;Lnicoid/network238/okhttp3/internal/dns/DnsQuery;Ljava/util/List;Ljava/io/IOException;ZILjava/lang/Object;)V

    return-void
.end method

.method public onResponse(Lnicoid/network238/okhttp3/internal/dns/DnsMessage;)V
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 127
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$enqueue$2;->this$0:Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;

    .line 128
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$enqueue$2;->$question:Lnicoid/network238/okhttp3/internal/dns/Question;

    .line 129
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$enqueue$2;->$query:Lnicoid/network238/okhttp3/internal/dns/DnsQuery;

    .line 127
    # invokes: Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->updateStateAndCallCallbacks(Lnicoid/network238/okhttp3/internal/dns/Question;Lnicoid/network238/okhttp3/internal/dns/DnsQuery;Lnicoid/network238/okhttp3/internal/dns/DnsMessage;)V
    invoke-static {v0, v1, v2, p1}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->access$updateStateAndCallCallbacks(Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;Lnicoid/network238/okhttp3/internal/dns/Question;Lnicoid/network238/okhttp3/internal/dns/DnsQuery;Lnicoid/network238/okhttp3/internal/dns/DnsMessage;)V

    return-void
.end method
