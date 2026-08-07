.class public abstract Lorg/fourthline/cling/support/avtransport/impl/state/AbstractState;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lorg/fourthline/cling/support/model/AVTransport;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private transport:Lorg/fourthline/cling/support/model/AVTransport;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/support/model/AVTransport;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/fourthline/cling/support/avtransport/impl/state/AbstractState;->transport:Lorg/fourthline/cling/support/model/AVTransport;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public abstract getCurrentTransportActions()[Lorg/fourthline/cling/support/model/TransportAction;
.end method

.method public getTransport()Lorg/fourthline/cling/support/model/AVTransport;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/avtransport/impl/state/AbstractState;->transport:Lorg/fourthline/cling/support/model/AVTransport;

    .line 2
    .line 3
    return-object p0
.end method
