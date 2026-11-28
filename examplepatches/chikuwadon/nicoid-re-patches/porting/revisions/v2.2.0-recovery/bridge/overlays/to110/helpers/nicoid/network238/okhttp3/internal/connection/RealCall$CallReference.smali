.class public final Lnicoid/network238/okhttp3/internal/connection/RealCall$CallReference;
.super Ljava/lang/ref/WeakReference;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/connection/RealCall;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "CallReference"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ref/WeakReference<",
        "Lnicoid/network238/okhttp3/internal/connection/RealCall;",
        ">;"
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0005\u0008\u0000\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0019\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007R\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\t\u00a8\u0006\n"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/connection/RealCall$CallReference;",
        "Ljava/lang/ref/WeakReference;",
        "Lnicoid/network238/okhttp3/internal/connection/RealCall;",
        "referent",
        "callStackTrace",
        "",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/connection/RealCall;Ljava/lang/Object;)V",
        "getCallStackTrace",
        "()Ljava/lang/Object;",
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
.field private final callStackTrace:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/internal/connection/RealCall;Ljava/lang/Object;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 611
    invoke-direct {p0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 617
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall$CallReference;->callStackTrace:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final getCallStackTrace()Ljava/lang/Object;
    .registers 2

    .line 617
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall$CallReference;->callStackTrace:Ljava/lang/Object;

    return-object v0
.end method
