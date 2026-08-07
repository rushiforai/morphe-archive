.class Lcom/immomo/momomediaext/MMLiveEngine$l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ytl;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/momomediaext/MMLiveEngine;-><init>(Lcom/immomo/momomediaext/utils/MMLiveUserConfig;Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/momomediaext/MMLiveEngine;


# direct methods
.method public constructor <init>(Lcom/immomo/momomediaext/MMLiveEngine;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine$l;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public b()V
    .locals 2

    .line 1
    const-string v0, "beauty"

    .line 2
    .line 3
    const-string v1, "lightingEngine init"

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->b([Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$l;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->a(Lcom/immomo/momomediaext/MMLiveEngine;)Landroid/os/Handler;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$l;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->a(Lcom/immomo/momomediaext/MMLiveEngine;)Landroid/os/Handler;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Lcom/immomo/momomediaext/MMLiveEngine$l$a;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Lcom/immomo/momomediaext/MMLiveEngine$l$a;-><init>(Lcom/immomo/momomediaext/MMLiveEngine$l;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public onBeautyError(ILjava/lang/String;)V
    .locals 4

    .line 1
    const-string v0, "beauty"

    .line 2
    .line 3
    const-string v1, "beauty init error"

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->b([Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$l;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->a(Lcom/immomo/momomediaext/MMLiveEngine;)Landroid/os/Handler;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    new-instance v1, Landroid/os/Bundle;

    .line 21
    .line 22
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v2, v1}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 30
    .line 31
    .line 32
    const/16 v3, 0x13c0

    .line 33
    .line 34
    iput v3, v2, Landroid/os/Message;->what:I

    .line 35
    .line 36
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$l;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 37
    .line 38
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->h(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    iget-object p0, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 43
    .line 44
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    const-string v3, "pushtype"

    .line 49
    .line 50
    invoke-virtual {v1, v3, p0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 51
    .line 52
    .line 53
    const-string p0, "errorCode"

    .line 54
    .line 55
    invoke-virtual {v1, p0, p1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 56
    .line 57
    .line 58
    const-string p0, "errorMsg"

    .line 59
    .line 60
    invoke-virtual {v1, p0, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 64
    .line 65
    .line 66
    :cond_0
    return-void
.end method
