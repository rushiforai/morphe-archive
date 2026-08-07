.class public Ll/mpc0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static volatile e:Ll/mpc0;


# instance fields
.field private a:F

.field private b:F

.field private c:F

.field private d:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/mpc0;->a:F

    .line 6
    .line 7
    iput v0, p0, Ll/mpc0;->b:F

    .line 8
    .line 9
    iput v0, p0, Ll/mpc0;->c:F

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Ll/mpc0;->d:Z

    .line 13
    .line 14
    return-void
.end method

.method public static a()Ll/mpc0;
    .locals 2

    .line 1
    sget-object v0, Ll/mpc0;->e:Ll/mpc0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/mpc0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/mpc0;->e:Ll/mpc0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/mpc0;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/mpc0;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/mpc0;->e:Ll/mpc0;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/mpc0;->e:Ll/mpc0;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public b(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/mpc0;->b:F

    .line 2
    .line 3
    return-void
.end method

.method public c(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/mpc0;->d:Z

    .line 2
    .line 3
    return-void
.end method

.method public d(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/mpc0;->c:F

    .line 2
    .line 3
    return-void
.end method
