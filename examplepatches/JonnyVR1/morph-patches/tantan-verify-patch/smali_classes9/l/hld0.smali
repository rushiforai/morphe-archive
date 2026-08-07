.class public final synthetic Ll/hld0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/zld0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;


# direct methods
.method public synthetic constructor <init>(Ll/zld0;Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hld0;->a:Ll/zld0;

    iput-object p2, p0, Ll/hld0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hld0;->a:Ll/zld0;

    iget-object p0, p0, Ll/hld0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Ll/zld0;->c4(Ll/zld0;Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;Ljava/util/List;)V

    return-void
.end method
