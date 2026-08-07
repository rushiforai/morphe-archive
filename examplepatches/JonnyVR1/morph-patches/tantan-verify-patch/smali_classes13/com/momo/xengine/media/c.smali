.class public final synthetic Lcom/momo/xengine/media/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xengine/media/VideoFrameExtractorImpl;

.field public final synthetic b:Lcom/momo/xengine/media/IVideoFrameExtractor$ExtractorFrameCallback;

.field public final synthetic c:J


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xengine/media/VideoFrameExtractorImpl;Lcom/momo/xengine/media/IVideoFrameExtractor$ExtractorFrameCallback;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/xengine/media/c;->a:Lcom/momo/xengine/media/VideoFrameExtractorImpl;

    iput-object p2, p0, Lcom/momo/xengine/media/c;->b:Lcom/momo/xengine/media/IVideoFrameExtractor$ExtractorFrameCallback;

    iput-wide p3, p0, Lcom/momo/xengine/media/c;->c:J

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/xengine/media/c;->a:Lcom/momo/xengine/media/VideoFrameExtractorImpl;

    iget-object v1, p0, Lcom/momo/xengine/media/c;->b:Lcom/momo/xengine/media/IVideoFrameExtractor$ExtractorFrameCallback;

    iget-wide v2, p0, Lcom/momo/xengine/media/c;->c:J

    invoke-static {v0, v1, v2, v3}, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->c(Lcom/momo/xengine/media/VideoFrameExtractorImpl;Lcom/momo/xengine/media/IVideoFrameExtractor$ExtractorFrameCallback;J)V

    return-void
.end method
