.class public Ll/nh00;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile g:Ll/nh00;


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

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
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/nh00;->a:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Ll/nh00;->b:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Ll/nh00;->c:Ljava/lang/String;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Ll/nh00;->d:Z

    .line 14
    .line 15
    iput-boolean v0, p0, Ll/nh00;->e:Z

    .line 16
    .line 17
    iput-boolean v0, p0, Ll/nh00;->f:Z

    .line 18
    .line 19
    return-void
.end method

.method public static a()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-object v0, Ll/nh00;->g:Ll/nh00;

    .line 3
    .line 4
    return-void
.end method

.method public static b()Ll/nh00;
    .locals 2

    .line 1
    sget-object v0, Ll/nh00;->g:Ll/nh00;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/nh00;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/nh00;->g:Ll/nh00;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/nh00;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/nh00;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/nh00;->g:Ll/nh00;

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
    sget-object v0, Ll/nh00;->g:Ll/nh00;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nh00;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nh00;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/nh00;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/nh00;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public g()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/nh00;->f:Z

    .line 2
    .line 3
    return p0
.end method
