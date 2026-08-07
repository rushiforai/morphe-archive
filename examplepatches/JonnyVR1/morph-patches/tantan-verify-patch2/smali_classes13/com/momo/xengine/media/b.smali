.class public final synthetic Lcom/momo/xengine/media/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xengine/media/VideoFrameExtractorImpl;

.field public final synthetic b:Landroid/util/Size;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xengine/media/VideoFrameExtractorImpl;Landroid/util/Size;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/xengine/media/b;->a:Lcom/momo/xengine/media/VideoFrameExtractorImpl;

    iput-object p2, p0, Lcom/momo/xengine/media/b;->b:Landroid/util/Size;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/xengine/media/b;->a:Lcom/momo/xengine/media/VideoFrameExtractorImpl;

    iget-object p0, p0, Lcom/momo/xengine/media/b;->b:Landroid/util/Size;

    invoke-static {v0, p0}, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->b(Lcom/momo/xengine/media/VideoFrameExtractorImpl;Landroid/util/Size;)V

    return-void
.end method
