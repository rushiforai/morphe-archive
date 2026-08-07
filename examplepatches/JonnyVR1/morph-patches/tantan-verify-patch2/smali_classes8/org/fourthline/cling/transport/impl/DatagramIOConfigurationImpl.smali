.class public Lorg/fourthline/cling/transport/impl/DatagramIOConfigurationImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/fourthline/cling/transport/spi/DatagramIOConfiguration;


# instance fields
.field private maxDatagramBytes:I

.field private timeToLive:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x4

    .line 5
    iput v0, p0, Lorg/fourthline/cling/transport/impl/DatagramIOConfigurationImpl;->timeToLive:I

    .line 6
    .line 7
    const/16 v0, 0x280

    .line 8
    .line 9
    iput v0, p0, Lorg/fourthline/cling/transport/impl/DatagramIOConfigurationImpl;->maxDatagramBytes:I

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(II)V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput p1, p0, Lorg/fourthline/cling/transport/impl/DatagramIOConfigurationImpl;->timeToLive:I

    .line 14
    iput p2, p0, Lorg/fourthline/cling/transport/impl/DatagramIOConfigurationImpl;->maxDatagramBytes:I

    return-void
.end method


# virtual methods
.method public getMaxDatagramBytes()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/fourthline/cling/transport/impl/DatagramIOConfigurationImpl;->maxDatagramBytes:I

    .line 2
    .line 3
    return p0
.end method

.method public getTimeToLive()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/fourthline/cling/transport/impl/DatagramIOConfigurationImpl;->timeToLive:I

    .line 2
    .line 3
    return p0
.end method

.method public setMaxDatagramBytes(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/fourthline/cling/transport/impl/DatagramIOConfigurationImpl;->maxDatagramBytes:I

    .line 2
    .line 3
    return-void
.end method

.method public setTimeToLive(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/fourthline/cling/transport/impl/DatagramIOConfigurationImpl;->timeToLive:I

    .line 2
    .line 3
    return-void
.end method
