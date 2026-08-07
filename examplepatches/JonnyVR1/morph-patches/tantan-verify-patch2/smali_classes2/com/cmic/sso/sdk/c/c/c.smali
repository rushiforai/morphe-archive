.class public Lcom/cmic/sso/sdk/c/c/c;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field a:Ljava/lang/String;

.field private final b:Ljava/lang/String;

.field private final c:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final d:Ljava/lang/String;

.field private e:Z

.field private final f:Ljava/lang/String;

.field private g:Landroid/net/Network;

.field private h:J

.field private final i:Ljava/lang/String;

.field private j:I

.field private final k:Lcom/cmic/sso/sdk/c/b/g;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/cmic/sso/sdk/c/b/g;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    const/4 v2, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    .line 53
    invoke-direct/range {v0 .. v5}, Lcom/cmic/sso/sdk/c/c/c;-><init>(Ljava/lang/String;Ljava/util/Map;Lcom/cmic/sso/sdk/c/b/g;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;Ljava/util/Map;Lcom/cmic/sso/sdk/c/b/g;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/cmic/sso/sdk/c/b/g;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/cmic/sso/sdk/c/c/c;->e:Z

    .line 6
    .line 7
    iput-object p1, p0, Lcom/cmic/sso/sdk/c/c/c;->b:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p3, p0, Lcom/cmic/sso/sdk/c/c/c;->k:Lcom/cmic/sso/sdk/c/b/g;

    .line 10
    .line 11
    if-nez p2, :cond_0

    .line 12
    .line 13
    new-instance p2, Ljava/util/HashMap;

    .line 14
    .line 15
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 16
    .line 17
    .line 18
    :cond_0
    iput-object p2, p0, Lcom/cmic/sso/sdk/c/c/c;->c:Ljava/util/Map;

    .line 19
    .line 20
    const-string p1, ""

    .line 21
    .line 22
    if-nez p3, :cond_1

    .line 23
    .line 24
    move-object p2, p1

    .line 25
    goto :goto_0

    .line 26
    :cond_1
    invoke-virtual {p3}, Lcom/cmic/sso/sdk/c/b/g;->b()Lorg/json/JSONObject;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    :goto_0
    iput-object p2, p0, Lcom/cmic/sso/sdk/c/c/c;->a:Ljava/lang/String;

    .line 35
    .line 36
    iput-object p4, p0, Lcom/cmic/sso/sdk/c/c/c;->d:Ljava/lang/String;

    .line 37
    .line 38
    iput-object p5, p0, Lcom/cmic/sso/sdk/c/c/c;->f:Ljava/lang/String;

    .line 39
    .line 40
    if-nez p3, :cond_2

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_2
    invoke-virtual {p3}, Lcom/cmic/sso/sdk/c/b/g;->a()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    :goto_1
    iput-object p1, p0, Lcom/cmic/sso/sdk/c/c/c;->i:Ljava/lang/String;

    .line 48
    .line 49
    invoke-direct {p0}, Lcom/cmic/sso/sdk/c/c/c;->k()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method private k()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/cmic/sso/sdk/c/c/c;->c:Ljava/util/Map;

    .line 2
    .line 3
    const-string v1, "sdkVersion"

    .line 4
    .line 5
    const-string v2, "quick_login_android_9.5.5.3"

    .line 6
    .line 7
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/cmic/sso/sdk/c/c/c;->c:Ljava/util/Map;

    .line 11
    .line 12
    const-string v1, "Content-Type"

    .line 13
    .line 14
    const-string v2, "application/json"

    .line 15
    .line 16
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/cmic/sso/sdk/c/c/c;->c:Ljava/util/Map;

    .line 20
    .line 21
    const-string v1, "CMCC-EncryptType"

    .line 22
    .line 23
    const-string v2, "STD"

    .line 24
    .line 25
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/cmic/sso/sdk/c/c/c;->c:Ljava/util/Map;

    .line 29
    .line 30
    const-string v1, "traceId"

    .line 31
    .line 32
    iget-object v2, p0, Lcom/cmic/sso/sdk/c/c/c;->f:Ljava/lang/String;

    .line 33
    .line 34
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/cmic/sso/sdk/c/c/c;->c:Ljava/util/Map;

    .line 38
    .line 39
    const-string v1, "appid"

    .line 40
    .line 41
    iget-object v2, p0, Lcom/cmic/sso/sdk/c/c/c;->i:Ljava/lang/String;

    .line 42
    .line 43
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/cmic/sso/sdk/c/c/c;->c:Ljava/util/Map;

    .line 47
    .line 48
    const-string v0, "connection"

    .line 49
    .line 50
    const-string v1, "Keep-Alive"

    .line 51
    .line 52
    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 7
    iget-object p0, p0, Lcom/cmic/sso/sdk/c/c/c;->b:Ljava/lang/String;

    return-object p0
.end method

.method public a(J)V
    .locals 0

    .line 10
    iput-wide p1, p0, Lcom/cmic/sso/sdk/c/c/c;->h:J

    return-void
.end method

.method public a(Landroid/net/Network;)V
    .locals 0

    .line 9
    iput-object p1, p0, Lcom/cmic/sso/sdk/c/c/c;->g:Landroid/net/Network;

    return-void
.end method

.method public a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cmic/sso/sdk/c/c/c;->c:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public a(Z)V
    .locals 0

    .line 8
    iput-boolean p1, p0, Lcom/cmic/sso/sdk/c/c/c;->e:Z

    return-void
.end method

.method public b()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/cmic/sso/sdk/c/c/c;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method public c()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/cmic/sso/sdk/c/c/c;->c:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cmic/sso/sdk/c/c/c;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cmic/sso/sdk/c/c/c;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cmic/sso/sdk/c/c/c;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Landroid/net/Network;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cmic/sso/sdk/c/c/c;->g:Landroid/net/Network;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/cmic/sso/sdk/c/c/c;->h:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public i()Z
    .locals 2

    .line 1
    iget v0, p0, Lcom/cmic/sso/sdk/c/c/c;->j:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, 0x1

    .line 4
    .line 5
    iput v1, p0, Lcom/cmic/sso/sdk/c/c/c;->j:I

    .line 6
    .line 7
    const/4 p0, 0x2

    .line 8
    if-ge v0, p0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public j()Lcom/cmic/sso/sdk/c/b/g;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cmic/sso/sdk/c/c/c;->k:Lcom/cmic/sso/sdk/c/b/g;

    .line 2
    .line 3
    return-object p0
.end method
