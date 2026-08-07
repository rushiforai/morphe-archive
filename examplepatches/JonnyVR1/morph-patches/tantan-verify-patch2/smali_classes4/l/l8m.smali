.class public final synthetic Ll/l8m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l8m;->a:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;

    iput-object p2, p0, Ll/l8m;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/l8m;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l8m;->a:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;

    iget-object v1, p0, Ll/l8m;->b:Ljava/lang/String;

    iget-boolean p0, p0, Ll/l8m;->c:Z

    check-cast p1, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    check-cast p2, Ljava/lang/Throwable;

    invoke-static {v0, v1, p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;->X1(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;Ljava/lang/String;ZLcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/Throwable;)V

    return-void
.end method
