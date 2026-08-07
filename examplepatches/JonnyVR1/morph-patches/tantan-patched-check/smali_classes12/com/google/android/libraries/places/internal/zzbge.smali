.class public final Lcom/google/android/libraries/places/internal/zzbge;
.super Lcom/google/android/libraries/places/internal/zzbeg;
.source "SourceFile"


# static fields
.field private static final zza:Lcom/google/android/libraries/places/internal/zzbgc;

.field private static final zzb:Lcom/google/android/libraries/places/internal/zzbgc;

.field private static final zzc:Lcom/google/android/libraries/places/internal/zzbgc;

.field private static final zzd:Lcom/google/android/libraries/places/internal/zzbgc;

.field private static final zze:Lcom/google/android/libraries/places/internal/zzbgd;


# instance fields
.field private final zzf:Ljava/util/Deque;

.field private zzg:Ljava/util/Deque;

.field private zzh:I

.field private final zzi:Ljava/util/Queue;

.field private zzj:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/libraries/places/internal/zzbfx;

    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzbfx;-><init>()V

    sput-object v0, Lcom/google/android/libraries/places/internal/zzbge;->zza:Lcom/google/android/libraries/places/internal/zzbgc;

    new-instance v0, Lcom/google/android/libraries/places/internal/zzbfy;

    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzbfy;-><init>()V

    sput-object v0, Lcom/google/android/libraries/places/internal/zzbge;->zzb:Lcom/google/android/libraries/places/internal/zzbgc;

    new-instance v0, Lcom/google/android/libraries/places/internal/zzbfz;

    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzbfz;-><init>()V

    sput-object v0, Lcom/google/android/libraries/places/internal/zzbge;->zzc:Lcom/google/android/libraries/places/internal/zzbgc;

    new-instance v0, Lcom/google/android/libraries/places/internal/zzbga;

    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzbga;-><init>()V

    sput-object v0, Lcom/google/android/libraries/places/internal/zzbge;->zzd:Lcom/google/android/libraries/places/internal/zzbgc;

    new-instance v0, Lcom/google/android/libraries/places/internal/zzbgb;

    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzbgb;-><init>()V

    sput-object v0, Lcom/google/android/libraries/places/internal/zzbge;->zze:Lcom/google/android/libraries/places/internal/zzbgd;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbeg;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayDeque;

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    invoke-direct {v0, v1}, Ljava/util/ArrayDeque;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzi:Ljava/util/Queue;

    .line 11
    .line 12
    new-instance v0, Ljava/util/ArrayDeque;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzf:Ljava/util/Deque;

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(I)V
    .locals 2

    .line 20
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbeg;-><init>()V

    new-instance v0, Ljava/util/ArrayDeque;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/ArrayDeque;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzi:Ljava/util/Queue;

    new-instance v0, Ljava/util/ArrayDeque;

    .line 21
    invoke-direct {v0, p1}, Ljava/util/ArrayDeque;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzf:Ljava/util/Deque;

    return-void
.end method

.method private final zzm(Lcom/google/android/libraries/places/internal/zzbgd;ILjava/lang/Object;I)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p2}, Lcom/google/android/libraries/places/internal/zzbeg;->zza(I)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzf:Ljava/util/Deque;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbge;->zzp()V

    .line 13
    .line 14
    .line 15
    :cond_0
    :goto_0
    if-lez p2, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzf:Ljava/util/Deque;

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzf:Ljava/util/Deque;

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/Deque;->peek()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lcom/google/android/libraries/places/internal/zzbnv;

    .line 32
    .line 33
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzbnv;->zzf()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    invoke-static {p2, v1}, Ljava/lang/Math;->min(II)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    invoke-interface {p1, v0, v1, p3, p4}, Lcom/google/android/libraries/places/internal/zzbgd;->zza(Lcom/google/android/libraries/places/internal/zzbnv;ILjava/lang/Object;I)I

    .line 42
    .line 43
    .line 44
    move-result p4

    .line 45
    sub-int/2addr p2, v1

    .line 46
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzh:I

    .line 47
    .line 48
    sub-int/2addr v0, v1

    .line 49
    iput v0, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzh:I

    .line 50
    .line 51
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbge;->zzp()V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    if-gtz p2, :cond_2

    .line 56
    .line 57
    return p4

    .line 58
    :cond_2
    const-string p0, "Failed executing read operation"

    .line 59
    .line 60
    invoke-static {p0}, Ll/gig0;->a(Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    const/4 p0, 0x0

    .line 64
    return p0
.end method

.method private final zzn(Lcom/google/android/libraries/places/internal/zzbgc;ILjava/lang/Object;I)I
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/libraries/places/internal/zzbge;->zzm(Lcom/google/android/libraries/places/internal/zzbgd;ILjava/lang/Object;I)I

    .line 2
    .line 3
    .line 4
    move-result p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return p0

    .line 6
    :catch_0
    move-exception p0

    .line 7
    invoke-static {p0}, Ll/gig0;->a(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method private final zzo()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzj:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzg:Ljava/util/Deque;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzf:Ljava/util/Deque;

    .line 8
    .line 9
    invoke-interface {v1}, Ljava/util/Deque;->remove()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Lcom/google/android/libraries/places/internal/zzbnv;

    .line 14
    .line 15
    invoke-interface {v0, v1}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzf:Ljava/util/Deque;

    .line 19
    .line 20
    invoke-interface {p0}, Ljava/util/Deque;->peek()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Lcom/google/android/libraries/places/internal/zzbnv;

    .line 25
    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzbnv;->zzb()V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void

    .line 32
    :cond_1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzf:Ljava/util/Deque;

    .line 33
    .line 34
    invoke-interface {p0}, Ljava/util/Deque;->remove()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    check-cast p0, Lcom/google/android/libraries/places/internal/zzbnv;

    .line 39
    .line 40
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzbnv;->close()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method private final zzp()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzf:Ljava/util/Deque;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Deque;->peek()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/google/android/libraries/places/internal/zzbnv;

    .line 8
    .line 9
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzbnv;->zzf()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbge;->zzo()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method


# virtual methods
.method public final close()V
    .locals 1

    .line 1
    :goto_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzf:Ljava/util/Deque;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzf:Ljava/util/Deque;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/Deque;->remove()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/google/android/libraries/places/internal/zzbnv;

    .line 16
    .line 17
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzbnv;->close()V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzg:Ljava/util/Deque;

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    :goto_1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzg:Ljava/util/Deque;

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzg:Ljava/util/Deque;

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/util/Deque;->remove()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Lcom/google/android/libraries/places/internal/zzbnv;

    .line 40
    .line 41
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzbnv;->close()V

    .line 42
    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_1
    return-void
.end method

.method public final zzb()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzg:Ljava/util/Deque;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzf:Ljava/util/Deque;

    .line 7
    .line 8
    new-instance v1, Ljava/util/ArrayDeque;

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/Deque;->size()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/16 v2, 0x10

    .line 15
    .line 16
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-direct {v1, v0}, Ljava/util/ArrayDeque;-><init>(I)V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzg:Ljava/util/Deque;

    .line 24
    .line 25
    :goto_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzg:Ljava/util/Deque;

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzg:Ljava/util/Deque;

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/util/Deque;->remove()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Lcom/google/android/libraries/places/internal/zzbnv;

    .line 40
    .line 41
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzbnv;->close()V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    const/4 v0, 0x1

    .line 46
    iput-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzj:Z

    .line 47
    .line 48
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzf:Ljava/util/Deque;

    .line 49
    .line 50
    invoke-interface {p0}, Ljava/util/Deque;->peek()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    check-cast p0, Lcom/google/android/libraries/places/internal/zzbnv;

    .line 55
    .line 56
    if-eqz p0, :cond_2

    .line 57
    .line 58
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzbnv;->zzb()V

    .line 59
    .line 60
    .line 61
    :cond_2
    return-void
.end method

.method public final zzc()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzj:Z

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzf:Ljava/util/Deque;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/Deque;->peek()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/google/android/libraries/places/internal/zzbnv;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzbnv;->zzf()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzbnv;->zzc()V

    .line 21
    .line 22
    .line 23
    iget v2, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzh:I

    .line 24
    .line 25
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzbnv;->zzf()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    sub-int/2addr v0, v1

    .line 30
    add-int/2addr v2, v0

    .line 31
    iput v2, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzh:I

    .line 32
    .line 33
    :goto_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzg:Ljava/util/Deque;

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/util/Deque;->pollLast()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Lcom/google/android/libraries/places/internal/zzbnv;

    .line 40
    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzbnv;->zzc()V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzf:Ljava/util/Deque;

    .line 47
    .line 48
    invoke-interface {v1, v0}, Ljava/util/Deque;->addFirst(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    iget v1, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzh:I

    .line 52
    .line 53
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzbnv;->zzf()I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr v1, v0

    .line 58
    iput v1, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzh:I

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    return-void

    .line 62
    :cond_2
    new-instance p0, Ljava/nio/InvalidMarkException;

    .line 63
    .line 64
    invoke-direct {p0}, Ljava/nio/InvalidMarkException;-><init>()V

    .line 65
    .line 66
    .line 67
    throw p0
.end method

.method public final zzd()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzf:Ljava/util/Deque;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/google/android/libraries/places/internal/zzbnv;

    .line 18
    .line 19
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzbnv;->zzd()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    return p0

    .line 27
    :cond_1
    const/4 p0, 0x1

    .line 28
    return p0
.end method

.method public final zze()I
    .locals 4

    .line 1
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbge;->zza:Lcom/google/android/libraries/places/internal/zzbgc;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    const/4 v3, 0x1

    .line 6
    invoke-direct {p0, v0, v3, v1, v2}, Lcom/google/android/libraries/places/internal/zzbge;->zzn(Lcom/google/android/libraries/places/internal/zzbgc;ILjava/lang/Object;I)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public final zzf()I
    .locals 0

    iget p0, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzh:I

    return p0
.end method

.method public final zzg(I)Lcom/google/android/libraries/places/internal/zzbnv;
    .locals 6

    .line 1
    if-gtz p1, :cond_0

    .line 2
    .line 3
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbny;->zza()Lcom/google/android/libraries/places/internal/zzbnv;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-virtual {p0, p1}, Lcom/google/android/libraries/places/internal/zzbeg;->zza(I)V

    .line 9
    .line 10
    .line 11
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzh:I

    .line 12
    .line 13
    sub-int/2addr v0, p1

    .line 14
    iput v0, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzh:I

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    move-object v1, v0

    .line 18
    :goto_0
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzf:Ljava/util/Deque;

    .line 19
    .line 20
    invoke-interface {v2}, Ljava/util/Deque;->peek()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Lcom/google/android/libraries/places/internal/zzbnv;

    .line 25
    .line 26
    invoke-interface {v2}, Lcom/google/android/libraries/places/internal/zzbnv;->zzf()I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-le v3, p1, :cond_1

    .line 31
    .line 32
    invoke-interface {v2, p1}, Lcom/google/android/libraries/places/internal/zzbnv;->zzg(I)Lcom/google/android/libraries/places/internal/zzbnv;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    const/4 v2, 0x0

    .line 37
    goto :goto_2

    .line 38
    :cond_1
    iget-boolean v4, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzj:Z

    .line 39
    .line 40
    if-eqz v4, :cond_2

    .line 41
    .line 42
    invoke-interface {v2, v3}, Lcom/google/android/libraries/places/internal/zzbnv;->zzg(I)Lcom/google/android/libraries/places/internal/zzbnv;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbge;->zzo()V

    .line 47
    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_2
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzf:Ljava/util/Deque;

    .line 51
    .line 52
    invoke-interface {v2}, Ljava/util/Deque;->poll()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    check-cast v2, Lcom/google/android/libraries/places/internal/zzbnv;

    .line 57
    .line 58
    :goto_1
    sub-int/2addr p1, v3

    .line 59
    move-object v5, v2

    .line 60
    move v2, p1

    .line 61
    move-object p1, v5

    .line 62
    :goto_2
    if-nez v0, :cond_3

    .line 63
    .line 64
    move-object v0, p1

    .line 65
    goto :goto_4

    .line 66
    :cond_3
    if-nez v1, :cond_5

    .line 67
    .line 68
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbge;

    .line 69
    .line 70
    const/4 v3, 0x2

    .line 71
    if-nez v2, :cond_4

    .line 72
    .line 73
    goto :goto_3

    .line 74
    :cond_4
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzf:Ljava/util/Deque;

    .line 75
    .line 76
    invoke-interface {v4}, Ljava/util/Deque;->size()I

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    add-int/2addr v4, v3

    .line 81
    const/16 v3, 0x10

    .line 82
    .line 83
    invoke-static {v4, v3}, Ljava/lang/Math;->min(II)I

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    :goto_3
    invoke-direct {v1, v3}, Lcom/google/android/libraries/places/internal/zzbge;-><init>(I)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v1, v0}, Lcom/google/android/libraries/places/internal/zzbge;->zzh(Lcom/google/android/libraries/places/internal/zzbnv;)V

    .line 91
    .line 92
    .line 93
    move-object v0, v1

    .line 94
    :cond_5
    invoke-virtual {v1, p1}, Lcom/google/android/libraries/places/internal/zzbge;->zzh(Lcom/google/android/libraries/places/internal/zzbnv;)V

    .line 95
    .line 96
    .line 97
    :goto_4
    if-gtz v2, :cond_6

    .line 98
    .line 99
    return-object v0

    .line 100
    :cond_6
    move p1, v2

    .line 101
    goto :goto_0
.end method

.method public final zzh(Lcom/google/android/libraries/places/internal/zzbnv;)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzj:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzf:Ljava/util/Deque;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move v0, v1

    .line 17
    :goto_0
    instance-of v2, p1, Lcom/google/android/libraries/places/internal/zzbge;

    .line 18
    .line 19
    if-nez v2, :cond_1

    .line 20
    .line 21
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzf:Ljava/util/Deque;

    .line 22
    .line 23
    invoke-interface {v1, p1}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    iget v1, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzh:I

    .line 27
    .line 28
    invoke-interface {p1}, Lcom/google/android/libraries/places/internal/zzbnv;->zzf()I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    add-int/2addr v1, p1

    .line 33
    iput v1, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzh:I

    .line 34
    .line 35
    goto :goto_2

    .line 36
    :cond_1
    check-cast p1, Lcom/google/android/libraries/places/internal/zzbge;

    .line 37
    .line 38
    :goto_1
    iget-object v2, p1, Lcom/google/android/libraries/places/internal/zzbge;->zzf:Ljava/util/Deque;

    .line 39
    .line 40
    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-nez v2, :cond_2

    .line 45
    .line 46
    iget-object v2, p1, Lcom/google/android/libraries/places/internal/zzbge;->zzf:Ljava/util/Deque;

    .line 47
    .line 48
    invoke-interface {v2}, Ljava/util/Deque;->remove()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    check-cast v2, Lcom/google/android/libraries/places/internal/zzbnv;

    .line 53
    .line 54
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzf:Ljava/util/Deque;

    .line 55
    .line 56
    invoke-interface {v3, v2}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_2
    iget v2, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzh:I

    .line 61
    .line 62
    iget v3, p1, Lcom/google/android/libraries/places/internal/zzbge;->zzh:I

    .line 63
    .line 64
    add-int/2addr v2, v3

    .line 65
    iput v2, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzh:I

    .line 66
    .line 67
    iput v1, p1, Lcom/google/android/libraries/places/internal/zzbge;->zzh:I

    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbeg;->close()V

    .line 70
    .line 71
    .line 72
    :goto_2
    if-eqz v0, :cond_3

    .line 73
    .line 74
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbge;->zzf:Ljava/util/Deque;

    .line 75
    .line 76
    invoke-interface {p0}, Ljava/util/Deque;->peek()Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    check-cast p0, Lcom/google/android/libraries/places/internal/zzbnv;

    .line 81
    .line 82
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzbnv;->zzb()V

    .line 83
    .line 84
    .line 85
    :cond_3
    return-void
.end method

.method public final zzi(Ljava/nio/ByteBuffer;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbge;->zzd:Lcom/google/android/libraries/places/internal/zzbgc;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-direct {p0, v0, v1, p1, v2}, Lcom/google/android/libraries/places/internal/zzbge;->zzn(Lcom/google/android/libraries/places/internal/zzbgc;ILjava/lang/Object;I)I

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final zzj(Ljava/io/OutputStream;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbge;->zze:Lcom/google/android/libraries/places/internal/zzbgd;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {p0, v0, p2, p1, v1}, Lcom/google/android/libraries/places/internal/zzbge;->zzm(Lcom/google/android/libraries/places/internal/zzbgd;ILjava/lang/Object;I)I

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final zzk([BII)V
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbge;->zzc:Lcom/google/android/libraries/places/internal/zzbgc;

    .line 2
    .line 3
    invoke-direct {p0, v0, p3, p1, p2}, Lcom/google/android/libraries/places/internal/zzbge;->zzn(Lcom/google/android/libraries/places/internal/zzbgc;ILjava/lang/Object;I)I

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final zzl(I)V
    .locals 3

    .line 1
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbge;->zzb:Lcom/google/android/libraries/places/internal/zzbgc;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-direct {p0, v0, p1, v1, v2}, Lcom/google/android/libraries/places/internal/zzbge;->zzn(Lcom/google/android/libraries/places/internal/zzbgc;ILjava/lang/Object;I)I

    .line 6
    .line 7
    .line 8
    return-void
.end method
