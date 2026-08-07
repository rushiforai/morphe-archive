.class public final synthetic Ll/ryj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ezj;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;


# direct methods
.method public synthetic constructor <init>(Ll/ezj;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ryj;->a:Ll/ezj;

    iput-object p2, p0, Ll/ryj;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ryj;->a:Ll/ezj;

    iget-object p0, p0, Ll/ryj;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/suit/view/GiftSuitItemView;->a(Ll/ezj;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Landroid/view/View;)V

    return-void
.end method
