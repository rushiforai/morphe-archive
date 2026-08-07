.class public Ll/c5r0;
.super Ljava/lang/Object;


# static fields
.field private static volatile a:Ll/r5r0;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()Landroid/os/HandlerThread;
    .locals 3

    .line 1
    sget-object v0, Ll/c5r0;->a:Ll/r5r0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/c5r0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/c5r0;->a:Ll/r5r0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/r5r0;

    .line 13
    .line 14
    const-string v2, "default_npth_thread"

    .line 15
    .line 16
    invoke-direct {v1, v2}, Ll/r5r0;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Ll/c5r0;->a:Ll/r5r0;

    .line 20
    .line 21
    sget-object v1, Ll/c5r0;->a:Ll/r5r0;

    .line 22
    .line 23
    invoke-virtual {v1}, Ll/r5r0;->i()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catchall_0
    move-exception v1

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    :goto_0
    monitor-exit v0

    .line 30
    goto :goto_2

    .line 31
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    throw v1

    .line 33
    :cond_1
    :goto_2
    sget-object v0, Ll/c5r0;->a:Ll/r5r0;

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/r5r0;->l()Landroid/os/HandlerThread;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    return-object v0
.end method

.method public static b()Ll/r5r0;
    .locals 1

    .line 1
    sget-object v0, Ll/c5r0;->a:Ll/r5r0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/c5r0;->a()Landroid/os/HandlerThread;

    .line 6
    .line 7
    .line 8
    :cond_0
    sget-object v0, Ll/c5r0;->a:Ll/r5r0;

    .line 9
    .line 10
    return-object v0
.end method
