.class public interface abstract Lorg/fourthline/cling/support/lastchange/LastChangeDelegator;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract appendCurrentState(Lorg/fourthline/cling/support/lastchange/LastChange;Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public abstract getCurrentInstanceIds()[Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;
.end method

.method public abstract getLastChange()Lorg/fourthline/cling/support/lastchange/LastChange;
.end method
