.class public Lcom/cosmos/photon/push/channel/ChannelConstant;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cosmos/photon/push/channel/ChannelConstant$Action;,
        Lcom/cosmos/photon/push/channel/ChannelConstant$Keys;
    }
.end annotation


# static fields
.field public static final ADDRESS_DEFAULT:Ljava/lang/String; = "com.immomo.momo.push.core"

.field public static final COMMAND_CHANNEL:Ljava/lang/String; = "cmd:channel"

.field public static final COMMAND_EXIT:Ljava/lang/String; = "cmd:exit"

.field public static final PERMISSION_PUSH:Ljava/lang/String; = "com.immomo.common.PUSH_SERVICE"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getChannelCommand()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "cmd:channel\nend"

    .line 2
    .line 3
    return-object v0
.end method

.method public static getExitCommand()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "cmd:exit\nend"

    .line 2
    .line 3
    return-object v0
.end method

.method public static getPushServiceAction(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string p0, ".push.core"

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static getSchedulerPushServiceAction(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string p0, ".push.scheduler"

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method
