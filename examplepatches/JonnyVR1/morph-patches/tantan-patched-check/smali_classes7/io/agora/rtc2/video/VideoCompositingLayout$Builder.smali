.class public Lio/agora/rtc2/video/VideoCompositingLayout$Builder;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/video/VideoCompositingLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field public appData:Ljava/lang/String;

.field public canvas:Lio/agora/rtc2/video/VideoCompositingLayout$Canvas;

.field public regionsList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/agora/rtc2/video/VideoCompositingLayout$Region;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lio/agora/rtc2/video/VideoCompositingLayout$Canvas;

    invoke-direct {v0}, Lio/agora/rtc2/video/VideoCompositingLayout$Canvas;-><init>()V

    iput-object v0, p0, Lio/agora/rtc2/video/VideoCompositingLayout$Builder;->canvas:Lio/agora/rtc2/video/VideoCompositingLayout$Canvas;

    return-void
.end method


# virtual methods
.method public addWindow(Lio/agora/rtc2/video/VideoCompositingLayout$Region;)Lio/agora/rtc2/video/VideoCompositingLayout$Builder;
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/video/VideoCompositingLayout$Builder;->regionsList:Ljava/util/List;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lio/agora/rtc2/video/VideoCompositingLayout$Builder;->regionsList:Ljava/util/List;

    :cond_0
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCompositingLayout$Builder;->regionsList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public create()Lio/agora/rtc2/video/VideoCompositingLayout;
    .locals 3

    new-instance v0, Lio/agora/rtc2/video/VideoCompositingLayout;

    invoke-direct {v0}, Lio/agora/rtc2/video/VideoCompositingLayout;-><init>()V

    iget-object v1, p0, Lio/agora/rtc2/video/VideoCompositingLayout$Builder;->canvas:Lio/agora/rtc2/video/VideoCompositingLayout$Canvas;

    iget v2, v1, Lio/agora/rtc2/video/VideoCompositingLayout$Canvas;->width:I

    iput v2, v0, Lio/agora/rtc2/video/VideoCompositingLayout;->canvasWidth:I

    iget v2, v1, Lio/agora/rtc2/video/VideoCompositingLayout$Canvas;->height:I

    iput v2, v0, Lio/agora/rtc2/video/VideoCompositingLayout;->canvasHeight:I

    iget-object v1, v1, Lio/agora/rtc2/video/VideoCompositingLayout$Canvas;->bgColor:Ljava/lang/String;

    iput-object v1, v0, Lio/agora/rtc2/video/VideoCompositingLayout;->backgroundColor:Ljava/lang/String;

    iget-object v1, p0, Lio/agora/rtc2/video/VideoCompositingLayout$Builder;->regionsList:Ljava/util/List;

    if-eqz v1, :cond_0

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    iget-object v1, p0, Lio/agora/rtc2/video/VideoCompositingLayout$Builder;->regionsList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Lio/agora/rtc2/video/VideoCompositingLayout$Region;

    invoke-interface {v1, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lio/agora/rtc2/video/VideoCompositingLayout$Region;

    iput-object v1, v0, Lio/agora/rtc2/video/VideoCompositingLayout;->regions:[Lio/agora/rtc2/video/VideoCompositingLayout$Region;

    :cond_0
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCompositingLayout$Builder;->appData:Ljava/lang/String;

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object p0

    iput-object p0, v0, Lio/agora/rtc2/video/VideoCompositingLayout;->appData:[B

    :cond_1
    return-object v0
.end method

.method public final regionCount()I
    .locals 0

    iget-object p0, p0, Lio/agora/rtc2/video/VideoCompositingLayout$Builder;->regionsList:Ljava/util/List;

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    return p0
.end method

.method public removeWindowForUid(I)Lio/agora/rtc2/video/VideoCompositingLayout$Builder;
    .locals 4

    iget-object v0, p0, Lio/agora/rtc2/video/VideoCompositingLayout$Builder;->regionsList:Ljava/util/List;

    if-nez v0, :cond_0

    return-object p0

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lio/agora/rtc2/video/VideoCompositingLayout$Builder;->regionsList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/agora/rtc2/video/VideoCompositingLayout$Region;

    iget v3, v2, Lio/agora/rtc2/video/VideoCompositingLayout$Region;->uid:I

    if-ne v3, p1, :cond_1

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lio/agora/rtc2/video/VideoCompositingLayout$Builder;->regionsList:Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    return-object p0
.end method

.method public resetWindows(Ljava/util/List;)Lio/agora/rtc2/video/VideoCompositingLayout$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/agora/rtc2/video/VideoCompositingLayout$Region;",
            ">;)",
            "Lio/agora/rtc2/video/VideoCompositingLayout$Builder;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lio/agora/rtc2/video/VideoCompositingLayout$Builder;->regionsList:Ljava/util/List;

    return-object p0
.end method

.method public setCanvas(II)Lio/agora/rtc2/video/VideoCompositingLayout$Builder;
    .locals 1

    .line 2
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCompositingLayout$Builder;->canvas:Lio/agora/rtc2/video/VideoCompositingLayout$Canvas;

    iput p1, v0, Lio/agora/rtc2/video/VideoCompositingLayout$Canvas;->width:I

    iput p2, v0, Lio/agora/rtc2/video/VideoCompositingLayout$Canvas;->height:I

    return-object p0
.end method

.method public setCanvas(IILjava/lang/String;)Lio/agora/rtc2/video/VideoCompositingLayout$Builder;
    .locals 2

    .line 1
    invoke-static {p3}, Lio/agora/rtc2/video/VideoCompositingLayout;->isValidColor(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/agora/rtc2/video/VideoCompositingLayout$Builder;->canvas:Lio/agora/rtc2/video/VideoCompositingLayout$Canvas;

    iput-object p3, v0, Lio/agora/rtc2/video/VideoCompositingLayout$Canvas;->bgColor:Ljava/lang/String;

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "unknown color "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, ", using default bgColor"

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    const-string v0, "VideoCompositingLayout"

    invoke-static {v0, p3}, Lio/agora/utils2/internal/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    invoke-virtual {p0, p1, p2}, Lio/agora/rtc2/video/VideoCompositingLayout$Builder;->setCanvas(II)Lio/agora/rtc2/video/VideoCompositingLayout$Builder;

    move-result-object p0

    return-object p0
.end method

.method public updateAppData(Ljava/lang/String;)Lio/agora/rtc2/video/VideoCompositingLayout$Builder;
    .locals 0

    iput-object p1, p0, Lio/agora/rtc2/video/VideoCompositingLayout$Builder;->appData:Ljava/lang/String;

    return-object p0
.end method
