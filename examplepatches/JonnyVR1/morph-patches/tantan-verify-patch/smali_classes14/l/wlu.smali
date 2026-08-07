.class public final synthetic Ll/wlu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/gears/LiveVChatGiftGearsFlyView;

.field public final synthetic b:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/gears/LiveVChatGiftGearsFlyView;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wlu;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/gears/LiveVChatGiftGearsFlyView;

    iput-object p2, p0, Ll/wlu;->b:Ll/x20;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wlu;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/gears/LiveVChatGiftGearsFlyView;

    iget-object p0, p0, Ll/wlu;->b:Ll/x20;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/gears/LiveVChatGiftGearsFlyView;->a(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/gears/LiveVChatGiftGearsFlyView;Ll/x20;Landroid/animation/ValueAnimator;)V

    return-void
.end method
