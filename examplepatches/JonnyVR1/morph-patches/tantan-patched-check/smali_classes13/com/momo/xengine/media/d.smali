.class public final synthetic Lcom/momo/xengine/media/d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xengine/media/VideoFrameExtractorImpl;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xengine/media/VideoFrameExtractorImpl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/xengine/media/d;->a:Lcom/momo/xengine/media/VideoFrameExtractorImpl;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/d;->a:Lcom/momo/xengine/media/VideoFrameExtractorImpl;

    invoke-static {p0}, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->d(Lcom/momo/xengine/media/VideoFrameExtractorImpl;)V

    return-void
.end method
