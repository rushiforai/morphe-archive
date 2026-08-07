.class public final Lcom/google/android/gms/internal/play_billing/q0;
.super Lcom/google/android/gms/internal/play_billing/d0;
.source "SourceFile"

# interfaces
.implements Ll/dwx0;


# static fields
.field private static final zzb:Lcom/google/android/gms/internal/play_billing/q0;


# instance fields
.field private zzd:I

.field private zze:Ljava/lang/String;

.field private zzf:I

.field private zzg:Ll/krx0;

.field private zzh:Ll/orx0;

.field private zzi:Lcom/google/android/gms/internal/play_billing/o0;

.field private zzj:Z

.field private zzk:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/play_billing/q0;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/gms/internal/play_billing/q0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/gms/internal/play_billing/q0;->zzb:Lcom/google/android/gms/internal/play_billing/q0;

    .line 7
    .line 8
    const-class v1, Lcom/google/android/gms/internal/play_billing/q0;

    .line 9
    .line 10
    invoke-static {v1, v0}, Lcom/google/android/gms/internal/play_billing/d0;->v(Ljava/lang/Class;Lcom/google/android/gms/internal/play_billing/d0;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/play_billing/d0;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/google/android/gms/internal/play_billing/q0;->zze:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/d0;->o()Ll/krx0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/google/android/gms/internal/play_billing/q0;->zzg:Ll/krx0;

    .line 13
    .line 14
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/d0;->q()Ll/orx0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Lcom/google/android/gms/internal/play_billing/q0;->zzh:Ll/orx0;

    .line 19
    .line 20
    return-void
.end method

.method public static bridge synthetic y()Lcom/google/android/gms/internal/play_billing/q0;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/play_billing/q0;->zzb:Lcom/google/android/gms/internal/play_billing/q0;

    return-object v0
.end method


# virtual methods
.method public final h(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 11

    .line 1
    add-int/lit8 p1, p1, -0x1

    .line 2
    .line 3
    if-eqz p1, :cond_4

    .line 4
    .line 5
    const/4 p0, 0x2

    .line 6
    if-eq p1, p0, :cond_3

    .line 7
    .line 8
    const/4 p0, 0x3

    .line 9
    if-eq p1, p0, :cond_2

    .line 10
    .line 11
    const/4 p0, 0x4

    .line 12
    const/4 p2, 0x0

    .line 13
    if-eq p1, p0, :cond_1

    .line 14
    .line 15
    const/4 p0, 0x5

    .line 16
    if-eq p1, p0, :cond_0

    .line 17
    .line 18
    return-object p2

    .line 19
    :cond_0
    sget-object p0, Lcom/google/android/gms/internal/play_billing/q0;->zzb:Lcom/google/android/gms/internal/play_billing/q0;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_1
    new-instance p0, Ll/l6y0;

    .line 23
    .line 24
    invoke-direct {p0, p2}, Ll/l6y0;-><init>(Ll/v6y0;)V

    .line 25
    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_2
    new-instance p0, Lcom/google/android/gms/internal/play_billing/q0;

    .line 29
    .line 30
    invoke-direct {p0}, Lcom/google/android/gms/internal/play_billing/q0;-><init>()V

    .line 31
    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_3
    sget-object v3, Ll/q6y0;->a:Ll/grx0;

    .line 35
    .line 36
    sget-object v5, Ll/c6y0;->a:Ll/grx0;

    .line 37
    .line 38
    const-string v9, "zzj"

    .line 39
    .line 40
    const-string v10, "zzk"

    .line 41
    .line 42
    const-string v0, "zzd"

    .line 43
    .line 44
    const-string v1, "zze"

    .line 45
    .line 46
    const-string v2, "zzf"

    .line 47
    .line 48
    const-string v4, "zzg"

    .line 49
    .line 50
    const-string v6, "zzh"

    .line 51
    .line 52
    const-class v7, Lcom/google/android/gms/internal/play_billing/x0;

    .line 53
    .line 54
    const-string v8, "zzi"

    .line 55
    .line 56
    filled-new-array/range {v0 .. v10}, [Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    sget-object p1, Lcom/google/android/gms/internal/play_billing/q0;->zzb:Lcom/google/android/gms/internal/play_billing/q0;

    .line 61
    .line 62
    const-string p2, "\u0004\u0007\u0000\u0001\u0001\u0007\u0007\u0000\u0002\u0000\u0001\u1008\u0000\u0002\u180c\u0001\u0003\u082c\u0004\u001b\u0005\u1009\u0002\u0006\u1007\u0003\u0007\u1007\u0004"

    .line 63
    .line 64
    invoke-static {p1, p2, p0}, Lcom/google/android/gms/internal/play_billing/d0;->s(Ll/yvx0;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0

    .line 69
    :cond_4
    const/4 p0, 0x1

    .line 70
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    return-object p0
.end method
