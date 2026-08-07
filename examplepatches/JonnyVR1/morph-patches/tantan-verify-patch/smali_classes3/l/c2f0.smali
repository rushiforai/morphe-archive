.class public final synthetic Ll/c2f0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/download/DownloadTask;

.field public final synthetic b:Lrx/AsyncEmitter;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/ui/download/DownloadTask;Lrx/AsyncEmitter;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c2f0;->a:Lcom/p1/mobile/putong/ui/download/DownloadTask;

    iput-object p2, p0, Ll/c2f0;->b:Lrx/AsyncEmitter;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/c2f0;->a:Lcom/p1/mobile/putong/ui/download/DownloadTask;

    iget-object p0, p0, Ll/c2f0;->b:Lrx/AsyncEmitter;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->s(Lcom/p1/mobile/putong/ui/download/DownloadTask;Lrx/AsyncEmitter;)V

    return-void
.end method
