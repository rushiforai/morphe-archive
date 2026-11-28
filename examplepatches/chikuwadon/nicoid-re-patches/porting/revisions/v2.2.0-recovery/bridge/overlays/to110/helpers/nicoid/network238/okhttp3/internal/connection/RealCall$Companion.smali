.class final Lnicoid/network238/okhttp3/internal/connection/RealCall$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/connection/RealCall;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0082\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003R\u001d\u0010\u0004\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00070\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\t\u00a8\u0006\n"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/connection/RealCall$Companion;",
        "",
        "<init>",
        "()V",
        "eventListenerUpdater",
        "Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;",
        "Lnicoid/network238/okhttp3/internal/connection/RealCall;",
        "Lnicoid/network238/okhttp3/EventListener;",
        "getEventListenerUpdater",
        "()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;",
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


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 620
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/connection/RealCall$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final getEventListenerUpdater()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater<",
            "Lnicoid/network238/okhttp3/internal/connection/RealCall;",
            "Lnicoid/network238/okhttp3/EventListener;",
            ">;"
        }
    .end annotation

    .line 621
    # getter for: Lnicoid/network238/okhttp3/internal/connection/RealCall;->eventListenerUpdater:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;
    invoke-static {}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->access$getEventListenerUpdater$cp()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    move-result-object v0

    return-object v0
.end method
