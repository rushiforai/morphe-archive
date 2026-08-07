.class public final Lcom/google/android/gms/internal/ads/zzqa;
.super Ljava/lang/Exception;
.source "SourceFile"


# instance fields
.field public final zza:I

.field public final zzb:Z

.field public final zzc:Ll/sqr0;


# direct methods
.method public constructor <init>(ILl/sqr0;Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "AudioTrack write failed: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-direct {p0, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iput-boolean p3, p0, Lcom/google/android/gms/internal/ads/zzqa;->zzb:Z

    .line 19
    .line 20
    iput p1, p0, Lcom/google/android/gms/internal/ads/zzqa;->zza:I

    .line 21
    .line 22
    iput-object p2, p0, Lcom/google/android/gms/internal/ads/zzqa;->zzc:Ll/sqr0;

    .line 23
    .line 24
    return-void
.end method
