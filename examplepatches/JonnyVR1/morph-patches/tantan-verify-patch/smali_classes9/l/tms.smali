.class public final synthetic Ll/tms;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tms;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter;

    iput-object p2, p0, Ll/tms;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tms;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter;

    iget-object p0, p0, Ll/tms;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter;->U3(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    return-void
.end method
