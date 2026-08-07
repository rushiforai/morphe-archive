.class public final synthetic Ll/fls;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/tls;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkin;


# direct methods
.method public synthetic constructor <init>(Ll/tls;Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkin;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fls;->a:Ll/tls;

    iput-object p2, p0, Ll/fls;->b:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkin;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fls;->a:Ll/tls;

    iget-object p0, p0, Ll/fls;->b:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkin;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/skin/list/LiveGiftSkinItemView;->h0(Ll/tls;Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkin;Landroid/view/View;)V

    return-void
.end method
