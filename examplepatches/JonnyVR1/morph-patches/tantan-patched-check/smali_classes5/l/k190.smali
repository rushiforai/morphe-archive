.class public Ll/k190;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static g:Ll/k190;


# instance fields
.field public a:Z

.field public b:Z

.field public c:Z

.field public d:Z

.field public e:Z

.field public f:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/k190;->a:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/k190;->b:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Ll/k190;->c:Z

    .line 10
    .line 11
    iput-boolean v0, p0, Ll/k190;->d:Z

    .line 12
    .line 13
    iput-boolean v0, p0, Ll/k190;->e:Z

    .line 14
    .line 15
    iput-boolean v0, p0, Ll/k190;->f:Z

    .line 16
    .line 17
    return-void
.end method

.method public static a()Ll/k190;
    .locals 2

    .line 1
    sget-object v0, Ll/k190;->g:Ll/k190;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/p1/mobile/putong/core/ui/match/b;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/k190;->g:Ll/k190;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/k190;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/k190;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/k190;->g:Ll/k190;

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
    sget-object v0, Ll/k190;->g:Ll/k190;

    .line 27
    .line 28
    return-object v0
.end method

.method public static b()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-object v0, Ll/k190;->g:Ll/k190;

    .line 3
    .line 4
    return-void
.end method
