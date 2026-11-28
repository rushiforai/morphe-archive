.class public interface abstract Lcom/google/common/io/ByteArrayDataInput;
.super Ljava/lang/Object;
.source "ByteArrayDataInput.java"

# interfaces
.implements Ljava/io/DataInput;


# virtual methods
.method public abstract readBoolean()Z
.end method

.method public abstract readByte()B
.end method

.method public abstract readChar()C
.end method

.method public abstract readDouble()D
.end method

.method public abstract readFloat()F
.end method

.method public abstract readFully([B)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "b"
        }
    .end annotation
.end method

.method public abstract readFully([BII)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "b",
            "off",
            "len"
        }
    .end annotation
.end method

.method public abstract readInt()I
.end method

.method public abstract readLine()Ljava/lang/String;
.end method

.method public abstract readLong()J
.end method

.method public abstract readShort()S
.end method

.method public abstract readUTF()Ljava/lang/String;
.end method

.method public abstract readUnsignedByte()I
.end method

.method public abstract readUnsignedShort()I
.end method

.method public abstract skipBytes(I)I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "n"
        }
    .end annotation
.end method
