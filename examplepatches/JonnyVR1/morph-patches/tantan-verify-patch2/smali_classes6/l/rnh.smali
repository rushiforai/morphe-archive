.class public final synthetic Ll/rnh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/snh;

.field public final synthetic b:Lcom/p1/mobile/putong/ui/download/DownloadTask;

.field public final synthetic c:Lcom/p1/mobile/putong/data/Media;

.field public final synthetic d:Z

.field public final synthetic e:Lcom/p1/mobile/android/app/Act;

.field public final synthetic f:Ljava/io/File;

.field public final synthetic g:Ljava/lang/StringBuilder;


# direct methods
.method public synthetic constructor <init>(Ll/snh;Lcom/p1/mobile/putong/ui/download/DownloadTask;Lcom/p1/mobile/putong/data/Media;ZLcom/p1/mobile/android/app/Act;Ljava/io/File;Ljava/lang/StringBuilder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rnh;->a:Ll/snh;

    iput-object p2, p0, Ll/rnh;->b:Lcom/p1/mobile/putong/ui/download/DownloadTask;

    iput-object p3, p0, Ll/rnh;->c:Lcom/p1/mobile/putong/data/Media;

    iput-boolean p4, p0, Ll/rnh;->d:Z

    iput-object p5, p0, Ll/rnh;->e:Lcom/p1/mobile/android/app/Act;

    iput-object p6, p0, Ll/rnh;->f:Ljava/io/File;

    iput-object p7, p0, Ll/rnh;->g:Ljava/lang/StringBuilder;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/rnh;->a:Ll/snh;

    iget-object v1, p0, Ll/rnh;->b:Lcom/p1/mobile/putong/ui/download/DownloadTask;

    iget-object v2, p0, Ll/rnh;->c:Lcom/p1/mobile/putong/data/Media;

    iget-boolean v3, p0, Ll/rnh;->d:Z

    iget-object v4, p0, Ll/rnh;->e:Lcom/p1/mobile/android/app/Act;

    iget-object v5, p0, Ll/rnh;->f:Ljava/io/File;

    iget-object v6, p0, Ll/rnh;->g:Ljava/lang/StringBuilder;

    invoke-static/range {v0 .. v6}, Ll/snh;->d(Ll/snh;Lcom/p1/mobile/putong/ui/download/DownloadTask;Lcom/p1/mobile/putong/data/Media;ZLcom/p1/mobile/android/app/Act;Ljava/io/File;Ljava/lang/StringBuilder;)V

    return-void
.end method
