.class public Ll/fiw;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile a:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()Landroid/content/Context;
    .locals 1

    .line 1
    sget-object v0, Ll/fiw;->a:Landroid/content/Context;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ll/fiw;->a:Landroid/content/Context;

    .line 6
    .line 7
    return-object v0

    .line 8
    :cond_0
    const/16 v0, 0x34

    .line 9
    .line 10
    new-array v0, v0, [B

    .line 11
    .line 12
    fill-array-data v0, :array_0

    .line 13
    .line 14
    .line 15
    invoke-static {v0}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    return-object v0

    .line 24
    nop

    .line 25
    :array_0
    .array-data 1
        0x6bt
        0x2bt
        0x7ct
        0x62t
        0x28t
        0x22t
        0x6dt
        0x46t
        0x7ct
        0x74t
        0xet
        0x8t
        0x44t
        0x3t
        0x49t
        0x43t
        0x41t
        0x8t
        0x5ft
        0x12t
        0x11t
        0x5et
        0xft
        0xft
        0x44t
        0xft
        0x50t
        0x5bt
        0x8t
        0x1ct
        0x55t
        0x2t
        0x1ft
        0x17t
        0x22t
        0x7t
        0x5ct
        0xat
        0x11t
        0x5et
        0xft
        0xft
        0x44t
        0x4et
        0x18t
        0x17t
        0x7t
        0xft
        0x42t
        0x15t
        0x45t
        0x19t
    .end array-data
.end method

.method public static b(Landroid/content/Context;)V
    .locals 2

    .line 1
    if-eqz p0, :cond_2

    .line 2
    .line 3
    sget-object v0, Ll/fiw;->a:Landroid/content/Context;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const-class v0, Ll/fiw;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    :try_start_0
    sget-object v1, Ll/fiw;->a:Landroid/content/Context;

    .line 12
    .line 13
    if-nez v1, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    sput-object p0, Ll/fiw;->a:Landroid/content/Context;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception p0

    .line 23
    goto :goto_1

    .line 24
    :cond_1
    :goto_0
    monitor-exit v0

    .line 25
    return-void

    .line 26
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    throw p0

    .line 28
    :cond_2
    const/16 p0, 0x1e

    .line 29
    .line 30
    new-array p0, p0, [B

    .line 31
    .line 32
    fill-array-data p0, :array_0

    .line 33
    .line 34
    .line 35
    invoke-static {p0}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :array_0
    .array-data 1
        0x6bt
        0x2bt
        0x7ct
        0x62t
        0x28t
        0x22t
        0x6dt
        0x46t
        0x72t
        0x58t
        0xft
        0x12t
        0x55t
        0x1et
        0x45t
        0x17t
        0x2t
        0x7t
        0x5et
        0x8t
        0x5et
        0x43t
        0x41t
        0x4t
        0x55t
        0x46t
        0x5ft
        0x42t
        0xdt
        0xat
    .end array-data
.end method
