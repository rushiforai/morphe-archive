.class Lorg/fourthline/cling/support/connectionmanager/AbstractPeeringConnectionManagerService$1;
.super Lorg/fourthline/cling/support/connectionmanager/callback/PrepareForConnection;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/fourthline/cling/support/connectionmanager/AbstractPeeringConnectionManagerService;->createConnectionWithPeer(Lorg/fourthline/cling/model/ServiceReference;Lorg/fourthline/cling/controlpoint/ControlPoint;Lorg/fourthline/cling/model/meta/Service;Lorg/fourthline/cling/support/model/ProtocolInfo;Lorg/fourthline/cling/support/model/ConnectionInfo$Direction;)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/fourthline/cling/support/connectionmanager/AbstractPeeringConnectionManagerService;

.field final synthetic val$direction:Lorg/fourthline/cling/support/model/ConnectionInfo$Direction;

.field final synthetic val$failed:[Z

.field final synthetic val$localConnectionID:I

.field final synthetic val$peerService:Lorg/fourthline/cling/model/meta/Service;

.field final synthetic val$protInfo:Lorg/fourthline/cling/support/model/ProtocolInfo;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/support/connectionmanager/AbstractPeeringConnectionManagerService;Lorg/fourthline/cling/model/meta/Service;Lorg/fourthline/cling/controlpoint/ControlPoint;Lorg/fourthline/cling/support/model/ProtocolInfo;Lorg/fourthline/cling/model/ServiceReference;ILorg/fourthline/cling/support/model/ConnectionInfo$Direction;ILorg/fourthline/cling/support/model/ProtocolInfo;Lorg/fourthline/cling/model/meta/Service;Lorg/fourthline/cling/support/model/ConnectionInfo$Direction;[Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/connectionmanager/AbstractPeeringConnectionManagerService$1;->this$0:Lorg/fourthline/cling/support/connectionmanager/AbstractPeeringConnectionManagerService;

    .line 2
    .line 3
    iput p8, p0, Lorg/fourthline/cling/support/connectionmanager/AbstractPeeringConnectionManagerService$1;->val$localConnectionID:I

    .line 4
    .line 5
    iput-object p9, p0, Lorg/fourthline/cling/support/connectionmanager/AbstractPeeringConnectionManagerService$1;->val$protInfo:Lorg/fourthline/cling/support/model/ProtocolInfo;

    .line 6
    .line 7
    iput-object p10, p0, Lorg/fourthline/cling/support/connectionmanager/AbstractPeeringConnectionManagerService$1;->val$peerService:Lorg/fourthline/cling/model/meta/Service;

    .line 8
    .line 9
    iput-object p11, p0, Lorg/fourthline/cling/support/connectionmanager/AbstractPeeringConnectionManagerService$1;->val$direction:Lorg/fourthline/cling/support/model/ConnectionInfo$Direction;

    .line 10
    .line 11
    iput-object p12, p0, Lorg/fourthline/cling/support/connectionmanager/AbstractPeeringConnectionManagerService$1;->val$failed:[Z

    .line 12
    .line 13
    move-object p1, p2

    .line 14
    move-object p2, p3

    .line 15
    move-object p3, p4

    .line 16
    move-object p4, p5

    .line 17
    move p5, p6

    .line 18
    move-object p6, p7

    .line 19
    invoke-direct/range {p0 .. p6}, Lorg/fourthline/cling/support/connectionmanager/callback/PrepareForConnection;-><init>(Lorg/fourthline/cling/model/meta/Service;Lorg/fourthline/cling/controlpoint/ControlPoint;Lorg/fourthline/cling/support/model/ProtocolInfo;Lorg/fourthline/cling/model/ServiceReference;ILorg/fourthline/cling/support/model/ConnectionInfo$Direction;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public failure(Lorg/fourthline/cling/model/action/ActionInvocation;Lorg/fourthline/cling/model/message/UpnpResponse;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/fourthline/cling/support/connectionmanager/AbstractPeeringConnectionManagerService$1;->this$0:Lorg/fourthline/cling/support/connectionmanager/AbstractPeeringConnectionManagerService;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2, p3}, Lorg/fourthline/cling/support/connectionmanager/AbstractPeeringConnectionManagerService;->peerFailure(Lorg/fourthline/cling/model/action/ActionInvocation;Lorg/fourthline/cling/model/message/UpnpResponse;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lorg/fourthline/cling/support/connectionmanager/AbstractPeeringConnectionManagerService$1;->val$failed:[Z

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    const/4 p2, 0x1

    .line 10
    aput-boolean p2, p0, p1

    .line 11
    .line 12
    return-void
.end method

.method public received(Lorg/fourthline/cling/model/action/ActionInvocation;III)V
    .locals 9

    .line 1
    new-instance v0, Lorg/fourthline/cling/support/model/ConnectionInfo;

    .line 2
    .line 3
    iget v1, p0, Lorg/fourthline/cling/support/connectionmanager/AbstractPeeringConnectionManagerService$1;->val$localConnectionID:I

    .line 4
    .line 5
    iget-object v4, p0, Lorg/fourthline/cling/support/connectionmanager/AbstractPeeringConnectionManagerService$1;->val$protInfo:Lorg/fourthline/cling/support/model/ProtocolInfo;

    .line 6
    .line 7
    iget-object p1, p0, Lorg/fourthline/cling/support/connectionmanager/AbstractPeeringConnectionManagerService$1;->val$peerService:Lorg/fourthline/cling/model/meta/Service;

    .line 8
    .line 9
    invoke-virtual {p1}, Lorg/fourthline/cling/model/meta/Service;->getReference()Lorg/fourthline/cling/model/ServiceReference;

    .line 10
    .line 11
    .line 12
    move-result-object v5

    .line 13
    iget-object p1, p0, Lorg/fourthline/cling/support/connectionmanager/AbstractPeeringConnectionManagerService$1;->val$direction:Lorg/fourthline/cling/support/model/ConnectionInfo$Direction;

    .line 14
    .line 15
    invoke-virtual {p1}, Lorg/fourthline/cling/support/model/ConnectionInfo$Direction;->getOpposite()Lorg/fourthline/cling/support/model/ConnectionInfo$Direction;

    .line 16
    .line 17
    .line 18
    move-result-object v7

    .line 19
    sget-object v8, Lorg/fourthline/cling/support/model/ConnectionInfo$Status;->OK:Lorg/fourthline/cling/support/model/ConnectionInfo$Status;

    .line 20
    .line 21
    move v6, p2

    .line 22
    move v2, p3

    .line 23
    move v3, p4

    .line 24
    invoke-direct/range {v0 .. v8}, Lorg/fourthline/cling/support/model/ConnectionInfo;-><init>(IIILorg/fourthline/cling/support/model/ProtocolInfo;Lorg/fourthline/cling/model/ServiceReference;ILorg/fourthline/cling/support/model/ConnectionInfo$Direction;Lorg/fourthline/cling/support/model/ConnectionInfo$Status;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lorg/fourthline/cling/support/connectionmanager/AbstractPeeringConnectionManagerService$1;->this$0:Lorg/fourthline/cling/support/connectionmanager/AbstractPeeringConnectionManagerService;

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/support/connectionmanager/AbstractPeeringConnectionManagerService;->storeConnection(Lorg/fourthline/cling/support/model/ConnectionInfo;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
