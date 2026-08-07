.class public final Lcom/google/android/libraries/places/internal/zzok;
.super Lcom/google/android/libraries/places/internal/zzol;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final synthetic zzc:I

.field private static final zzd:Lcom/google/android/libraries/places/internal/zzok;


# instance fields
.field final zza:Lcom/google/android/libraries/places/internal/zznp;

.field final zzb:Lcom/google/android/libraries/places/internal/zznp;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzok;

    .line 2
    .line 3
    invoke-static {}, Lcom/google/android/libraries/places/internal/zznn;->zzb()Lcom/google/android/libraries/places/internal/zznn;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {}, Lcom/google/android/libraries/places/internal/zznl;->zzb()Lcom/google/android/libraries/places/internal/zznl;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-direct {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zzok;-><init>(Lcom/google/android/libraries/places/internal/zznp;Lcom/google/android/libraries/places/internal/zznp;)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lcom/google/android/libraries/places/internal/zzok;->zzd:Lcom/google/android/libraries/places/internal/zzok;

    .line 15
    .line 16
    return-void
.end method

.method private constructor <init>(Lcom/google/android/libraries/places/internal/zznp;Lcom/google/android/libraries/places/internal/zznp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzol;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzok;->zza:Lcom/google/android/libraries/places/internal/zznp;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzok;->zzb:Lcom/google/android/libraries/places/internal/zznp;

    .line 7
    .line 8
    invoke-virtual {p1, p2}, Lcom/google/android/libraries/places/internal/zznp;->zza(Lcom/google/android/libraries/places/internal/zznp;)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-gtz p0, :cond_0

    .line 13
    .line 14
    invoke-static {}, Lcom/google/android/libraries/places/internal/zznl;->zzb()Lcom/google/android/libraries/places/internal/zznl;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    if-eq p1, p0, :cond_0

    .line 19
    .line 20
    invoke-static {}, Lcom/google/android/libraries/places/internal/zznn;->zzb()Lcom/google/android/libraries/places/internal/zznn;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    if-eq p2, p0, :cond_0

    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-static {p1, p2}, Lcom/google/android/libraries/places/internal/zzok;->zze(Lcom/google/android/libraries/places/internal/zznp;Lcom/google/android/libraries/places/internal/zznp;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string p1, "Invalid range: "

    .line 32
    .line 33
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    const/4 p0, 0x0

    .line 41
    throw p0
.end method

.method public static zza(Ljava/lang/Comparable;)Lcom/google/android/libraries/places/internal/zzok;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzno;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/google/android/libraries/places/internal/zzno;-><init>(Ljava/lang/Comparable;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/google/android/libraries/places/internal/zznl;->zzb()Lcom/google/android/libraries/places/internal/zznl;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance v1, Lcom/google/android/libraries/places/internal/zzok;

    .line 11
    .line 12
    invoke-direct {v1, v0, p0}, Lcom/google/android/libraries/places/internal/zzok;-><init>(Lcom/google/android/libraries/places/internal/zznp;Lcom/google/android/libraries/places/internal/zznp;)V

    .line 13
    .line 14
    .line 15
    return-object v1
.end method

.method public static zzb(Ljava/lang/Comparable;Ljava/lang/Comparable;)Lcom/google/android/libraries/places/internal/zzok;
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzno;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/google/android/libraries/places/internal/zzno;-><init>(Ljava/lang/Comparable;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Lcom/google/android/libraries/places/internal/zznm;

    .line 7
    .line 8
    invoke-direct {p0, p1}, Lcom/google/android/libraries/places/internal/zznm;-><init>(Ljava/lang/Comparable;)V

    .line 9
    .line 10
    .line 11
    new-instance p1, Lcom/google/android/libraries/places/internal/zzok;

    .line 12
    .line 13
    invoke-direct {p1, v0, p0}, Lcom/google/android/libraries/places/internal/zzok;-><init>(Lcom/google/android/libraries/places/internal/zznp;Lcom/google/android/libraries/places/internal/zznp;)V

    .line 14
    .line 15
    .line 16
    return-object p1
.end method

.method public static zzc(Ljava/lang/Comparable;Ljava/lang/Comparable;)Lcom/google/android/libraries/places/internal/zzok;
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzno;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/google/android/libraries/places/internal/zzno;-><init>(Ljava/lang/Comparable;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Lcom/google/android/libraries/places/internal/zzno;

    .line 7
    .line 8
    invoke-direct {p0, p1}, Lcom/google/android/libraries/places/internal/zzno;-><init>(Ljava/lang/Comparable;)V

    .line 9
    .line 10
    .line 11
    new-instance p1, Lcom/google/android/libraries/places/internal/zzok;

    .line 12
    .line 13
    invoke-direct {p1, v0, p0}, Lcom/google/android/libraries/places/internal/zzok;-><init>(Lcom/google/android/libraries/places/internal/zznp;Lcom/google/android/libraries/places/internal/zznp;)V

    .line 14
    .line 15
    .line 16
    return-object p1
.end method

.method private static zze(Lcom/google/android/libraries/places/internal/zznp;Lcom/google/android/libraries/places/internal/zznp;)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const/16 v1, 0x10

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/google/android/libraries/places/internal/zznp;->zzc(Ljava/lang/StringBuilder;)V

    .line 9
    .line 10
    .line 11
    const-string p0, ".."

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v0}, Lcom/google/android/libraries/places/internal/zznp;->zzd(Ljava/lang/StringBuilder;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    instance-of v0, p1, Lcom/google/android/libraries/places/internal/zzok;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    check-cast p1, Lcom/google/android/libraries/places/internal/zzok;

    .line 7
    .line 8
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzok;->zza:Lcom/google/android/libraries/places/internal/zznp;

    .line 9
    .line 10
    iget-object v2, p1, Lcom/google/android/libraries/places/internal/zzok;->zza:Lcom/google/android/libraries/places/internal/zznp;

    .line 11
    .line 12
    invoke-virtual {v0, v2}, Lcom/google/android/libraries/places/internal/zznp;->equals(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzok;->zzb:Lcom/google/android/libraries/places/internal/zznp;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/google/android/libraries/places/internal/zzok;->zzb:Lcom/google/android/libraries/places/internal/zznp;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lcom/google/android/libraries/places/internal/zznp;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    return p0

    .line 30
    :cond_0
    return v1
.end method

.method public final hashCode()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzok;->zza:Lcom/google/android/libraries/places/internal/zznp;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zznp;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    mul-int/lit8 v0, v0, 0x1f

    .line 8
    .line 9
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzok;->zzb:Lcom/google/android/libraries/places/internal/zznp;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zznp;->hashCode()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    add-int/2addr v0, p0

    .line 16
    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzok;->zza:Lcom/google/android/libraries/places/internal/zznp;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzok;->zzb:Lcom/google/android/libraries/places/internal/zznp;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/google/android/libraries/places/internal/zzok;->zze(Lcom/google/android/libraries/places/internal/zznp;Lcom/google/android/libraries/places/internal/zznp;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final zzd(Ljava/lang/Comparable;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzok;->zza:Lcom/google/android/libraries/places/internal/zznp;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Lcom/google/android/libraries/places/internal/zznp;->zze(Ljava/lang/Comparable;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzok;->zzb:Lcom/google/android/libraries/places/internal/zznp;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/google/android/libraries/places/internal/zznp;->zze(Ljava/lang/Comparable;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-nez p0, :cond_0

    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    return p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method
