.class public Lcom/tantanapp/push/oppo/OPushService$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/heytap/mcssdk/callback/PushCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantanapp/push/oppo/OPushService$a;->i()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/tantanapp/push/oppo/OPushService$a;


# direct methods
.method public constructor <init>(Lcom/tantanapp/push/oppo/OPushService$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/push/oppo/OPushService$a$a;->a:Lcom/tantanapp/push/oppo/OPushService$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onGetAliases(ILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/heytap/mcssdk/mode/SubscribeResult;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public onGetNotificationStatus(II)V
    .locals 0

    return-void
.end method

.method public onGetPushStatus(II)V
    .locals 0

    return-void
.end method

.method public onGetTags(ILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/heytap/mcssdk/mode/SubscribeResult;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public onGetUserAccounts(ILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/heytap/mcssdk/mode/SubscribeResult;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public onRegister(ILjava/lang/String;)V
    .locals 2

    .line 1
    sget-boolean v0, Ll/kmk0;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    filled-new-array {v0, p2}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "oppo push register info,code:%d,s:%s"

    .line 14
    .line 15
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    :cond_0
    if-nez p1, :cond_1

    .line 19
    .line 20
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-nez p1, :cond_1

    .line 25
    .line 26
    iget-object p1, p0, Lcom/tantanapp/push/oppo/OPushService$a$a;->a:Lcom/tantanapp/push/oppo/OPushService$a;

    .line 27
    .line 28
    invoke-virtual {p1, p2}, Ll/hmb0;->h(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/tantanapp/push/oppo/OPushService$a$a;->a:Lcom/tantanapp/push/oppo/OPushService$a;

    .line 32
    .line 33
    const/4 p1, 0x1

    .line 34
    invoke-virtual {p0, p1}, Ll/hmb0;->f(Z)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    iget-object p1, p0, Lcom/tantanapp/push/oppo/OPushService$a$a;->a:Lcom/tantanapp/push/oppo/OPushService$a;

    .line 39
    .line 40
    const/4 p2, 0x0

    .line 41
    invoke-virtual {p1, p2}, Ll/hmb0;->h(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Lcom/tantanapp/push/oppo/OPushService$a$a;->a:Lcom/tantanapp/push/oppo/OPushService$a;

    .line 45
    .line 46
    const/4 p1, 0x0

    .line 47
    invoke-virtual {p0, p1}, Ll/hmb0;->f(Z)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public onSetAliases(ILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/heytap/mcssdk/mode/SubscribeResult;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public onSetPushTime(ILjava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onSetTags(ILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/heytap/mcssdk/mode/SubscribeResult;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public onSetUserAccounts(ILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/heytap/mcssdk/mode/SubscribeResult;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public onUnRegister(I)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/push/oppo/OPushService$a$a;->a:Lcom/tantanapp/push/oppo/OPushService$a;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Ll/hmb0;->f(Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public onUnsetAliases(ILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/heytap/mcssdk/mode/SubscribeResult;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public onUnsetTags(ILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/heytap/mcssdk/mode/SubscribeResult;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public onUnsetUserAccounts(ILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/heytap/mcssdk/mode/SubscribeResult;",
            ">;)V"
        }
    .end annotation

    return-void
.end method
