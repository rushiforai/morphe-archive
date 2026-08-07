.class public final synthetic Ll/k8m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;

.field public final synthetic b:Ljava/io/File;

.field public final synthetic c:Lcom/p1/mobile/putong/data/Media;

.field public final synthetic d:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;Ljava/io/File;Lcom/p1/mobile/putong/data/Media;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k8m;->a:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;

    iput-object p2, p0, Ll/k8m;->b:Ljava/io/File;

    iput-object p3, p0, Ll/k8m;->c:Lcom/p1/mobile/putong/data/Media;

    iput-object p4, p0, Ll/k8m;->d:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/k8m;->a:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;

    iget-object v1, p0, Ll/k8m;->b:Ljava/io/File;

    iget-object v2, p0, Ll/k8m;->c:Lcom/p1/mobile/putong/data/Media;

    iget-object v3, p0, Ll/k8m;->d:Ll/x20;

    move-object v4, p1

    check-cast v4, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    move-object v5, p2

    check-cast v5, Ljava/io/File;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;->Z1(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;Ljava/io/File;Lcom/p1/mobile/putong/data/Media;Ll/x20;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V

    return-void
.end method
