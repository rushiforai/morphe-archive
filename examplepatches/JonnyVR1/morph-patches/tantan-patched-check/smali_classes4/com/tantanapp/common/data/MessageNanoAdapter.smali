.class public abstract Lcom/tantanapp/common/data/MessageNanoAdapter;
.super Lcom/tantanapp/common/data/ProtobufAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/tantanapp/common/data/ValueObject;",
        ">",
        "Lcom/tantanapp/common/data/ProtobufAdapter<",
        "TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/ProtobufAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getSize(Lcom/tantanapp/common/data/ValueObject;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .line 1
    iget v0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 2
    .line 3
    if-gez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ll/kmk0;->a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/ProtobufAdapter;->computeAndCacheSize(Ljava/lang/Object;)I

    .line 8
    .line 9
    .line 10
    :cond_0
    iget p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 11
    .line 12
    return p0
.end method

.method public bridge synthetic getSize(Ljava/lang/Object;)I
    .locals 0

    .line 13
    check-cast p1, Lcom/tantanapp/common/data/ValueObject;

    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/MessageNanoAdapter;->getSize(Lcom/tantanapp/common/data/ValueObject;)I

    move-result p0

    return p0
.end method
