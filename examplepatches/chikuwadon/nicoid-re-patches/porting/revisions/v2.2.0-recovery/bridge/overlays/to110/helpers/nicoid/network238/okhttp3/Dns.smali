.class public interface abstract Lnicoid/network238/okhttp3/Dns;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/Dns$Call;,
        Lnicoid/network238/okhttp3/Dns$Callback;,
        Lnicoid/network238/okhttp3/Dns$Companion;,
        Lnicoid/network238/okhttp3/Dns$Record;,
        Lnicoid/network238/okhttp3/Dns$Request;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008\u00e6\u0080\u0001\u0018\u0000 \u000f2\u00020\u0001:\u0005\u000b\u000c\r\u000e\u000fJ\u0016\u0010\u0002\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u00032\u0006\u0010\u0005\u001a\u00020\u0006H&J\u0010\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\nH\u0016\u00f8\u0001\u0000\u0082\u0002\u0006\n\u0004\u0008!0\u0001\u00a8\u0006\u0010\u00c0\u0006\u0001"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/Dns;",
        "",
        "lookup",
        "",
        "Ljava/net/InetAddress;",
        "hostname",
        "",
        "newCall",
        "Lnicoid/network238/okhttp3/Dns$Call;",
        "request",
        "Lnicoid/network238/okhttp3/Dns$Request;",
        "Call",
        "Callback",
        "Request",
        "Record",
        "Companion",
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


# static fields
.field public static final Companion:Lnicoid/network238/okhttp3/Dns$Companion;

.field public static final SYSTEM:Lnicoid/network238/okhttp3/Dns;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lnicoid/network238/okhttp3/Dns$Companion;->$$INSTANCE:Lnicoid/network238/okhttp3/Dns$Companion;

    sput-object v0, Lnicoid/network238/okhttp3/Dns;->Companion:Lnicoid/network238/okhttp3/Dns$Companion;

    .line 292
    new-instance v0, Lnicoid/network238/okhttp3/Dns$Companion$SYSTEM$1;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/Dns$Companion$SYSTEM$1;-><init>()V

    sput-object v0, Lnicoid/network238/okhttp3/Dns;->SYSTEM:Lnicoid/network238/okhttp3/Dns;

    return-void
.end method


# virtual methods
.method public abstract lookup(Ljava/lang/String;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/net/InetAddress;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation
.end method

.method public newCall(Lnicoid/network238/okhttp3/Dns$Request;)Lnicoid/network238/okhttp3/Dns$Call;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 54
    new-instance v0, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall;

    sget-object v1, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->INSTANCE:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    invoke-direct {v0, v1, p0, p1}, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall;-><init>(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/okhttp3/Dns;Lnicoid/network238/okhttp3/Dns$Request;)V

    return-object v0
.end method
