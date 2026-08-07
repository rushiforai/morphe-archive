.class public Ll/dtf0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput-object p1, p0, Ll/dtf0;->a:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()V
    .locals 7

    .line 1
    invoke-static {}, Ll/d79;->D()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v1, p0, Ll/dtf0;->a:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    sget p0, Lcom/p1/mobile/putong/core/R$string;->wo:I

    .line 15
    .line 16
    invoke-virtual {v1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-static {}, Ll/d79;->D()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    xor-int/lit8 v5, p0, 0x1

    .line 29
    .line 30
    const/4 v6, 0x0

    .line 31
    const/4 v4, 0x1

    .line 32
    invoke-static/range {v1 .. v6}, Lcom/p1/mobile/putong/ui/webview/mk/AccessTokenMkWebViewAct;->q2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZ)Landroid/content/Intent;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method
