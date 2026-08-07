.class Lorg/fourthline/cling/protocol/sync/SendingSubscribe$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/fourthline/cling/protocol/sync/SendingSubscribe;->executeSync()Lorg/fourthline/cling/model/message/gena/IncomingSubscribeResponseMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/fourthline/cling/protocol/sync/SendingSubscribe;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/protocol/sync/SendingSubscribe;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/protocol/sync/SendingSubscribe$4;->this$0:Lorg/fourthline/cling/protocol/sync/SendingSubscribe;

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
    iget-object p0, p0, Lorg/fourthline/cling/protocol/sync/SendingSubscribe$4;->this$0:Lorg/fourthline/cling/protocol/sync/SendingSubscribe;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/fourthline/cling/protocol/sync/SendingSubscribe;->subscription:Lorg/fourthline/cling/model/gena/RemoteGENASubscription;

    .line 4
    .line 5
    invoke-virtual {p0}, Lorg/fourthline/cling/model/gena/RemoteGENASubscription;->establish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method
