.class Lcom/tencent/liteav/d$15;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/d;->y()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/liteav/d;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/d$15;->a:Lcom/tencent/liteav/d;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/d$15;->a:Lcom/tencent/liteav/d;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/liteav/d;->c(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget v1, v1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->width:I

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tencent/liteav/d$15;->a:Lcom/tencent/liteav/d;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/tencent/liteav/d;->c(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget p0, p0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->height:I

    .line 16
    .line 17
    invoke-static {v0, v1, p0}, Lcom/tencent/liteav/d;->a(Lcom/tencent/liteav/d;II)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
