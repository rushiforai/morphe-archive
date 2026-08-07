.class public final Lcom/google/android/gms/internal/play_billing/m0;
.super Lcom/google/android/gms/internal/play_billing/d0;
.source "SourceFile"

# interfaces
.implements Ll/dwx0;


# static fields
.field private static final zzb:Lcom/google/android/gms/internal/play_billing/m0;


# instance fields
.field private zzd:I

.field private zze:I

.field private zzf:Ljava/lang/Object;

.field private zzg:I

.field private zzh:Lcom/google/android/gms/internal/play_billing/o0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/play_billing/m0;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/gms/internal/play_billing/m0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/gms/internal/play_billing/m0;->zzb:Lcom/google/android/gms/internal/play_billing/m0;

    .line 7
    .line 8
    const-class v1, Lcom/google/android/gms/internal/play_billing/m0;

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
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/google/android/gms/internal/play_billing/m0;->zze:I

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic A(Lcom/google/android/gms/internal/play_billing/m0;Lcom/google/android/gms/internal/play_billing/o0;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/gms/internal/play_billing/m0;->zzh:Lcom/google/android/gms/internal/play_billing/o0;

    .line 5
    .line 6
    iget p1, p0, Lcom/google/android/gms/internal/play_billing/m0;->zzd:I

    .line 7
    .line 8
    or-int/lit8 p1, p1, 0x2

    .line 9
    .line 10
    iput p1, p0, Lcom/google/android/gms/internal/play_billing/m0;->zzd:I

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic B(Lcom/google/android/gms/internal/play_billing/m0;Lcom/google/android/gms/internal/play_billing/t0;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/gms/internal/play_billing/m0;->zzf:Ljava/lang/Object;

    .line 5
    .line 6
    const/4 p1, 0x4

    .line 7
    iput p1, p0, Lcom/google/android/gms/internal/play_billing/m0;->zze:I

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic C(Lcom/google/android/gms/internal/play_billing/m0;I)V
    .locals 0

    .line 1
    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/google/android/gms/internal/play_billing/m0;->zzg:I

    iget p1, p0, Lcom/google/android/gms/internal/play_billing/m0;->zzd:I

    or-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/google/android/gms/internal/play_billing/m0;->zzd:I

    return-void
.end method

.method public static D()Ll/t2y0;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/play_billing/m0;->zzb:Lcom/google/android/gms/internal/play_billing/m0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/internal/play_billing/d0;->j()Ll/oox0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/t2y0;

    .line 8
    .line 9
    return-object v0
.end method

.method public static bridge synthetic y()Lcom/google/android/gms/internal/play_billing/m0;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/play_billing/m0;->zzb:Lcom/google/android/gms/internal/play_billing/m0;

    return-object v0
.end method

.method public static z([BLl/dex0;)Lcom/google/android/gms/internal/play_billing/m0;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/play_billing/zzhr;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/play_billing/m0;->zzb:Lcom/google/android/gms/internal/play_billing/m0;

    .line 2
    .line 3
    invoke-static {v0, p0, p1}, Lcom/google/android/gms/internal/play_billing/d0;->n(Lcom/google/android/gms/internal/play_billing/d0;[BLl/dex0;)Lcom/google/android/gms/internal/play_billing/d0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/google/android/gms/internal/play_billing/m0;

    .line 8
    .line 9
    return-object p0
.end method


# virtual methods
.method public final h(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

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
    sget-object p0, Lcom/google/android/gms/internal/play_billing/m0;->zzb:Lcom/google/android/gms/internal/play_billing/m0;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_1
    new-instance p0, Ll/t2y0;

    .line 23
    .line 24
    invoke-direct {p0, p2}, Ll/t2y0;-><init>(Ll/y2y0;)V

    .line 25
    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_2
    new-instance p0, Lcom/google/android/gms/internal/play_billing/m0;

    .line 29
    .line 30
    invoke-direct {p0}, Lcom/google/android/gms/internal/play_billing/m0;-><init>()V

    .line 31
    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_3
    sget-object v4, Ll/b4y0;->a:Ll/grx0;

    .line 35
    .line 36
    const-string v5, "zzh"

    .line 37
    .line 38
    const-class v6, Lcom/google/android/gms/internal/play_billing/t0;

    .line 39
    .line 40
    const-string v0, "zzf"

    .line 41
    .line 42
    const-string v1, "zze"

    .line 43
    .line 44
    const-string v2, "zzd"

    .line 45
    .line 46
    const-string v3, "zzg"

    .line 47
    .line 48
    filled-new-array/range {v0 .. v6}, [Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    sget-object p1, Lcom/google/android/gms/internal/play_billing/m0;->zzb:Lcom/google/android/gms/internal/play_billing/m0;

    .line 53
    .line 54
    const-string p2, "\u0004\u0003\u0001\u0001\u0001\u0004\u0003\u0000\u0000\u0000\u0001\u180c\u0000\u0002\u1009\u0001\u0004<\u0000"

    .line 55
    .line 56
    invoke-static {p1, p2, p0}, Lcom/google/android/gms/internal/play_billing/d0;->s(Ll/yvx0;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0

    .line 61
    :cond_4
    const/4 p0, 0x1

    .line 62
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    return-object p0
.end method
