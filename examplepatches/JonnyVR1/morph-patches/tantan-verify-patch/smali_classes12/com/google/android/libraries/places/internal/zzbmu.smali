.class final Lcom/google/android/libraries/places/internal/zzbmu;
.super Ljava/io/OutputStream;
.source "SourceFile"


# instance fields
.field final synthetic zza:Lcom/google/android/libraries/places/internal/zzbmw;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/libraries/places/internal/zzbmw;Lcom/google/android/libraries/places/internal/zzbmt;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbmu;->zza:Lcom/google/android/libraries/places/internal/zzbmw;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final write(I)V
    .locals 3

    .line 1
    int-to-byte p1, p1

    .line 2
    const/4 v0, 0x1

    .line 3
    new-array v1, v0, [B

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    aput-byte p1, v1, v2

    .line 7
    .line 8
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbmu;->zza:Lcom/google/android/libraries/places/internal/zzbmw;

    .line 9
    .line 10
    invoke-static {p0, v1, v2, v0}, Lcom/google/android/libraries/places/internal/zzbmw;->zzh(Lcom/google/android/libraries/places/internal/zzbmw;[BII)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final write([BII)V
    .locals 0

    .line 14
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbmu;->zza:Lcom/google/android/libraries/places/internal/zzbmw;

    invoke-static {p0, p1, p2, p3}, Lcom/google/android/libraries/places/internal/zzbmw;->zzh(Lcom/google/android/libraries/places/internal/zzbmw;[BII)V

    return-void
.end method
