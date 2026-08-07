.class public Lcom/bytedance/realx/video/memory/NativeRXByteMemory;
.super Lcom/bytedance/realx/video/memory/RXVideoMemory;
.source "SourceFile"

# interfaces
.implements Lcom/bytedance/realx/video/memory/RXVideoByteMemoryInterface;


# instance fields
.field private final height:I

.field private final pixelFormat:Lcom/bytedance/realx/video/RXPixelFormat;

.field private final planeData:[Ljava/nio/ByteBuffer;

.field private final planeLineSize:[I

.field private final width:I


# direct methods
.method public constructor <init>(IIJ[Ljava/nio/ByteBuffer;[ILcom/bytedance/realx/video/RXPixelFormat;)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0, p3, p4}, Lcom/bytedance/realx/video/memory/RXVideoMemory;-><init>(J)V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->width:I

    .line 5
    .line 6
    iput p2, p0, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->height:I

    .line 7
    .line 8
    iput-wide p3, p0, Lcom/bytedance/realx/video/memory/RXVideoMemory;->nativeHandle:J

    .line 9
    .line 10
    iput-object p5, p0, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->planeData:[Ljava/nio/ByteBuffer;

    .line 11
    .line 12
    iput-object p6, p0, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->planeLineSize:[I

    .line 13
    .line 14
    iput-object p7, p0, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->pixelFormat:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 15
    .line 16
    return-void
.end method

.method public static createRXByteMemory(IILcom/bytedance/realx/video/RXPixelFormat;J)Lcom/bytedance/realx/video/memory/NativeRXByteMemory;
    .locals 2

    .line 1
    sget-object v0, Lcom/bytedance/realx/video/memory/NativeRXByteMemory$1;->$SwitchMap$com$bytedance$realx$video$RXPixelFormat:[I

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    aget v0, v0, v1

    .line 8
    .line 9
    packed-switch v0, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return-object p0

    .line 14
    :pswitch_0
    invoke-static {p0, p1, p2, p3, p4}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->nativeCreateRXByteMemory(IILcom/bytedance/realx/video/RXPixelFormat;J)Lcom/bytedance/realx/video/memory/NativeRXByteMemory;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private static native nativeCreateRXByteMemory(IILcom/bytedance/realx/video/RXPixelFormat;J)Lcom/bytedance/realx/video/memory/NativeRXByteMemory;
.end method


# virtual methods
.method public getHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getMemoryType()Lcom/bytedance/realx/video/RXVideoMemoryType;
    .locals 0

    .line 1
    sget-object p0, Lcom/bytedance/realx/video/RXVideoMemoryType;->kBYTE_MEMORY:Lcom/bytedance/realx/video/RXVideoMemoryType;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNumberOfPlanes()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->planeData:[Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    array-length p0, p0

    .line 8
    return p0
.end method

.method public getPixelFormat()Lcom/bytedance/realx/video/RXPixelFormat;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->pixelFormat:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPlaneData(I)Ljava/nio/ByteBuffer;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->planeData:[Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return-object v0

    .line 7
    :cond_0
    array-length v1, p0

    .line 8
    if-le p1, v1, :cond_1

    .line 9
    .line 10
    return-object v0

    .line 11
    :cond_1
    aget-object p0, p0, p1

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public getPlaneDataArray()[Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->planeData:[Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPlaneLineSize(I)I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->planeLineSize:[I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    array-length v1, p0

    .line 8
    if-le p1, v1, :cond_1

    .line 9
    .line 10
    return v0

    .line 11
    :cond_1
    aget p0, p0, p1

    .line 12
    .line 13
    return p0
.end method

.method public getPlaneLineSizeArray()[I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->planeLineSize:[I

    .line 2
    .line 3
    return-object p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->width:I

    .line 2
    .line 3
    return p0
.end method
