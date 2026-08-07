.class public final Ll/hsu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rqs0;


# instance fields
.field public final a:Ll/d8u0;

.field public final b:Lcom/google/android/gms/internal/ads/zzcag;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/d8u0;Ll/q6w0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/hsu0;->a:Ll/d8u0;

    .line 5
    .line 6
    iget-object p1, p2, Ll/q6w0;->m:Lcom/google/android/gms/internal/ads/zzcag;

    .line 7
    .line 8
    iput-object p1, p0, Ll/hsu0;->b:Lcom/google/android/gms/internal/ads/zzcag;

    .line 9
    .line 10
    iget-object p1, p2, Ll/q6w0;->k:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p1, p0, Ll/hsu0;->c:Ljava/lang/String;

    .line 13
    .line 14
    iget-object p1, p2, Ll/q6w0;->l:Ljava/lang/String;

    .line 15
    .line 16
    iput-object p1, p0, Ll/hsu0;->d:Ljava/lang/String;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final f0(Lcom/google/android/gms/internal/ads/zzcag;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hsu0;->b:Lcom/google/android/gms/internal/ads/zzcag;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object p1, v0

    .line 6
    :cond_0
    if-eqz p1, :cond_1

    .line 7
    .line 8
    iget-object v0, p1, Lcom/google/android/gms/internal/ads/zzcag;->zza:Ljava/lang/String;

    .line 9
    .line 10
    iget p1, p1, Lcom/google/android/gms/internal/ads/zzcag;->zzb:I

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_1
    const/4 p1, 0x1

    .line 14
    const-string v0, ""

    .line 15
    .line 16
    :goto_0
    new-instance v1, Ll/c5t0;

    .line 17
    .line 18
    invoke-direct {v1, v0, p1}, Ll/c5t0;-><init>(Ljava/lang/String;I)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/hsu0;->a:Ll/d8u0;

    .line 22
    .line 23
    iget-object v0, p0, Ll/hsu0;->c:Ljava/lang/String;

    .line 24
    .line 25
    iget-object p0, p0, Ll/hsu0;->d:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p1, v1, v0, p0}, Ll/d8u0;->w0(Ll/f5t0;Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final zzb()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hsu0;->a:Ll/d8u0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/d8u0;->zze()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final zzc()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hsu0;->a:Ll/d8u0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/d8u0;->zzf()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
