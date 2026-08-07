.class public final synthetic Ll/jtj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;

.field public final synthetic b:Ll/bwj;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

.field public final synthetic d:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;Ll/bwj;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jtj;->a:Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;

    iput-object p2, p0, Ll/jtj;->b:Ll/bwj;

    iput-object p3, p0, Ll/jtj;->c:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    iput-object p4, p0, Ll/jtj;->d:Ll/x20;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jtj;->a:Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;

    iget-object v1, p0, Ll/jtj;->b:Ll/bwj;

    iget-object v2, p0, Ll/jtj;->c:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    iget-object p0, p0, Ll/jtj;->d:Ll/x20;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->O(Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;Ll/bwj;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/x20;Landroid/view/View;)V

    return-void
.end method
