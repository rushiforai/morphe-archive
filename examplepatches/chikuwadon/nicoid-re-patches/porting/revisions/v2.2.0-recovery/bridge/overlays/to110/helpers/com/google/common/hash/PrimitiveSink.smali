.class public interface abstract Lcom/google/common/hash/PrimitiveSink;
.super Ljava/lang/Object;
.source "PrimitiveSink.java"


# virtual methods
.method public abstract putBoolean(Z)Lcom/google/common/hash/PrimitiveSink;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "b"
        }
    .end annotation
.end method

.method public abstract putByte(B)Lcom/google/common/hash/PrimitiveSink;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "b"
        }
    .end annotation
.end method

.method public abstract putBytes(Ljava/nio/ByteBuffer;)Lcom/google/common/hash/PrimitiveSink;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "bytes"
        }
    .end annotation
.end method

.method public abstract putBytes([B)Lcom/google/common/hash/PrimitiveSink;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "bytes"
        }
    .end annotation
.end method

.method public abstract putBytes([BII)Lcom/google/common/hash/PrimitiveSink;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "bytes",
            "off",
            "len"
        }
    .end annotation
.end method

.method public abstract putChar(C)Lcom/google/common/hash/PrimitiveSink;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "c"
        }
    .end annotation
.end method

.method public abstract putDouble(D)Lcom/google/common/hash/PrimitiveSink;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "d"
        }
    .end annotation
.end method

.method public abstract putFloat(F)Lcom/google/common/hash/PrimitiveSink;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "f"
        }
    .end annotation
.end method

.method public abstract putInt(I)Lcom/google/common/hash/PrimitiveSink;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "i"
        }
    .end annotation
.end method

.method public abstract putLong(J)Lcom/google/common/hash/PrimitiveSink;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "l"
        }
    .end annotation
.end method

.method public abstract putShort(S)Lcom/google/common/hash/PrimitiveSink;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "s"
        }
    .end annotation
.end method

.method public abstract putString(Ljava/lang/CharSequence;Ljava/nio/charset/Charset;)Lcom/google/common/hash/PrimitiveSink;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "charSequence",
            "charset"
        }
    .end annotation
.end method

.method public abstract putUnencodedChars(Ljava/lang/CharSequence;)Lcom/google/common/hash/PrimitiveSink;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "charSequence"
        }
    .end annotation
.end method
