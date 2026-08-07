.class public Lcom/ss/bytertc/engine/video/RTCI420Buffer;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private dataU:Ljava/nio/ByteBuffer;

.field private dataV:Ljava/nio/ByteBuffer;

.field private dataY:Ljava/nio/ByteBuffer;

.field private height:I

.field private width:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/ss/bytertc/engine/video/RTCI420Buffer;->width:I

    .line 6
    .line 7
    iput v0, p0, Lcom/ss/bytertc/engine/video/RTCI420Buffer;->height:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lcom/ss/bytertc/engine/video/RTCI420Buffer;->dataY:Ljava/nio/ByteBuffer;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/ss/bytertc/engine/video/RTCI420Buffer;->dataU:Ljava/nio/ByteBuffer;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/ss/bytertc/engine/video/RTCI420Buffer;->dataV:Ljava/nio/ByteBuffer;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public getDataU()Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCI420Buffer;->dataU:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDataV()Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCI420Buffer;->dataV:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDataY()Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCI420Buffer;->dataY:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/video/RTCI420Buffer;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/video/RTCI420Buffer;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public setDataU(Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/engine/video/RTCI420Buffer;->dataU:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-void
.end method

.method public setDataV(Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/engine/video/RTCI420Buffer;->dataV:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-void
.end method

.method public setDataY(Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/engine/video/RTCI420Buffer;->dataY:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-void
.end method

.method public setHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/ss/bytertc/engine/video/RTCI420Buffer;->height:I

    .line 2
    .line 3
    return-void
.end method

.method public setWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/ss/bytertc/engine/video/RTCI420Buffer;->width:I

    .line 2
    .line 3
    return-void
.end method
