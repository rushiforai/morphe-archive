.class Lcom/immomo/momomediaext/MMLiveEngine$i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/pub/MomoPipelineModuleRegister$c;


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
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine$i;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/c4m;)V
    .locals 5

    .line 1
    new-instance v0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine$i;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 7
    .line 8
    invoke-static {v1}, Lcom/immomo/momomediaext/MMLiveEngine;->a(Lcom/immomo/momomediaext/MMLiveEngine;)Landroid/os/Handler;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    if-eqz v1, :cond_4

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v2, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 19
    .line 20
    .line 21
    const/16 v3, 0x106d

    .line 22
    .line 23
    iput v3, v2, Landroid/os/Message;->what:I

    .line 24
    .line 25
    const-string v3, "EVT_MSG"

    .line 26
    .line 27
    const-string v4, "publish Stopped"

    .line 28
    .line 29
    invoke-virtual {v0, v3, v4}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    sget-object v3, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfNONE:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 33
    .line 34
    instance-of v4, p1, Ll/t410;

    .line 35
    .line 36
    if-eqz v4, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    instance-of v4, p1, Ll/uc0;

    .line 40
    .line 41
    if-eqz v4, :cond_1

    .line 42
    .line 43
    sget-object v3, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfAG:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    instance-of v4, p1, Ll/xmj0;

    .line 47
    .line 48
    if-eqz v4, :cond_2

    .line 49
    .line 50
    sget-object v3, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfTX:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    instance-of v4, p1, Ll/ce00;

    .line 54
    .line 55
    if-eqz v4, :cond_3

    .line 56
    .line 57
    sget-object v3, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfMM:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 58
    .line 59
    :cond_3
    :goto_0
    const-string v4, "pushtype"

    .line 60
    .line 61
    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    invoke-virtual {v0, v4, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 69
    .line 70
    .line 71
    :cond_4
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$i;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 72
    .line 73
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->c(Lcom/immomo/momomediaext/MMLiveEngine;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    monitor-enter v0

    .line 78
    :try_start_0
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine$i;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 79
    .line 80
    invoke-static {v1}, Lcom/immomo/momomediaext/MMLiveEngine;->d(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    if-eqz v1, :cond_5

    .line 85
    .line 86
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$i;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 87
    .line 88
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->d(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-interface {p0, p1}, Lcom/momo/pub/MomoPipelineModuleRegister;->z(Ll/c4m;)V

    .line 93
    .line 94
    .line 95
    invoke-interface {p1}, Ll/c4m;->release()V

    .line 96
    .line 97
    .line 98
    goto :goto_1

    .line 99
    :catchall_0
    move-exception p0

    .line 100
    goto :goto_2

    .line 101
    :cond_5
    :goto_1
    monitor-exit v0

    .line 102
    return-void

    .line 103
    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 104
    throw p0
.end method

.method public b(Ll/c4m;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "MomoCamera"

    .line 6
    .line 7
    const-string v2, "onRecordPrepared"

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Landroid/os/Bundle;

    .line 13
    .line 14
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$i;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->a(Lcom/immomo/momomediaext/MMLiveEngine;)Landroid/os/Handler;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    if-eqz p0, :cond_4

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 30
    .line 31
    .line 32
    const/16 v2, 0x1074

    .line 33
    .line 34
    iput v2, v1, Landroid/os/Message;->what:I

    .line 35
    .line 36
    const-string v2, "EVT_MSG"

    .line 37
    .line 38
    const-string v3, "publish prepared"

    .line 39
    .line 40
    invoke-virtual {v0, v2, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    sget-object v2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfNONE:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 44
    .line 45
    instance-of v3, p1, Ll/t410;

    .line 46
    .line 47
    if-eqz v3, :cond_0

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    instance-of v3, p1, Ll/uc0;

    .line 51
    .line 52
    if-eqz v3, :cond_1

    .line 53
    .line 54
    sget-object v2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfAG:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    instance-of v3, p1, Ll/xmj0;

    .line 58
    .line 59
    if-eqz v3, :cond_2

    .line 60
    .line 61
    sget-object v2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfTX:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    instance-of p1, p1, Ll/ce00;

    .line 65
    .line 66
    if-eqz p1, :cond_3

    .line 67
    .line 68
    sget-object v2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfMM:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 69
    .line 70
    :cond_3
    :goto_0
    const-string p1, "pushtype"

    .line 71
    .line 72
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    invoke-virtual {v0, p1, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 80
    .line 81
    .line 82
    :cond_4
    return-void
.end method
