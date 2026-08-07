.class public final synthetic Ll/srw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ljava/io/File;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveMagic;

.field public final synthetic c:Ll/gcg0;


# direct methods
.method public synthetic constructor <init>(Ljava/io/File;Lcom/p1/mobile/putong/live/base/data/BLiveMagic;Ll/gcg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/srw;->a:Ljava/io/File;

    iput-object p2, p0, Ll/srw;->b:Lcom/p1/mobile/putong/live/base/data/BLiveMagic;

    iput-object p3, p0, Ll/srw;->c:Ll/gcg0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/srw;->a:Ljava/io/File;

    iget-object v1, p0, Ll/srw;->b:Lcom/p1/mobile/putong/live/base/data/BLiveMagic;

    iget-object p0, p0, Ll/srw;->c:Ll/gcg0;

    check-cast p1, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    check-cast p2, Ljava/io/File;

    invoke-static {v0, v1, p0, p1, p2}, Ll/zrw;->e(Ljava/io/File;Lcom/p1/mobile/putong/live/base/data/BLiveMagic;Ll/gcg0;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V

    return-void
.end method
