.class public Lcom/cmic/sso/sdk/c/b/d;
.super Lcom/cmic/sso/sdk/c/b/g;
.source "SourceFile"


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:Ljava/lang/String;

.field private final c:Ljava/lang/String;

.field private d:Ljava/lang/String;

.field private e:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/cmic/sso/sdk/c/b/g;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "authz"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/cmic/sso/sdk/c/b/d;->d:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, p0, Lcom/cmic/sso/sdk/c/b/d;->a:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p2, p0, Lcom/cmic/sso/sdk/c/b/d;->b:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p3, p0, Lcom/cmic/sso/sdk/c/b/d;->c:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cmic/sso/sdk/c/b/d;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public a_(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public b()Lorg/json/JSONObject;
    .locals 3

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "ver"

    .line 7
    .line 8
    iget-object v2, p0, Lcom/cmic/sso/sdk/c/b/d;->b:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 11
    .line 12
    .line 13
    const-string v1, "data"

    .line 14
    .line 15
    iget-object v2, p0, Lcom/cmic/sso/sdk/c/b/d;->c:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 18
    .line 19
    .line 20
    const-string v1, "userCapaid"

    .line 21
    .line 22
    iget-object v2, p0, Lcom/cmic/sso/sdk/c/b/d;->e:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 25
    .line 26
    .line 27
    const-string v1, "funcType"

    .line 28
    .line 29
    iget-object p0, p0, Lcom/cmic/sso/sdk/c/b/d;->d:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    .line 33
    .line 34
    return-object v0

    .line 35
    :catch_0
    move-exception p0

    .line 36
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 37
    .line 38
    .line 39
    return-object v0
.end method

.method public b(Ljava/lang/String;)V
    .locals 0

    .line 40
    iput-object p1, p0, Lcom/cmic/sso/sdk/c/b/d;->d:Ljava/lang/String;

    return-void
.end method

.method public c(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cmic/sso/sdk/c/b/d;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
