.class public Lorg/eclipse/jetty/io/NetworkTrafficListener$Empty;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/io/NetworkTrafficListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/io/NetworkTrafficListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Empty"
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
.method public closed(Ljava/net/Socket;)V
    .locals 0

    return-void
.end method

.method public incoming(Ljava/net/Socket;Lorg/eclipse/jetty/io/Buffer;)V
    .locals 0

    return-void
.end method

.method public opened(Ljava/net/Socket;)V
    .locals 0

    return-void
.end method

.method public outgoing(Ljava/net/Socket;Lorg/eclipse/jetty/io/Buffer;)V
    .locals 0

    return-void
.end method
