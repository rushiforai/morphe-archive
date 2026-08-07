.class public Lcom/p1/mobile/putong/core/ui/messages/game/MsgGameMkWebViewAct;
.super Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/api/c0$c;


# static fields
.field public static j:Ljava/lang/String; = ""


# instance fields
.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "game_auto_play"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/game/MsgGameMkWebViewAct;->g:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/game/MsgGameMkWebViewAct;->i:I

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic n2(Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->h:Lcom/p1/mobile/putong/core/api/CoreInnerPush$InnerPushType;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/api/CoreInnerPush$InnerPushType;->NEW_MSG:Lcom/p1/mobile/putong/core/api/CoreInnerPush$InnerPushType;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic o2(Lcom/p1/mobile/putong/core/ui/messages/game/MsgGameMkWebViewAct;Ll/ovb0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/game/MsgGameMkWebViewAct;->r2(Ll/ovb0;)V

    return-void
.end method

.method public static synthetic p2(Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0, p0}, Ll/r97;->b2(Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public M0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/messages/game/MsgGameMkWebViewAct;->i:I

    .line 2
    .line 3
    add-int/lit8 p1, p1, -0x1

    .line 4
    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/game/MsgGameMkWebViewAct;->i:I

    .line 6
    .line 7
    invoke-static {}, Ll/rv4;->h()V

    .line 8
    .line 9
    .line 10
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/messages/game/MsgGameMkWebViewAct;->i:I

    .line 11
    .line 12
    if-gtz p1, :cond_0

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/game/MsgGameMkWebViewAct;->i:I

    .line 16
    .line 17
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 20
    .line 21
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/c0;->t(Lcom/p1/mobile/putong/core/api/c0$c;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public finish()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public initDataOnCreate()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "game_conv_id"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/game/MsgGameMkWebViewAct;->h:Ljava/lang/String;

    .line 15
    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/game/MsgGameMkWebViewAct;->g:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/game/MsgGameMkWebViewAct;->h:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/game/MsgGameMkWebViewAct;->g:Ljava/lang/String;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/game/MsgGameMkWebViewAct;->h:Ljava/lang/String;

    .line 38
    .line 39
    sput-object p0, Lcom/p1/mobile/putong/core/ui/messages/game/MsgGameMkWebViewAct;->j:Ljava/lang/String;

    .line 40
    .line 41
    return-void
.end method

.method public initSubscription()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/game/MsgGameMkWebViewAct;->q2()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onDestroyLifecycle()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->onDestroyLifecycle()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/c0;->t(Lcom/p1/mobile/putong/core/api/c0$c;)V

    .line 9
    .line 10
    .line 11
    const-string p0, ""

    .line 12
    .line 13
    sput-object p0, Lcom/p1/mobile/putong/core/ui/messages/game/MsgGameMkWebViewAct;->j:Ljava/lang/String;

    .line 14
    .line 15
    return-void
.end method

.method public final q2()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j1:Lcom/p1/mobile/putong/core/api/CoreInnerPush;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreInnerPush;->d()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/r710;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/r710;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/s710;

    .line 23
    .line 24
    invoke-direct {v1}, Ll/s710;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->h2:Lrx/subjects/b;

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Ll/t710;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/t710;-><init>(Lcom/p1/mobile/putong/core/ui/messages/game/MsgGameMkWebViewAct;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final synthetic r2(Ll/ovb0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/game/MsgGameMkWebViewAct;->h:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p1, Ll/ovb0;->a:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Ljava/lang/CharSequence;

    .line 6
    .line 7
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p1, Ll/ovb0;->b:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v0, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-lez v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p1, Ll/ovb0;->b:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast v0, Ljava/lang/Integer;

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/game/MsgGameMkWebViewAct;->s2(I)V

    .line 32
    .line 33
    .line 34
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-interface {p0, p1}, Ll/r97;->w1(Ll/ovb0;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public final s2(I)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/game/MsgGameMkWebViewAct;->i:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    add-int/2addr v0, p1

    .line 6
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/game/MsgGameMkWebViewAct;->i:I

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    add-int/2addr v0, p1

    .line 10
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/game/MsgGameMkWebViewAct;->i:I

    .line 11
    .line 12
    const/4 p1, 0x3

    .line 13
    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/game/MsgGameMkWebViewAct;->i:I

    .line 18
    .line 19
    new-instance p1, Lcom/p1/mobile/putong/core/api/c0$a;

    .line 20
    .line 21
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/api/c0$a;-><init>()V

    .line 22
    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/api/c0$a;->a(Z)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/c0$a;->d(Lcom/p1/mobile/putong/core/api/c0$c;)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/game/MsgGameMkWebViewAct;->g:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/c0$a;->g(Ljava/lang/String;)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-wide/16 v0, 0x1

    .line 40
    .line 41
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/api/c0$a;->h(J)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const/4 v0, 0x1

    .line 46
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/c0$a;->b(Z)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    const-wide/32 v0, 0xea60

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/api/c0$a;->i(J)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 54
    .line 55
    .line 56
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 59
    .line 60
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/c0;->r(Lcom/p1/mobile/putong/core/api/c0$a;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    return-void
.end method
