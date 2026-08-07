.class Lcom/cmic/sso/sdk/a/b$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/cmic/sso/sdk/c/c/d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cmic/sso/sdk/a/b;->b(Lcom/cmic/sso/sdk/a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/cmic/sso/sdk/a/b;


# direct methods
.method public constructor <init>(Lcom/cmic/sso/sdk/a/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cmic/sso/sdk/a/b$1;->a:Lcom/cmic/sso/sdk/a/b;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    :try_start_0
    const-string p2, "103000"

    .line 2
    .line 3
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/cmic/sso/sdk/a/b$1;->a:Lcom/cmic/sso/sdk/a/b;

    .line 10
    .line 11
    invoke-static {p1, p3}, Lcom/cmic/sso/sdk/a/b;->a(Lcom/cmic/sso/sdk/a/b;Lorg/json/JSONObject;)V

    .line 12
    .line 13
    .line 14
    const-string p1, "sdk_config_version"

    .line 15
    .line 16
    const-string p2, "quick_login_android_9.5.5.3"

    .line 17
    .line 18
    invoke-static {p1, p2}, Lcom/cmic/sso/sdk/e/k;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/cmic/sso/sdk/a/b$1;->a:Lcom/cmic/sso/sdk/a/b;

    .line 22
    .line 23
    invoke-static {p1}, Lcom/cmic/sso/sdk/a/b;->a(Lcom/cmic/sso/sdk/a/b;)Lcom/cmic/sso/sdk/a/a;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-static {p1, p2}, Lcom/cmic/sso/sdk/a/b;->a(Lcom/cmic/sso/sdk/a/b;Lcom/cmic/sso/sdk/a/a;)Lcom/cmic/sso/sdk/a/a;

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/cmic/sso/sdk/a/b$1;->a:Lcom/cmic/sso/sdk/a/b;

    .line 31
    .line 32
    invoke-static {p1}, Lcom/cmic/sso/sdk/a/b;->b(Lcom/cmic/sso/sdk/a/b;)Lcom/cmic/sso/sdk/a/b$a;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    if-eqz p1, :cond_0

    .line 37
    .line 38
    iget-object p1, p0, Lcom/cmic/sso/sdk/a/b$1;->a:Lcom/cmic/sso/sdk/a/b;

    .line 39
    .line 40
    invoke-static {p1}, Lcom/cmic/sso/sdk/a/b;->b(Lcom/cmic/sso/sdk/a/b;)Lcom/cmic/sso/sdk/a/b$a;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iget-object p2, p0, Lcom/cmic/sso/sdk/a/b$1;->a:Lcom/cmic/sso/sdk/a/b;

    .line 45
    .line 46
    invoke-static {p2}, Lcom/cmic/sso/sdk/a/b;->c(Lcom/cmic/sso/sdk/a/b;)Lcom/cmic/sso/sdk/a/a;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-interface {p1, p2}, Lcom/cmic/sso/sdk/a/b$a;->a(Lcom/cmic/sso/sdk/a/a;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :catch_0
    move-exception p1

    .line 55
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 56
    .line 57
    .line 58
    :cond_0
    :goto_0
    iget-object p0, p0, Lcom/cmic/sso/sdk/a/b$1;->a:Lcom/cmic/sso/sdk/a/b;

    .line 59
    .line 60
    const/4 p1, 0x0

    .line 61
    invoke-static {p0, p1}, Lcom/cmic/sso/sdk/a/b;->a(Lcom/cmic/sso/sdk/a/b;Z)Z

    .line 62
    .line 63
    .line 64
    return-void
.end method
