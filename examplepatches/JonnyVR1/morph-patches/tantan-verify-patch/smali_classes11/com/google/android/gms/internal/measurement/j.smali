.class public final Lcom/google/android/gms/internal/measurement/j;
.super Lcom/google/android/gms/internal/measurement/u0;
.source "SourceFile"

# interfaces
.implements Ll/v9y0;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/measurement/j$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/measurement/u0<",
        "Lcom/google/android/gms/internal/measurement/j;",
        "Lcom/google/android/gms/internal/measurement/j$a;",
        ">;",
        "Ll/v9y0;"
    }
.end annotation


# static fields
.field private static final zzc:Lcom/google/android/gms/internal/measurement/j;

.field private static volatile zzd:Ll/yay0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/yay0<",
            "Lcom/google/android/gms/internal/measurement/j;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private zze:I

.field private zzf:J

.field private zzg:Ljava/lang/String;

.field private zzh:I

.field private zzi:Ll/i4y0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/i4y0<",
            "Lcom/google/android/gms/internal/measurement/n;",
            ">;"
        }
    .end annotation
.end field

.field private zzj:Ll/i4y0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/i4y0<",
            "Lcom/google/android/gms/internal/measurement/i;",
            ">;"
        }
    .end annotation
.end field

.field private zzk:Ll/i4y0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/i4y0<",
            "Lcom/google/android/gms/internal/measurement/b;",
            ">;"
        }
    .end annotation
.end field

.field private zzl:Ljava/lang/String;

.field private zzm:Z

.field private zzn:Ll/i4y0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/i4y0<",
            "Lcom/google/android/gms/internal/measurement/k0;",
            ">;"
        }
    .end annotation
.end field

.field private zzo:Ll/i4y0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/i4y0<",
            "Lcom/google/android/gms/internal/measurement/h;",
            ">;"
        }
    .end annotation
.end field

.field private zzp:Ljava/lang/String;

.field private zzq:Ljava/lang/String;

.field private zzr:Lcom/google/android/gms/internal/measurement/zzfr$zza;

.field private zzs:Lcom/google/android/gms/internal/measurement/l;

.field private zzt:Lcom/google/android/gms/internal/measurement/o;

.field private zzu:Lcom/google/android/gms/internal/measurement/m;

.field private zzv:Lcom/google/android/gms/internal/measurement/k;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/measurement/j;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/gms/internal/measurement/j;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/gms/internal/measurement/j;->zzc:Lcom/google/android/gms/internal/measurement/j;

    .line 7
    .line 8
    const-class v1, Lcom/google/android/gms/internal/measurement/j;

    .line 9
    .line 10
    invoke-static {v1, v0}, Lcom/google/android/gms/internal/measurement/u0;->p(Ljava/lang/Class;Lcom/google/android/gms/internal/measurement/u0;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/measurement/u0;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/google/android/gms/internal/measurement/j;->zzg:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {}, Lcom/google/android/gms/internal/measurement/u0;->x()Ll/i4y0;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iput-object v1, p0, Lcom/google/android/gms/internal/measurement/j;->zzi:Ll/i4y0;

    .line 13
    .line 14
    invoke-static {}, Lcom/google/android/gms/internal/measurement/u0;->x()Ll/i4y0;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, p0, Lcom/google/android/gms/internal/measurement/j;->zzj:Ll/i4y0;

    .line 19
    .line 20
    invoke-static {}, Lcom/google/android/gms/internal/measurement/u0;->x()Ll/i4y0;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, p0, Lcom/google/android/gms/internal/measurement/j;->zzk:Ll/i4y0;

    .line 25
    .line 26
    iput-object v0, p0, Lcom/google/android/gms/internal/measurement/j;->zzl:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {}, Lcom/google/android/gms/internal/measurement/u0;->x()Ll/i4y0;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iput-object v1, p0, Lcom/google/android/gms/internal/measurement/j;->zzn:Ll/i4y0;

    .line 33
    .line 34
    invoke-static {}, Lcom/google/android/gms/internal/measurement/u0;->x()Ll/i4y0;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iput-object v1, p0, Lcom/google/android/gms/internal/measurement/j;->zzo:Ll/i4y0;

    .line 39
    .line 40
    iput-object v0, p0, Lcom/google/android/gms/internal/measurement/j;->zzp:Ljava/lang/String;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/google/android/gms/internal/measurement/j;->zzq:Ljava/lang/String;

    .line 43
    .line 44
    return-void
.end method

.method public static synthetic C(Lcom/google/android/gms/internal/measurement/j;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/measurement/u0;->x()Ll/i4y0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/google/android/gms/internal/measurement/j;->zzk:Ll/i4y0;

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic D(Lcom/google/android/gms/internal/measurement/j;ILcom/google/android/gms/internal/measurement/i;)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/j;->zzj:Ll/i4y0;

    .line 5
    .line 6
    invoke-interface {v0}, Ll/i4y0;->zzc()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    invoke-static {v0}, Lcom/google/android/gms/internal/measurement/u0;->o(Ll/i4y0;)Ll/i4y0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lcom/google/android/gms/internal/measurement/j;->zzj:Ll/i4y0;

    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/j;->zzj:Ll/i4y0;

    .line 19
    .line 20
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static K()Lcom/google/android/gms/internal/measurement/j$a;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/measurement/j;->zzc:Lcom/google/android/gms/internal/measurement/j;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/internal/measurement/u0;->s()Lcom/google/android/gms/internal/measurement/u0$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/google/android/gms/internal/measurement/j$a;

    .line 8
    .line 9
    return-object v0
.end method

.method public static bridge synthetic L()Lcom/google/android/gms/internal/measurement/j;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/measurement/j;->zzc:Lcom/google/android/gms/internal/measurement/j;

    return-object v0
.end method

.method public static M()Lcom/google/android/gms/internal/measurement/j;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/measurement/j;->zzc:Lcom/google/android/gms/internal/measurement/j;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public final B(I)Lcom/google/android/gms/internal/measurement/i;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/j;->zzj:Ll/i4y0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/google/android/gms/internal/measurement/i;

    .line 8
    .line 9
    return-object p0
.end method

.method public final E()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/j;->zzj:Ll/i4y0;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final G()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/google/android/gms/internal/measurement/j;->zzf:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final I()Lcom/google/android/gms/internal/measurement/zzfr$zza;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/j;->zzr:Lcom/google/android/gms/internal/measurement/zzfr$zza;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzfr$zza;->C()Lcom/google/android/gms/internal/measurement/zzfr$zza;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public final N()Lcom/google/android/gms/internal/measurement/o;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/j;->zzt:Lcom/google/android/gms/internal/measurement/o;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/google/android/gms/internal/measurement/o;->C()Lcom/google/android/gms/internal/measurement/o;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public final T()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/j;->zzg:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final U()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/j;->zzp:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final V()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/measurement/b;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/j;->zzk:Ll/i4y0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final W()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/measurement/h;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/j;->zzo:Ll/i4y0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final X()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/measurement/k0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/j;->zzn:Ll/i4y0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final Y()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/measurement/n;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/j;->zzi:Ll/i4y0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final Z()Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/gms/internal/measurement/j;->zze:I

    .line 2
    .line 3
    and-int/lit16 p0, p0, 0x80

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final a0()Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/gms/internal/measurement/j;->zze:I

    .line 2
    .line 3
    and-int/lit8 p0, p0, 0x2

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final b0()Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/gms/internal/measurement/j;->zze:I

    .line 2
    .line 3
    and-int/lit16 p0, p0, 0x200

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final c0()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/google/android/gms/internal/measurement/j;->zze:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    and-int/2addr p0, v0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return v0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public final h()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/j;->zzn:Ll/i4y0;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final k(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 25

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/measurement/p;->a:[I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    add-int/lit8 v2, p1, -0x1

    .line 5
    .line 6
    aget v0, v0, v2

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    packed-switch v0, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/l710;->a()V

    .line 13
    .line 14
    .line 15
    :pswitch_0
    return-object v2

    .line 16
    :pswitch_1
    invoke-static {v1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    return-object v0

    .line 21
    :pswitch_2
    sget-object v0, Lcom/google/android/gms/internal/measurement/j;->zzd:Ll/yay0;

    .line 22
    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    const-class v1, Lcom/google/android/gms/internal/measurement/j;

    .line 26
    .line 27
    monitor-enter v1

    .line 28
    :try_start_0
    sget-object v0, Lcom/google/android/gms/internal/measurement/j;->zzd:Ll/yay0;

    .line 29
    .line 30
    if-nez v0, :cond_0

    .line 31
    .line 32
    new-instance v0, Lcom/google/android/gms/internal/measurement/u0$a;

    .line 33
    .line 34
    sget-object v2, Lcom/google/android/gms/internal/measurement/j;->zzc:Lcom/google/android/gms/internal/measurement/j;

    .line 35
    .line 36
    invoke-direct {v0, v2}, Lcom/google/android/gms/internal/measurement/u0$a;-><init>(Lcom/google/android/gms/internal/measurement/u0;)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lcom/google/android/gms/internal/measurement/j;->zzd:Ll/yay0;

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :catchall_0
    move-exception v0

    .line 43
    goto :goto_1

    .line 44
    :cond_0
    :goto_0
    monitor-exit v1

    .line 45
    return-object v0

    .line 46
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    throw v0

    .line 48
    :cond_1
    return-object v0

    .line 49
    :pswitch_3
    sget-object v0, Lcom/google/android/gms/internal/measurement/j;->zzc:Lcom/google/android/gms/internal/measurement/j;

    .line 50
    .line 51
    return-object v0

    .line 52
    :pswitch_4
    const-string v2, "zze"

    .line 53
    .line 54
    const-string v3, "zzf"

    .line 55
    .line 56
    const-string v4, "zzg"

    .line 57
    .line 58
    const-string v5, "zzh"

    .line 59
    .line 60
    const-string v6, "zzi"

    .line 61
    .line 62
    const-class v7, Lcom/google/android/gms/internal/measurement/n;

    .line 63
    .line 64
    const-string v8, "zzj"

    .line 65
    .line 66
    const-class v9, Lcom/google/android/gms/internal/measurement/i;

    .line 67
    .line 68
    const-string v10, "zzk"

    .line 69
    .line 70
    const-class v11, Lcom/google/android/gms/internal/measurement/b;

    .line 71
    .line 72
    const-string v12, "zzl"

    .line 73
    .line 74
    const-string v13, "zzm"

    .line 75
    .line 76
    const-string v14, "zzn"

    .line 77
    .line 78
    const-class v15, Lcom/google/android/gms/internal/measurement/k0;

    .line 79
    .line 80
    const-string v16, "zzo"

    .line 81
    .line 82
    const-class v17, Lcom/google/android/gms/internal/measurement/h;

    .line 83
    .line 84
    const-string v18, "zzp"

    .line 85
    .line 86
    const-string v19, "zzq"

    .line 87
    .line 88
    const-string v20, "zzr"

    .line 89
    .line 90
    const-string v21, "zzs"

    .line 91
    .line 92
    const-string v22, "zzt"

    .line 93
    .line 94
    const-string v23, "zzu"

    .line 95
    .line 96
    const-string v24, "zzv"

    .line 97
    .line 98
    filled-new-array/range {v2 .. v24}, [Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    const-string v1, "\u0004\u0011\u0000\u0001\u0001\u0013\u0011\u0000\u0005\u0000\u0001\u1002\u0000\u0002\u1008\u0001\u0003\u1004\u0002\u0004\u001b\u0005\u001b\u0006\u001b\u0007\u1008\u0003\u0008\u1007\u0004\t\u001b\n\u001b\u000b\u1008\u0005\u000e\u1008\u0006\u000f\u1009\u0007\u0010\u1009\u0008\u0011\u1009\t\u0012\u1009\n\u0013\u1009\u000b"

    .line 103
    .line 104
    sget-object v2, Lcom/google/android/gms/internal/measurement/j;->zzc:Lcom/google/android/gms/internal/measurement/j;

    .line 105
    .line 106
    invoke-static {v2, v1, v0}, Lcom/google/android/gms/internal/measurement/u0;->m(Ll/m9y0;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    return-object v0

    .line 111
    :pswitch_5
    new-instance v0, Lcom/google/android/gms/internal/measurement/j$a;

    .line 112
    .line 113
    invoke-direct {v0, v2}, Lcom/google/android/gms/internal/measurement/j$a;-><init>(Ll/jnw0;)V

    .line 114
    .line 115
    .line 116
    return-object v0

    .line 117
    :pswitch_6
    new-instance v0, Lcom/google/android/gms/internal/measurement/j;

    .line 118
    .line 119
    invoke-direct {v0}, Lcom/google/android/gms/internal/measurement/j;-><init>()V

    .line 120
    .line 121
    .line 122
    return-object v0

    .line 123
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
