.class public final Ll/zlv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/n9u0;


# instance fields
.field public final a:Ljava/util/concurrent/atomic/AtomicReference;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/zlv0;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final a(Ll/ycu0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zlv0;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final b(Lcom/google/android/gms/ads/internal/client/zzs;)V
    .locals 1

    .line 1
    new-instance v0, Ll/ylv0;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/ylv0;-><init>(Lcom/google/android/gms/ads/internal/client/zzs;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/zlv0;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/g3w0;->a(Ljava/util/concurrent/atomic/AtomicReference;Ll/f3w0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
