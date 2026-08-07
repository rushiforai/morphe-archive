.class Lcom/cmic/sso/sdk/auth/AuthnHelper$5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/cmic/sso/sdk/auth/b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cmic/sso/sdk/auth/AuthnHelper;->a(Lcom/cmic/sso/sdk/a;Lcom/cmic/sso/sdk/auth/AuthnHelper$a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/cmic/sso/sdk/auth/AuthnHelper$a;

.field final synthetic b:Lcom/cmic/sso/sdk/auth/AuthnHelper;


# direct methods
.method public constructor <init>(Lcom/cmic/sso/sdk/auth/AuthnHelper;Lcom/cmic/sso/sdk/auth/AuthnHelper$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$5;->b:Lcom/cmic/sso/sdk/auth/AuthnHelper;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$5;->a:Lcom/cmic/sso/sdk/auth/AuthnHelper$a;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/a;Lorg/json/JSONObject;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$5;->b:Lcom/cmic/sso/sdk/auth/AuthnHelper;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/cmic/sso/sdk/auth/AuthnHelper;->e(Lcom/cmic/sso/sdk/auth/AuthnHelper;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$5;->a:Lcom/cmic/sso/sdk/auth/AuthnHelper$a;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$5;->b:Lcom/cmic/sso/sdk/auth/AuthnHelper;

    .line 13
    .line 14
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/cmic/sso/sdk/auth/AuthnHelper;->callBackResult(Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/a;Lorg/json/JSONObject;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
