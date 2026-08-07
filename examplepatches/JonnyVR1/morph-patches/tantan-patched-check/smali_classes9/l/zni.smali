.class public final synthetic Ll/zni;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/gcg0;

.field public final synthetic d:Ljava/io/File;

.field public final synthetic e:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Ll/gcg0;Ljava/io/File;Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zni;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/zni;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/zni;->c:Ll/gcg0;

    iput-object p4, p0, Ll/zni;->d:Ljava/io/File;

    iput-object p5, p0, Ll/zni;->e:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/zni;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/zni;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/zni;->c:Ll/gcg0;

    iget-object v3, p0, Ll/zni;->d:Ljava/io/File;

    iget-object v4, p0, Ll/zni;->e:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    move-object v6, p2

    check-cast v6, Ljava/io/File;

    invoke-static/range {v0 .. v6}, Ll/coi;->b(Ljava/lang/String;Ljava/lang/String;Ll/gcg0;Ljava/io/File;Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V

    return-void
.end method
