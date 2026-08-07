.class public interface abstract Lorg/fourthline/cling/controlpoint/ControlPoint;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract execute(Lorg/fourthline/cling/controlpoint/ActionCallback;)Ljava/util/concurrent/Future;
.end method

.method public abstract execute(Lorg/fourthline/cling/controlpoint/SubscriptionCallback;)V
.end method

.method public abstract getConfiguration()Lorg/fourthline/cling/UpnpServiceConfiguration;
.end method

.method public abstract getProtocolFactory()Lorg/fourthline/cling/protocol/ProtocolFactory;
.end method

.method public abstract getRegistry()Lorg/fourthline/cling/registry/Registry;
.end method

.method public abstract search()V
.end method

.method public abstract search(I)V
.end method

.method public abstract search(Lorg/fourthline/cling/model/message/header/UpnpHeader;)V
.end method

.method public abstract search(Lorg/fourthline/cling/model/message/header/UpnpHeader;I)V
.end method
