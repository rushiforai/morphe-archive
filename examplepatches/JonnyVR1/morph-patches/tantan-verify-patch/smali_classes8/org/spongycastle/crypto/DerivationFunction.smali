.class public interface abstract Lorg/spongycastle/crypto/DerivationFunction;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract generateBytes([BII)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation
.end method

.method public abstract init(Lorg/spongycastle/crypto/DerivationParameters;)V
.end method
