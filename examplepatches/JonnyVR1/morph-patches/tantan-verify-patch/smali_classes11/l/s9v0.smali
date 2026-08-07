.class public final Ll/s9v0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/k8u0;
.implements Ll/s6u0;


# static fields
.field public static final c:Ljava/lang/Object;

.field public static d:I


# instance fields
.field public final a:Ll/grw0;

.field public final b:Ll/cav0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/s9v0;->c:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Ll/cav0;Ll/grw0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/s9v0;->b:Ll/cav0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/s9v0;->a:Ll/grw0;

    .line 7
    .line 8
    return-void
.end method

.method private final a(Z)V
    .locals 4

    .line 1
    sget-object v0, Ll/sgs0;->j6:Ll/dgs0;

    .line 2
    .line 3
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object v0, p0, Ll/s9v0;->a:Ll/grw0;

    .line 21
    .line 22
    invoke-interface {v0}, Ll/grw0;->f()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    sget-object v0, Ll/s9v0;->c:Ljava/lang/Object;

    .line 29
    .line 30
    monitor-enter v0

    .line 31
    :try_start_0
    sget v1, Ll/s9v0;->d:I

    .line 32
    .line 33
    sget-object v2, Ll/sgs0;->k6:Ll/dgs0;

    .line 34
    .line 35
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-virtual {v3, v2}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    check-cast v2, Ljava/lang/Integer;

    .line 44
    .line 45
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 50
    if-ge v1, v2, :cond_1

    .line 51
    .line 52
    iget-object p0, p0, Ll/s9v0;->b:Ll/cav0;

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Ll/cav0;->e(Z)V

    .line 55
    .line 56
    .line 57
    monitor-enter v0

    .line 58
    :try_start_1
    sget p0, Ll/s9v0;->d:I

    .line 59
    .line 60
    add-int/lit8 p0, p0, 0x1

    .line 61
    .line 62
    sput p0, Ll/s9v0;->d:I

    .line 63
    .line 64
    monitor-exit v0

    .line 65
    return-void

    .line 66
    :catchall_0
    move-exception p0

    .line 67
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 68
    throw p0

    .line 69
    :catchall_1
    move-exception p0

    .line 70
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 71
    throw p0

    .line 72
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public final u(Lcom/google/android/gms/ads/internal/client/zze;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-direct {p0, p1}, Ll/s9v0;->a(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final zzr()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, v0}, Ll/s9v0;->a(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method
