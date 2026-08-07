.class public interface abstract Lcom/google/protobuf/q$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lfz;
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/protobuf/q;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "a"
.end annotation


# virtual methods
.method public abstract build()Lcom/google/protobuf/q;
.end method

.method public abstract buildPartial()Lcom/google/protobuf/q;
.end method

.method public abstract mergeFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/q$a;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract mergeFrom(Lcom/google/protobuf/q;)Lcom/google/protobuf/q$a;
.end method

.method public abstract mergeFrom([B)Lcom/google/protobuf/q$a;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation
.end method
