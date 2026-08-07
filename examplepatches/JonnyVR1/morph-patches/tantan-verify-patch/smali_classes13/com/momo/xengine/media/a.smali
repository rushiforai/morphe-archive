.class public final synthetic Lcom/momo/xengine/media/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xengine/media/VideoFrameExtractorImpl;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Lcom/momo/xengine/media/IVideoFrameExtractor$ExtractorFramesCallback;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xengine/media/VideoFrameExtractorImpl;Ljava/util/List;Lcom/momo/xengine/media/IVideoFrameExtractor$ExtractorFramesCallback;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/xengine/media/a;->a:Lcom/momo/xengine/media/VideoFrameExtractorImpl;

    iput-object p2, p0, Lcom/momo/xengine/media/a;->b:Ljava/util/List;

    iput-object p3, p0, Lcom/momo/xengine/media/a;->c:Lcom/momo/xengine/media/IVideoFrameExtractor$ExtractorFramesCallback;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xengine/media/a;->a:Lcom/momo/xengine/media/VideoFrameExtractorImpl;

    iget-object v1, p0, Lcom/momo/xengine/media/a;->b:Ljava/util/List;

    iget-object p0, p0, Lcom/momo/xengine/media/a;->c:Lcom/momo/xengine/media/IVideoFrameExtractor$ExtractorFramesCallback;

    invoke-static {v0, v1, p0}, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->a(Lcom/momo/xengine/media/VideoFrameExtractorImpl;Ljava/util/List;Lcom/momo/xengine/media/IVideoFrameExtractor$ExtractorFramesCallback;)V

    return-void
.end method
