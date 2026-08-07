.class Lcom/cmic/sso/sdk/c/c/a$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/cmic/sso/sdk/c/d/c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cmic/sso/sdk/c/c/a;->a(Lcom/cmic/sso/sdk/c/c/c;Lcom/cmic/sso/sdk/c/c/d;Lcom/cmic/sso/sdk/a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/cmic/sso/sdk/a;

.field final synthetic b:Lcom/cmic/sso/sdk/c/c/d;

.field final synthetic c:Lcom/cmic/sso/sdk/c/c/c;

.field final synthetic d:Lcom/cmic/sso/sdk/c/c/a;


# direct methods
.method public constructor <init>(Lcom/cmic/sso/sdk/c/c/a;Lcom/cmic/sso/sdk/a;Lcom/cmic/sso/sdk/c/c/d;Lcom/cmic/sso/sdk/c/c/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cmic/sso/sdk/c/c/a$1;->d:Lcom/cmic/sso/sdk/c/c/a;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/cmic/sso/sdk/c/c/a$1;->a:Lcom/cmic/sso/sdk/a;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/cmic/sso/sdk/c/c/a$1;->b:Lcom/cmic/sso/sdk/c/c/d;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/cmic/sso/sdk/c/c/a$1;->c:Lcom/cmic/sso/sdk/c/c/c;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private a()V
    .locals 5

    .line 69
    iget-object v0, p0, Lcom/cmic/sso/sdk/c/c/a$1;->c:Lcom/cmic/sso/sdk/c/c/c;

    invoke-virtual {v0}, Lcom/cmic/sso/sdk/c/c/c;->a()Ljava/lang/String;

    move-result-object v0

    const-string v1, "uniConfig"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 70
    iget-object v0, p0, Lcom/cmic/sso/sdk/c/c/a$1;->a:Lcom/cmic/sso/sdk/a;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    iget-object p0, p0, Lcom/cmic/sso/sdk/c/c/a$1;->c:Lcom/cmic/sso/sdk/c/c/c;

    invoke-virtual {p0}, Lcom/cmic/sso/sdk/c/c/c;->h()J

    move-result-wide v3

    sub-long/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/cmic/sso/sdk/e/q;->c(Lcom/cmic/sso/sdk/a;Ljava/lang/String;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public a(Lcom/cmic/sso/sdk/c/d/a;)V
    .locals 2

    .line 65
    invoke-direct {p0}, Lcom/cmic/sso/sdk/c/c/a$1;->a()V

    .line 66
    iget-object v0, p0, Lcom/cmic/sso/sdk/c/c/a$1;->a:Lcom/cmic/sso/sdk/a;

    invoke-virtual {p1}, Lcom/cmic/sso/sdk/c/d/a;->a()I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/cmic/sso/sdk/e/q;->b(Lcom/cmic/sso/sdk/a;Ljava/lang/String;)V

    .line 67
    invoke-virtual {p1}, Lcom/cmic/sso/sdk/c/d/a;->a()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/cmic/sso/sdk/c/d/a;->b()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/cmic/sso/sdk/auth/c;->a(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 68
    iget-object p0, p0, Lcom/cmic/sso/sdk/c/c/a$1;->b:Lcom/cmic/sso/sdk/c/c/d;

    invoke-virtual {p1}, Lcom/cmic/sso/sdk/c/d/a;->a()I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/cmic/sso/sdk/c/d/a;->b()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, v1, p1, v0}, Lcom/cmic/sso/sdk/c/c/d;->a(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    return-void
.end method

.method public a(Lcom/cmic/sso/sdk/c/d/b;)V
    .locals 3

    .line 1
    const-string v0, "resultcode"

    .line 2
    .line 3
    :try_start_0
    invoke-direct {p0}, Lcom/cmic/sso/sdk/c/c/a$1;->a()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lorg/json/JSONObject;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/cmic/sso/sdk/c/d/b;->c()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    goto :goto_0

    .line 26
    :catch_0
    move-exception p1

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    const-string p1, "resultCode"

    .line 29
    .line 30
    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    :goto_0
    iget-object v0, p0, Lcom/cmic/sso/sdk/c/c/a$1;->a:Lcom/cmic/sso/sdk/a;

    .line 35
    .line 36
    invoke-static {v0, p1}, Lcom/cmic/sso/sdk/e/q;->b(Lcom/cmic/sso/sdk/a;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/cmic/sso/sdk/c/c/a$1;->b:Lcom/cmic/sso/sdk/c/c/d;

    .line 40
    .line 41
    const-string v2, "desc"

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-interface {v0, p1, v2, v1}, Lcom/cmic/sso/sdk/c/c/d;->a(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :goto_1
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 52
    .line 53
    .line 54
    const p1, 0x18f4f

    .line 55
    .line 56
    .line 57
    invoke-static {p1}, Lcom/cmic/sso/sdk/c/d/a;->a(I)Lcom/cmic/sso/sdk/c/d/a;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p0, p1}, Lcom/cmic/sso/sdk/c/c/a$1;->a(Lcom/cmic/sso/sdk/c/d/a;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method
