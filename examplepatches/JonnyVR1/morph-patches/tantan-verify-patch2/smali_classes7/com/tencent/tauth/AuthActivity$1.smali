.class Lcom/tencent/tauth/AuthActivity$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/tauth/AuthActivity$ActionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/tauth/AuthActivity;->a()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/tauth/AuthActivity;


# direct methods
.method public constructor <init>(Lcom/tencent/tauth/AuthActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/tauth/AuthActivity$1;->a:Lcom/tencent/tauth/AuthActivity;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleAction(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 2

    .line 1
    const-string v0, "openSDK_LOG.AuthActivity"

    .line 2
    .line 3
    const-string v1, "-->handleActionUri--common channel. "

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/tencent/open/log/SLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Landroid/content/Intent;

    .line 9
    .line 10
    const-class v1, Lcom/tencent/connect/common/AssistActivity;

    .line 11
    .line 12
    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p2}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    const-string p1, "key_request_code"

    .line 19
    .line 20
    const/16 p2, 0x2782

    .line 21
    .line 22
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    const/high16 p1, 0x24000000

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/tencent/tauth/AuthActivity$1;->a:Lcom/tencent/tauth/AuthActivity;

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/tencent/tauth/AuthActivity$1;->a:Lcom/tencent/tauth/AuthActivity;

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/tencent/tauth/AuthActivity;->finish()V

    .line 38
    .line 39
    .line 40
    return-void
.end method
