.class public final synthetic Ll/xnl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/download/DownloadTask;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xnl;->a:Lcom/p1/mobile/putong/ui/download/DownloadTask;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xnl;->a:Lcom/p1/mobile/putong/ui/download/DownloadTask;

    check-cast p1, Landroid/net/NetworkInfo;

    invoke-static {p0, p1}, Ll/ynl;->a(Lcom/p1/mobile/putong/ui/download/DownloadTask;Landroid/net/NetworkInfo;)V

    return-void
.end method
