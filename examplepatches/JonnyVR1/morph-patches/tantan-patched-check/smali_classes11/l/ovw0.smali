.class public final Ll/ovw0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Lcom/google/android/gms/internal/ads/zzgaa;


# direct methods
.method public synthetic constructor <init>(ZLcom/google/android/gms/internal/ads/zzgaa;Ll/nvw0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Ll/ovw0;->a:Z

    .line 5
    .line 6
    iput-object p2, p0, Ll/ovw0;->b:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;)Ll/hpr;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/ads/q3;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ovw0;->b:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 4
    .line 5
    iget-boolean p0, p0, Ll/ovw0;->a:Z

    .line 6
    .line 7
    invoke-direct {v0, v1, p0, p2, p1}, Lcom/google/android/gms/internal/ads/q3;-><init>(Lcom/google/android/gms/internal/ads/zzfzv;ZLjava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method
