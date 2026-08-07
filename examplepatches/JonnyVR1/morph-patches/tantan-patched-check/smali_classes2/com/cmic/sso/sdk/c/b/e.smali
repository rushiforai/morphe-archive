.class public Lcom/cmic/sso/sdk/c/b/e;
.super Lcom/cmic/sso/sdk/c/b/g;
.source "SourceFile"


# instance fields
.field private a:Lcom/cmic/sso/sdk/c/b/a;

.field private b:[B

.field private c:Ljava/lang/String;

.field private d:[B

.field private e:Ljava/lang/String;

.field private f:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/cmic/sso/sdk/c/b/g;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/cmic/sso/sdk/c/b/e;->f:Z

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cmic/sso/sdk/c/b/e;->a:Lcom/cmic/sso/sdk/c/b/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/cmic/sso/sdk/c/b/a;->a()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public a(Lcom/cmic/sso/sdk/c/b/a;)V
    .locals 0

    .line 9
    iput-object p1, p0, Lcom/cmic/sso/sdk/c/b/e;->a:Lcom/cmic/sso/sdk/c/b/a;

    return-void
.end method

.method public a(Z)V
    .locals 0

    .line 10
    iput-boolean p1, p0, Lcom/cmic/sso/sdk/c/b/e;->f:Z

    return-void
.end method

.method public a([B)V
    .locals 0

    .line 8
    iput-object p1, p0, Lcom/cmic/sso/sdk/c/b/e;->b:[B

    return-void
.end method

.method public a_(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public b()Lorg/json/JSONObject;
    .locals 5

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, p0, Lcom/cmic/sso/sdk/c/b/e;->f:Z

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    :try_start_0
    const-string v1, "encrypted"

    .line 11
    .line 12
    iget-object v2, p0, Lcom/cmic/sso/sdk/c/b/e;->c:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 15
    .line 16
    .line 17
    const-string v1, "encryptedIV"

    .line 18
    .line 19
    iget-object v2, p0, Lcom/cmic/sso/sdk/c/b/e;->d:[B

    .line 20
    .line 21
    const/4 v3, 0x0

    .line 22
    invoke-static {v2, v3}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 27
    .line 28
    .line 29
    const-string v1, "reqdata"

    .line 30
    .line 31
    iget-object v2, p0, Lcom/cmic/sso/sdk/c/b/e;->b:[B

    .line 32
    .line 33
    iget-object v3, p0, Lcom/cmic/sso/sdk/c/b/e;->a:Lcom/cmic/sso/sdk/c/b/a;

    .line 34
    .line 35
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    iget-object v4, p0, Lcom/cmic/sso/sdk/c/b/e;->d:[B

    .line 40
    .line 41
    invoke-static {v2, v3, v4}, Lcom/cmic/sso/sdk/e/a;->a([BLjava/lang/String;[B)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 46
    .line 47
    .line 48
    const-string v1, "securityreinforce"

    .line 49
    .line 50
    iget-object p0, p0, Lcom/cmic/sso/sdk/c/b/e;->e:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    .line 54
    .line 55
    return-object v0

    .line 56
    :catch_0
    move-exception p0

    .line 57
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 58
    .line 59
    .line 60
    :cond_0
    return-object v0
.end method

.method public b(Ljava/lang/String;)V
    .locals 0

    .line 62
    iput-object p1, p0, Lcom/cmic/sso/sdk/c/b/e;->e:Ljava/lang/String;

    return-void
.end method

.method public b([B)V
    .locals 0

    .line 61
    iput-object p1, p0, Lcom/cmic/sso/sdk/c/b/e;->d:[B

    return-void
.end method

.method public c()Lcom/cmic/sso/sdk/c/b/a;
    .locals 0

    .line 4
    iget-object p0, p0, Lcom/cmic/sso/sdk/c/b/e;->a:Lcom/cmic/sso/sdk/c/b/a;

    return-object p0
.end method

.method public c(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cmic/sso/sdk/c/b/e;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
