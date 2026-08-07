.class public interface abstract Landroidx/datastore/preferences/protobuf/b0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/mfz;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/datastore/preferences/protobuf/b0$a;
    }
.end annotation


# virtual methods
.method public abstract a(Landroidx/datastore/preferences/protobuf/CodedOutputStream;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getParserForType()Ll/og60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/og60<",
            "+",
            "Landroidx/datastore/preferences/protobuf/b0;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getSerializedSize()I
.end method

.method public abstract newBuilderForType()Landroidx/datastore/preferences/protobuf/b0$a;
.end method

.method public abstract toBuilder()Landroidx/datastore/preferences/protobuf/b0$a;
.end method

.method public abstract toByteArray()[B
.end method

.method public abstract toByteString()Landroidx/datastore/preferences/protobuf/ByteString;
.end method
