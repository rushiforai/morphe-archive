.class Lcom/cosmos/photon/push/PushImManager$1$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cosmos/photon/push/PushImManager$1;->onReceivePacket([B)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/cosmos/photon/push/PushImManager$1;


# direct methods
.method public constructor <init>(Lcom/cosmos/photon/push/PushImManager$1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/PushImManager$1$1;->this$1:Lcom/cosmos/photon/push/PushImManager$1;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/cosmos/photon/push/PushImManager$1$1;->this$1:Lcom/cosmos/photon/push/PushImManager$1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/cosmos/photon/push/PushImManager$1;->this$0:Lcom/cosmos/photon/push/PushImManager;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/cosmos/photon/push/PushImManager;->disconnect()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/cosmos/photon/push/PushImManager$1$1;->this$1:Lcom/cosmos/photon/push/PushImManager$1;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/cosmos/photon/push/PushImManager$1;->this$0:Lcom/cosmos/photon/push/PushImManager;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/cosmos/photon/push/PushImManager;->access$100(Lcom/cosmos/photon/push/PushImManager;)Lcom/cosmos/photon/push/PushImManager$AuthListener;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/cosmos/photon/push/PushImManager$1$1;->this$1:Lcom/cosmos/photon/push/PushImManager$1;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/cosmos/photon/push/PushImManager$1;->this$0:Lcom/cosmos/photon/push/PushImManager;

    .line 21
    .line 22
    invoke-static {p0}, Lcom/cosmos/photon/push/PushImManager;->access$100(Lcom/cosmos/photon/push/PushImManager;)Lcom/cosmos/photon/push/PushImManager$AuthListener;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const/16 v0, 0x199

    .line 27
    .line 28
    invoke-interface {p0, v0}, Lcom/cosmos/photon/push/PushImManager$AuthListener;->onAuthEvent(I)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method
