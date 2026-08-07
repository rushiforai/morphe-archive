.class public Lcom/p1/mobile/putong/core/newui/home/VipUndoTip$a;
.super Ll/gt0$j;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->onVisibilityChanged(Landroid/view/View;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip$a;->a:Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/gt0$j;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip$a;->a:Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->c(Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip$a;->a:Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;

    .line 11
    .line 12
    const/high16 v0, 0x3f800000    # 1.0f

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip$a;->a:Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleX(F)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip$a;->a:Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/view/View;->setScaleY(F)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
