.class public final Lcom/tantan/library/svga/data/transfrom/ByteBufferEncoder;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantan/library/svga/data/transfrom/Encoder;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/tantan/library/svga/data/transfrom/Encoder<",
        "Ljava/nio/ByteBuffer;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0003J\u0018\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00022\u0006\u0010\u0007\u001a\u00020\u0008H\u0016\u00a8\u0006\t"
    }
    d2 = {
        "Lcom/tantan/library/svga/data/transfrom/ByteBufferEncoder;",
        "Lcom/tantan/library/svga/data/transfrom/Encoder;",
        "Ljava/nio/ByteBuffer;",
        "()V",
        "encode",
        "",
        "data",
        "file",
        "Ljava/io/File;",
        "svga_lib_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic encode(Ljava/lang/Object;Ljava/io/File;)V
    .locals 0

    .line 13
    check-cast p1, Ljava/nio/ByteBuffer;

    invoke-virtual {p0, p1, p2}, Lcom/tantan/library/svga/data/transfrom/ByteBufferEncoder;->encode(Ljava/nio/ByteBuffer;Ljava/io/File;)V

    return-void
.end method

.method public encode(Ljava/nio/ByteBuffer;Ljava/io/File;)V
    .locals 0
    .param p1    # Ljava/nio/ByteBuffer;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/io/File;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    sget-object p0, Lcom/tantan/library/svga/utils/ByteBufferUtil;->INSTANCE:Lcom/tantan/library/svga/utils/ByteBufferUtil;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Lcom/tantan/library/svga/utils/ByteBufferUtil;->toFile(Ljava/nio/ByteBuffer;Ljava/io/File;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
