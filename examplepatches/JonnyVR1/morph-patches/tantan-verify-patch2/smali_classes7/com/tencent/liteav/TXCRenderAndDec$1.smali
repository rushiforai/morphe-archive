.class Lcom/tencent/liteav/TXCRenderAndDec$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/basic/c/h$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/TXCRenderAndDec;->onTextureProcess(IIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Lcom/tencent/liteav/TXCRenderAndDec;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/TXCRenderAndDec;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/TXCRenderAndDec$1;->b:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/TXCRenderAndDec$1;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/tencent/liteav/TXCRenderAndDec$1;->b:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tencent/liteav/TXCRenderAndDec;->access$000(Lcom/tencent/liteav/TXCRenderAndDec;)Lcom/tencent/liteav/basic/c/h;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Lcom/tencent/liteav/TXCRenderAndDec$1;->b:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tencent/liteav/TXCRenderAndDec;->access$100(Lcom/tencent/liteav/TXCRenderAndDec;)Lcom/tencent/liteav/o;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    new-instance v1, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;

    .line 18
    .line 19
    invoke-direct {v1}, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/tencent/liteav/basic/c/h;->n()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    iput v2, v1, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->width:I

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/tencent/liteav/basic/c/h;->o()I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    iput p1, v1, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->height:I

    .line 33
    .line 34
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->getTimeTick()J

    .line 35
    .line 36
    .line 37
    move-result-wide v2

    .line 38
    iput-wide v2, v1, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->pts:J

    .line 39
    .line 40
    iget p1, p0, Lcom/tencent/liteav/TXCRenderAndDec$1;->a:I

    .line 41
    .line 42
    iget-object v2, p0, Lcom/tencent/liteav/TXCRenderAndDec$1;->b:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 43
    .line 44
    invoke-static {v2}, Lcom/tencent/liteav/TXCRenderAndDec;->access$200(Lcom/tencent/liteav/TXCRenderAndDec;)I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    add-int/2addr p1, v2

    .line 49
    rem-int/lit16 p1, p1, 0x168

    .line 50
    .line 51
    iput p1, v1, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->rotation:I

    .line 52
    .line 53
    iget-object p1, p0, Lcom/tencent/liteav/TXCRenderAndDec$1;->b:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 54
    .line 55
    invoke-virtual {p1}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    iget-object p0, p0, Lcom/tencent/liteav/TXCRenderAndDec$1;->b:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 60
    .line 61
    invoke-static {p0}, Lcom/tencent/liteav/TXCRenderAndDec;->access$300(Lcom/tencent/liteav/TXCRenderAndDec;)I

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    invoke-interface {v0, p1, p0, v1}, Lcom/tencent/liteav/o;->onRenderVideoFrame(Ljava/lang/String;ILcom/tencent/liteav/basic/structs/TXSVideoFrame;)V

    .line 66
    .line 67
    .line 68
    :cond_0
    return-void
.end method
