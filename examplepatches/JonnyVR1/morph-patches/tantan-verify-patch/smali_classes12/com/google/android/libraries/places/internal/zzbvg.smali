.class public final Lcom/google/android/libraries/places/internal/zzbvg;
.super Lcom/google/android/libraries/places/internal/zzbvb;
.source "SourceFile"


# static fields
.field static final zzf:Lcom/google/android/libraries/places/internal/zzbbk;


# instance fields
.field private final zzg:Lcom/google/android/libraries/places/internal/zzbbm;

.field private final zzh:Lcom/google/android/libraries/places/internal/zzbbd;

.field private zzi:Lcom/google/android/libraries/places/internal/zzbbb;

.field private zzj:Lcom/google/android/libraries/places/internal/zzbbm;

.field private zzk:Lcom/google/android/libraries/places/internal/zzbbb;

.field private zzl:Lcom/google/android/libraries/places/internal/zzbbm;

.field private zzm:Lcom/google/android/libraries/places/internal/zzaze;

.field private zzn:Lcom/google/android/libraries/places/internal/zzbbk;

.field private zzo:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/libraries/places/internal/zzbvf;

    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzbvf;-><init>()V

    sput-object v0, Lcom/google/android/libraries/places/internal/zzbvg;->zzf:Lcom/google/android/libraries/places/internal/zzbbk;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbbd;)V
    .locals 1

    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbvb;-><init>()V

    new-instance v0, Lcom/google/android/libraries/places/internal/zzbvd;

    invoke-direct {v0, p0}, Lcom/google/android/libraries/places/internal/zzbvd;-><init>(Lcom/google/android/libraries/places/internal/zzbvg;)V

    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzg:Lcom/google/android/libraries/places/internal/zzbbm;

    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzj:Lcom/google/android/libraries/places/internal/zzbbm;

    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzl:Lcom/google/android/libraries/places/internal/zzbbm;

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzh:Lcom/google/android/libraries/places/internal/zzbbd;

    return-void
.end method

.method public static bridge synthetic zzh(Lcom/google/android/libraries/places/internal/zzbvg;)Lcom/google/android/libraries/places/internal/zzbbd;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzh:Lcom/google/android/libraries/places/internal/zzbbd;

    return-object p0
.end method

.method public static bridge synthetic zzi(Lcom/google/android/libraries/places/internal/zzbvg;)Lcom/google/android/libraries/places/internal/zzbbm;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzj:Lcom/google/android/libraries/places/internal/zzbbm;

    return-object p0
.end method

.method public static bridge synthetic zzj(Lcom/google/android/libraries/places/internal/zzbvg;)Lcom/google/android/libraries/places/internal/zzbbm;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzg:Lcom/google/android/libraries/places/internal/zzbbm;

    return-object p0
.end method

.method public static bridge synthetic zzk(Lcom/google/android/libraries/places/internal/zzbvg;)Lcom/google/android/libraries/places/internal/zzbbm;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzl:Lcom/google/android/libraries/places/internal/zzbbm;

    return-object p0
.end method

.method public static bridge synthetic zzl(Lcom/google/android/libraries/places/internal/zzbvg;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzo:Z

    return-void
.end method

.method public static bridge synthetic zzm(Lcom/google/android/libraries/places/internal/zzbvg;Lcom/google/android/libraries/places/internal/zzbbk;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzn:Lcom/google/android/libraries/places/internal/zzbbk;

    return-void
.end method

.method public static bridge synthetic zzn(Lcom/google/android/libraries/places/internal/zzbvg;Lcom/google/android/libraries/places/internal/zzaze;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzm:Lcom/google/android/libraries/places/internal/zzaze;

    return-void
.end method

.method public static bridge synthetic zzo(Lcom/google/android/libraries/places/internal/zzbvg;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbvg;->zzr()V

    return-void
.end method

.method public static bridge synthetic zzq(Lcom/google/android/libraries/places/internal/zzbvg;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzo:Z

    return p0
.end method

.method private final zzr()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzh:Lcom/google/android/libraries/places/internal/zzbbd;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzm:Lcom/google/android/libraries/places/internal/zzaze;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzn:Lcom/google/android/libraries/places/internal/zzbbk;

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zzbbd;->zze(Lcom/google/android/libraries/places/internal/zzaze;Lcom/google/android/libraries/places/internal/zzbbk;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzj:Lcom/google/android/libraries/places/internal/zzbbm;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbbm;->zze()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzl:Lcom/google/android/libraries/places/internal/zzbbm;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzj:Lcom/google/android/libraries/places/internal/zzbbm;

    .line 18
    .line 19
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzk:Lcom/google/android/libraries/places/internal/zzbbb;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzi:Lcom/google/android/libraries/places/internal/zzbbb;

    .line 22
    .line 23
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzg:Lcom/google/android/libraries/places/internal/zzbbm;

    .line 24
    .line 25
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzl:Lcom/google/android/libraries/places/internal/zzbbm;

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzk:Lcom/google/android/libraries/places/internal/zzbbb;

    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public final zze()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzl:Lcom/google/android/libraries/places/internal/zzbbm;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbbm;->zze()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzj:Lcom/google/android/libraries/places/internal/zzbbm;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbbm;->zze()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final zzg()Lcom/google/android/libraries/places/internal/zzbbm;
    .locals 2

    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzl:Lcom/google/android/libraries/places/internal/zzbbm;

    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzg:Lcom/google/android/libraries/places/internal/zzbbm;

    if-ne v0, v1, :cond_0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzj:Lcom/google/android/libraries/places/internal/zzbbm;

    return-object p0

    :cond_0
    return-object v0
.end method

.method public final zzp(Lcom/google/android/libraries/places/internal/zzbbb;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzk:Lcom/google/android/libraries/places/internal/zzbbb;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzl:Lcom/google/android/libraries/places/internal/zzbbm;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbbm;->zze()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzg:Lcom/google/android/libraries/places/internal/zzbbm;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzl:Lcom/google/android/libraries/places/internal/zzbbm;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzk:Lcom/google/android/libraries/places/internal/zzbbb;

    .line 21
    .line 22
    sget-object v0, Lcom/google/android/libraries/places/internal/zzaze;->zza:Lcom/google/android/libraries/places/internal/zzaze;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzm:Lcom/google/android/libraries/places/internal/zzaze;

    .line 25
    .line 26
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbvg;->zzf:Lcom/google/android/libraries/places/internal/zzbbk;

    .line 27
    .line 28
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzn:Lcom/google/android/libraries/places/internal/zzbbk;

    .line 29
    .line 30
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzi:Lcom/google/android/libraries/places/internal/zzbbb;

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_1

    .line 37
    .line 38
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbve;

    .line 39
    .line 40
    invoke-direct {v0, p0}, Lcom/google/android/libraries/places/internal/zzbve;-><init>(Lcom/google/android/libraries/places/internal/zzbvg;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1, v0}, Lcom/google/android/libraries/places/internal/zzbbb;->zza(Lcom/google/android/libraries/places/internal/zzbbd;)Lcom/google/android/libraries/places/internal/zzbbm;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iput-object v1, v0, Lcom/google/android/libraries/places/internal/zzbve;->zza:Lcom/google/android/libraries/places/internal/zzbbm;

    .line 48
    .line 49
    iput-object v1, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzl:Lcom/google/android/libraries/places/internal/zzbbm;

    .line 50
    .line 51
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzk:Lcom/google/android/libraries/places/internal/zzbbb;

    .line 52
    .line 53
    iget-boolean p1, p0, Lcom/google/android/libraries/places/internal/zzbvg;->zzo:Z

    .line 54
    .line 55
    if-nez p1, :cond_1

    .line 56
    .line 57
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbvg;->zzr()V

    .line 58
    .line 59
    .line 60
    :cond_1
    :goto_0
    return-void
.end method
