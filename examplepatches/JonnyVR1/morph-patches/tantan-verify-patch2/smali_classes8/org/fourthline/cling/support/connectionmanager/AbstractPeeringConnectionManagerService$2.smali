.class Lorg/fourthline/cling/support/connectionmanager/AbstractPeeringConnectionManagerService$2;
.super Lorg/fourthline/cling/support/connectionmanager/callback/ConnectionComplete;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/fourthline/cling/support/connectionmanager/AbstractPeeringConnectionManagerService;->closeConnectionWithPeer(Lorg/fourthline/cling/controlpoint/ControlPoint;Lorg/fourthline/cling/model/meta/Service;Lorg/fourthline/cling/support/model/ConnectionInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/fourthline/cling/support/connectionmanager/AbstractPeeringConnectionManagerService;

.field final synthetic val$connectionInfo:Lorg/fourthline/cling/support/model/ConnectionInfo;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/support/connectionmanager/AbstractPeeringConnectionManagerService;Lorg/fourthline/cling/model/meta/Service;Lorg/fourthline/cling/controlpoint/ControlPoint;ILorg/fourthline/cling/support/model/ConnectionInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/connectionmanager/AbstractPeeringConnectionManagerService$2;->this$0:Lorg/fourthline/cling/support/connectionmanager/AbstractPeeringConnectionManagerService;

    .line 2
    .line 3
    iput-object p5, p0, Lorg/fourthline/cling/support/connectionmanager/AbstractPeeringConnectionManagerService$2;->val$connectionInfo:Lorg/fourthline/cling/support/model/ConnectionInfo;

    .line 4
    .line 5
    invoke-direct {p0, p2, p3, p4}, Lorg/fourthline/cling/support/connectionmanager/callback/ConnectionComplete;-><init>(Lorg/fourthline/cling/model/meta/Service;Lorg/fourthline/cling/controlpoint/ControlPoint;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public failure(Lorg/fourthline/cling/model/action/ActionInvocation;Lorg/fourthline/cling/model/message/UpnpResponse;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/connectionmanager/AbstractPeeringConnectionManagerService$2;->this$0:Lorg/fourthline/cling/support/connectionmanager/AbstractPeeringConnectionManagerService;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lorg/fourthline/cling/support/connectionmanager/AbstractPeeringConnectionManagerService;->peerFailure(Lorg/fourthline/cling/model/action/ActionInvocation;Lorg/fourthline/cling/model/message/UpnpResponse;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public success(Lorg/fourthline/cling/model/action/ActionInvocation;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lorg/fourthline/cling/support/connectionmanager/AbstractPeeringConnectionManagerService$2;->this$0:Lorg/fourthline/cling/support/connectionmanager/AbstractPeeringConnectionManagerService;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/fourthline/cling/support/connectionmanager/AbstractPeeringConnectionManagerService$2;->val$connectionInfo:Lorg/fourthline/cling/support/model/ConnectionInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/ConnectionInfo;->getConnectionID()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {p1, p0}, Lorg/fourthline/cling/support/connectionmanager/AbstractPeeringConnectionManagerService;->removeConnection(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
