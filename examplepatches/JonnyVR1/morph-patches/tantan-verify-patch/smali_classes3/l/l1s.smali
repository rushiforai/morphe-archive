.class public final synthetic Ll/l1s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ljava/io/File;

.field public final synthetic b:Ll/gcg0;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;


# direct methods
.method public synthetic constructor <init>(Ljava/io/File;Ll/gcg0;Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l1s;->a:Ljava/io/File;

    iput-object p2, p0, Ll/l1s;->b:Ll/gcg0;

    iput-object p3, p0, Ll/l1s;->c:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l1s;->a:Ljava/io/File;

    iget-object v1, p0, Ll/l1s;->b:Ll/gcg0;

    iget-object p0, p0, Ll/l1s;->c:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;

    check-cast p1, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    check-cast p2, Ljava/io/File;

    invoke-static {v0, v1, p0, p1, p2}, Ll/o1s;->f(Ljava/io/File;Ll/gcg0;Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V

    return-void
.end method
