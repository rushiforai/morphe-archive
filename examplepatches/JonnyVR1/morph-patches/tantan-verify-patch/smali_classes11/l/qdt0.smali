.class public final Ll/qdt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroid/media/MediaPlayer;

.field public final synthetic b:Lcom/google/android/gms/internal/ads/zzcfp;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/ads/zzcfp;Landroid/media/MediaPlayer;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/qdt0;->a:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    iput-object p1, p0, Ll/qdt0;->b:Lcom/google/android/gms/internal/ads/zzcfp;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qdt0;->b:Lcom/google/android/gms/internal/ads/zzcfp;

    .line 2
    .line 3
    iget-object v1, p0, Ll/qdt0;->a:Landroid/media/MediaPlayer;

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/google/android/gms/internal/ads/zzcfp;->J(Lcom/google/android/gms/internal/ads/zzcfp;Landroid/media/MediaPlayer;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/qdt0;->b:Lcom/google/android/gms/internal/ads/zzcfp;

    .line 9
    .line 10
    invoke-static {p0}, Lcom/google/android/gms/internal/ads/zzcfp;->H(Lcom/google/android/gms/internal/ads/zzcfp;)Ll/zdt0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-static {p0}, Lcom/google/android/gms/internal/ads/zzcfp;->H(Lcom/google/android/gms/internal/ads/zzcfp;)Ll/zdt0;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-interface {p0}, Ll/zdt0;->zzf()V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method
