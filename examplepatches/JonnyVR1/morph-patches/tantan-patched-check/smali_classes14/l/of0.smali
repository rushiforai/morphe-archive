.class public final synthetic Ll/of0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Lcom/p1/mobile/putong/ui/download/DownloadTask;


# direct methods
.method public synthetic constructor <init>(Ll/y20;Lcom/p1/mobile/putong/ui/download/DownloadTask;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/of0;->a:Ll/y20;

    iput-object p2, p0, Ll/of0;->b:Lcom/p1/mobile/putong/ui/download/DownloadTask;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/of0;->a:Ll/y20;

    iget-object p0, p0, Ll/of0;->b:Lcom/p1/mobile/putong/ui/download/DownloadTask;

    invoke-static {v0, p0}, Ll/yf0;->e(Ll/y20;Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    return-void
.end method
