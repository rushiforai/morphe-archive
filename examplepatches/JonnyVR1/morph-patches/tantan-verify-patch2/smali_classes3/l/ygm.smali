.class public final synthetic Ll/ygm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/bqq;

.field public final synthetic b:Lcom/p1/mobile/putong/ui/download/DownloadTask;

.field public final synthetic c:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/bqq;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ygm;->a:Ll/bqq;

    iput-object p2, p0, Ll/ygm;->b:Lcom/p1/mobile/putong/ui/download/DownloadTask;

    iput-object p3, p0, Ll/ygm;->c:Ll/y20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ygm;->a:Ll/bqq;

    iget-object v1, p0, Ll/ygm;->b:Lcom/p1/mobile/putong/ui/download/DownloadTask;

    iget-object p0, p0, Ll/ygm;->c:Ll/y20;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->d(Ll/bqq;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ll/y20;)V

    return-void
.end method
