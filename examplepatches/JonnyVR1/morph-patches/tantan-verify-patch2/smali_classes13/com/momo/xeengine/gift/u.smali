.class public final synthetic Lcom/momo/xeengine/gift/u;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/gift/ResourceDownloaderImpl;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/io/File;

.field public final synthetic d:Lcom/momo/xeengine/gift/IResourceDownloader$Callback;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/gift/ResourceDownloaderImpl;Ljava/lang/String;Ljava/io/File;Lcom/momo/xeengine/gift/IResourceDownloader$Callback;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/xeengine/gift/u;->a:Lcom/momo/xeengine/gift/ResourceDownloaderImpl;

    iput-object p2, p0, Lcom/momo/xeengine/gift/u;->b:Ljava/lang/String;

    iput-object p3, p0, Lcom/momo/xeengine/gift/u;->c:Ljava/io/File;

    iput-object p4, p0, Lcom/momo/xeengine/gift/u;->d:Lcom/momo/xeengine/gift/IResourceDownloader$Callback;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/u;->a:Lcom/momo/xeengine/gift/ResourceDownloaderImpl;

    iget-object v1, p0, Lcom/momo/xeengine/gift/u;->b:Ljava/lang/String;

    iget-object v2, p0, Lcom/momo/xeengine/gift/u;->c:Ljava/io/File;

    iget-object p0, p0, Lcom/momo/xeengine/gift/u;->d:Lcom/momo/xeengine/gift/IResourceDownloader$Callback;

    invoke-static {v0, v1, v2, p0}, Lcom/momo/xeengine/gift/ResourceDownloaderImpl;->a(Lcom/momo/xeengine/gift/ResourceDownloaderImpl;Ljava/lang/String;Ljava/io/File;Lcom/momo/xeengine/gift/IResourceDownloader$Callback;)V

    return-void
.end method
