.class public final synthetic Ll/w5y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/media/ttmediautils/download/Action2;


# instance fields
.field public final synthetic a:Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;


# direct methods
.method public synthetic constructor <init>(Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w5y;->a:Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w5y;->a:Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;

    check-cast p1, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;

    check-cast p2, Ljava/lang/Integer;

    invoke-static {p0, p1, p2}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->a(Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;Lcom/tantanapp/media/ttmediautils/download/DownloadTask;Ljava/lang/Integer;)V

    return-void
.end method
