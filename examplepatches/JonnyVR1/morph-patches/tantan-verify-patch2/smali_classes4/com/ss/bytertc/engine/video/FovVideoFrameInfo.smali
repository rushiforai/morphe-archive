.class public Lcom/ss/bytertc/engine/video/FovVideoFrameInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private destColumn:I

.field private destRow:I

.field private hdColumn:I

.field private hdHeight:I

.field private hdRow:I

.field private hdWidth:I

.field private ldColumn:I

.field private ldHeight:I

.field private ldRow:I

.field private ldWidth:I

.field private tileHeight:I

.field private tileMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Short;",
            "Ljava/lang/Short;",
            ">;"
        }
    .end annotation
.end field

.field private tileWidth:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/ss/bytertc/engine/video/FovVideoFrameInfo;->tileMap:Ljava/util/HashMap;

    .line 10
    .line 11
    return-void
.end method

.method public static genFovVideoFrameInfo()Lcom/ss/bytertc/engine/video/FovVideoFrameInfo;
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/video/FovVideoFrameInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/ss/bytertc/engine/video/FovVideoFrameInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private putTileMapValue(SS)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/FovVideoFrameInfo;->tileMap:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p2}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private setDestColumn(I)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/ss/bytertc/engine/video/FovVideoFrameInfo;->destColumn:I

    .line 2
    .line 3
    return-void
.end method

.method private setDestRow(I)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/ss/bytertc/engine/video/FovVideoFrameInfo;->destRow:I

    .line 2
    .line 3
    return-void
.end method

.method private setHdColumn(I)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/ss/bytertc/engine/video/FovVideoFrameInfo;->hdColumn:I

    .line 2
    .line 3
    return-void
.end method

.method private setHdHeight(I)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/ss/bytertc/engine/video/FovVideoFrameInfo;->hdHeight:I

    .line 2
    .line 3
    return-void
.end method

.method private setHdRow(I)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/ss/bytertc/engine/video/FovVideoFrameInfo;->hdRow:I

    .line 2
    .line 3
    return-void
.end method

.method private setHdWidth(I)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/ss/bytertc/engine/video/FovVideoFrameInfo;->hdWidth:I

    .line 2
    .line 3
    return-void
.end method

.method private setLdColumn(I)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/ss/bytertc/engine/video/FovVideoFrameInfo;->ldColumn:I

    .line 2
    .line 3
    return-void
.end method

.method private setLdHeight(I)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/ss/bytertc/engine/video/FovVideoFrameInfo;->ldHeight:I

    .line 2
    .line 3
    return-void
.end method

.method private setLdRow(I)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/ss/bytertc/engine/video/FovVideoFrameInfo;->ldRow:I

    .line 2
    .line 3
    return-void
.end method

.method private setLdWidth(I)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/ss/bytertc/engine/video/FovVideoFrameInfo;->ldWidth:I

    .line 2
    .line 3
    return-void
.end method

.method private setTileHeight(I)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/ss/bytertc/engine/video/FovVideoFrameInfo;->tileHeight:I

    .line 2
    .line 3
    return-void
.end method

.method private setTileWidth(I)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/ss/bytertc/engine/video/FovVideoFrameInfo;->tileWidth:I

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public getDestColumn()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/video/FovVideoFrameInfo;->destColumn:I

    .line 2
    .line 3
    return p0
.end method

.method public getDestRow()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/video/FovVideoFrameInfo;->destRow:I

    .line 2
    .line 3
    return p0
.end method

.method public getHdColumn()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/video/FovVideoFrameInfo;->hdColumn:I

    .line 2
    .line 3
    return p0
.end method

.method public getHdHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/video/FovVideoFrameInfo;->hdHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public getHdRow()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/video/FovVideoFrameInfo;->hdRow:I

    .line 2
    .line 3
    return p0
.end method

.method public getHdWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/video/FovVideoFrameInfo;->hdWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public getLdColumn()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/video/FovVideoFrameInfo;->ldColumn:I

    .line 2
    .line 3
    return p0
.end method

.method public getLdHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/video/FovVideoFrameInfo;->ldHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public getLdRow()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/video/FovVideoFrameInfo;->ldRow:I

    .line 2
    .line 3
    return p0
.end method

.method public getLdWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/video/FovVideoFrameInfo;->ldWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public getTileHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/video/FovVideoFrameInfo;->tileHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public getTileMap()Ljava/util/HashMap;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/Short;",
            "Ljava/lang/Short;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/FovVideoFrameInfo;->tileMap:Ljava/util/HashMap;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTileWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/video/FovVideoFrameInfo;->tileWidth:I

    .line 2
    .line 3
    return p0
.end method
