.class public final synthetic Lcom/momo/xeengine/gift/p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/gift/IResourceDownloader$Callback;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/xeengine/gift/p;->a:Ljava/lang/String;

    iput-object p2, p0, Lcom/momo/xeengine/gift/p;->b:Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;

    return-void
.end method


# virtual methods
.method public final onComplete(ZLjava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/p;->a:Ljava/lang/String;

    iget-object p0, p0, Lcom/momo/xeengine/gift/p;->b:Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;

    invoke-static {v0, p0, p1, p2}, Lcom/momo/xeengine/gift/ResourceChecker;->b(Ljava/lang/String;Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;ZLjava/lang/String;)V

    return-void
.end method
