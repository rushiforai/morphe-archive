.class Lcom/immomo/momomediaext/MMLiveEngine$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ebl0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/momomediaext/MMLiveEngine;->H()V
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
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine$a;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(JLandroid/view/SurfaceView;II)V
    .locals 0

    .line 1
    iget-object p4, p0, Lcom/immomo/momomediaext/MMLiveEngine$a;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-static {p4}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 4
    .line 5
    .line 6
    move-result-object p4

    .line 7
    if-eqz p4, :cond_0

    .line 8
    .line 9
    iget-object p4, p0, Lcom/immomo/momomediaext/MMLiveEngine$a;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 10
    .line 11
    invoke-static {p4}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 12
    .line 13
    .line 14
    move-result-object p4

    .line 15
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$a;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 20
    .line 21
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->h(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    iget-object p0, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 26
    .line 27
    invoke-virtual {p4, p1, p3, p0}, Ll/enw;->S(Ljava/lang/String;Landroid/view/SurfaceView;Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public b(JI)V
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$a;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->a(Lcom/immomo/momomediaext/MMLiveEngine;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    new-instance v0, Landroid/os/Bundle;

    .line 10
    .line 11
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 19
    .line 20
    .line 21
    const/16 v2, 0x13b3

    .line 22
    .line 23
    iput v2, v1, Landroid/os/Message;->what:I

    .line 24
    .line 25
    const-string v2, "EVT_MSG"

    .line 26
    .line 27
    const-string v3, "Video Channel Remove"

    .line 28
    .line 29
    invoke-virtual {v0, v2, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const-string v2, "uid"

    .line 33
    .line 34
    long-to-int p1, p1

    .line 35
    invoke-virtual {v0, v2, p1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 36
    .line 37
    .line 38
    const-string p1, "reason"

    .line 39
    .line 40
    invoke-virtual {v0, p1, p3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method
