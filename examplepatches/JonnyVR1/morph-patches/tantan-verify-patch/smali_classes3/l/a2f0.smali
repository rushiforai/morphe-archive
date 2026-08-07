.class public final synthetic Ll/a2f0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Lrx/AsyncEmitter;


# direct methods
.method public synthetic constructor <init>(Lrx/AsyncEmitter;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a2f0;->a:Lrx/AsyncEmitter;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a2f0;->a:Lrx/AsyncEmitter;

    check-cast p1, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    check-cast p2, Ljava/io/File;

    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->r(Lrx/AsyncEmitter;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V

    return-void
.end method
