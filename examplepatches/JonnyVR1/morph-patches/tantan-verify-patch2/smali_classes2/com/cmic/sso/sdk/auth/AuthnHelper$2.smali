.class Lcom/cmic/sso/sdk/auth/AuthnHelper$2;
.super Lcom/cmic/sso/sdk/e/n$a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cmic/sso/sdk/auth/AuthnHelper;->loginAuth(Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/auth/TokenListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/cmic/sso/sdk/a;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Ljava/lang/String;

.field final synthetic d:Lcom/cmic/sso/sdk/auth/TokenListener;

.field final synthetic e:Lcom/cmic/sso/sdk/auth/AuthnHelper$a;

.field final synthetic f:Lcom/cmic/sso/sdk/auth/AuthnHelper;


# direct methods
.method public constructor <init>(Lcom/cmic/sso/sdk/auth/AuthnHelper;Landroid/content/Context;Lcom/cmic/sso/sdk/a;Lcom/cmic/sso/sdk/a;Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/auth/TokenListener;Lcom/cmic/sso/sdk/auth/AuthnHelper$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$2;->f:Lcom/cmic/sso/sdk/auth/AuthnHelper;

    .line 2
    .line 3
    iput-object p4, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$2;->a:Lcom/cmic/sso/sdk/a;

    .line 4
    .line 5
    iput-object p5, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$2;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p6, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$2;->c:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p7, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$2;->d:Lcom/cmic/sso/sdk/auth/TokenListener;

    .line 10
    .line 11
    iput-object p8, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$2;->e:Lcom/cmic/sso/sdk/auth/AuthnHelper$a;

    .line 12
    .line 13
    invoke-direct {p0, p2, p3}, Lcom/cmic/sso/sdk/e/n$a;-><init>(Landroid/content/Context;Lcom/cmic/sso/sdk/a;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public a()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$2;->f:Lcom/cmic/sso/sdk/auth/AuthnHelper;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$2;->a:Lcom/cmic/sso/sdk/a;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$2;->b:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$2;->c:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v5, 0x1

    .line 10
    iget-object v6, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$2;->d:Lcom/cmic/sso/sdk/auth/TokenListener;

    .line 11
    .line 12
    const-string v4, "loginAuth"

    .line 13
    .line 14
    invoke-static/range {v0 .. v6}, Lcom/cmic/sso/sdk/auth/AuthnHelper;->a(Lcom/cmic/sso/sdk/auth/AuthnHelper;Lcom/cmic/sso/sdk/a;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILcom/cmic/sso/sdk/auth/TokenListener;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$2;->f:Lcom/cmic/sso/sdk/auth/AuthnHelper;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$2;->a:Lcom/cmic/sso/sdk/a;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$2;->e:Lcom/cmic/sso/sdk/auth/AuthnHelper$a;

    .line 25
    .line 26
    invoke-static {v0, v1, p0}, Lcom/cmic/sso/sdk/auth/AuthnHelper;->a(Lcom/cmic/sso/sdk/auth/AuthnHelper;Lcom/cmic/sso/sdk/a;Lcom/cmic/sso/sdk/auth/AuthnHelper$a;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method
