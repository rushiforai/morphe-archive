.class public final synthetic Lcom/momo/xeengine/gift/r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/xeengine/gift/r;->a:Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/r;->a:Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;

    invoke-static {p0}, Lcom/momo/xeengine/gift/ResourceChecker;->d(Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;)V

    return-void
.end method
