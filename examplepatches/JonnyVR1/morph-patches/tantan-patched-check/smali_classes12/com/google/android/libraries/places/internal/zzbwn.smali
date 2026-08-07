.class public final Lcom/google/android/libraries/places/internal/zzbwn;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# static fields
.field public static final zza:Lcom/google/android/libraries/places/internal/zzbwm;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final zzb:[B
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public zzc:I
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation
.end field

.field public zzd:I
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation
.end field

.field public zze:Z
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation
.end field

.field public final zzf:Z
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation
.end field

.field public zzg:Lcom/google/android/libraries/places/internal/zzbwn;
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public zzh:Lcom/google/android/libraries/places/internal/zzbwn;
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/google/android/libraries/places/internal/zzbwm;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/android/libraries/places/internal/zzbwm;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/google/android/libraries/places/internal/zzbwn;->zza:Lcom/google/android/libraries/places/internal/zzbwm;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x2000

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzb:[B

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzf:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zze:Z

    return-void
.end method

.method public constructor <init>([BIIZZ)V
    .locals 0
    .param p1    # [B
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzb:[B

    iput p2, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    iput p3, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    iput-boolean p4, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zze:Z

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzf:Z

    return-void
.end method


# virtual methods
.method public final zza()Lcom/google/android/libraries/places/internal/zzbwn;
    .locals 4
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzg:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-ne v0, p0, :cond_0

    .line 5
    .line 6
    move-object v0, v1

    .line 7
    :cond_0
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzh:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 8
    .line 9
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzg:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 13
    .line 14
    iput-object v3, v2, Lcom/google/android/libraries/places/internal/zzbwn;->zzg:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 15
    .line 16
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzg:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 17
    .line 18
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzh:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 22
    .line 23
    iput-object v3, v2, Lcom/google/android/libraries/places/internal/zzbwn;->zzh:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 24
    .line 25
    iput-object v1, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzg:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 26
    .line 27
    iput-object v1, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzh:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 28
    .line 29
    return-object v0
.end method

.method public final zzb(Lcom/google/android/libraries/places/internal/zzbwn;)Lcom/google/android/libraries/places/internal/zzbwn;
    .locals 1
    .param p1    # Lcom/google/android/libraries/places/internal/zzbwn;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p0, p1, Lcom/google/android/libraries/places/internal/zzbwn;->zzh:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 5
    .line 6
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzg:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 7
    .line 8
    iput-object v0, p1, Lcom/google/android/libraries/places/internal/zzbwn;->zzg:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 9
    .line 10
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzg:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    iput-object p1, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzh:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 16
    .line 17
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzg:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 18
    .line 19
    return-object p1
.end method

.method public final zzc()Lcom/google/android/libraries/places/internal/zzbwn;
    .locals 7
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zze:Z

    .line 3
    .line 4
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbwn;

    .line 5
    .line 6
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzb:[B

    .line 7
    .line 8
    iget v3, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 9
    .line 10
    iget v4, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 11
    .line 12
    const/4 v5, 0x1

    .line 13
    const/4 v6, 0x0

    .line 14
    invoke-direct/range {v1 .. v6}, Lcom/google/android/libraries/places/internal/zzbwn;-><init>([BIIZZ)V

    .line 15
    .line 16
    .line 17
    return-object v1
.end method

.method public final zzd(I)Lcom/google/android/libraries/places/internal/zzbwn;
    .locals 8
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 2
    .line 3
    iget v1, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 4
    .line 5
    sub-int/2addr v0, v1

    .line 6
    if-gt p1, v0, :cond_1

    .line 7
    .line 8
    const/16 v0, 0x400

    .line 9
    .line 10
    if-lt p1, v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbwn;->zzc()Lcom/google/android/libraries/places/internal/zzbwn;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzb:[B

    .line 18
    .line 19
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbwo;->zza()Lcom/google/android/libraries/places/internal/zzbwn;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v2, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzb:[B

    .line 24
    .line 25
    iget v4, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 26
    .line 27
    add-int v5, v4, p1

    .line 28
    .line 29
    const/4 v6, 0x2

    .line 30
    const/4 v7, 0x0

    .line 31
    const/4 v3, 0x0

    .line 32
    invoke-static/range {v1 .. v7}, Lkotlin/collections/ArraysKt;->copyInto$default([B[BIIIILjava/lang/Object;)[B

    .line 33
    .line 34
    .line 35
    :goto_0
    iget v1, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 36
    .line 37
    add-int/2addr v1, p1

    .line 38
    iput v1, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 39
    .line 40
    iget v1, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 41
    .line 42
    add-int/2addr v1, p1

    .line 43
    iput v1, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 44
    .line 45
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzh:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, v0}, Lcom/google/android/libraries/places/internal/zzbwn;->zzb(Lcom/google/android/libraries/places/internal/zzbwn;)Lcom/google/android/libraries/places/internal/zzbwn;

    .line 51
    .line 52
    .line 53
    return-object v0

    .line 54
    :cond_1
    const-string p0, "byteCount out of range"

    .line 55
    .line 56
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    const/4 p0, 0x0

    .line 60
    return-object p0
.end method

.method public final zze(Lcom/google/android/libraries/places/internal/zzbwn;I)V
    .locals 8
    .param p1    # Lcom/google/android/libraries/places/internal/zzbwn;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p1, Lcom/google/android/libraries/places/internal/zzbwn;->zzf:Z

    .line 5
    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    iget v5, p1, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 9
    .line 10
    add-int v0, v5, p2

    .line 11
    .line 12
    const/16 v1, 0x2000

    .line 13
    .line 14
    if-le v0, v1, :cond_2

    .line 15
    .line 16
    iget-boolean v2, p1, Lcom/google/android/libraries/places/internal/zzbwn;->zze:Z

    .line 17
    .line 18
    if-nez v2, :cond_1

    .line 19
    .line 20
    iget v4, p1, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 21
    .line 22
    sub-int/2addr v0, v4

    .line 23
    if-gt v0, v1, :cond_0

    .line 24
    .line 25
    iget-object v1, p1, Lcom/google/android/libraries/places/internal/zzbwn;->zzb:[B

    .line 26
    .line 27
    const/4 v6, 0x2

    .line 28
    const/4 v7, 0x0

    .line 29
    const/4 v3, 0x0

    .line 30
    move-object v2, v1

    .line 31
    invoke-static/range {v1 .. v7}, Lkotlin/collections/ArraysKt;->copyInto$default([B[BIIIILjava/lang/Object;)[B

    .line 32
    .line 33
    .line 34
    iget v0, p1, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 35
    .line 36
    iget v1, p1, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 37
    .line 38
    sub-int v5, v0, v1

    .line 39
    .line 40
    iput v5, p1, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 41
    .line 42
    const/4 v0, 0x0

    .line 43
    iput v0, p1, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    invoke-static {}, Ll/fig0;->a()V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    invoke-static {}, Ll/fig0;->a()V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzb:[B

    .line 55
    .line 56
    iget-object v1, p1, Lcom/google/android/libraries/places/internal/zzbwn;->zzb:[B

    .line 57
    .line 58
    iget v2, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 59
    .line 60
    add-int v3, v2, p2

    .line 61
    .line 62
    invoke-static {v0, v1, v5, v2, v3}, Lkotlin/collections/ArraysKt;->copyInto([B[BIII)[B

    .line 63
    .line 64
    .line 65
    iget v0, p1, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 66
    .line 67
    add-int/2addr v0, p2

    .line 68
    iput v0, p1, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 69
    .line 70
    iget p1, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 71
    .line 72
    add-int/2addr p1, p2

    .line 73
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 74
    .line 75
    return-void

    .line 76
    :cond_3
    const-string p0, "only owner can write"

    .line 77
    .line 78
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method
