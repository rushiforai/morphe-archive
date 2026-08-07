.class public Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$c;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->R0(ZI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$c;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$c;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->y0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$c;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->r0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$c;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 13
    .line 14
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->o0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    invoke-static {p1, p0}, Ll/muj;->B(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;I)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
