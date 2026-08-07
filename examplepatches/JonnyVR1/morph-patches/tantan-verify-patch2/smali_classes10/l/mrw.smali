.class public final synthetic Ll/mrw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureItemView$a;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureListItemView;

.field public final synthetic c:I

.field public final synthetic d:Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureItemView$a;Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureListItemView;ILcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mrw;->a:Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureItemView$a;

    iput-object p2, p0, Ll/mrw;->b:Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureListItemView;

    iput p3, p0, Ll/mrw;->c:I

    iput-object p4, p0, Ll/mrw;->d:Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/mrw;->a:Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureItemView$a;

    iget-object v1, p0, Ll/mrw;->b:Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureListItemView;

    iget v2, p0, Ll/mrw;->c:I

    iget-object p0, p0, Ll/mrw;->d:Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureItemView$a;->E(Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureItemView$a;Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureListItemView;ILcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;Landroid/view/View;)V

    return-void
.end method
