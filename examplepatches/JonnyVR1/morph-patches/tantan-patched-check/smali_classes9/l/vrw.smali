.class public final synthetic Ll/vrw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;

.field public final synthetic b:Ll/gcg0;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;Ll/gcg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vrw;->a:Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;

    iput-object p2, p0, Ll/vrw;->b:Ll/gcg0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vrw;->a:Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;

    iget-object p0, p0, Ll/vrw;->b:Ll/gcg0;

    check-cast p1, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    check-cast p2, Ljava/io/File;

    invoke-static {v0, p0, p1, p2}, Ll/zrw;->f(Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;Ll/gcg0;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V

    return-void
.end method
