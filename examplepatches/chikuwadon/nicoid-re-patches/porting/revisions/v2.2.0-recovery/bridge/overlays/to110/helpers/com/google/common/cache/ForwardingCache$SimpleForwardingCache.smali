.class public abstract Lcom/google/common/cache/ForwardingCache$SimpleForwardingCache;
.super Lcom/google/common/cache/ForwardingCache;
.source "ForwardingCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/cache/ForwardingCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "SimpleForwardingCache"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/cache/ForwardingCache<",
        "TK;TV;>;"
    }
.end annotation


# instance fields
.field private final delegate:Lcom/google/common/cache/Cache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/cache/Cache<",
            "TK;TV;>;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Lcom/google/common/cache/Cache;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "delegate"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/Cache<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 139
    invoke-direct {p0}, Lcom/google/common/cache/ForwardingCache;-><init>()V

    .line 140
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/common/cache/Cache;

    iput-object p1, p0, Lcom/google/common/cache/ForwardingCache$SimpleForwardingCache;->delegate:Lcom/google/common/cache/Cache;

    return-void
.end method


# virtual methods
.method protected final delegate()Lcom/google/common/cache/Cache;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/cache/Cache<",
            "TK;TV;>;"
        }
    .end annotation

    .line 145
    iget-object p0, p0, Lcom/google/common/cache/ForwardingCache$SimpleForwardingCache;->delegate:Lcom/google/common/cache/Cache;

    return-object p0
.end method

.method protected bridge synthetic delegate()Ljava/lang/Object;
    .registers 1

    .line 135
    invoke-virtual {p0}, Lcom/google/common/cache/ForwardingCache$SimpleForwardingCache;->delegate()Lcom/google/common/cache/Cache;

    move-result-object p0

    return-object p0
.end method
