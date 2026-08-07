.class Lcom/cmic/sso/sdk/auth/AuthnHelper$6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cmic/sso/sdk/auth/AuthnHelper;->callBackResult(Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/a;Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/cmic/sso/sdk/auth/TokenListener;

.field final synthetic b:Lorg/json/JSONObject;

.field final synthetic c:Lcom/cmic/sso/sdk/auth/AuthnHelper;


# direct methods
.method public constructor <init>(Lcom/cmic/sso/sdk/auth/AuthnHelper;Lcom/cmic/sso/sdk/auth/TokenListener;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$6;->c:Lcom/cmic/sso/sdk/auth/AuthnHelper;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$6;->a:Lcom/cmic/sso/sdk/auth/TokenListener;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$6;->b:Lorg/json/JSONObject;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$6;->a:Lcom/cmic/sso/sdk/auth/TokenListener;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$6;->b:Lorg/json/JSONObject;

    .line 4
    .line 5
    invoke-interface {v0, p0}, Lcom/cmic/sso/sdk/auth/TokenListener;->onGetTokenComplete(Lorg/json/JSONObject;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
