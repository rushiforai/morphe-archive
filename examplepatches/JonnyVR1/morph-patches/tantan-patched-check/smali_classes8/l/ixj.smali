.class public final synthetic Ll/ixj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/lxj;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Ll/lxj;Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ixj;->a:Ll/lxj;

    iput-object p2, p0, Ll/ixj;->b:Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;

    iput-object p3, p0, Ll/ixj;->c:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    iput p4, p0, Ll/ixj;->d:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ixj;->a:Ll/lxj;

    iget-object v1, p0, Ll/ixj;->b:Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;

    iget-object v2, p0, Ll/ixj;->c:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    iget p0, p0, Ll/ixj;->d:I

    invoke-static {v0, v1, v2, p0, p1}, Ll/lxj;->E(Ll/lxj;Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;ILandroid/view/View;)V

    return-void
.end method
