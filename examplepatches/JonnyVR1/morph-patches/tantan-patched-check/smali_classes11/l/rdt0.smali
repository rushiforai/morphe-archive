.class public final Ll/rdt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/android/gms/internal/ads/zzcfp;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/ads/zzcfp;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rdt0;->a:Lcom/google/android/gms/internal/ads/zzcfp;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/rdt0;->a:Lcom/google/android/gms/internal/ads/zzcfp;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/gms/internal/ads/zzcfp;->H(Lcom/google/android/gms/internal/ads/zzcfp;)Ll/zdt0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {p0}, Lcom/google/android/gms/internal/ads/zzcfp;->H(Lcom/google/android/gms/internal/ads/zzcfp;)Ll/zdt0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Ll/zdt0;->zza()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method
