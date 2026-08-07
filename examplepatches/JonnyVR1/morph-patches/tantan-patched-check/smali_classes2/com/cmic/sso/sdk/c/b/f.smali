.class public Lcom/cmic/sso/sdk/c/b/f;
.super Lcom/cmic/sso/sdk/c/b/g;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cmic/sso/sdk/c/b/f$a;,
        Lcom/cmic/sso/sdk/c/b/f$b;
    }
.end annotation


# instance fields
.field private a:Lcom/cmic/sso/sdk/c/b/f$b;

.field private b:Lcom/cmic/sso/sdk/c/b/f$a;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/cmic/sso/sdk/c/b/g;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cmic/sso/sdk/c/b/f;->a:Lcom/cmic/sso/sdk/c/b/f$b;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/cmic/sso/sdk/c/b/f$b;->a(Lcom/cmic/sso/sdk/c/b/f$b;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public a(Lcom/cmic/sso/sdk/c/b/f$a;)V
    .locals 0

    .line 8
    iput-object p1, p0, Lcom/cmic/sso/sdk/c/b/f;->b:Lcom/cmic/sso/sdk/c/b/f$a;

    return-void
.end method

.method public a(Lcom/cmic/sso/sdk/c/b/f$b;)V
    .locals 0

    .line 9
    iput-object p1, p0, Lcom/cmic/sso/sdk/c/b/f;->a:Lcom/cmic/sso/sdk/c/b/f$b;

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
    new-instance v1, Lorg/json/JSONObject;

    .line 7
    .line 8
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v2, Lorg/json/JSONObject;

    .line 12
    .line 13
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 14
    .line 15
    .line 16
    :try_start_0
    const-string v3, "sign"

    .line 17
    .line 18
    iget-object v4, p0, Lcom/cmic/sso/sdk/c/b/f;->a:Lcom/cmic/sso/sdk/c/b/f$b;

    .line 19
    .line 20
    invoke-virtual {v4}, Lcom/cmic/sso/sdk/c/b/f$b;->d()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 25
    .line 26
    .line 27
    const-string v3, "msgid"

    .line 28
    .line 29
    iget-object v4, p0, Lcom/cmic/sso/sdk/c/b/f;->a:Lcom/cmic/sso/sdk/c/b/f$b;

    .line 30
    .line 31
    invoke-virtual {v4}, Lcom/cmic/sso/sdk/c/b/f$b;->e()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 36
    .line 37
    .line 38
    const-string v3, "systemtime"

    .line 39
    .line 40
    iget-object v4, p0, Lcom/cmic/sso/sdk/c/b/f;->a:Lcom/cmic/sso/sdk/c/b/f$b;

    .line 41
    .line 42
    invoke-virtual {v4}, Lcom/cmic/sso/sdk/c/b/f$b;->f()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 47
    .line 48
    .line 49
    const-string v3, "appid"

    .line 50
    .line 51
    iget-object v4, p0, Lcom/cmic/sso/sdk/c/b/f;->a:Lcom/cmic/sso/sdk/c/b/f$b;

    .line 52
    .line 53
    invoke-virtual {v4}, Lcom/cmic/sso/sdk/c/b/f$b;->a()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 58
    .line 59
    .line 60
    const-string v3, "version"

    .line 61
    .line 62
    iget-object v4, p0, Lcom/cmic/sso/sdk/c/b/f;->a:Lcom/cmic/sso/sdk/c/b/f$b;

    .line 63
    .line 64
    invoke-virtual {v4}, Lcom/cmic/sso/sdk/c/b/f$b;->c()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 69
    .line 70
    .line 71
    const-string v3, "header"

    .line 72
    .line 73
    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 74
    .line 75
    .line 76
    const-string v1, "log"

    .line 77
    .line 78
    iget-object p0, p0, Lcom/cmic/sso/sdk/c/b/f;->b:Lcom/cmic/sso/sdk/c/b/f$a;

    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/cmic/sso/sdk/c/b/f$a;->a()Lorg/json/JSONObject;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {v2, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 85
    .line 86
    .line 87
    const-string p0, "body"

    .line 88
    .line 89
    invoke-virtual {v0, p0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 90
    .line 91
    .line 92
    return-object v0

    .line 93
    :catch_0
    move-exception p0

    .line 94
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 95
    .line 96
    .line 97
    return-object v0
.end method
