.class public abstract Lcom/google/android/gms/internal/ads/p3;
.super Lcom/google/android/gms/internal/ads/k3;
.source "SourceFile"


# static fields
.field public static final j:Ll/suw0;

.field public static final k:Ll/wvw0;


# instance fields
.field public volatile h:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field public volatile i:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    new-instance v0, Ll/wvw0;

    .line 2
    .line 3
    const-class v1, Lcom/google/android/gms/internal/ads/p3;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/wvw0;-><init>(Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/google/android/gms/internal/ads/p3;->k:Ll/wvw0;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    :try_start_0
    new-instance v0, Ll/tuw0;

    .line 12
    .line 13
    const-class v3, Ljava/util/Set;

    .line 14
    .line 15
    const-string v4, "h"

    .line 16
    .line 17
    invoke-static {v1, v3, v4}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    const-string v4, "i"

    .line 22
    .line 23
    invoke-static {v1, v4}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-direct {v0, v3, v1}, Ll/tuw0;-><init>(Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    .line 29
    .line 30
    move-object v6, v2

    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception v0

    .line 33
    new-instance v1, Ll/vuw0;

    .line 34
    .line 35
    invoke-direct {v1, v2}, Ll/vuw0;-><init>(Ll/uuw0;)V

    .line 36
    .line 37
    .line 38
    move-object v6, v0

    .line 39
    move-object v0, v1

    .line 40
    :goto_0
    sput-object v0, Lcom/google/android/gms/internal/ads/p3;->j:Ll/suw0;

    .line 41
    .line 42
    if-eqz v6, :cond_0

    .line 43
    .line 44
    sget-object v0, Lcom/google/android/gms/internal/ads/p3;->k:Ll/wvw0;

    .line 45
    .line 46
    invoke-virtual {v0}, Ll/wvw0;->a()Ljava/util/logging/Logger;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    sget-object v2, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    .line 51
    .line 52
    const-string v4, "<clinit>"

    .line 53
    .line 54
    const-string v5, "SafeAtomicHelper is broken!"

    .line 55
    .line 56
    const-string v3, "com.google.common.util.concurrent.AggregateFutureState"

    .line 57
    .line 58
    invoke-virtual/range {v1 .. v6}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 59
    .line 60
    .line 61
    :cond_0
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/ads/k3;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/ads/p3;->h:Ljava/util/Set;

    iput p1, p0, Lcom/google/android/gms/internal/ads/p3;->i:I

    return-void
.end method

.method public static bridge synthetic D(Lcom/google/android/gms/internal/ads/p3;)Ljava/util/Set;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/p3;->h:Ljava/util/Set;

    return-object p0
.end method

.method public static bridge synthetic F(Lcom/google/android/gms/internal/ads/p3;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/gms/internal/ads/p3;->i:I

    return-void
.end method

.method public static bridge synthetic G(Lcom/google/android/gms/internal/ads/p3;Ljava/util/Set;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/internal/ads/p3;->h:Ljava/util/Set;

    return-void
.end method

.method public static bridge synthetic J(Lcom/google/android/gms/internal/ads/p3;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/gms/internal/ads/p3;->i:I

    return p0
.end method


# virtual methods
.method public final C()I
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/ads/p3;->j:Ll/suw0;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ll/suw0;->a(Lcom/google/android/gms/internal/ads/p3;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final E()Ljava/util/Set;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/ads/p3;->h:Ljava/util/Set;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/ads/p3;->I(Ljava/util/Set;)V

    .line 15
    .line 16
    .line 17
    sget-object v1, Lcom/google/android/gms/internal/ads/p3;->j:Ll/suw0;

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-virtual {v1, p0, v2, v0}, Ll/suw0;->b(Lcom/google/android/gms/internal/ads/p3;Ljava/util/Set;Ljava/util/Set;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/p3;->h:Ljava/util/Set;

    .line 24
    .line 25
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    check-cast p0, Ljava/util/Set;

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_0
    return-object v0
.end method

.method public final H()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/ads/p3;->h:Ljava/util/Set;

    return-void
.end method

.method public abstract I(Ljava/util/Set;)V
.end method
