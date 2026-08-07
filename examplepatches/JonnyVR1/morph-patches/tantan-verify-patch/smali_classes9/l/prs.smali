.class public final synthetic Ll/prs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftDetail;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftDetail;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/prs;->a:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftDetail;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/prs;->a:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftDetail;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallCategory;

    invoke-static {p0, p1}, Ll/qrs;->b0(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftDetail;Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallCategory;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
