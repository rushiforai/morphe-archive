.class public final Lcom/p1/mobile/putong/core/ui/purchase/mediator/d$c;
.super Lcom/tantan/library/svga/AnimListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;->Z()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u000f\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0003\u0010\u0004\u00a8\u0006\u0005"
    }
    d2 = {
        "com/p1/mobile/putong/core/ui/purchase/mediator/d$c",
        "Lcom/tantan/library/svga/AnimListener;",
        "",
        "onFinished",
        "()V",
        "pay_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/d$c;->a:Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/tantan/library/svga/AnimListener;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onFinished()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tantan/library/svga/AnimListener;->onFinished()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/d$c;->a:Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;->U()Lcom/tantan/library/svga/SVGAnimationView;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/d$c;->a:Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;->T()Lcom/tantan/library/svga/SVGAnimationView;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/d$c;->a:Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;->U()Lcom/tantan/library/svga/SVGAnimationView;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Lcom/tantan/library/svga/SVGAnimationView;->startAnimation()V

    .line 31
    .line 32
    .line 33
    return-void
.end method
