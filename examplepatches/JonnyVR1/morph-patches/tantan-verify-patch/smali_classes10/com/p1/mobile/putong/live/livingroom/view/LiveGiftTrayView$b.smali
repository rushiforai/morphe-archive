.class public Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->T0()V
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
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$b;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

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
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$b;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->u0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$b;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->s0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$b;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->p0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)Ll/y20;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$b;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 21
    .line 22
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->p0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)Ll/y20;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$b;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 27
    .line 28
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->r0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-interface {p1, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$b;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 36
    .line 37
    const/4 p1, 0x0

    .line 38
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->t0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;Ll/y20;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$b;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->v0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$b;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 7
    .line 8
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->r0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0}, Ll/muj;->C(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
