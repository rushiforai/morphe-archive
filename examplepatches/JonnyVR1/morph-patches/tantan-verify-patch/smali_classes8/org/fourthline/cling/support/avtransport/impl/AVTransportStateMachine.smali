.class public interface abstract Lorg/fourthline/cling/support/avtransport/impl/AVTransportStateMachine;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/seamless/statemachine/StateMachine;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/seamless/statemachine/StateMachine<",
        "Lorg/fourthline/cling/support/avtransport/impl/state/AbstractState;",
        ">;"
    }
.end annotation


# virtual methods
.method public abstract next()V
.end method

.method public abstract pause()V
.end method

.method public abstract play(Ljava/lang/String;)V
.end method

.method public abstract previous()V
.end method

.method public abstract record()V
.end method

.method public abstract seek(Lorg/fourthline/cling/support/model/SeekMode;Ljava/lang/String;)V
.end method

.method public abstract setNextTransportURI(Ljava/net/URI;Ljava/lang/String;)V
.end method

.method public abstract setTransportURI(Ljava/net/URI;Ljava/lang/String;)V
.end method

.method public abstract stop()V
.end method
