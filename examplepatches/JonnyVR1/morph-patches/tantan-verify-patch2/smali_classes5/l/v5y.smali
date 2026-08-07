.class public final synthetic Ll/v5y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/media/ttmediautils/download/Action2;


# instance fields
.field public final synthetic a:Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;

.field public final synthetic b:Ljava/io/File;


# direct methods
.method public synthetic constructor <init>(Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v5y;->a:Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;

    iput-object p2, p0, Ll/v5y;->b:Ljava/io/File;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v5y;->a:Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;

    iget-object p0, p0, Ll/v5y;->b:Ljava/io/File;

    check-cast p1, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;

    check-cast p2, Ljava/io/File;

    invoke-static {v0, p0, p1, p2}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->c(Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;Ljava/io/File;Lcom/tantanapp/media/ttmediautils/download/DownloadTask;Ljava/io/File;)V

    return-void
.end method
