.class public Ll/mz2$a;
.super Landroid/text/style/ClickableSpan;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/mz2;->B()Landroid/text/style/ClickableSpan;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/mz2;


# direct methods
.method public constructor <init>(Ll/mz2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mz2$a;->a:Ll/mz2;

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

    .line 1
    iget-object p1, p0, Ll/mz2$a;->a:Ll/mz2;

    .line 2
    .line 3
    invoke-static {p1}, Ll/mz2;->v(Ll/mz2;)Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    instance-of p1, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 8
    .line 9
    const-string v0, ""

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object p0, p0, Ll/mz2$a;->a:Ll/mz2;

    .line 19
    .line 20
    invoke-static {p0}, Ll/mz2;->v(Ll/mz2;)Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string v2, "messageDeeplink"

    .line 25
    .line 26
    invoke-interface {p1, p0, v1, v2, v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->ji(Landroid/content/Context;ZLjava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iget-object p0, p0, Ll/mz2$a;->a:Ll/mz2;

    .line 35
    .line 36
    invoke-static {p0}, Ll/mz2;->v(Ll/mz2;)Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const-string v2, "home"

    .line 41
    .line 42
    invoke-interface {p1, p0, v1, v2, v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->ji(Landroid/content/Context;ZLjava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/text/style/ClickableSpan;->updateDrawState(Landroid/text/TextPaint;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/mz2$a;->a:Ll/mz2;

    .line 5
    .line 6
    invoke-static {p0}, Ll/mz2;->v(Ll/mz2;)Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    sget v0, Ll/c9c0;->K:I

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/content/Context;->getColor(I)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setColor(I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
