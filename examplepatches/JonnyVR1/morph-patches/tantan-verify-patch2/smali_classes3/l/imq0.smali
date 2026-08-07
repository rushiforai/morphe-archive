.class public Ll/imq0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile b:Ll/imq0;


# instance fields
.field public a:Lcom/p1/mobile/putong/data/XmlMonitorConfig;


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

.method public static a()Ll/imq0;
    .locals 2

    .line 1
    sget-object v0, Ll/imq0;->b:Ll/imq0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/imq0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/imq0;->b:Ll/imq0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/imq0;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/imq0;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/imq0;->b:Ll/imq0;

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
    sget-object v0, Ll/imq0;->b:Ll/imq0;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public b()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public c()I
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/imq0;->a:Lcom/p1/mobile/putong/data/XmlMonitorConfig;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/imq0;->a:Lcom/p1/mobile/putong/data/XmlMonitorConfig;

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/data/XmlMonitorConfig;->xml_monitor_cons_min:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    return p0

    .line 14
    :catch_0
    :cond_0
    const/4 p0, 0x5

    .line 15
    return p0
.end method
