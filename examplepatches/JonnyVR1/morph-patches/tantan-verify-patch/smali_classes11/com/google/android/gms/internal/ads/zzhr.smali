.class public final Lcom/google/android/gms/internal/ads/zzhr;
.super Lcom/google/android/gms/internal/ads/zzhp;
.source "SourceFile"


# instance fields
.field public final zzd:I

.field public final zze:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final zzf:Ljava/util/Map;

.field public final zzg:[B


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/io/IOException;Ljava/util/Map;Ll/akx0;[B)V
    .locals 8
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/io/IOException;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Response code: "

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
    move-result-object v3

    .line 15
    const/16 v6, 0x7d4

    .line 16
    .line 17
    const/4 v7, 0x1

    .line 18
    move-object v2, p0

    .line 19
    move-object v4, p3

    .line 20
    move-object v5, p5

    .line 21
    invoke-direct/range {v2 .. v7}, Lcom/google/android/gms/internal/ads/zzhp;-><init>(Ljava/lang/String;Ljava/io/IOException;Ll/akx0;II)V

    .line 22
    .line 23
    .line 24
    iput p1, v2, Lcom/google/android/gms/internal/ads/zzhr;->zzd:I

    .line 25
    .line 26
    iput-object p2, v2, Lcom/google/android/gms/internal/ads/zzhr;->zze:Ljava/lang/String;

    .line 27
    .line 28
    iput-object p4, v2, Lcom/google/android/gms/internal/ads/zzhr;->zzf:Ljava/util/Map;

    .line 29
    .line 30
    iput-object p6, v2, Lcom/google/android/gms/internal/ads/zzhr;->zzg:[B

    .line 31
    .line 32
    return-void
.end method
