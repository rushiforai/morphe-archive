.class public final Lcom/google/android/gms/internal/play_billing/v;
.super Lcom/google/android/gms/internal/play_billing/d0;
.source "SourceFile"

# interfaces
.implements Ll/dwx0;


# static fields
.field private static final zzb:Lcom/google/android/gms/internal/play_billing/v;


# instance fields
.field private zzd:I

.field private zze:Lcom/google/android/gms/internal/play_billing/x;

.field private zzf:Lcom/google/android/gms/internal/play_billing/x;

.field private zzg:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/play_billing/v;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/gms/internal/play_billing/v;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/gms/internal/play_billing/v;->zzb:Lcom/google/android/gms/internal/play_billing/v;

    .line 7
    .line 8
    const-class v1, Lcom/google/android/gms/internal/play_billing/v;

    .line 9
    .line 10
    invoke-static {v1, v0}, Lcom/google/android/gms/internal/play_billing/d0;->v(Ljava/lang/Class;Lcom/google/android/gms/internal/play_billing/d0;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/play_billing/d0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic A(Lcom/google/android/gms/internal/play_billing/v;Lcom/google/android/gms/internal/play_billing/x;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/gms/internal/play_billing/v;->zze:Lcom/google/android/gms/internal/play_billing/x;

    .line 5
    .line 6
    iget p1, p0, Lcom/google/android/gms/internal/play_billing/v;->zzd:I

    .line 7
    .line 8
    or-int/lit8 p1, p1, 0x1

    .line 9
    .line 10
    iput p1, p0, Lcom/google/android/gms/internal/play_billing/v;->zzd:I

    .line 11
    .line 12
    return-void
.end method

.method public static y()Ll/saw0;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/play_billing/v;->zzb:Lcom/google/android/gms/internal/play_billing/v;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/internal/play_billing/d0;->j()Ll/oox0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/saw0;

    .line 8
    .line 9
    return-object v0
.end method

.method public static bridge synthetic z()Lcom/google/android/gms/internal/play_billing/v;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/play_billing/v;->zzb:Lcom/google/android/gms/internal/play_billing/v;

    return-object v0
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
    sget-object p0, Lcom/google/android/gms/internal/play_billing/v;->zzb:Lcom/google/android/gms/internal/play_billing/v;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_1
    new-instance p0, Ll/saw0;

    .line 23
    .line 24
    invoke-direct {p0, p2}, Ll/saw0;-><init>(Ll/bfw0;)V

    .line 25
    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_2
    new-instance p0, Lcom/google/android/gms/internal/play_billing/v;

    .line 29
    .line 30
    invoke-direct {p0}, Lcom/google/android/gms/internal/play_billing/v;-><init>()V

    .line 31
    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_3
    const-string p0, "zzg"

    .line 35
    .line 36
    invoke-static {}, Ll/fkw0;->a()Ll/grx0;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    const-string p2, "zzd"

    .line 41
    .line 42
    const-string p3, "zze"

    .line 43
    .line 44
    const-string v0, "zzf"

    .line 45
    .line 46
    filled-new-array {p2, p3, v0, p0, p1}, [Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    sget-object p1, Lcom/google/android/gms/internal/play_billing/v;->zzb:Lcom/google/android/gms/internal/play_billing/v;

    .line 51
    .line 52
    const-string p2, "\u0004\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001\u1009\u0000\u0002\u1009\u0001\u0003\u180c\u0002"

    .line 53
    .line 54
    invoke-static {p1, p2, p0}, Lcom/google/android/gms/internal/play_billing/d0;->s(Ll/yvx0;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0

    .line 59
    :cond_4
    const/4 p0, 0x1

    .line 60
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0
.end method
