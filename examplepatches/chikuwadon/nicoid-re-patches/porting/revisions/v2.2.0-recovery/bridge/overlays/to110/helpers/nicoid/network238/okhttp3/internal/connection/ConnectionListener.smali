.class public abstract Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/connection/ConnectionListener$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008 \u0018\u0000 \u00152\u00020\u0001:\u0001\u0015B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0018\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\tH\u0016J$\u0010\n\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\t2\n\u0010\u000b\u001a\u00060\u000cj\u0002`\rH\u0016J \u0010\u000e\u001a\u00020\u00052\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\tH\u0016J\u0010\u0010\u0011\u001a\u00020\u00052\u0006\u0010\u000f\u001a\u00020\u0010H\u0016J\u0018\u0010\u0012\u001a\u00020\u00052\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0008\u001a\u00020\tH\u0016J\u0018\u0010\u0013\u001a\u00020\u00052\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0008\u001a\u00020\tH\u0016J\u0010\u0010\u0014\u001a\u00020\u00052\u0006\u0010\u000f\u001a\u00020\u0010H\u0016\u00a8\u0006\u0016"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;",
        "",
        "<init>",
        "()V",
        "connectStart",
        "",
        "route",
        "Lnicoid/network238/okhttp3/Route;",
        "call",
        "Lnicoid/network238/okhttp3/Call;",
        "connectFailed",
        "failure",
        "Ljava/io/IOException;",
        "Lnicoid/network238/okio/IOException;",
        "connectEnd",
        "connection",
        "Lnicoid/network238/okhttp3/Connection;",
        "connectionClosed",
        "connectionAcquired",
        "connectionReleased",
        "noNewExchanges",
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
.field public static final Companion:Lnicoid/network238/okhttp3/internal/connection/ConnectionListener$Companion;

.field private static final NONE:Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okhttp3/internal/connection/ConnectionListener$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/connection/ConnectionListener$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;->Companion:Lnicoid/network238/okhttp3/internal/connection/ConnectionListener$Companion;

    .line 84
    new-instance v0, Lnicoid/network238/okhttp3/internal/connection/ConnectionListener$Companion$NONE$1;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/internal/connection/ConnectionListener$Companion$NONE$1;-><init>()V

    sput-object v0, Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;->NONE:Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final synthetic access$getNONE$cp()Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;
    .registers 1

    .line 30
    sget-object v0, Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;->NONE:Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;

    return-object v0
.end method


# virtual methods
.method public connectEnd(Lnicoid/network238/okhttp3/Connection;Lnicoid/network238/okhttp3/Route;Lnicoid/network238/okhttp3/Call;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public connectFailed(Lnicoid/network238/okhttp3/Route;Lnicoid/network238/okhttp3/Call;Ljava/io/IOException;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public connectStart(Lnicoid/network238/okhttp3/Route;Lnicoid/network238/okhttp3/Call;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public connectionAcquired(Lnicoid/network238/okhttp3/Connection;Lnicoid/network238/okhttp3/Call;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public connectionClosed(Lnicoid/network238/okhttp3/Connection;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public connectionReleased(Lnicoid/network238/okhttp3/Connection;Lnicoid/network238/okhttp3/Call;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public noNewExchanges(Lnicoid/network238/okhttp3/Connection;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method
