.class public final Lcom/google/android/libraries/places/internal/zzbar;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final zza:Ljava/nio/charset/Charset;

.field public static final zzb:Lcom/google/android/libraries/places/internal/zzsi;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "US-ASCII"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbar;->zza:Ljava/nio/charset/Charset;

    .line 8
    .line 9
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbcf;->zzc:Lcom/google/android/libraries/places/internal/zzsi;

    .line 10
    .line 11
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbar;->zzb:Lcom/google/android/libraries/places/internal/zzsi;

    .line 12
    .line 13
    return-void
.end method

.method public static zza(Lcom/google/android/libraries/places/internal/zzbcf;)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbcf;->zza()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static zzb(Ljava/lang/String;Lcom/google/android/libraries/places/internal/zzbaq;)Lcom/google/android/libraries/places/internal/zzbca;
    .locals 3

    .line 1
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/16 v2, 0x3a

    .line 13
    .line 14
    if-ne v0, v2, :cond_0

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    :cond_0
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbcd;

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-direct {v0, p0, v1, p1, v2}, Lcom/google/android/libraries/places/internal/zzbcd;-><init>(Ljava/lang/String;ZLcom/google/android/libraries/places/internal/zzbce;Lcom/google/android/libraries/places/internal/zzbcc;)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public static varargs zzc([[B)Lcom/google/android/libraries/places/internal/zzbcf;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbcf;

    .line 2
    .line 3
    array-length v1, p0

    .line 4
    shr-int/lit8 v1, v1, 0x1

    .line 5
    .line 6
    invoke-direct {v0, v1, p0}, Lcom/google/android/libraries/places/internal/zzbcf;-><init>(I[Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public static zzd(Lcom/google/android/libraries/places/internal/zzbcf;)[[B
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbcf;->zzg()[[B

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
