.class public final synthetic Ll/bp8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/download/DownloadTask;

.field public final synthetic b:Ljava/lang/StringBuilder;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/StringBuilder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bp8;->a:Lcom/p1/mobile/putong/ui/download/DownloadTask;

    iput-object p2, p0, Ll/bp8;->b:Ljava/lang/StringBuilder;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bp8;->a:Lcom/p1/mobile/putong/ui/download/DownloadTask;

    iget-object p0, p0, Ll/bp8;->b:Ljava/lang/StringBuilder;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->g0(Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/StringBuilder;)V

    return-void
.end method
