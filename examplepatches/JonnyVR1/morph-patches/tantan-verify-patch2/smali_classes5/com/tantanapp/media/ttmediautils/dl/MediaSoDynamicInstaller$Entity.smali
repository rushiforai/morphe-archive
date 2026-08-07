.class Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$Entity;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Entity"
.end annotation


# instance fields
.field public needUnzip:Z

.field public rootFolder:Ljava/io/File;

.field public zipFile:Ljava/io/File;


# direct methods
.method public constructor <init>(Ljava/io/File;Ljava/io/File;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$Entity;->zipFile:Ljava/io/File;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$Entity;->rootFolder:Ljava/io/File;

    .line 7
    .line 8
    iput-boolean p3, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$Entity;->needUnzip:Z

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Z)V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$Entity;->zipFile:Ljava/io/File;

    .line 13
    iput-boolean p2, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$Entity;->needUnzip:Z

    return-void
.end method
