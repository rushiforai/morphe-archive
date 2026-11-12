.class public final Lb1j;
.super Ljavax/net/SocketFactory;
.source "SourceFile"


# instance fields
.field public final a:I


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljavax/net/SocketFactory;-><init>()V

    const/high16 v0, 0x10000

    iput v0, p0, Lb1j;->a:I

    return-void
.end method


# virtual methods
.method public final createSocket()Ljava/net/Socket;
    .registers 2

    new-instance v0, Ljava/net/Socket;

    invoke-direct {v0}, Ljava/net/Socket;-><init>()V

    iget p0, p0, Lb1j;->a:I

    invoke-virtual {v0, p0}, Ljava/net/Socket;->setSendBufferSize(I)V

    return-object v0
.end method

.method public final createSocket(Ljava/lang/String;I)Ljava/net/Socket;
    .registers 4

    .line 11
    new-instance v0, Ljava/net/Socket;

    invoke-direct {v0, p1, p2}, Ljava/net/Socket;-><init>(Ljava/lang/String;I)V

    .line 12
    iget p0, p0, Lb1j;->a:I

    invoke-virtual {v0, p0}, Ljava/net/Socket;->setSendBufferSize(I)V

    return-object v0
.end method

.method public final createSocket(Ljava/lang/String;ILjava/net/InetAddress;I)Ljava/net/Socket;
    .registers 6

    .line 13
    new-instance v0, Ljava/net/Socket;

    invoke-direct {v0, p1, p2, p3, p4}, Ljava/net/Socket;-><init>(Ljava/lang/String;ILjava/net/InetAddress;I)V

    .line 14
    iget p0, p0, Lb1j;->a:I

    invoke-virtual {v0, p0}, Ljava/net/Socket;->setSendBufferSize(I)V

    return-object v0
.end method

.method public final createSocket(Ljava/net/InetAddress;I)Ljava/net/Socket;
    .registers 4

    .line 15
    new-instance v0, Ljava/net/Socket;

    invoke-direct {v0, p1, p2}, Ljava/net/Socket;-><init>(Ljava/net/InetAddress;I)V

    .line 16
    iget p0, p0, Lb1j;->a:I

    invoke-virtual {v0, p0}, Ljava/net/Socket;->setSendBufferSize(I)V

    return-object v0
.end method

.method public final createSocket(Ljava/net/InetAddress;ILjava/net/InetAddress;I)Ljava/net/Socket;
    .registers 6

    .line 17
    new-instance v0, Ljava/net/Socket;

    invoke-direct {v0, p1, p2, p3, p4}, Ljava/net/Socket;-><init>(Ljava/net/InetAddress;ILjava/net/InetAddress;I)V

    .line 18
    iget p0, p0, Lb1j;->a:I

    invoke-virtual {v0, p0}, Ljava/net/Socket;->setSendBufferSize(I)V

    return-object v0
.end method
