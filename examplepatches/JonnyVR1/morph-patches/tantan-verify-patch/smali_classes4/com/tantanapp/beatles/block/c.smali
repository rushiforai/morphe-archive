.class public Lcom/tantanapp/beatles/block/c;
.super Ll/c610;
.source "SourceFile"


# instance fields
.field public d:Ll/e43;

.field public e:Z

.field public f:Lcom/tantanapp/beatles/block/BlockBaseStrategy;

.field public g:Z

.field public h:Z

.field public i:I

.field public volatile j:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/c610;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/tantanapp/beatles/block/c;->i:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lcom/tantanapp/beatles/block/c;->j:Z

    .line 9
    .line 10
    new-instance v0, Ll/e43;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/e43;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/tantanapp/beatles/block/c;->d:Ll/e43;

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Ll/e43;)V
    .locals 1

    .line 18
    invoke-direct {p0}, Ll/c610;-><init>()V

    const/4 v0, -0x1

    .line 19
    iput v0, p0, Lcom/tantanapp/beatles/block/c;->i:I

    const/4 v0, 0x0

    .line 20
    iput-boolean v0, p0, Lcom/tantanapp/beatles/block/c;->j:Z

    .line 21
    iput-object p1, p0, Lcom/tantanapp/beatles/block/c;->d:Ll/e43;

    return-void
.end method

.method public static synthetic k(Lcom/tantanapp/beatles/block/c;)Lcom/tantanapp/beatles/block/BlockBaseStrategy;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/block/c;->f:Lcom/tantanapp/beatles/block/BlockBaseStrategy;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 2

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
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/c;->getEventType()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public d()Ll/x2f;
    .locals 0

    .line 1
    invoke-static {}, Ll/mod;->c()Ll/mod;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public e()Ll/k5f;
    .locals 1

    .line 1
    new-instance v0, Lcom/tantanapp/beatles/block/c$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tantanapp/beatles/block/c$a;-><init>(Lcom/tantanapp/beatles/block/c;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public f()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/block/c;->f:Lcom/tantanapp/beatles/block/BlockBaseStrategy;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->n()Lcom/tantanapp/beatles/block/MessageHelper$MessageUnit;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    new-instance v0, Lcom/google/gson/Gson;

    .line 10
    .line 11
    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p0}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

.method public g(Landroid/content/Context;Ll/x3f;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Ll/c610;->g(Landroid/content/Context;Ll/x3f;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/tantanapp/beatles/block/c;->d:Ll/e43;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/e43;->j()Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_0
    iget-object p1, p0, Lcom/tantanapp/beatles/block/c;->d:Ll/e43;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/e43;->i()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    new-instance p1, Lcom/tantanapp/beatles/block/b;

    .line 22
    .line 23
    iget-object p2, p0, Lcom/tantanapp/beatles/block/c;->d:Ll/e43;

    .line 24
    .line 25
    invoke-direct {p1, p0, p2}, Lcom/tantanapp/beatles/block/b;-><init>(Lcom/tantanapp/beatles/block/c;Ll/e43;)V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Lcom/tantanapp/beatles/block/c;->f:Lcom/tantanapp/beatles/block/BlockBaseStrategy;

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    new-instance p1, Lcom/tantanapp/beatles/block/a;

    .line 32
    .line 33
    iget-object p2, p0, Lcom/tantanapp/beatles/block/c;->d:Ll/e43;

    .line 34
    .line 35
    invoke-direct {p1, p0, p2}, Lcom/tantanapp/beatles/block/a;-><init>(Lcom/tantanapp/beatles/block/c;Ll/e43;)V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Lcom/tantanapp/beatles/block/c;->f:Lcom/tantanapp/beatles/block/BlockBaseStrategy;

    .line 39
    .line 40
    :goto_0
    iget-object p1, p0, Lcom/tantanapp/beatles/block/c;->d:Ll/e43;

    .line 41
    .line 42
    invoke-virtual {p1}, Ll/e43;->g()Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-eqz p1, :cond_2

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/c;->q()V

    .line 49
    .line 50
    .line 51
    :cond_2
    const/4 p1, 0x1

    .line 52
    iput-boolean p1, p0, Ll/c610;->c:Z

    .line 53
    .line 54
    iget-object p2, p0, Lcom/tantanapp/beatles/block/c;->d:Ll/e43;

    .line 55
    .line 56
    invoke-virtual {p2}, Ll/e43;->h()Z

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    if-eqz p2, :cond_4

    .line 61
    .line 62
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 63
    .line 64
    const/16 v0, 0x1a

    .line 65
    .line 66
    if-eq p2, v0, :cond_3

    .line 67
    .line 68
    const/16 v0, 0x1b

    .line 69
    .line 70
    if-ne p2, v0, :cond_4

    .line 71
    .line 72
    :cond_3
    invoke-static {}, Ll/wgl;->c()Landroid/os/Handler;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    if-eqz p2, :cond_4

    .line 77
    .line 78
    iput-boolean p1, p0, Lcom/tantanapp/beatles/block/c;->h:Z

    .line 79
    .line 80
    :cond_4
    :goto_1
    return-void
.end method

.method public getEventType()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "block"

    .line 2
    .line 3
    return-object p0
.end method

.method public final l(Ljava/lang/String;)I
    .locals 3

    .line 1
    const-string p0, "_"

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 p1, 0x0

    .line 8
    aget-object v0, p0, p1

    .line 9
    .line 10
    array-length v1, p0

    .line 11
    const/4 v2, 0x2

    .line 12
    if-ne v1, v2, :cond_1

    .line 13
    .line 14
    :try_start_0
    invoke-static {v0}, Ll/p8c;->g(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    const/4 p1, 0x1

    .line 21
    aget-object p0, p0, p1

    .line 22
    .line 23
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 28
    .line 29
    .line 30
    move-result p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    return p0

    .line 32
    :cond_0
    return p1

    .line 33
    :catch_0
    const/16 p0, 0x64

    .line 34
    .line 35
    return p0

    .line 36
    :cond_1
    return p1
.end method

.method public m()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tantanapp/beatles/block/c;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method public final n()Z
    .locals 3

    .line 1
    iget v0, p0, Lcom/tantanapp/beatles/block/c;->i:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-static {}, Ll/du2;->e()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/c;->getEventType()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const-string v2, ""

    .line 15
    .line 16
    invoke-static {v0, v1, v2}, Ll/fq80;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Lcom/tantanapp/beatles/block/c;->l(Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iput v0, p0, Lcom/tantanapp/beatles/block/c;->i:I

    .line 25
    .line 26
    :cond_0
    iget v0, p0, Lcom/tantanapp/beatles/block/c;->i:I

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/c;->o()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-ge v0, v1, :cond_1

    .line 33
    .line 34
    const/4 v0, 0x1

    .line 35
    goto :goto_0

    .line 36
    :cond_1
    const/4 v0, 0x0

    .line 37
    :goto_0
    iput-boolean v0, p0, Lcom/tantanapp/beatles/block/c;->j:Z

    .line 38
    .line 39
    iget-boolean p0, p0, Lcom/tantanapp/beatles/block/c;->j:Z

    .line 40
    .line 41
    return p0
.end method

.method public o()I
    .locals 0

    .line 1
    const/16 p0, 0x14

    return p0
.end method

.method public final p()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/tantanapp/beatles/block/c;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Lcom/tantanapp/beatles/block/c$b;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Lcom/tantanapp/beatles/block/c$b;-><init>(Lcom/tantanapp/beatles/block/c;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/os/Looper;->setMessageLogging(Landroid/util/Printer;)V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    iput-boolean v0, p0, Lcom/tantanapp/beatles/block/c;->e:Z

    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public q()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/tantanapp/beatles/block/c;->g:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/c;->n()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/tantanapp/beatles/block/c;->f:Lcom/tantanapp/beatles/block/BlockBaseStrategy;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->q()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/c;->p()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public r()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/tantanapp/beatles/block/c;->g:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/c610;->h()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/tantanapp/beatles/block/c;->d:Ll/e43;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/e43;->g()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/c;->q()V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/tantanapp/beatles/block/c;->f:Lcom/tantanapp/beatles/block/BlockBaseStrategy;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->t()V

    .line 28
    .line 29
    .line 30
    :cond_1
    :goto_0
    return-void
.end method
