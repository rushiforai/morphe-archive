.class public Ll/de00$c;
.super Lcom/cosmos/photon/push/PushMessageReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/de00;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field public final synthetic a:Ll/de00;


# direct methods
.method public constructor <init>(Ll/de00;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/de00$c;->a:Ll/de00;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/cosmos/photon/push/PushMessageReceiver;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Ll/de00;Ll/ee00;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Ll/de00$c;-><init>(Ll/de00;)V

    return-void
.end method


# virtual methods
.method public isFcmOpen()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public isHonorPushOpen()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/ugl;->r()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public isHuaweiPushOpen()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public isMeizuPushOpen()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public isMiPushOpen()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public isOppoPushOpen()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public isVivoPushOpen()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public onCommand(IILjava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onNotificationMessageClicked(Lcom/cosmos/photon/push/notification/MoNotify;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/cosmos/photon/push/PushMessageReceiver;->onNotificationMessageClicked(Lcom/cosmos/photon/push/notification/MoNotify;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public onNotificationShow(Lcom/cosmos/photon/push/notification/MoNotify;)Z
    .locals 2

    .line 1
    :try_start_0
    iget-object p1, p1, Lcom/cosmos/photon/push/notification/MoNotify;->action:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const-string v1, "custom"

    .line 9
    .line 10
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iget-object p0, p0, Ll/de00$c;->a:Ll/de00;

    .line 15
    .line 16
    invoke-virtual {p0, p1, v0}, Ll/hmb0;->c(Ljava/lang/String;Z)Z
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    .line 19
    :catch_0
    const/4 p0, 0x1

    .line 20
    return p0
.end method

.method public onReceivePassThroughMessage(Lcom/cosmos/photon/push/msg/MoMessage;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/cosmos/photon/push/PushMessageReceiver;->onReceivePassThroughMessage(Lcom/cosmos/photon/push/msg/MoMessage;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/de00$c;->a:Ll/de00;

    .line 5
    .line 6
    iget-object p1, p1, Lcom/cosmos/photon/push/msg/MoMessage;->text:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, p1, v0}, Ll/hmb0;->c(Ljava/lang/String;Z)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onThirdPushRegisterResult(IILjava/lang/String;)V
    .locals 0

    .line 1
    const/16 p0, 0xa

    .line 2
    .line 3
    invoke-static {}, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->getPushSdk()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-ne p0, p1, :cond_0

    .line 8
    .line 9
    const/16 p0, 0x3e9

    .line 10
    .line 11
    if-ne p0, p2, :cond_0

    .line 12
    .line 13
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    invoke-static {}, Ll/ugl;->p()Ll/ugl;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0, p3}, Ll/ugl;->w(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public onToken(ILjava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "MoPush onToken,result="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ",token="

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, ",message="

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v2, "[common][push]"

    .line 32
    .line 33
    invoke-static {v2, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    if-nez p1, :cond_0

    .line 37
    .line 38
    iget-object p1, p0, Ll/de00$c;->a:Ll/de00;

    .line 39
    .line 40
    invoke-static {p1}, Ll/de00;->l(Ll/de00;)Lrx/subjects/a;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1, p2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Ll/de00$c;->a:Ll/de00;

    .line 48
    .line 49
    invoke-static {p0}, Ll/de00;->l(Ll/de00;)Lrx/subjects/a;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Lrx/subjects/a;->onCompleted()V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_0
    new-instance p2, Ljava/lang/IllegalStateException;

    .line 58
    .line 59
    new-instance v0, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    const-string v2, "result="

    .line 62
    .line 63
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p3

    .line 79
    invoke-direct {p2, p3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    iget-object p0, p0, Ll/de00$c;->a:Ll/de00;

    .line 83
    .line 84
    const/4 p3, -0x1

    .line 85
    if-ne p1, p3, :cond_1

    .line 86
    .line 87
    invoke-static {p0}, Ll/de00;->l(Ll/de00;)Lrx/subjects/a;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    new-instance p1, Lcom/tantanapp/common/network/NetIgnoredException;

    .line 92
    .line 93
    invoke-direct {p1, p2}, Lcom/tantanapp/common/network/NetIgnoredException;-><init>(Ljava/lang/Exception;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onError(Ljava/lang/Throwable;)V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_1
    invoke-static {p0}, Ll/de00;->l(Ll/de00;)Lrx/subjects/a;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-virtual {p0, p2}, Lrx/subjects/a;->onError(Ljava/lang/Throwable;)V

    .line 105
    .line 106
    .line 107
    return-void
.end method
