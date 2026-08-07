.class public Lorg/eclipse/jetty/io/BuffersFactory;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static newBuffers(Lorg/eclipse/jetty/io/Buffers$Type;ILorg/eclipse/jetty/io/Buffers$Type;ILorg/eclipse/jetty/io/Buffers$Type;I)Lorg/eclipse/jetty/io/Buffers;
    .locals 7

    .line 1
    if-ltz p5, :cond_0

    .line 2
    .line 3
    new-instance v0, Lorg/eclipse/jetty/io/PooledBuffers;

    .line 4
    .line 5
    move-object v1, p0

    .line 6
    move v2, p1

    .line 7
    move-object v3, p2

    .line 8
    move v4, p3

    .line 9
    move-object v5, p4

    .line 10
    move v6, p5

    .line 11
    invoke-direct/range {v0 .. v6}, Lorg/eclipse/jetty/io/PooledBuffers;-><init>(Lorg/eclipse/jetty/io/Buffers$Type;ILorg/eclipse/jetty/io/Buffers$Type;ILorg/eclipse/jetty/io/Buffers$Type;I)V

    .line 12
    .line 13
    .line 14
    return-object v0

    .line 15
    :cond_0
    move-object p5, p4

    .line 16
    move p4, p3

    .line 17
    move-object p3, p2

    .line 18
    move p2, p1

    .line 19
    move-object p1, p0

    .line 20
    new-instance p0, Lorg/eclipse/jetty/io/ThreadLocalBuffers;

    .line 21
    .line 22
    invoke-direct/range {p0 .. p5}, Lorg/eclipse/jetty/io/ThreadLocalBuffers;-><init>(Lorg/eclipse/jetty/io/Buffers$Type;ILorg/eclipse/jetty/io/Buffers$Type;ILorg/eclipse/jetty/io/Buffers$Type;)V

    .line 23
    .line 24
    .line 25
    return-object p0
.end method
