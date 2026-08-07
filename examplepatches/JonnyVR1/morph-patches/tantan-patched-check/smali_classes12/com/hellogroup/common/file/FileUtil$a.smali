.class Lcom/hellogroup/common/file/FileUtil$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/MediaScannerConnection$MediaScannerConnectionClient;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/common/file/FileUtil;->s(Landroid/content/Context;ILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/hellogroup/common/file/FileUtil$a;->a:I

    .line 2
    .line 3
    iput-object p2, p0, Lcom/hellogroup/common/file/FileUtil$a;->b:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onMediaScannerConnected()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/hellogroup/common/file/FileUtil$a;->a:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v1, v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/hellogroup/common/file/FileUtil$a;->b:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/hellogroup/common/file/FileUtil;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 v1, 0x2

    .line 14
    if-ne v1, v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Lcom/hellogroup/common/file/FileUtil$a;->b:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/hellogroup/common/file/FileUtil;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    goto :goto_0

    .line 23
    :cond_1
    const-string v0, ""

    .line 24
    .line 25
    :goto_0
    :try_start_0
    invoke-static {}, Lcom/hellogroup/common/file/FileUtil;->c()Landroid/media/MediaScannerConnection;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iget-object p0, p0, Lcom/hellogroup/common/file/FileUtil$a;->b:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v1, p0, v0}, Landroid/media/MediaScannerConnection;->scanFile(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    .line 33
    .line 34
    :catch_0
    return-void
.end method

.method public onScanCompleted(Ljava/lang/String;Landroid/net/Uri;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/hellogroup/common/file/FileUtil;->c()Landroid/media/MediaScannerConnection;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/media/MediaScannerConnection;->disconnect()V

    .line 6
    .line 7
    .line 8
    return-void
.end method
