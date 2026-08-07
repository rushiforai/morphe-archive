.class public final synthetic Lcom/momo/xeengine/gift/q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/xeengine/gift/q;->a:Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;

    iput-boolean p2, p0, Lcom/momo/xeengine/gift/q;->b:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/q;->a:Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;

    iget-boolean p0, p0, Lcom/momo/xeengine/gift/q;->b:Z

    invoke-static {v0, p0}, Lcom/momo/xeengine/gift/ResourceChecker;->a(Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;Z)V

    return-void
.end method
