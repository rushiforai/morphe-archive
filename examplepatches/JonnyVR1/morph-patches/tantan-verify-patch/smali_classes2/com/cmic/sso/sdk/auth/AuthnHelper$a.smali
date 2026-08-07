.class Lcom/cmic/sso/sdk/auth/AuthnHelper$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cmic/sso/sdk/auth/AuthnHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lcom/cmic/sso/sdk/auth/AuthnHelper;

.field private final b:Lcom/cmic/sso/sdk/a;


# direct methods
.method public constructor <init>(Lcom/cmic/sso/sdk/auth/AuthnHelper;Lcom/cmic/sso/sdk/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$a;->a:Lcom/cmic/sso/sdk/auth/AuthnHelper;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$a;->b:Lcom/cmic/sso/sdk/a;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$a;->a:Lcom/cmic/sso/sdk/auth/AuthnHelper;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/cmic/sso/sdk/auth/AuthnHelper;->b(Lcom/cmic/sso/sdk/auth/AuthnHelper;)Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/cmic/sso/sdk/e/r;->a(Landroid/content/Context;)Lcom/cmic/sso/sdk/e/r;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/cmic/sso/sdk/e/r;->a()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const-string v1, "\u767b\u5f55\u8d85\u65f6"

    .line 16
    .line 17
    const-string v2, "200023"

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$a;->b:Lcom/cmic/sso/sdk/a;

    .line 22
    .line 23
    const-string v3, "doNetworkSwitch"

    .line 24
    .line 25
    const/4 v4, 0x0

    .line 26
    invoke-virtual {v0, v3, v4}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;Z)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    const-string v0, "102508"

    .line 33
    .line 34
    const-string v3, "\u6570\u636e\u7f51\u7edc\u5207\u6362\u5931\u8d25"

    .line 35
    .line 36
    invoke-static {v0, v3}, Lcom/cmic/sso/sdk/auth/c;->a(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    goto :goto_0

    .line 41
    :cond_0
    invoke-static {v2, v1}, Lcom/cmic/sso/sdk/auth/c;->a(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    :goto_0
    iget-object v3, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$a;->a:Lcom/cmic/sso/sdk/auth/AuthnHelper;

    .line 46
    .line 47
    const-string v4, "resultCode"

    .line 48
    .line 49
    invoke-virtual {v0, v4, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    const-string v4, "desc"

    .line 54
    .line 55
    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    iget-object p0, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$a;->b:Lcom/cmic/sso/sdk/a;

    .line 60
    .line 61
    invoke-virtual {v3, v2, v1, p0, v0}, Lcom/cmic/sso/sdk/auth/AuthnHelper;->callBackResult(Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/a;Lorg/json/JSONObject;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method
