.class Lcom/cmic/sso/sdk/auth/AuthnHelper$4;
.super Lcom/cmic/sso/sdk/e/n$a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cmic/sso/sdk/auth/AuthnHelper;->getPhoneInfo(Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/auth/TokenListener;)V
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
    iput-object p1, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$4;->f:Lcom/cmic/sso/sdk/auth/AuthnHelper;

    .line 2
    .line 3
    iput-object p4, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$4;->a:Lcom/cmic/sso/sdk/a;

    .line 4
    .line 5
    iput-object p5, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$4;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p6, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$4;->c:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p7, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$4;->d:Lcom/cmic/sso/sdk/auth/TokenListener;

    .line 10
    .line 11
    iput-object p8, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$4;->e:Lcom/cmic/sso/sdk/auth/AuthnHelper$a;

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
    iget-object v0, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$4;->f:Lcom/cmic/sso/sdk/auth/AuthnHelper;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$4;->a:Lcom/cmic/sso/sdk/a;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$4;->b:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$4;->c:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v5, 0x3

    .line 10
    iget-object v6, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$4;->d:Lcom/cmic/sso/sdk/auth/TokenListener;

    .line 11
    .line 12
    const-string v4, "preGetMobile"

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
    iget-object v0, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$4;->f:Lcom/cmic/sso/sdk/auth/AuthnHelper;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/cmic/sso/sdk/auth/AuthnHelper;->d(Lcom/cmic/sso/sdk/auth/AuthnHelper;)Lcom/cmic/sso/sdk/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v1, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$4;->f:Lcom/cmic/sso/sdk/auth/AuthnHelper;

    .line 27
    .line 28
    invoke-static {v1}, Lcom/cmic/sso/sdk/auth/AuthnHelper;->c(Lcom/cmic/sso/sdk/auth/AuthnHelper;)J

    .line 29
    .line 30
    .line 31
    move-result-wide v1

    .line 32
    invoke-virtual {v0, v1, v2}, Lcom/cmic/sso/sdk/c;->a(J)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$4;->f:Lcom/cmic/sso/sdk/auth/AuthnHelper;

    .line 36
    .line 37
    iget-object v1, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$4;->a:Lcom/cmic/sso/sdk/a;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper$4;->e:Lcom/cmic/sso/sdk/auth/AuthnHelper$a;

    .line 40
    .line 41
    invoke-static {v0, v1, p0}, Lcom/cmic/sso/sdk/auth/AuthnHelper;->a(Lcom/cmic/sso/sdk/auth/AuthnHelper;Lcom/cmic/sso/sdk/a;Lcom/cmic/sso/sdk/auth/AuthnHelper$a;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method
