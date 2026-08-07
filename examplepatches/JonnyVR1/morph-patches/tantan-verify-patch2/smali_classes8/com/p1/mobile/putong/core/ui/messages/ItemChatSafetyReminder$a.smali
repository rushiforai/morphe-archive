.class public Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder$a;
.super Landroid/text/style/ClickableSpan;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;->f(Lcom/p1/mobile/putong/core/data/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder$a;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/text/style/ClickableSpan;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 p1, 0x0

    .line 2
    new-array p1, p1, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v0, "e_alert_cheat_prevention__dangerous_user_tips"

    .line 5
    .line 6
    const-string v1, "p_chat_view"

    .line 7
    .line 8
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder$a;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder$a;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string v0, "https://live-web.tantanapp.com/anti_fraud_reminder/guide"

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    const-string v2, ""

    .line 27
    .line 28
    invoke-static {p0, v2, v0, v1}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->b2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 0
    .param p1    # Landroid/text/TextPaint;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/text/style/ClickableSpan;->updateDrawState(Landroid/text/TextPaint;)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setUnderlineText(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
