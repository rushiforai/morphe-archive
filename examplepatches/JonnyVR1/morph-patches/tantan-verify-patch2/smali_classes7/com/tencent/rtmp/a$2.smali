.class Lcom/tencent/rtmp/a$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/o;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/rtmp/a;->a(Lcom/tencent/rtmp/TXLivePlayer$ITXLivePlayVideoRenderListener;Ljava/lang/Object;)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/rtmp/a;


# direct methods
.method public constructor <init>(Lcom/tencent/rtmp/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/rtmp/a$2;->a:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onRenderVideoFrame(Ljava/lang/String;ILcom/tencent/liteav/basic/structs/TXSVideoFrame;)V
    .locals 0

    .line 1
    if-eqz p3, :cond_1

    .line 2
    .line 3
    iget p1, p3, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->width:I

    .line 4
    .line 5
    if-lez p1, :cond_1

    .line 6
    .line 7
    iget p1, p3, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->height:I

    .line 8
    .line 9
    if-gtz p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/tencent/rtmp/a$2;->a:Lcom/tencent/rtmp/a;

    .line 13
    .line 14
    invoke-static {p0}, Lcom/tencent/rtmp/a;->e(Lcom/tencent/rtmp/a;)Lcom/tencent/rtmp/TXLivePlayer$ITXLivePlayVideoRenderListener;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    new-instance p1, Lcom/tencent/rtmp/TXLivePlayer$TXLiteAVTexture;

    .line 21
    .line 22
    invoke-direct {p1}, Lcom/tencent/rtmp/TXLivePlayer$TXLiteAVTexture;-><init>()V

    .line 23
    .line 24
    .line 25
    iget p2, p3, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->textureId:I

    .line 26
    .line 27
    iput p2, p1, Lcom/tencent/rtmp/TXLivePlayer$TXLiteAVTexture;->textureId:I

    .line 28
    .line 29
    iget p2, p3, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->width:I

    .line 30
    .line 31
    iput p2, p1, Lcom/tencent/rtmp/TXLivePlayer$TXLiteAVTexture;->width:I

    .line 32
    .line 33
    iget p2, p3, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->height:I

    .line 34
    .line 35
    iput p2, p1, Lcom/tencent/rtmp/TXLivePlayer$TXLiteAVTexture;->height:I

    .line 36
    .line 37
    iget-object p2, p3, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->eglContext:Ljava/lang/Object;

    .line 38
    .line 39
    iput-object p2, p1, Lcom/tencent/rtmp/TXLivePlayer$TXLiteAVTexture;->eglContext:Ljava/lang/Object;

    .line 40
    .line 41
    invoke-interface {p0, p1}, Lcom/tencent/rtmp/TXLivePlayer$ITXLivePlayVideoRenderListener;->onRenderVideoFrame(Lcom/tencent/rtmp/TXLivePlayer$TXLiteAVTexture;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    :goto_0
    return-void
.end method
