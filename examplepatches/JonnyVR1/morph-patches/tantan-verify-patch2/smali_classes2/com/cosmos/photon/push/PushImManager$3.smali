.class Lcom/cosmos/photon/push/PushImManager$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cosmos/photon/push/PushImManager;->handleMessage(Landroid/os/Message;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cosmos/photon/push/PushImManager;


# direct methods
.method public constructor <init>(Lcom/cosmos/photon/push/PushImManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/PushImManager$3;->this$0:Lcom/cosmos/photon/push/PushImManager;

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
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/PushImManager$3;->this$0:Lcom/cosmos/photon/push/PushImManager;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/cosmos/photon/push/PushImManager;->disconnect()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
