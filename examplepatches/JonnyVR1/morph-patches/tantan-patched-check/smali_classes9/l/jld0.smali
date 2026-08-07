.class public final synthetic Ll/jld0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/zld0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;


# direct methods
.method public synthetic constructor <init>(Ll/zld0;Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jld0;->a:Ll/zld0;

    iput-object p2, p0, Ll/jld0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jld0;->a:Ll/zld0;

    iget-object p0, p0, Ll/jld0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    invoke-static {v0, p0}, Ll/zld0;->W3(Ll/zld0;Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V

    return-void
.end method
