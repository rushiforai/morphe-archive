.class Lorg/fourthline/cling/mock/MockUpnpService$MockProtocolFactory$1;
.super Lorg/fourthline/cling/protocol/async/SendingNotificationAlive;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/fourthline/cling/mock/MockUpnpService$MockProtocolFactory;->createSendingNotificationAlive(Lorg/fourthline/cling/model/meta/LocalDevice;)Lorg/fourthline/cling/protocol/async/SendingNotificationAlive;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/fourthline/cling/mock/MockUpnpService$MockProtocolFactory;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/mock/MockUpnpService$MockProtocolFactory;Lorg/fourthline/cling/UpnpService;Lorg/fourthline/cling/model/meta/LocalDevice;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/mock/MockUpnpService$MockProtocolFactory$1;->this$0:Lorg/fourthline/cling/mock/MockUpnpService$MockProtocolFactory;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3}, Lorg/fourthline/cling/protocol/async/SendingNotificationAlive;-><init>(Lorg/fourthline/cling/UpnpService;Lorg/fourthline/cling/model/meta/LocalDevice;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public execute()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/fourthline/cling/transport/RouterException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/fourthline/cling/mock/MockUpnpService$MockProtocolFactory$1;->this$0:Lorg/fourthline/cling/mock/MockUpnpService$MockProtocolFactory;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/fourthline/cling/mock/MockUpnpService$MockProtocolFactory;->access$000(Lorg/fourthline/cling/mock/MockUpnpService$MockProtocolFactory;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-super {p0}, Lorg/fourthline/cling/protocol/async/SendingNotificationAlive;->execute()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method
