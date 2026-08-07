.class public Ll/i1;
.super Ll/c610;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/c610<",
        "Lcom/tantanapp/beatles/v2/data/MonitorEvent;",
        ">;"
    }
.end annotation


# instance fields
.field public d:I

.field public e:Z

.field public f:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x1

    .line 11
    invoke-direct {p0, v0}, Ll/i1;-><init>(Z)V

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/c610;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x1b58

    .line 5
    .line 6
    iput v0, p0, Ll/i1;->d:I

    .line 7
    .line 8
    iput-boolean p1, p0, Ll/i1;->e:Z

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "anr"

    .line 2
    .line 3
    return-object p0
.end method

.method public b()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/i1;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Ll/c610;->c:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/g1;->d()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public c()Ljava/lang/String;
    .locals 3
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Ll/c610;->c()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "/"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/i1;->getEventType()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/i1;->a()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public d()Ll/x2f;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-boolean p0, p0, Ll/i1;->f:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/c1;->d()Ll/c1;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-static {}, Ll/mod;->c()Ll/mod;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public e()Ll/k5f;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/i1;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance p0, Ll/d1;

    .line 6
    .line 7
    invoke-direct {p0}, Ll/d1;-><init>()V

    .line 8
    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    new-instance v0, Ll/i1$a;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/i1$a;-><init>(Ll/i1;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public g(Landroid/content/Context;Ll/x3f;)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2}, Ll/c610;->g(Landroid/content/Context;Ll/x3f;)V

    .line 2
    .line 3
    .line 4
    iget-boolean p2, p0, Ll/i1;->e:Z

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    new-instance p2, Lcom/tantanapp/beatles/anrmonitor/a;

    .line 10
    .line 11
    iget v1, p0, Ll/i1;->d:I

    .line 12
    .line 13
    invoke-direct {p2, p1, v1, p0}, Lcom/tantanapp/beatles/anrmonitor/a;-><init>(Landroid/content/Context;ILl/i1;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p2}, Lcom/tantanapp/beatles/anrmonitor/a;->c()Lcom/tantanapp/beatles/anrmonitor/a;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p2}, Ljava/lang/Thread;->start()V

    .line 20
    .line 21
    .line 22
    iput-boolean v0, p0, Ll/c610;->c:Z

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-virtual {p0}, Ll/i1;->c()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    new-instance v1, Ljava/io/File;

    .line 30
    .line 31
    invoke-direct {v1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-nez v2, :cond_1

    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 41
    .line 42
    .line 43
    :cond_1
    iput-boolean v0, p0, Ll/i1;->f:Z

    .line 44
    .line 45
    invoke-static {p1, p0, p2}, Ll/g1;->f(Landroid/content/Context;Ll/i1;Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    iput-boolean p1, p0, Ll/c610;->c:Z

    .line 50
    .line 51
    return-void
.end method

.method public getEventType()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "crash"

    .line 2
    .line 3
    return-object p0
.end method
