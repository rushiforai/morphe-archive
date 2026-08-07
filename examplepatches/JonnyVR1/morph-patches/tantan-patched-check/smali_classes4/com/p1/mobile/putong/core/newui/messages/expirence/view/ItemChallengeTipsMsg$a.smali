.class public Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemChallengeTipsMsg$a;
.super Landroid/text/style/ClickableSpan;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemChallengeTipsMsg;->c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Ll/n100;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic d:Ll/n100;

.field public final synthetic e:Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemChallengeTipsMsg;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemChallengeTipsMsg;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Ll/n100;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemChallengeTipsMsg$a;->e:Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemChallengeTipsMsg;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemChallengeTipsMsg$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemChallengeTipsMsg$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemChallengeTipsMsg$a;->c:Lcom/p1/mobile/putong/core/data/Message;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemChallengeTipsMsg$a;->d:Ll/n100;

    .line 10
    .line 11
    invoke-direct {p0}, Landroid/text/style/ClickableSpan;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;)V
    .locals 2

    .line 1
    iget-boolean v0, p2, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->userState:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v1, p2, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->otherUserState:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 18
    .line 19
    const-string v0, "conversation_plus"

    .line 20
    .line 21
    const-string v1, ""

    .line 22
    .line 23
    invoke-interface {p2, p0, v1, p1, v0}, Ll/r97;->d5(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    if-nez v0, :cond_1

    .line 28
    .line 29
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->userStateText:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-nez p0, :cond_1

    .line 36
    .line 37
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->userStateText:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {p0}, Ll/r1j0;->b(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    iget-boolean p0, p2, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->otherUserState:Z

    .line 44
    .line 45
    if-nez p0, :cond_2

    .line 46
    .line 47
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->otherUserStateText:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-nez p0, :cond_2

    .line 54
    .line 55
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->otherUserStateText:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {p0}, Ll/r1j0;->b(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    :cond_2
    return-void
.end method

.method public static synthetic b(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemChallengeTipsMsg$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object v1, v0, Lcom/p1/mobile/putong/core/api/c;->I1:Ll/uf7;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemChallengeTipsMsg$a;->b:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v1, v0, v2}, Ll/uf7;->d3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemChallengeTipsMsg$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemChallengeTipsMsg$a;->c:Lcom/p1/mobile/putong/core/data/Message;

    .line 28
    .line 29
    new-instance v2, Ll/m3q;

    .line 30
    .line 31
    invoke-direct {v2, v0, v1}, Ll/m3q;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 32
    .line 33
    .line 34
    new-instance v0, Ll/n3q;

    .line 35
    .line 36
    invoke-direct {v0}, Ll/n3q;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-static {v2, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemChallengeTipsMsg$a;->e:Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemChallengeTipsMsg;

    .line 47
    .line 48
    const/4 v0, 0x0

    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemChallengeTipsMsg$a;->d:Ll/n100;

    .line 50
    .line 51
    invoke-static {p1, v0, p0}, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemChallengeTipsMsg;->a(Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemChallengeTipsMsg;ZLl/n100;)V

    .line 52
    .line 53
    .line 54
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
