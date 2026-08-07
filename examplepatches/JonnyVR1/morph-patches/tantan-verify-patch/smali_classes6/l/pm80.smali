.class public Ll/pm80;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile c:Ll/pm80;


# instance fields
.field public a:Ll/of20;

.field public b:Ll/u8c;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/of20;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/of20;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/pm80;->a:Ll/of20;

    .line 10
    .line 11
    new-instance v0, Ll/u8c;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/u8c;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/pm80;->b:Ll/u8c;

    .line 17
    .line 18
    return-void
.end method

.method public static b()Ll/pm80;
    .locals 2

    .line 1
    sget-object v0, Ll/pm80;->c:Ll/pm80;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/pm80;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/pm80;->c:Ll/pm80;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/pm80;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/pm80;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/pm80;->c:Ll/pm80;

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
    sget-object v0, Ll/pm80;->c:Ll/pm80;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    invoke-static {}, Ll/cmg;->s()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/pm80;->b:Ll/u8c;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/p7;->j()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object p0, p0, Ll/pm80;->a:Ll/of20;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/p7;->j()V

    .line 16
    .line 17
    .line 18
    return-void
.end method
