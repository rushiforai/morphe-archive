.class Lcom/immomo/momomediaext/MMLiveEngine$h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/pub/MomoPipelineModuleRegister$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/momomediaext/MMLiveEngine;
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
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine$h;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(IILl/c4m;)V
    .locals 2

    .line 1
    new-instance p3, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {p3}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$h;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->h(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v0, v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const-string v1, "pushtype"

    .line 19
    .line 20
    invoke-virtual {p3, v1, v0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 21
    .line 22
    .line 23
    const-string v0, "what"

    .line 24
    .line 25
    invoke-virtual {p3, v0, p1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 26
    .line 27
    .line 28
    const-string p1, "extra"

    .line 29
    .line 30
    invoke-virtual {p3, p1, p2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$h;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 34
    .line 35
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->a(Lcom/immomo/momomediaext/MMLiveEngine;)Landroid/os/Handler;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    if-eqz p0, :cond_0

    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    const/16 p2, -0x16a8

    .line 46
    .line 47
    iput p2, p1, Landroid/os/Message;->what:I

    .line 48
    .line 49
    invoke-virtual {p1, p3}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 53
    .line 54
    .line 55
    :cond_0
    return-void
.end method

.method public b(IILl/c4m;)V
    .locals 2

    .line 1
    new-instance p3, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {p3}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$h;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->h(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v0, v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const-string v1, "pushtype"

    .line 19
    .line 20
    invoke-virtual {p3, v1, v0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 21
    .line 22
    .line 23
    const-string v0, "what"

    .line 24
    .line 25
    invoke-virtual {p3, v0, p1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 26
    .line 27
    .line 28
    const-string p1, "extra"

    .line 29
    .line 30
    invoke-virtual {p3, p1, p2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$h;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 34
    .line 35
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->a(Lcom/immomo/momomediaext/MMLiveEngine;)Landroid/os/Handler;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    if-eqz p0, :cond_0

    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    const/16 p2, -0x16a9

    .line 46
    .line 47
    iput p2, p1, Landroid/os/Message;->what:I

    .line 48
    .line 49
    invoke-virtual {p1, p3}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 53
    .line 54
    .line 55
    :cond_0
    return-void
.end method
