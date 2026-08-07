.class public final Lcom/google/android/gms/internal/measurement/b;
.super Lcom/google/android/gms/internal/measurement/u0;
.source "SourceFile"

# interfaces
.implements Ll/v9y0;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/measurement/b$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/measurement/u0<",
        "Lcom/google/android/gms/internal/measurement/b;",
        "Lcom/google/android/gms/internal/measurement/b$a;",
        ">;",
        "Ll/v9y0;"
    }
.end annotation


# static fields
.field private static final zzc:Lcom/google/android/gms/internal/measurement/b;

.field private static volatile zzd:Ll/yay0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/yay0<",
            "Lcom/google/android/gms/internal/measurement/b;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private zze:I

.field private zzf:I

.field private zzg:Ll/i4y0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/i4y0<",
            "Lcom/google/android/gms/internal/measurement/e;",
            ">;"
        }
    .end annotation
.end field

.field private zzh:Ll/i4y0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/i4y0<",
            "Lcom/google/android/gms/internal/measurement/c;",
            ">;"
        }
    .end annotation
.end field

.field private zzi:Z

.field private zzj:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/measurement/b;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/gms/internal/measurement/b;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/gms/internal/measurement/b;->zzc:Lcom/google/android/gms/internal/measurement/b;

    .line 7
    .line 8
    const-class v1, Lcom/google/android/gms/internal/measurement/b;

    .line 9
    .line 10
    invoke-static {v1, v0}, Lcom/google/android/gms/internal/measurement/u0;->p(Ljava/lang/Class;Lcom/google/android/gms/internal/measurement/u0;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/measurement/u0;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/google/android/gms/internal/measurement/u0;->x()Ll/i4y0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/google/android/gms/internal/measurement/b;->zzg:Ll/i4y0;

    .line 9
    .line 10
    invoke-static {}, Lcom/google/android/gms/internal/measurement/u0;->x()Ll/i4y0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/google/android/gms/internal/measurement/b;->zzh:Ll/i4y0;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic C(Lcom/google/android/gms/internal/measurement/b;ILcom/google/android/gms/internal/measurement/c;)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/b;->zzh:Ll/i4y0;

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
    iput-object v0, p0, Lcom/google/android/gms/internal/measurement/b;->zzh:Ll/i4y0;

    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/b;->zzh:Ll/i4y0;

    .line 19
    .line 20
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic D(Lcom/google/android/gms/internal/measurement/b;ILcom/google/android/gms/internal/measurement/e;)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/b;->zzg:Ll/i4y0;

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
    iput-object v0, p0, Lcom/google/android/gms/internal/measurement/b;->zzg:Ll/i4y0;

    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/b;->zzg:Ll/i4y0;

    .line 19
    .line 20
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static bridge synthetic K()Lcom/google/android/gms/internal/measurement/b;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/measurement/b;->zzc:Lcom/google/android/gms/internal/measurement/b;

    return-object v0
.end method


# virtual methods
.method public final B(I)Lcom/google/android/gms/internal/measurement/c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/b;->zzh:Ll/i4y0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/google/android/gms/internal/measurement/c;

    .line 8
    .line 9
    return-object p0
.end method

.method public final E()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/b;->zzh:Ll/i4y0;

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

.method public final G(I)Lcom/google/android/gms/internal/measurement/e;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/b;->zzg:Ll/i4y0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/google/android/gms/internal/measurement/e;

    .line 8
    .line 9
    return-object p0
.end method

.method public final I()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/b;->zzg:Ll/i4y0;

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

.method public final L()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/measurement/c;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/b;->zzh:Ll/i4y0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final M()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/measurement/e;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/b;->zzg:Ll/i4y0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final N()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/google/android/gms/internal/measurement/b;->zze:I

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
    iget p0, p0, Lcom/google/android/gms/internal/measurement/b;->zzf:I

    .line 2
    .line 3
    return p0
.end method

.method public final k(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    .line 1
    sget-object p0, Lcom/google/android/gms/internal/measurement/a;->a:[I

    .line 2
    .line 3
    const/4 p2, 0x1

    .line 4
    sub-int/2addr p1, p2

    .line 5
    aget p0, p0, p1

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    packed-switch p0, :pswitch_data_0

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/l710;->a()V

    .line 12
    .line 13
    .line 14
    :pswitch_0
    return-object p1

    .line 15
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :pswitch_2
    sget-object p0, Lcom/google/android/gms/internal/measurement/b;->zzd:Ll/yay0;

    .line 21
    .line 22
    if-nez p0, :cond_1

    .line 23
    .line 24
    const-class p1, Lcom/google/android/gms/internal/measurement/b;

    .line 25
    .line 26
    monitor-enter p1

    .line 27
    :try_start_0
    sget-object p0, Lcom/google/android/gms/internal/measurement/b;->zzd:Ll/yay0;

    .line 28
    .line 29
    if-nez p0, :cond_0

    .line 30
    .line 31
    new-instance p0, Lcom/google/android/gms/internal/measurement/u0$a;

    .line 32
    .line 33
    sget-object p2, Lcom/google/android/gms/internal/measurement/b;->zzc:Lcom/google/android/gms/internal/measurement/b;

    .line 34
    .line 35
    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/measurement/u0$a;-><init>(Lcom/google/android/gms/internal/measurement/u0;)V

    .line 36
    .line 37
    .line 38
    sput-object p0, Lcom/google/android/gms/internal/measurement/b;->zzd:Ll/yay0;

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :catchall_0
    move-exception v0

    .line 42
    move-object p0, v0

    .line 43
    goto :goto_1

    .line 44
    :cond_0
    :goto_0
    monitor-exit p1

    .line 45
    return-object p0

    .line 46
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    throw p0

    .line 48
    :cond_1
    return-object p0

    .line 49
    :pswitch_3
    sget-object p0, Lcom/google/android/gms/internal/measurement/b;->zzc:Lcom/google/android/gms/internal/measurement/b;

    .line 50
    .line 51
    return-object p0

    .line 52
    :pswitch_4
    const-string v0, "zze"

    .line 53
    .line 54
    const-string v1, "zzf"

    .line 55
    .line 56
    const-string v2, "zzg"

    .line 57
    .line 58
    const-class v3, Lcom/google/android/gms/internal/measurement/e;

    .line 59
    .line 60
    const-string v4, "zzh"

    .line 61
    .line 62
    const-class v5, Lcom/google/android/gms/internal/measurement/c;

    .line 63
    .line 64
    const-string v6, "zzi"

    .line 65
    .line 66
    const-string v7, "zzj"

    .line 67
    .line 68
    filled-new-array/range {v0 .. v7}, [Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    const-string p1, "\u0004\u0005\u0000\u0001\u0001\u0005\u0005\u0000\u0002\u0000\u0001\u1004\u0000\u0002\u001b\u0003\u001b\u0004\u1007\u0001\u0005\u1007\u0002"

    .line 73
    .line 74
    sget-object p2, Lcom/google/android/gms/internal/measurement/b;->zzc:Lcom/google/android/gms/internal/measurement/b;

    .line 75
    .line 76
    invoke-static {p2, p1, p0}, Lcom/google/android/gms/internal/measurement/u0;->m(Ll/m9y0;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    return-object p0

    .line 81
    :pswitch_5
    new-instance p0, Lcom/google/android/gms/internal/measurement/b$a;

    .line 82
    .line 83
    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/measurement/b$a;-><init>(Ll/djw0;)V

    .line 84
    .line 85
    .line 86
    return-object p0

    .line 87
    :pswitch_6
    new-instance p0, Lcom/google/android/gms/internal/measurement/b;

    .line 88
    .line 89
    invoke-direct {p0}, Lcom/google/android/gms/internal/measurement/b;-><init>()V

    .line 90
    .line 91
    .line 92
    return-object p0

    .line 93
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
