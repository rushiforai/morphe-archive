.class public Ll/l4g0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/l4g0$b;
    }
.end annotation


# instance fields
.field public a:J

.field public b:J

.field public c:Ljava/lang/String;

.field public d:Ll/ue60;

.field public e:Ll/e6m;

.field public f:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    new-instance v0, Ll/l4g0$a;

    invoke-direct {v0, p0, p1}, Ll/l4g0$a;-><init>(Ll/l4g0;Ljava/lang/String;)V

    .line 18
    invoke-virtual {p0, v0, p2}, Ll/l4g0;->n(Ll/e6m;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ll/e6m;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, p1, v0}, Ll/l4g0;->n(Ll/e6m;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Ll/ur2;Ljava/lang/String;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    invoke-virtual {p0, p1, p2}, Ll/l4g0;->n(Ll/e6m;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final a()Ll/q4f;
    .locals 5

    .line 1
    new-instance v0, Ll/q4f;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/q4f;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-wide v1, p0, Ll/l4g0;->b:J

    .line 7
    .line 8
    iget-wide v3, p0, Ll/l4g0;->a:J

    .line 9
    .line 10
    sub-long/2addr v1, v3

    .line 11
    long-to-double v1, v1

    .line 12
    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    .line 13
    .line 14
    mul-double/2addr v1, v3

    .line 15
    const-wide v3, 0x408f400000000000L    # 1000.0

    .line 16
    .line 17
    .line 18
    .line 19
    .line 20
    div-double/2addr v1, v3

    .line 21
    iput-wide v1, v0, Ll/q4f;->e:D

    .line 22
    .line 23
    sget-object v1, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->PAGE_DISAPPEAR:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 24
    .line 25
    iput-object v1, v0, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/l4g0;->m(Ll/q4f;)V

    .line 28
    .line 29
    .line 30
    return-object v0
.end method

.method public final b()Ll/q4f;
    .locals 2

    .line 1
    new-instance v0, Ll/q4f;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/q4f;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->PAGE_VIEW:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 7
    .line 8
    iput-object v1, v0, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 9
    .line 10
    invoke-static {}, Ll/ve60;->e()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Ll/q4f;->o:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {}, Ll/ve60;->f()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iput-object v1, v0, Ll/q4f;->r:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ll/l4g0;->m(Ll/q4f;)V

    .line 23
    .line 24
    .line 25
    return-object v0
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l4g0;->e:Ll/e6m;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/e6m;->disableAutoPV()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0, v0}, Ll/l4g0;->d(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final d(Z)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/l4g0;->d:Ll/ue60;

    .line 4
    .line 5
    invoke-static {p0}, Ll/ve60;->a(Ll/ue60;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public e()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l4g0;->e:Ll/e6m;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/e6m;->disableAutoPV()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0, v0}, Ll/l4g0;->f(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final f(Z)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/l4g0;->d:Ll/ue60;

    .line 4
    .line 5
    invoke-static {p0}, Ll/ve60;->i(Ll/ue60;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public g()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l4g0;->e:Ll/e6m;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/e6m;->disableAutoPV()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0, v0}, Ll/l4g0;->h(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final h(Z)V
    .locals 2

    .line 1
    if-nez p1, :cond_2

    .line 2
    .line 3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iput-wide v0, p0, Ll/l4g0;->b:J

    .line 8
    .line 9
    iget-object p1, p0, Ll/l4g0;->c:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-static {}, Ll/i4g0;->l()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    new-instance p1, Ljava/lang/Exception;

    .line 24
    .line 25
    const-string v0, "callPDBeforePV"

    .line 26
    .line 27
    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p1}, Ll/wu80;->b(Ljava/lang/Exception;)V

    .line 31
    .line 32
    .line 33
    const-string p1, "\u9875\u9762\u7684PD\u5728PV\u4e4b\u524d\u8c03\u7528\uff0clogcat\u641c\u7d22callPDBeforePV\u53ef\u770b\u5177\u4f53\u8c03\u7528\u6808"

    .line 34
    .line 35
    invoke-static {p1}, Ll/s1j0;->a(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    invoke-static {}, Ll/i4g0;->g()Ll/l4g0$b;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    iget-object v0, p0, Ll/l4g0;->d:Ll/ue60;

    .line 45
    .line 46
    invoke-virtual {v0}, Ll/ue60;->c()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-interface {p1, v0}, Ll/l4g0$b;->b(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    invoke-virtual {p0}, Ll/l4g0;->a()Ll/q4f;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-static {p1}, Ll/i4g0;->m(Ll/q4f;)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Ll/l4g0;->d:Ll/ue60;

    .line 61
    .line 62
    invoke-static {p0}, Ll/ve60;->j(Ll/ue60;)V

    .line 63
    .line 64
    .line 65
    :cond_2
    return-void
.end method

.method public i()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l4g0;->d:Ll/ue60;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ue60;->c()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, v0}, Ll/l4g0;->d(Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public j()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l4g0;->d:Ll/ue60;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ue60;->c()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, v0}, Ll/l4g0;->f(Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public k()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l4g0;->d:Ll/ue60;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ue60;->c()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, v0}, Ll/l4g0;->h(Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public l()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l4g0;->d:Ll/ue60;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ue60;->c()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 v0, 0x1

    .line 15
    iput-boolean v0, p0, Ll/l4g0;->f:Z

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-virtual {p0, v0}, Ll/l4g0;->s(Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final m(Ll/q4f;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l4g0;->d:Ll/ue60;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ue60;->c()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p1, Ll/q4f;->n:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v0, p0, Ll/l4g0;->d:Ll/ue60;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/ue60;->a()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p1, Ll/q4f;->p:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v0, p0, Ll/l4g0;->c:Ljava/lang/String;

    .line 18
    .line 19
    iput-object v0, p1, Ll/q4f;->q:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v0, p0, Ll/l4g0;->e:Ll/e6m;

    .line 22
    .line 23
    invoke-interface {v0}, Ll/e6m;->disableAutoPV()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    const/4 v1, 0x1

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    iget-boolean v0, p0, Ll/l4g0;->f:Z

    .line 31
    .line 32
    if-nez v0, :cond_0

    .line 33
    .line 34
    move v0, v1

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const/4 v0, 0x0

    .line 37
    :goto_0
    iput-boolean v0, p1, Ll/q4f;->b:Z

    .line 38
    .line 39
    iput v1, p1, Ll/q4f;->a:I

    .line 40
    .line 41
    iget-object p0, p0, Ll/l4g0;->d:Ll/ue60;

    .line 42
    .line 43
    if-eqz p0, :cond_1

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/ue60;->b()Lorg/json/JSONObject;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    iput-object p0, p1, Ll/q4f;->w:Lorg/json/JSONObject;

    .line 50
    .line 51
    :cond_1
    return-void
.end method

.method public final n(Ll/e6m;Ljava/lang/String;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-interface {p1}, Ll/e6m;->pageId()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    new-instance v0, Ljava/lang/Exception;

    .line 15
    .line 16
    new-instance v1, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v2, "class\uff1a"

    .line 19
    .line 20
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v2, " pageId is Empty"

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v0}, Ll/wu80;->b(Ljava/lang/Exception;)V

    .line 39
    .line 40
    .line 41
    :cond_1
    iput-object p1, p0, Ll/l4g0;->e:Ll/e6m;

    .line 42
    .line 43
    new-instance v0, Ll/ue60;

    .line 44
    .line 45
    invoke-interface {p1}, Ll/e6m;->pageId()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-direct {v0, p1, p2}, Ll/ue60;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iput-object v0, p0, Ll/l4g0;->d:Ll/ue60;

    .line 53
    .line 54
    return-void
.end method

.method public o(Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l4g0;->d:Ll/ue60;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ue60;->g(Lorg/json/JSONObject;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public varargs p([Ll/pf60;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l4g0;->d:Ll/ue60;

    .line 2
    .line 3
    invoke-static {p1}, Ll/i4g0;->b([Ll/pf60;)Lorg/json/JSONObject;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ll/ue60;->g(Lorg/json/JSONObject;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public q(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l4g0;->d:Ll/ue60;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ue60;->h(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public r()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/l4g0;->f:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/l4g0;->e:Ll/e6m;

    .line 5
    .line 6
    invoke-interface {v0}, Ll/e6m;->disableAutoPV()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-virtual {p0, v0}, Ll/l4g0;->s(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final s(Z)V
    .locals 2

    .line 1
    if-nez p1, :cond_2

    .line 2
    .line 3
    sget-object p1, Ll/ve60;->a:Ljava/util/ArrayList;

    .line 4
    .line 5
    iget-object v0, p0, Ll/l4g0;->d:Ll/ue60;

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    const-string p1, "startPage\u5e94\u8be5\u5728createPage\u4e4b\u540e\u8c03\u7528"

    .line 14
    .line 15
    invoke-static {p1}, Ll/s1j0;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p1, p0, Ll/l4g0;->c:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Ll/l4g0;->c:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v1, p0, Ll/l4g0;->d:Ll/ue60;

    .line 31
    .line 32
    invoke-virtual {v1}, Ll/ue60;->c()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-static {p1, v0, v1}, Ll/ve60;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 40
    .line 41
    .line 42
    move-result-wide v0

    .line 43
    iput-wide v0, p0, Ll/l4g0;->a:J

    .line 44
    .line 45
    invoke-static {}, Ll/i4g0;->g()Ll/l4g0$b;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    if-eqz p1, :cond_1

    .line 50
    .line 51
    iget-object v0, p0, Ll/l4g0;->d:Ll/ue60;

    .line 52
    .line 53
    invoke-virtual {v0}, Ll/ue60;->c()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-interface {p1, v0}, Ll/l4g0$b;->a(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    :cond_1
    invoke-virtual {p0}, Ll/l4g0;->b()Ll/q4f;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-static {p1}, Ll/i4g0;->m(Ll/q4f;)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Ll/l4g0;->d:Ll/ue60;

    .line 68
    .line 69
    invoke-static {p1}, Ll/ve60;->b(Ll/ue60;)V

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Ll/l4g0;->d:Ll/ue60;

    .line 73
    .line 74
    invoke-static {p0}, Ll/ve60;->l(Ll/ue60;)V

    .line 75
    .line 76
    .line 77
    :cond_2
    return-void
.end method
