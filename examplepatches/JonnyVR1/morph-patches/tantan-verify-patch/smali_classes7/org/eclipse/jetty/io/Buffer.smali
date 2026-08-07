.class public interface abstract Lorg/eclipse/jetty/io/Buffer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jetty/io/Buffer$CaseInsensitve;
    }
.end annotation


# static fields
.field public static final IMMUTABLE:I = 0x0

.field public static final NON_VOLATILE:Z = false

.field public static final READONLY:I = 0x1

.field public static final READWRITE:I = 0x2

.field public static final VOLATILE:Z = true


# virtual methods
.method public abstract array()[B
.end method

.method public abstract asArray()[B
.end method

.method public abstract asImmutableBuffer()Lorg/eclipse/jetty/io/Buffer;
.end method

.method public abstract asMutableBuffer()Lorg/eclipse/jetty/io/Buffer;
.end method

.method public abstract asNonVolatileBuffer()Lorg/eclipse/jetty/io/Buffer;
.end method

.method public abstract asReadOnlyBuffer()Lorg/eclipse/jetty/io/Buffer;
.end method

.method public abstract buffer()Lorg/eclipse/jetty/io/Buffer;
.end method

.method public abstract capacity()I
.end method

.method public abstract clear()V
.end method

.method public abstract compact()V
.end method

.method public abstract equalsIgnoreCase(Lorg/eclipse/jetty/io/Buffer;)Z
.end method

.method public abstract get()B
.end method

.method public abstract get([BII)I
.end method

.method public abstract get(I)Lorg/eclipse/jetty/io/Buffer;
.end method

.method public abstract getIndex()I
.end method

.method public abstract hasContent()Z
.end method

.method public abstract isImmutable()Z
.end method

.method public abstract isReadOnly()Z
.end method

.method public abstract isVolatile()Z
.end method

.method public abstract length()I
.end method

.method public abstract mark()V
.end method

.method public abstract mark(I)V
.end method

.method public abstract markIndex()I
.end method

.method public abstract peek()B
.end method

.method public abstract peek(I)B
.end method

.method public abstract peek(I[BII)I
.end method

.method public abstract peek(II)Lorg/eclipse/jetty/io/Buffer;
.end method

.method public abstract poke(ILorg/eclipse/jetty/io/Buffer;)I
.end method

.method public abstract poke(I[BII)I
.end method

.method public abstract poke(IB)V
.end method

.method public abstract put(Lorg/eclipse/jetty/io/Buffer;)I
.end method

.method public abstract put([B)I
.end method

.method public abstract put([BII)I
.end method

.method public abstract put(B)V
.end method

.method public abstract putIndex()I
.end method

.method public abstract readFrom(Ljava/io/InputStream;I)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract reset()V
.end method

.method public abstract setGetIndex(I)V
.end method

.method public abstract setMarkIndex(I)V
.end method

.method public abstract setPutIndex(I)V
.end method

.method public abstract skip(I)I
.end method

.method public abstract slice()Lorg/eclipse/jetty/io/Buffer;
.end method

.method public abstract sliceFromMark()Lorg/eclipse/jetty/io/Buffer;
.end method

.method public abstract sliceFromMark(I)Lorg/eclipse/jetty/io/Buffer;
.end method

.method public abstract space()I
.end method

.method public abstract toDetailString()Ljava/lang/String;
.end method

.method public abstract toString(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract toString(Ljava/nio/charset/Charset;)Ljava/lang/String;
.end method

.method public abstract writeTo(Ljava/io/OutputStream;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
