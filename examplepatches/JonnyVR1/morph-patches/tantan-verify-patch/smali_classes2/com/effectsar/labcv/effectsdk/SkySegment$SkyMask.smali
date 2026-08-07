.class public Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/effectsar/labcv/effectsdk/SkySegment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "SkyMask"
.end annotation


# instance fields
.field private buffer:[B

.field private channel:I

.field private height:I

.field final synthetic this$0:Lcom/effectsar/labcv/effectsdk/SkySegment;

.field private width:I


# direct methods
.method public constructor <init>(Lcom/effectsar/labcv/effectsdk/SkySegment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;->this$0:Lcom/effectsar/labcv/effectsdk/SkySegment;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic access$000(Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$002(Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;->width:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$100(Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$102(Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;->height:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$200(Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;->channel:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$202(Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;->channel:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$300(Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;)[B
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;->buffer:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$302(Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;[B)[B
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;->buffer:[B

    .line 2
    .line 3
    return-object p1
.end method


# virtual methods
.method public getBuffer()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;->buffer:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;->buffer:[B

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget v1, p0, Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;->width:I

    .line 9
    .line 10
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;->height:I

    .line 15
    .line 16
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    filled-new-array {v0, v1, p0}, [Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string v0, "l: %d w:%d, h:%d"

    .line 25
    .line 26
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method
