.class public final Lcom/google/android/gms/internal/play_billing/r0;
.super Lcom/google/android/gms/internal/play_billing/d0;
.source "SourceFile"

# interfaces
.implements Ll/dwx0;


# static fields
.field private static final zzb:Lcom/google/android/gms/internal/play_billing/r0;


# instance fields
.field private zzd:I

.field private zze:Ljava/lang/String;

.field private zzf:Ljava/lang/String;

.field private zzg:I

.field private zzh:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/play_billing/r0;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/gms/internal/play_billing/r0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/gms/internal/play_billing/r0;->zzb:Lcom/google/android/gms/internal/play_billing/r0;

    .line 7
    .line 8
    const-class v1, Lcom/google/android/gms/internal/play_billing/r0;

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
    iput-object v0, p0, Lcom/google/android/gms/internal/play_billing/r0;->zze:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/google/android/gms/internal/play_billing/r0;->zzf:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic A(Lcom/google/android/gms/internal/play_billing/r0;J)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/play_billing/r0;->zzd:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/google/android/gms/internal/play_billing/r0;->zzd:I

    iput-wide p1, p0, Lcom/google/android/gms/internal/play_billing/r0;->zzh:J

    return-void
.end method

.method public static synthetic B(Lcom/google/android/gms/internal/play_billing/r0;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/google/android/gms/internal/play_billing/r0;->zzd:I

    .line 5
    .line 6
    or-int/lit8 v0, v0, 0x2

    .line 7
    .line 8
    iput v0, p0, Lcom/google/android/gms/internal/play_billing/r0;->zzd:I

    .line 9
    .line 10
    iput-object p1, p0, Lcom/google/android/gms/internal/play_billing/r0;->zzf:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic C(Lcom/google/android/gms/internal/play_billing/r0;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/google/android/gms/internal/play_billing/r0;->zzd:I

    .line 5
    .line 6
    or-int/lit8 v0, v0, 0x1

    .line 7
    .line 8
    iput v0, p0, Lcom/google/android/gms/internal/play_billing/r0;->zzd:I

    .line 9
    .line 10
    iput-object p1, p0, Lcom/google/android/gms/internal/play_billing/r0;->zze:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method

.method public static D()Ll/e7y0;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/play_billing/r0;->zzb:Lcom/google/android/gms/internal/play_billing/r0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/internal/play_billing/d0;->j()Ll/oox0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/e7y0;

    .line 8
    .line 9
    return-object v0
.end method

.method public static bridge synthetic y()Lcom/google/android/gms/internal/play_billing/r0;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/play_billing/r0;->zzb:Lcom/google/android/gms/internal/play_billing/r0;

    return-object v0
.end method

.method public static synthetic z(Lcom/google/android/gms/internal/play_billing/r0;I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/play_billing/r0;->zzd:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/google/android/gms/internal/play_billing/r0;->zzd:I

    iput p1, p0, Lcom/google/android/gms/internal/play_billing/r0;->zzg:I

    return-void
.end method


# virtual methods
.method public final h(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

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
    sget-object p0, Lcom/google/android/gms/internal/play_billing/r0;->zzb:Lcom/google/android/gms/internal/play_billing/r0;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_1
    new-instance p0, Ll/e7y0;

    .line 23
    .line 24
    invoke-direct {p0, p2}, Ll/e7y0;-><init>(Ll/j7y0;)V

    .line 25
    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_2
    new-instance p0, Lcom/google/android/gms/internal/play_billing/r0;

    .line 29
    .line 30
    invoke-direct {p0}, Lcom/google/android/gms/internal/play_billing/r0;-><init>()V

    .line 31
    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_3
    const-string p0, "zzg"

    .line 35
    .line 36
    const-string p1, "zzh"

    .line 37
    .line 38
    const-string p2, "zzd"

    .line 39
    .line 40
    const-string p3, "zze"

    .line 41
    .line 42
    const-string v0, "zzf"

    .line 43
    .line 44
    filled-new-array {p2, p3, v0, p0, p1}, [Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    sget-object p1, Lcom/google/android/gms/internal/play_billing/r0;->zzb:Lcom/google/android/gms/internal/play_billing/r0;

    .line 49
    .line 50
    const-string p2, "\u0004\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0000\u0000\u0001\u1008\u0000\u0002\u1008\u0001\u0003\u1004\u0002\u0004\u1002\u0003"

    .line 51
    .line 52
    invoke-static {p1, p2, p0}, Lcom/google/android/gms/internal/play_billing/d0;->s(Ll/yvx0;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0

    .line 57
    :cond_4
    const/4 p0, 0x1

    .line 58
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method
