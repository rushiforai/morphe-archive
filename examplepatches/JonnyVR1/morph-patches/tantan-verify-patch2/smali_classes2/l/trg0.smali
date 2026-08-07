.class public abstract Ll/trg0;
.super Ll/kug0;
.source "SourceFile"


# instance fields
.field private a:Z

.field private b:Z

.field private c:Ljava/util/Timer;

.field private d:Ljava/util/TimerTask;

.field private e:I

.field private f:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/kug0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x3c

    .line 5
    .line 6
    iput v0, p0, Ll/trg0;->e:I

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Ll/trg0;->f:Z

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Ll/trg0;)I
    .locals 0

    .line 30
    iget p0, p0, Ll/trg0;->e:I

    return p0
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/trg0;->c:Ljava/util/Timer;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ll/trg0;->d:Ljava/util/TimerTask;

    .line 6
    .line 7
    if-eqz v1, :cond_2

    .line 8
    .line 9
    :cond_0
    const/4 v1, 0x0

    .line 10
    iput-boolean v1, p0, Ll/trg0;->f:Z

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Ll/trg0;->c:Ljava/util/Timer;

    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Ll/trg0;->d:Ljava/util/TimerTask;

    .line 21
    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/util/TimerTask;->cancel()Z

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Ll/trg0;->d:Ljava/util/TimerTask;

    .line 28
    .line 29
    :cond_2
    return-void
.end method

.method public a(Z)V
    .locals 0

    .line 31
    iput-boolean p1, p0, Ll/trg0;->a:Z

    return-void
.end method

.method public b()V
    .locals 8

    .line 1
    iget v0, p0, Ll/trg0;->e:I

    .line 2
    .line 3
    if-gtz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/trg0;->f:Z

    .line 8
    .line 9
    iget-object v0, p0, Ll/trg0;->c:Ljava/util/Timer;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 15
    .line 16
    .line 17
    iput-object v1, p0, Ll/trg0;->c:Ljava/util/Timer;

    .line 18
    .line 19
    :cond_1
    iget-object v0, p0, Ll/trg0;->d:Ljava/util/TimerTask;

    .line 20
    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/util/TimerTask;->cancel()Z

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Ll/trg0;->d:Ljava/util/TimerTask;

    .line 27
    .line 28
    :cond_2
    new-instance v0, Ljava/util/Timer;

    .line 29
    .line 30
    const-string v1, "WebSocketTimer"

    .line 31
    .line 32
    invoke-direct {v0, v1}, Ljava/util/Timer;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Ll/trg0;->c:Ljava/util/Timer;

    .line 36
    .line 37
    new-instance v3, Ll/lkg0;

    .line 38
    .line 39
    invoke-direct {v3, p0}, Ll/lkg0;-><init>(Ll/trg0;)V

    .line 40
    .line 41
    .line 42
    iput-object v3, p0, Ll/trg0;->d:Ljava/util/TimerTask;

    .line 43
    .line 44
    iget-object v2, p0, Ll/trg0;->c:Ljava/util/Timer;

    .line 45
    .line 46
    iget p0, p0, Ll/trg0;->e:I

    .line 47
    .line 48
    mul-int/lit16 p0, p0, 0x3e8

    .line 49
    .line 50
    int-to-long v4, p0

    .line 51
    move-wide v6, v4

    .line 52
    invoke-virtual/range {v2 .. v7}, Ljava/util/Timer;->scheduleAtFixedRate(Ljava/util/TimerTask;JJ)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public b(Z)V
    .locals 0

    .line 56
    iput-boolean p1, p0, Ll/trg0;->b:Z

    return-void
.end method

.method public abstract c()Ljava/util/Collection;
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/trg0;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/trg0;->b:Z

    .line 2
    .line 3
    return p0
.end method
