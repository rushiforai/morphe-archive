.class public interface abstract Lorg/fourthline/cling/transport/spi/GENAEventProcessor;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract readBody(Lorg/fourthline/cling/model/message/gena/IncomingEventRequestMessage;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/fourthline/cling/model/UnsupportedDataException;
        }
    .end annotation
.end method

.method public abstract writeBody(Lorg/fourthline/cling/model/message/gena/OutgoingEventRequestMessage;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/fourthline/cling/model/UnsupportedDataException;
        }
    .end annotation
.end method
