.class public Ll/ow5;
.super Ljava/lang/Object;


# instance fields
.field private a:Z

.field private b:Ljava/lang/String;

.field private c:Ljava/lang/String;

.field private d:Ljava/lang/String;

.field private e:Ljava/lang/String;

.field private f:Ljava/lang/String;

.field private g:Ljava/lang/String;

.field private h:Ljava/lang/String;

.field private i:Ljava/lang/String;

.field private j:J

.field private k:I

.field private l:I

.field private m:Z

.field private n:Z

.field private o:Z

.field private p:Z

.field private q:Z

.field private r:Z

.field private s:Z

.field private t:Z


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/ow5;->a:Z

    .line 6
    .line 7
    const-string v1, "https://apmplus.volces.com/monitor/collect/c/crash"

    .line 8
    .line 9
    iput-object v1, p0, Ll/ow5;->b:Ljava/lang/String;

    .line 10
    .line 11
    const-string v1, "https://apmplus.volces.com/monitor/collect/c/exception/dump_collection"

    .line 12
    .line 13
    iput-object v1, p0, Ll/ow5;->c:Ljava/lang/String;

    .line 14
    .line 15
    const-string v1, "https://apmplus.volces.com/monitor/collect/c/exception"

    .line 16
    .line 17
    iput-object v1, p0, Ll/ow5;->d:Ljava/lang/String;

    .line 18
    .line 19
    const-string v1, "https://apmplus.volces.com/monitor/collect/c/session"

    .line 20
    .line 21
    iput-object v1, p0, Ll/ow5;->e:Ljava/lang/String;

    .line 22
    .line 23
    const-string v1, "https://apmplus.volces.com/settings/get"

    .line 24
    .line 25
    iput-object v1, p0, Ll/ow5;->f:Ljava/lang/String;

    .line 26
    .line 27
    const-string v1, "https://apmplus.volces.com/monitor/collect/c/native_bin_crash"

    .line 28
    .line 29
    iput-object v1, p0, Ll/ow5;->g:Ljava/lang/String;

    .line 30
    .line 31
    const-string v1, "https://apmplus.volces.com/monitor/collect/c/cloudcontrol/file"

    .line 32
    .line 33
    iput-object v1, p0, Ll/ow5;->h:Ljava/lang/String;

    .line 34
    .line 35
    const-string v1, "https://apmplus.volces.com/monitor/collect/c/logcollect"

    .line 36
    .line 37
    iput-object v1, p0, Ll/ow5;->i:Ljava/lang/String;

    .line 38
    .line 39
    const-wide/16 v1, 0x1f40

    .line 40
    .line 41
    iput-wide v1, p0, Ll/ow5;->j:J

    .line 42
    .line 43
    const/16 v1, 0x200

    .line 44
    .line 45
    iput v1, p0, Ll/ow5;->k:I

    .line 46
    .line 47
    iput v0, p0, Ll/ow5;->l:I

    .line 48
    .line 49
    iput-boolean v0, p0, Ll/ow5;->m:Z

    .line 50
    .line 51
    iput-boolean v0, p0, Ll/ow5;->n:Z

    .line 52
    .line 53
    const/4 v1, 0x0

    .line 54
    iput-boolean v1, p0, Ll/ow5;->o:Z

    .line 55
    .line 56
    iput-boolean v1, p0, Ll/ow5;->p:Z

    .line 57
    .line 58
    iput-boolean v0, p0, Ll/ow5;->q:Z

    .line 59
    .line 60
    iput-boolean v0, p0, Ll/ow5;->r:Z

    .line 61
    .line 62
    iput-boolean v0, p0, Ll/ow5;->s:Z

    .line 63
    .line 64
    iput-boolean v0, p0, Ll/ow5;->t:Z

    .line 65
    .line 66
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ow5;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ow5;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ow5;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/ow5;->j:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ow5;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget p0, p0, Ll/ow5;->k:I

    .line 2
    .line 3
    return p0
.end method

.method public g()I
    .locals 0

    .line 1
    iget p0, p0, Ll/ow5;->l:I

    .line 2
    .line 3
    return p0
.end method

.method public h()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ow5;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ow5;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public j()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ow5;->s:Z

    .line 2
    .line 3
    return p0
.end method

.method public k(Ljava/lang/String;)Z
    .locals 2

    .line 1
    const-string v0, "java_crash_ignore"

    .line 2
    .line 3
    :try_start_0
    new-instance v1, Ll/ow5$a;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/ow5$a;-><init>(Ll/ow5;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/n4r0;->b(Ljava/lang/String;Ll/q1r0;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    invoke-static {}, Ll/n0r0;->i()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {p0}, Ll/l5r0;->c(Landroid/content/Context;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-static {v0, v1}, Ll/n4r0;->b(Ljava/lang/String;Ll/q1r0;)Z

    .line 27
    .line 28
    .line 29
    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    return p0

    .line 31
    :catchall_0
    :cond_1
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method public l()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ow5;->o:Z

    .line 2
    .line 3
    return p0
.end method

.method public m()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ow5;->q:Z

    .line 2
    .line 3
    return p0
.end method

.method public n()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ow5;->r:Z

    .line 2
    .line 3
    return p0
.end method

.method public o()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ow5;->p:Z

    .line 2
    .line 3
    return p0
.end method

.method public p()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ow5;->t:Z

    .line 2
    .line 3
    return p0
.end method

.method public q(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iput-object p1, p0, Ll/ow5;->h:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method

.method public r(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iput-object p1, p0, Ll/ow5;->f:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method

.method public s(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iput-object p1, p0, Ll/ow5;->i:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method

.method public t(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iput-object p1, p0, Ll/ow5;->b:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method

.method public u(Ljava/lang/String;)V
    .locals 5

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iput-object p1, p0, Ll/ow5;->d:Ljava/lang/String;

    .line 9
    .line 10
    const-string v0, "//"

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, -0x1

    .line 17
    const-string v2, "monitor/collect/c/exception/dump_collection"

    .line 18
    .line 19
    const-string v3, "/"

    .line 20
    .line 21
    const/4 v4, 0x0

    .line 22
    if-ne v0, v1, :cond_1

    .line 23
    .line 24
    invoke-virtual {p1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    :goto_0
    add-int/lit8 v0, v0, 0x1

    .line 29
    .line 30
    invoke-virtual {p1, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iput-object p1, p0, Ll/ow5;->c:Ljava/lang/String;

    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    add-int/lit8 v0, v0, 0x2

    .line 42
    .line 43
    invoke-virtual {p1, v3, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    goto :goto_0
.end method

.method public v(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iput-object p1, p0, Ll/ow5;->g:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method

.method public w(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iput-object p1, p0, Ll/ow5;->e:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method
